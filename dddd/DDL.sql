-- Create Database
CREATE DATABASE CollegeDB;
USE CollegeDB;

-- CREATE TABLE with Constraints
CREATE TABLE Department (
    DeptID INT PRIMARY KEY,
    DeptName VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE Student (
    RollNo INT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    Age INT CHECK (Age >= 18),
    Email VARCHAR(100) UNIQUE,
    DeptID INT,
    FOREIGN KEY (DeptID) REFERENCES Department(DeptID)
);

-- INSERT Sample Data
INSERT INTO Department VALUES (1, 'Computer Science'), (2, 'Mathematics');
INSERT INTO Student VALUES 
(101, 'Alice', 20, 'alice@college.edu', 1),
(102, 'Bob', 21, 'bob@college.edu', 2);

-- ALTER TABLE
ALTER TABLE Student ADD COLUMN Phone VARCHAR(15);
ALTER TABLE Student MODIFY Phone VARCHAR(20);
ALTER TABLE Student DROP COLUMN Phone;
ALTER TABLE Student RENAME COLUMN Name TO FullName;

-- RENAME TABLE
RENAME TABLE Student TO Students;
RENAME TABLE Students TO Student;

-- TRUNCATE TABLE (removes all data but keeps structure)
TRUNCATE TABLE Student;

-- DROP TABLE (removes structure and data)
DROP TABLE Student;
DROP TABLE Department;

-- Recreate for next experiments
CREATE TABLE Department (
    DeptID INT PRIMARY KEY,
    DeptName VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE Student (
    RollNo INT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    Age INT,
    Email VARCHAR(100) UNIQUE,
    DeptID INT,
    FOREIGN KEY (DeptID) REFERENCES Department(DeptID)
);

INSERT INTO Department VALUES (1, 'Computer Science'), (2, 'Mathematics'), (3, 'Physics');
INSERT INTO Student VALUES 
(101, 'Alice', 20, 'alice@college.edu', 1),
(102, 'Bob', 21, 'bob@college.edu', 2),
(103, 'Charlie', 19, 'charlie@college.edu', 1),
(104, 'David', 22, 'david@college.edu', 3);

CREATE TABLE Marks (
    RollNo INT PRIMARY KEY,
    Subject VARCHAR(50),
    Score INT,
    FOREIGN KEY (RollNo) REFERENCES Student(RollNo)
);

INSERT INTO Marks VALUES 
(101, 'DBMS', 85),
(102, 'DBMS', 78),
(103, 'DBMS', 92),
(104, 'DBMS', 65);