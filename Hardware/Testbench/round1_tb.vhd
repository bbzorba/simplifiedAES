library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity round1_tb is
end;

architecture bench of round1_tb is

component round1 is
    Port ( round1_in : in  STD_LOGIC_VECTOR (15 downto 0);
           round_key1_in : in  STD_LOGIC_VECTOR (15 downto 0);
			  round_key2_in : in  STD_LOGIC_VECTOR (15 downto 0);
           round1_out : out  STD_LOGIC_VECTOR (15 downto 0)
			  );
end component;

signal round1_in,round_key1_in,round_key2_in,round1_out : STD_LOGIC_VECTOR (15 downto 0);

begin

uut: round1 port map ( round1_in,round_key1_in,round_key2_in,round1_out);

stimulus: process
begin
   wait for 10 ns;
	round1_in <= x"6f6b";
	round_key1_in <= x"a73b";
	round_key2_in <= x"1c27";
	-- output should be F085
	wait for 10 ns;
   wait;
end process;


end;