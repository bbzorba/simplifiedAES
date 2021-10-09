library ieee;
use ieee.std_logic_1164.all;

entity multby4 is
                port (
                               input_nibble : in std_logic_vector(3 downto 0);
                               output_nibble : out std_logic_vector(3 downto 0)
                );
end multby4;

architecture behavioral of multby4 is
                signal output_nibble_signal : std_logic_vector(3 downto 0);
begin

process (input_nibble)
begin
                               output_nibble_signal(3) <= input_nibble(1);
                               output_nibble_signal(2) <= input_nibble(0) XOR input_nibble(3);
      output_nibble_signal(1) <= input_nibble(2) XOR input_nibble(3);
                               output_nibble_signal(0) <= input_nibble(2);
                               
end process;

output_nibble <= output_nibble_signal;

end architecture behavioral;





