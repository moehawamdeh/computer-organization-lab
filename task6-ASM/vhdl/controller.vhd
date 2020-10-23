library ieee;
use ieee.std_logic_1164.all;
--use ieee.numeric_std.all;
--use ieee.std_logic_unsigned.all;
--use work.constants.BUS_WIDTH;

entity controller is
	port(	clk,start,rst,a0,z: in std_logic;
			bINC,bLD,aEN,aLD,done: out std_logic
			);
end;

architecture controller of controller is
type states is (S1,S2,S3);
signal CurrentState,NextState: states:=S1;

begin
	--state transition
	process(CLK,RST)
	begin
		if RST='1' then
			CurrentState<=S1;
		elsif rising_edge(CLK) then
			CurrentState<=NextState;
		end if;
	end process;
	
	--output
	process(CurrentState,start,a0,z)
	begin
		case CurrentState is
			when S1=>
				bINC<='0';
				bLD<='1';
				aEN<='0';
				aLD<='1';
				done<='0';
				if start = '1' then
					NextState<= S2;
				else NextState <=S1;
				end if;

			when S2=>
				bLD<='0';
				aEN<='1';
				aLD<='0';
				done<='0';
				if z = '1' then
					NextState<= S3;
					bINC<='0';
				else 
					NextState<= S2;
					if a0='1' then
						bINC<='1';
					else bINC<='0';
					end if;
				end if;
	
			when S3=>
				bINC<='0';
				bLD<='0';
				aEN<='0';
				aLD<='0';
				done<='1';
				if start = '1' then
					NextState<= S3;
				else NextState <=S1;
				end if;
		end case;
	end process;
end;

	