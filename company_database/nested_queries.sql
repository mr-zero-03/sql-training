\! echo "Find names of all employees who have sold over 30.000 to a single client"
SELECT employee.id, employee.first_name, employee.last_name
FROM employee
WHERE employee.id IN (
  SELECT works_with.employee_id
  FROM works_with
  WHERE works_with.total_sales > 30000
);
\! echo "Another way to do it is: (But the name is reppeated because it cannot be grouped because another table is used)"
SELECT works_with.employee_id, employee.first_name, employee.last_name, works_with.total_sales
FROM employee, works_with
WHERE works_with.total_sales > 30000 AND works_with.employee_id = employee.id;

\! echo "Find all clients who are handled by the branch that Michael Scott manages. Assuming you only know Michale's ID (102)"
SELECT client.id, client.name
FROM client
WHERE client.branch_id = (
  SELECT branch.id FROM branch
  WHERE branch.manager_id = 102
  LIMIT 1 -- To avoid returning multiple branches if Michael has
);
