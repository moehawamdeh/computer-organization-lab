library ieee;
use ieee.std_logic_1164.all;
use IEEE.math_real.all; -- calculate size of small register log2n
use work.constants.BUS_WIDTH; --size of data register
use work.components.all;

entity bit_counter is 
	generic(N:integer:=BUS_WIDTH;	M:integer:=integer(ceil(log2(real(BUS_WIDTH)))));
	port(	Din: in std_logic_vector(N-1 downto 0);
			clk,start,reset: in std_logic;
			done: out std_logic;
			Dout: out std_logic_vector(M-1 downto 0)); 
end;

			
architecture bc of bit_counter is
signal a0,z,bINC,bLD,aEN,aLD: std_logic:='0'; 
signal A: std_logic_vector(N-1 downto 0); -- current bit string
signal B: std_logic_vector(M-1 downto 0); -- current '1' count
constant Nzeros: std_logic_vector(N-1 downto 0):= (others => '0');
constant zeros: std_logic_vector(M-1 downto 0):= (others => '0');
begin
	--------------	controller
	a0<= A(0); 
	z<= '1' when A=Nzeros else 
		'0';
	control: controller
	--generic map (N   => N) no need
	port map    (clk,start,reset,a0,z,bINC,bLD,aEN,aLD,done);
	-------------------------
	
	--------------	shift register ( A )
	shr: shr_register
	generic map (N   => N)
	port map    (Din,aLD,aEN,clk,A);
	-------------------------

	--------------	Register with Increment ( B )
	incReg: inc_register
	generic map ( N => M) -- dist => val
	port map	(zeros,bINC,bLD,clk,B);
	-------------------------
	--output count
	Dout<=B;

end;