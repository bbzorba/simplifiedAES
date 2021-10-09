library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity shift_rows_tb is
end;

architecture bench of shift_rows_tb is

component shift_rows is
Port ( shift_rows_in : in  STD_LOGIC_VECTOR (15 downto 0);
       shift_rows_out : out  STD_LOGIC_VECTOR (15 downto 0));
end component;

signal shift_rows_in: STD_LOGIC_VECTOR (15 downto 0);
signal shift_rows_out: STD_LOGIC_VECTOR (15 downto 0);

begin

uut: shift_rows port map ( shift_rows_in  => shift_rows_in,
                           shift_rows_out => shift_rows_out );

stimulus: process
begin
   shift_rows_in <= x"c619";
	-- output should be C916
	wait for 10 ns;
   wait;
end process;


end;