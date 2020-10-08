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
