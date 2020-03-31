library ieee;
use ieee.std_logic_1164.all;

entity decoder7segmentos is
	port(
			number : in std_logic_vector(3 downto 0);
			Clr : in std_logic;
			Clk : in std_logic;
			Enable1, Enable2, Enable3, Enable4 : in std_logic;
			n1, n2, n3, n4 : out std_logic_vector(6 downto 0)
		);
end entity;

architecture behav of decoder7segmentos is

	component Mux4to1_Counter is
		port( 
				A1,B1,C1,D1,CLEAR: in std_logic;
				CLOCK: in std_logic;    
				CLOCK1: inout std_logic;
				MUX: out std_logic
			); 
	end component;
	
	component serialbcdmain is
		port (
			Imsb, Imsa, Ilsa, Ilsb : in std_logic;
			clock, reset : in std_logic;
			Omsb, Omsa, Olsa, Olsb : out std_logic
		);
	end component;
	
	component sevensegmentencoder is
		port(
			sel : in std_logic_vector(3 downto 0);
			A, B, C, D, E, F, G : out std_logic
		);
	end component;
	
	component DFFBox is
		port(D1, D2, D3, D4, D5, D6, D7, Clk, Enable: in std_logic; Q1, Q2, Q3, Q4, Q5, Q6, Q7 : out std_logic);
	end component;
	
	signal MUX, clk1 : std_logic;
	signal serialSignal : std_logic_vector(3 downto 0);
	signal sevenEncodersignal : std_logic_vector(6 downto 0);
	
	begin
	
	MUXC : Mux4to1_Counter port map(number(3), number(2), number(1), number(0), Clr, Clk, clk1, serialSignal(0));
	SERIAL : serialbcdmain port map(Imsb => serialSignal(3), Imsa => SerialSignal(2), Ilsa => SerialSignal(1), Ilsb => serialSignal(0), clock => clk1, reset => Clr, Omsa => serialSignal(3), Olsa => serialSignal(2) , Olsb => serialSignal(1));
	ENC : sevensegmentencoder port map(serialSignal, sevenEncodersignal(0), sevenEncodersignal(1), sevenEncodersignal(2), sevenEncodersignal(3), sevenEncodersignal(4), sevenEncodersignal(5), sevenEncodersignal(6));
	DFFBOX1 : DFFBox port map(sevenEncodersignal(4), sevenEncodersignal(3), sevenEncodersignal(2), sevenEncodersignal(6), sevenEncodersignal(5), sevenEncodersignal(0), sevenEncodersignal(1), Clk, Enable1, n1(0), n1(1), n1(2), n1(3), n1(4), n1(5), n1(6));
	DFFBOX2 : DFFBox port map(sevenEncodersignal(4), sevenEncodersignal(3), sevenEncodersignal(2), sevenEncodersignal(6), sevenEncodersignal(5), sevenEncodersignal(0), sevenEncodersignal(1), Clk, Enable2, n2(0), n2(1), n2(2), n2(3), n2(4), n2(5), n2(6));
	DFFBOX3 : DFFBox port map(sevenEncodersignal(4), sevenEncodersignal(3), sevenEncodersignal(2), sevenEncodersignal(6), sevenEncodersignal(5), sevenEncodersignal(0), sevenEncodersignal(1), Clk, Enable3, n3(0), n3(1), n3(2), n3(3), n3(4), n3(5), n3(6));
	DFFBOX4 : DFFBox port map(sevenEncodersignal(4), sevenEncodersignal(3), sevenEncodersignal(2), sevenEncodersignal(6), sevenEncodersignal(5), sevenEncodersignal(0), sevenEncodersignal(1), Clk, Enable4, n4(0), n4(1), n4(2), n4(3), n4(4), n4(5), n4(6));
	
end architecture;