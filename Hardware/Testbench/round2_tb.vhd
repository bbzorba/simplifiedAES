library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity round2_tb is
end;

architecture bench of round2_tb is

component round2 is
    Port ( round2_in : in  STD_LOGIC_VECTOR (15 downto 0);
           round_key3_in : in  STD_LOGIC_VECTOR (15 downto 0);
           round2_out : out  STD_LOGIC_VECTOR (15 downto 0)
			  );
end component;

signal round2_in,round_key3_in,round2_out : STD_LOGIC_VECTOR (15 downto 0);

begin

uut: round2 port map ( round2_in,round_key3_in,round2_out);

stimulus: process
begin
   wait for 10 ns;
	round2_in <= x"f085";
	round_key3_in <= x"7651";
	-- output should be 0738
	wait for 10 ns;
   wait;
end process;


end;