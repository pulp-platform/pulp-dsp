cd ~/PULP-DSP/
make clean all install
cd ~/PULP-DSP/test/mrWolf/fft/test_lib/singlecore_riscy
make clean all
make run runner_args="--vcd --event=.*"
gtkwave /home/fischeti/PULP-DSP/test/mrWolf/fft/test_lib/singlecore_riscy/build/wolfe/view.gtkw &
