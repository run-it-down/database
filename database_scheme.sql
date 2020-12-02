CREATE TABLE summoners (
  accountId varchar(56) PRIMARY KEY,
  summonerId varchar(63) NOT NULL,
  puuid varchar(78) NOT NULL,
  name varchar(16) NOT NULL,
  summonerLevel int NOT NULL,
  profileIconId int NOT NULL,
  revisionDate bigint NOT NULL,
  timestamp timestamp with time zone NOT NULL
);

CREATE TABLE matches (
  gameId bigint NOT NULL,
  platformId varchar(16) NOT NULL,
  gameCreation bigint NOT NULL,
  gameDuration int NOT NULL,
  queueId int NOT NULL,
  mapId int NOT NULL,
  seasonId int NOT NULL,
  gameVersion varchar(32) NOT NULL,
  gameMode varchar(16) NOT NULL,
  gameType varchar(32) NOT NULL,
  PRIMARY KEY (gameId)
);

CREATE TABLE summoner_matches (
  accountId varchar(56) NOT NULL,
  gameId bigint NOT NULL,
  FOREIGN KEY (accountId) REFERENCES summoners(accountId),
  FOREIGN KEY (gameId) REFERENCES matches(gameId),
  PRIMARY KEY (gameId, accountId)
);

CREATE TABLE teams (
  teamId int NOT NULL,
  gameId bigint NOT NULL,
  win varchar(16) NOT NULL,
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
  riftHeraldKills int NOT NULL,
  bans int[] NOT NULL,
  FOREIGN KEY (gameId) REFERENCES matches(gameId),
  PRIMARY KEY (teamId, gameId)
);

CREATE TABLE champions (
  championId int NOT NULL,
  name varchar(16) NOT NULL,
  classes varchar(20)[] NOT NULL,
  PRIMARY KEY (championId)
);

CREATE TABLE timelines(
  timelineId varchar(36) NOT NULL,
  creepsPerMinDeltas text NOT NULL,
  xpPerMinDeltas text NOT NULL,
  goldPerMinDeltas text NOT NULL,
  csDiffPerMinDeltas text NOT NULL,
  xpDiffPerMinDeltas text NOT NULL,
  damageTakenPerMinDeltas text NOT NULL,
  damageTakenDiffPerMinDeltas text NOT NULL,
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
  neutralMinionsKilledTeamJungle int,
  neutralMinionsKilledEnemyJungle int,
  totalTimeCrowdControlDealt int NOT NULL,
  champLevel int NOT NULL,
  visionWardsBoughtInGame int NOT NULL,
  sightWardsBoughtInGame int NOT NULL,
  wardsPlaced int,
  wardsKilled int,
  firstBloodKill bool,
  firstBloodAssist bool,
  firstTowerKill bool,
  firstTowerAssist bool,
  firstInhibitorKill bool,
  firstInhibitorAssist bool,
  combatPlayerScore int NOT NULL,
  objectivePlayerScore int NOT NULL,
  totalPlayerScore int NOT NULL,
  totalScoreRank int NOT NULL,
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

CREATE TABLE participants (
  participantId varchar(36) NOT NULL,
  gameId bigint NOT NULL,
  accountId varchar(56) NOT NULL,
  championId int NOT NULL,
  statId varchar(36) NOT NULL,
  teamId int NOT NULL,
  timelineId varchar(36) NOT NULL,
  spell1Id int NOT NULL,
  spell2Id int NOT NULL,
  role varchar(11) NOT NULL,
  lane varchar(6) NOT NULL,
  PRIMARY KEY (participantId),
  FOREIGN KEY (gameId) REFERENCES matches(gameId),
  FOREIGN KEY (accountId) REFERENCES summoners(accountId),
  FOREIGN KEY (championId) REFERENCES champions(championId),
  FOREIGN KEY (timelineId) REFERENCES timelines(timelineId),
  FOREIGN KEY (statId) REFERENCES stats(statId),
  FOREIGN KEY (teamId) REFERENCES teams(teamId)
);

CREATE TABLE participant_frame (
  participantId varchar(36) NOT NULL,
  timestamp bigint NOT NULL,
  minionsKilled int,
  teamScore int,
  totalGold int,
  level int,
  xp int,
  currentGold int,
  position point,
  jungleMinionsKilled int,
  FOREIGN KEY (participantId) REFERENCES participants(participantId),
  PRIMARY KEY (participantId, timestamp)
);

CREATE TABLE events (
  participantId varchar(36) NOT NULL,
  timestamp bigint NOT NULL,
  laneType varchar(16),
  skillSlot int,
  ascendedType varchar(16),
  creatorId int,
  afterId int,
  eventType varchar(16),
  type varchar(32),
  levelUpType varchar(16),
  wardType varchar(16),
  towerType varchar(12),
  itemId int,
  beforeId int,
  monsterType varchar(16),
  monsterSubType varchar(16),
  position point,
  killerId varchar(36),
  assistingParticipantIds varchar(36)[],
  buildingType varchar(16),
  victimId varchar(36),
  FOREIGN KEY (participantId) REFERENCES participants(participantId),
  PRIMARY KEY (participantId, timestamp, type)
);
