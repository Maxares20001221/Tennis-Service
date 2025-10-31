--  - Creates a new database named 'tennis_service_db'.
--  - Creates `teams` and `players` tables with a `gender` column.
--  - Inserts 10 teams and 108 players.

-- Create the database if it does not exist
CREATE DATABASE IF NOT EXISTS tennis_service_db;

-- Switch to the newly created database
USE tennis_service_db;

-- Drop tables if they exist
DROP TABLE IF EXISTS players;
DROP TABLE IF EXISTS teams;


-- Create the `teams` table
CREATE TABLE teams (
  team_id INT AUTO_INCREMENT PRIMARY KEY,
  team_name VARCHAR(255) NOT NULL,
  country VARCHAR(100)
);

-- Create the `players` table
CREATE TABLE players (
  player_id INT AUTO_INCREMENT PRIMARY KEY,
  first_name VARCHAR(255) NOT NULL,
  last_name VARCHAR(255) NOT NULL,
  gender ENUM('Male', 'Female', 'Other') NOT NULL,
  birth_date DATE,
  height_cm DOUBLE,
  weight_kg DOUBLE,
  career_titles INT DEFAULT 0,
  career_wins INT DEFAULT 0,
  country VARCHAR(100),
  ranking INT,
  team_id INT,
  FOREIGN KEY (team_id) REFERENCES teams(team_id) ON DELETE SET NULL
);

-- Insert 10 teams
INSERT INTO teams (team_name, country) VALUES
('Team Nike', 'USA'),
('Team Adidas', 'Germany'),
('Lacoste Crocs', 'France'),
('Spanish Tennis Federation', 'Spain'),
('Swiss Guard', 'Switzerland'),
('Team Uniqlo', 'Japan'),
('British Tennis Elite', 'UK'),
('Aussie Grit', 'Australia'),
('Canadian Aces', 'Canada'),
('Serbian Eagles', 'Serbia');

-- Insert 108 players with randomized data
INSERT INTO players (first_name, last_name, gender, birth_date, height_cm, weight_kg, career_titles, career_wins, country, ranking, team_id) VALUES
('Liam', 'Smith', 'Male', '1995-03-15', 185.5, 80.1, 5, 250, 'USA', 50, 1),
('Noah', 'Johnson', 'Male', '1998-07-22', 190.2, 85.5, 2, 150, 'USA', 120, 1),
('Oliver', 'Williams', 'Male', '1994-01-30', 188.0, 82.3, 12, 450, 'UK', 15, 7),
('James', 'Brown', 'Male', '2001-11-05', 192.1, 88.0, 0, 50, 'USA', 300, 1),
('William', 'Jones', 'Male', '1996-09-14', 183.4, 78.9, 8, 320, 'UK', 45, 7),
('Hao', 'Chen', 'Male', '1996-07-18', 185.0, 79.0, 2, 130, 'China', 140, 6),
('Jing', 'Zhao', 'Female', '2000-04-05', 178.0, 68.0, 0, 60, 'China', 280, 2),
('Lucas', 'Garcia', 'Male', '1997-05-25', 180.1, 75.0, 15, 500, 'Spain', 10, 4),
('Henry', 'Martinez', 'Male', '2000-02-18', 185.9, 81.2, 1, 90, 'Spain', 250, 4),
('Alexander', 'Rodriguez', 'Male', '1993-08-01', 193.0, 90.1, 25, 750, 'Spain', 5, 4),
('Michelle', 'Lopez', 'Female', '1999-04-12', 172.5, 63.5, 3, 180, 'USA', 90, NULL),
('Ethan', 'Hernandez', 'Male', '1995-12-03', 184.8, 79.5, 6, 280, 'USA', 60, 1),
('Daniel', 'Wilson', 'Male', '1997-10-20', 189.5, 86.2, 4, 210, 'Australia', 80, 8),
('Matthew', 'Anderson', 'Male', '1996-06-11', 182.1, 77.3, 10, 380, 'Canada', 30, 9),
('Aiden', 'Thomas', 'Male', '2002-03-28', 191.0, 87.8, 0, 25, 'USA', 450, NULL),
('David', 'Moore', 'Male', '1992-07-19', 187.6, 84.0, 30, 800, 'Switzerland', 3, 5),
('Joseph', 'Taylor', 'Male', '1998-01-08', 185.3, 80.8, 7, 300, 'UK', 55, 7),
('Jackson', 'Martin', 'Male', '1999-09-02', 184.2, 79.1, 2, 130, 'Australia', 150, 8),
('Samuel', 'Lee', 'Male', '1994-11-27', 178.9, 73.5, 20, 600, 'Japan', 8, 6),
('Sebastian', 'Gonzalez', 'Male', '2001-06-07', 188.8, 85.0, 1, 70, 'Spain', 280, 4),
('Gabriela', 'White', 'Female', '1993-04-09', 175.2, 65.7, 18, 550, 'USA', 12, 1),
('Carter', 'Harris', 'Male', '2000-08-16', 189.9, 86.9, 0, 40, 'Canada', 350, 9),
('Jayden', 'Clark', 'Male', '1997-02-23', 181.5, 76.8, 11, 400, 'Australia', 25, 8),
('John', 'Lewis', 'Male', '1995-10-13', 187.1, 83.3, 9, 340, 'USA', 38, NULL),
('Luke', 'Walker', 'Male', '1998-05-04', 188.3, 84.8, 5, 230, 'UK', 70, 7),
('Anthony', 'Hall', 'Male', '1996-03-06', 185.6, 81.5, 7, 290, 'USA', 58, 1),
('Isaac', 'Allen', 'Male', '2000-12-25', 190.5, 87.2, 2, 110, 'Canada', 180, 9),
('Dylan', 'Young', 'Male', '1994-08-31', 183.8, 78.6, 14, 480, 'Australia', 18, 8),
('Wyatt', 'King', 'Male', '1999-01-21', 186.8, 82.9, 4, 200, 'USA', 85, 1),
('Andrew', 'Wright', 'Male', '1992-09-18', 192.5, 89.5, 40, 950, 'Serbia', 1, 10),
('Joshua', 'Scott', 'Male', '1997-07-02', 184.5, 80.0, 8, 310, 'UK', 48, 7),
('Christopher', 'Green', 'Male', '1998-04-26', 189.0, 85.8, 6, 260, 'USA', 65, NULL),
('Lea', 'Weber', 'Female', '1996-08-12', 178.2, 68.1, 10, 370, 'Germany', 32, 2),
('Maximilian', 'Schmidt', 'Male', '1999-05-30', 188.5, 84.5, 3, 160, 'Germany', 110, 2),
('Paul', 'Schneider', 'Male', '1995-02-17', 186.7, 82.4, 9, 330, 'Germany', 42, 2),
('Jonas', 'Fischer', 'Male', '2001-10-09', 190.8, 87.5, 0, 30, 'Germany', 400, NULL),
('Finn', 'Meyer', 'Male', '1997-12-01', 183.1, 78.0, 12, 420, 'Germany', 22, 2),
('Tao', 'Wu', 'Male', '2002-06-25', 190.0, 85.0, 0, 15, 'China', 420, NULL),
('Louis', 'Dupont', 'Male', '1994-09-22', 181.9, 77.2, 16, 520, 'France', 14, 3),
('Hugo', 'Robert', 'Male', '1998-07-14', 187.9, 83.9, 5, 240, 'France', 72, 3),
('Arthur', 'Richard', 'Male', '1996-01-05', 185.8, 81.8, 8, 310, 'France', 52, 3),
('Gabriel', 'Moreau', 'Male', '2000-11-11', 189.3, 86.0, 1, 80, 'France', 260, NULL),
('Julie', 'Laurent', 'Female', '1995-04-03', 176.7, 67.4, 11, 390, 'France', 28, 3),
('Nikola', 'Jovanovic', 'Male', '1993-03-20', 193.2, 91.0, 35, 900, 'Serbia', 2, 10),
('Luka', 'Petrovic', 'Male', '1997-08-25', 188.7, 85.3, 6, 270, 'Serbia', 62, 10),
('Stefan', 'Markovic', 'Male', '1999-02-12', 186.1, 82.0, 3, 170, 'Serbia', 100, 10),
('Milos', 'Djordjevic', 'Male', '2002-01-01', 191.5, 88.5, 0, 20, 'Serbia', 480, NULL),
('Filip', 'Ilic', 'Male', '1996-10-08', 185.0, 80.5, 9, 350, 'Serbia', 35, 10),
('Rafa', 'Nadal', 'Male', '1986-06-03', 185.0, 85.0, 92, 1070, 'Spain', 250, 4),
('Carlos', 'Alcaraz', 'Male', '2003-05-05', 183.0, 74.0, 12, 140, 'Spain', 1, 4),
('Felix', 'Auger-Aliassime', 'Male', '2000-08-08', 193.0, 88.0, 4, 180, 'Canada', 9, 9),
('Denis', 'Shapovalov', 'Male', '1999-04-15', 185.0, 75.0, 1, 160, 'Canada', 27, 9),
('Kei', 'Nishikori', 'Male', '1989-12-29', 178.0, 74.0, 12, 431, 'Japan', 353, 6),
('Yoshihito', 'Nishioka', 'Male', '1995-09-27', 170.0, 64.0, 2, 110, 'Japan', 33, 6),
('Stan', 'Wawrinka', 'Male', '1985-03-28', 183.0, 81.0, 16, 550, 'Switzerland', 88, 5),
('Dominic', 'Stricker', 'Male', '2002-08-16', 183.0, 75.0, 0, 15, 'Switzerland', 118, 5),
('Cameron', 'Norrie', 'Male', '1995-08-23', 188.0, 82.0, 5, 190, 'UK', 13, 7),
('Jack', 'Draper', 'Male', '2001-12-22', 193.0, 80.0, 0, 35, 'UK', 46, 7),
('Nick', 'Kyrgios', 'Male', '1995-04-27', 193.0, 85.0, 7, 195, 'Australia', 21, 8),
('Alex', 'de Minaur', 'Male', '1999-02-17', 183.0, 69.0, 7, 170, 'Australia', 19, 8),
('Alexander', 'Zverev', 'Male', '1997-04-20', 198.0, 90.0, 19, 350, 'Germany', 16, 2),
('Jan-Lennard', 'Struff', 'Male', '1990-04-25', 193.0, 92.0, 0, 190, 'Germany', 29, 2),
('Gael', 'Monfils', 'Male', '1986-09-01', 193.0, 85.0, 11, 525, 'France', 47, 3),
('Yang', 'Liu', 'Male', '2001-09-03', 188.0, 82.0, 0, 20, 'China', 350, NULL),
('Ugo', 'Humbert', 'Male', '1998-06-26', 188.0, 73.0, 3, 100, 'France', 36, 3),
('Miomir', 'Kecmanovic', 'Male', '1999-08-31', 183.0, 75.0, 1, 120, 'Serbia', 31, 10),
('Laslo', 'Djere', 'Male', '1995-06-02', 188.0, 82.0, 2, 135, 'Serbia', 57, 10),
('Pablo', 'Carreno Busta', 'Male', '1991-07-12', 188.0, 78.0, 7, 280, 'Spain', 17, 4),
('Roberto', 'Bautista Agut', 'Male', '1988-04-14', 183.0, 75.0, 11, 370, 'Spain', 24, 4),
('Milos', 'Raonic', 'Male', '1990-12-27', 196.0, 98.0, 8, 375, 'Canada', 320, NULL),
('Vasek', 'Pospisil', 'Male', '1990-06-23', 193.0, 88.0, 0, 150, 'Canada', 288, NULL),
('Taro', 'Daniel', 'Male', '1993-01-27', 191.0, 76.0, 1, 80, 'Japan', 106, 6),
('Yosuke', 'Watanuki', 'Male', '1998-04-12', 180.0, 75.0, 0, 10, 'Japan', 112, 6),
('Marc-Andrea', 'Huesler', 'Male', '1996-06-24', 196.0, 85.0, 1, 45, 'Switzerland', 83, 5),
('Henri', 'Laaksonen', 'Male', '1992-03-31', 185.0, 84.0, 0, 55, 'Switzerland', 153, 5),
('Dan', 'Evans', 'Male', '1990-05-23', 175.0, 75.0, 1, 145, 'UK', 26, 7),
('Ming', 'Li', 'Male', '1999-11-10', 180.0, 75.0, 0, 45, 'China', 210, NULL),
('Andy', 'Murray', 'Male', '1987-05-15', 191.0, 84.0, 46, 725, 'UK', 43, 7),
('Lei', 'Huang', 'Male', '1995-01-12', 182.0, 77.0, 4, 180, 'China', 115, NULL),
('Thanasi', 'Kokkinakis', 'Male', '1996-04-10', 193.0, 84.0, 1, 70, 'Australia', 110, 8),
('Jordan', 'Thompson', 'Male', '1994-04-20', 183.0, 78.0, 0, 105, 'Australia', 85, 8),
('Oscar', 'Otte', 'Male', '1993-07-16', 193.0, 85.0, 0, 40, 'Germany', 81, 2),
('Fang', 'Wang', 'Female', '1998-02-28', 175.0, 65.0, 3, 150, 'China', 80, 1),
('Daniel', 'Altmaier', 'Male', '1998-09-12', 191.0, 80.0, 0, 30, 'Germany', 65, 2),
('Adrian', 'Mannarino', 'Male', '1988-06-29', 180.0, 79.0, 2, 230, 'France', 46, 3),
('Benjamin', 'Bonzi', 'Male', '1996-06-09', 183.0, 70.0, 0, 50, 'France', 48, 3),
('Dusan', 'Lajovic', 'Male', '1990-06-30', 180.0, 81.0, 1, 195, 'Serbia', 66, 10),
('Novak', 'Djokovic', 'Male', '1987-05-22', 188.0, 77.0, 93, 1058, 'Serbia', 2, 10),
('Jaume', 'Munar', 'Male', '1997-05-05', 183.0, 75.0, 0, 75, 'Spain', 58, NULL),
('Alejandro', 'Davidovich Fokina', 'Male', '1999-06-05', 183.0, 81.0, 0, 95, 'Spain', 34, 4),
('Mikael', 'Ymer', 'Male', '1998-09-09', 183.0, 75.0, 0, 80, 'Sweden', 51, NULL),
('Elias', 'Ymer', 'Male', '1996-04-10', 183.0, 81.0, 0, 45, 'Sweden', 135, NULL),
('Holger', 'Rune', 'Male', '2003-04-29', 188.0, 77.0, 4, 70, 'Denmark', 6, NULL),
('Casper', 'Ruud', 'Male', '1998-12-22', 183.0, 77.0, 10, 155, 'Norway', 4, NULL),
('Matteo', 'Berrettini', 'Male', '1996-04-12', 196.0, 95.0, 7, 150, 'Italy', 23, NULL),
('Jannik', 'Sinner', 'Male', '2001-08-16', 188.0, 76.0, 8, 145, 'Italy', 8, NULL),
('Lorenzo', 'Musetti', 'Male', '2002-03-03', 185.0, 75.0, 2, 85, 'Italy', 18, NULL),
('Fabio', 'Fognini', 'Male', '1987-05-24', 178.0, 79.0, 9, 410, 'Italy', 55, NULL),
('Roger', 'Federer', 'Male', '1981-08-08', 185.0, 85.0, 103, 1251, 'Switzerland', 0, 5),
('Wei', 'Zhang', 'Male', '1997-05-20', 183.0, 78.0, 1, 95, 'China', 98, 6);

SELECT * FROM players;
-- End of script
SELECT 'Successfully created database and populated tables.' AS status;
