library ieee;
use ieee.std_logic_1164.all;
use work.components.all;

entity tri_buffer is
	port(	A: in  std_logic_vector(N-1 downto 0);
			EN: in std_logic;
			Q: out std_logic_vector(N-1 downto 0));
			
end;

architecture tri_buffer of tri_buffer is
	begin
	Q <= (others=>'Z') when EN='0' else A;
end;
	