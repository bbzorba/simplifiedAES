library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity round2 is
    Port ( round2_in : in  STD_LOGIC_VECTOR (15 downto 0);
           round_key3_in : in  STD_LOGIC_VECTOR (15 downto 0);
           round2_out : out  STD_LOGIC_VECTOR (15 downto 0)
			  );
end round2;

architecture Behavioral of round2 is

component add_round_key is
port(
	round_key_in : in std_logic_vector (15 downto 0);
	state_in : in  std_logic_vector (15 downto 0);
	state_out : out std_logic_vector (15 downto 0));
end component;

component sub_nibbles is
port ( 
	sub_nibbles_in : in std_logic_vector (15 downto 0);
   sub_nibbles_out : out std_logic_vector (15 downto 0));
end component;

component shift_rows is
Port ( shift_rows_in : in  STD_LOGIC_VECTOR (15 downto 0);
       shift_rows_out : out  STD_LOGIC_VECTOR (15 downto 0));
end component;

signal sub_nibbles_out,shift_rows_out : std_logic_vector(15 downto 0);

begin

t1: sub_nibbles port map(round2_in,sub_nibbles_out);

t2: shift_rows port map(sub_nibbles_out,shift_rows_out);

t3: add_round_key port map(shift_rows_out,round_key3_in,round2_out);

end Behavioral;
