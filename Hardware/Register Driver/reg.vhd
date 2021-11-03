
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity reg is
    Port ( Clock : in STD_LOGIC;
           D : in STD_LOGIC_VECTOR(15 downto 0);
           Q : out STD_LOGIC_VECTOR(15 downto 0));
end reg;

architecture Behavioral of reg is

begin

proc1: process (Clock)
begin
    if rising_edge(Clock) then
        Q <= D;
    end if;
end process;

end Behavioral;
