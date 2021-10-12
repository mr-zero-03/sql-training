\! echo "Find any branch supplier who are in the label business"
SELECT *
FROM branch_supplier
WHERE supplier_name LIKE '% Labels%';

\! echo "Find any employee born in February"
SELECT *
FROM employee
WHERE birth_date LIKE '____-02-__';

\! echo "Find any client who are schools"
SELECT *
FROM client
WHERE name LIKE '%school%';

\! echo "Find any person whose name does not start with the letter J"
SELECT *
FROM employee
WHERE first_name NOT LIKE 'J%';

\! echo "Find any employee with the 'e' as the second letter in his name"
SELECT *
FROM employee
WHERE first_name LIKE '_e%';

\! echo "Find any employee whose name start with a letter between A-F"
SELECT *
FROM employee
WHERE first_name REGEXP '^[a-f]'
ORDER BY first_name;

\! echo "Find any employee whose name start with A, D or K"
SELECT *
FROM employee
WHERE first_name REGEXP '^[adk]';

\! echo "Find any employee whose does not name start with A, D or K"
SELECT *
FROM employee
WHERE first_name REGEXP '^[^adk]';
