-- Insert (create) info in the table

INSERT INTO student( id, name, sex ) VALUES( 1, 'Alberto', 'M' );
INSERT INTO student VALUES( 2, 'Olivia', 4, '2012-02-02', 'F' );
INSERT INTO student VALUES( 3, 'Pedro', 1, '2015-03-03', 'M' );
INSERT INTO student( id, name, grade, sex ) VALUES( 4, 'Olivia', 9, 'F' );

SELECT * FROM student;
