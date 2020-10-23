library ieee;
use 	ieee.std_logic_1164.all;

entity Sorting is
port(	i1,i2,i3: in std_logic_vector(5 downto 0);
		min,mid,max: out std_logic_vector(5 downto 0));
end;

architecture Sorting of Sorting is 
begin
	process(i1,i2,i3) --combinational all
	variable tmp,tmin,tmid,tmax : std_logic_vector(5 downto 0);
	begin
		tmin :=i1;
		tmid :=i2;
		tmax :=i3;
			for i in 0 to 1 loop --bubblesort
				exit when ((tmax > tmin) and (tmax >tmid) and (tmid > tmin));
				if (tmin > tmid) then
					tmp:=tmid;
					tmid:=tmin;
					tmin:=tmp;
				end if;
				if (tmid > tmax) then
					tmp:=tmax;
					tmax:=tmid;
					tmid:=tmp;
				end if;
			end loop;
		min<=tmin;
		max<=tmax;
		mid<=tmid;
	end process;
end;
		
