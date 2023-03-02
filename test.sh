# get file as input for bash script

while getopts ":f:h" opt; do
  case $opt in
    h) echo "Usage: ./test.sh -f <file>"
    exit 0
    ;;
    f) file="$OPTARG"
    ;;
    \?) echo "Invalid option -$OPTARG" >&2
    ;;
  esac
done

functions=$(grep "Running: top:riscy:" $file | sed -e 's/Running: top:riscy://g' | sed -e 's/ .*//g')
cycles=$(grep "cycles:" $file | sed -e 's/.*cycles://g' | sed -e 's/ //g')
instructions=$(grep "instructions:" $file | sed -e 's/.*instructions://g' | sed -e 's/ //g')
icache_miss=$(grep "icache_miss:" $file | sed -e 's/.*icache_miss://g' | sed -e 's/ //g')
load_stalls=$(grep "load_stalls:" $file | sed -e 's/.*load_stalls://g' | sed -e 's/ //g')
tcdm_cont=$(grep "tcdm_cont:" $file | sed -e 's/.*tcdm_cont://g' | sed -e 's/ //g')


echo "function,cycles"
paste -d, <(echo "$functions") <(echo "$cycles")
echo ""
echo "function,instructions"
paste -d, <(echo "$functions") <(echo "$instructions")
echo ""
echo "function,icache_miss"
paste -d, <(echo "$functions") <(echo "$icache_miss")
echo ""
echo "function,load_stalls"
paste -d, <(echo "$functions") <(echo "$load_stalls")
echo ""
echo "function,tcdm_cont"
paste -d, <(echo "$functions") <(echo "$tcdm_cont")
echo ""

# divide instructions by cycles
echo "function,instructions/cycles"
paste -d, <(echo "$functions") <(echo "$instructions") <(echo "$cycles") | awk -F, '{print $1","$2/$3}'

# write functions, cycles, instructions, icache_miss, load_stalls, tcdm_cont, instructions/cycles to csv file
# remove .txt from file name
file=${file%.txt}
echo "function,cycles,instructions,icache_miss,load_stalls,tcdm_cont,instructions/cycles" > result.tmp
paste -d, <(echo "$functions") <(echo "$cycles") <(echo "$instructions") <(echo "$icache_miss") <(echo "$load_stalls") <(echo "$tcdm_cont") <(echo "$instructions") <(echo "$cycles") | awk -F, '{print $1","$2","$3","$4","$5","$6","$7/$8}' >> result.tmp
# replace ^M with newline
tr -d '\r' < result.tmp > result.csv
# remove tmp file
rm result.tmp
