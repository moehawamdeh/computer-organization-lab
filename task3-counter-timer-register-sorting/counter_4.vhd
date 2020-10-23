library ieee;
use 	ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all; -- operator +

entity counter_4 is
port(	clk,inc,clr: in std_logic;
		outCount: buffer std_logic_vector(3 downto 0)); 
end;

architecture counter_4 of counter_4 is 
begin
process(clk,clr) 
	begin
	if(clr='0') then --active low
		outCount <= x"0";
	elsif (clk'event and clk='1'and inc='1') then
		outCount <= outCount + "1";
	else outCount <= outCount;
	end if;
	
end process;
end;
		
