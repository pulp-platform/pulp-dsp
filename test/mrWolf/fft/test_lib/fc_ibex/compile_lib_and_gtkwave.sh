cd ~/PULP-DSP/
make clean all install
cd ~/PULP-DSP/test/mrWolf/fft/test_lib/fc_ibex
make clean all
make run runner_args="--vcd --event=.*"
gtkwave /home/fischeti/PULP-DSP/test/mrWolf/fft/test_lib/fc_ibex/build/wolfe/view.gtkw &
