library ieee;
use ieee.std_logic_1164.all;

entity SequenceFSM is
	port(	input,clk,rst: in std_logic;
			output: out std_logic);
end;

Architecture SeqFSM of SequenceFSM is
	type state is (s0,s1,s11,s110,s1101);
	signal currentState: state:=s0;
	signal nextState: state:=s0;
	begin
	process(clk,rst) --only changes state
	begin
		if(rst='1') then
			currentState<= s0;
		elsif(clk'event and clk='1') then --rising
			currentState<= nextState;
		end if;
	end process;
	
	process(input,currentState) -- output func / state func
	begin
		if(currentState = s0) then
			output<='0';			-- output 0 anyway
			case input is
				when '0' => nextState<=s0;
				when '1' => nextState<=s1;
			end case;
		elsif(currentState = s1) then
			output<='0';			-- output 0 anyway
			case input is
				when '0' => nextState<=s0;
				when '1' => nextState<=s11;
			end case;
		elsif(currentState = s11) then
			output<='0';			-- output 0 anyway
			case input is
				when '0' => nextState<=s110;
				when '1' => nextState<=s11;
			end case;
			elsif(currentState = s110) then
			output<='0';			-- output 0 anyway
			case input is
				when '0' => nextState<=s0;
				when '1' => nextState<=s1101;
			end case;
			elsif(currentState = s1101) then
			output<='1';			-- output always 1 at 1101
			case input is
				when '0' => nextState<=s0;
				when '1' => nextState<=s1;
			end case;
		end if;
	end process;
end SeqFSM;
	