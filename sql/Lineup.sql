/*
created by: Johne Vang
*/

DROP DATABASE IF EXISTS Lineup;

CREATE DATABASE Lineup;

USE Lineup;

CREATE TABLE Employees(
    EmployeeID INT NOT NULL AUTO_INCREMENT,
    FirstName VARCHAR(100) NOT NULL DEFAULT '',
    LastName VARCHAR(100) NOT NULL DEFAULT '',
    PositionTitle VARCHAR(100) NOT NULL,
    ManagerName VARCHAR(100) NOT NULL,
    PRIMARY KEY (EmployeeID)
);
  
INSERT INTO Employees ( FirstName, LastName, PositionTitle, ManagerName ) VALUES 
    ('John', 'Doe', 'Staff', 'Bill Doe'),
    ('Joel', 'Nelson', 'Staff', 'Kari Webster' ),
    ('Neal', 'Webster', 'Staff', 'Arthur Flores' ),
    ('Harry', 'Wade', 'Staff', 'Karl Malone' ),
    ('Michael', 'Jordan', 'Staff', ' Phil Jackson' ),
    ('Rocky', 'Balboa', 'Staff', 'Micky Micky' ),
    ('Apollo', 'Creed', 'Staff', 'Duke Duke' ),
    ('Clark', 'Kent', 'Staff', 'Martha Kent' ),
    ('Bruce', 'Wanye', 'Staff', 'Officer Gordon' ),
    ('Barry', 'Allen', 'Staff', 'Sheri Beck');


CREATE USER lineup@localhost IDENTIFIED BY 'lineup';

GRANT SELECT, INSERT, UPDATE, DELETE
ON Employees.*
TO lineup@localhost;

USE Lineup;
