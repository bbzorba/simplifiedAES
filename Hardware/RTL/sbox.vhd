library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sbox is
port (sboxin : in std_logic_vector(3 downto 0);
		sboxout : out std_logic_vector(3 downto 0));
end sbox;

architecture Behavioral of sbox is

signal sbox_out_signal : std_logic_vector(3 downto 0);

begin

process(sboxin)	
begin

case sboxin is
		when x"0" => sbox_out_signal <= x"9";
		when x"1" => sbox_out_signal <= x"4";
		when x"2" => sbox_out_signal <= x"a";
		when x"3" => sbox_out_signal <= x"b";
		when x"4" => sbox_out_signal <= x"d";
		when x"5" => sbox_out_signal <= x"1";
		when x"6" => sbox_out_signal <= x"8";
		when x"7" => sbox_out_signal <= x"5";
		when x"8" => sbox_out_signal <= x"6";
		when x"9" => sbox_out_signal <= x"2";
		when x"a" => sbox_out_signal <= x"0";
		when x"b" => sbox_out_signal <= x"3";
		when x"c" => sbox_out_signal <= x"c";
		when x"d" => sbox_out_signal <= x"e";
		when x"e" => sbox_out_signal <= x"f";
		when x"f" => sbox_out_signal <= x"7";
		when others => sbox_out_signal <= x"0";

end case;

end process;

sboxout <= sbox_out_signal;

end Behavioral;
