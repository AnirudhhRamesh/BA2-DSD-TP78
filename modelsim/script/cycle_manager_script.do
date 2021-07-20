vsim -t ps -gr1=10#2# -gr2=10#11# -gr3=10#17# -gr4=10#26# -gcn=10#6# -gcr=10#9# -gd=10#30# cycle_manager

add wave -unsigned *

force clk 1 0, 0 1 -repeat 2
force pulse 0 0, 1 18 -repeat 20
force reset 1 0, 0 4
run 1000