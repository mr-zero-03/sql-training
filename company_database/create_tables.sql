SET foreign_key_checks = 0; -- Inactivate the foreign key check to rewrite the tables

--
-- Employee table
DROP TABLE IF EXISTS employee;
CREATE TABLE employee (
  id INT AUTO_INCREMENT,
  first_name VARCHAR(40) NOT NULL,
  last_name VARCHAR(40) NOT NULL,
  birth_date DATE,
  sex CHAR(1),
  salary INT,
  supervisor_id INT,
  branch_id INT,

  PRIMARY KEY( id )
);

ALTER TABLE employee
ADD FOREIGN KEY( supervisor_id )
REFERENCES employee( id )
ON DELETE SET NULL;

--
-- Branch table
DROP TABLE IF EXISTS branch;
CREATE TABLE branch (
  id INT AUTO_INCREMENT,
  name VARCHAR(40),
  manager_id INT,
  manager_start_date DATE,

  PRIMARY KEY( id ),
  FOREIGN KEY( manager_id ) REFERENCES employee( id ) ON DELETE SET NULL
);

-- Employee branch_id FK
ALTER TABLE employee
ADD FOREIGN KEY( branch_id )
REFERENCES branch( id )
ON DELETE SET NULL;

--
-- Client table
DROP TABLE IF EXISTS client;
CREATE TABLE client (
  id INT AUTO_INCREMENT,
  name VARCHAR(40),
  branch_id INT,

  PRIMARY KEY( id ),
  FOREIGN KEY( branch_id ) REFERENCES branch( id ) ON DELETE SET NULL
);

--
-- Work With table
DROP TABLE IF EXISTS works_with;
CREATE TABLE works_with (
  employee_id INT,
  client_id INT,
  total_sales INT,

  PRIMARY KEY( employee_id, client_id ),
  FOREIGN KEY( employee_id ) REFERENCES employee( id ) ON DELETE CASCADE,
  FOREIGN KEY( client_id ) REFERENCES client( id ) ON DELETE CASCADE
);

--
-- Branch Supplier table
DROP TABLE IF EXISTS branch_supplier;
CREATE TABLE branch_supplier (
  branch_id INT,
  supplier_name VARCHAR(40),
  supply_type VARCHAR(40),

  PRIMARY KEY( branch_id, supplier_name ),
  FOREIGN KEY( branch_id ) REFERENCES branch( id ) ON DELETE CASCADE
);

SET foreign_key_checks = 1;
