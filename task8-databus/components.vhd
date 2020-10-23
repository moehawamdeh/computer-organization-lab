library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

package components is 	

	constant N :integer:=16;
	constant M: integer:=12;
	--constant SEL: integer:=3;
	
	type inputs is array (1 to 7) of std_logic_vector( N-1 downto 0);
	
	
	component decoder_3x8 is
	port(	A: in std_logic_vector(2 downto 0);
			Q: out std_logic_Vector(7  downto 0));
	end component;
	
	component tri_buffer is
	port(	A: in  std_logic_vector(N-1 downto 0);
			EN: in std_logic;
			Q: out std_logic_vector(N-1 downto 0));
	end component;
	
end package components;