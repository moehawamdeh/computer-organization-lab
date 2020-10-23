library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; -- the unsigned method (dec,bits)
use IEEE.math_real.all; -- op **


entity decoder_3x8 is
	port(	A: in std_logic_vector(2 downto 0);
			Q: out std_logic_Vector(7  downto 0));
end;

architecture decoder of decoder_3x8 is
begin
	Q <= std_logic_vector(to_unsigned(2** to_integer(unsigned(A)),8)); -- 
end;