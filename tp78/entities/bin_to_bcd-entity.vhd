--Converts an 8-bit natural binary number into two BCD digits.
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity bin_to_bcd is
port(bin   : in unsigned(7 downto 0);
     --Input number to be split into BCD digits.
     l_bcd : out unsigned(3 downto 0);
     --The less significant digit (ones).
     u_bcd : out unsigned(3 downto 0));
     --The more significant digit (tens).
end entity bin_to_bcd;
