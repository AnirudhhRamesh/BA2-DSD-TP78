architecture rtl of light_manager_rush is

    SIGNAL s_countdown : unsigned (3 downto 0);

begin

    rush_cycle_scheduler : PROCESS(cycle_time)
    begin

        IF (cycle_time = t3 + ty + t4 + ty) THEN
            s_countdown <= resize(t5,4);
            ELSE
            If (s_countdown > 0) THEN s_countdown <= s_countdown - 1;
                ELSE s_countdown <= s_countdown;
            END IF;
        END IF;

        IF (cycle_time >= 0 AND cycle_time < t3) THEN 
            L1_red <= '0';
            L1_yellow <= '0';
            L1_green <= '1';

            L2_red <= '1';
            L2_yellow <= '0';
            L2_green <= '0';

            L3_red <= '1';
            L3_green <= '0';
            
            L4_red <= '1';
            L4_green <= '0';
        END IF;

        IF (cycle_time >= t3 AND cycle_time < t3 + ty) THEN
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

        IF (cycle_time >= t3 + ty AND cycle_time < t3 + ty + t4) THEN
            L1_red <= '1';
            L1_yellow <= '0';
            L1_green <= '0';

            L2_red <= '0';
            L2_yellow <= '0';
            L2_green <= '1';

            L3_red <= '1';
            L3_green <= '0';
    
            L4_red <= '1';
            L4_green <= '0';
        END IF;

        IF (cycle_time >= t3 + ty + t4 AND cycle_time < t3 + ty + t4 + ty) THEN
            L1_red <= '1';
            L1_yellow <= '0';
            L1_green <= '0';

            L2_red <= '0';
            L2_yellow <= '1';
            L2_green <= '0';

            L3_red <= '1';
            L3_green <= '0';

            L4_red <= '1';
            L4_green <= '0';
        END IF;

        IF (cycle_time >= t3 + ty + t4 + ty AND cycle_time < t3 + ty + t4 + ty + t5) THEN
            L1_red <= '1';
            L1_yellow <= '0';
            L1_green <= '0';

            L2_red <= '1';
            L2_yellow <= '0';
            L2_green <= '0';

            L3_red <= '0';
            L3_green <= '1';

            L4_red <= '0';
            L4_green <= '1';
        END IF;

        IF (cycle_time >= t3 + ty + t4 + ty + t5 AND cycle_time <= t3 + ty + t4 + ty + t5 + ty) THEN
            L1_red <= '1';
            L1_yellow <= '1';
            L1_green <= '0';

            L2_red <= '1';
            L2_yellow <= '0';
            L2_green <= '0';

            L3_red <= '1';
            L3_green <= '0';

            L4_red <= '1';
            L4_green <= '0';
        END IF;
    END PROCESS rush_cycle_scheduler;

    L3_countdown <= s_countdown;
    L4_countdown <= s_countdown;

end architecture rtl;