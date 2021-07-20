--LED driving module.
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity led_driver is
port(L1_red, L1_yellow, L1_green, L2_red, L2_yellow, L2_green, L3_red, L3_green, L4_red, L4_green : in std_logic;
     -- Whether each lamp is bright or dim.
     blink, is_rush_hour : in std_logic;
     -- Blinking signal and rush-hour indicator.
     leds : out std_logic_vector(0 to 107));
     -- Row-major LED matrix.
end entity led_driver;
