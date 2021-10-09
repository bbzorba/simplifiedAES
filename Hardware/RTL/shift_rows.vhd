library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity shift_rows is
Port ( shift_rows_in : in  STD_LOGIC_VECTOR (15 downto 0);
       shift_rows_out : out  STD_LOGIC_VECTOR (15 downto 0));
end shift_rows;

architecture Behavioral of shift_rows is
	
	signal nibble0,nibble1,nibble2,nibble3 : std_logic_vector(3 downto 0);

begin

nibble0 <= shift_rows_in(3 downto 0);	 
nibble1 <= shift_rows_in(7 downto 4);	 
nibble2 <= shift_rows_in(11 downto 8); 
nibble3 <= shift_rows_in(15 downto 12);	 

shift_rows_out <= nibble3 & nibble0 & nibble1 & nibble2;	

end Behavioral;