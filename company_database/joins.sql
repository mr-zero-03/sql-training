\! echo "Adding the branch 4"
DELETE FROM branch WHERE id = 4;
INSERT INTO branch VALUES( 4, 'Buffalo', NULL, NULL);
SELECT * FROM branch WHERE id = 4;

\! echo "INNER JOIN: Find all branches and the names of their managers"
SELECT branch.id AS 'Branch ID', branch.name, employee.id AS 'Employee ID', employee.first_name, employee.last_name
FROM employee
INNER JOIN branch
ON employee.id = branch.manager_id;

\! echo "LEFT JOIN: Find all the employees and those who are managers will have the branch ID and name"
SELECT employee.id AS 'Employee ID', employee.first_name, employee.last_name, branch.id AS 'Branch ID', branch.name
FROM employee
LEFT JOIN branch
ON employee.id = branch.manager_id;

\! echo "RIGHT JOIN: Find all the branches and those who have managers will have the manager id and his name"
SELECT branch.id AS 'Branch ID', branch.name, employee.id AS 'Employee ID', employee.first_name, employee.last_name
FROM employee
RIGHT JOIN branch
ON employee.id = branch.manager_id;
