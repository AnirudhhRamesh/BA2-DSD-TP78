vsim -t ps -gt1=10#4# -gt2=10#6# -gt3=10#4# -gt4=10#4# -gt5=10#5# -gty=10#2# light_manager

add wave -unsigned *

force is_rush_hour 1 0, 0 16
force cycle_time 000000000 0
force cycle_time 000000001 1
force cycle_time 000000010 2
force cycle_time 000000011 3
force cycle_time 000000100 4
force cycle_time 000000101 5
force cycle_time 000000110 6
force cycle_time 000000111 7
force cycle_time 000001000 8
force cycle_time 000001001 9
force cycle_time 000001010 10
force cycle_time 000001011 11
force cycle_time 000001100 12
force cycle_time 000001101 13
force cycle_time 000001110 14
force cycle_time 000001111 15
force cycle_time 000000000 16
force cycle_time 000000001 17
force cycle_time 000000010 18
force cycle_time 000000011 19
force cycle_time 000000100 20
force cycle_time 000000101 21
force cycle_time 000000110 22
force cycle_time 000000111 23
force cycle_time 000001000 24
force cycle_time 000001001 25
force cycle_time 000001010 26
force cycle_time 000001011 27
run 27