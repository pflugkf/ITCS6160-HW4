DROP DATABASE IF EXISTS nhl;
CREATE DATABASE nhl;
USE nhl;

DROP TABLE IF EXISTS player CASCADE;
DROP TABLE IF EXISTS team CASCADE;
DROP TABLE IF EXISTS game CASCADE;
DROP TABLE IF EXISTS injury_record CASCADE;

CREATE TABLE player (
	name VARCHAR(50) NOT NULL,
    team VARCHAR(50),
	position VARCHAR(20),
	skill_level VARCHAR(20),
	PRIMARY KEY (name)
);

INSERT INTO player VALUE ('Chris Kreider', 'New York Rangers', 'Left-winger', 'Tier 1');
INSERT INTO player VALUE ('Tony DeAngelo', 'New York Rangers', 'Defenseman', 'Tier 1');
INSERT INTO player VALUE ('Oliver Ekman-Larsson', 'Arizona Coyotes', 'Defenseman', 'Tier 2');
INSERT INTO player VALUE ('Lawson Crouse', 'Arizona Coyotes', 'Right-winger', 'Tier 2');

CREATE TABLE team (
	team_name VARCHAR(50) NOT NULL,
	captain VARCHAR(50) NOT NULL,
	coach VARCHAR(50),
	city VARCHAR(30),
	PRIMARY KEY (team_name, captain),
	FOREIGN KEY (captain) REFERENCES player(name)
);

INSERT INTO team VALUE ('New York Rangers', 'Chris Kreider', 'David Quinn', 'New York');
INSERT INTO team VALUE ('Arizona Coyotes', 'Oliver Ekman-Larsson', 'Rick Tocchet', 'Phoenix');

ALTER TABLE player ADD FOREIGN KEY (team) REFERENCES team(team_name);

CREATE TABLE game (
	host_team VARCHAR(50) NOT NULL,
	guest_team VARCHAR(50) NOT NULL,
    date DATE,
	score VARCHAR(10),
	PRIMARY KEY (host_team, guest_team),
	FOREIGN KEY (host_team) REFERENCES team(team_name),
	FOREIGN KEY (guest_team) REFERENCES team(team_name)
);

CREATE TABLE injury_record (
	id VARCHAR(10) NOT NULL,
	player_name VARCHAR(50) NOT NULL,
	description VARCHAR(200),
	PRIMARY KEY (id, player_name),
	FOREIGN KEY (player_name) REFERENCES player(name)
);

INSERT INTO game VALUE ('New York Rangers', 'Arizona Coyotes', '2019-03-04', '4-2');
INSERT INTO game VALUE ('Arizona Coyotes', 'New York Rangers', '2020-10-22', '3-4');

INSERT INTO injury_record 
VALUE ('8675309', 'Tony DeAngelo', 'Pulled hamstring on 10/22/2020. Cannot play for two weeks.');

SELECT t1.captain AS Host, t2.captain AS Guest, date, score FROM game
JOIN team AS t1 ON game.host_team = t1.team_name
JOIN team AS t2 ON game.guest_team = t2.team_name ORDER BY date;