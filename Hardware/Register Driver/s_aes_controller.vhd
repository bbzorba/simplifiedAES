library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity s_aes_controller is
    Port ( clk : in STD_LOGIC;
           plain_reg_in : in STD_LOGIC_VECTOR (15 downto 0);
           cipher_reg_out : out STD_LOGIC_VECTOR (15 downto 0));
end s_aes_controller;

architecture Behavioral of s_aes_controller is

component reg
    Port ( Clock : in STD_LOGIC;
           D : in STD_LOGIC_VECTOR(15 downto 0);
           Q : out STD_LOGIC_VECTOR(15 downto 0));
end component;

component S_AES_enc
			
Port (  plaintext : in  STD_LOGIC_VECTOR (15 downto 0);
		 key : in  STD_LOGIC_VECTOR (15 downto 0);
		 ciphertext : out STD_LOGIC_VECTOR (15 downto 0)
		 );
end component;

signal plain_reg_out, cipher_reg_in, key : std_logic_vector (15 downto 0); 

begin

G1: reg port map (clk, plain_reg_in, plain_reg_out);
G2: S_AES_enc port map (plain_reg_out, key, cipher_reg_in);
G3: reg port map (clk, cipher_reg_in, cipher_reg_out);

end Behavioral;
