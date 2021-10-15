--
-- Branch records
DELETE FROM branch;
INSERT INTO branch VALUES( 1, 'Corporate', NULL, '2006-02-09' );
INSERT INTO branch VALUES( 2, 'Scranton', NULL, '1992-04-06' );
INSERT INTO branch VALUES( 3, 'Stamford', NULL, '1998-02-13' );

--
-- Employee records
DELETE FROM employee;
INSERT INTO employee VALUES
  ( 100, 'David', 'Wallace', '1967-11-17', 'M', 250000, NULL, 1 ),
  ( 101, 'Jan', 'Levinson', '1961-05-11', 'F', 110000, 100, 1 ),
  ( 102, 'Michael', 'Scott', '1964-03-15', 'M', 75000, 100, 2 ),
  ( 103, 'Angela', 'Martin', '1971-06-25', 'F', 63000, 102, 2 ),
  ( 104, 'Kelly', 'Kapoor', '1980-02-05', 'F', 55000, 102, 2 ),
  ( 105, 'Stanley', 'Hudson', '1980-02-19', 'M', 69000, 100, 2 ),
  ( 106, 'Josh', 'Porter', '1969-09-05', 'M', 78000, 106, 3 ),
  ( 107, 'Andy', 'Bernard', '1973-07-22', 'M', 65000, 106, 3 ),
  ( 108, 'Jim', 'Halpert', '1978-10-01', 'M', 71000, 106, 3 );

-- Updating branch manager
UPDATE branch
SET manager_id = 100
WHERE id = 1;

UPDATE branch
SET manager_id = 102
WHERE id = 2;

UPDATE branch
SET manager_id = 106
WHERE id = 3;

--
-- Client records
DELETE FROM client;
INSERT INTO client VALUES
  ( 400, 'Dunmore Highschool', 2 ),
  ( 401, 'Lackwana Country', 2 ),
  ( 402, 'FedEx', 3 ),
  ( 403, 'John Daly Law, LLC', 3 ),
  ( 404, 'Scraton Whitepages', 2 ),
  ( 405, 'Times Newspaper', 3 ),
  ( 406, 'FedEx', 2 );

--
-- Works With records
DELETE FROM works_with;
INSERT INTO works_with( employee_id, client_id, total_sales ) VALUES
  ( 105, 400, 55000 ),
  ( 102, 401, 267000 ),
  ( 108, 402, 22500 ),
  ( 107, 403, 5000 ),
  ( 108, 403, 12000 ),
  ( 105, 404, 33000 ),
  ( 107, 405, 26000 ),
  ( 102, 406, 15000 ),
  ( 105, 406, 103000 );

--
-- Branch Supplier records
DELETE FROM branch_supplier;
INSERT INTO branch_supplier( branch_id, supplier_name, supply_type ) VALUES
  ( 2, 'Hammer Mill', 'Paper' ),
  ( 2, 'Uni-ball', 'Writing Utensils' ),
  ( 3, 'Patriot Paper', 'Paper' ),
  ( 2, 'JT Forms & Labels', 'Custom Forms' ),
  ( 3, 'Uni-ball', 'Writing Utensils' ),
  ( 3, 'Hammer Mill', 'Paper' ),
  ( 3, 'Stamford Lables', 'Custom Forms' );


--
-- Show the added records
\! echo "Branch records"
SELECT * FROM branch;
\! echo "Employee records"
SELECT * FROM employee;
\! echo "Client records"
SELECT * FROM client;
\! echo "Works With records"
SELECT * FROM works_with;
\! echo "Branch Supplier records"
SELECT * FROM branch_supplier;
