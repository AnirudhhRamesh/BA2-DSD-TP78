library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity cycle_manager is
generic(r1 : unsigned(8 downto 0);
        r2 : unsigned(8 downto 0);
        r3 : unsigned(8 downto 0);
        r4 : unsigned(8 downto 0);
        cn : unsigned(8 downto 0);
        cr : unsigned(8 downto 0);
        d  : unsigned(8 downto 0));
port(clk          : in std_logic;
     -- System clock.
     reset        : in std_logic;
     -- System reset.
     pulse        : in std_logic;
     -- A pulse signal that is 1 for one cycle at the end of each second.
     is_rush_hour : out std_logic;
     -- Is it rush hour currently?
     cycle_time   : out unsigned(8 downto 0));
     -- Elapsed time (in seconds) in the current traffic cycle.
end entity cycle_manager;
