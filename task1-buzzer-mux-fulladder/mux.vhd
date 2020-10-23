library ieee;
use ieee.std_logic_1164.all;

entity MUX is 
 port(sel: in std_logic_vector(1 downto 0);
		d: in std_logic_vector(3 downto 0);
		q: out std_logic
		);
end MUX;

architecture MUX of MUX is
begin
	q <= ( ((d(0)) and (not sel(1)) and (not sel(0)))
			or
			((d(1)) and (not sel(1)) and ( sel(0)))
			or
			((d(2)) and ( sel(1)) and (not sel(0)))
			or
			((d(3)) and ( sel(1)) and ( sel(0)))
		);
end;