USE CollegeDB;

-- ==================== STEP 1: DROP EXISTING OBJECTS ====================
DROP PROCEDURE IF EXISTS GetStudentCountByDept;
DROP PROCEDURE IF EXISTS UpdateGrade;
DROP FUNCTION IF EXISTS CalculatePercentage;

-- ==================== STEP 2: SET DELIMITER ====================
DELIMITER //

-- ==================== STORED PROCEDURE 1 ====================
CREATE PROCEDURE GetStudentCountByDept(
    IN deptId INT,
    OUT studentCount INT
)
BEGIN
    SELECT COUNT(*) INTO studentCount
    FROM Student
    WHERE DeptID = deptId;
END //

-- ==================== STORED PROCEDURE 2 (CURSOR) ====================
CREATE PROCEDURE UpdateGrade()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE v_rollno INT;
    DECLARE v_score INT;
    
    DECLARE cur CURSOR FOR 
        SELECT RollNo, Score FROM Marks;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    
    OPEN cur;
    
    read_loop: LOOP
        FETCH cur INTO v_rollno, v_score;
        IF done THEN
            LEAVE read_loop;
        END IF;
        
        -- Update grade based on score
        IF v_score >= 90 THEN
            UPDATE Marks SET Subject = CONCAT(Subject, ' - A') WHERE RollNo = v_rollno;
        ELSEIF v_score >= 80 THEN
            UPDATE Marks SET Subject = CONCAT(Subject, ' - B') WHERE RollNo = v_rollno;
        ELSE
            UPDATE Marks SET Subject = CONCAT(Subject, ' - C') WHERE RollNo = v_rollno;
        END IF;
    END LOOP;
    
    CLOSE cur;
END //

-- ==================== FUNCTION ====================
CREATE FUNCTION CalculatePercentage(score INT, maxMarks INT)
RETURNS DECIMAL(5,2)
DETERMINISTIC
BEGIN
    RETURN (score / maxMarks) * 100;
END //

DELIMITER ;

-- ==================== STEP 3: EXECUTE ====================

-- Test Procedure 1
CALL GetStudentCountByDept(1, @count);
SELECT @count AS StudentCount;

-- Test Function
SELECT RollNo, Score, CalculatePercentage(Score, 100) AS Percentage FROM Marks;

-- Reset Marks before cursor test (to avoid double concatenation)
UPDATE Marks SET Subject = 'DBMS';

-- Test Procedure 2 (Cursor)
CALL UpdateGrade();
SELECT * FROM Marks;