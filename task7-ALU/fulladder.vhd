library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity fulladder is
	port( 	a,b,cin: in std_logic;
				sum,cout: out std_logic
		);
end;

architecture fulladder of fulladder is
	begin
	sum<=a xor b xor cin;
	cout<= (a and b) or (cin and (a or b))	;
end;