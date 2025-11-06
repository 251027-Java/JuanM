-- Active: 1762366290795@@127.0.0.1@5432@teamdatabase@teamschema
-- Active: 1762366290795@@127.0.0.1@5432@teamdatabase
CREATE DATABASE teamDatabase;

CREATE SCHEMA teamSchema;

CREATE TABLE employee (
    id INTEGER PRIMARY KEY,
    first_name VARCHAR(30),
    last_name VARCHAR(30),
    assignation_id INTEGER
);

CREATE TABLE assignation (
    id INTEGER PRIMARY KEY,
    name VARCHAR(30),
    salary INTEGER
);

CREATE TABLE department (
    id INTEGER PRIMARY KEY,
    name VARCHAR(30)
);

CREATE TABLE workplace (
    employee_id INTEGER,
    department_id INTEGER
);

ALTER TABLE employee
ADD CONSTRAINT fk_assignation_id FOREIGN KEY (assignation_id) REFERENCES assignation (id);

ALTER TABLE employee ALTER COLUMN assignation_id SET NOT NULL;

ALTER TABLE workplace
ALTER COLUMN employee_id
SET NOT NULL,
ALTER COLUMN department_id
SET NOT NULL;

ALTER TABLE workplace
ADD CONSTRAINT fk_employee_id FOREIGN KEY (employee_id) REFERENCES employee (id);

ALTER TABLE workplace
ADD CONSTRAINT fk_department_id FOREIGN KEY (department_id) REFERENCES department (id);

INSERT INTO assignation (id, name, salary) VALUES z();