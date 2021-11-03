library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity S_AES_enc is
			
Port (   plaintext : in  STD_LOGIC_VECTOR (15 downto 0);
		 key : in  STD_LOGIC_VECTOR (15 downto 0);
		 ciphertext : out STD_LOGIC_VECTOR (15 downto 0)
		 );
end S_AES_enc;

architecture Behavioral of S_AES_enc is

component round1 is
    Port ( round1_in : in  STD_LOGIC_VECTOR (15 downto 0);
           round_key1_in : in  STD_LOGIC_VECTOR (15 downto 0);
			  round_key2_in : in  STD_LOGIC_VECTOR (15 downto 0);
           round1_out : out  STD_LOGIC_VECTOR (15 downto 0)
			  );
end component;

component round2 is
    Port ( round2_in : in  STD_LOGIC_VECTOR (15 downto 0);
           round_key3_in : in  STD_LOGIC_VECTOR (15 downto 0);
           round2_out : out  STD_LOGIC_VECTOR (15 downto 0)
			  );
end component;

signal round1_out: std_logic_vector (15 downto 0);
signal roundkey1 : std_logic_vector (15 downto 0) := x"a73b";
signal roundkey2 : std_logic_vector (15 downto 0) := x"1c27";
signal roundkey3 : std_logic_vector (15 downto 0) := x"7651";
signal cipher : STD_LOGIC_VECTOR (15 downto 0);
signal encrypt_done : STD_LOGIC := '0';

--signal rcon1 : std_logic_vector (7 downto 0):= x"80";
--signal rcon2 : std_logic_vector (7 downto 0):= x"30";

begin

o1: round1 port map(plaintext, roundkey1, roundkey2, round1_out);

o2: round2 port map(round1_out, roundkey3, cipher);

ciphertext <= cipher;

end Behavioral;
