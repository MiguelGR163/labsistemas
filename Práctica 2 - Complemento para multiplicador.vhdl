library ieee;
use ieee.std_logic_1164.ALL;


entity Ripple_Adder is
		port ( 
            A:      in  std_logic_vector (3 downto 0);
            B:      in  std_logic_vector (3 downto 0);
            Cin:    in  std_logic;
            S:      out std_logic_vector (3 downto 0);
           Cout:    out std_logic
        );
end Ripple_Adder;

architecture Behavioral of Ripple_Adder is
 
	component full_adder
		Port (
			A : in std_logic;
			B : in std_logic;
			Cin : in std_logic;
			S : out std_logic;
			Cout : out std_logic);
	end component;
 
	signal c1,c2,c3: std_logic;
 
	begin

		FA1: full_adder port map( A(0), B(0), Cin, S(0), c1);
		FA2: full_adder port map( A(1), B(1), c1, S(1), c2);
		FA3: full_adder port map( A(2), B(2), c2, S(2), c3);
		FA4: full_adder port map( A(3), B(3), c3, S(3), Cout);
		
end Behavioral;

