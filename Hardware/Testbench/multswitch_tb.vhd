library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity multswitch_tb is
end;

architecture bench of multswitch_tb is

  component multswitch
  	port (
  		input_nibble : in std_logic_vector(3 downto 0);
  		output_nibble : out std_logic_vector(3 downto 0)
  	);
  end component;

  signal input_nibble: std_logic_vector(3 downto 0);
  signal output_nibble: std_logic_vector(3 downto 0);
  
begin

  uut: multswitch port map ( input_nibble  => input_nibble,
                          output_nibble => output_nibble );

								  
  stimulus: process
begin
	wait for 10 ns;
   input_nibble <= "0000";
	wait for 10 ns;
	input_nibble <= "0001";
	wait for 10 ns;
	input_nibble <= "0010";
	wait for 10 ns;
	input_nibble <= "0011";
	wait for 10 ns;
	input_nibble <= "0100";
	wait for 10 ns;
	input_nibble <= "0101";
	wait for 10 ns;
	input_nibble <= "0110";
	wait for 10 ns;
	input_nibble <= "0111";
	wait for 10 ns;
	input_nibble <= "1000";
	wait for 10 ns;
	input_nibble <= "1001";
	wait for 10 ns;
	input_nibble <= "1010";
	wait for 10 ns;
	input_nibble <= "1011";
	wait for 10 ns;
	input_nibble <= "1100";
	wait for 10 ns;
	input_nibble <= "1101";
	wait for 10 ns;
	input_nibble <= "1110";
	wait for 10 ns;
	input_nibble <= "1111";
	wait;
end process;


end;
  