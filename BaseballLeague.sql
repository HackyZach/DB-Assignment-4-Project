CREATE TABLE TEAM ( 
	Team_Name VARCHAR(30),
	Number_Of_Coaches INT,
	Number_Of_Players INT,
	Jersey_Color VARCHAR(30),
	City VARCHAR(30),
	Total_Wins INT, -- Derives record
	Total_Losses INT, -- Derives record
	Date_Of_Establishment DATE,
	Num_Of_World_Series_Titles INT,

	PRIMARY KEY (Team_Name)
);

CREATE TABLE GAME ( 
	Date_Played DATE,
	Oppenent VARCHAR(30),
	Score VARCHAR(30),
	Stadium VARCHAR(30),
	T_Name VARCHAR(30),

	PRIMARY KEY (Date_Played),
	FOREIGN KEY (T_Name) REFERENCES TEAM(Team_Name)
);

CREATE TABLE COACH (
	First_Name VARCHAR(30), -- Coach_Derives name
	Last_Name VARCHAR(30),  -- Coach_Derives name
	Job_Title VARCHAR(30),
	Age INT,
	Num_Of_Years_Coaching INT,
	Dob DATE,
	Phone_Number CHAR(10),
	Email VARCHAR(50),
	T_Name VARCHAR(30),

	Zip CHAR(5),	-- Derives address
	Coach_State CHAR(2),	-- Derives address
	City CHAR(30),	-- Derives address
	Number INT, 			-- Derives street address
	Street VARCHAR(30),		-- Derives street address
	Apartment_Num VARCHAR(30),	-- Derives street address

	PRIMARY KEY (Phone_Number),
	FOREIGN KEY (T_Name) REFERENCES TEAM(Team_Name)
	
);

CREATE TABLE PLAYER(
	First_Name VARCHAR(30), -- Derives name
	Last_Name VARCHAR(30),  -- Derives name
	Position VARCHAR(30),
	Salary DECIMAL(10,2),
	Jersey_Number INT,
	Batting_Average VARCHAR(4),
	Home_Runs INT,
	Dob DATE,
	Age INT,
	Phone_Number CHAR(10),

	PRIMARY KEY (Phone_Number, Dob)
);

CREATE TABLE HAS(
	Team_Name VARCHAR(30),
	CPhone_Number CHAR(10),

	PRIMARY KEY (Team_Name, CPhone_Number),
	FOREIGN KEY (Team_Name) REFERENCES TEAM(Team_Name),
	FOREIGN KEY (CPhone_Number) REFERENCES COACH(Phone_Number)
);

CREATE TABLE TRAINS(
	CPhone_Number CHAR(10),
	PPhone_Number CHAR(10),
	Dob DATE,

	PRIMARY KEY (CPhone_Number, PPhone_Number),
	FOREIGN KEY (CPhone_Number) REFERENCES COACH(Phone_Number),
	FOREIGN KEY (PPhone_Number, Dob) REFERENCES PLAYER(Phone_Number, Dob)
);

CREATE TABLE ENROLLS(
	Team_Name VARCHAR(30),
	PPhone_Number CHAR(10),
	Dob DATE,

	PRIMARY KEY (Team_Name, PPhone_Number),
	FOREIGN KEY (Team_Name) REFERENCES TEAM(Team_Name),
	FOREIGN KEY (PPhone_Number, Dob) REFERENCES PLAYER(Phone_Number, Dob)
);

CREATE TABLE PLAYS(
	T_Name VARCHAR(30),
	Date_Played DATE,

	PRIMARY KEY (T_Name, Date_Played),
	FOREIGN KEY (T_Name) REFERENCES TEAM(Team_Name),
	FOREIGN KEY (Date_Played) REFERENCES GAME(Date_Played)
);

CREATE TABLE CONTAINS_(
	Date_Played DATE,
	PPhone_Number CHAR(10),
	Dob DATE,

	PRIMARY KEY (Date_Played, PPhone_Number),
	FOREIGN KEY (Date_Played) REFERENCES GAME(DATE_PLAYED),
	FOREIGN KEY (PPhone_Number, Dob) REFERENCES PLAYER(Phone_Number, Dob)
);


INSERT INTO TEAM VALUES ('Dodgers', 1, 9, 'Dodger Blue and White', 'Los Angeles', 4, 2, '1883-7-02',  6);
INSERT INTO TEAM VALUES ('Peaches', 1, 9, 'Peach and White', 'Rockford', 0, 6, '1883-7-02',  1);
INSERT INTO TEAM VALUES ('Titans', 1, 9, 'White Orange and Navy Blue', 'Fullerton', 5, 1, '1883-7-02',  6);

INSERT INTO PLAYER VALUES ('Hideo', 'Nomo', 'Pitcher', 12345678.00, 7, '.122', 0, '1988-2-01', 28, 7143026565);
INSERT INTO PLAYER VALUES ('Alex', 'Scott', 'Catcher', 87654321.00, 50, '.322', 2, '1987-4-01', 29, 9495543434);
INSERT INTO PLAYER VALUES ('Joe', 'Green', 'FirstBase', 24681357.00, 24, '.999', 5, '1990-6-10', 26, 9495678907);
INSERT INTO PLAYER VALUES ('Alice', 'Bernstein', 'SecondBase', 32187645.00, 32, '.345', 1, '1990-12-10', 26, 9495632134);
INSERT INTO PLAYER VALUES ('Don', 'Vu', 'ThirdBase', 67854312.00, 78, '.543', 7, '1980-11-11', 36, 9491235676);
INSERT INTO PLAYER VALUES ('Eric', 'Wolfe', 'ShortStop', 45687210.00, 99, '.213', 0, '1985-10-19', 31, 7143227788);
INSERT INTO PLAYER VALUES ('Tony', 'Esperanzo', 'LeftField', 90000000.00, 1, '.329', 1, '1989-11-21', 27, 9492076641);
INSERT INTO PLAYER VALUES ('Pedro', 'Rodriquez', 'RightField', 10000000.00, 23, '.125', 5, '1991-4-01', 25, 9492786642);
INSERT INTO PLAYER VALUES ('Pedro', 'Martinez', 'CenterField', 23450000.00, 89, '.432', 4, '1988-2-01', 28, 7144667887);
INSERT INTO PLAYER VALUES ('Clay', 'Peterson', 'Pitcher', 87654321.00, 7, '.432', 1, '1979-4-02', 38, 8881234567);
INSERT INTO PLAYER VALUES ('Takei', 'Ho', 'Catcher', 20054321.00, 50, '.234', 5, '1982-1-01', 34, 9495543439);
INSERT INTO PLAYER VALUES ('Peter', 'Gabriel', 'FirstBase', 64654357.00, 24, '.765', 7, '1990-9-10', 26, 9495674321);
INSERT INTO PLAYER VALUES ('Don', 'Corleone', 'SecondBase', 92185345.00, 32, '.234', 0, '1990-7-11', 26, 9495633223);
INSERT INTO PLAYER VALUES ('Rosie', 'Odonell', 'ThirdBase', 67004212.00, 78, '.543', 0, '1978-11-11', 39, 9491236789);
INSERT INTO PLAYER VALUES ('Josh', 'Piazza', 'ShortStop', 45607215.00, 99, '.234', 0, '2000-10-19', 16, 7143627799);
INSERT INTO PLAYER VALUES ('Tony', 'Gonzales', 'LeftField', 90030500.00, 1, '.111', 4, '1989-8-18', 27, 9492075576);
INSERT INTO PLAYER VALUES ('Kobe', 'Bryant', 'RightField', 12000400.00, 23, '.232', 2, '1998-4-01', 18, 9492785588);
INSERT INTO PLAYER VALUES ('Tammy', 'Owen', 'CenterField', 22470001.00, 89, '.333', 9, '2001-2-01', 15, 8084667800);
INSERT INTO PLAYER VALUES ('Jackie', 'Robinson', 'Pitcher', 43254321.00, 42, '.123', 2, '1900-5-04', 117, 9491234567);
INSERT INTO PLAYER VALUES ('William', 'Shatner', 'Catcher', 23454001.00, 43, '.321', 0, '1981-2-04', 35, 8125543439);
INSERT INTO PLAYER VALUES ('Captain', 'Picard', 'FirstBase', 87650357.00, 24, '.324', 1, '1990-1-01', 26, 3445674321);
INSERT INTO PLAYER VALUES ('Patrick', 'Stewart', 'SecondBase', 72485345.00, 8, '.543', 8, '1988-7-11', 28, 3445633223);
INSERT INTO PLAYER VALUES ('Michael', 'Dorn', 'ThirdBase', 87404000.00, 32, '.234', 3, '1977-11-11', 40, 7901236789);
INSERT INTO PLAYER VALUES ('Kathryn', 'Janeway', 'ShortStop', 34707215.00, 22, '.432', 1, '1991-10-19', 25, 4333627799);
INSERT INTO PLAYER VALUES ('Quark', 'Money', 'LeftField', 87630520.00, 5, '.324', 0, '1989-2-12', 27, 2122075576);
INSERT INTO PLAYER VALUES ('Johny', 'Cash', 'RightField', 43200400.00, 23, '.231', 0, '1999-4-01', 17, 212785588);
INSERT INTO PLAYER VALUES ('Beth', 'Rowe', 'CenterField', 11080001.00, 87, '.222', 0, '1995-9-09', 21, 6774667800);

INSERT INTO COACH VALUES ('Tiffany', 'Hall', 'Head Coach', 35, 5, '1981-2-01', '9496802175', 'beth.cooper12@yahoo.com', 'Dodgers', '92612', 'CA', 'Irvine', 3, 'Banyon Tree Lane', NULL);
INSERT INTO COACH VALUES ('Gary', 'Cooper', 'Head Coach', 28, 3, '1988-12-21', '4802787743', 'cooper4@fullerton.edu', 'Titans', '93840', 'CA', 'Anaheim', 443, 'Brookehurst Way', NULL);
INSERT INTO COACH VALUES ('Jennifer', 'Aniston', 'Head Coach', 47, 10, '1970-5-02', '7145557878', 'anonymous@cox.net', 'Peaches', '92614', 'CA', 'Newport Beach', 77, 'Vista View Park', NULL);

INSERT INTO GAME VALUES ('2017-7-02', 'Peaches', '1-3', 'Hoover Park', 'Dodgers');
INSERT INTO GAME VALUES ('2017-7-18', 'Dodgers', '2-5', 'Dodger Stadium', 'Peaches');
INSERT INTO GAME VALUES ('2017-7-28', 'Peaches', '9-0', 'Hoover Park', 'Dodgers');
INSERT INTO GAME VALUES ('2017-7-5', 'Titans', '1-6', 'TitanStadium', 'Peaches');
INSERT INTO GAME VALUES ('2017-7-15', 'Peaches', '2-0', 'Hoover Park', 'Titans');
INSERT INTO GAME VALUES ('2017-7-25', 'Titans', '6-8', 'TitanStadium', 'Peaches');
INSERT INTO GAME VALUES ('2017-7-4', 'Dodgers', '1-0', 'TitanStadium', 'Titans');
INSERT INTO GAME VALUES ('2017-7-12', 'Titans', '3-4', 'Dodger Stadium', 'Dodgers');
INSERT INTO GAME VALUES ('2017-7-29', 'Dodgers', '2-1', 'TitanStadium', 'Titans');

INSERT INTO HAS VALUES('Dodgers', '9496802175');
INSERT INTO HAS VALUES('Peaches', '7145557878');
INSERT INTO HAS VALUES('Titans', '4802787743');

INSERT INTO TRAINS VALUES('9496802175', '7143026565', '1988-2-01');
INSERT INTO TRAINS VALUES('4802787743', '8881234567', '1979-4-02');
INSERT INTO TRAINS VALUES('7145557878', '9491234567', '1900-5-04');

INSERT INTO ENROLLS VALUES('Dodgers', '7143026565', '1988-2-01');
INSERT INTO ENROLLS VALUES('Titans', '8881234567', '1979-4-02');
INSERT INTO ENROLLS VALUES('Peaches', '9491234567', '1900-5-04');

INSERT INTO PLAYS VALUES('Dodgers', '2017-7-18');

INSERT INTO CONTAINS_ VALUES('2017-7-18', '7143026565', '1988-2-01');