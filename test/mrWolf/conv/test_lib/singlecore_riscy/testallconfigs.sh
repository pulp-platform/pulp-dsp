#!/bin/bash

runSequential(){
    clearConfig

    sed -i "s/#define i32s 0/#define i32s 1/" cluster.c
    
    echo "i32s" >> results.txt
    make clean all run | tail -3 >> results.txt
    i+=$(less results.txt | tail -3 | head -1 | tail -1 | grep -o "[0-9]*")
    i+=$(echo -e "\t")
    i+=$(less results.txt | tail -3 | head -2 | tail -1 | grep -o "[0-9]*")
    i+=$(echo -e "\t")
    i+=$(less results.txt | tail -3 | head -3 | tail -1 | grep -o "[0-9]*")
    i+=$(echo -e "\t")
    
    sed -i "s/#define i16s 0/#define i16s 1/" cluster.c
    sed -i "s/#define i32s 1/#define i32s 0/" cluster.c
    
    echo "i16s" >> results.txt
    make clean all run | tail -3 >> results.txt

    i+=$(less results.txt | tail -3 | head -1 | tail -1  | grep -o "[0-9]*")
    i+=$(echo -e "\t")
    i+=$(less results.txt | tail -3 | head -2 | tail -1  | grep -o "[0-9]*")
    i+=$(echo -e "\t")
    i+=$(less results.txt | tail -3 | head -3 | tail -1  | grep -o "[0-9]*")
    i+=$(echo -e "\t")

    sed -i "s/#define i8s 0/#define i8s 1/" cluster.c
    sed -i "s/#define i16s 1/#define i16s 0/" cluster.c

    echo "i8s" >> results.txt
    make clean all run | tail -3 >> results.txt

    i+=$(less results.txt | tail -3 | head -1 | tail -1 | grep -o "[0-9]*")
    i+=$(echo -e "\t")
    i+=$(less results.txt | tail -3 | head -2 | tail -1 | grep -o "[0-9]*")
    i+=$(echo -e "\t")
    i+=$(less results.txt | tail -3 | head -3 | tail -1 | grep -o "[0-9]*")

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
	make clean all run | tail -3 >> results.txt

	q=$(less results.txt | tail -3 | head -1 | tail -1 | grep -o "[0-9]*")
	q+=$(echo -e "\t")
	q+=$(less results.txt | tail -3 | head -2 | tail -1 | grep -o "[0-9]*")
	q+=$(echo -e "\t")
	q+=$(less results.txt | tail -3 | head -3 | tail -1 | grep -o "[0-9]*")
	q+=$(echo -e "\t")
	
	clearConfig
	sed -i "s/#define i16p 0/#define i16p 1/" cluster.c

	echo "i16p $i Cores" >> results.txt
	make clean all run | tail -3 >> results.txt
	
	q+=$(less results.txt | tail -3 | head -1 | tail -1 | grep -o "[0-9]*")
	q+=$(echo -e "\t")
	q+=$(less results.txt | tail -3 | head -2 | tail -1 | grep -o "[0-9]*")
	q+=$(echo -e "\t")
	q+=$(less results.txt | tail -3 | head -3 | tail -1 | grep -o "[0-9]*")
	q+=$(echo -e "\t")
	
	clearConfig
	sed -i "s/#define i8p 0/#define i8p 1/" cluster.c

	echo "i8p $i Cores" >> results.txt
	make clean all run | tail -3 >> results.txt

	q+=$(less results.txt | tail -3 | head -1 | tail -1 | grep -o "[0-9]*")
	q+=$(echo -e "\t")
	q+=$(less results.txt | tail -3 | head -2 | tail -1 | grep -o "[0-9]*")
	q+=$(echo -e "\t")
	q+=$(less results.txt | tail -3 | head -3 | tail -1 | grep -o "[0-9]*")

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

export clearConfig
export runParallel
export runSequential

echo "" > benchmark.txt
echo "" > results.txt

$(clearConfig)
$(runSequential)
$(clearConfig)
$(runParallel)

