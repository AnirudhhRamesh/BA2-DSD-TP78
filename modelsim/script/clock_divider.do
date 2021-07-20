vsim -t ps -gticks_per_second=10#20# clock_divider

add wave *
force reset 1 0, 0 10
force clk 0 0, 1 1 -repeat 2
force pulse 0 0, 1 1 -repeat 30
run 1000