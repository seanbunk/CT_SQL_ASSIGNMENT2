-- Creating Customer table
create table customers_sean(
	customer_id SERIAL primary key,
	first_name VARCHAR(150),
	last_name VARCHAR(150),
	address VARCHAR(150),
	contact_num VARCHAR(15)
);
select * from customers_sean;

-- Creating tickets table
create table tickets_sean(
	ticket_id SERIAL primary key,
	customer_id	INTEGER not null,
	seat_id INTEGER not null,
	foreign key(customer_id) references customers_sean(customer_id)
);
select * from tickets_sean;

-- Creating movies table
create table movies_sean(
	movie_id SERIAL primary key,
	movie_title VARCHAR(150),
	ticket_id INTEGER,
	foreign key(ticket_id) references tickets_sean(ticket_id)
);
select * from movies_sean;

-- Creating concessions table
create table concessions_sean(
	order_id SERIAL primary key,
	item_name VARCHAR(150),
	customer_id INTEGER,
	foreign key(customer_id) references customers_sean(customer_id)
);

-- Alter table insert column total_cost
alter table concessions_sean 
add total_cost numeric (5,2);
select * from concessions_sean;


-- Inserting Values inot customers table
insert into customers_sean 
values
(1, 'Nacho', 'Libre', '2439 Cat litter dr', '707-707-0707'),
(2, 'Zorro', 'Mask', '1234 Musashi Ln', '123-123-1234'),
(3, 'Yayo', 'MacDre', '707 LOL Bay Area', '987-654-3210');
select * from customers_sean;


-- Inserting values into movies table
insert into movies_sean values
(50, 'Tropic Thunder', 1),
(51, 'Pineapple Express',2),
(52, 'The Interview', 3);

--updating movie title 50
update movies_sean 
set movie_title = 'This Is The End'
where ticket_id = 1;

select * from movies_sean;

-- Inserting values into concessions table
insert into concessions_sean values
(101, ('popcorn, pepsi,hot-dog'), 2), 
(102, 'Sour Patch gummies', 1);

-- Updating new column total_cost with new values
update concessions_sean
set total_cost =  4.99
where order_id = 102;

update concessions_sean
set total_cost = 999.99
where order_id = 101;

select * from concessions_sean;

-- updating customer order
update concessions_sean 
set item_name = 'Sour gummy worms'
where order_id = 102;

select * from concessions_sean;


-- to drop table if needed
drop table if exists  cascade;
