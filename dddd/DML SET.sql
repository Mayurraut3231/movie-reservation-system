USE CollegeDB;

-- Create another table for demonstration
CREATE TABLE TopStudents (
    RollNo INT PRIMARY KEY,
    Name VARCHAR(50)
);

INSERT INTO TopStudents VALUES (101, 'Alice'), (103, 'Charlie'), (105, 'Eve');

-- UNION (distinct values)
SELECT RollNo, Name FROM Student
UNION
SELECT RollNo, Name FROM TopStudents;

-- UNION ALL (includes duplicates)
SELECT RollNo, Name FROM Student
UNION ALL
SELECT RollNo, Name FROM TopStudents;

-- INTERSECT (MySQL emulated via JOIN)
SELECT s.RollNo, s.Name FROM Student s
INNER JOIN TopStudents t ON s.RollNo = t.RollNo;

-- MINUS / EXCEPT (MySQL emulated via LEFT JOIN)
SELECT s.RollNo, s.Name FROM Student s
LEFT JOIN TopStudents t ON s.RollNo = t.RollNo
WHERE t.RollNo IS NULL;