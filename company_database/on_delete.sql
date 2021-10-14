\! echo "ON DELETE SET NULL: Deleting employee 102 who is the branch 2 manager and supervisor of employees 103, 104"
SELECT * FROM employee WHERE id = 102;
SELECT * FROM branch WHERE id = 2;
SELECT id, first_name, last_name, supervisor_id
FROM employee
WHERE id IN( 103, 104 );
\! echo "Deleting employee 102:"
DELETE FROM employee
WHERE id = 102;
SELECT * FROM employee WHERE id = 102;
SELECT * FROM branch WHERE id = 2;
SELECT id, first_name, last_name, supervisor_id
FROM employee
WHERE id IN( 103, 104 );
\! read -p "Enter to continue..." wait


\! echo "ON DELETE CASCADE: Deleting branch 2 to delete all the suppliers"
SELECT * FROM branch WHERE id = 2;
SELECT * FROM branch_supplier;
DELETE FROM branch WHERE id = 2;
\! echo "Deleting branch 2:"
SELECT * FROM branch WHERE id = 2;
SELECT * FROM branch_supplier;


\! read -p "I am going to leave all at it was before..." wait
SOURCE ~/Desktop/sql-training/company_database/insert.sql
