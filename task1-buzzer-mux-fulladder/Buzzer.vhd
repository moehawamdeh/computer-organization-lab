library ieee;
use ieee.std_logic_1164.all;

entity Buzzer is 
port(	Door,Ignition,SB: in std_logic;
		Warning: out std_logic);
end Buzzer;

architecture Buzzer of Buzzer is
begin
	Warning <= ((not Door) or (not SB )) and Ignition;
end;