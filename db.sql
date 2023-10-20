#harshita

create database dbsproject;
use dbsproject;

create table Customer(CustomerID int not null,
FName varchar(10) not null,
LName varchar (10),
Email varchar(30) not null,
Phone bigint not null,
Password varchar(10) not null,
primary key(CustomerID));
desc Customer;
insert into Customer values(1,"sarah","singh","sarah00@gmail.com",9876543210,"test1");
insert into Customer values(2,"priya","mehra","mehra.priya@gmail.com",9988776655,"test2");
insert into Customer values(3,"neil","kapoor","neil@gmail.com",7654376543,"test3");
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

#ritunjaya

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    RestaurantID INT,
    AddressID INT,
    OrderDate DATETIME,
    OrderStatus VARCHAR(20),
    PaymentID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (RestaurantID) REFERENCES Restaurants(RestaurantID),
    FOREIGN KEY (AddressID) REFERENCES Address(AddressID),
    FOREIGN KEY (PaymentID) REFERENCES Payments(PaymentID)
);


CREATE TABLE Cart (
    CartItemID INT PRIMARY KEY,
    ItemID INT,
    Quantity INT,
    FOREIGN KEY (ItemID) REFERENCES MenuItem(ItemID)
);

CREATE TABLE Payments (
    PaymentID INT PRIMARY KEY,
    PaymentType VARCHAR(20)
);

CREATE TABLE Feedback (
    FeedbackID INT PRIMARY KEY,
    OrderID INT,VARCHAR(30),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

#anjasha

-- Create MenuCategories table
CREATE TABLE MenuCategories (
    CategoryID INT PRIMARY KEY,
    Name VARCHAR(255)
);

-- Create MenuItems1 table
CREATE TABLE MenuItems1 (
    ItemID INT PRIMARY KEY,
    CategoryID INT,
    Name VARCHAR(255),
    Price DECIMAL(10, 2),
    Description TEXT,
    FOREIGN KEY (CategoryID) REFERENCES MenuCategories(CategoryID)
);

-- Create MenuItems2 table
CREATE TABLE MenuItems2 (
    ItemID INT PRIMARY KEY,
    CategoryID INT,
    Name VARCHAR(255),
    Price DECIMAL(10, 2),
    Description TEXT,
    FOREIGN KEY (CategoryID) REFERENCES MenuCategories(CategoryID)
);

-- Create MenuItems3 table
CREATE TABLE MenuItems3 (
    ItemID INT PRIMARY KEY,
    CategoryID INT,
    Name VARCHAR(255),
    Price DECIMAL(10, 2),
    Description TEXT,
    FOREIGN KEY (CategoryID) REFERENCES MenuCategories(CategoryID)
);

INSERT INTO MenuCategories (CategoryID, Name)
VALUES
(1, 'Appetizers'),
(2, 'Main Courses'),
(3, 'Desserts'),
(4, 'Beverages'),
(5, 'Specials');


INSERT INTO MenuItems1 (ItemID, CategoryID, Name, Price, Description)
VALUES
(1, 1, 'Mozzarella Sticks', 8.99, 'Deep-fried mozzarella sticks with marinara sauce.'),
(2, 2, 'Chicken Alfredo', 14.99, 'Creamy Alfredo sauce with grilled chicken and fettuccine.'),
(3, 3, 'Chocolate Cake', 6.99, 'Decadent chocolate cake with a rich chocolate ganache.'),
(4, 4, 'Soda', 1.99, 'Choice of various soft drinks.'),
(5, 1, 'Onion Rings', 7.99, 'Crispy battered onion rings served with dipping sauce.');


INSERT INTO MenuItems2 (ItemID, CategoryID, Name, Price, Description)
VALUES
(6, 1, 'Buffalo Wings', 10.99, 'Spicy buffalo wings with celery and blue cheese.'),
(7, 2, 'Steak Fajitas', 18.99, 'Grilled steak with peppers, onions, and tortillas.'),
(8, 3, 'Cheesecake', 7.99, 'Classic New York-style cheesecake with fruit topping.'),
(9, 4, 'Iced Tea', 1.49, 'Refreshing iced tea with lemon slices.'),
(10, 1, 'Bruschetta', 9.99, 'Toasted bread topped with diced tomatoes and basil.');


INSERT INTO MenuItems3 (ItemID, CategoryID, Name, Price, Description)
VALUES
(11, 1, 'Spinach Dip', 8.49, 'Creamy spinach and artichoke dip with tortilla chips.'),
(12, 2, 'Salmon Teriyaki', 17.99, 'Grilled salmon with teriyaki glaze and steamed vegetables.'),
(13, 3, 'Tiramisu', 8.99, 'Classic Italian tiramisu dessert.'),
(14, 4, 'Lemonade', 1.99, 'Homemade lemonade with fresh lemons.'),
(15, 1, 'Fried Calamari', 11.99, 'Crispy fried calamari served with marinara sauce.');




