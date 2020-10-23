library ieee;
use ieee.std_logic_1164.all;
use work.components.all;
entity shl is
	port( 	a: in std_logic_vector(N-1 downto 0);
				res: out std_logic_vector(N-1 downto 0)
			);
end;

architecture shl of shl is
	begin
	res<= a(N-2 downto 0)&'0';

end;