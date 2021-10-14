CREATE TABLE IF NOT EXISTS employee_history (
  id INT,
  name VARCHAR(40),
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
    INSERT IGNORE INTO employee_history VALUES( NEW.id, NEW.first_name, 'Active', now() );
  END$$
DELIMITER ;

INSERT INTO employee VALUES( 109, 'Oscar', 'Martinez', '1968-02-19', 'M', 69000, 106, 3 );
SELECT * FROM employee WHERE id = 109;
DELETE FROM employee WHERE id = 109;

INSERT INTO employee VALUES( 110, 'Kevin', 'Malone', '1978-02-19', 'M', 69000, 106, 3 );
SELECT * FROM employee WHERE id = 110;
DELETE FROM employee WHERE id = 110;

SELECT * FROM employee_history;
