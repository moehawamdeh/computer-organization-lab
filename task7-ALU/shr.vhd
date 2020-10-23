library ieee;
use ieee.std_logic_1164.all;
use work.components.all;
entity shr is
	port( 	a: in std_logic_vector(N-1 downto 0);
				res: out std_logic_vector(N-1 downto 0)
			);
end;

architecture shr of shr is
	begin
	res<= '0'&a(N-1 downto 1);

end;