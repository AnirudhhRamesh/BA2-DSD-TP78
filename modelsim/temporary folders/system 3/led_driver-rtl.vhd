architecture rtl of led_driver is
    type matrix_t is array(0 to 8) of std_logic_vector(0 to 11);
    
    signal led_matrix : matrix_t;
    signal red_lamps, yellow_lamps, green_lamps : std_logic_vector(0 to 11);
begin
    red_lamps <= L1_red & L1_red & '0' & L2_red & L2_red & "00" & L3_red & L3_red & '0' & L4_red & L4_red;
    yellow_lamps <= L1_yellow & L1_yellow & '0' & L2_yellow & L2_yellow & "0000000";
    green_lamps <= L1_green & L1_green & '0' & L2_green & L2_green & "00" & L3_green & L3_green & '0' & L4_green & L4_green;

    led_matrix(8) <= red_lamps;
    led_matrix(7) <= red_lamps;
    led_matrix(6) <= (others => '0');
    led_matrix(5) <= yellow_lamps;
    led_matrix(4) <= yellow_lamps; 
    led_matrix(3) <= (others => '0'); 
    led_matrix(2) <= green_lamps;
    led_matrix(1) <= green_lamps;
    led_matrix(0) <= "00000" & is_rush_hour & blink & "00000";

    leds <= led_matrix(8) & led_matrix(7) & led_matrix(6)
            & led_matrix(5) & led_matrix(4) & led_matrix(3)
            & led_matrix(2) & led_matrix(1) & led_matrix(0);

end architecture rtl;
