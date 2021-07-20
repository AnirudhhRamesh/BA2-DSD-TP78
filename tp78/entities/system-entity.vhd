--The traffic light system.
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.parameters.all;

entity system is
port(clk       : in std_logic;
     --System clock.
     reset     : in std_logic;
     --System reset.
     leds      : out std_logic_vector(0 to 107);
     --LEDs.
     disp_tens : out std_logic_vector(0 to 7);
     --Seven-segment display for the tens digit of cycle elapsed time.
     disp_ones : out std_logic_vector(0 to 7);
     --Seven-segment display for the ones digit of cycle elapsed time.
     disp_L3   : out std_logic_vector(0 to 7);
     --Seven-segment display for L3.
     disp_L4   : out std_logic_vector(0 to 7));
     --Seven-segment display for L4.
end entity system;
