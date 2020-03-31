library ieee;
use ieee.std_logic_1164.all;

entity mux1bit is
	port (
			x, y : in std_logic_vector(3 downto 0);
			sel : in std_logic;
			res : out std_logic_vector(3 downto 0)
		);
end entity;

architecture arch of mux1bit is
	
	begin
		process(sel, x, y)
			begin
				if sel = '0' then
					res <= x;
				elsif sel = '1' then
					res <= y;
				else
					null;
				end if;
				
		end process;
	
end architecture;