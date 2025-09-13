CREATE DATABASE IF NOT EXISTS tech_company DEFAULT CHARACTER SET utf8;
USE tech_company;
DROP TABLE if exists employees;
DROP TABLE if exists departments;

CREATE TABLE departments (
	department_number INTEGER,
	department_name VARCHAR(30),
	office_location VARCHAR(30),
	PRIMARY KEY (department_number)
);

CREATE TABLE employees (
	employee_number INTEGER,
	employee_name VARCHAR(30),
	job_title VARCHAR(30),
	manager_id INTEGER,
	hire_date DATE,
	salary DECIMAL(10,2),
	commission DECIMAL(10,2),
	department_number INTEGER,
	PRIMARY KEY (employee_number),
	FOREIGN KEY (department_number) REFERENCES departments(department_number)
);


INSERT INTO departments (department_number, department_name, office_location) VALUES (10, 'ACCOUNTING', 'NEW YORK');
INSERT INTO departments (department_number, department_name, office_location) VALUES (20, 'RESEARCH', 'DALLAS');
INSERT INTO departments (department_number, department_name, office_location) VALUES (30, 'SALES', 'CHICAGO');
INSERT INTO departments (department_number, department_name, office_location) VALUES (40, 'OPERATIONS', 'BOSTON');

INSERT INTO employees (employee_number, employee_name, job_title, manager_id, hire_date, salary, commission, department_number) VALUES (7369, 'SMITH', 'CLERK', 7902, '1980-12-17', 800, NULL, 20);
INSERT INTO employees (employee_number, employee_name, job_title, manager_id, hire_date, salary, commission, department_number) VALUES (7499, 'ALLEN', 'SALESMAN', 7698, '1981-02-20', 1600, 300, 30);
INSERT INTO employees (employee_number, employee_name, job_title, manager_id, hire_date, salary, commission, department_number) VALUES (7521, 'WARD', 'SALESMAN', 7698, '1981-02-22',  1250, 500, 30);
INSERT INTO employees (employee_number, employee_name, job_title, manager_id, hire_date, salary, commission, department_number) VALUES (7566, 'JONES', 'MANAGER', 7839, '1981-04-02', 2975, NULL, 20);
INSERT INTO employees (employee_number, employee_name, job_title, manager_id, hire_date, salary, commission, department_number) VALUES (7654, 'MARTIN', 'SALESMAN', 7698, '1981-09-28', 1250, 1400, 30);
INSERT INTO employees (employee_number, employee_name, job_title, manager_id, hire_date, salary, commission, department_number) VALUES (7698, 'BLAKE', 'MANAGER', 7839, '1981-05-01', 2850, NULL, 30);
INSERT INTO employees (employee_number, employee_name, job_title, manager_id, hire_date, salary, commission, department_number) VALUES (7782, 'CLARK', 'MANAGER', 7839, '1981-06-09', 2450, NULL, 10);
INSERT INTO employees (employee_number, employee_name, job_title, manager_id, hire_date, salary, commission, department_number) VALUES (7788, 'SCOTT', 'ANALYST', 7566, '1987-04-19', 3000, NULL, 20);
INSERT INTO employees (employee_number, employee_name, job_title, manager_id, hire_date, salary, commission, department_number) VALUES (7839, 'KING', 'PRESIDENT', NULL, '1981-11-17', 5000, NULL, NULL);
INSERT INTO employees (employee_number, employee_name, job_title, manager_id, hire_date, salary, commission, department_number) VALUES (7844, 'TURNER', 'SALESMAN', 7698, '1981-09-08', 1500, 0, 30);
INSERT INTO employees (employee_number, employee_name, job_title, manager_id, hire_date, salary, commission, department_number) VALUES (7876, 'ADAMS', 'CLERK', 7788, '1987-05-23', 1100, NULL, 20);
INSERT INTO employees (employee_number, employee_name, job_title, manager_id, hire_date, salary, commission, department_number) VALUES (7900, 'JAMES', 'CLERK', 7698, '1981-12-03', 950, NULL, 30);
INSERT INTO employees (employee_number, employee_name, job_title, manager_id, hire_date, salary, commission, department_number) VALUES (7902, 'FORD', 'ANALYST', 7566, '1981-12-03', 3000, NULL, 20);
INSERT INTO employees (employee_number, employee_name, job_title, manager_id, hire_date, salary, commission, department_number) VALUES (7934, 'MILLER', 'CLERK', 7782, '1982-01-23', 1300, NULL, 10);


SELECT *
FROM employees;

#_____________________________________________________________________________
# Single Table Assignments
# Let's start with a couple of simple tasks to get you adjusted to your new role.
#_____________________________________________________________________________

# 1. Find the employee number for employees named MARTIN.

SELECT employee_number FROM employees
WHERE employee_name = 'MARTIN';

#
# 2. Find the employee(s) with a salary greater than 1500.

SELECT employee_name FROM employees
WHERE salary > 1500;

#
# 3. List the names of salesmen that earn more than 1300.

SELECT employee_name FROM employees
WHERE job_title = 'SALESMAN'
AND salary > 1300;

#
# 4. List the names of employees that are not salesmen.

SELECT employee_name FROM employees
WHERE job_title != 'salesmen';

#
# 5. List the names of all clerks together with their salary with a deduction of 10%.

SELECT employee_name, salary * 0.9 AS salary_after_deduction FROM employees
WHERE job_title = 'CLERK';

#
# 6. Find the name of employees hired before May 1981.

SELECT employee_name FROM employees
WHERE hire_date < '1981-05-01';

#
# 7. List employees sorted by salary in descending order (i.e. highest salary first).

SELECT employee_name, salary FROM employees
ORDER BY salary DESC;

#
# 8. List departments sorted by location.

SELECT department_name, office_location FROM departments
ORDER BY office_location ASC;

#
# 9. Find name of the department located in New York.

SELECT department_name FROM departments
WHERE office_location = 'NEW YORK';

#
# 10. You have proven your worth at the company. Your colleague comes to you trying to remember what's-his-name.
#       It starts with a J and ends with S. Can you help her?

SELECT employee_name FROM employees
WHERE employee_name LIKE 'J%S';

#
# 11. Maybe that wasn't helpful. "Oh yeah, I remember now!" they say and tell you that he is a manager.

SELECT employee_name FROM employees
WHERE employee_name LIKE 'J%S' AND job_title = 'MANAGER';

#
# 12. How many employees are there in each department?

SELECT department_number, COUNT(*) AS number_of_employee
FROM employees
GROUP BY department_number;


#_____________________________________________________________________________
#_____________________________________________________________________________
# Aggregate functions
#_____________________________________________________________________________

# For the first assignment, take on the hat of a Data Analyst. You've been tasked to create a summary of interesting data.
#    Use MIN, MAX, AVG, SUM, ORDER BY, BETWEEN and more.
# If you in this task manage to solve one of the next assignments, then pat yourself on the back! You are a valued employee at tech company.
#
# 1. List the number of employees.

SELECT COUNT(*) AS number_of_employess FROM employees;

#
# 2. List the sum of all salaries (excluding commission).

SELECT SUM(salary) AS total_salary FROM employees;

#
# 3. List the average salary for employees in department 20.
#
SELECT AVG(salary) AS average_salary FROM employees
WHERE department_number = 20;

# 4. List the unique job titles in the company.
#
SELECT job_title FROM employees
GROUP BY job_title;

# 5. List the number of employees in each department.

SELECT department_number, COUNT(*) AS number_of_employee FROM employees
GROUP BY department_number;

#
# 6. List in decreasing order the maximum salary in each department together with the department number.

SELECT department_number, MAX(salary) AS maximum_salary FROM employees
GROUP BY department_number
ORDER BY maximum_salary DESC;

#
# 7. List total sum of salary and commission for all employees.

SELECT SUM(salary + COALESCE(commission, 0)) AS sum_of_all_salary_included_comission FROM employees;


#_____________________________________________________________________________
#_____________________________________________________________________________
# JOIN Assignments
#_____________________________________________________________________________

# 1. Create an INNER JOIN between employees and departments to get the department name for each employee. Show all columns.
# Inner Join

SELECT *
FROM employees employee
INNER JOIN departments department
ON employee.department_number = department.department_number;


#
# 2. Continue from the last task. Show two columns. The employee_name and their corresponding department_name.
#   Oh, and can you sort them alphabetically (A-Z)?
#

SELECT employee_name, department_name
FROM employees employee
INNER JOIN departments department
ON employee.department_number = department.department_number ORDER BY employee_name ASC;


# 3. Now is the time to make a LEFT JOIN. Let's look at employee_name and department_name only.
#   There is one more person this time who didn't show in the previous query. Who is it and why?

SELECT employee_name, department_name
FROM employees employee
LEFT JOIN departments department
ON employee.department_number = department.department_number;

# King dukker ikke op, da han som den eneste ikke har et department_number. Vi har lige sagt, 'vis alle employees som har noget til fælles med departments'.


# 4. Consider this query:

#       SELECT departments.department_name, COUNT(employees.employee_number)
#       FROM employees
#       JOIN departments
#       ON departments.department_number = employees.department_number
#       GROUP BY department_name;

# One department is missing. Which one and why? (Look in the database).

 # Der er ikke nogen employees med department_number som macher OPERATIONS department_number, 40. Derfor vises OPERATIONS ikke.



# 5. To get the missing department change the previous query to use a RIGHT JOIN.
      SELECT departments.department_name, COUNT(employees.employee_number)
      FROM employees
      RIGHT JOIN departments
      ON departments.department_number = employees.department_number
      GROUP BY department_name;


# 6. SCOTT sends you this query and asks you to run it. In order to assess whether it is information that SCOTT is privy to,
#   you must first understand it. Describe in technical terms what this query does:
#
      SELECT * FROM employees employee
      JOIN employees manager
      ON employee.manager_id = manager.employee_number
      ORDER BY employee.employee_name;

# Den viser alle medarbejdere, i alfabetisk rækkefølge, der referer til en manager og deres data samt data om manageren.



# 7. Get two columns: employees and their managers.

SELECT employee.employee_name AS employee, manager.employee_name AS manager
FROM employees employee
JOIN employees manager
ON employee.manager_id = manager.employee_number
ORDER BY employee.employee_name;


# 8. Use the HAVING keyword (feel free to look it up) to show the departments with more than 3 employees.
#    The as number_of_employees is so that you can reference the value later on in the query:
#
SELECT employee.department_number, COUNT(employee.department_number) as number_of_employees
FROM employees employee
GROUP BY department_number
HAVING COUNT(employee.department_number) > 3;


# 9.  Subquery time! Select the name and salary of employees whose salary is above average:
#     WHERE salary > (SELECT AVG(salary) FROM employees)

SELECT employee_name, salary FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);



#_____________________________________________________________________________
#_____________________________________________________________________________
# Join Table (Many-to-many)
#_____________________________________________________________________________


# 1. Create a new table called leaders and insert rows into it.

DROP TABLE IF EXISTS leaders;

CREATE TABLE leaders (
    leader_number INTEGER,
	leader_name VARCHAR(30),
	job_title VARCHAR(30),
	hire_date DATE,
	salary DECIMAL(10,2),
	commission DECIMAL(10,2),
	department_number INTEGER,
	PRIMARY KEY (leader_number),
	FOREIGN KEY (department_number) REFERENCES departments(department_number)
);


INSERT INTO leaders (leader_number, leader_name, job_title, hire_date, salary, commission, department_number) VALUES (9001, 'NELSON', 'TEAM LEAD', '2020-03-15', 4500.00, NULL, 10);
INSERT INTO leaders (leader_number, leader_name, job_title, hire_date, salary, commission, department_number) VALUES (9002, 'PARKER', 'PROJECT MANAGER', '2019-06-01', 5200.00, NULL, 20);
INSERT INTO leaders (leader_number, leader_name, job_title, hire_date, salary, commission, department_number) VALUES (9003, 'LEE', 'SALES LEAD', '2021-09-10', 4800.00, 800.00, 30);
INSERT INTO leaders (leader_number, leader_name, job_title, hire_date, salary, commission, department_number) VALUES (9004, 'ANDERSON', 'OPERATIONS LEAD', '2018-11-05', 5000.00, NULL, 40);
INSERT INTO leaders (leader_number, leader_name, job_title, hire_date, salary, commission, department_number) VALUES (9005, 'GARCIA', 'HR MANAGER', '2022-01-20', 4300.00, NULL, 10);


# 2. Create a new table called employees_leaders that should link the employees and leaders tables. This is called a join table.
#    It will enable you to create a many-to-many relationship between employees and leaders (a leader can manage multiple
#    employees and an employee can have multiple leaders). Try to figure it out yourself, otherwise here is the solution:

-- Join table linking employees <-> leaders (many-to-many)
CREATE TABLE employees_leaders (
  employee_number INT NOT NULL,
  leader_number   INT NOT NULL,
  created_at      TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

#       created_at → en kolonne i tabellen, der skal gemme et tidspunkt.
#       TIMESTAMP → datatypen, som kan gemme både dato og tid (fx 2025-09-13 14:32:55).
#       DEFAULT CURRENT_TIMESTAMP → hvis du ikke selv giver en værdi,
#       så bliver kolonnen automatisk udfyldt med det tidspunkt, hvor rækken blev indsat.

  -- one row per (employee, leader) pair
  PRIMARY KEY (employee_number, leader_number),

  -- foreign keys
  CONSTRAINT fk_el_employee
    FOREIGN KEY (employee_number)
    REFERENCES employees(employee_number)
    ON DELETE CASCADE ON UPDATE CASCADE,

#   ON DELETE CASCADE
#   Hvis en række i parent-tabellen slettes → så slettes alle de rækker i join-tabellen, der peger på den.

  CONSTRAINT fk_el_leader
    FOREIGN KEY (leader_number)
    REFERENCES leaders(leader_number)
    ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;

#   CONSTRAINT → betyder, at vi definerer en regel for tabellen.
#   fk_el_employee → er bare navnet på den regel (constraint).
#   fk = foreign key
#   el = employees_leaders (join-tabellen)
#   employee = den kolonne, reglen handler om

# ENGINE=InnoDB;
#   “denne tabel skal bruge InnoDB-motoren.”
#   Fordi den har nogle features, som andre motorer (fx den gamle MyISAM) ikke har:
#
# Foreign keys → du kan lave relationer mellem tabeller (FOREIGN KEY ... REFERENCES ...).
# Transactions → du kan lave BEGIN, COMMIT, ROLLBACK (fx hvis noget går galt, kan du fortryde).
# Row-level locking → når én bruger ændrer på en række, bliver kun den række låst (hurtigere end at låse hele tabellen).
# God performance → især til komplekse systemer med mange relationer.








# 3. Create rows in employees_leaders that link employees to their respective leaders.
#

-- SALES afdeling (department 30)
INSERT INTO employees_leaders (employee_number, leader_number)
VALUES
  (7499, 9003),
  (7521, 9003),
  (7654, 9003),
  (7698, 9003),
  (7844, 9003),
  (7900, 9003);

-- RESEARCH afdeling (department 20)
INSERT INTO employees_leaders (employee_number, leader_number)
VALUES
  (7369, 9002),
  (7566, 9002),
  (7788, 9002),
  (7876, 9002),
  (7902, 9002);

-- ACCOUNTING afdeling (department 10)
INSERT INTO employees_leaders (employee_number, leader_number)
VALUES
  (7782, 9001),  --
  (7934, 9005);

-- KING som President (uden department_number)
INSERT INTO employees_leaders (employee_number, leader_number)
VALUES
  (7839, 9004);




# 4. Create a many-to-many query between employees and leaders. It requires two JOIN statements.
#    First you select from employees, then you join with employees_leaders, and finally you join again with leaders.

SELECT e.employee_name, l.leader_name
FROM employees e
JOIN employees_leaders el
  ON e.employee_number = el.employee_number
JOIN leaders l
  ON el.leader_number = l.leader_number
ORDER BY e.employee_name, l.leader_name;


