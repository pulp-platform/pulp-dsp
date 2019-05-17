import sys
import csv

start_token = 'Performance_counter';
start_found = 0

log_file = open(sys.argv[1])

perf_dict = dict()

while True:

   line = log_file.readline()
   line_split=line.split()
#   if len(line_split) == 0 and start_found == 1:
#      break;
   if len(line_split) == 0:# and start_found == 0:
      line = log_file.readline()
      line_split=line.split()
      if len(line_split) == 0:
         break
   if line_split[0]==start_token and start_found == 0:
      start_found=1
      print("start found\n")
   if start_found == 0:
      continue;
   if start_found == 1 and line_split[0]=='count':
      if line_split[1] in perf_dict:
#         print("key exists\n")
         perf_dict[line_split[1]].append(int(line_split[3]))
#         print(perf_dict)
      else:
#         print("key doesn't exists\n")
         perf_dict[line_split[1]] = [int(line_split[3])]

#print(perf_dict)

keys = sorted(perf_dict.keys())
with open(sys.argv[1][:-4]+".csv", "w") as outfile:
   writer = csv.writer(outfile, delimiter = "\t")
   writer.writerow(list(keys))#(list(perf_dict.keys()))
   writer.writerows(zip(*[perf_dict[key] for key in keys]))#perf_dict.values()))



