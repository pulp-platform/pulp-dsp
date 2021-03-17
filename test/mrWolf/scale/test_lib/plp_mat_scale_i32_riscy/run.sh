
cd $(dirname $0)
make clean
make all
if [ $? -eq 0 ]; then
    timeout -k 1 5 make run $@
    if [ $? -eq 0 ]; then
        echo "#@# success"
    else
        echo "#@# error: run"
    fi
else
    echo "#@# error: build"
fi
cd ..
