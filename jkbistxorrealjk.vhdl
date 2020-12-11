library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- warning: this file will not be saved if:
--     * following entity block contains any syntactic errors (e.g. port list isn't separated with ; character)
--     * following entity name and current file name differ (e.g. if file is named mux41 then entity must also be named mux41 and vice versa)
ENTITY jkbistxorrealjk IS PORT(
	j,k,cp : in std_logic;
	jkPxorJK, jkPxorJKn: out std_logic);
END jkbistxorrealjk;

ARCHITECTURE arch OF jkbistxorrealjk IS 
	signal praviJKq, praviJKqn, abJKq, abJKqn: std_logic;
BEGIN
	process(cp)
		variable stanjePRaviJK: std_logic := '0';
	begin
		if falling_edge(cp) then
			stanjePRaviJK := (j and not stanjePRaviJK) or (stanjePRaviJK and not k);
		end if;
		praviJKq <= stanjePRaviJK;
		praviJKqn <= not stanjePRaviJK;
	end process;
	
	jkFromAb: entity work.jkbist port map(j,k,cp, abJKq, abJKqn );	
	
	jkPxorJK <= praviJKq xor abJKq;
	jkPxorJKn <= praviJKqn xor abJKqn;
END arch;

