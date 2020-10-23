library ieee;
use ieee.std_logic_1164.all;
use work.components.all;
entity Nxor is
	port( 	a,b: in std_logic_vector(N-1 downto 0);
				res: out std_logic_vector(N-1 downto 0)
			);
end;

architecture Nxor of Nxor is
	begin
	res<= a xor b;

end;