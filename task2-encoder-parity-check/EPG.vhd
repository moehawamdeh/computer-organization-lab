library ieee;
use ieee.std_logic_1164.all;

entity EPG is
port( ABC: in std_logic_vector(2 downto 0);
	  P:	out std_logic
	);
	
end;

architecture EPG of EPG is 
begin
with ABC select
P<= '1' when "001",
	'1' when "010",
	'1' when "100",
	'1' when "111",
	'0' when others;
end;