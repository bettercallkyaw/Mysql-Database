INSERT INTO dogs(name,age) VALUES ('kaka',3);

SELECT * FROM dogs;

SHOW WARNING;

CREATE TABLE dogs1(
    name VARCHAR(20) NOT NULL,
    age INT NOT NULL 
);

CREATE TABLE dogs2(
    name VARCHAR(20) DEFAULT 'unamed',
    age INT DEFAULT 44
);

CREATE TABLE dogs3(
    name VARCHAR(20) NOT NULL DEFAULT 'no name provided',
    age INT NOT NULL DEFAULT 55
);