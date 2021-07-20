architecture rtl of cycle_manager is

    signal s_current_state : unsigned(8 downto 0);
    signal s_next_state : unsigned(8 downto 0);

    signal s_time_of_day : unsigned(8 downto 0);
    signal s_next_time_of_day: unsigned(8 downto 0);

    signal s_is_cycle_over : std_logic;
    signal s_is_rush_hour : std_logic;

begin

    s_next_state <= to_unsigned(0, 9) when (s_is_cycle_over = '1') else
        s_current_state + 1;

    s_next_time_of_day <= to_unsigned(0,9) when (s_time_of_day = d - 1) else
        s_time_of_day + 1;

    s_is_cycle_over <= '1' when (s_is_rush_hour = '0' and s_current_state = cn - 1) 
    or (s_is_rush_hour = '1' and s_current_state = cr - 1) else
        '0';

    
    ffs_cycle_man: process(clk)
    begin
        if rising_edge(clk) then
            if (reset = '1') then 
                    s_current_state <= to_unsigned(0, 9);
                    s_time_of_day <= r1 - 1;
                else
                    if (pulse = '1') then 
                        s_current_state <= s_next_state;
                        s_time_of_day <= s_next_time_of_day;
                    else 
                        s_current_state <= s_current_state;
                        s_time_of_day <= s_time_of_day;
                    end if;
            end if;
        end if;
    end process ffs_cycle_man;

    cycle_time <= s_current_state; --Cycle time should start at 0 (not r1)

    s_is_rush_hour <= '1' when ((s_time_of_day >= r1 - 1 and s_time_of_day < r2 - 1) 
        or (s_time_of_day >= r3 - 1 and s_time_of_day < r4 - 1)) else
            '0';

    is_rush_hour <= s_is_rush_hour;


end architecture rtl;
