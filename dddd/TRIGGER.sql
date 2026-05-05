USE CollegeDB;

-- Drop existing audit table and triggers (clean start)
DROP TABLE IF EXISTS Student_Audit;
DROP TRIGGER IF EXISTS trg_before_student_insert;
DROP TRIGGER IF EXISTS trg_after_student_insert;
DROP TRIGGER IF EXISTS trg_before_student_update;
DROP TRIGGER IF EXISTS trg_after_student_update;
DROP TRIGGER IF EXISTS trg_after_student_delete;

-- Create Audit table
CREATE TABLE Student_Audit (
    AuditID INT AUTO_INCREMENT PRIMARY KEY,
    RollNo INT,
    Action VARCHAR(10),
    OldName VARCHAR(50),
    NewName VARCHAR(50),
    ChangeDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

DELIMITER //

-- BEFORE INSERT Trigger (Validation)
CREATE TRIGGER trg_before_student_insert
BEFORE INSERT ON Student
FOR EACH ROW
BEGIN
    IF NEW.Age < 18 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: Student age must be 18 or above';
    END IF;
END //

-- AFTER INSERT Trigger (Audit)
CREATE TRIGGER trg_after_student_insert
AFTER INSERT ON Student
FOR EACH ROW
BEGIN
    INSERT INTO Student_Audit (RollNo, Action, NewName)
    VALUES (NEW.RollNo, 'INSERT', NEW.Name);
END //

-- BEFORE UPDATE Trigger
CREATE TRIGGER trg_before_student_update
BEFORE UPDATE ON Student
FOR EACH ROW
BEGIN
    IF NEW.Age < OLD.Age THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: Age cannot be decreased';
    END IF;
END //

-- AFTER UPDATE Trigger (Audit)
CREATE TRIGGER trg_after_student_update
AFTER UPDATE ON Student
FOR EACH ROW
BEGIN
    INSERT INTO Student_Audit (RollNo, Action, OldName, NewName)
    VALUES (NEW.RollNo, 'UPDATE', OLD.Name, NEW.Name);
END //

-- AFTER DELETE Trigger (Audit)
CREATE TRIGGER trg_after_student_delete
AFTER DELETE ON Student
FOR EACH ROW
BEGIN
    INSERT INTO Student_Audit (RollNo, Action, OldName)
    VALUES (OLD.RollNo, 'DELETE', OLD.Name);
END //

DELIMITER ;

-- ==================== TEST TRIGGERS ====================

-- Test 1: Successful INSERT (Age >= 18)
INSERT INTO Student (RollNo, Name, Age, Email, DeptID) 
VALUES (108, 'Henry', 25, 'henry@college.edu', 2);

-- Test 2: Failed INSERT (Age < 18) - Uncomment to test error
-- INSERT INTO Student (RollNo, Name, Age, Email, DeptID) 
-- VALUES (109, 'Ivy', 16, 'ivy@college.edu', 1);

-- Test 3: Successful UPDATE
UPDATE Student SET Name = 'Henry Smith' WHERE RollNo = 108;

-- Test 4: Failed UPDATE (decreasing age) - Uncomment to test error
-- UPDATE Student SET Age = 20 WHERE RollNo = 108;

-- Test 5: DELETE
DELETE FROM Student WHERE RollNo = 108;

-- Check Audit Trail
SELECT * FROM Student_Audit;