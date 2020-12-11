library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- warning: this file will not be saved if:
--     * following entity block contains any syntactic errors (e.g. port list isn't separated with ; character)
--     * following entity name and current file name differ (e.g. if file is named mux41 then entity must also be named mux41 and vice versa)
ENTITY jkbist IS PORT(
	j,k,cp: in std_logic;
	q,qn: out std_logic);
END jkbist;

ARCHITECTURE arch OF jkbist IS 
	signal sa, sb, abq: std_logic;
BEGIN
	sa <= abq xor k;
	sb <= abq xor j;
--								a,b,cp,q,nq
	ab0: entity work.ab port map(sa, sb, cp, abq, qn);
	q <= abq;
	qn <= not abq;
END arch;

