

--In this checkpoint, I practiced the acquired skills through a new example.
--Consider the following entity-relationship(conceptual) model:

--Wine (wine_number, category, year, degree)
--Producer(producer_number, first_name, last_name, region)
--Harvest(harvest_number, wine_number, producer_number, quantity)

--Checkpoint Objective
--1. Convert the given entity-relationship model into a relational model.

--2. Implement the relational model using SQL.

CREATE TABLE Wine (
	wine_number INT NOT NULL PRIMARY KEY,
	category VARCHAR(255) NOT NULL,
	year DATE NOT NULL,
    degree DECIMAL(10,2) NOT NULL
    );

CREATE TABLE Producer(
	producer_number INT NOT NULL PRIMARY KEY,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	region VARCHAR(20) NOT NULL
	);

CREATE TABLE Harvest (
 		harvest_number INT NOT NULL PRIMARY KEY,
		wine_number INT NOT NULL,
		producer_number INT NOT NULL,
		quantity BIGINT NOT NULL,
	FOREIGN KEY (wine_number) REFERENCES Wine(wine_number),
	FOREIGN KEY (producer_number) REFERENCES Producer(producer_number));


--3. Insert data into the database tables.
INSERT INTO Wine
VALUES (1, 'red', '2023-01-12', 7.55),
	(2, 'white', '2023-01-19', 10.50),
	(3, 'red', '2023-01-25', 25.00),
	(4, 'red', '2023-02-14', 50.00),
	(5, 'red', '2023-02-22', 15.50),
	(6, 'red', '2023-02-12', 12.50),
	(7, 'white', '2023-03-12', 14.00),
	(8, 'white', '2023-03-19', 13.00),
	(9, 'white', '2023-03-25', 30.55),
	(10, 'red', '2023-04-14', 15.65),
	(11, 'white', '2023-04-22', 12.00),
	(12, 'white', '2023-04-12', 7.50),
	(13, 'red', '2023-05-12', 7.50),
	(14, 'white', '2023-05-19', 12.00),
	(15, 'red', '2023-05-25', 15.00);

 
INSERT INTO  Producer
VALUES (1, 'john', 'wick', 'sousse'),
   	(2, 'leonardo', 'brown', 'spain'),
   	(3, 'gomez', 'donkey', 'rome'),
   	(4, 'billy', 'rapheal', 'sousse'),
   	(5, 'mark', 'gowon', 'romania'),
   	(6, 'pua', 'mickey', 'prague'),
   	(7, 'clock', 'wakua', 'silica'),
   	(8, 'cliff', 'antonio', 'spain'),
   	(9, 'maria', 'putin', 'italy'),
   	(10, 'john', 'paul', 'sousse'),
   	(11, 'paula', 'martinez', 'dutch'),
   	(12, 'patua', 'doohickey', 'sousse'),
   	(13, 'chris', 'quan', 'prague'),
   	(14, 'friday', 'gomez', 'rome'),
   	(15, 'james', 'donlop', 'silica'),
   	(16, 'bill', 'gates', 'sousse'),
   	(17, 'elon', 'musk', 'rome'),
   	(18, 'paul', 'doo', 'italy'),
   	(19, 'alex', 'hormozi', 'ontario'),
   	(20, 'tuesday', 'gadddi', 'prague'),
   	(21, 'guage', 'rickey', 'rome'),
   	(22, 'clock', 'washington', 'italy'),
   	(23, 'jon', 'bellion', 'rome'),
   	(24, 'Guage', 'doohickey', 'italy'),
   	(25, 'mazi', 'milk', 'calvi'),
   	(26, 'bella', 'ciao', 'sartene'),
   	(27, 'tokyo', 'vecchio', 'figari'),
   	(28, 'jura', 'cabardes', 'ajaccio'),
   	(29, 'fitou', 'monroe', 'parimonio'),
   	(30, 'anjou', 'mark', 'cognac');
 
INSERT INTO Harvest
VALUES (1, 1, 1, 400),
	(2, 15, 12, 500),
	(3, 2, 3, 300),
	(4, 12, 22, 700),
	(5, 3, 15, 250),
	(6, 3, 3, 150),
	(7, 7, 14, 450),
	(8, 13, 9, 600),
	(9, 2, 23, 800),
	(10, 12, 22, 770),
	(11, 6, 11, 290),
	(12, 8, 8, 550),
	(13, 10, 10, 440),
	(14, 5, 21, 900),
	(15, 4, 6, 300),
	(16, 9, 29, 700),
	(17, 11, 17, 950),
	(18, 3, 16, 350);


--4. Give the list the producers.
   	SELECT producer_number, first_name, last_name, region
   	FROM Producer;


--5. Give the list of producers sorted by name.
	SELECT producer_number, first_name, last_name, region
	FROM Producer
	ORDER BY first_name;


--6. Give the list the producers of Sousse.
  	SELECT producer_number, first_name, last_name, region
  	FROM Producer
  	WHERE region = 'sousse';


--7. Calculate the total quantity of wine produced having the number 12.
	SELECT Wine.wine_number, Harvest.quantity AS total_quantity
	FROM Wine
	JOIN Harvest
	ON Wine.wine_number = Harvest.harvest_number
	WHERE Wine.wine_number = 12;


--8. Calculate the quantity of wine produced by category.
	SELECT Wine.category, Harvest.quantity AS total_quantity
	FROM Wine
	JOIN Harvest
	ON Wine.wine_number = Harvest.harvest_number;


--9. Which producers in the Sousse region have harvested at least one wine in quantities greater than 300 liters?
   --We want the names and first names of the producers, sorted in alphabetical order.
	SELECT Producer.producer_number, Producer.first_name,Producer.last_name,Producer.region,Harvest.quantity
 	FROM Producer
    JOIN Harvest
   	ON Producer.producer_number = Harvest.harvest_number
  	WHERE Producer.region = 'sousse' AND  Harvest.quantity > 1
   	ORDER BY Producer.first_name, Producer.last_name ;
 
 
--10. List the wine numbers that have a degree greater than 12 and that have been produced by producer number 24.
	SELECT Wine.wine_number, Wine.degree, Producer.producer_number
  	FROM Wine
   	JOIN Producer
   	ON Producer.producer_number = Wine.wine_number
  	WHERE  Wine.degree > 12 AND Producer.producer_number = 24
   	ORDER BY Wine.wine_number;

