-- Insert (create) info in the table

INSERT INTO student( id, identification_document, name, sex ) VALUES( 1, 123456789, 'Alberto', 'M' );
INSERT INTO student VALUES( 2, 234567891, 'Olivia', 4, '2012-02-02', 'F' );
INSERT INTO student VALUES( 3, 345678912, 'Pedro', 1, '2015-03-03', 'M' );
INSERT INTO student( id, identification_document, name, grade, sex ) VALUES( 4, 456789123, 'Olivia', 9, 'F' );

SELECT * FROM student;