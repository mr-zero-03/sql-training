-- Delete info from the table student

\! echo '-- Student table before update:';
SELECT * FROM student;

\! echo '-- The student with name Laura and ID < 4 is going to be deleted:';
DELETE FROM student
WHERE name = 'Laura' AND id < 4; 
SELECT * FROM student;

\! echo '-- The students with grade != 4 and grade >= 9 are going to be deleted:';
DELETE FROM student
WHERE grade <> 4 AND grade >= 9;
SELECT * FROM student;

\! echo '-- All the students in the table are going to be deleted:';
DELETE FROM student; -- Delete all the records in the table
SELECT * FROM student;
