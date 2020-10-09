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
  teamId varchar(36) NOT NULL,
  win bool NOT NULL,
  firstBlood bool NOT NULL,
  firstTower bool NOT NULL,
  firstInhibitor bool NOT NULL,
  firstBaron bool NOT NULL,
  firstDragon bool NOT NULL,
  firstRiftHerald bool NOT NULL,
  towerKills int NOT NULL,
  inhibitorKills int NOT NULL,
  baronKills int NOT NULL,
  dragonKills int NOT NULL,
  vilemawKills int NOT NULL,
  riftHeraldKills int NOT NULL,
  dominionVictoryScore int NOT NULL,
  bans int[] NOT NULL,
  PRIMARY KEY (teamId)
);

CREATE TABLE champions (
  id int NOT NULL,
  name varchar(16) NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE timelines(
  timelineId varchar(36) NOT NULL,
  creepsPerMinDeltas text[] NOT NULL,
  xpPerMinDeltas text[] NOT NULL,
  goldPerMinDeltas text[] NOT NULL,
  csDiffPerMinDeltas text[] NOT NULL,
  xpDiffPerMinDeltas text[] NOT NULL,
  damageTakenPerMinDeltas text[] NOT NULL,
  damageTakenDiffPerMinDeltas text[] NOT NULL,
  PRIMARY KEY (timelineId)
);

CREATE TABLE stats(
  statId varchar(36) NOT NULL,
  win bool NOT NULL,
  items int[] NOT NULL,
  kills int NOT NULL,
  deaths int NOT NULL,
  assists int NOT NULL,
  largestKillingSpree int NOT NULL,
  largestMultiKill int NOT NULL,
  killingSprees int NOT NULL,
  longestTimeSpentLiving int NOT NULL,
  doubleKills int NOT NULL,
  tripleKills int NOT NULL,
  quadraKills int NOT NULL,
  pentaKills int NOT NULL,
  unrealKills int NOT NULL,
  totalDamageDealt int NOT NULL,
  magicDamageDealt int NOT NULL,
  physicalDamageDealt int NOT NULL,
  trueDamageDealt int NOT NULL,
  largestCriticalStrike int NOT NULL,
  totalDamageDealtToChampions int NOT NULL,
  magicDamageDealtToChampions int NOT NULL,
  physicalDamageDealtToChampions int NOT NULL,
  trueDamageDealtToChampions int NOT NULL,
  totalHeal int NOT NULL,
  totalUnitsHealed int NOT NULL,
  damageSelfMitigated int NOT NULL,
  damageDealtToObjectives int NOT NULL,
  damageDealtToTurrets int NOT NULL,
  visionScore int NOT NULL,
  timeCCingOthers int NOT NULL,
  totalDamageTaken int NOT NULL,
  magicDamageTaken int NOT NULL,
  physicalDamageTaken int NOT NULL,
  trueDamageTaken int NOT NULL,
  goldEarned int NOT NULL,
  goldSpent int NOT NULL,
  turretKills int NOT NULL,
  inhibitorKills int NOT NULL,
  totalMinionsKilled int NOT NULL,
  neutralMinionsKilledTeamJungle int NOT NULL,
  neutralMinionsKilledEnemyJungle int NOT NULL,
  totalTimeCrowdControlDealt int NOT NULL,
  champLevel int NOT NULL,
  visionWardsBoughtInGame int NOT NULL,
  sightWardsBoughtInGame int NOT NULL,
  wardsPlaced int NOT NULL,
  wardsKilled int NOT NULL,
  firstBloodKill int NOT NULL,
  firstBloodAssist int NOT NULL,
  firstTowerKill int NOT NULL,
  firstTowerAssist int NOT NULL,
  firstInhibitorKill int NOT NULL,
  firstInhibitorAssit int NOT NULL,
  combatPlayerScore int NOT NULL,
  objectivePlayerScore int NOT NULL,
  totalPlayerScore int NOT NULL,
  totalScoreRank int NOT NULL,
  playerScore0 int NOT NULL,
  playerScore1 int NOT NULL,
  playerScore2 int NOT NULL,
  playerScore3 int NOT NULL,
  playerScore4 int NOT NULL,
  playerScore5 int NOT NULL,
  playerScore6 int NOT NULL,
  playerScore7 int NOT NULL,
  playerScore8 int NOT NULL,
  playerScore9 int NOT NULL,
  perk0 int NOT NULL,
  perk0Var1 int NOT NULL,
  perk0Var2 int NOT NULL,
  perk0Var3 int NOT NULL,
  perk1 int NOT NULL,
  perk1Var1 int NOT NULL,
  perk1Var2 int NOT NULL,
  perk1Var3 int NOT NULL,
  perk2 int NOT NULL,
  perk2Var1 int NOT NULL,
  perk2Var2 int NOT NULL,
  perk2Var3 int NOT NULL,
  perk3 int NOT NULL,
  perk3Var1 int NOT NULL,
  perk3Var2 int NOT NULL,
  perk3Var3 int NOT NULL,
  perk4 int NOT NULL,
  perk4Var1 int NOT NULL,
  perk4Var2 int NOT NULL,
  perk4Var3 int NOT NULL,
  perk5 int NOT NULL,
  perk5Var1 int NOT NULL,
  perk5Var2 int NOT NULL,
  perk5Var3 int NOT NULL,
  perkPrimaryStyle int NOT NULL,
  perkSubStyle int NOT NULL,
  statPerk0 int NOT NULL,
  statPerk1 int NOT NULL,
  statPerk2 int NOT NULL,
  PRIMARY KEY (statId)
);

CREATE TABLE participant (
  participantId varchar(36) NOT NULL,
  teamId varchar(36) NOT NULL,
  accountId varchar(56) NOT NULL,
  championId int NOT NULL,
  spell1Id int NOT NULL,
  spell2Id int NOT NULL,
  statId varchar(36) NOT NULL,
  PRIMARY KEY (participantId),
  FOREIGN KEY (teamId) REFERENCES teams(teamId),
  FOREIGN KEY (accountId) REFERENCES summoners(accountId),
  FOREIGN KEY (championId) REFERENCES champions(id),
  FOREIGN KEY (statId) REFERENCES stats(statId)
);


CREATE TABLE matches (
  gameId bigint NOT NULL,
  platformId varchar(16) NOT NULL,
  gameCreation int NOT NULL,
  gameDuration int NOT NULL,
  queueId int NOT NULL,
  mapId int NOT NULL,
  seasonId int NOT NULL,
  gameVersion varchar(32) NOT NULL,
  gameMode varchar(16) NOT NULL,
  gameType varchar(32) NOT NULL,
  teams varchar(36)[] NOT NULL,
  participants varchar(36)[] NOT NULL,
  PRIMARY KEY (gameId)
);
