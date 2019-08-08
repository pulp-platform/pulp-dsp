#!/bin/bash

m=512
n=1024

runSequential(){
    clearConfig

    touch buf.txt
    
    sed -i "s/#define i32s 0/#define i32s 1/" cluster.c
    
    echo "i32s" > buf.txt
    make clean all run | grep "Total cycles\|Instructions\|Load stalls\|TCDM Contentions\|External loads" >> buf.txt

    less buf.txt >> results.txt
    
    i+=$(less buf.txt | grep "Total cycles" | grep -o "[0-9]*" )
    i+=$(printf "\t")
    i+=$(less buf.txt  | grep "Instructions" | grep -o "[0-9]*")
    i+=$(printf "\t")
    i+=$(less buf.txt  | grep "Load stalls" | grep -o "[0-9]*")
    i+=$(printf "\t")
    i+=$(less buf.txt  | grep "TCDM Contentions" | grep -o "[0-9]*")
    i+=$(printf "\t")
    i+=$(less buf.txt  | grep "External loads" | grep -o "[0-9]*")
    i+=$(printf "\t")
    i+=$(printf "\n")

    sed -i "s/#define i16s 0/#define i16s 1/" cluster.c
    sed -i "s/#define i32s 1/#define i32s 0/" cluster.c
    
    echo "i16s" > buf.txt
    make clean all run | grep "Total cycles\|Instructions\|Load stalls\|TCDM Contentions\|External loads" >> buf.txt

    less buf.txt >> results.txt
    
    i+=$(less buf.txt | grep "Total cycles" | grep -o "[0-9]*")
    i+=$(printf "\t")
    i+=$(less buf.txt  | grep "Instructions" | grep -o "[0-9]*")
    i+=$(printf "\t")
    i+=$(less buf.txt  | grep "Load stalls" | grep -o "[0-9]*")
    i+=$(printf "\t")
    i+=$(less buf.txt  | grep "TCDM Contentions" | grep -o "[0-9]*")
    i+=$(printf "\t")
    i+=$(less buf.txt  | grep "External loads" | grep -o "[0-9]*")
    i+=$(printf "\t")
    i+=$(printf "\n")
    
    sed -i "s/#define i8s 0/#define i8s 1/" cluster.c
    sed -i "s/#define i16s 1/#define i16s 0/" cluster.c

    echo "i8s"  > buf.txt
    make clean all run | grep "Total cycles\|Instructions\|Load stalls\|TCDM Contentions\|External loads" >> buf.txt

    less buf.txt >> results.txt
    
    i+=$(less buf.txt | grep "Total cycles" | grep -o "[0-9]*")
    i+=$(printf "\t")
    i+=$(less buf.txt  | grep "Instructions" | grep -o "[0-9]*")
    i+=$(printf "\t")
    i+=$(less buf.txt  | grep "Load stalls" | grep -o "[0-9]*")
    i+=$(printf "\t")
    i+=$(less buf.txt  | grep "TCDM Contentions" | grep -o "[0-9]*")
    i+=$(printf "\t")
    i+=$(less buf.txt  | grep "External loads" | grep -o "[0-9]*")
    i+=$(printf "\t")
    i+=$(printf "\n")

    rm buf.txt
    
    echo "$i" >> benchmark.txt
    export i
}

runParallel(){

    touch buf.txt
    
    for i in {1..8}
    do
	sed -i "s/#define NUMCORES [0-9]/#define NUMCORES $i/" cluster.c
	
	clearConfig
	sed -i "s/#define i32p 0/#define i32p 1/" cluster.c
	
	echo "i32p $i Cores" > buf.txt
	make clean all run | grep "Total cycles\|Instructions\|Load stalls\|TCDM Contentions\|External loads" >> buf.txt

	less buf.txt >> results.txt

	q=$(printf "")
	
	q+=$(less buf.txt | grep "Total cycles" | grep -o "[0-9]*")
	q+=$(printf "\t")
	q+=$(less buf.txt  | grep "Instructions" | grep -o "[0-9]*")
	q+=$(printf "\t")
	q+=$(less buf.txt  | grep "Load stalls" | grep -o "[0-9]*")
	q+=$(printf "\t")
	q+=$(less buf.txt  | grep "TCDM Contentions" | grep -o "[0-9]*")
	q+=$(printf "\t")
	q+=$(less buf.txt  | grep "External loads" | grep -o "[0-9]*")
	q+=$(printf "\t")
	q+=$(printf "\n")
	
	clearConfig
	sed -i "s/#define i16p 0/#define i16p 1/" cluster.c

	echo "i16p $i Cores" > buf.txt
	make clean all run | grep "Total cycles\|Instructions\|Load stalls\|TCDM Contentions\|External loads" >> buf.txt

	less buf.txt >> results.txt
	
	q+=$(less buf.txt | grep "Total cycles" | grep -o "[0-9]*")
	q+=$(printf "\t")
	q+=$(less buf.txt  | grep "Instructions" | grep -o "[0-9]*")
	q+=$(printf "\t")
	q+=$(less buf.txt  | grep "Load stalls" | grep -o "[0-9]*")
	q+=$(printf "\t")
	q+=$(less buf.txt  | grep "TCDM Contentions" | grep -o "[0-9]*")
	q+=$(printf "\t")
	q+=$(less buf.txt  | grep "External loads" | grep -o "[0-9]*")
	q+=$(printf "\t")
	q+=$(printf "\n")
	

	clearConfig
	sed -i "s/#define i8p 0/#define i8p 1/" cluster.c

	echo "i8p $i Cores" > buf.txt
	make clean all run | grep "Total cycles\|Instructions\|Load stalls\|TCDM Contentions\|External loads" >> buf.txt

	less buf.txt >> results.txt
	
	q+=$(less buf.txt | grep "Total cycles" | grep -o "[0-9]*")
	q+=$(printf "\t")
	q+=$(less buf.txt  | grep "Instructions" | grep -o "[0-9]*")
	q+=$(printf "\t")
	q+=$(less buf.txt  | grep "Load stalls" | grep -o "[0-9]*")
	q+=$(printf "\t")
	q+=$(less buf.txt  | grep "TCDM Contentions" | grep -o "[0-9]*")
	q+=$(printf "\t")
	q+=$(less buf.txt  | grep "External loads" | grep -o "[0-9]*")
	q+=$(printf "\t")
	q+=$(printf "\n")
	
	echo "$q" >> benchmark.txt
	
    done
    export q

    rm buf.txt
    
    
}

clearConfig(){
    sed -i "s/#define i32s 1/#define i32s 0/" cluster.c
    sed -i "s/#define i32p 1/#define i32p 0/" cluster.c
    sed -i "s/#define i16s 1/#define i16s 0/" cluster.c
    sed -i "s/#define i16p 1/#define i16p 0/" cluster.c
    sed -i "s/#define i8s 1/#define i8s 0/" cluster.c
    sed -i "s/#define i8p 1/#define i8p 0/" cluster.c
}

runAll(){
    $(clearConfig)
    $(runSequential)
    $(clearConfig)
    $(runParallel)
}

saveResults(){
    $(less benchmark.txt > benchmark_"$m"_"$n".txt)
    printf "" > benchmark.txt
    printf "" > results.txt
}

setConfigHeaders(){
    $(ls ../../test_data | grep ".h" | xargs -I '{}' rm ../../test_data/'{}')
    $(sed -i "s/m_size = [0-9]*/m_size = $m/" ../../test_data/gen_stimuli.py)
    $(sed -i "s/n_size = [0-9]*/n_size = $n/" ../../test_data/gen_stimuli.py)
    $(python ../../test_data/gen_stimuli.py)
    $(ls | grep "conv_data" | xargs -I '{}' mv '{}' ../../test_data/'{}')
}

export clearConfig
export runParallel
export runSequential
export runAll
export saveResults
export setConfigHeaders

printf "" > benchmark.txt
printf "" > results.txt

m=512
n=32
echo "Running $m and $n"
$(setConfigHeaders)
$(runAll)
$(saveResults)
m=512
n=64
echo "Running $m and $n"
$(setConfigHeaders)
$(runAll)
$(saveResults)
m=512
n=128
echo "Running $m and $n"
$(setConfigHeaders)
$(runAll)
$(saveResults)
m=512
n=192
echo "Running $m and $n"
$(setConfigHeaders)
$(runAll)
$(saveResults)
m=512
n=256
echo "Running $m and $n"
$(setConfigHeaders)
$(runAll)
$(saveResults)
m=512
n=320
echo "Running $m and $n"
$(setConfigHeaders)
$(runAll)
$(saveResults)
m=512
n=384
echo "Running $m and $n"
$(setConfigHeaders)
$(runAll)
$(saveResults)
m=512
n=448
echo "Running $m and $n"
$(setConfigHeaders)
$(runAll)
$(saveResults)
m=512
n=512
echo "Running $m and $n"
$(setConfigHeaders)
$(runAll)
$(saveResults)
