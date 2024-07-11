-- CREATE DATABASE hotel; 
-- USE hotel;
/*
CREATE TABLE employees(
	id_employee INT AUTO_INCREMENT UNIQUE,
    name VARCHAR(40) NOT NULL,
    last_name VARCHAR(40) NOT NULL,
    position VARCHAR(40) NOT NULL,
    hourly_pay DECIMAL(4, 2) NOT NULL,
    id_department INT NOT NULL,
    CONSTRAINT pk_employees PRIMARY KEY (id_employee),
    CONSTRAINT fk_department FOREIGN KEY (id_department) REFERENCES departments (id_department)
);
    
CREATE TABLE departments (
	id_department INT AUTO_INCREMENT UNIQUE,
    name VARCHAR(40) NOT NULL,
    budget INT NOT NULL,
    CONSTRAINT pk_department PRIMARY KEY (id_department)
);


INSERT INTO departments (name, budget)
VALUES  ("Rooms", 30000),
		("Front Office", 23000),
        ("Spa", 17000),
        ("Food and Beverage", 34000),
        ("Housekeeping", 21000),
        ("Residences", 12000),
        ("Accounting", 16000);
	
    
SELECT * from departments;

INSERT INTO employees (name, last_name, position, hourly_pay, id_department)
VALUES  ("Abril", "F", "Accounting Manager", 28.00, 7),
		("Martin", "Leo", "Front Desk Agent", 21.00, 2),
        ("Ku Yi", "La", "Front Desk Supervisor", 24.00, 2),
        ("Cait", "Johnson", "Spa Supervisor", 23.50, 3),
        ("Shari", "Padkins", "Director of Front Office", 35.00, 2),
        ("Lucas", "Wakefall", "Director of Rooms", 39.00, 1),
        ("Juan", "Zambrano", "Housekeeping Manager", 26.00, 5),
        ("Karan", "Brar", "Food and Beverage Director", 34.00, 4),
        ("Mike", "Stephan", "Director of Residences", 28.00, 6),
        ("Olga", "Nunez", "Accounting Supervisor", 21.00, 7);
        */
SELECT * FROM departments
INNER JOIN employees e
ON e.id_department = departments.id_department;

DELETE FROM departments WHERE name = "Residences";

UPDATE employees SET position = ("Director of Accounting")  WHERE id_employee = 1;

ALTER TABLE departments
ADD 
CONSTRAINT CK_budget CHECK (budget >= 0);

INSERT INTO departments (name, budget)
VALUES ("IT", 30000), ("HR", 12000);



ALTER TABLE employees
ADD CONSTRAINT ck_hourly_wage CHECK (hourly_pay >= 15);

INSERT INTO employees (name, last_name, position, hourly_pay, id_department)
VALUES ("Samwise", "Gamgee", "Front Desk Manager", 26, 2);

SELECT * FROM employees