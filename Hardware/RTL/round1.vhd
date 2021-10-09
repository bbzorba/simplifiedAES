library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity round1 is
    Port ( round1_in : in  STD_LOGIC_VECTOR (15 downto 0);
           round_key1_in : in  STD_LOGIC_VECTOR (15 downto 0);
			  round_key2_in : in  STD_LOGIC_VECTOR (15 downto 0);
           round1_out : out  STD_LOGIC_VECTOR (15 downto 0)
			  );
end round1;

architecture Behavioral of round1 is

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

component mix_columns is
Port ( mixIn : in  STD_LOGIC_VECTOR (15 downto 0);
       mixOut : out  STD_LOGIC_VECTOR (15 downto 0));
end component;

signal add_round_key_out, sub_nibbles_out,shift_rows_out,mixOut : std_logic_vector(15 downto 0);

begin

--w0 : round_key_gen

w0: add_round_key port map(round_key1_in,round1_in,add_round_key_out);

w1: sub_nibbles port map(add_round_key_out,sub_nibbles_out);

w2: shift_rows port map(sub_nibbles_out,shift_rows_out);

w3: mix_columns port map(shift_rows_out,mixOut);

w4: add_round_key port map(mixOut,round_key2_in,round1_out);

end Behavioral;
