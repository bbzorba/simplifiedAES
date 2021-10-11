library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity add_round_key is
port(
round_key_in : in std_logic_vector (15 downto 0);
state_in : in  std_logic_vector (15 downto 0);
state_out : out std_logic_vector (15 downto 0));
end add_round_key;

architecture Behavioral of add_round_key is

begin
state_out <= round_key_in xor state_in;

end Behavioral;