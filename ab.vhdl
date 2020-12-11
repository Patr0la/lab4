library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- warning: this file will not be saved if:
--     * following entity block contains any syntactic errors (e.g. port list isn't separated with ; character)
--     * following entity name and current file name differ (e.g. if file is named mux41 then entity must also be named mux41 and vice versa)
ENTITY ab IS PORT(
	a,b,cp: in std_logic;
	q, nq: out std_logic);
END ab;

ARCHITECTURE arch OF ab IS 
BEGIN
	process(cp)
		variable stanje: std_logic := '0';
	begin
		if falling_edge(cp) then
			stanje := (b and not stanje) or (a and stanje);
		end if;
		q <= stanje;
		nq <= not stanje;
	end process;
END arch;
