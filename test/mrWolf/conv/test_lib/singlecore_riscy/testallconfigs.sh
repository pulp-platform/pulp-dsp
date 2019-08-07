#!/bin/bash

m=512
n=1024

runSequential(){
    clearConfig

    sed -i "s/#define i32s 0/#define i32s 1/" cluster.c
    
    echo "i32s" >> results.txt
    make clean all run | tail -5 >> results.txt
    i+=$(less results.txt | tail -5 | head -1 | tail -1 | grep -o "[0-9]*")
    i+=$(echo -e "\t")
    i+=$(less results.txt | tail -5 | head -2 | tail -1 | grep -o "[0-9]*")
    i+=$(echo -e "\t")
    i+=$(less results.txt | tail -5 | head -3 | tail -1 | grep -o "[0-9]*")
    i+=$(echo -e "\t")
    
    sed -i "s/#define i16s 0/#define i16s 1/" cluster.c
    sed -i "s/#define i32s 1/#define i32s 0/" cluster.c
    
    echo "i16s" >> results.txt
    make clean all run | tail -5 >> results.txt

    i+=$(less results.txt | tail -5 | head -1 | tail -1  | grep -o "[0-9]*")
    i+=$(echo -e "\t")
    i+=$(less results.txt | tail -5 | head -2 | tail -1  | grep -o "[0-9]*")
    i+=$(echo -e "\t")
    i+=$(less results.txt | tail -5 | head -3 | tail -1  | grep -o "[0-9]*")
    i+=$(echo -e "\t")

    sed -i "s/#define i8s 0/#define i8s 1/" cluster.c
    sed -i "s/#define i16s 1/#define i16s 0/" cluster.c

    echo "i8s" >> results.txt
    make clean all run | tail -5 >> results.txt

    i+=$(less results.txt | tail -5 | head -1 | tail -1 | grep -o "[0-9]*")
    i+=$(echo -e "\t")
    i+=$(less results.txt | tail -5 | head -2 | tail -1 | grep -o "[0-9]*")
    i+=$(echo -e "\t")
    i+=$(less results.txt | tail -5 | head -3 | tail -1 | grep -o "[0-9]*")

    echo "$i" >> benchmark.txt
    export i
}

runParallel(){

    for i in {1..8}
    do
	sed -i "s/#define NUMCORES [0-9]/#define NUMCORES $i/" cluster.c
	
	clearConfig
	sed -i "s/#define i32p 0/#define i32p 1/" cluster.c
	
	echo "i32p $i Cores" >> results.txt
	make clean all run | tail -5 >> results.txt

	q=$(less results.txt | tail -5 | head -1 | tail -1 | grep -o "[0-9]*")
	q+=$(echo -e "\t")
	q+=$(less results.txt | tail -5 | head -2 | tail -1 | grep -o "[0-9]*")
	q+=$(echo -e "\t")
	q+=$(less results.txt | tail -5 | head -3 | tail -1 | grep -o "[0-9]*")
	q+=$(echo -e "\t")
	
	clearConfig
	sed -i "s/#define i16p 0/#define i16p 1/" cluster.c

	echo "i16p $i Cores" >> results.txt
	make clean all run | tail -5 >> results.txt
	
	q+=$(less results.txt | tail -5 | head -1 | tail -1 | grep -o "[0-9]*")
	q+=$(echo -e "\t")
	q+=$(less results.txt | tail -5 | head -2 | tail -1 | grep -o "[0-9]*")
	q+=$(echo -e "\t")
	q+=$(less results.txt | tail -5 | head -3 | tail -1 | grep -o "[0-9]*")
	q+=$(echo -e "\t")
	
	clearConfig
	sed -i "s/#define i8p 0/#define i8p 1/" cluster.c

	echo "i8p $i Cores" >> results.txt
	make clean all run | tail -5 >> results.txt

	q+=$(less results.txt | tail -5 | head -1 | tail -1 | grep -o "[0-9]*")
	q+=$(echo -e "\t")
	q+=$(less results.txt | tail -5 | head -2 | tail -1 | grep -o "[0-9]*")
	q+=$(echo -e "\t")
	q+=$(less results.txt | tail -5 | head -3 | tail -1 | grep -o "[0-9]*")

	echo "$q" >> benchmark.txt
	
    done
    export q

    
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
    echo -e "" > benchmark.txt
    echo -e "" > results.txt
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

echo -e "" > benchmark.txt
echo -e "" > results.txt

m=512
n=1024
echo "Running $m and $n"
$(setConfigHeaders)
$(runAll)
$(saveResults)
m=511
n=1023
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
