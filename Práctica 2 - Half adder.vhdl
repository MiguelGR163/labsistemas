library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
 
entity half_adder is
  port (
    bit1  : in std_logic;
    bit2  : in std_logic;
    sum   : out std_logic;
    carry : out std_logic
    );
end half_adder;
 
architecture proceso of half_adder is
begin
  sum   <= bit1 xor bit2;
  carry <= bit1 and bit2;
end proceso;