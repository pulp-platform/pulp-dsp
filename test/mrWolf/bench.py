#! /usr/bin/python3

import os
import re
import argparse
from collections import namedtuple

def main():
    """ Main Function """
    parser = argparse.ArgumentParser(prog='bench',
                                     description='Show / compare previous benchmark result')
    subparsers = parser.add_subparsers(dest='command')
    parser_view = subparsers.add_parser('view', help='View a single bench file')
    parser_view.add_argument('-b', '--bench-file', type=str, help='Benchmark CSV file to be read. If unspecified, take the most recent.')
    parser_view.add_argument('-f', '--function', type=str, help='Regex to only show the specified function.')
    parser_view.add_argument('-d', '--device', type=str, help='Filter to only show the given device')

    parser_cmp = subparsers.add_parser('compare', help='Compare multiple bench files')
    parser_cmp.add_argument('-n', '--new-bench-file', type=str, help='Benchmark CSV file to be read. If unspecified, take the most recent.')
    parser_cmp.add_argument('-o', '--old-bench-file', type=str, help='Benchmark CSV file to compare to.', required=True)
    parser_cmp.add_argument('-f', '--function', type=str, help='Regex to only show the specified function')
    parser_cmp.add_argument('-d', '--device', type=str, help='Filter to only show the given device')

    args = parser.parse_args()

    if args.command == 'view':
        view(args)
    elif args.command == "compare":
        compare(args)


def view(args):
    """ View subcommand """
    if args.bench_file is None:
        bench_file = get_most_recent_bench_filename()
    else:
        bench_file = args.bench_file

    # read runs
    runs = read_bench(bench_file)
    # filter runs
    runs = filter_runs(runs, args.function, args.device)
    # print remaining runs
    print_runs(runs)


def compare(args):
    """ Compare subcommand """
    if args.new_bench_file is None:
        new_bench_file = get_most_recent_bench_filename()
    else:
        new_bench_file = args.new_bench_file

    old_bench_file = args.old_bench_file

    # read the runs
    new_runs = read_bench(new_bench_file)
    old_runs = read_bench(old_bench_file)

    # filter
    new_runs = filter_runs(new_runs, args.function, args.device)
    old_runs = filter_runs(old_runs, args.function, args.device)

    # compare and match
    new_runs, old_runs = match_two_runs(new_runs, old_runs)

    # print comparison
    print_comparison(new_runs, old_runs)


def get_most_recent_bench_filename():
    """ search for the most recent bench file in the location of this file, matching bench_*.csv """
    bench_re = re.compile("^bench_.*\.csv$")
    cwd = os.path.dirname(os.path.realpath(__file__))
    bench_files = [f for f in os.listdir(cwd) if bench_re.search(f)]
    bench_files = sorted(bench_files, reverse=True)
    return bench_files[0]


HEADER = ["name", "device", "dimension", "cycles", "instructions", "ipc", "imiss", "ld_stall",
          "tcdm_cont", "ops", "mpc"]
Run = namedtuple("Run", HEADER)


def read_bench(bench_file):
    """ Reads a bench file and returns a sorted list of runs """
    with open(bench_file, "r") as f:
        # check the first line
        lines = iter(f.readlines())
        header = next(lines).strip().split(",")
        assert(header == HEADER)
        runs = [run_from_csv_line(line) for line in lines]
    # sort the runs
    runs = sorted(runs, key=run_sort_key)
    return runs


def run_sort_key(run):
    return "{}{}{}".format(run.device, run.name, run.dimension)


def filter_runs(runs, function, device):
    """ returns a list of runs that only contain runs matching with function and device """
    function_re = re.compile(function) if function else re.compile(".*")
    device_re = re.compile(device) if device else re.compile(".*")
    return [r for r in runs if function_re.search(r.name) and device_re.search(r.device)]


def match_two_runs(runs_a, runs_b):
    """ returns tuple (runs_a, runs_b), where both each element of runs_a corresponds to runs_b """
    iter_a = iter(runs_a)
    iter_b = iter(runs_b)

    new_a = []
    new_b = []

    try:
        a_run = next(iter_a)
        b_run = next(iter_b)
        while True:
            a_key = run_sort_key(a_run)
            b_key = run_sort_key(b_run)
            if a_key == b_key:
                new_a.append(a_run)
                new_b.append(b_run)
                a_run = next(iter_a)
                b_run = next(iter_b)
            elif a_key < b_key:
                a_run = next(iter_a)
            else:
                b_run = next(iter_b)
    except StopIteration:
        pass

    return new_a, new_b


TABLE_HEADER = ["function", "device", "dimension", "cycles", "insn", "i/c", "imiss", "ld_stall",
                "tcdm_cont", "ops", "ops/c"]
TABLE_HEADER_COMP = ["function", "device", "dimension", "cycles", "", "insn", "", "i/c", "",
                     "imiss", "", "ld_stall", "", "tcdm_cont", "", "ops", "", "ops/c", ""]


def print_runs(runs):
    """ print runs in a nice table """
    runs_str = [format_run_to_str_list(r) for r in runs]
    column_width = tuple(get_column_width(runs_str, c, h) for c, h in enumerate(TABLE_HEADER))
    hline = horizontal_line(column_width)
    print(hline)
    print(format_run_to_line(TABLE_HEADER, column_width))
    print(hline)
    for run_str in runs_str:
        print(format_run_to_line(run_str, column_width))
    print(hline)


def print_comparison(new_runs, old_runs):
    """ print comparison of runs """
    assert len(new_runs) == len(old_runs)
    runs_str = [format_comparison_to_str_list(r_new, r_old)
                for r_new, r_old in zip(new_runs, old_runs)]
    column_width_19 = [get_column_width_ignore_header(runs_str, c)
                       for c in range(len(TABLE_HEADER_COMP))]
    # the length of the first three columns must be altered
    column_width_19[0:3] = [max(column_width_19[i], len(TABLE_HEADER_COMP[i])) for i in range(3)]
    # adjust the length of the absolut columns, if they don't match the width of the title row
    for i in [3, 5, 7, 9, 11, 13, 15, 17]:
        column_width_19[i] = max(column_width_19[i], len(TABLE_HEADER_COMP[i]) - column_width_19[i+1])
    column_width_19 = tuple(column_width_19)
    column_width_11 = (column_width_19[0],
                       column_width_19[1],
                       column_width_19[2],
                       max(column_width_19[3] + column_width_19[4], len(TABLE_HEADER_COMP[3])),
                       max(column_width_19[5] + column_width_19[6], len(TABLE_HEADER_COMP[5])),
                       max(column_width_19[7] + column_width_19[8], len(TABLE_HEADER_COMP[7])),
                       max(column_width_19[9] + column_width_19[10], len(TABLE_HEADER_COMP[9])),
                       max(column_width_19[11] + column_width_19[12], len(TABLE_HEADER_COMP[11])),
                       max(column_width_19[13] + column_width_19[14], len(TABLE_HEADER_COMP[13])),
                       max(column_width_19[15] + column_width_19[16], len(TABLE_HEADER_COMP[15])),
                       max(column_width_19[17] + column_width_19[18], len(TABLE_HEADER_COMP[17])))
    hline = horizontal_line(column_width_11)
    print(hline)
    print(format_run_to_line(TABLE_HEADER, column_width_11))
    print(hline)
    for run_str in runs_str:
        print(format_comparison_to_line(run_str, column_width_19))
    print(hline)


def get_column_width(runs_str, idx, header):
    """ returns the maximum width of the given column """
    return max(max([len(r[idx]) for r in runs_str]), len(header))


def get_column_width_ignore_header(runs_str, idx):
    """ returns the maximum width of the given column """
    return max([len(r[idx]) for r in runs_str])


def run_from_csv_line(line):
    """ parse csv line and return Run (namedtuple) """
    line = line.strip()
    parts = line.split(",")
    return Run(name=parts[0],
               device=parts[1].strip(),
               dimension=parts[2].strip(),
               cycles=int(parts[3].strip()),
               instructions=int(parts[4].strip()),
               ipc=float(parts[5].strip()),
               imiss=int(parts[6].strip()),
               ld_stall=int(parts[7].strip()),
               tcdm_cont=int(parts[8].strip()),
               ops=int(parts[9].strip()),
               mpc=float(parts[10].strip()))


def format_run_to_str_list(run):
    """ returns a list of 11 strings """
    return [run.name,
            run.device,
            run.dimension,
            str(run.cycles),
            str(run.instructions),
            format_float(run.ipc),
            str(run.imiss),
            str(run.ld_stall),
            str(run.tcdm_cont),
            str(run.ops),
            format_float(run.mpc)]


def format_comparison_to_str_list(new_run, old_run):
    """ Returns a list of 19 strings """
    return [new_run.name,
            new_run.device,
            new_run.dimension,
            str(new_run.cycles),
            format_diff_int(new_run.cycles, old_run.cycles),
            str(new_run.instructions),
            format_diff_int(new_run.instructions, old_run.instructions),
            format_float(new_run.ipc),
            format_diff_float(new_run.ipc, old_run.ipc),
            str(new_run.imiss),
            format_diff_int(new_run.imiss, old_run.imiss),
            str(new_run.ld_stall),
            format_diff_int(new_run.ld_stall, old_run.ld_stall),
            str(new_run.tcdm_cont),
            format_diff_int(new_run.tcdm_cont, old_run.tcdm_cont),
            str(new_run.ops),
            format_diff_int(new_run.ops, old_run.ops),
            format_float(new_run.mpc),
            format_diff_float(new_run.mpc, old_run.mpc)]


def format_run_to_line(run_str, column_width):
    """ returns a string containing one line with the run """
    fmt = "| {:<%d} | {:<%d} | {:<%d} | {:>%d} | {:>%d} | {:>%d} | {:>%d} | {:>%d} | {:>%d} | {:>%d} | {:>%d} |" % column_width
    return fmt.format(*run_str)


def format_comparison_to_line(run_str, column_width):
    """ returns a string containing one line with the comparison """
    fmt = "| {:<%d} | {:<%d} | {:<%d} | {:>%d}{:<%d} | {:>%d}{:<%d} | {:>%d}{:<%d} | {:>%d}{:<%d} | {:>%d}{:<%d} | {:>%d}{:<%d} | {:>%d}{:<%d} | {:>%d}{:<%d} |" % column_width
    return fmt.format(*run_str)


def horizontal_line(column_width):
    """ returns a string containing a horizontal line of the given width """
    return "+-" + "-+-".join(["-" * c for c in column_width]) + "-+"


def format_float(f, precision=3):
    """ returns float as a string with given precision """
    fmt = "{:.%df}" % precision
    return fmt.format(f)


def format_diff_float(new, old, precision=3):
    """ returns difference as a string with given precision """
    diff = abs(new - old)
    sign = "+" if new >= old else "-"
    fmt = " {} {:.%df}" % precision
    return fmt.format(sign, diff)


def format_diff_int(new, old):
    """ returns difference as a string """
    diff = abs(new - old)
    sign = "+" if new >= old else "-"
    return " {} {}".format(sign, diff)

if __name__ == '__main__':
    main()
