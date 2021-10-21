SELECT id, first_name, salary,
CASE
    WHEN salary > 75000 THEN 'The salary is greater than 75000'
    WHEN salary = 55000 THEN 'The salary is 55000'
    ELSE 'The salary is under 55000'
END AS salaryText
FROM employee;
