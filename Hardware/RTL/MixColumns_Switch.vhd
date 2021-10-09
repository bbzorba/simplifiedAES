library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mixcolumns_switch is
Port ( mixIn : in  STD_LOGIC_VECTOR (15 downto 0);
       mixOut : out  STD_LOGIC_VECTOR (15 downto 0));
end mixcolumns_switch;


architecture Behavioral of mixcolumns_switch is
signal nibblein0, nibblein1, nibblein2, nibblein3, nibbleout0, nibbleout1, nibbleout2, nibbleout3 : std_logic_vector(3 downto 0);

component multswitch is
	port (
		input_nibble : in std_logic_vector(3 downto 0);
		output_nibble : out std_logic_vector(3 downto 0)
	);
end component;
 
begin

nibblein0 <= mixIn(3 downto 0);
nibblein1 <= mixIn(7 downto 4);
nibblein2 <= mixIn(11 downto 8);
nibblein3 <= mixIn(15 downto 12);

	z0: multswitch port map(nibblein0, nibbleout0);
	z1: multswitch port map(nibblein1, nibbleout1);
	z2: multswitch port map(nibblein2, nibbleout2);
	z3: multswitch port map(nibblein3, nibbleout3);
	
	mixOut(3 downto 0) <= nibblein0 XOR nibbleout1;
	mixOut(7 downto 4) <= nibbleout0 XOR nibblein1;
	mixOut(11 downto 8) <= nibblein2 XOR nibbleout3;
	mixOut(15 downto 12) <= nibbleout2 XOR nibblein3;
	
end Behavioral;

