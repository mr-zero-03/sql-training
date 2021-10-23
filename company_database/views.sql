\! echo "employee_branch View"
CREATE OR REPLACE VIEW employee_branch AS
SELECT employee.id AS employee_id, employee.first_name, employee.last_name, employee.sex, branch.id AS branch_id, branch.name AS branch_name
FROM employee, branch
WHERE employee.branch_id = branch.id;

SELECT * FROM employee_branch;


\! echo "employee_under_50 View"
CREATE OR REPLACE VIEW employee_under_50 AS
SELECT id, first_name, last_name, sex, FLOOR( ( DATEDIFF( CURDATE(), birth_date ) / 365 ) ) AS age
FROM employee
WHERE FLOOR( ( DATEDIFF( CURDATE(), birth_date ) / 365 ) ) <= 50;

SELECT * FROM employee_under_50;
