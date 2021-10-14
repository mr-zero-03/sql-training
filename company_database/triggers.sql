CREATE TABLE IF NOT EXISTS employee_history (
  id INT,
  name VARCHAR(40),
  sex VARCHAR(15),
  status VARCHAR(15),
  last_modification DATETIME,

  PRIMARY KEY ( id )
);

DELIMITER $$
DROP TRIGGER IF EXISTS on_insert_employee$$
CREATE
  TRIGGER on_insert_employee AFTER INSERT
  ON employee
  FOR EACH ROW BEGIN
    IF NOT EXISTS ( SELECT 1=1 FROM employee_history WHERE employee_history.id = NEW.id  ) THEN
    BEGIN
      INSERT INTO employee_history( id, name, status, last_modification )
      VALUES( NEW.id, NEW.first_name, 'Active', now() );
    END;
    ELSE
    BEGIN
      UPDATE employee_history SET status = 'Active', last_modification = now() WHERE id = NEW.id;
    END;
  END IF;
  END$$
DELIMITER ;

DELIMITER $$
DROP TRIGGER IF EXISTS set_employee_sex$$
CREATE
  TRIGGER set_employee_sex AFTER INSERT
  ON employee
  FOR EACH ROW BEGIN
    IF ( NEW.sex = 'M' ) THEN
      UPDATE employee_history SET sex = 'Male' WHERE NEW.id = employee_history.id;
    ELSEIF ( NEW.sex = 'F' ) THEN
      UPDATE employee_history SET sex = 'Female' WHERE NEW.id = employee_history.id;
    ELSE
      UPDATE employee_history SET sex = 'Undefined' WHERE NEW.id = employee_history.id;
    END IF;
  END$$
DELIMITER ;

INSERT INTO employee VALUES
  ( 109, 'Oscar', 'Martinez', '1968-02-19', 'M', 69000, 106, 3 ),
  ( 110, 'Kevin', 'Malone', '1978-02-19', NULL, 69000, 106, 3 ),
  ( 111, 'Pam', 'Beesly', '1988-02-19', 'F', 69000, 106, 3 );
SELECT * FROM employee WHERE id IN( 109, 110, 111 );
SELECT * FROM employee_history;


\! read -p "I am going to delete the employees with ID 109 and 110" wait

DELIMITER $$
DROP TRIGGER IF EXISTS on_delete_employee$$
CREATE
  TRIGGER on_delete_employee BEFORE DELETE
  ON employee
  FOR EACH ROW BEGIN
    UPDATE employee_history SET status = 'Deleted', last_modification = now()
    WHERE id = OLD.id;
  END$$
DELIMITER ;

DELETE FROM employee WHERE id IN( 109, 110, 111 );
SELECT * FROM employee_history;
