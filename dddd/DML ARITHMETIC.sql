USE CollegeDB;

-- INSERT
INSERT INTO Marks VALUES (105, 'DBMS', 88);

-- UPDATE with Arithmetic
UPDATE Marks SET Score = Score + 5 WHERE Score < 80;

-- DELETE
DELETE FROM Marks WHERE Score < 70;

-- SELECT with Arithmetic Operations
SELECT 
    RollNo,
    Subject,
    Score,
    Score + 10 AS GraceMarks,
    Score * 1.1 AS ScaledScore,
    (Score / 100) * 100 AS Percentage,
    Score - 10 AS PenaltyMarks
FROM Marks;

-- Calculate Average, Sum in SELECT
SELECT 
    SUM(Score) AS TotalMarks,
    AVG(Score) AS AverageMarks,
    MAX(Score) AS Highest,
    MIN(Score) AS Lowest
FROM Marks;