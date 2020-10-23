library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all; -- operator +

entity counter_3bit is 
	port(	start,clk,pl,ud: in std_logic;
			D: in std_logic_vector(2 downto 0);
			Q: buffer std_logic_vector(2 downto 0)
			);
end;

architecture counter of counter_3bit is
begin
	Q <= D when PL='0' else
		 Q when start='1' else
		 Q + '1' when (clk'event and clk='1' and ud='0') else
		 Q - '1' when (clk'event and clk='1' and ud='1');
end counter;