\! echo '-- All records on the student table:';
SELECT * FROM student;


-- SELECT with an order
\! echo '-- Selecting the id, name and grade from the students and organizing them by name (ASC):';
SELECT id, name, grade
FROM student
ORDER BY name; -- ASC is the default order

\! echo '-- Selecting the id, name and grade from the students and organizing them by name (DESC):';
SELECT id, name, grade
FROM student
ORDER BY name DESC;

\! echo '-- Selecting the students and organizing them by name (DESC) and by identification_document (ASC):';
SELECT * FROM student
ORDER BY name DESC, identification_document ASC;


-- SELECT with limits
\! echo '-- Selecting the 2 first students:';
SELECT * FROM student
LIMIT 2;

\! echo '-- Organizing the students by id (DESC) and selecting the 2 first students:';
SELECT * FROM student
ORDER BY id DESC
LIMIT 2;


-- SELECT with WHERE filter
\! echo '-- Selecting the id, name and sex from the students who have a not null grade and not null birthday_date:';
SELECT id, name, sex FROM student
WHERE grade IS NOT NULL AND birthday_date IS NOT NULL;

\! echo '-- Selecting the id, identification_document and name from the students who have an identification 123456789, 345678912 or 456789123:';
SELECT id, identification_document, name FROM student
WHERE identification_document IN( 123456789, 345678912, 456789123 )
ORDER BY identification_document DESC;
