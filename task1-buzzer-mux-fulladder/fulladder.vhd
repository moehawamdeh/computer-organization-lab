library ieee;
use ieee.std_logic_1164.all;

entity FullAdder is
port( 	a,b,cin:	in	std_logic;
		sum,cout:	out	std_logic
	);
end;

architecture FullA of FullAdder is
begin
sum <= (a xor b xor cin);
cout <= (cin and (a xor b)) or (a and b);
end;