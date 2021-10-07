-- Delete info from the table student

DELETE FROM student
WHERE name = 'Laura' AND id < 4; 
SELECT * FROM student;

DELETE FROM student
WHERE grade <> 4 AND grade >= 9;
SELECT * FROM student;

DELETE FROM student; -- Delete all the records in the table
SELECT * FROM student;
