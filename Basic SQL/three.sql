CREATE TABLE unique_dogs(
    dog_id INT NOT NULL,
    name VARCHAR(33),
    age INT,
    PRIMARY KEY (dog_id)
);

INSERT INTO unique_dogs(dog_id,name,age) 
VALUES (1,'KAKA',44);

CREATE TABLE unique_dogs1(
    dog_id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(33),
    age INT,
    PRIMARY KEY(dog_id)
);

CREATE TABLE employees(
    id INT NOT NULL AUTO_INCREMENT,
    first_name VARCHAR(255) NOT NULL,
    middle_name VARCHAR(255),
    last_name VARCHAR(255) NOT NULL,
    email VARCHAR(44) NOT NULL,
    city VARCHAR(44),
    age INT NOT NULL,
    current_status VARCHAR(33) NOT NULL DEFAULT 'employee',
    PRIMARY KEY(id)
);

INSERT INTO employees(first_name,last_name,email,city,age,current_status)
VALUES('john','doe','john@gmail.com','boston',33,'web developer'),
('william','smith','william@gmail.com','new york',34,'web desinger'),
('ashly','kate','ashly@gmail.com','sanfrico',23,'full stack developer');

SELECT id FROM employees;
SELECT first_name,city FROM employees WHERE age=23;
SELECT id As employees_id,current_status As their_condention FROM employees;
UPDATE employees SET city='yangon' WHERE first_name='kyaw';
DELETE FROM employees WHERE city='yangon';

CREATE TABLE instructors(
    id INT NOT NULL AUTO_INCREMENT,
    first_name VARCHAR(100) NOT NULL,
    middle_name VARCHAR(100),
    last_name VARCHAR(100) NOT NULL,
    full_name VARCHAR(100) NOT NULL,
    total_couse INT,
    age INT,
    address VARCHAR(50),
    email_address VARCHAR(50),
    social_links VARCHAR(200),
    category VARCHAR(100),
    enrolled_course INT,
    PRIMARY KEY(id)
);

INSERT INTO instructors(first_name,last_name,full_name,
total_couse,age,address,email_address,social_links,
category,enrolled_course) VALUES
('Angela','Yu','Angela Yu',10,30,'london Ma','angela@gmail.com','www.twitter.com/@angelayu22','web developement',3456),
('Brad','Traversy','Brad Traversy',13,32,'Boston NA','brad@gmail.com','www.twitter.com/@brad','node js',28282),
('Max','Schx','Max Schx',15,33,'New Your AK','nax@gmail.com','www.twitter.com/@max','database',262892);
