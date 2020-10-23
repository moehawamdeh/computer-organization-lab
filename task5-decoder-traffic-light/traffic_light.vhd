library ieee;
use ieee.std_logic_1164.all;

entity traffic_light is
	port(	start,clk: in std_logic;
			red,yellow,green: out  std_logic);
end;

architecture tlc of traffic_light is
	signal outC: std_logic_vector(2 downto 0);
	signal outQ: std_logic_vector(7 downto 0);
	component decoder_3x8 is
		port(	A: in std_logic_vector(2 downto 0);
				Q: out std_logic_Vector(7  downto 0));
	end component;
	component	counter_3bit is 
		port(	start,clk,pl,ud: in std_logic;
				D: in std_logic_vector(2 downto 0);
				Q: buffer std_logic_vector(2 downto 0)
				);
	end component;
begin
	--componenets init
	C: counter_3bit port map(start,clk,'1','0',"000",outC);
	D: decoder_3x8 port map(outC,outQ);
	--output
	red <=	'1' when (outQ(7)='1' or outQ(6)='1' or outQ(5)='1') else
			'0';
	yellow <=	'1' when (outQ(4)='1' or outQ(3)='1') else
			'0';
	green <=	'1' when (outQ(2)='1' or outQ(1)='1' or outQ(0)='1') else
			'0';	
end tlc;

