library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity sub_nibbles is
port ( sub_nibbles_in : in std_logic_vector (15 downto 0);
       sub_nibbles_out : out std_logic_vector (15 downto 0));
end sub_nibbles;

architecture Behavioral of sub_nibbles is

component sbox is
port (sboxin : in std_logic_vector(3 downto 0);
		sboxout : out std_logic_vector(3 downto 0)); 
end component;

begin

q1 : sbox port map (sub_nibbles_in(15 downto 12),sub_nibbles_out(15 downto 12)); 
q2 : sbox port map (sub_nibbles_in(11 downto 8),sub_nibbles_out(11 downto 8)); 
q3 : sbox port map (sub_nibbles_in(7 downto 4),sub_nibbles_out(7 downto 4)); 
q4 : sbox port map (sub_nibbles_in(3 downto 0),sub_nibbles_out(3 downto 0)); 

end Behavioral;