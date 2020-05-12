library ieee;
use ieee.std_logic_1164.all;

entity calcmcm_tb is
end entity;

architecture arch of calcmcm_tb is

	component calcmcm is
		port(
			Clk: in std_logic;
			X_i, Y_i: in std_logic_vector(3 downto 0);
			Data_o: out std_logic_vector(3 downto 0)
		);
	end component;
	
	signal Clk: std_logic;
	signal X_i, Y_i, Data_o: std_logic_vector(3 downto 0);
	
	begin
	
	MCM: calcmcm port map(Clk, X_i, Y_i, Data_o);
	
	clk_process: process
	begin
		Clk <= '0';
		wait for 5 ns;
		Clk <= '1';
		wait for 5 ns;
	end process;
	
	behav_process: process
	begin
		X_i <= "0010";
		Y_i <= "1000";
		wait for 1000 ns;
	end process;
	
end architecture;