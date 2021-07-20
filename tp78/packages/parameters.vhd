library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package parameters is
    constant param_ticks_per_second : unsigned(31 downto 0) := to_unsigned(12500000, 32); -- 4x faster video
    --constant param_ticks_per_second : unsigned(31 downto 0) := to_unsigned(50000000, 32); -- realtime, 50 MHz clock
    constant param_d : unsigned(8 downto 0) := to_unsigned(175, 9); -- number of seconds in a day

    constant param_r1 : unsigned(8 downto 0) := to_unsigned(50, 9);
    constant param_r2 : unsigned(8 downto 0) := to_unsigned(80, 9);
    constant param_r3 : unsigned(8 downto 0) := to_unsigned(120, 9);
    constant param_r4 : unsigned(8 downto 0) := to_unsigned(165, 9);
    constant param_cn : unsigned(8 downto 0) := to_unsigned(20, 9);
    constant param_cr : unsigned(8 downto 0) := to_unsigned(15, 9);

    constant param_t1 : unsigned(8 downto 0) := to_unsigned(9, 9);
    constant param_t2 : unsigned(8 downto 0) := to_unsigned(9, 9);
    constant param_t3 : unsigned(8 downto 0) := to_unsigned(3, 9);
    constant param_t4 : unsigned(8 downto 0) := to_unsigned(3, 9);
    constant param_t5 : unsigned(8 downto 0) := to_unsigned(6, 9);
    constant param_ty : unsigned(8 downto 0) := to_unsigned(1, 9);
end package parameters;
