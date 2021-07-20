--The clocking module.
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity clock_divider is
generic(ticks_per_second : unsigned(31 downto 0));
port(clk   : in std_logic;
     -- System clock.
     reset : in std_logic;
     -- System reset.
     pulse : out std_logic;
     -- A pulse signal that is 1 for one cycle at the end of each second.
     blink : out std_logic);
     -- A blinking signal that is 1 for the first half of each second and 0 for the second half.
end entity clock_divider;
