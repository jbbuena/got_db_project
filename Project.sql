------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------  A Database of Ice & Fire ---------------------------------------------------------
---------------------------------------------------- IST 359 Project ---------------------------------------------------------------
----------------------------------------------------- Juan Buena -------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------


------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------- Drop tables if they exist -----------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'battle_combatant_bridge')
DROP TABLE battle_combatant_bridge
go

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'battle_locations')
DROP TABLE battle_locations
go

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'battles')
DROP TABLE battles
go

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'houses_and_allegiances')
DROP TABLE houses_and_allegiances
go

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'individuals')
DROP TABLE individuals
go
------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------- Create Tables --------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------
-- Table: battle_combatant_bridge
CREATE TABLE battle_combatant_bridge (
    battle_id_combatant_id int  NOT NULL,
    individual_battle_id int  NOT NULL,
    group_battle_id int  NOT NULL,
    combatant_type varchar(20)  NOT NULL,
    combatant_status varchar(20)  NULL,
    combatant_size int  NULL,
    CONSTRAINT battle_combatant_bridge_pk PRIMARY KEY  (battle_id_combatant_id,individual_battle_id,group_battle_id)
);

-- Table: battle_locations
CREATE TABLE battle_locations (
    location_id int  NOT NULL,
    region_name varchar(60)  NOT NULL,
    location_name varchar(60)  NOT NULL,
    CONSTRAINT battle_locations_pk PRIMARY KEY  (location_id)
);

-- Table: battles
CREATE TABLE battles (
    battle_id int  NOT NULL,
    battle_location_id int  NOT NULL,
    name varchar(100)  NOT NULL,
    year_ int  NOT NULL,
    major_death int   NULL,
    major_capture int   NULL,
    summer int   NULL,
    battle_type varchar(60)  NOT NULL,
    notes varchar(260)   NULL,
    CONSTRAINT battles_pk PRIMARY KEY  (battle_id)
);

-- Table: houses_and_groups
CREATE TABLE houses_and_allegiances (
    house_or_allegiances_id int  NOT NULL,
    house_allegiances_name varchar(60)  NOT NULL,
    CONSTRAINT houses_and_allegiances_pk PRIMARY KEY  (house_or_allegiances_id)
);

-- Table: individuals
CREATE TABLE individuals (
    individual_id int  NOT NULL,
    individual_allegiances_id int  NOT NULL,
    first_name varchar(60)  NOT NULL,
    last_name varchar(60)  NOT NULL,
    titles varchar(80)   NULL,
	nobility int NOT NULL
    CONSTRAINT individuals_pk PRIMARY KEY  (individual_id)
);

-- foreign keys
-- Reference: battle_combatant_bridge_battles (table: battle_combatant_bridge)
ALTER TABLE battle_combatant_bridge ADD CONSTRAINT battle_combatant_bridge_battles
    FOREIGN KEY (battle_id_combatant_id)
    REFERENCES battles (battle_id);

-- Reference: battle_combatant_bridge_houses_and_groups (table: battle_combatant_bridge)
ALTER TABLE battle_combatant_bridge ADD CONSTRAINT battle_combatant_bridge_houses_and_groups
    FOREIGN KEY (group_battle_id)
    REFERENCES houses_and_allegiances (house_or_allegiances_id);

-- Reference: battle_combatant_bridge_individuals (table: battle_combatant_bridge)
ALTER TABLE battle_combatant_bridge ADD CONSTRAINT battle_combatant_bridge_individuals
    FOREIGN KEY (individual_battle_id)
    REFERENCES individuals (individual_id);

-- Reference: battles_battle_locations (table: battles)
ALTER TABLE battles ADD CONSTRAINT battles_battle_locations
    FOREIGN KEY (battle_location_id)
    REFERENCES battle_locations (location_id);

-- Reference: individuals_houses_and_groups (table: individuals)
ALTER TABLE individuals ADD CONSTRAINT individuals_houses_and_allegiances
    FOREIGN KEY (individual_allegiances_id)
    REFERENCES houses_and_allegiances (house_or_allegiances_id);
------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------- Insert data into battle_locations table ------------------------------------
------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO battle_locations (location_id, location_name, region_name) VALUES (1, 'Beyond the Wall', 'Castle Black')
INSERT INTO battle_locations (location_id, location_name, region_name) VALUES (2, 'Crag', 'The Westerlands')
INSERT INTO battle_locations (location_id, location_name, region_name) VALUES (3, 'Darry', 'The Riverlands')
INSERT INTO battle_locations (location_id, location_name, region_name) VALUES (4, 'Deepwood Motte', 'The North')
INSERT INTO battle_locations (location_id, location_name, region_name) VALUES (5, 'Dragonstone', 'The Stormlands')
INSERT INTO battle_locations (location_id, location_name, region_name) VALUES (6, 'Duskendale', 'The Crownlands')
INSERT INTO battle_locations (location_id, location_name, region_name) VALUES (7, 'Golden Tooth', 'The Westerlands')
INSERT INTO battle_locations (location_id, location_name, region_name) VALUES (8, 'Green Fork', 'The Riverlands')
INSERT INTO battle_locations (location_id, location_name, region_name) VALUES (9, 'Harrenhal', 'The Riverlands')
INSERT INTO battle_locations (location_id, location_name, region_name) VALUES (10, 'Kings Landing', 'The Crownlands')
INSERT INTO battle_locations (location_id, location_name, region_name) VALUES (11, 'Moat Cailin', 'The North')
INSERT INTO battle_locations (location_id, location_name, region_name) VALUES (12, 'Mummers Ford', 'The Riverlands')
INSERT INTO battle_locations (location_id, location_name, region_name) VALUES (13, 'Oxcross', 'The Westerlands')
INSERT INTO battle_locations (location_id, location_name, region_name) VALUES (14, 'Raventree', 'The Riverlands')
INSERT INTO battle_locations (location_id, location_name, region_name) VALUES (15, 'Red Fork', 'The Riverlands')
INSERT INTO battle_locations (location_id, location_name, region_name) VALUES (16, 'Riverrun', 'The Riverlands')
INSERT INTO battle_locations (location_id, location_name, region_name) VALUES (17, 'Ruby Ford', 'The Riverlands')
INSERT INTO battle_locations (location_id, location_name, region_name) VALUES (18, 'Ryamsport, Vinetown, Starfish Harbor', 'The Reach')
INSERT INTO battle_locations (location_id, location_name, region_name) VALUES (19, 'Saltpans', 'The Riverlands')
INSERT INTO battle_locations (location_id, location_name, region_name) VALUES (20, 'Seagard', 'The Riverlands')
INSERT INTO battle_locations (location_id, location_name, region_name) VALUES (21, 'Shield Islands' , 'The Reach')
INSERT INTO battle_locations (location_id, location_name, region_name) VALUES (22, 'Stony Shore', 'The North')
INSERT INTO battle_locations (location_id, location_name, region_name) VALUES (23, 'Storms End', 'The Stormlands')
INSERT INTO battle_locations (location_id, location_name, region_name) VALUES (24, 'The Twins', 'The Riverlands')
INSERT INTO battle_locations (location_id, location_name, region_name) VALUES (25, 'Torrhens Square', 'The North')
INSERT INTO battle_locations (location_id, location_name, region_name) VALUES (26, 'Whispering Wood', 'The Riverlands')
INSERT INTO battle_locations (location_id, location_name, region_name) VALUES (27, 'Winterfell', 'The Riverlands')
INSERT INTO battle_locations (location_id, location_name, region_name) VALUES (28, 'Unknown', 'The Riverlands')
------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------- Insert data into battles table -----------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO battles (battle_id, battle_location_id, name, year_, major_death, major_capture, summer, battle_type) 
	VALUES (28, 1, 'Battle of Castle Black', 300, 1, 1, 0, 'siege')

INSERT INTO battles (battle_id, battle_location_id, name, year_, major_death, major_capture, summer, battle_type) 
	VALUES (20, 10, 'Battle of the Blackwater', 299, 1, 1, 1, 'pitched battle')

INSERT INTO battles (battle_id, battle_location_id, name, year_, major_death, major_capture, summer, battle_type) 
	VALUES (17, 15, 'Battle of the Fords', 299, 0, 0, 1, 'pitched battle')

INSERT INTO battles (battle_id, battle_location_id, name, year_, major_death, major_capture, summer, battle_type) 
	VALUES (4, 8, 'Battle of the Green Fork', 298, 1, 1, 1, 'pitched battle')

INSERT INTO battles (battle_id, battle_location_id, name, year_, major_death, major_capture, summer, battle_type)
	VALUES (3, 16, 'Battle of Riverrun', 298, 0, 1, 1, 'pitched battle')

INSERT INTO battles (battle_id, battle_location_id, name, year_, major_death, major_capture, summer, battle_type) 
	VALUES (1, 7, 'Battle of the Golden Tooth', 298, 1, 0, 1, 'pitched battle')

INSERT INTO battles (battle_id, battle_location_id, name, year_, major_death, major_capture, summer, battle_type) 
	VALUES (2, 12, 'Battle at the Mummers Ford', 298, 1, 0, 1, 'ambush')

INSERT INTO battles (battle_id, battle_location_id, name, year_, major_death, major_capture, summer, battle_type) 
	VALUES (6, 16, 'Battle of the Camps', 298, 0, 0, 1, 'ambush')

INSERT INTO battles (battle_id, battle_location_id, name, year_, major_death, major_capture, summer, battle_type) 
	VALUES (5, 26, 'Battle of the Whispering Wood', 298, 1, 1, 1, 'ambush')

INSERT INTO battles (battle_id, battle_location_id, name, year_, major_death, major_capture, summer, battle_type) 
	VALUES (7, 3, 'Sack of Darry', 298, 0, 0, 1, 'pitched battle')

INSERT INTO battles (battle_id, battle_location_id, name, year_, major_death, major_capture, summer, battle_type) 
	VALUES (8, 11, 'Battle of Moat Cailin', 299, 0, 0, 1, 'pitched battle')

INSERT INTO battles (battle_id, battle_location_id, name, year_, major_death, major_capture, summer, battle_type) 
	VALUES (9, 4, 'Battle of Deepwood Motte', 299, 0, 0, 1, 'siege')

INSERT INTO battles (battle_id, battle_location_id, name, year_, major_death, major_capture, summer, battle_type, notes) 
	VALUES (10, 22, 'Battle of the Stony Shore', 299, 0, 0, 1, 'ambush', 'Greyjoy troop number based on the Battle of Deepwood Motte, in which Asha had 1000		soldiers on 30 longships. That comes out to ~33 per longship. In the Battle of the Stony Shore, Theon has 8 longships, and just we can estimate that he has		(8*33) =265 troops.')

INSERT INTO battles (battle_id, battle_location_id, name, year_, major_death, major_capture, summer, battle_type, notes) 
	VALUES (11, 25, 'Battle of Torrhens Square', 299, 0, 0, 1, 'pitched battle', 'Greyjoy troop numbers come from the 264 estimated to have arrived on the stony	shore minus the 20 Theon takes to attack Winterfell. Thus 264-20=244')

INSERT INTO battles (battle_id, battle_location_id, name, year_, major_death, major_capture, summer, battle_type, notes) 
	VALUES (12, 27, 'Battle of Winterfell', 299, 0, 1, 1, 'ambush', 'It is not mentioned how many Stark men are left in Winterfell, other than "very few".')

INSERT INTO battles (battle_id, battle_location_id, name, year_, major_death, major_capture, summer, battle_type) 
	VALUES (13, 25, 'Sack of Torrhens Square', 299, 0, 1, 1, 'siege')

INSERT INTO battles (battle_id, battle_location_id, name, year_, major_death, major_capture, summer, battle_type, notes) 
	VALUES (14, 27, 'Sack of Winterfell', 299, 1, 0, 1, 'ambush', 'Since House Bolton betrays the Starks for House Lannister, we code this battle as between these	two houses. Greyjoy men, numbering only 20, do not play a major part in the fighting and end up dying anyway.')

INSERT INTO battles (battle_id, battle_location_id, name, year_, major_death, major_capture, summer, battle_type) 
	VALUES (15, 13, 'Battle of the Oxcross', 298, 1, 1, 1, 'ambush')

INSERT INTO battles (battle_id, battle_location_id, name, year_, major_death, major_capture, summer, battle_type) 
	VALUES (16, 23, 'Battle of Storms End', 299, 1, 0, 1, 'siege')

INSERT INTO battles (battle_id, battle_location_id, name, year_, major_death, major_capture, summer, battle_type) 
	VALUES (18, 9, 'Sack of Harrenhal', 299, 1, 0, 1, 'ambush')

INSERT INTO battles (battle_id, battle_location_id, name, year_, major_death, major_capture, summer, battle_type) 
	VALUES (19, 2, 'Battle of the Crag',299, 0, 0, 1, 'ambush')

INSERT INTO battles (battle_id, battle_location_id, name, year_, major_death, major_capture, summer, battle_type) 
	VALUES (21, 3, 'Siege of Darry', 299, 0, 0, 1, 'siege')

INSERT INTO battles (battle_id, battle_location_id, name, year_, major_death, major_capture, summer, battle_type) 
	VALUES (22, 6, 'Battle of Duskendale', 299, 1, 0, 1, 'pitched battle')

INSERT INTO battles (battle_id, battle_location_id, name, year_, major_death, major_capture, summer, battle_type) 
	VALUES (23, 28, 'Battle of the Burning Septry', 299, 0, 0, 1, 'pitched battle')

INSERT INTO battles (battle_id, battle_location_id, name, year_, major_death, major_capture, battle_type) 
	VALUES (24, 17, 'Battle of the Ruby Ford', 299, 0, 0, 'pitched battle')

INSERT INTO battles (battle_id, battle_location_id, name, year_, major_death, major_capture, summer, battle_type) 
	VALUES (25, 9, 'Retaking of Harrenhal', 299, 1, 0, 1, 'pitched battle')

INSERT INTO battles (battle_id, battle_location_id, name, year_, major_death, major_capture, summer, battle_type, notes) 
	VALUES (26, 24, 'The Red Wedding', 299, 1, 1, 1, 'ambush', 'This observation refers to the battle against the Stark men, not the attack on the wedding')

INSERT INTO battles (battle_id, battle_location_id, name, year_, major_death, major_capture, summer, battle_type) 
	VALUES (27, 20, 'Siege of Seagard', 299, 0, 1, 1, 'siege')

INSERT INTO battles (battle_id, battle_location_id, name, year_, major_death, major_capture, summer, battle_type) 
	VALUES (29, 11, 'Fall of Moat Cailin', 300, 0, 0, 0, 'siege')

INSERT INTO battles (battle_id, battle_location_id, name, year_, major_death, major_capture, summer, battle_type) 
	VALUES (30, 19, 'Sack of Saltpans', 300, 0, 0, 0, 'razing')

INSERT INTO battles (battle_id, battle_location_id, name, year_, major_death, major_capture, summer, battle_type) 
	VALUES (31, 4, 'Retaking of Deepwood Motte', 300, 0, 0, 0, 'pitched battle')

INSERT INTO battles (battle_id, battle_location_id, name, year_, major_death, major_capture, summer, battle_type) 
	VALUES (32, 21, 'Battle of Shield Islands', 300, 0, 0, 0, 'pitched battle')

INSERT INTO battles (battle_id, battle_location_id, name, year_, major_death, major_capture, summer, battle_type) 
	VALUES (33, 18, 'Invasion of Ryamsport, Vinetown, and Starfish Harbor', 300, 0, 0, 0, 'razing')

INSERT INTO battles (battle_id, battle_location_id, name, year_, major_death, major_capture, summer, battle_type) 
	VALUES (34, 23, 'Second Siege of Storms End', 300, 0, 0, 0, 'siege')

INSERT INTO battles (battle_id, battle_location_id, name, year_, major_death, major_capture, summer, battle_type) 
	VALUES (35, 5, 'Siege of Dragonstone', 300, 0, 0, 0, 'siege')

INSERT INTO battles (battle_id, battle_location_id, name, year_, major_death, major_capture, summer, battle_type) 
	VALUES (36, 16, 'Siege of Riverrun', 300, 0, 0, 0, 'siege')

INSERT INTO battles (battle_id, battle_location_id, name, year_, major_death, major_capture, summer, battle_type) 
	VALUES (37, 14, 'Siege of Raventree', 300, 0, 1, 0, 'siege')

INSERT INTO battles (battle_id, battle_location_id, name, year_, summer, battle_type) 
	VALUES (38, 27, 'Siege of Winterfell', 300, 0, 'siege')
------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------- Insert data into houses_and_groups -------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO houses_and_allegiances (house_or_allegiances_id, house_allegiances_name)
	VALUES (1, 'Baratheon')

INSERT INTO houses_and_allegiances (house_or_allegiances_id, house_allegiances_name)
	VALUES (2, 'Blackwood')

INSERT INTO houses_and_allegiances (house_or_allegiances_id, house_allegiances_name)
	VALUES (3, 'Bolton')

INSERT INTO houses_and_allegiances (house_or_allegiances_id, house_allegiances_name)
	VALUES (4, 'Bracken')

INSERT INTO houses_and_allegiances (house_or_allegiances_id, house_allegiances_name)
	VALUES (5, 'Brave Companions')

INSERT INTO houses_and_allegiances (house_or_allegiances_id, house_allegiances_name)
	VALUES (6, 'The Brotherhood Without Banners')

INSERT INTO houses_and_allegiances (house_or_allegiances_id, house_allegiances_name)
	VALUES (7, 'Darry')

INSERT INTO houses_and_allegiances (house_or_allegiances_id, house_allegiances_name)
	VALUES (8, 'Free Folk')

INSERT INTO houses_and_allegiances (house_or_allegiances_id, house_allegiances_name)
	VALUES (9, 'Frey')

INSERT INTO houses_and_allegiances (house_or_allegiances_id, house_allegiances_name)
	VALUES (10, 'Glover')

INSERT INTO houses_and_allegiances (house_or_allegiances_id, house_allegiances_name)
	VALUES (11, 'Greyjoy')

INSERT INTO houses_and_allegiances (house_or_allegiances_id, house_allegiances_name)
	VALUES (12, 'Karstark')

INSERT INTO houses_and_allegiances (house_or_allegiances_id, house_allegiances_name)
	VALUES (13, 'Lannister')

INSERT INTO houses_and_allegiances (house_or_allegiances_id, house_allegiances_name)
	VALUES (14, 'Mallister')

INSERT INTO houses_and_allegiances (house_or_allegiances_id, house_allegiances_name)
	VALUES (15, 'Mormont')

INSERT INTO houses_and_allegiances (house_or_allegiances_id, house_allegiances_name)
	VALUES (16, 'The Night''s Watch')

INSERT INTO houses_and_allegiances (house_or_allegiances_id, house_allegiances_name)
	VALUES (17, 'Stark')

INSERT INTO houses_and_allegiances (house_or_allegiances_id, house_allegiances_name)
	VALUES (18, 'Thenns')

INSERT INTO houses_and_allegiances (house_or_allegiances_id, house_allegiances_name)
	VALUES (19, 'Tully')

INSERT INTO houses_and_allegiances (house_or_allegiances_id, house_allegiances_name)
	VALUES (20, 'Tyrell')

INSERT INTO houses_and_allegiances (house_or_allegiances_id, house_allegiances_name)
	VALUES (21, 'Brax')

INSERT INTO houses_and_allegiances (house_or_allegiances_id, house_allegiances_name)
	VALUES (22, 'Redwyne')

INSERT INTO houses_and_allegiances (house_or_allegiances_id, house_allegiances_name)
	VALUES (23, 'Rowan')

INSERT INTO houses_and_allegiances (house_or_allegiances_id, house_allegiances_name)
	VALUES (24, 'Tallhart')

INSERT INTO houses_and_allegiances (house_or_allegiances_id, house_allegiances_name)
	VALUES (25, 'Cassel')

INSERT INTO houses_and_allegiances (house_or_allegiances_id, house_allegiances_name)
	VALUES (26, 'Hornwood')

INSERT INTO houses_and_allegiances (house_or_allegiances_id, house_allegiances_name)
	VALUES (27, 'Seaworth')

INSERT INTO houses_and_allegiances (house_or_allegiances_id, house_allegiances_name)
	VALUES (28, 'Florent')

INSERT INTO houses_and_allegiances (house_or_allegiances_id, house_allegiances_name)
	VALUES (29, 'Morrigen')

INSERT INTO houses_and_allegiances (house_or_allegiances_id, house_allegiances_name)
	VALUES (30, 'Marbrand')

INSERT INTO houses_and_allegiances (house_or_allegiances_id, house_allegiances_name)
	VALUES (31, 'Caron')

INSERT INTO houses_and_allegiances (house_or_allegiances_id, house_allegiances_name)
	VALUES (32, 'Crakehall')

INSERT INTO houses_and_allegiances (house_or_allegiances_id, house_allegiances_name)
	VALUES (33, 'Lefford')

INSERT INTO houses_and_allegiances (house_or_allegiances_id, house_allegiances_name)
	VALUES (34, 'Lorch')

INSERT INTO houses_and_allegiances (house_or_allegiances_id, house_allegiances_name)
	VALUES (35, 'Piper')

INSERT INTO houses_and_allegiances (house_or_allegiances_id, house_allegiances_name)
	VALUES (36, 'Vance')

INSERT INTO houses_and_allegiances (house_or_allegiances_id, house_allegiances_name)
	VALUES (37, 'Farring')

INSERT INTO houses_and_allegiances (house_or_allegiances_id, house_allegiances_name)
	VALUES (38, 'Prester')

INSERT INTO houses_and_allegiances (house_or_allegiances_id, house_allegiances_name)
	VALUES (39, 'Penrose')

INSERT INTO houses_and_allegiances (house_or_allegiances_id, house_allegiances_name)
	VALUES (40, 'Jast')

INSERT INTO houses_and_allegiances (house_or_allegiances_id, house_allegiances_name)
	VALUES (41, 'Bywater')

INSERT INTO houses_and_allegiances (house_or_allegiances_id, house_allegiances_name)
	VALUES (42, 'Clegane')

INSERT INTO houses_and_allegiances (house_or_allegiances_id, house_allegiances_name)
	VALUES (43, 'Umber')

INSERT INTO houses_and_allegiances (house_or_allegiances_id, house_allegiances_name)
	VALUES (44, 'Cerwyn')

INSERT INTO houses_and_allegiances (house_or_allegiances_id, house_allegiances_name)
	VALUES (45, 'Manderly')

INSERT INTO houses_and_allegiances (house_or_allegiances_id, house_allegiances_name)
	VALUES (46, 'Tarly')

INSERT INTO houses_and_allegiances (house_or_allegiances_id, house_allegiances_name)
	VALUES (47, 'Spicer')
------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------- Insert data into individuals table --------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO individuals (individual_id, individual_allegiances_id, first_name, last_name, nobility)
	VALUES (1, 11, 'Asha', 'Greyjoy', 1)

INSERT INTO individuals (individual_id, individual_allegiances_id, first_name, last_name, nobility)
	VALUES (2, 11, 'Dagmer', 'Cleftjaw', 0)

INSERT INTO individuals (individual_id, individual_allegiances_id, first_name, last_name, titles, nobility)
	VALUES (3, 13, 'Daven', 'Lannister', 'Ser', 1)

INSERT INTO individuals (individual_id, individual_allegiances_id, first_name, last_name, titles, nobility)
	VALUES (4, 9, 'Ryman', 'Frey', 'Ser', 1)

INSERT INTO individuals (individual_id, individual_allegiances_id, first_name, last_name, titles, nobility)
	VALUES (5, 13, 'Jaime', 'Lannister', 'Ser', 1)

INSERT INTO individuals (individual_id, individual_allegiances_id, first_name, last_name, titles, nobility)
	VALUES (6, 11, 'Euron', 'Greyjoy', 'King of the Iron Islands', 1)

INSERT INTO individuals (individual_id, individual_allegiances_id, first_name, last_name, titles, nobility)
	VALUES (7, 11, 'Victarion', 'Greyjoy', 'Lord Captain of the Iron Fleet', 1)

INSERT INTO individuals (individual_id, individual_allegiances_id, first_name, last_name, titles, nobility)
	VALUES (8, 42, 'Gregor', 'Clegane', 'Ser', 1)

INSERT INTO individuals (individual_id, individual_allegiances_id, first_name, last_name, titles, nobility)
	VALUES (9, 21, 'Andros', 'Brax', 'Lord of Hornvale', 1)

INSERT INTO individuals (individual_id, individual_allegiances_id, first_name, last_name, titles, nobility)
	VALUES (10, 11, 'Loras', 'Tyrell', 'Ser', 1)

INSERT INTO individuals (individual_id, individual_allegiances_id, first_name, last_name, titles, nobility)
	VALUES (11, 22, 'Paxter', 'Redwyne', 'Lord of the Arbor', 1)

INSERT INTO individuals (individual_id, individual_allegiances_id, first_name, last_name, titles, nobility)
	VALUES (12, 4, 'Jonos', 'Bracken', 'Lord of Stone Hedge', 1)

INSERT INTO individuals (individual_id, individual_allegiances_id, first_name, last_name, titles, nobility)
	VALUES (13, 21, 'Mace', 'Tyrell', 'Lord of Highgarden', 1)

INSERT INTO individuals (individual_id, individual_allegiances_id, first_name, last_name, titles, nobility)
	VALUES (14, 23, 'Mathis', 'Rowan', 'Lord of Goldengrove', 1)

INSERT INTO individuals (individual_id, individual_allegiances_id, first_name, last_name, titles, nobility)
	VALUES (15, 8, 'Mance', 'Rayder', 'The King Beyond the Wall', 0)

INSERT INTO individuals (individual_id, individual_allegiances_id, first_name, last_name, nobility)
	VALUES (16, 8, 'Tormund', 'Giantsbane', 0)

INSERT INTO individuals (individual_id, individual_allegiances_id, first_name, last_name, titles, nobility)
	VALUES (18, 8, 'Styr', 'Thenns', 'Magnar', 0)

INSERT INTO individuals (individual_id, individual_allegiances_id, first_name, last_name, nobility)
	VALUES (19, 8, 'Varamyr', 'Sixskins', 0)

INSERT INTO individuals (individual_id, individual_allegiances_id, first_name, last_name, titles, nobility)
	VALUES (20, 3, 'Ramsay', 'Bolton', 'Lord of Winterfell and the Hornwood', 1)

INSERT INTO individuals (individual_id, individual_allegiances_id, first_name, last_name, nobility)
	VALUES (17, 8, 'Harma', 'Dogshead', 0)

INSERT INTO individuals (individual_id, individual_allegiances_id, first_name, last_name, nobility)
	VALUES (21, 11, 'Theon', 'Greyjoy', 1)

INSERT INTO individuals (individual_id, individual_allegiances_id, first_name, last_name, titles, nobility)
	VALUES (22, 17, 'Robb', 'Stark', 'The King in the North', 1)

INSERT INTO individuals (individual_id, individual_allegiances_id, first_name, last_name, titles, nobility)
	VALUES (23, 19, 'Brynden', 'Tully', 'Ser', 1)

INSERT INTO individuals (individual_id, individual_allegiances_id, first_name, last_name, nobility)
	VALUES (24, 43, 'Smalljon', 'Umber', 1)

INSERT INTO individuals (individual_id, individual_allegiances_id, first_name, last_name, nobility)
	VALUES (25, 9, 'Black Walder', 'Frey', 1)

INSERT INTO individuals (individual_id, individual_allegiances_id, first_name, last_name, titles, nobility)
	VALUES (26, 2, 'Tytos', 'Blackwood', 'Lord of Raventree Hall', 1)

INSERT INTO individuals (individual_id, individual_allegiances_id, first_name, last_name, nobility)
	VALUES (27, 10, 'Robett', 'Glover', 1)

INSERT INTO individuals (individual_id, individual_allegiances_id, first_name, last_name, titles, nobility)
	VALUES (28, 24, 'Helman', 'Tallhart', 'Ser', 1)

INSERT INTO individuals (individual_id, individual_allegiances_id, first_name, last_name, titles, nobility)
	VALUES (29, 25, 'Rodrik', 'Cassel', 'Ser', 0)

INSERT INTO individuals (individual_id, individual_allegiances_id, first_name, last_name, titles, nobility)
	VALUES (30, 44, 'Cley', 'Cerwyn', 'Lord of Cerwyn', 1)

INSERT INTO individuals (individual_id, individual_allegiances_id, first_name, last_name, titles, nobility)
	VALUES (31, 3, 'Roose', 'Bolton', 'Lord of the Dreadfort and Warden of the North', 1)

INSERT INTO individuals (individual_id, individual_allegiances_id, first_name, last_name, titles, nobility)
	VALUES (32, 5, 'Vargo', 'Hoat', 'Commander of the Brave Companions', 0)

INSERT INTO individuals (individual_id, individual_allegiances_id, first_name, last_name, titles, nobility)
	VALUES (33, 45, 'Wylis', 'Manderly', 'Ser', 1)

INSERT INTO individuals (individual_id, individual_allegiances_id, first_name, last_name, titles, nobility)
	VALUES (34, 44, 'Medger', 'Cerweyn', 'Lord of Cerwyn', 1)

INSERT INTO individuals (individual_id, individual_allegiances_id, first_name, last_name, titles, nobility)
	VALUES (35, 12, 'Harrion', 'Karstark', 'Lord of Karhold', 1)

INSERT INTO individuals (individual_id, individual_allegiances_id, first_name, last_name, titles, nobility)
	VALUES (36, 26, 'Halys', 'Hornwood', 'Lord of the Hornwood', 1)

INSERT INTO individuals (individual_id, individual_allegiances_id, first_name,last_name, nobility)
	VALUES (37, 16, 'Rorge', 'N/A', 0)

INSERT INTO individuals (individual_id, individual_allegiances_id, first_name, last_name, titles, nobility)
	VALUES (38, 1, 'Stannis', 'Baratheon', 'King of the Seven Kingdoms', 1)

INSERT INTO individuals (individual_id, individual_allegiances_id, first_name, last_name, titles, nobility)
	VALUES (39, 15, 'Alysane', 'Mormont', 'Lady', 1)

INSERT INTO individuals (individual_id, individual_allegiances_id, first_name, last_name, titles, nobility)
	VALUES (40, 27, 'Davos', 'Seaworth', 'Ser, Lord of the Rainwood', 1)

INSERT INTO individuals (individual_id, individual_allegiances_id, first_name, last_name, titles, nobility)
	VALUES (41, 28, 'Imry', 'Florent', 'Ser', 1)

INSERT INTO individuals (individual_id, individual_allegiances_id, first_name, last_name, titles, nobility)
	VALUES (42, 29, 'Guyard', 'Morrigen', 'Ser', 1)

INSERT INTO individuals (individual_id, individual_allegiances_id, first_name, last_name, titles, nobility)
	VALUES (43, 31, 'Rolland', 'Storm', 'Ser', 1)

INSERT INTO individuals (individual_id, individual_allegiances_id, first_name, last_name, titles, nobility)
	VALUES (44, 1, 'Salladhor', 'Saan', 'Lord of Blackwater Bay and Prince of the Narrow Sea', 0)

INSERT INTO individuals (individual_id, individual_allegiances_id, first_name, last_name, titles, nobility)
	VALUES (45, 13, 'Tywin', 'Lannister', 'Lord of Casterly Rock and Warden of the West', 1)

INSERT INTO individuals (individual_id, individual_allegiances_id, first_name, last_name, titles, nobility)
	VALUES (46, 21, 'Flement', 'Brax', 'Ser', 1)

INSERT INTO individuals (individual_id, individual_allegiances_id, first_name, last_name, titles, nobility)
	VALUES (47, 30, 'Addam', 'Marbrand', 'Ser', 1)

INSERT INTO individuals (individual_id, individual_allegiances_id, first_name, last_name, titles, nobility)
	VALUES (48, 32, 'Lyle', 'Crakehall', 'Ser', 1)

INSERT INTO individuals (individual_id, individual_allegiances_id, first_name, last_name, titles, nobility)
	VALUES (49, 33, 'Leo', 'Lefford', 'Lord of the Golden Tooth', 1)

INSERT INTO individuals (individual_id, individual_allegiances_id, first_name, last_name, titles, nobility)
	VALUES (50, 11, 'Balon', 'Greyjoy', 'King of the Iron Islands and the North', 1)

INSERT INTO individuals (individual_id, individual_allegiances_id, first_name, last_name, titles, nobility)
	VALUES (51, 9, 'Walder', 'Frey', 'Lord of the Crossing', 1)

INSERT INTO individuals (individual_id, individual_allegiances_id, first_name, last_name, titles, nobility)
	VALUES (52, 9, 'Walder', 'Rivers', 'Ser', 0)

INSERT INTO individuals (individual_id, individual_allegiances_id, first_name, last_name, titles, nobility)
	VALUES (53, 34, 'Amory', 'Lorch', 'Ser', 1)

INSERT INTO individuals (individual_id, individual_allegiances_id, first_name, last_name, titles, nobility)
	VALUES (54, 6, 'Beric', 'Dondarrion', 'Lord of Blackhaven, Ser', 1)

INSERT INTO individuals (individual_id, individual_allegiances_id, first_name, last_name, titles, nobility)
	VALUES (55, 17, 'Bran', 'Stark', 'Lord of Winterfell', 1)

INSERT INTO individuals (individual_id, individual_allegiances_id, first_name, last_name, titles, nobility)
	VALUES (56, 35, 'Clement', 'Piper', 'Lord of Pinkmaiden', 1)

INSERT INTO individuals (individual_id, individual_allegiances_id, first_name, last_name, titles, nobility)
	VALUES (57, 36, 'Karyl', 'Vance', 'Lord of Wayfarer''s Rest, Ser', 1)

INSERT INTO individuals (individual_id, individual_allegiances_id, first_name, last_name, titles, nobility)
	VALUES (58, 14, 'Jason', 'Mallister', 'Lord of Seagard', 1)

INSERT INTO individuals (individual_id, individual_allegiances_id, first_name, last_name, titles, nobility)
	VALUES (59, 37, 'Gilbert', 'Farring', 'Ser', 1)

INSERT INTO individuals (individual_id, individual_allegiances_id, first_name, last_name, titles, nobility)
	VALUES (60, 38, 'Forley', 'Preseter', 'Ser', 1)

INSERT INTO individuals (individual_id, individual_allegiances_id, first_name, last_name, titles, nobility)
	VALUES (61, 7, 'Lyman', 'Darry', 'Lord of Darry', 1)

INSERT INTO individuals (individual_id, individual_allegiances_id, first_name, last_name, titles, nobility)
	VALUES (62, 46, 'Randyll', 'Tarly', 'Lord of Horn Hill', 1)

INSERT INTO individuals (individual_id, individual_allegiances_id, first_name, last_name, titles, nobility)
	VALUES (63, 1, 'Renly', 'Baratheon', 'King of the Seven Kingdoms', 1)

INSERT INTO individuals (individual_id, individual_allegiances_id, first_name, last_name, titles, nobility)
	VALUES (64, 39, 'Cortnay', 'Penrose', 'Ser', 1)

INSERT INTO individuals (individual_id, individual_allegiances_id, first_name, last_name, nobility)
	VALUES (65, 24, 'Leobald', 'Tallhart', 1)

INSERT INTO individuals (individual_id, individual_allegiances_id, first_name, last_name, titles, nobility)
	VALUES (66, 47, 'Rolph', 'Spicer', 'Ser', 1)

INSERT INTO individuals (individual_id, individual_allegiances_id, first_name, last_name, titles, nobility)
	VALUES (67, 32, 'Roland', 'Crakehall', 'Lord of Crakehall', 1)

INSERT INTO individuals (individual_id, individual_allegiances_id, first_name, last_name, titles, nobility)
	VALUES (68, 40, 'Antario', 'Jast', 'Lord', 1)

INSERT INTO individuals (individual_id, individual_allegiances_id, first_name, last_name, titles, nobility)
	VALUES (69, 16, 'Jon', 'Snow', 'Lord Commander of the Night''s Watch', 1)

INSERT INTO individuals (individual_id, individual_allegiances_id, first_name, last_name, nobility)
	VALUES (70, 16, 'Donal', 'Noye', 0)

INSERT INTO individuals (individual_id, individual_allegiances_id, first_name, last_name, nobility)
	VALUES (71, 16, 'Cotter', 'Pyke', 0)

INSERT INTO individuals (individual_id, individual_allegiances_id, first_name, last_name, titles, nobility)
	VALUES (72, 13, 'Tyrion', 'Lannister', '(rightful) Lord of Casterly Rock', 1)

INSERT INTO individuals (individual_id, individual_allegiances_id, first_name, last_name, titles, nobility)
	VALUES (73, 41, 'Jacelyn', 'Bywater', 'Ser', 1)

INSERT INTO individuals (individual_id, individual_allegiances_id, first_name, last_name, nobility)
	VALUES (74, 42, 'Sandor', 'Clegane', 1)

INSERT INTO individuals (individual_id, individual_allegiances_id, first_name, last_name, titles, nobility)
	VALUES (75, 20, 'Garlan', 'Tyrell', 'Lord of Brightwater Keep', 1)

INSERT INTO individuals (individual_id, individual_allegiances_id, first_name, last_name, titles, nobility)
	VALUES (76, 13, 'Kevan', 'Lannister', 'Ser', 1)

INSERT INTO individuals (individual_id, individual_allegiances_id, first_name, last_name, titles, nobility)
	VALUES (77, 1, 'Joffrey', 'Baratheon', 'King of the Seven Kingdoms', 1)

INSERT INTO individuals (individual_id, individual_allegiances_id, first_name, last_name, titles, nobility)
	VALUES (78, 1, 'Tommen', 'Baratheon', 'King of the Seven Kingdoms', 1)

INSERT INTO individuals (individual_id, individual_allegiances_id, first_name, last_name, titles, nobility)
	VALUES (79, 19, 'Edmure', 'Tully', 'Ser', 1)

INSERT INTO individuals (individual_id, individual_allegiances_id, first_name, last_name, titles, nobility)
	VALUES (80, 13, 'Stafford', 'Lannister', 'Ser', 1)
------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------- Insert data into battle_combatants_bridge -------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status,	combatant_size)
	VALUES (1, 22, 17, 'Defender', 'Loss', 1)

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status, combatant_size)
	VALUES (1, 22, 19, 'Defender', 'Loss', 4000)

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status, combatant_size)
	VALUES (1, 77, 1, 'Attacker', 'Win', 1)

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status, combatant_size)
	VALUES (1, 78, 1, 'Attacker', 'Win', 1)

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status, combatant_size)
	VALUES (1, 5, 13, 'Attacker', 'Win', 1)

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status, combatant_size)
	VALUES (1, 77, 13, 'Attacker', 'Win', 15000)

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status)
	VALUES (2, 77, 1, 'Attacker', 'Win')

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status)
	VALUES (2, 78, 1, 'Attacker', 'Win')

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status)
	VALUES (2, 8, 42, 'Attacker', 'Win')

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status, combatant_size)
	VALUES (2, 22, 17, 'Defender', 'Loss', 1)

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status, combatant_size)
	VALUES (2, 54, 17, 'Defender', 'Loss', 120)

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status, combatant_size)
	VALUES (3, 77, 1, 'Attacker', 'Win', 1)

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status, combatant_size)
	VALUES (3, 78, 1, 'Attacker', 'Win', 1)

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status, combatant_size)
	VALUES (3, 5, 13, 'Attacker', 'Win', 15000)

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status, combatant_size)
	VALUES (3, 9, 21, 'Attacker', 'Win', 1)

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status, combatant_size)
	VALUES (3, 22, 17, 'Defender', 'Loss', 1)

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status, combatant_size)
	VALUES (3, 79, 19, 'Defender', 'Loss', 10000)

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status, combatant_size)
	VALUES (3, 26, 2, 'Defender', 'Loss', 1)

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status, combatant_size)
	VALUES (4, 22, 17, 'Attacker', 'Loss', 18000)

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status, combatant_size)
	VALUES (4, 31, 3, 'Attacker', 'Loss', 1)

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status, combatant_size)
	VALUES (4, 33, 45, 'Attacker', 'Loss', 1)

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status, combatant_size)
	VALUES (4, 35, 12, 'Attacker', 'Loss', 1)

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status, combatant_size)
	VALUES (4, 36, 26, 'Attacker', 'Loss', 1)

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status, combatant_size)
	VALUES (4, 77, 1, 'Defender', 'Win', 1)

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status, combatant_size)
	VALUES (4, 78, 1, 'Defender', 'Win', 1)

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status, combatant_size)
	VALUES (4, 45, 13, 'Defender', 'Win', 20000)

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status, combatant_size)
	VALUES (4, 8, 42, 'Defender', 'Win', 1)

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status, combatant_size)
	VALUES (4, 76, 13, 'Defender', 'Win', 1)

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status, combatant_size)
	VALUES (4, 47, 30, 'Defender', 'Win', 1)

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status, combatant_size)
	VALUES (5, 22, 17, 'Attacker', 'Win', 1875)

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status, combatant_size)
	VALUES (5, 23, 19, 'Attacker', 'Win', 1)

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status, combatant_size)
	VALUES (5, 77, 1, 'Defender', 'Loss', 1)

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status, combatant_size)
	VALUES (5, 78, 1, 'Defender', 'Loss', 1)

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status, combatant_size)
	VALUES (5, 5, 13, 'Defender', 'Loss', 6000)

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status, combatant_size)
	VALUES (6, 22, 17, 'Attacker', 'Win', 6000)

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status, combatant_size)
	VALUES (6, 26, 2, 'Attacker', 'Win', 1)

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status, combatant_size)
	VALUES (6, 23, 19, 'Attacker', 'Win', 1)

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status, combatant_size)
	VALUES (6, 77, 1, 'Defender', 'Loss', 1)

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status, combatant_size)
	VALUES (6, 78, 1, 'Defender', 'Loss', 1)

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status, combatant_size)
	VALUES (6, 9, 21, 'Defender', 'Loss', 12625)

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status, combatant_size)
	VALUES (6, 60, 38, 'Defender', 'Loss', 1)

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status)
	VALUES (7, 77, 1, 'Attacker', 'Win')

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status)
	VALUES (7, 78, 1, 'Attacker', 'Win')

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status)
	VALUES (7, 8, 42, 'Attacker', 'Win')

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status)
	VALUES (7, 22, 17, 'Defender', 'Loss')

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status)
	VALUES (7, 61, 7, 'Defender', 'Loss')

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status)
	VALUES (8, 50, 11, 'Attacker', 'Win')

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status)
	VALUES (8, 6, 11, 'Attacker', 'Win')

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status)
	VALUES (8, 7, 11, 'Attacker', 'Win')

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status)
	VALUES (8, 22, 17, 'Defender', 'Loss')

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status, combatant_size)
	VALUES (9, 50, 11, 'Attacker', 'Win', 1)

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status, combatant_size)
	VALUES (9, 6, 11, 'Attacker', 'Win', 1)

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status, combatant_size)
	VALUES (9, 1, 11, 'Attacker', 'Win', 1000)

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status)
	VALUES (9, 22, 17, 'Defender', 'Loss')

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status, combatant_size)
	VALUES (10, 50, 11, 'Attacker', 'Win', 1)

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status, combatant_size)
	VALUES (10, 6, 11, 'Attacker', 'Win', 1)

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status, combatant_size)
	VALUES (10, 21, 11, 'Attacker', 'Win', 264)

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status)
	VALUES (10, 22, 17, 'Defender', 'Loss')

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status, combatant_size)
	VALUES (11, 22, 17, 'Attacker', 'Win', 1)

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status, combatant_size)
	VALUES (11, 29, 25, 'Attacker', 'Win', 244)

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status, combatant_size)
	VALUES (11, 30, 44, 'Attacker', 'Win', 1)

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status, combatant_size)
	VALUES (11, 50, 11, 'Defender', 'Loss', 1)

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status, combatant_size)
	VALUES (11, 6, 11, 'Defender', 'Loss', 1)

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status, combatant_size)
	VALUES (11, 21, 11, 'Defender', 'Loss', 900)

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status, combatant_size)
	VALUES (12, 50, 11, 'Attacker', 'Win', 1)

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status, combatant_size)
	VALUES (12, 6, 11, 'Attacker', 'Win', 1)

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status, combatant_size)
	VALUES (12, 21, 11, 'Attacker', 'Win', 20)

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status)
	VALUES (12, 22, 17, 'Defender', 'Loss')

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status)
	VALUES (12, 55, 17, 'Defender', 'Loss')

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status)
	VALUES (13, 50, 11, 'Attacker', 'Win')

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status)
	VALUES (13, 6, 11, 'Attacker', 'Win')

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status)
	VALUES (13, 2, 11, 'Attacker', 'Win')

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status)
	VALUES (13, 22, 17, 'Defender', 'Loss')

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status, combatant_size)
	VALUES (14, 77, 1, 'Attacker', 'Win', 1)

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status, combatant_size)
	VALUES (14, 78, 1, 'Attacker', 'Win', 1)

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status, combatant_size)
	VALUES (14, 20, 3, 'Attacker', 'Win', 618)

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status, combatant_size)
	VALUES (14, 21, 11, 'Attacker', 'Win', 1)

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status, combatant_size)
	VALUES (14, 22, 17, 'Defender', 'Loss', 1)

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status, combatant_size)
	VALUES (14, 29, 25, 'Defender', 'Loss', 2000)

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status, combatant_size)
	VALUES (14, 30, 44, 'Defender', 'Loss', 1)

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status, combatant_size)
	VALUES (14, 65, 24, 'Defender', 'Loss', 1)

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status, combatant_size)
	VALUES (15, 22, 17, 'Attacker', 'Win', 6000)

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status, combatant_size)
	VALUES (15, 23, 19, 'Attacker', 'Win', 1)

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status, combatant_size)
	VALUES (15, 77, 1, 'Defender', 'Loss', 1)

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status, combatant_size)
	VALUES (15, 78, 1, 'Defender', 'Loss', 1)

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status, combatant_size)
	VALUES (15, 80, 13, 'Defender', 'Loss', 10000)

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status, combatant_size)
	VALUES (15, 67, 32, 'Defender', 'Loss', 1)

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status, combatant_size)
	VALUES (15, 68, 40, 'Defender', 'Loss', 1)

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status, combatant_size)
	VALUES (16, 38, 1, 'Attacker', 'Win', 5000)

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status, combatant_size)
	VALUES (16, 40, 27, 'Attacker', 'Win', 1)

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status, combatant_size)
	VALUES (16, 63, 1, 'Defender', 'Loss', 20000)

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status, combatant_size)
	VALUES (16, 64, 39, 'Defender', 'Loss', 1)

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status, combatant_size)
	VALUES (16, 10, 11, 'Defender', 'Loss', 1)

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status, combatant_size)
	VALUES (16, 62, 46, 'Defender', 'Loss', 1)

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status, combatant_size)
	VALUES (16, 14, 23, 'Defender', 'Loss', 1)

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status, combatant_size)
	VALUES (17, 77, 1, 'Attacker', 'Loss', 1)

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status, combatant_size)
	VALUES (17, 78, 1, 'Attacker', 'Loss', 1)

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status, combatant_size)
	VALUES (17, 45, 13, 'Attacker', 'Loss', 20000)

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status, combatant_size)
	VALUES (17, 46, 21, 'Attacker', 'Loss', 1)

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status, combatant_size)
	VALUES (17, 8, 42, 'Attacker', 'Loss', 1)

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status, combatant_size)
	VALUES (17, 47, 30, 'Attacker', 'Loss', 1)

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status, combatant_size)
	VALUES (17, 48, 32, 'Attacker', 'Loss', 1)

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status, combatant_size)
	VALUES (17, 49, 33, 'Attacker', 'Loss', 1)

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status, combatant_size)
	VALUES (17, 22, 17, 'Defender', 'Win', 1)

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status, combatant_size)
	VALUES (17, 79, 19, 'Defender', 'Win', 10000)

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status, combatant_size)
	VALUES (17, 58, 14, 'Defender', 'Win', 1)

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status, combatant_size)
	VALUES (17, 57, 36, 'Defender', 'Win', 1)

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status, combatant_size)
	VALUES (18, 22, 17, 'Attacker', 'Win', 1)

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status, combatant_size)
	VALUES (18, 31, 3, 'Attacker', 'Win', 100)

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status, combatant_size)
	VALUES (18, 32, 5, 'Attacker', 'Win', 1)

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status, combatant_size)
	VALUES (18, 27, 10, 'Attacker', 'Win', 1)

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status, combatant_size)
	VALUES (18, 77, 1, 'Defender', 'Loss', 1)

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status, combatant_size)
	VALUES (18, 78, 1, 'Defender', 'Loss', 1)

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status, combatant_size)
	VALUES (18, 53, 34, 'Defender', 'Loss', 100)

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status, combatant_size)
	VALUES (19, 22, 17, 'Attacker', 'Win', 6000)

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status, combatant_size)
	VALUES (19, 24, 43, 'Attacker', 'Win', 1)

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status, combatant_size)
	VALUES (19, 25, 9, 'Attacker', 'Win', 1)

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status)
	VALUES (19, 77, 1, 'Defender', 'Loss')

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status)
	VALUES (19, 78, 1, 'Defender', 'Loss')

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status)
	VALUES (19, 66, 47, 'Defender', 'Loss')

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status, combatant_size)
	VALUES (20, 38, 1, 'Attacker', 'Loss', 21000)

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status, combatant_size)
	VALUES (20, 41, 28, 'Attacker', 'Loss', 1)

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status, combatant_size)
	VALUES (20, 42, 29, 'Attacker', 'Loss', 1)

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status, combatant_size)
	VALUES (20, 43, 31, 'Attacker', 'Loss', 1)

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status, combatant_size)
	VALUES (20, 44, 1, 'Attacker', 'Loss', 1)

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status, combatant_size)
	VALUES (20, 40, 27, 'Attacker', 'Loss', 1)

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status, combatant_size)
	VALUES (20, 77, 1, 'Defender', 'Win', 1)

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status, combatant_size)
	VALUES (20, 78, 1, 'Defender', 'Win', 1)

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status, combatant_size)
	VALUES (20, 72, 13, 'Defender', 'Win', 7250)

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status, combatant_size)
	VALUES (20, 73, 41, 'Defender', 'Win', 1)

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status, combatant_size)
	VALUES (20, 74, 42, 'Defender', 'Win', 1)

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status, combatant_size)
	VALUES (20, 45, 13, 'Defender', 'Win', 1)

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status, combatant_size)
	VALUES (20, 75, 20, 'Defender', 'Win', 1)

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status, combatant_size)
	VALUES (20, 13, 21, 'Defender', 'Win', 1)

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status, combatant_size)
	VALUES (20, 62, 46, 'Defender', 'Win', 1)

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status)
	VALUES (21, 22, 17, 'Attacker', 'Win')

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status)
	VALUES (21, 28, 24, 'Attacker', 'Win')

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status)
	VALUES (21, 77, 1, 'Defender', 'Loss')

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status)
	VALUES (21, 78, 1, 'Defender', 'Loss')

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status, combatant_size)
	VALUES (22, 22, 17, 'Attacker', 'Loss', 1)

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status, combatant_size)
	VALUES (22, 27, 10, 'Attacker', 'Loss', 3000)

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status, combatant_size)
	VALUES (22, 28, 24, 'Attacker', 'Loss', 1)

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status)
	VALUES (22, 77, 1, 'Defender', 'Win')

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status)
	VALUES (22, 78, 1, 'Defender', 'Win')

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status)
	VALUES (22, 62, 46, 'Defender', 'Win')

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status)
	VALUES (22, 8, 42, 'Defender', 'Win')

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status)
	VALUES (24, 77, 1, 'Attacker', 'Win')

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status)
	VALUES (24, 78, 1, 'Attacker', 'Win')

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status)
	VALUES (24, 8, 42, 'Attacker', 'Win')

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status, combatant_size)
	VALUES (24, 22, 17, 'Defender', 'Loss', 1)

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status, combatant_size)
	VALUES (24, 31, 3, 'Defender', 'Loss', 6000)

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status, combatant_size)
	VALUES (24, 33, 45, 'Defender', 'Loss', 1)

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status)
	VALUES (25, 77, 1, 'Attacker', 'Win')

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status)
	VALUES (25, 78, 1, 'Attacker', 'Win')

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status)
	VALUES (25, 8, 42, 'Attacker', 'Win')

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status)
	VALUES (25, 32, 5, 'Defender', 'Loss')

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status, combatant_size)
	VALUES (26, 77, 1, 'Attacker', 'Win', 1)

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status, combatant_size)
	VALUES (26, 78, 1, 'Attacker', 'Win', 1)

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status, combatant_size)
	VALUES (26, 51, 9, 'Attacker', 'Win', 3500)

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status, combatant_size)
	VALUES (26, 52, 9, 'Attacker', 'Win', 1)

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status, combatant_size)
	VALUES (26, 31, 3, 'Attacker', 'Win', 1)

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status, combatant_size)
	VALUES (26, 22, 17, 'Defender', 'Loss', 3500)

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status)
	VALUES (27, 22, 17, 'Attacker', 'Win')

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status)
	VALUES (27, 51, 9, 'Attacker', 'Win')

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status)
	VALUES (27, 77, 1, 'Defender', 'Loss')

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status)
	VALUES (27, 78, 1, 'Defender', 'Loss')

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status)
	VALUES (27, 57, 14, 'Defender', 'Loss')

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status, combatant_size)
	VALUES (28, 15, 8, 'Attacker', 'Loss', 100000)

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status, combatant_size)
	VALUES (28, 16, 8, 'Attacker', 'Loss', 1)

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status, combatant_size)
	VALUES (28, 17, 8, 'Attacker', 'Loss', 1)

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status, combatant_size)
	VALUES (28, 18, 8, 'Attacker', 'Loss', 1)

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status, combatant_size)
	VALUES (28, 19, 8, 'Attacker', 'Loss', 1)

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status, combatant_size)
	VALUES (28, 38, 1, 'Defender', 'Win', 1240)

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status, combatant_size)
	VALUES (28, 69, 16, 'Defender', 'Win', 1)

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status, combatant_size)
	VALUES (28, 70, 16, 'Defender', 'Win', 1)

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status, combatant_size)
	VALUES (28, 71, 16, 'Defender', 'Win', 1)

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status)
	VALUES (29, 77, 1, 'Attacker', 'Win')

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status)
	VALUES (29, 78, 1 ,'Attacker', 'Win')

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status)
	VALUES (29, 20, 3, 'Attacker', 'Win')

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status)
	VALUES (29, 50, 11, 'Defender', 'Loss')

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status)
	VALUES (29, 6, 11, 'Defender', 'Loss')

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status, combatant_size)
	VALUES (31, 38, 1, 'Attacker', 'Win', 4500)

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status, combatant_size)
	VALUES (31, 39, 15, 'Attacker', 'Win', 1)

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status, combatant_size)
	VALUES (31, 50, 11, 'Defender', 'Loss', 1)

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status, combatant_size)
	VALUES (31, 6, 11, 'Defender', 'Loss', 1)

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status, combatant_size)
	VALUES (31, 1, 11, 'Defender', 'Loss', 200)

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status)
	VALUES (32, 50, 11, 'Attacker', 'Win')
	
INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status)
	VALUES (32, 6, 11, 'Attacker', 'Win')
	
INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status)
	VALUES (32, 7, 11, 'Attacker', 'Win')
	
INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status)
	VALUES (32, 77, 20, 'Defender', 'Loss')
	
INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status)
	VALUES (32, 78, 20, 'Defender', 'Loss') 

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status)
	VALUES (33, 50, 11, 'Attacker', 'Win')

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status)
	VALUES (33, 6, 11, 'Attacker', 'Win')

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status)
	VALUES (33, 7, 11, 'Attacker', 'Win')

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status)
	VALUES (33, 77, 20, 'Defender', 'Loss')

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status)
	VALUES (33, 78, 20, 'Defender', 'Loss')

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status)
	VALUES (34, 77, 1, 'Attacker', 'Win')

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status)
	VALUES (34, 78, 1, 'Attacker', 'Win')

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status)
	VALUES (34, 13, 21, 'Attacker', 'Win')

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status)
	VALUES (34, 14, 23, 'Attacker', 'Win')

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status, combatant_size)
	VALUES (34, 38, 1, 'Defender', 'Loss', 1)

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status, combatant_size)
	VALUES (34, 59, 37, 'Defender', 'Loss', 200)

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status, combatant_size)
	VALUES (35, 77, 1, 'Attacker', 'Win', 1)

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status, combatant_size)
	VALUES (35, 78, 1, 'Attacker', 'Win', 1)

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status, combatant_size)
	VALUES (35, 10, 11, 'Attacker', 'Win', 2000)

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status, combatant_size)
	VALUES (35, 11, 22, 'Attacker', 'Win', 1)

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status)
	VALUES (35, 38, 1, 'Defender', 'Loss')

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status)
	VALUES (35, 43, 31, 'Defender', 'Loss')

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status, combatant_size)
	VALUES (36, 77, 13, 'Attacker', 'Win', 1)

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status, combatant_size)
	VALUES (36, 78, 13, 'Attacker', 'Win', 1)

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status, combatant_size)
	VALUES (36, 5, 13, 'Attacker', 'Win', 3000)

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status, combatant_size)
	VALUES (36, 4, 9, 'Attacker', 'Win', 1)

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status, combatant_size)
	VALUES (36, 3, 13, 'Attacker', 'Win', 1)

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status)
	VALUES (36, 22, 17, 'Defender', 'Loss')

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status)
	VALUES (36, 23, 19, 'Defender', 'Loss')

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status, combatant_size)
	VALUES (37, 77, 13, 'Attacker', 'Win', 1)

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status, combatant_size)
	VALUES (37, 78, 13, 'Attacker', 'Win', 1)

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status, combatant_size)
	VALUES (37, 5, 13, 'Attacker', 'Win', 1500)

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status, combatant_size)
	VALUES (37, 12, 4, 'Attacker', 'Win', 1)

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status)
	VALUES (37, 22, 2, 'Defender', 'Loss')

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status)
	VALUES (37, 26, 2, 'Defender', 'Loss')

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status, combatant_size)
	VALUES (38, 38, 1, 'Attacker', 'Unknown', 5000)

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status, combatant_size)
	VALUES (38, 78, 3, 'Defender', 'Unknown', 1)

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status, combatant_size)
	VALUES (38, 77, 3, 'Defender', 'Unknown', 1)

INSERT INTO battle_combatant_bridge (battle_id_combatant_id, individual_battle_id, group_battle_id, combatant_type, combatant_status, combatant_size)
	VALUES (38, 31, 3, 'Defender', 'Unknown', 8000)
------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------- SELECT statement of the battles table ------------------------------------------------
SELECT 
	battle_id AS 'Battle ID', battle_location_id AS 'Location ID', name AS Name, year_ AS 'Year',
	CASE WHEN major_death = 1 THEN 'Yes' ELSE 'No' END AS 'Major Death', 
	CASE WHEN major_capture = 1 THEN 'Yes' ELSE 'No' END AS 'Major Capture',
	CASE WHEN summer = 1 THEN 'Yes' ELSE 'No' END AS 'Summer',
	CASE WHEN notes is NULL THEN ' ' ELSE notes END AS 'Notes',
	battle_type AS 'Battle Type'
FROM 
	battles
------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------- SELECT statement of the individuals table ---------------------------------------------
SELECT
	individual_id AS ID, individual_allegiances_id AS 'Allegiance ID',
	first_name + ' ' + last_name AS Name,
	CASE WHEN titles is NULL THEN ' ' ELSE titles END AS 'Titles',
	CASE WHEN nobility = 1 THEN 'Yes' ELSE 'No' END AS 'Nobility'
FROM
	individuals 
------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------- SELECT statement of the battle_locations table -------------------------------------------
SELECT
	location_id AS 'Location ID', region_name AS 'Region Name', location_name AS 'Location Name'
FROM
	battle_locations
------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------- SELECT statement of the houses_and_allegiances table ----------------------------------------
SELECT
	house_or_allegiances_id AS 'House/Allegiance ID', 
	house_allegiances_name AS 'House/Allegiance Name'
FROM
	houses_and_allegiances
------------------------------------------------------------------------------------------------------------------------------------
------------------------------------- SELECT statement of the battle_combatant_bridge table ----------------------------------------
SELECT
	battle_id_combatant_id AS 'Battle ID',
	individual_battle_id AS 'Individual-Battle ID',
	group_battle_id AS 'Allegiance-Battle ID',
	combatant_type AS 'Combatant Type',
	combatant_status AS 'Combatant Status',
	combatant_size AS 'Combatant Size'
FROM
	battle_combatant_bridge
------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------- SELECT statement of just the kings ---------------------------------------------------
SELECT
	individual_id AS ID, individual_allegiances_id AS 'Allegiance ID',
	first_name + ' ' + last_name AS Name,
	CASE WHEN titles is NULL THEN ' ' ELSE titles END AS 'Titles',
	CASE WHEN nobility = 1 THEN 'Yes' ELSE 'No' END AS 'Nobility'
FROM
	individuals 
WHERE 
	titles like '%King%'
------------------------------------------------------------------------------------------------------------------------------------
--------------------------------- Query of Top 10 battles by attacker size with battle information ---------------------------------
SELECT 
	TOP(10) combatant_size AS 'Attacking Forces Size',
	name AS 'Battle Name', region_name AS 'Region', location_name AS 'Location', year_ AS 'Year',
	CASE WHEN major_death = 1 THEN 'Yes' ELSE 'No' END AS 'Major Death?', 
	CASE WHEN major_capture = 1 THEN 'Yes' ELSE 'No' END AS 'Major Capture?',
	CASE WHEN summer = 1 THEN 'Yes' ELSE 'No' END AS 'Summer?',
	CASE WHEN notes is NULL THEN ' ' ELSE notes END AS 'Notes',
	battle_type AS 'Battle Type',
	first_name + ' ' + last_name AS 'Commander Name',
	CASE WHEN titles is NULL THEN ' ' ELSE titles END AS 'Commander''s Titles'
FROM 
	battle_combatant_bridge 
		JOIN battles ON battle_id_combatant_id = battle_id
		JOIN individuals ON individual_battle_id = individual_id
		JOIN battle_locations ON battle_location_id = location_id
WHERE
	combatant_type = 'Attacker'
ORDER BY
	combatant_size DESC
------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------ Query of the most winning attacker ------------------------------------------------
SELECT
    TOP (1) COUNT(individual_battle_id) 'Battles Fought', combatant_type AS 'Combatant Type', 
	combatant_status AS 'Battle Outcomes', first_name + ' ' + last_name AS 'Name'
FROM 
	battle_combatant_bridge
		JOIN 
			individuals on individual_id=individual_battle_id
WHERE 
	combatant_status NOT LIKE '%Loss%' AND combatant_status NOT LIKE '%Unknown%'
GROUP BY 
	combatant_type, combatant_status, first_name, last_name
ORDER BY
	COUNT(individual_battle_id) DESC

------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------ Query of the most losing attacker -------------------------------------------------
SELECT
    TOP (1) COUNT(individual_battle_id) 'Battles Fought', combatant_type AS 'Combatant Type', 
	combatant_status AS 'Battle Outcomes', first_name + ' ' + last_name AS 'Name'
FROM 
	battle_combatant_bridge
		JOIN 
			individuals on individual_id=individual_battle_id
WHERE 
	combatant_status NOT LIKE '%Win%' AND combatant_status NOT LIKE '%Unknown%'
GROUP BY 
	combatant_type, combatant_status, first_name, last_name
ORDER BY
	COUNT(individual_battle_id) DESC
------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------ Query of all battles of certain region --------------------------------------------
SELECT
	name AS 'Battle Name', year_ AS 'Year', 
	CASE WHEN major_death = 1 THEN 'Yes' ELSE 'No' END AS 'Major Death',
	CASE WHEN major_capture = 1 THEN 'Yes' ELSE 'No' END AS 'Major Capture',
	CASE WHEN summer = 1 THEN 'Yes' ELSE 'No' END AS 'Summer',
	battle_type AS 'Battle Type', region_name AS 'Region', 
	CASE WHEN notes is NULL THEN ' ' ELSE notes END AS 'Notes'
FROM
	battles
		JOIN
			battle_locations ON location_id = battle_location_id

------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------- Query of all battles by each Attacking King --------------------------------------------
SELECT
	first_name + ' ' + last_name AS 'Attacking King(s)',
	name AS 'Battle Name', year_ AS 'Year',
	CASE WHEN major_death = 1 THEN 'Yes' ELSE 'No' END AS 'Major Death', 
	CASE WHEN major_capture = 1 THEN 'Yes' ELSE 'No' END AS 'Major Capture',
	CASE WHEN summer = 1 THEN 'Yes' ELSE 'No' END AS 'Summer', battle_type AS 'Battle Type',
	CASE WHEN notes is NULL THEN ' ' ELSE notes END AS 'Notes'
FROM 
	battles
		JOIN
			battle_combatant_bridge ON battle_id_combatant_id = battle_id
		JOIN
			individuals ON individual_id = individual_battle_id
WHERE 
	combatant_type = 'Attacker' AND titles LIKE '%King%'
GO
------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------ VIEW of all battles of certain region ---------------------------------------------
CREATE VIEW v_battles_by_region
AS
SELECT
	battle_id AS 'Battle ID',location_id AS 'Location ID',
	name AS 'Battle Name', year_ AS 'Year', 
	CASE WHEN major_death = 1 THEN 'Yes' ELSE 'No' END AS 'Major Death',
	CASE WHEN major_capture = 1 THEN 'Yes' ELSE 'No' END AS 'Major Capture',
	CASE WHEN summer = 1 THEN 'Yes' ELSE 'No' END AS 'Summer',
	battle_type AS 'Battle Type', region_name AS 'Region', location_name AS 'Location', 
	CASE WHEN notes is NULL THEN ' ' ELSE notes END AS 'Notes'
FROM
	battles
		JOIN
			battle_locations ON location_id = battle_location_id

GO
--------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------- VIEW of all battles & attacking king information -------------------------------------------
CREATE VIEW v_kings_and_battles
AS
SELECT
	individual_id AS 'ID',first_name + ' ' + last_name AS 'Attacking King(s)',
	name AS 'Battle Name', year_ AS 'Year',
	CASE WHEN major_death = 1 THEN 'Yes' ELSE 'No' END AS 'Major Death', 
	CASE WHEN major_capture = 1 THEN 'Yes' ELSE 'No' END AS 'Major Capture',
	CASE WHEN summer = 1 THEN 'Yes' ELSE 'No' END AS 'Summer', battle_type AS 'Battle Type',
	CASE WHEN notes is NULL THEN ' ' ELSE notes END AS 'Notes'
FROM 
	battles
		JOIN
			battle_combatant_bridge ON battle_id_combatant_id = battle_id
		JOIN
			individuals ON individual_id = individual_battle_id
WHERE 
	combatant_type = 'Attacker' AND titles LIKE '%King%'