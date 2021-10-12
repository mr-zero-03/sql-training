\! echo "Find all the employees in descending order by salary"
SELECT * FROM employee
ORDER BY salary DESC;

\! echo "Find all employees ordered by sex then name"
SELECT * FROM employee
ORDER BY sex, first_name, last_name;

\! echo "Find the first 5 employees"
SELECT * FROM employee
LIMIT 5;

\! echo "Find the first name and last name of all the employees"
SELECT first_name, last_name FROM employee;

\! echo "Find the forename and surname of all the employees"
SELECT first_name AS forename, last_name AS surname -- This is to change temporally the name of the column
FROM employee;

\! echo "Find out all the different genders"
SELECT DISTINCT sex FROM employee;

\! echo "Find out all the different branches but exclude the branch_id 3"
SELECT DISTINCT branch_id FROM employee WHERE branch_id <> 3;
