library ieee;
use ieee.std_logic_1164.all;

entity FourBitSynchDecadeCounter is
	port (Clk: in std_logic; Q0, Q1, Q2, Q3: out std_logic);
end entity FourBitSynchDecadeCounter;

architecture LogicOperation of FourBitSynchDecadeCounter is
	component jkff is
		port (J, K, Clk, rst: in std_logic; Q, Qb: out std_logic);
	end component jkff;
	
	signal J1, J2, J3: std_logic;
	signal X0, X1, X2, X3: std_logic;
	signal X0b, X1b, X2b, X3b: std_logic; 
	begin
	J1 <= X0 and X3b;
	J2 <= X1 and X0;
	J3 <= (X2 and J1) or (X1 and X3);
	
	Q0 <= X0;
	Q1 <= X1;
	Q2 <= X2;
	Q3 <= X3;
	
	FF0: jkff port map (J => '1', K => '1', rst => '0', Clk => Clk, Q => X0, Qb => X0b);
	FF1: jkff port map (J => J1, K => J1, rst => '0', Clk => Clk, Q => X1, Qb => X1b);
	FF2: jkff port map (J => J2, K => J2, rst => '0', Clk => Clk, Q => X2, Qb => X2b);
	FF3: jkff port map (J => J3, K => J3, rst => '0', Clk => Clk, Q => X3, Qb => X3b);
	
end architecture LogicOperation;