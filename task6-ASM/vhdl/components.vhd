library ieee;
use ieee.std_logic_1164.all;
use work.constants.BUS_WIDTH;


package components is
	component shr_register is
		generic(N:integer:=BUS_WIDTH);
		port(	Din: in std_logic_vector(N-1 downto 0);
				ld,en,clk: in std_logic;
				Dout: buffer std_logic_vector(N-1 downto 0)
				);
	end component;

	component inc_register is
		generic(N:integer:=BUS_WIDTH);
		port(	Din: in std_logic_vector(N-1 downto 0);
				inc,ld,clk: in std_logic;
				Dout: buffer std_logic_vector(N-1 downto 0)
				);
	end component;
	component controller is
		port(	clk,start,rst,a0,z: in std_logic;
				bINC,bLD,aEN,aLD,done: out std_logic
				);
	end component;
	
end components;
