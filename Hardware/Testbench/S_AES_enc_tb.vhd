
library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity S_AES_enc_tb is
end;

architecture bench of S_AES_enc_tb is

  component S_AES_enc
  Port ( plaintext : in  STD_LOGIC_VECTOR (15 downto 0);
  	 key : in  STD_LOGIC_VECTOR (15 downto 0);
  	 ciphertext : out STD_LOGIC_VECTOR (15 downto 0)
  		 );
  end component;

  signal clk : STD_LOGIC := '0';
  signal plaintext: STD_LOGIC_VECTOR (15 downto 0);
  signal key: STD_LOGIC_VECTOR (15 downto 0);
  signal ciphertext: STD_LOGIC_VECTOR (15 downto 0) ;
  signal encrypt_done : STD_LOGIC := '0';
  constant clock_period : time := 10 ns;
  
begin

  uut: S_AES_enc port map ( clk        => clk,
                            plaintext  => plaintext,
                            key        => key,
                            ciphertext => ciphertext );

clockproc: process
begin
	clk <= not clk;
	wait for clock_period/2;
end process;
									 
 stimulus: process
  begin
	 plaintext <= x"6f6b";
	 key <= x"a73b";
    wait;
  end process;
  
 check: process(ciphertext)
begin
if ciphertext = x"0738" then
	encrypt_done <= '1';
end if;

end process;


end;
