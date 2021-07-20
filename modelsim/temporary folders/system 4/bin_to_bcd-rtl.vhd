architecture rtl of bin_to_bcd is
    --It is guaranteed that bin never exceeds two digits, i.e., 99.
    type conv_t is array(99 downto 0) of std_logic_vector(7 downto 0);
    function populate_conv_table return conv_t is
        variable table : conv_t;
        variable u_digit, l_digit : integer;
        variable u_digit_vec, l_digit_vec : std_logic_vector(3 downto 0);
    begin
        for i in 0 to 99 loop
            l_digit := i mod 10;
            u_digit := i / 10;
            l_digit_vec := std_logic_vector(to_unsigned(l_digit, 4));
            u_digit_vec := std_logic_vector(to_unsigned(u_digit, 4));
            table(i) := u_digit_vec & l_digit_vec;
        end loop;
        return table;
    end function populate_conv_table;
    constant conv_table : conv_t := populate_conv_table;
    signal converted : std_logic_vector(7 downto 0);
begin
    converted <= conv_table(to_integer(bin));
    l_bcd <= unsigned(converted(3 downto 0));
    u_bcd <= unsigned(converted(7 downto 4));
end architecture rtl;
