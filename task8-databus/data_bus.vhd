library ieee;
library ieee;
use ieee.std_logic_1164.all;
use work.components.all;

entity data_bus is
	port(	DR,AC,IR,TR,MEM: in std_logic_vector(N-1 downto 0);
			AR,PC: in std_logic_vector(M-1 downto 0);
			S: in std_logic_vector(2 downto 0);
			Q: out std_logic_vector(N-1 downto 0));
end;

architecture data_bus of data_bus is
	Signal sources: inputs;
	Signal buffer_en: std_logic_vector(7 downto 0);
	Signal output: std_logic_vector(N-1 downto 0); --redundant
	begin
	sources<=( "0000"&AR,"0000"&PC,DR,AC,IR,TR,MEM);
	DECODER: decoder_3x8 port map(S,buffer_en);	
	BUFFERS: for i in 1 to 7 generate	
				TRI: tri_buffer port map(sources(i),buffer_en(i),output);
			 end generate;
	Q<=output; 
	
end;
