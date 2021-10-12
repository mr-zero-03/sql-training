\! echo "Count all the employees"
SELECT COUNT( * ) FROM employee;

SELECT COUNT( * ) AS "Count Employees" FROM employee; 

\! echo "Count the supervisors amount"
SELECT COUNT( supervisor_id ) FROM employee;

\! echo "Find the number of female employees born after 1970"
SELECT COUNT( id ) FROM employee
WHERE sex = 'F' AND birth_date >= '1971-01-01';

\! echo "Find the average of all the male employee's salaries"
SELECT AVG( salary ) FROM employee
WHERE sex = 'M';

\! echo "Find the sum of all the employee's salaries"
SELECT SUM( salary ) AS Payroll FROM employee;

\! echo "Find how many females and males there are"
SELECT sex, COUNT( sex ) FROM employee
GROUP BY sex;

\! echo "Find how many people there are in every branch"
SELECT branch_id, COUNT( branch_id ) FROM employee
GROUP BY branch_id;

\! echo "Find how many males and females there are in every branch"
SELECT branch_id, sex, COUNT( sex ) FROM employee
GROUP BY sex, branch_id
ORDER BY sex DESC;

\! echo "Find the total sales of each salesman"
SELECT employee_id, SUM( total_sales ) AS total_sales
FROM works_with
GROUP BY employee_id;

\! echo "Find how much money the client spent on a branch"
SELECT works_with.client_id, employee.branch_id, SUM( works_with.total_sales ) AS total_sales
FROM works_with, employee
WHERE works_with.employee_id = employee.id
GROUP BY works_with.client_id, employee.branch_id;
