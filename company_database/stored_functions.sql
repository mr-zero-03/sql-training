\! echo "-------------------------------hello Stored function"
DELIMITER $$
DROP FUNCTION IF EXISTS hello;
CREATE FUNCTION hello( string VARCHAR(20) )
RETURNS VARCHAR(30) DETERMINISTIC
BEGIN
  RETURN CONCAT( 'Hello, ', string, '!' );
END$$
DELIMITER ;

SELECT HELLO( first_name ) AS employee FROM employee;


\! echo "-------------------------------sum_numbers Stored function"
DELIMITER $$
DROP FUNCTION IF EXISTS sum_numbers;
CREATE FUNCTION sum_numbers( x INT, y INT )
RETURNS INT DETERMINISTIC
BEGIN
  DECLARE z INT;
  SET z = x + y;
  RETURN z;
END$$
DELIMITER ;

SELECT SUM_NUMBERS( 5, 2 );
