-- PROGRESSION - 1

-- 1. **Create table city**
create table city
( id NUMBER(11),
name VARCHAR(50) NOT NULL,
CONSTRAINT city_pk PRIMARY KEY(id));

-- 2. **Create table referee**
create table referee
(id NUMBER(11),
name VARCHAR(50) NOT NULL,
CONSTRAINT referee_pk PRIMARY KEY(id));


-- 3. **Create table innings**
create table innings
(id NUMBER(11),
innings_number int NOT NULL,
CONSTRAINT innings_pk PRIMARY KEY(id));

-- 4. **Create table extra_type**
create table extra_type
( id NUMBER(11),
name VARCHAR(50) NOT NULL,
CONSTRAINT extra_type_pk PRIMARY KEY(id));

-- 5. **Create table skill**
create table skill
( id NUMBER(11),
name VARCHAR(50) NOT NULL,
CONSTRAINT skill_pk PRIMARY KEY(id));

-- 6. **Create table team**
create table team
( id NUMBER(11),
name VARCHAR(50) NOT NULL,
coach VARCHAR(50) NOT NULL,
home_city NUMBER(11) NOT NULL,
captain NUMBER(11) NOT NULL,
CONSTRAINT team_pk PRIMARY KEY(id),
CONSTRAINT team_fk FOREIGN KEY(home_city) REFERENCES city(id));

-- 7. **Create table player**
create table player
(  id NUMBER(11),
name VARCHAR(50) NOT NULL,
country VARCHAR(50) NOT NULL,
skill_id NUMBER(11) NOT NULL,
team_id NUMBER(11) NOT NULL,
CONSTRAINT skill_fk FOREIGN KEY (skill_id) REFERENCES skill(id),
CONSTRAINT team_fk FOREIGN KEY (team_id) REFERENCES team(id), CONSTRAINT player PRIMARY KEY(id));
 
-- 8. **Create table venue**
create table venue
(   id NUMBER(11),
stadium_name VARCHAR(50) NOT NULL,
city_id NUMBER(11) NOT NULL,
CONSTRAINT city_id_fk FOREIGN KEY (city_id) REFERENCES city(id),
CONSTRAINT venue PRIMARY KEY(id) ); 
  
-- 9. **Create table event**
create table event
( id NUMBER(11)NOT NULL,
event_number NUMBER(11)NOT NULL,
raid_points NUMBER(11)NOT NULL,
deffending_points NUMBER(11)NOT NULL,
clock_secounds NUMBER(11)NOT NULL,
team_one_score NUMBER(11)NOT NULL,
team_two_score NUMBER(11)NOT NULL,
raider_id NUMBER(11),
innings_id NUMBER(11) NOT NULL,
CONSTRAINT innings_fk FOREIGN KEY (INNINGS_ID) REFERENCES INNINGS(ID),
CONSTRAINT player_fk FOREIGN KEY (raider_id) REFERENCES player(id), 
CONSTRAINT event_pk  PRIMARY KEY (id));
 
-- 10. **Create table extra_event**
create table extra_event
( id NUMBER(11)NOT NULL,
stadim_name VARCHAR(50) NOT NULL,
points NUMBER(11) NOT NULL,
event_id NUMBER(11) NOT NULL,
scoring_team_id NUMBER(11) NOT NULL,
event_type_id NUMBER(11) NOT NULL,
CONSTRAINT event_fk FOREIGN KEY (event_id) REFERENCES event(id),
CONSTRAINT event_type_fk FOREIGN KEY (event_type_id) REFERENCES event_type(id),
CONSTRAINT scoring_team_fk FOREIGN KEY (scoring_team_id) REFERENCES scoring_team(id),
CONSTRAINT extra_event_pk PRIMARY KEY(id)  
);

-- 11. **Create table outcome**
create table outcome
( id NUMBER(11)NOT NULL,
status VARCHAR(100) NOT NULL,
player_of_match NUMBER(11),
score NUMBER(11),
winner_team_id NUMBER(11),
CONSTRAINT winner_team_fk FOREIGN KEY (winner_team_id) REFERENCES TEAM(ID),
CONSTRAINT player_of_match_fk FOREIGN KEY (player_of_match) REFERENCES player(ID),  
CONSTRAINT outcome_pk PRIMARY KEY(id));

-- 12. **Create table game**
create table game
( id NUMBER(11)NOT NULL,
game_date DATE NOT NULL,
team_id_1 NUMBER(11) NOT NULL,
team_id_2 NUMBER(11) NOT NULL,
venue_id NUMBER(11) NOT NULL,
outcome_id NUMBER(11) NOT NULL,
referee_id_1 NUMBER(11) NOT NULL,
referee_id_2 NUMBER(11) NOT NULL,
first_innings_id NUMBER(11) NOT NULL,
second_innings_id NUMBER(11) NOT NULL,
CONSTRAINT game_pk PRIMARY KEY(id),
CONSTRAINT game_fk1 FOREIGN KEY (team_id_1) REFERENCES team(id),
CONSTRAINT game_fk2 FOREIGN KEY (team_id_2) REFERENCES team(id),
CONSTRAINT game_fk3 FOREIGN KEY (venue_id) REFERENCES venue(id),
CONSTRAINT game_fk4 FOREIGN KEY (outcome_id) REFERENCES outcome(id),
CONSTRAINT game_fk5 FOREIGN KEY (referee_id_1) REFERENCES referee(id),
CONSTRAINT game_fk6 FOREIGN KEY (referee_id_2) REFERENCES referee(id),
CONSTRAINT game_fk7 FOREIGN KEY (first_innings_id) REFERENCES innings(id),
CONSTRAINT game_fk8 FOREIGN KEY (second_innings_id) REFERENCES innings(id));

-- 13. **Drop table city**
drop table city;

-- 14. **Drop table innings**
drop table innings;

-- 15. **Drop table skill**
drop table skill;

-- 16. **Drop table extra_type**
drop table extra_type;
