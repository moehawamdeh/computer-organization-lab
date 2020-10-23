library ieee;
use ieee.std_logic_1164.all;
USE ieee.numeric_std.ALL;
use work.components.all;
entity mux is
	port( 	data: in inputs;
				sel: in std_logic_vector( Msel-1 downto 0);
				dout: out std_logic_vector(N-1 downto 0)
			);
end;

architecture mux of mux is
	begin
	dout<=data(to_integer(unsigned(sel)));
	
	
end;