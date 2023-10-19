create database dbsproject;
use dbsproject;

create table Customer(CustomerID int not null,
FName varchar(10) not null,
LName varchar (10),
Email varchar(30) not null,
Phone bigint not null,
primary key(CustomerID));
desc Customer;
insert into Customer values(1,"sarah","singh","sarah00@gmail.com",9876543210);
insert into Customer values(2,"priya","mehra","mehra.priya@gmail.com",9988776655);
insert into Customer values(3,"neil","kapoor","neil@gmail.com",7654376543);
select * from Customer;
#drop table Customer;

#only one address per customer
create table Address(AddressID int not null,
CustomerID int not null,
FullAddress varchar(50) not null,
City varchar(20) not null,
State varchar(20) not null,
PinCode mediumint not null,
primary key(AddressID),
foreign key(CustomerID) references Customer(CustomerID));
desc Address;
insert into Address values(109, 1, "A1000 Mandavi Pearl City", "Manipal", "Karnataka", 576104);
insert into Address values(110, 3, "E034 Shambhavi Palace", "Manipal", "Karnataka", 576104);
insert into Address values(111, 2, "Block C2031 NIH", "Manipal", "Karnataka", 576104);
select * from Address;
drop table Address;

#only 3 restaurants in the database for which individual menus will be made
create table Restaurants(RestaurantID int not null,
Name varchar(20) not null,
FullAddress varchar(50) not null,
Phone bigint not null,
OpeningHours time not null,
primary key(RestaurantID));
desc Restaurants;
insert into Restaurants values(501,"The Mill","Near Masjid, Saralabettu, Manipal, 576104",7890789000,"11:00:00");
insert into Restaurants values(502,"Subway","KMC Food Court, Eshwar Nagar, Manipal, 576104",5432543211,"10:00:00");
insert into Restaurants values(503,"Vito's","Eshwar Nagar, Manipal, Karnataka 576104",8123456789,"12:00:00");
select * from Restaurants;

alter table Customer
add unique(Email);

create table Login(LoginID int not null,
Email varchar(30) not null,
Password varchar(10) not null,
primary key(LoginID),
foreign key(Email) references Customer(Email));
desc Login;
insert into Login values(1,"sarah00@gmail.com","test1");
insert into Login values(2,"mehra.priya@gmail.com","test2");
insert into Login values(3,"neil@gmail.com","test3");
select * from Login;
