library ieee;
use ieee.std_logic_1164.all;

entity decadeC_tb is
end decadeC_tb;

architecture behav of decadeC_tb is
	component FourBitSynchDecadeCounter is
		port (Clk: in std_logic; Q0, Q1, Q2, Q3: out std_logic);
	end component FourBitSynchDecadeCounter;
	
	signal Clk, Q0, Q1, Q2, Q3 : std_logic := '0';
	
	constant clk_period : time := 10 ns;
	
	begin
	
	counter: FourBitSynchDecadeCounter port map (Clk => Clk, Q0 => Q0, Q1 => Q1, Q2 => Q2, Q3 => Q3);
	
	clk_process :process
	begin
	clk <= '0';
	wait for clk_period/2;
	clk <= '1';
	wait for clk_period/2;
	end process;
	
end architecture behav;
	