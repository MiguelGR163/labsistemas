library ieee;
use ieee.std_logic_1164.all;
use std.textio.all;

entity lcd_tb is
end entity;

architecture  behav of lcd_tb is
	component lcd is
		port(
			CLK, RESET, RSin, RWin: in std_logic;
			DATAin: in std_logic_vector(7 downto 0);
			RS, RW, EN: out std_logic;
			DATA: out std_logic_vector(7 downto 0)
		);
	end component;
	
	signal CLK, RESET, RS, RW, EN: std_logic;
	signal DATA: std_logic_vector(7 downto 0);
	signal DATAread : std_logic_vector(9 downto 0);
	file f: text;
	
	begin
	
	LCD1: lcd port map(CLK, RESET, DATAread(0), DATAread(1), DATAread(9 downto 2), RS, RW, EN, DATA);
	
	clk_process: process
	begin
		CLK <= '0';
		wait for 5 ns;
		CLK <= '1';
		wait for 5 ns;
	end process;
	
	leer: process
	
	variable l : line;
	variable status : file_open_status;
	variable i : string(1 to 10);
	
	begin
	
	file_open(status, f, "lcd.txt", read_mode);
		
		readline(f, l);
		read(l, i);
		
		
		file_close(f);
		
		if i(1) = '1' then DATAread(9) <= '1';
		else DATAread(9) <= '0';
		end if;
		
		if i(2) = '1' then DATAread(8) <= '1';
		else DATAread(8) <= '0';
		end if;
		
		if i(3) = '1' then DATAread(7) <= '1';
		else DATAread(7) <= '0';
		end if;
		
		if i(4) = '1' then DATAread(6) <= '1';
		else DATAread(6) <= '0';
		end if;
		
		if i(5) = '1' then DATAread(5) <= '1';
		else DATAread(5) <= '0';
		end if;
		
		if i(6) = '1' then DATAread(4) <= '1';
		else DATAread(4) <= '0';
		end if;
		
		if i(7) = '1' then DATAread(3) <= '1';
		else DATAread(3) <= '0';
		end if;
		
		if i(8) = '1' then DATAread(2) <= '1';
		else DATAread(2) <= '0';
		end if;
		
		if i(9) = '1' then DATAread(1) <= '1';
		else DATAread(1) <= '0';
		end if;
		
		if i(10) = '1' then DATAread(0) <= '1';
		else DATAread(0) <= '0';
		end if;
		
	end process;
	
end architecture;
	
	