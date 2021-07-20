library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity light_manager is
generic(t1 : unsigned(8 downto 0);
        t2 : unsigned(8 downto 0);
        t3 : unsigned(8 downto 0);
        t4 : unsigned(8 downto 0);
        t5 : unsigned(8 downto 0);
        ty : unsigned(8 downto 0));
port(is_rush_hour : in std_logic;
     -- Is it rush hour currently?
     cycle_time   : in unsigned(8 downto 0);
     -- Elapsed time (in seconds) in the current traffic cycle.
     L1_red, L1_yellow, L1_green, L2_red, L2_yellow, L2_green, L3_red, L3_green, L4_red, L4_green : out std_logic;
     -- Whether each lamp is bright or dim.
     L3_countdown, L4_countdown : out unsigned(3 downto 0));
     -- Countdown values for L3 and L4.
end entity light_manager;
