library ieee;
use 	ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all; -- operator +

entity Reg_16 is
port(	clr,ld,inc,clk: in std_logic;
		inReg: in std_logic_vector(15 downto 0);
		outReg: buffer std_logic_vector(15 downto 0)); -- buffer(Read/write) out(writeonly)
end;

architecture Reg_16 of Reg_16 is 
begin
process(clk,clr) --clk and async only in sequen
	begin
	if(clr='0') then --active low
		outReg <= x"0000";  -- 16bit but in hex x" "
	elsif (clk'event and clk='1') then --rising edge 
		if(ld='1') then
		outReg <= inReg;
		elsif(inc='1') then 
		outReg <= outReg+'1';
		else outReg  <=outReg;
		end if;
	end if;
end process;
end;
		
