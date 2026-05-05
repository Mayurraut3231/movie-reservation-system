-- Create Users (run as admin/root)
CREATE USER IF NOT EXISTS 'student_user'@'localhost' IDENTIFIED BY 'password123';
CREATE USER IF NOT EXISTS 'faculty_user'@'localhost' IDENTIFIED BY 'password456';

-- Create Role
CREATE ROLE IF NOT EXISTS 'read_only', 'read_write';

-- Grant Privileges to Roles
GRANT SELECT ON CollegeDB.* TO 'read_only';
GRANT SELECT, INSERT, UPDATE, DELETE ON CollegeDB.* TO 'read_write';

-- Assign Roles to Users
GRANT 'read_only' TO 'student_user'@'localhost';
GRANT 'read_write' TO 'faculty_user'@'localhost';

-- Direct GRANT (without roles)
GRANT SELECT, INSERT ON CollegeDB.Student TO 'student_user'@'localhost';

-- REVOKE
REVOKE INSERT ON CollegeDB.Student FROM 'student_user'@'localhost';
REVOKE 'read_only' FROM 'student_user'@'localhost';

-- Show Grants
SHOW GRANTS FOR 'student_user'@'localhost';
SHOW GRANTS FOR 'faculty_user'@'localhost';

-- Drop users and roles (cleanup)
-- DROP USER 'student_user'@'localhost', 'faculty_user'@'localhost';
-- DROP ROLE 'read_only', 'read_write';