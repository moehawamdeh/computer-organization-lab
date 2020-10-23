library ieee;
use ieee.std_logic_1164.all;
--use ieee.numeric_std.all;
--use ieee.std_logic_unsigned.all;
use work.constants.BUS_WIDTH;

entity shr_register is
	generic(N:integer:=BUS_WIDTH);
	port(	Din: in std_logic_vector(N-1 downto 0);
			ld,en,clk: in std_logic;
			Dout: buffer std_logic_vector(N-1 downto 0)
			);
end;

architecture shr_register of shr_register is
begin
	process(clk)
	begin
		if(rising_edge(clk)) then
			if ld='1' then
				Dout<= Din;
			elsif en='1' then
				Dout<= '0'&Dout(N-1 downto 1);
			else Dout<= Dout;
			end if;
		else Dout<= Dout;
		end if;
	end process;
end;

