--Top-level wrapper for TP7/8.
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tp78 is
port(clock_50MHz : in std_logic;
     led_array   : out std_logic_vector(0 to 107);
     seg1        : out std_logic_vector(0 to 7);
     seg2        : out std_logic_vector(0 to 7);
     seg3        : out std_logic_vector(0 to 7);
     seg4        : out std_logic_vector(0 to 7));
end entity tp78;
