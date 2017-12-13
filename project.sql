  ---------------------------------------------
-- TABLE - PERSON
----------------------------------------------

  
  DROP TABLE IF EXISTS person;
  
  CREATE TABLE IF NOT EXISTS person (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT NOT NULL,
  age INTEGER NOT NULL,
  height INTEGER NOT NULL,
  city TEXT NOT NULL,
  fav_color TEXT);
  
  INSERT INTO person
  (name, age, height, city, fav_color)
  VALUES
  ('Beyonce', 18, 165, 'Jersey City', 'blue'),
  ('Eminem',45, 187, 'Detroit','red'),
  ('Einstein', 112, 160, 'Hamburg','white'),
  ('Mirzakhani', 34, 170, 'Tehran', 'black'),
  ('Jill Stein', 70, 168, 'Sacramento', 'green');
  
  SELECT * FROM person
  ORDER BY height DESC;
  
  SELECT * FROM person
  ORDER BY height ASC;
  
  SELECT * FROM person
  ORDER BY age DESC;
  
  SELECT * FROM person
  WHERE age>20;
  SELECT * FROM person
  WHERE age = 18;
SELECT * FROM person
  WHERE age<20 OR age>30;
  SELECT * FROM person
  WHERE age != 27;

SELECT * FROM person
  WHERE fav_color != 'red';
  SELECT * FROM person
  WHERE fav_color NOT IN ('red','blue');
  SELECT * FROM person
  WHERE fav_color IN ('red','blue');
  SELECT * FROM person
  WHERE fav_color IN ('red','blue', 'orange');
  SELECT * FROM person
  WHERE fav_color IN ('yellow','purple');

---------------------------------------------
-- TABLE - ORDERS
----------------------------------------------

DROP TABLE IF EXISTS orders;
CREATE TABLE IF NOT EXISTS orders (
  person_id INTEGER NOT NULL,
  product_name TEXT NOT NULL,
  product_price DECIMAL CHECK (product_price>0),
  quantity INTEGER CHECK (quantity>=0));

INSERT INTO orders
(person_id, product_name, product_price, quantity)
VALUES
(1, 'legos', 30, 9),
(2, 'cars',30000, 100000000),
(1, 'dolls', 20, 2),
(5, 'fingerlings', 99, 0),
(5, 'trees', 1, 99);

SELECT * FROM orders;
SELECT SUM(quantity) FROM orders;
SELECT SUM(product_price*quantity) FROM orders;
SELECT SUM(product_price*quantity) FROM orders
WHERE person_id IS 5;

---------------------------------------------
-- TABLE - ARTIST
----------------------------------------------

INSERT INTO Artist
(Name)
VALUES
('Beyonce'),
('Eminem'),
('Esperanza Spalding');
SELECT * FROM Artist
ORDER BY Name DESC LIMIT 10;
SELECT * FROM Artist
ORDER BY Name ASC LIMIT 5;
SELECT * FROM Artist
WHERE Name LIKE 'Black%';
SELECT * FROM Artist
WHERE Name LIKE '%Black%';

---------------------------------------------
-- TABLE - EMPOYEE
----------------------------------------------

SELECT FirstName, LastName FROM Employee
WHERE city IS 'Calgary';

SELECT FirstName, LastName, BirthDate FROM Employee
ORDER BY BirthDate DESC LIMIT 1;

SELECT FirstName, LastName, BirthDate FROM Employee
ORDER BY BirthDate ASC LIMIT 1;

SELECT * FROM Employee
WHERE ReportsTo IS 
(SELECT EmployeeId FROM Employee
 WHERE Firstname IS 'Nancy' AND LastName IS 'Edwards') ;

SELECT COUNT(*) FROM Employee WHERE City IS 'Lethbridge';

---------------------------------------------
-- TABLE - INVOICE
----------------------------------------------

SELECT COUNT(*) FROM Invoice WHERE BillingCountry IS 'USA';

SELECT Total FROM Invoice
ORDER BY Total DESC LIMIT 1;
SELECT Total FROM Invoice
ORDER BY Total ASC LIMIT 1;

SELECT * FROM Invoice WHERE Total>5;

SELECT COUNT(*) FROM Invoice WHERE total<5;

SELECT COUNT(*) FROM Invoice 
WHERE BillingState IN ('CA', 'TX', 'AZ');

SELECT AVG(Total) FROM Invoice;

SELECT SUM(Total) FROM Invoice;