--Converts a single BCD digit into a vector driving a 7-segment display.
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity bcd_to_7seg is
port(en   : in std_logic;
     --Enables the display.
     bcd  : in unsigned(3 downto 0);
     --The digit to be displayed.
     disp : out std_logic_vector(0 to 7));
     --Output driving the display.
     --0 1 2 3 4 5 6 7
     --a b c d e f g p
end entity bcd_to_7seg;
