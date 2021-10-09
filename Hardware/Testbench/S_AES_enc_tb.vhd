
library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity S_AES_enc_tb is
end;

architecture bench of S_AES_enc_tb is

  component S_AES_enc
  Port ( clk : in  STD_LOGIC;
         plaintext : in  STD_LOGIC_VECTOR (15 downto 0);
  		 key : in  STD_LOGIC_VECTOR (15 downto 0);
  		 ciphertext : out STD_LOGIC_VECTOR (15 downto 0);
		 encyrption_done : out STD_LOGIC
  		 );
  end component;

  signal clk : STD_LOGIC := '0';
  signal plaintext: STD_LOGIC_VECTOR (15 downto 0);
  signal key: STD_LOGIC_VECTOR (15 downto 0);
  signal ciphertext: STD_LOGIC_VECTOR (15 downto 0) ;
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
    wait for 10 ns;
	 plaintext <= x"6f6b";
	 key <= x"a73b";
    wait;
  end process;


end;