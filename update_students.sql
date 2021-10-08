-- Update some records in the students table

\! echo '-- Student table before update:';
SELECT * FROM student;

\! echo '-- Student with id == 2 will have the name Laura:';
UPDATE student
SET name = 'Laura'
WHERE id = 2;
SELECT * FROM student WHERE id = 2;

\! echo '-- The grade will be NULL and the favorite_subject will be "No defined" to the users who have favorite_subject==NULL or favorite_subject="No favorite":';
UPDATE student
SET grade = NULL, favorite_subject = 'No defined'
WHERE favorite_subject IS NULL OR favorite_subject = 'No favorite';
SELECT * FROM student;
