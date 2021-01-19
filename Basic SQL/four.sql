CREATE DATABASE db_shirts;

CREATE TABLE shirts(shirt_id 
INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
article VARCHAR(255),color VARCHAR(255),
shirt_size VARCHAR(255),last_worn INT
);

INSERT INTO shirts(article,color,shirt_size,last_worn)VALUES
('t-shirt', 'white', 'S', 10),
('t-shirt', 'green', 'S', 200),
('polo shirt', 'black', 'M', 10),
('tank top', 'blue', 'S', 50),
('t-shirt', 'pink', 'S', 0),
('polo shirt', 'red', 'M', 5),
('tank top', 'white', 'S', 200),
('tank top', 'blue', 'M', 15);

SELECT * FROM shirts WHERE shirt_size='M';

SELECT article,color,shirt_size,last_worn 
WHERE shirt_size='M';

SELECT * FROM shirts WHERE article='polo shirt';

UPDATE shirts SET shirt_size='L' WHERE shirt_size='M';

SELECT * FROM shirts WHERE last_worn=15;

UPDATE shirts SET last_worn=22222 where last_worn=15;

SELECT * FROM shirts WHERE color='white';

UPDATE shirts SET color='off white',shirt_size='XS' WHERE color='white';

DELETE FROM shirts WHERE shirt_size='XS';

DELETE FROM shirts;


----------------------------------------- SQL STRINGS FUNCTION ---------------------------------

SELECT CONCAT('HELLO',' #$WORLD');

SELECT CONCAT('Hello','....','World');



-----------------------------------------------------------------------------------------------
CREATE DATABASE author;

use author;

CREATE TABLE books 
	(
		book_id INT NOT NULL AUTO_INCREMENT,
		title VARCHAR(100),
		author_fname VARCHAR(100),
		author_lname VARCHAR(100),
		released_year INT,
		stock_quantity INT,
		pages INT,
		PRIMARY KEY(book_id)
	);
 
INSERT INTO books (title, author_fname, author_lname, released_year, stock_quantity, pages)
VALUES
('The Namesake', 'Jhumpa', 'Lahiri', 2003, 32, 291),
('Norse Mythology', 'Neil', 'Gaiman',2016, 43, 304),
('American Gods', 'Neil', 'Gaiman', 2001, 12, 465),
('Interpreter of Maladies', 'Jhumpa', 'Lahiri', 1996, 97, 198),
('A Hologram for the King: A Novel', 'Dave', 'Eggers', 2012, 154, 352),
('The Circle', 'Dave', 'Eggers', 2013, 26, 504),
('The Amazing Adventures of Kavalier & Clay', 'Michael', 'Chabon', 2000, 68, 634),
('Just Kids', 'Patti', 'Smith', 2010, 55, 304),
('A Heartbreaking Work of Staggering Genius', 'Dave', 'Eggers', 2001, 104, 437),
('Coraline', 'Neil', 'Gaiman', 2003, 100, 208),
('What We Talk About When We Talk About Love: Stories', 'Raymond', 'Carver', 1981, 23, 176),
("Where I'm Calling From: Selected Stories", 'Raymond', 'Carver', 1989, 12, 526),
('White Noise', 'Don', 'DeLillo', 1985, 49, 320),
('Cannery Row', 'John', 'Steinbeck', 1945, 95, 181),
('Oblivion: Stories', 'David', 'Foster Wallace', 2004, 172, 329),
('Consider the Lobster', 'David', 'Foster Wallace', 2005, 92, 343);

SELECT CONCAT
(author_fname,' ',author_lname) FROM books;

SELECT CONCAT
(author_fname,' ',author_lname) As 'full name' FROM book;

SELECT author_fname As 'first',
author_lname As 'last',CONCAT(author_fname,' ',author_lname)
AS 'full name' FROM books;

SELECT CONCAT_WS('-',author_fname,author_lname,title) 
FROM book;

SELECT SUBSTRING('hello world',1,4);

SELECT SUBSTRING('goodbye world',8);

SELECT SUBSTRING('NICE TO MEET YOU',-5);

SELECT SUBSTRING(title,1,10) As 'sub' FROM books;

-------SUBSTR ALSO WORK JUST LIKE SUBSTRING-----
SELECT CONCAT(
    SUBSTR(title,1,13),
    '....'
) As 'short title' FROM books;


SELECT REPLACE('hello world','hello','goodbye');

SELECT REPLACE('goodbye world',' ',' and ');

SELECT REPLACE(title,'e','@#$') As 'book_title' FROM books;

SELECT SUBSTR(REPLACE(title,'e','@#$'),1,14) AS 'book_title' FROM books;

SELECT REVERSE('hello world');

SELECT REVERSE(author_fname) As 'first' FROM books;

SELECT CONCAT('william ',REVERSE('smith'));

SELECT CONCAT(author_fname,REVERSE(author_lname)) FROM books;

SELECT CHAR_LENGTH('hello world');

SELECT author_fname,CHAR_LENGTH(author_fname) As 'length' FROM books;

SELECT CONCAT(author_fname, ' is ',CHAR_LENGTH(author_fname),' characters long' )
FROM books;

SELECT UPPER('Hello World');

SELECT LOWER('Hello WORLD');

SELECT UPPER(title) FROM books;

SELECT CONCAT('MY FAVORITE BOOK IS ',UPPER(title)) FROM books;

SELECT UPPER(CONCAT(author_fname, '.....',author_lname)) FROM books;

SELECT REVERSE(UPPER('why I very love php,javascript,sql and python'));

SELECT REPLACE(CONCAT
('I', ' ',' like',' ',' you'),' ','-'
);

SELECT REPLACE(title,' ','->') FROM books;

SELECT author_fname As 'forward',
REVERSE(author_lname) As 'backward' FROM books;

SELECT CONCAT(UPPER(author_fname),'...',REVERSE( author_lname)) FROM books;

SELECT CONCAT(title,' was released in ',released_year ) FROM books;

SELECT title,CHAR_LENGTH(title) As 'length' FROM books;

SELECT
       CONCAT(SUBSTR(title,1,13),'.....') As 'short title',
       CONCAT(author_fname,'.....',author_lname) As 'FULL NAME',
       CONCAT(stock_quantity,' in stock') As 'qunatity'
FROM books;

INSERT INTO books (title, author_fname, author_lname, released_year, stock_quantity, pages)
  VALUES ('10% Happier', 'Dan', 'Harris', 2014, 29, 256),
  ('fake_book', 'Freida', 'Harris', 2001, 287, 428),
  ('Lincoln In The Bardo', 'George', 'Saunders', 2017, 1000, 367);

SELECT DISTINCT author_fname FROM books;

SELECT DISTINCT CONCAT(author_fname,' ',author_lname) FROM books;

SELECT author_fname FROM books ORDER BY author_fname;

SELECT author_fname FROM books ORDER BY author_fname DESC;

SELECT author_fname FROM books ORDER BY author_fname ASC;

SELECT author_fname,author_lname,title FROM books ORDER BY 2;

SELECT author_fname,author_lname FROM books ORDER BY author_lname,author_fname;

SELECT title FROM books LIMIT 3;

SELECT title,released_year FROM books ORDER BY released_year DESC LIMIT 5;

SELECT title,released_year FROM books ORDER BY released_year DESC LIMIT 0,5;

SELECT title FROM books LIMIT 5,1899923355;

SELECT title,author_fname FROM books WHERE author_fname LIKE '%da%';

---I WANT START WITH ////Da
SELECT title,author_fname FROM books WHERE author_fname LIKE 'da%';

SELECT title FROM books WHERE title LIKE '%the';

SELECT title FROM books WHERE title LIKE '%the%';

SELECT title,stock_quantity FROM books WHERE stock_quantity LIKE '____';

SELECT title FROM books WHERE title LIKE '%\%%';

SELECT title FROM books WHERE title LIKE '%\_%';

SELECT title FROM books WHERE title LIKE '%stories';

SELECT title,pages  FROM books ORDER BY pages DESC LIMIT 1;

SELECT CONCAT(title,' - ',released_year) FROM books ORDER BY released_year DESC LIMIT 3;

SELECT title,author_lname FROM books WHERE author_lname LIKE '% %';

SELECT title,released_year,stock_quantity FROM books ORDER BY stock_quantity LIMIT 3;

SELECT title,author_lname FROM books ORDER BY author_lname,title;

SELECT 
  CONCAT(
    'MY FAVORITE AUTHOR IS ', 
    UPPER(author_fname), 
    ' ', 
    UPPER(author_lname), 
    '!'
  ) As Yell 
FROM 
  books ORDER BY author_lname;

