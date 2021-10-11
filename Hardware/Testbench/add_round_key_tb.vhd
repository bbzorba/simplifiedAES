library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity addroundkey_tb is
end;

architecture bench of addroundkey_tb is

  component addroundkey
  port(
  key_in : in std_logic_vector (15 downto 0);
  state_in : in  std_logic_vector (15 downto 0);
  state_out : out std_logic_vector (15 downto 0));
  end component;

  signal key_in: std_logic_vector (15 downto 0);
  signal state_in: std_logic_vector (15 downto 0);
  signal state_out: std_logic_vector (15 downto 0);

begin

  uut: addroundkey port map ( key_in    => key_in,
                              state_in  => state_in,
                              state_out => state_out );

stimulus: process
begin
	
	
	wait;
	
end process;


end;
  