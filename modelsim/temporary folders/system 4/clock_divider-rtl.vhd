architecture rtl of clock_divider is

    signal s_current_state : unsigned(31 downto 0);
    signal s_next_state : unsigned(31 downto 0);
    
begin

    s_next_state <= to_unsigned(0,32) WHEN s_current_state = ticks_per_second - 1 else
        s_current_state + 1;

    ffs_clock: process(clk)
    begin
        if rising_edge(clk) then
            if (reset = '1') then s_current_state <= to_unsigned(0, 32);
                else s_current_state <= s_next_state;
            end if;
        end if;
    end process ffs_clock;

    pulse <= '1' when s_current_state = ticks_per_second - 1 else '0';
    blink <= '1' when s_current_state <= shift_right(ticks_per_second - 1,1) else '0';

end architecture rtl;