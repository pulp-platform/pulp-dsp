#!/bin/bash

BUILD_DIR="$(dirname $0)/lib"
if FILE=$(find $BUILD_DIR -type f | grep $1 | egrep "\.o$"); then
    FOUND_FILES=$(echo $FILE | wc -l)
    if test $FOUND_FILES -eq "1"; then
        $(echo $PULP_RISCV_GCC_TOOLCHAIN)/bin/riscv32-unknown-elf-objdump -d $FILE
    else
        echo "Multiple matching files found!"
        exit 1
    fi
else
    echo "No matching file found!"
    exit 1
fi
