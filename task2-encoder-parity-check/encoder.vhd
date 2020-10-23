library ieee;
use ieee.std_logic_1164.all;

entity Encoder is
port(
		enable: in boolean;
		d: in std_logic_vector(3 downto 0);
		q: out std_logic_vector(1 downto 0)
	);
end;

Architecture Encoder4x2 of Encoder is
begin
	q <=	
			"ZZ" when not enable else
			"00" when d = "0001" else
			"01" when d = "0010" else
			"10" when d = "0100" else
			"11" when d = "1000" 
			else "ZZ"; --or (d = "0000") or (d = "0011") or (d = "0110") or (d = "1100") or (d = "1001") or (d = "1010")or (d = "0101") else
			
	
		 end;