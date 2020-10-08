CREATE TABLE summoners (
  accountId varchar(56) PRIMARY KEY,
  profileIconId int NOT NULL,
  revisionDate bigint NOT NULL,
  name varchar(16) NOT NULL,
  id varchar(63) NOT NULL,
  puuid varchar(78) NOT NULL,
  summonerLevel int NOT NULL,
  timestamp timestamp with time zone NOT NULL
)

CREATE TABLE summoner_matches (
  gameId bigint NOT NULL,
  accountId varchar(56) NOT NULL,
  FOREIGN KEY (accountId) REFERENCES summoners(accountId),
  PRIMARY KEY (gameId, accountId)
)
