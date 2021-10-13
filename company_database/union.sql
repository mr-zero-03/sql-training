\! echo "Find a list of employee, branch and client names"
SELECT first_name AS 'Company names' FROM employee
UNION
SELECT name FROM branch
UNION
SELECT name FROM client;

\! echo "Find a list of all clients and branch suppliers names and show their branches"
SELECT name AS 'Client and branch suppliers names', branch_id
FROM client
UNION
SELECT supplier_name, branch_id FROM branch_supplier;

\! echo "Find a list of all money spent or earned by the company"
SELECT salary AS 'Money spent or earned' FROM employee
UNION
SELECT total_sales FROM works_with;
