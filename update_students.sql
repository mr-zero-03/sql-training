-- Update some records in the students table

UPDATE student
SET name = 'Laura'
WHERE id = 2;
SELECT * FROM student WHERE id = 2;

UPDATE student
SET grade = NULL, favorite_subject = 'No defined'
WHERE favorite_subject IS NULL OR favorite_subject = 'No favorite';
SELECT * FROM student;
