USE CollegeDB;

-- Add more data


-- Basic Aggregate
SELECT 
    COUNT(*) AS TotalStudents,
    AVG(Age) AS AvgAge,
    MAX(Age) AS MaxAge,
    MIN(Age) AS MinAge,
    SUM(Age) AS TotalAge
FROM Student;

-- GROUP BY
SELECT DeptID, COUNT(*) AS StudentCount, AVG(Age) AS AvgAge
FROM Student
GROUP BY DeptID;

-- GROUP BY with JOIN
SELECT d.DeptName, COUNT(s.RollNo) AS StudentCount, AVG(m.Score) AS AvgScore
FROM Department d
LEFT JOIN Student s ON d.DeptID = s.DeptID
LEFT JOIN Marks m ON s.RollNo = m.RollNo
GROUP BY d.DeptID, d.DeptName;

-- HAVING (filter groups)
SELECT DeptID, COUNT(*) AS StudentCount
FROM Student
GROUP BY DeptID
HAVING COUNT(*) >= 2;

-- HAVING with aggregate condition
SELECT DeptID, AVG(Age) AS AvgAge
FROM Student
GROUP BY DeptID
HAVING AVG(Age) > 20;