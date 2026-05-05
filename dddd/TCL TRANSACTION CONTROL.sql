USE CollegeDB;

-- START TRANSACTION
START TRANSACTION;

-- Insert data
INSERT INTO Student VALUES (105, 'Eve', 23, 'eve@college.edu', 2);

-- Create SAVEPOINT
SAVEPOINT sp1;

-- Another insert
INSERT INTO Student VALUES (106, 'Frank', 20, 'frank@college.edu', 1);

-- Rollback to savepoint (undoes Frank, keeps Eve)
ROLLBACK TO SAVEPOINT sp1;

-- Commit the transaction (saves Eve)
COMMIT;

-- Demonstrate full ROLLBACK
START TRANSACTION;
INSERT INTO Student VALUES (107, 'Grace', 21, 'grace@college.edu', 3);
ROLLBACK; -- Grace is not saved

-- Verify
SELECT * FROM Student;