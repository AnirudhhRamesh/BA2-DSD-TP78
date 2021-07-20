architecture rtl of light_manager is

    SIGNAL s_n_L1_red, s_n_L1_yellow, s_n_L1_green, s_n_L2_red, s_n_L2_yellow, s_n_L2_green, s_n_L3_red, s_n_L3_green, s_n_L4_red, s_n_L4_green : std_logic;
    SIGNAL s_r_L1_red, s_r_L1_yellow, s_r_L1_green, s_r_L2_red, s_r_L2_yellow, s_r_L2_green, s_r_L3_red, s_r_L3_green, s_r_L4_red, s_r_L4_green : std_logic;

    SIGNAL s_n_L3_countdown, s_n_L4_countdown : unsigned(3 downto 0);
    SIGNAL s_r_L3_countdown, s_r_L4_countdown : unsigned(3 downto 0);

    COMPONENT light_manager_normal IS
    generic(
        t1 : unsigned(8 downto 0);
        t2 : unsigned(8 downto 0);
        ty : unsigned(8 downto 0));
    port(
        cycle_time : in unsigned(8 downto 0);
        -- Elapsed time (in seconds) in the current traffic cycle.
        L1_red, L1_yellow, L1_green, L2_red, L2_yellow, L2_green, L3_red, L3_green, L4_red, L4_green : out std_logic;
        -- Whether each lamp is bright or dim.
        L3_countdown, L4_countdown : out unsigned(3 downto 0));
        -- Countdown values for L3 and L4.
    END COMPONENT;

    COMPONENT light_manager_rush IS
    generic(
        t3 : unsigned(8 downto 0);
        t4 : unsigned(8 downto 0);
        t5 : unsigned(8 downto 0);
        ty : unsigned(8 downto 0));
    port(
        cycle_time : in unsigned(8 downto 0);
        -- Elapsed time (in seconds) in the current traffic cycle.
        L1_red, L1_yellow, L1_green, L2_red, L2_yellow, L2_green, L3_red, L3_green, L4_red, L4_green : out std_logic;
        -- Whether each lamp is bright or dim.
        L3_countdown, L4_countdown : out unsigned(3 downto 0));
        -- Countdown values for L3 and L4.
    END COMPONENT;
begin
    --Combine the light_manager_normal and light_manager_rush here using a generoic map and port map

    --Instantiate normal light manager
    lmn_1 : light_manager_normal
        GENERIC MAP (
            t1 => t1,
            t2 => t2,
            ty => ty )
        PORT MAP (
            cycle_time => cycle_time,
            L1_red => s_n_L1_red,
            L1_yellow => s_n_L1_yellow,
            L1_green => s_n_L1_green,

            L2_red => s_n_L2_red,
            L2_yellow => s_n_L2_yellow,
            L2_green => s_n_L2_green,

            L3_red => s_n_L3_red,
            L3_green => s_n_L3_green,

            L4_red => s_n_L4_red,
            L4_green => s_n_L4_green, 
            
            L3_countdown => s_n_L3_countdown,
            L4_countdown => s_n_L4_countdown );


    lmr_1 : light_manager_rush
    GENERIC MAP (
        t3 => t3,
        t4 => t4,
        t5 => t5,
        ty => ty )
    PORT MAP (
        cycle_time => cycle_time,
        L1_red => s_r_L1_red,
        L1_yellow => s_r_L1_yellow,
        L1_green => s_r_L1_green,

        L2_red => s_r_L2_red,
        L2_yellow => s_r_L2_yellow,
        L2_green => s_r_L2_green,

        L3_red => s_r_L3_red,
        L3_green => s_r_L3_green,

        L4_red => s_r_L4_red,
        L4_green => s_r_L4_green, 
        
        L3_countdown => s_r_L3_countdown ,
        L4_countdown => s_r_L4_countdown );

    L1_red <= s_r_L1_red when (is_rush_hour = '1') else s_n_L1_red;
    L1_yellow <= s_r_L1_yellow when (is_rush_hour = '1') else s_n_L1_yellow;
    L1_green <= s_r_L1_green when (is_rush_hour = '1') else s_n_L1_green;

    L2_red <= s_r_L2_red when (is_rush_hour = '1') else s_n_L2_red;
    L2_yellow <= s_r_L2_yellow when (is_rush_hour = '1') else s_n_L2_yellow;
    L2_green <= s_r_L2_green when (is_rush_hour = '1') else s_n_L2_green;
    
    L3_red <= s_r_L3_red when (is_rush_hour = '1') else s_n_L3_red;
    L3_green <= s_r_L3_green when (is_rush_hour = '1') else s_n_L3_green;

    L4_red <= s_r_L4_red when (is_rush_hour = '1') else s_n_L4_red;
    L4_green <= s_r_L4_green when (is_rush_hour = '1') else s_n_L4_green;

    L3_countdown <= s_n_L3_countdown when (is_rush_hour = '1') else s_n_L3_countdown;
    L4_countdown <= s_n_L4_countdown when (is_rush_hour = '1') else s_n_L4_countdown;

end architecture rtl;
