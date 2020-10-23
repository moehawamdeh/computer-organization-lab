library ieee;
use ieee.std_logic_1164.all;
use work.components.all;
entity ALU is
	port(	A,B: in std_logic_vector(N-1 downto 0);
				op: in std_logic_vector(Msel-1 downto 0);
				result: buffer std_logic_vector(N-1 downto 0);
				zero,overflow,carry: out std_logic
			);
end;

architecture structural of ALU is
	signal mux_inputs: inputs;
	signal modules: inputs;
	signal ones,zeros: std_logic_vector(N-1 downto 0);
	signal b_comp,b2s_comp: std_logic_vector(N-1 downto 0);
	signal cALL,vALL: std_logic_vector(3 downto 0);
	begin
	ones<=(others => '1');
	zeros<=(others => '0');
	
	-- decrement A = add 
	ALU_dec: Nfulladder port map(A,ones,'0',mux_inputs(0),cALL(0),vALL(0));
	--subtract A-b
	-- 1s complement == xor FF
	B_hat: Nxor port map(B,ones,b_comp);
	-- A-B =2's comp B + A = 1's comp B + 1+A    cin=1 
	ALU_sub: Nfulladder port map(a=>A,b=>b_comp,cin=>'1',v=>vALL(1),cout=>cALL(1),sum=>mux_inputs(1));
	--shl A
	ALU_shl: shl port map(A,mux_inputs(2));
	--shr A
	ALU_shr: shr port map(A,mux_inputs(3));
	--A+B
	ALU_add: Nfulladder port map(A,B,'0',mux_inputs(4),cALL(2),vALL(2));
	--A xor b
	ALU_xor: Nxor port map(A,B,mux_inputs(5));
	--complement = A xor FF
	ALU_compA: Nxor port map(A,ones,mux_inputs(6));
	-- increment A
	ALU_incA: Nfulladder port map(A,zeros,'1',mux_inputs(7),cALL(3),vALL(3));
	--mux
	ALU_mux: mux port map(mux_inputs,op,result);
	zero <= '1' when zeros = result else
			'0' ;
	-- carry and overflow
	carry <=
	cALL(0) when op="000" else	
	cALL(1) when op ="001" else
	cALL(2) when op="100" else
	cALL(3) when op="111" else
	 '0';
	
	overflow <=
	vALL(0) when op= "000" else
	vALL(1) when op="001" else
	vALL(2) when op= "100" else
	vALL(3) when op= "111" else
	'0';
end;