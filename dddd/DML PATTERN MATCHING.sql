USE CollegeDB;

-- Pattern Matching with LIKE
SELECT * FROM Student WHERE Name LIKE 'A%';      -- Starts with A
SELECT * FROM Student WHERE Name LIKE '%e';      -- Ends with e
SELECT * FROM Student WHERE Name LIKE '%li%';    -- Contains li
SELECT * FROM Student WHERE Name LIKE '_o%';     -- Second letter is o

-- Regular Expression (REGEXP / RLIKE)
SELECT * FROM Student WHERE Name REGEXP '^[A-C]'; -- Starts with A, B, or C

-- String Functions
SELECT 
    UPPER(Name) AS UpperName,
    LOWER(Name) AS LowerName,
    LENGTH(Name) AS NameLength,
    CONCAT(Name, ' - ', Email) AS FullInfo,
    SUBSTRING(Name, 1, 3) AS ShortName,
    REPLACE(Name, 'a', '@') AS ReplacedName,
    TRIM(Name) AS TrimmedName,
    INSTR(Name, 'l') AS PositionOfL,
    REVERSE(Name) AS ReversedName
FROM Student;USE CollegeDB;

-- Pattern Matching with LIKE
SELECT * FROM Student WHERE Name LIKE 'A%';      -- Starts with A
SELECT * FROM Student WHERE Name LIKE '%e';      -- Ends with e
SELECT * FROM Student WHERE Name LIKE '%li%';    -- Contains li
SELECT * FROM Student WHERE Name LIKE '_o%';     -- Second letter is o

-- Regular Expression (REGEXP / RLIKE)
SELECT * FROM Student WHERE Name REGEXP '^[A-C]'; -- Starts with A, B, or C

-- String Functions
SELECT 
    UPPER(Name) AS UpperName,
    LOWER(Name) AS LowerName,
    LENGTH(Name) AS NameLength,
    CONCAT(Name, ' - ', Email) AS FullInfo,
    SUBSTRING(Name, 1, 3) AS ShortName,
    REPLACE(Name, 'a', '@') AS ReplacedName,
    TRIM(Name) AS TrimmedName,
    INSTR(Name, 'l') AS PositionOfL,
    REVERSE(Name) AS ReversedName
FROM Student;