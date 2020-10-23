library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;
use work.constants.BUS_WIDTH;

use IEEE.math_real.all; -- calculate size of small register log2n


entity inc_register is
	generic(N:integer:=integer(ceil(log2(real(BUS_WIDTH)))));
	port(	Din: in std_logic_vector(N-1 downto 0);
			inc,ld,clk: in std_logic;
			Dout: buffer std_logic_vector(N-1 downto 0)
			);
end;

architecture incr of inc_register is
begin
	process(clk)
	begin
		if rising_edge(clk) then
			if ld='1' then
				Dout<=Din;
			elsif inc='1' then
				Dout<=Dout+'1';
			end if;
		else 
			Dout<=Dout;
		end if;
	end process;
end;