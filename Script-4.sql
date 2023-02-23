CREATE TABLE customer(
	customer_id SERIAL PRIMARY KEY,
	first_name VARCHAR(45),
	last_name VARCHAR(45),
	address VARCHAR(255),
	billing_info VARCHAR(255) NOT NULL
);
INSERT INTO customer(
	customer_id,
	first_name,
	last_name,
	address,
	billing_info 
)Values(
	1,
	'leandro',
	'gonzalez',
	'123 main st sunshine state',
	'1234-1234-1234-1234'
);

INSERT INTO customer(
	customer_id,
	first_name,
	last_name,
	address,
	billing_info 
)Values(
	0,
	'Derrick',
	'Rose',
	'123 main st chicago Il',
	'1234-1234-1234-1234'
);

CREATE TABLE tickets(
	ticket_id SERIAL PRIMARY KEY,
	customer_id INTEGER NOT NULL,
	FOREIGN KEY(customer_id) REFERENCES customer(customer_id)
);
 INSERT INTO tickets(
	ticket_id,
	customer_id
 )VAlues(
 	20,
 	1
);
 INSERT INTO tickets(
	ticket_id,
	customer_id
 )VAlues(
 	100,
 	0
);



CREATE TABLE concession_products(
	concession_product_id SERIAL PRIMARY KEY,
	concession_inventory integer NOT NULL,
	concession_product_prices float NOT null
);
INSERT INTO concession_products(
	concession_product_id,
	concession_inventory,
	concession_product_prices
)values(
	1,
	100,
	7.99
);
INSERT INTO concession_products(
	concession_product_id,
	concession_inventory,
	concession_product_prices
)values(
	2,
	20,
	12.99
);



CREATE TABLE concession_purchases(
	concession_purchases_id SERIAL PRIMARY KEY,
	customer_id INTEGER NOT NULL,
	FOREIGN KEY(customer_id) REFERENCES customer(customer_id)
);
INSERT INTO concession_purchases(
	concession_purchases_id,
	customer_id
)VALUES(
	0,
	1
);
INSERT INTO concession_purchases(
	concession_purchases_id,
	customer_id
)VALUES(
	1,
	0
);

DROP TABLE IF EXISTS movies;
CREATE TABLE movies(
	movie_id serial PRIMARY KEY,
	movie_inventory integer NOT NULL,
	ticket_id integer NOT NULL,
	FOREIGN KEY(ticket_id) REFERENCES tickets(ticket_id),
	theater_id integer NOT NULL,
	FOREIGN KEY(theater_id) REFERENCES theaters(theater_id)
);
INSERT INTO movies(
	movie_id,
	movie_inventory,
	ticket_id,
	theater_id
)Values(
	21,
	1,
	20,
	10
);
INSERT INTO movies(
	movie_id,
	movie_inventory,
	ticket_id,
	theater_id
)Values(
	22,
	10,
	100,
	11
);


DROP TABLE IF EXISTS theaters CASCADE;
CREATE TABLE theaters(
	theater_id SERIAL PRIMARY KEY,
	movie_id integer NOT NULL,
	FOREIGN KEY(movie_id) REFERENCES movies(movie_id)
);
INSERT INTO theaters(
	theater_id,
	movie_id
)values(
	10,
	21
);
INSERT INTO theaters(
	theater_id,
	movie_id
)values(
	11,
	22
);


