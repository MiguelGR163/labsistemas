library ieee;
use ieee.std_logic_1164.all;

entity decoder7segmentos_tb is
end entity;

architecture behav of decoder7segmentos_tb is
	
	component decoder7segmentos is
		port(
			number : in std_logic_vector(3 downto 0);
			Clr : in std_logic;
			Clk : in std_logic;
			Enable1, Enable2, Enable3, Enable4 : in std_logic;
			n1, n2, n3, n4 : out std_logic_vector(6 downto 0)
		);
	end component;
	
	signal num : std_logic_vector(3 downto 0);
	signal Clr : std_logic := '0';
	signal Clk : std_logic;
	signal e1 : std_logic := '1';
	signal e2 : std_logic := '1';
	signal e3 : std_logic := '1';
	signal e4 : std_logic := '1';
	signal no1, no2, no3, no4 : std_logic_vector(6 downto 0);
	
	begin
	
	SEVEN : decoder7segmentos port map (num, Clr, Clk, e1, e2, e3, e4, no1, no2, no3, no4);
	
	
	clk_process : process
	begin
	clk <= '0';
	wait for 1 ps;
	clk <= '1';
	wait for 1 ps;
	end process;
	
	behav_process : process
	begin
	
	num <= "0000";
	wait for 5 ps;
	Clr <= '1';
	wait for 5 ps;
	Clr <= '0';
	wait for 5 ps;
	e1 <= '0';
	e2 <= '0';
	e3 <= '0';
	e4 <= '0';
	wait for 5 ns;
	
	num <= "0010";
	wait for 5 ps;
	Clr <= '1';
	wait for 5 ps;
	Clr <= '0';
	wait for 5 ps;
	e4 <= '1';
	wait for 5 ps;
	e4 <= '0';
	wait for 5 ns;
	
	num <= "0110";
	wait for 5 ps;
	Clr <= '1';
	wait for 5 ps;
	Clr <= '0';
	wait for 5 ps;
	e3 <= '1';
	wait for 5 ps;
	e3 <= '0';
	wait for 5 ns;
	
	num <= "0011";
	wait for 5 ps;
	Clr <= '1';
	wait for 5 ps;
	Clr <= '0';
	wait for 5 ps;
	e1 <= '1';
	wait for 5 ps;
	e1 <= '0';
	wait for 5 ns;
	
	end process;
end architecture;