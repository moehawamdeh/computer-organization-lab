library ieee;
use 	ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all; -- operator +

entity timer is
port(	clk,rst: in std_logic;
		hours: buffer std_logic_vector(4 downto 0);
		minutes,seconds: buffer std_logic_vector(5 downto 0)); -- buffer to read
end;

architecture Timer of timer is 
begin
	process(clk,rst) --sequential clk async
	begin
		if(rst='0') then
			hours <="00000";
			minutes <="000000";
			seconds <="000000";
		elsif (clk'event and clk='1') then --rising edge
			seconds <=seconds+'1';
			if(seconds = "111011") then
				minutes <= minutes +'1';
				seconds <= "000000";
				if(minutes = "111011") then
					hours <= hours +'1';
					minutes <= "000000"; 
					if(hours = "10111") then
						hours<="00000";
					end if;
				end if;
			end if;
		end if;
		
	end process;
end;
		
