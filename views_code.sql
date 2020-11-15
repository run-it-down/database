-- Contains the unconverted sql code for each view

-- common-game-stats
SELECT sm1.gameid, sm1.accountid, p.teamid, c.name as champion, p.spell1id, p.spell2id, s.*
FROM summoner_matches as sm1
INNER JOIN summoner_matches sm2 ON sm1.gameid = sm2.gameid AND sm1.accountid <> sm2.accountid
INNER JOIN matches as m ON sm1.gameid = m.gameid
INNER JOIN participants as p ON p.participantid = ANY(m.participants) AND sm1.accountid = p.accountid 
INNER JOIN stats as s ON p.statid = s.statid 
INNER JOIN champions as c ON p.championid = c.id
ORDER BY sm1.gameid;