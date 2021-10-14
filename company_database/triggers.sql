CREATE TABLE IF NOT EXISTS trigger_test (
  message VARCHAR(100)
);

DELIMITER $$
DROP TRIGGER IF EXISTS on_insert_employee$$
CREATE
  TRIGGER on_insert_employee AFTER INSERT
  ON employee
  FOR EACH ROW BEGIN
    INSERT INTO trigger_test VALUES( 'Added a new employee' );
  END$$
DELIMITER ;

INSERT INTO employee VALUES( 109, 'Oscar', 'Martinez', '1968-02-19', 'M', 69000, 106, 3 );
SELECT * FROM employee WHERE id = 109;
DELETE FROM employee WHERE id = 109;

INSERT INTO employee VALUES( 110, 'Kevin', 'Malone', '1978-02-19', 'M', 69000, 106, 3 );
SELECT * FROM employee WHERE id = 110;
DELETE FROM employee WHERE id = 110;

SELECT * FROM trigger_test;
