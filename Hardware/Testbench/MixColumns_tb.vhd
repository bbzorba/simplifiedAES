library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity mixcolumns_tb is
end;

architecture bench of mixcolumns_tb is

component mixcolumns
Port ( mixIn : in  STD_LOGIC_VECTOR (15 downto 0);
       mixOut : out  STD_LOGIC_VECTOR (15 downto 0));
end component;

signal mixIn: STD_LOGIC_VECTOR (15 downto 0);
signal mixOut: STD_LOGIC_VECTOR (15 downto 0);

begin

uut: mixcolumns port map ( mixIn  => mixIn,
                           mixOut => mixOut );

stimulus: process
begin
   mixIn <= x"c916";
	-- output should be ECA2
	wait for 10 ns;
   wait;
end process;


end;