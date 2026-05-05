USE CollegeDB;

-- INNER JOIN
SELECT s.RollNo, s.Name, d.DeptName, m.Score
FROM Student s
INNER JOIN Department d ON s.DeptID = d.DeptID
INNER JOIN Marks m ON s.RollNo = m.RollNo;

-- LEFT JOIN
SELECT s.RollNo, s.Name, m.Score
FROM Student s
LEFT JOIN Marks m ON s.RollNo = m.RollNo;

-- RIGHT JOIN
SELECT s.RollNo, s.Name, m.Score
FROM Marks m
RIGHT JOIN Student s ON m.RollNo = s.RollNo;

-- CROSS JOIN
SELECT s.Name, d.DeptName
FROM Student s
CROSS JOIN Department d;

-- SELF JOIN (Employee-Manager relationship)
CREATE TABLE Employee (
    EmpID INT PRIMARY KEY,
    Name VARCHAR(50),
    ManagerID INT,
    FOREIGN KEY (ManagerID) REFERENCES Employee(EmpID)
);

INSERT INTO Employee VALUES 
(1, 'CEO', NULL),
(2, 'Manager1', 1),
(3, 'Manager2', 1),
(4, 'Staff1', 2);

SELECT e.Name AS Employee, m.Name AS Manager
FROM Employee e
LEFT JOIN Employee m ON e.ManagerID = m.EmpID;

-- VIEWS
CREATE VIEW StudentMarksView AS
SELECT s.RollNo, s.Name, d.DeptName, m.Score
FROM Student s
JOIN Department d ON s.DeptID = d.DeptID
LEFT JOIN Marks m ON s.RollNo = m.RollNo;

-- Query View
SELECT * FROM StudentMarksView WHERE Score > 80;

-- Update View (if simple enough)
-- INSERT INTO StudentMarksView ... -- May not work with joins

-- Drop View
-- DROP VIEW StudentMarksView;