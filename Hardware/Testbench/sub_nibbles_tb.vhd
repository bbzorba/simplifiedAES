library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity sub_nibbles_tb is
end;

architecture bench of sub_nibbles_tb is

  component sub_nibbles
  port ( sub_nibbles_in : in std_logic_vector (15 downto 0);
         sub_nibbles_out : out std_logic_vector (15 downto 0));
  end component;

  signal sub_nibbles_in: std_logic_vector (15 downto 0);
  signal sub_nibbles_out: std_logic_vector (15 downto 0);

begin

  uut: sub_nibbles port map ( sub_nibbles_in  => sub_nibbles_in,
                              sub_nibbles_out => sub_nibbles_out );

stimulus: process
begin
 	wait for 10 ns;
   sub_nibbles_in <= x"ab23";
	wait for 10 ns;
	sub_nibbles_in <= x"1247";
	wait for 10 ns;
	sub_nibbles_in <= x"2cc1";
	wait for 10 ns;
	sub_nibbles_in <= x"3da2";
	wait for 10 ns;
	sub_nibbles_in <= x"4e0f";
	wait for 10 ns;
	sub_nibbles_in <= x"a27b";
   wait;
end process;


end;
  