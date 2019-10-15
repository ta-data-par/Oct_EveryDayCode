
create table sales_person( 
sales_person char(15),
name varchar(100),
store varchar(150)
);

create table cars( 
vin char(17),
manufacturer varchar(20),
model varchar(20),
year int,
color varchar(20)
);

create table customers( 
customer_id char(10),
name varchar(30),
phone_nb char(10),
email varchar(256),
adress varchar(256),
city varchar(100),
state_prov varchar(100),
country varchar(100),
zip char(5)
);

create table invoices( 
invoice_nb int,
date date),
car_id char(17),
customer_id char(10),
sales_person char(15)
);
