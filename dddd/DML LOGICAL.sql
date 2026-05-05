USE CollegeDB;

-- AND, OR, NOT
SELECT * FROM Student WHERE Age >= 20 AND DeptID = 1;
SELECT * FROM Student WHERE Age < 20 OR DeptID = 2;
SELECT * FROM Student WHERE NOT DeptID = 1;

-- Combined Logical Operators
SELECT * FROM Student 
WHERE (Age >= 20 AND Age <= 22) AND NOT DeptID = 3;

-- IN and BETWEEN (Logical range checks)
SELECT * FROM Student WHERE DeptID IN (1, 2);
SELECT * FROM Student WHERE Age BETWEEN 19 AND 21;

-- EXISTS
SELECT * FROM Student s
WHERE EXISTS (SELECT 1 FROM Marks m WHERE m.RollNo = s.RollNo AND m.Score > 80);

-- IS NULL / IS NOT NULL
ALTER TABLE Student ADD COLUMN Address VARCHAR(100);
UPDATE Student SET Address = 'New York' WHERE RollNo = 101;
SELECT * FROM Student WHERE Address IS NULL;
SELECT * FROM Student WHERE Address IS NOT NULL;