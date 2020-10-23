library ieee;
use ieee.std_logic_1164.all;
use work.components.all;
entity Nfulladder is
	port(	a,b: in std_logic_vector(N-1 downto 0);
				cin: in std_logic;
				sum: out std_logic_vector(N-1 downto 0);
				cout,v: buffer std_logic
			);
end;

architecture structural of Nfulladder is
	signal c: std_logic_vector( N-1 downto 0);
	begin
	FA_init: fulladder port map(a(0),b(0),cin,sum(0),c(1));
	
	FA: for i in  1 to N-2 generate
		FA_i: fulladder port map(a(i),b(i),c(i),sum(i),c(i+1));
		end generate;
	FA_last: fulladder port map(a(N-1),b(N-1),c(N-2),sum(N-1),cout);
	
	v<= cout xor c(N-2);

end;