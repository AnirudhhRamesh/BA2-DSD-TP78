architecture rtl of system is
    signal cycle_time : unsigned(8 downto 0);
    signal blink, is_rush_hour, pulse : std_logic;
    signal L1_red, L1_yellow, L1_green, L2_red, L2_yellow, L2_green, L3_red, L3_green, L4_red, L4_green : std_logic;
    signal cycle_tens, cycle_ones : unsigned(3 downto 0);

    signal s_L3_countdown, s_L4_countdown : unsigned (3 downto 0);

    -- TODO: Instantiate the other modules to provide signals cycle_time, blink, is_rush_hour,
    --       L1_red, ... L4_green, etc.
    COMPONENT clock_divider is
        generic(
            ticks_per_second : unsigned(31 downto 0));
        port(
            clk   : in std_logic;
            -- System clock.
            reset : in std_logic;
            -- System reset.
            pulse : out std_logic;
            -- A pulse signal that is 1 for one cycle at the end of each second.
            blink : out std_logic);
            -- A blinking signal that is 1 for the first half of each second and 0 for the second half.
    END COMPONENT;

    COMPONENT cycle_manager is
        generic(
            r1 : unsigned(8 downto 0);
            r2 : unsigned(8 downto 0);
            r3 : unsigned(8 downto 0);
            r4 : unsigned(8 downto 0);
            cn : unsigned(8 downto 0);
            cr : unsigned(8 downto 0);
            d  : unsigned(8 downto 0));
        port(
            clk          : in std_logic;
            -- System clock.
            reset        : in std_logic;
            -- System reset.
            pulse        : in std_logic;
            -- A pulse signal that is 1 for one cycle at the end of each second.
            is_rush_hour : out std_logic;
            -- Is it rush hour currently?
            cycle_time   : out unsigned(8 downto 0));
            -- Elapsed time (in seconds) in the current traffic cycle.
    END COMPONENT;

    COMPONENT light_manager is
        generic(
            t1 : unsigned(8 downto 0);
            t2 : unsigned(8 downto 0);
            t3 : unsigned(8 downto 0);
            t4 : unsigned(8 downto 0);
            t5 : unsigned(8 downto 0);
            ty : unsigned(8 downto 0));
        port(
            is_rush_hour : in std_logic;
            -- Is it rush hour currently?
            cycle_time   : in unsigned(8 downto 0);
            -- Elapsed time (in seconds) in the current traffic cycle.
            L1_red, L1_yellow, L1_green, L2_red, L2_yellow, L2_green, L3_red, L3_green, L4_red, L4_green : out std_logic;
            -- Whether each lamp is bright or dim.
            L3_countdown, L4_countdown : out unsigned(3 downto 0));
            -- Countdown values for L3 and L4.
    END COMPONENT;
begin

    clock_div : clock_divider
        GENERIC MAP (
            ticks_per_second => param_ticks_per_second
        )
        PORT MAP (
            clk => clk,
            reset => reset,
            pulse => pulse,
            blink => blink
        );
    
    cycle_man : cycle_manager
        GENERIC MAP (
            r1 => param_r1,
            r2 => param_r2,
            r3 => param_r3,
            r4 => param_r4,
            cn => param_cn,
            cr => param_cr,
            d => param_d
        )
        PORT MAP (
            clk => clk,
            reset => reset,
            pulse => pulse,
            is_rush_hour => is_rush_hour,
            cycle_time => cycle_time
        );
    
    light_man : light_manager
        GENERIC MAP (
            t1 => param_t1,
            t2 => param_t2,
            t3 => param_t3,
            t4 => param_t4,
            t5 => param_t5,
            ty => param_ty
        )
        PORT MAP (
            is_rush_hour => is_rush_hour,
            cycle_time => cycle_time,
            
            L1_red => L1_red,
            L1_yellow => L1_yellow,
            L1_green => L1_green,

            L2_red => L2_red,
            L2_yellow => L2_yellow,
            L2_green => L2_green,

            L3_red => L3_red,
            L3_green => L3_green,

            L4_red => L4_red,
            L4_green => L4_green, 
            
            L3_countdown => s_L3_countdown,
            L4_countdown => s_L4_countdown
        );

    -- Map to the LEDs on the board.
    leddrv:entity work.led_driver(rtl)
    port map(blink        => blink,
             is_rush_hour => is_rush_hour,
             L1_red       => L1_red,
             L1_yellow    => L1_yellow,
             L1_green     => L1_green,
             L2_red       => L2_red,
             L2_yellow    => L2_yellow,
             L2_green     => L2_green,
             L3_red       => L3_red,
             L3_green     => L3_green,
             L4_red       => L4_red,
             L4_green     => L4_green,
             leds         => leds);

    -- Transform cycle_time to two decimal digits
    bcd:entity work.bin_to_bcd(rtl)
    port map(bin   => cycle_time(7 downto 0),
             l_bcd => cycle_ones,
             u_bcd => cycle_tens);

    -- Decode the countdown value to drive the seven-segment displays.
    decode1:entity work.bcd_to_7seg(rtl)
    port map(en   => '1',
             bcd  => cycle_tens,
             disp => disp_tens);
    decode2:entity work.bcd_to_7seg(rtl)
    port map(en   => '1',
             bcd  => cycle_ones,
             disp => disp_ones);

    -- TODO: Instantiate the other two 7seg decoders and connect them to the countdowns for L3 and L4
    decode3:entity work.bcd_to_7seg(rt1)
    port map(
        en => L3_green,
        bcd => s_L3_countdown,
        disp => disp_L3
        );

    decode4:entity work.bcd_to_7seg(rt1)
    port map(
        en => L4_green,
        bcd => s_L4_countdown,
        disp => disp_L4
    );

end architecture rtl;
