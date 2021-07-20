architecture rtl of bcd_to_7seg is

    constant c_zero: unsigned(3 downto 0) := "0000";
    constant c_one: unsigned(3 downto 0) := "0001";
    constant c_two: unsigned(3 downto 0) := "0010";
    constant c_three: unsigned(3 downto 0) := "0011";
    constant c_four: unsigned(3 downto 0) := "0100";
    constant c_five: unsigned(3 downto 0) := "0101";
    constant c_six: unsigned(3 downto 0) := "0110";
    constant c_seven: unsigned(3 downto 0) := "0111";
    constant c_eight: unsigned(3 downto 0) := "1000";
    constant c_nine: unsigned(3 downto 0) := "1001";

    constant d_zero : std_logic_vector (0 to 7) := "11111100";
    constant d_one : std_logic_vector (0 to 7) := "01100000";
    constant d_two : std_logic_vector (0 to 7) := "11011010";
    constant d_three : std_logic_vector (0 to 7) := "11110010";
    constant d_four : std_logic_vector (0 to 7) := "01100110";
    constant d_five : std_logic_vector (0 to 7) := "10110110";
    constant d_six : std_logic_vector (0 to 7) := "10111110";
    constant d_seven : std_logic_vector (0 to 7) := "11100000";
    constant d_eight : std_logic_vector (0 to 7) := "11111110";
    constant d_nine : std_logic_vector (0 to 7) := "11110110";
    constant d_off : std_logic_vector (0 to 7) := "00000000";


begin
    --Convert the binary coded decimal digits to the seven LEDS on the display

    bcd_converter : process( en, bcd )
    begin
        if (en = '1') THEN
            case( bcd ) is
                when c_zero => disp <= d_zero;
                when c_one => disp <= d_one;
                when c_two => disp <= d_two;
                when c_three => disp <= d_three;
                when c_four => disp <= d_four;
                when c_five => disp <= d_five;
                when c_six => disp <= d_six;
                when c_seven => disp <= d_seven;
                when c_eight => disp <= d_eight;
                when c_nine => disp <= d_nine;
                when others => disp <= d_off;
            end case ;
        else
            disp <= d_off;
        end if;
    end process ; -- bcd_converter

end architecture rtl;
