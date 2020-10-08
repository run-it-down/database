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

CREATE TABLE matchreferences (
  gameId bigint PRIMARY KEY,
  role varchar(16) NOT NULL,
  season int NOT NULL,
  platformId varchar(16) NOT NULL,
  champion int NOT NULL,
  queue int NOT NULL,
  lane varchar(16) NOT NULL,
  timestamp bigint NOT NULL
)
