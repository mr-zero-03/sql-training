SELECT * FROM student;


-- SELECT with an order
SELECT id, name, grade
FROM student
ORDER BY name; -- ASC is the default order

SELECT id, name, grade
FROM student
ORDER BY name DESC;

SELECT * FROM student
ORDER BY name DESC, identification_document ASC;


-- SELECT with limits
SELECT * FROM student
LIMIT 2;

SELECT * FROM student
ORDER BY id DESC
LIMIT 2;


-- SELECT with WHERE filter
SELECT id, name, sex FROM student
WHERE grade IS NOT NULL AND birthday_date IS NOT NULL;

SELECT id, identification_document, name FROM student
WHERE identification_document IN( 123456789, 345678912, 456789123 )
ORDER BY identification_document DESC;
