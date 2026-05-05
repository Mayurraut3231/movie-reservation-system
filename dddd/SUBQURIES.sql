USE CollegeDB;

-- Single-row subquery
SELECT * FROM Student 
WHERE Age > (SELECT AVG(Age) FROM Student);

-- Multi-row subquery with IN
SELECT * FROM Student 
WHERE DeptID IN (SELECT DeptID FROM Department WHERE DeptName LIKE 'C%');

-- Correlated subquery
SELECT s.Name, s.DeptID
FROM Student s
WHERE s.Age > (SELECT AVG(s2.Age) FROM Student s2 WHERE s2.DeptID = s.DeptID);

-- Subquery in FROM clause (Derived table)
SELECT DeptName, AvgAge
FROM (
    SELECT DeptID, AVG(Age) AS AvgAge
    FROM Student
    GROUP BY DeptID
) avg_table
JOIN Department d ON avg_table.DeptID = d.DeptID;

-- Subquery with EXISTS
SELECT * FROM Department d
WHERE EXISTS (SELECT 1 FROM Student s WHERE s.DeptID = d.DeptID);

-- Subquery with NOT EXISTS
SELECT * FROM Department d
WHERE NOT EXISTS (SELECT 1 FROM Student s WHERE s.DeptID = d.DeptID);

-- Scalar subquery in SELECT
SELECT Name, (SELECT DeptName FROM Department d WHERE d.DeptID = s.DeptID) AS Department
FROM Student s;