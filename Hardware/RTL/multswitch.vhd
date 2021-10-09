library ieee;
use ieee.std_logic_1164.all;

entity multswitch is
    port (
       input_nibble : in std_logic_vector(3 downto 0);
       output_nibble : out std_logic_vector(3 downto 0)
                );
end multswitch;

architecture behavioral of multswitch is
   signal output_nibble_signal : std_logic_vector(3 downto 0);
begin

process (input_nibble)
begin
	case input_nibble is	 
	
		when x"0" => output_nibble_signal <= x"0";
		when x"1" => output_nibble_signal <= x"4";
		when x"2" => output_nibble_signal <= x"8";
		when x"3" => output_nibble_signal <= x"c";
		when x"4" => output_nibble_signal <= x"3";
		when x"5" => output_nibble_signal <= x"7";
		when x"6" => output_nibble_signal <= x"b";
		when x"7" => output_nibble_signal <= x"f";
		when x"8" => output_nibble_signal <= x"6";
		when x"9" => output_nibble_signal <= x"2";
		when x"a" => output_nibble_signal <= x"e";
		when x"b" => output_nibble_signal <= x"a";
		when x"c" => output_nibble_signal <= x"5";
		when x"d" => output_nibble_signal <= x"1";
		when x"e" => output_nibble_signal <= x"d";
		when x"f" => output_nibble_signal <= x"9";
		when others => output_nibble_signal <= x"0";
	end case;

end process;

output_nibble <= output_nibble_signal;

end architecture behavioral;