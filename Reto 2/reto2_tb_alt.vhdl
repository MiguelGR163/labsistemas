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
	
	send_process: process
	begin
		RESET <= '0';
		wait for 10 ns;
		
		DATAread <= "0100110110";
		
		wait for 20 ns;
		
		RESET <= '1';
		wait for 10 ns;
		
		RESET <= '0';
		DATAread <= "1101100101";
		
		wait for 20 ns;
		
		RESET <= '1';
		wait for 10 ns;
	end process;
	
end architecture;
	
	