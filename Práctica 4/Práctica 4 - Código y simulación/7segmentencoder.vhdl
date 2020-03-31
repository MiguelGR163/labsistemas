library ieee;
use ieee.std_logic_1164.all;

entity sevensegmentencoder is
	port(
			sel : in std_logic_vector(3 downto 0);
			A, B, C, D, E, F, G : out std_logic
		);
end entity;

architecture behav of sevensegmentencoder is
	component decoder is
		port (
			sel : in std_logic_vector(3 downto 0);
			r : out std_logic_vector(15 downto 0)
		);
	end component;
	
	signal decoderOut : std_logic_vector(15 downto 0);
	
	begin
		
		DEC: decoder port map(sel, decoderOut);
		
		A <= decoderOut(0) or decoderOut(2) or decoderOut(3) or decoderOut(5) or decoderOut(6) or decoderOut(7) or decoderOut(8) or decoderOut(9);
		B <= decoderOut(0) or decoderOut(1) or decoderOut(3) or decoderOut(4) or decoderOut(7) or decoderOut(8) or decoderOut(9) or decoderOut(2);
		C <= decoderOut(0) or decoderOut(1) or decoderOut(3) or decoderOut(4) or decoderOut(5) or decoderOut(6) or decoderOut(7) or decoderOut(8) or decoderOut(9);
		D <= decoderOut(0) or decoderOut(2) or decoderOut(3) or decoderOut(5) or decoderOut(6) or decoderOut(8);
		E <= decoderOut(0) or decoderOut(2) or decoderOut(6) or decoderOut(8);
		F <= decoderOut(0) or decoderOut(4) or decoderOut(5) or decoderOut(6) or decoderOut(7) or decoderOut(8) or decoderOut(9);
		G <= decoderOut(2) or decoderOut(3) or decoderOut(4) or decoderOut(5) or decoderOut(6) or decoderOut(8) or decoderOut(9);
		
end architecture;
	