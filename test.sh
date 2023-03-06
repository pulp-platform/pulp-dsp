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
# grep for len and only take the numeric value after the = sign
len=$(grep "len=" $file |  sed -e 's/.*len=//g' | sed -e 's/ .*//g')
# grep for numeric values in len_m and remove comma
len_m=$(grep "len_m=" $file | sed -e 's/.*len_m=//g' | sed -e 's/,.*//g')

len_n=$(grep "len_n=" $file | sed -e 's/.*len_n=//g' | sed -e 's/,.*//g')

len_o=$(grep "len_o=" $file | sed -e 's/.*len_o=//g' | sed -e 's/,.*//g')

len_a=$(grep "len_a=" $file | sed -e 's/.*len_a=//g' | sed -e 's/,.*//g')

len_b=$(grep "len_b=" $file | sed -e 's/.*len_b=//g' | sed -e 's/,.*//g')

# if len_m not empty, compute len_mnok
if [ -n "$len_m" ]; then
  len_mnok=""
  # get first value of len_m
  for i in $len_m; do
    len_mnok=$i
    break
  done

  for j in $len_n; do
    # multiply first value of len_m with first value of len_n
    len_mnok=$(($len_mnok*$j))
    break
  done

  for k in $len_o; do
    # multiply first value of len_mnok with first value of len_o
    len_mnok=$(($len_mnok*$k))
    break
  done

  len_mnok_tmp=$len_mnok
  len_mnok+=$'\n'
  # print length of len_m array
  len_m_len=$(echo $len_m | wc -w)
  # append the same value to len_mnok for the number of entries in len_m
  for ((i=1; i<$len_m_len; i++)); do
    new_element=$len_mnok_tmp
    len_mnok+="$new_element"
    # add new line to len_mnok except for the last entry
    if [ $i -ne $(($len_m_len-1)) ]; then
      len_mnok+=$'\n'
    fi
    # len_mnok+=$'\n'
    new_element=""
  done
fi

# if len_a not empty, compute len_ab
if [ -n "$len_a" ]; then
  len_ab=""
  # get first value of len_a
  for i in $len_a; do
    len_ab=$i
    break
  done

  # echo "len_ab: $len_ab"

  for j in $len_b; do
    # multiply first value of len_a with first value of len_b
    len_ab=$(($len_ab*$j))
    break
  done

  # echo "len_ab: $len_ab"

  len_ab_tmp=$len_ab
  len_ab+=$'\n'
  # print length of len_a array
  len_a_len=$(echo $len_a | wc -w)
  # append the same value to len_ab for the number of entries in len_a
  for ((i=1; i<$len_a_len; i++)); do
    new_element=$len_ab_tmp
    len_ab+="$new_element"
    # add new line to len_ab except for the last entry
    if [ $i -ne $(($len_a_len-1)) ]; then
      len_ab+=$'\n'
    fi
    # len_ab+=$'\n'
    new_element=""
  done
  # echo "len_ab: $len_ab"
fi

cycles=$(grep "cycles:" $file | sed -e 's/.*cycles://g' | sed -e 's/ //g')
instructions=$(grep "instructions:" $file | sed -e 's/.*instructions://g' | sed -e 's/ //g')
icache_miss=$(grep "icache_miss:" $file | sed -e 's/.*icache_miss://g' | sed -e 's/ //g')
load_stalls=$(grep "load_stalls:" $file | sed -e 's/.*load_stalls://g' | sed -e 's/ //g')
tcdm_cont=$(grep "tcdm_cont:" $file | sed -e 's/.*tcdm_cont://g' | sed -e 's/ //g')

# if len is empty, len = len_mnok, else len = len 
if [ -z "$len" ]; then
  # check if len_m is not empty
  if [ -n "$len_m" ]; then
    # echo "len_m is not empty"
    len=$len_mnok
  fi
  # check if len_a is not empty
  if [ -n "$len_a" ]; then
    # echo "len_a is not empty"
    len=$len_ab
  fi
fi

# replace comma with new line
len=$(echo $len | tr ',' '\n')
# replace space with new line
len=$(echo $len | tr ' ' '\n')

echo "function,len"
paste -d, <(echo "$functions") <(echo "$len")
echo ""
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
echo "function, relative_stalls"
paste -d, <(echo "$functions") <(echo "$load_stalls") <(echo "$tcdm_cont") <(echo "$cycles") | awk -F',' '{print $1", "(($2+$3)/$4)}'
echo ""
# divide instructions by cycles
echo "function,instructions/cycles"
paste -d, <(echo "$functions") <(echo "$instructions") <(echo "$cycles") | awk -F, '{print $1","$2/$3}'

# write functions, cycles, instructions, icache_miss, load_stalls, tcdm_cont, instructions/cycles to csv file
# remove .txt from file name
file=${file%.txt}
echo "function,dimension,cycles,instructions,icache_miss,load_stalls,tcdm_cont,instructions/cycles,relative_stalls" > result.tmp
paste -d, <(echo "$functions") <(echo "$len") <(echo "$cycles") <(echo "$instructions") <(echo "$icache_miss") <(echo "$load_stalls") <(echo "$tcdm_cont") <(echo "$instructions") <(echo "$cycles") | awk -F, '{print $1","$2","$3","$4","$5","$6","$7","$8/$9","($6+$7)/$3}' >> result.tmp
# replace ^M with newline
tr -d '\r' < result.tmp > result.csv
# replace double commas with single comma
sed -i 's/,,/,/g' result.csv
# remove tmp file
rm result.tmp
