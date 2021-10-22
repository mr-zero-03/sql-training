\! echo "-------------------------------count_employees_in_branch procedure"
DELIMITER $$
DROP PROCEDURE IF EXISTS count_employees_in_branch$$
CREATE PROCEDURE count_employees_in_branch( IN search_branch_id INT, OUT employees INT )
BEGIN

  SELECT search_branch_id AS 'I am going to search in the branch';
  SELECT * FROM employee WHERE branch_id = search_branch_id;
  SET employees = ( SELECT COUNT(*) AS employees_in_the_branch FROM employee WHERE employee.branch_id = search_branch_id );

END$$
DELIMITER ;

CALL count_employees_in_branch( 3, @employees );
SELECT @employees;


\! echo "-------------------------------add_to_var procedure"
DELIMITER $$
DROP PROCEDURE IF EXISTS add_to_var$$
CREATE PROCEDURE add_to_var( INOUT user_number INT, IN to_add INT )
BEGIN
  SELECT user_number AS 'Adding', to_add AS 'to';
  SET user_number = user_number + to_add;
END $$
DELIMITER ;

SET @var = 10;
SELECT @var;
CALL add_to_var( @var, 5 );
SELECT @var;


\! echo "-------------------------------nested_loop procedure"
DELIMITER $$
DROP PROCEDURE IF EXISTS nested_loop$$
CREATE PROCEDURE nested_loop( IN first_loop INT, IN second_loop INT )
BEGIN
  DECLARE i INTEGER DEFAULT 0;
  DECLARE j INTEGER DEFAULT 0;

  SELECT first_loop AS 'first_loop(i) will go to';
  SELECT second_loop AS 'second_loop(j) will go to';

  WHILE i < first_loop DO
    SELECT i AS 'i';

    WHILE j < second_loop DO
      SELECT j AS '***j';
      SET j = j + 1;
    END WHILE;

    SET i = i + 1;
    SET j = 0;

  END WHILE;
END $$
DELIMITER ;

CALL nested_loop( 4, 3 );
