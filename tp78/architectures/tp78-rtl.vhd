architecture rtl of tp78 is
    constant por_cycles : unsigned(31 downto 0) := to_unsigned(5, 32);
    signal por : std_logic; -- Power-on reset signal which will be 1 for the first `por_cycles` cycles, and then stays at 0
    signal por_counter : unsigned(31 downto 0);
begin
    sys:entity work.system(rtl)
    port map(clk       => clock_50MHz,
             reset     => por,
             leds      => led_array,
             disp_tens => seg1,
             disp_ones => seg2,
             disp_L3   => seg3,
             disp_L4   => seg4);

    por <= '1' when por_counter < por_cycles else '0';
    counter: process(clock_50MHz, por_counter) is
    begin
        por_counter <= por_counter;
        if rising_edge(clock_50MHz) then
            if por_counter < por_cycles then
                por_counter <= por_counter + 1;
            end if;
        end if;
    end process counter;
end architecture rtl;
