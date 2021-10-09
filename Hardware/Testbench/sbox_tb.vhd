library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity sbox_tb is
end;

architecture bench of sbox_tb is

  component sbox
  port (sboxin : in std_logic_vector(3 downto 0);
  		sboxout : out std_logic_vector(3 downto 0));
  end component;

  signal sboxin: std_logic_vector(3 downto 0);
  signal sboxout: std_logic_vector(3 downto 0);

begin

  uut: sbox port map ( sboxin  => sboxin,
                       sboxout => sboxout );

  stimulus: process
  begin
	wait for 10 ns;
   sboxin <= "0000";
	wait for 10 ns;
	sboxin <= "0001";
	wait for 10 ns;
	sboxin <= "0010";
	wait for 10 ns;
	sboxin <= "0011";
	wait for 10 ns;
	sboxin <= "0100";
	wait for 10 ns;
	sboxin <= "0101";
	wait for 10 ns;
	sboxin <= "0110";
	wait for 10 ns;
	sboxin <= "0111";
	wait for 10 ns;
	sboxin <= "1000";
	wait for 10 ns;
	sboxin <= "1001";
	wait for 10 ns;
	sboxin <= "1010";
	wait for 10 ns;
	sboxin <= "1011";
	wait for 10 ns;
	sboxin <= "1100";
	wait for 10 ns;
	sboxin <= "1101";
	wait for 10 ns;
	sboxin <= "1110";
	wait for 10 ns;
	sboxin <= "1111";
	wait;
    wait;
  end process;


end;