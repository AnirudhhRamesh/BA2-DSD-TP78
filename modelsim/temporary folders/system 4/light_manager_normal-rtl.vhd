architecture rtl of light_manager_normal is

    SIGNAL s_L3_countdown, s_L4_countdown : unsigned (3 downto 0);

begin

    s_L3_countdown <= t1(3 downto 0) when (cycle_time = 0) else t1(3 downto 0) - cycle_time(3 downto 0);
    s_L4_countdown <= t2(3 downto 0) when (cycle_time = t1 + ty) else (t2(3 downto 0) + t1(3 downto 0) + ty(3 downto 0)) - cycle_time(3 downto 0);

    L3_countdown <= s_L3_countdown;
    L4_countdown <= s_L4_countdown;

    normal_cycle_scheduler : PROCESS(cycle_time)
    begin
        IF (cycle_time >= 0 AND cycle_time < t1) THEN 
            L1_red <= '0';
            L1_yellow <= '0';
            L1_green <= '1';

            L2_red <= '1';
            L2_yellow <= '0';
            L2_green <= '0';

            L3_red <= '0';
            L3_green <= '1';
            
            L4_red <= '1';
            L4_green <= '0';
        END IF;

        IF (cycle_time >= t1 AND cycle_time < t1 + ty) THEN
            L1_red <= '0';
            L1_yellow <= '1';
            L1_green <= '0';

            L2_red <= '1';
            L2_yellow <= '1';
            L2_green <= '0';

            L3_red <= '1';
            L3_green <= '0';
        
            L4_red <= '1';
            L4_green <= '0';
        END IF;

        IF (cycle_time >= t1 + ty AND cycle_time < t1 + ty + t2) THEN
            L1_red <= '1';
            L1_yellow <= '0';
            L1_green <= '0';

            L2_red <= '0';
            L2_yellow <= '0';
            L2_green <= '1';

            L3_red <= '1';
            L3_green <= '0';
    
            L4_red <= '0';
            L4_green <= '1';
        END IF;

        IF (cycle_time >= t1 + ty + t2 AND cycle_time <= t1 + ty + t2 + ty) THEN
            L1_red <= '1';
            L1_yellow <= '1';
            L1_green <= '0';

            L2_red <= '0';
            L2_yellow <= '1';
            L2_green <= '0';

            L3_red <= '1';
            L3_green <= '0';

            L4_red <= '1';
            L4_green <= '0';
        END IF;
    END PROCESS normal_cycle_scheduler;

end architecture rtl;
