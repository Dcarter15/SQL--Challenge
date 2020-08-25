-- Create schemas

-- Create tables
CREATE TABLE IF NOT EXISTS Titles
(
    title_id VARCHAR(45) NOT NULL,
    title VARCHAR(45) NOT NULL,
    PRIMARY KEY(title_id)
);

CREATE TABLE IF NOT EXISTS Wages_Salaries
(
    emp_no INTEGER NOT NULL,
    salary INTEGER NOT NULL,
    PRIMARY KEY(emp_no)
);

CREATE TABLE IF NOT EXISTS Departments
(
    dep_no VARCHAR(45) NOT NULL,
    dep_name VARCHAR(45),
    PRIMARY KEY(dep_no)
);

CREATE TABLE IF NOT EXISTS Employees
(
    emp_no INTEGER NOT NULL,
    emp_title VARCHAR(45) NOT NULL,
    birth_date DATE NOT NULL,
    first_name VARCHAR(45) NOT NULL,
    last_name VARCHAR(45) NOT NULL,
    sex VARCHAR(45) NOT NULL,
    hire_date DATE NOT NULL,
    PRIMARY KEY(emp_no)
);

CREATE TABLE IF NOT EXISTS Department_Manager
(
    dept_no VARCHAR(45) NOT NULL,
    emp_no INTEGER NOT NULL,
    PRIMARY KEY(dept_no, emp_no)
);

CREATE TABLE IF NOT EXISTS Department_Employees
(
    emp_no INTEGER NOT NULL,
    dep_no VARCHAR(45) NOT NULL,
    PRIMARY KEY(emp_no, dep_no)
);


-- Create FKs
ALTER TABLE Employees
    ADD    FOREIGN KEY (emp_title)
    REFERENCES Titles(title_id)
    MATCH SIMPLE
;
    
ALTER TABLE Department_Manager
    ADD    FOREIGN KEY (emp_no)
    REFERENCES Employees(emp_no)
    MATCH SIMPLE
;
    
ALTER TABLE Wages_Salaries
    ADD    FOREIGN KEY (emp_no)
    REFERENCES Titles(title_id)
    MATCH SIMPLE
;
    
ALTER TABLE Department_Employees
    ADD    FOREIGN KEY (emp_no)
    REFERENCES Employees(emp_no)
    MATCH SIMPLE
;
    
ALTER TABLE Department_Manager
    ADD    FOREIGN KEY (dept_no)
    REFERENCES Departments(dep_no)
    MATCH SIMPLE
;
    
ALTER TABLE Department_Employees
    ADD    FOREIGN KEY (dep_no)
    REFERENCES Departments(dep_no)
    MATCH SIMPLE
;
    

-- Create Indexes