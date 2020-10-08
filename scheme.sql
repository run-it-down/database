CREATE TABLE summoners (
  accountId varchar(56) PRIMARY KEY,
  profileIconId int NOT NULL,
  revisionDate bigint NOT NULL,
  name varchar(16) NOT NULL,
  id varchar(63) NOT NULL,
  puuid varchar(78) NOT NULL,
  summonerLevel int NOT NULL,
  timestamp timestamp with time zone NOT NULL
);

CREATE TABLE summoner_matches (
  gameId bigint NOT NULL,
  accountId varchar(56) NOT NULL,
  FOREIGN KEY (accountId) REFERENCES summoners(accountId),
  PRIMARY KEY (gameId, accountId)
);

CREATE TABLE teams (
  teamId int NOT NULL,
  win bool varchar(16),
  firstBlood bool NOT NULL,
  firstTower bool NOT NULL,
  firstInhibitor bool NOT NULL,
  firstBaron bool NOT NULL,
  firstDragon bool NOT NULL,
  firstRiftHerald bool NOT NULL,
  towerKills int,
  inhibitorKills int,
  baronKills int,
  dragonKills int,
  vilemawKills int
  riftHeraldKills int
  dominionVictoryScore int,
  bans int[]
  PRIMARY KEY (teamId)
)
