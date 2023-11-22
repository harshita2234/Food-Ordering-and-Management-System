create table Customer(CustomerID int not null,
FName varchar(10) not null,
LName varchar (10),
Email varchar(30) not null,
Phone bigint not null,
Password varchar(10) not null,
primary key(CustomerID));

insert into Customer values(1,"sarah","singh","sarah00@gmail.com",9876543210,"test1");
insert into Customer values(2,"priya","mehra","mehra.priya@gmail.com",9988776655,"test2");
insert into Customer values(3,"neil","kapoor","neil@gmail.com",7654376543,"test3");

create table Address(AddressID int not null,
CustomerID int not null,
FullAddress varchar(50) not null,
City varchar(20) not null,
State varchar(20) not null,
PinCode mediumint not null,
primary key(AddressID),
foreign key(CustomerID) references Customer(CustomerID));

insert into Address values(109, 1, "A1000 Mandavi Pearl City", "Manipal", "Karnataka", 576104);
insert into Address values(110, 3, "E034 Shambhavi Palace", "Manipal", "Karnataka", 576104);
insert into Address values(111, 2, "Block C2031 NIH", "Manipal", "Karnataka", 576104);

create table Restaurants(RestaurantID int not null,
Name varchar(20) not null,
FullAddress varchar(50) not null,
Phone bigint not null,
OpeningHours time not null,
primary key(RestaurantID));

insert into Restaurants values(501,"The Mill","Near Masjid, Saralabettu, Manipal, 576104",7890789000,"11:00:00");
insert into Restaurants values(502,"Subway","KMC Food Court, Eshwar Nagar, Manipal, 576104",5432543211,"10:00:00");
insert into Restaurants values(503,"Vito's","Eshwar Nagar, Manipal, Karnataka 576104",8123456789,"12:00:00");

CREATE TABLE Payments (
    PaymentID INT PRIMARY KEY,
    PaymentType VARCHAR(20)
);

CREATE TABLE MenuCategories (
    CategoryID INT PRIMARY KEY,
    Name VARCHAR(255)
);

INSERT INTO MenuCategories (CategoryID, Name)
VALUES
(1, 'Appetizers'),
(2, 'Main Courses'),
(3, 'Desserts'),
(4, 'Beverages'),
(5, 'Specials');

CREATE TABLE MenuItems (
    ItemID INT PRIMARY KEY,
    RestaurantID INT,
    CategoryID INT,
    Name VARCHAR(255),
    Price DECIMAL(10, 2),
    Description TEXT,
    FOREIGN KEY (CategoryID) REFERENCES MenuCategories(CategoryID),
    FOREIGN KEY (RestaurantID) REFERENCES Restaurants(RestaurantID)
);

INSERT INTO MenuItems (ItemID, RestaurantID, CategoryID, Name, Price, Description)
VALUES
(1,501, 1, 'Mozzarella Sticks', 8.99, 'Deep-fried mozzarella sticks with marinara sauce.'),
(2,501, 2, 'Chicken Alfredo', 14.99, 'Creamy Alfredo sauce with grilled chicken and fettuccine.'),
(3,501, 3, 'Chocolate Cake', 6.99, 'Decadent chocolate cake with a rich chocolate ganache.'),
(4,501, 4, 'Soda', 1.99, 'Choice of various soft drinks.'),
(5,501, 1, 'Onion Rings', 7.99, 'Crispy battered onion rings served with dipping sauce.'),
(6,502, 1, 'Buffalo Wings', 10.99, 'Spicy buffalo wings with celery and blue cheese.'),
(7,502, 2, 'Steak Fajitas', 18.99, 'Grilled steak with peppers, onions, and tortillas.'),
(8,502, 3, 'Cheesecake', 7.99, 'Classic New York-style cheesecake with fruit topping.'),
(9,502, 4, 'Iced Tea', 1.49, 'Refreshing iced tea with lemon slices.'),
(10,502, 1, 'Bruschetta', 9.99, 'Toasted bread topped with diced tomatoes and basil.'),
(11,503, 1, 'Spinach Dip', 8.49, 'Creamy spinach and artichoke dip with tortilla chips.'),
(12,503, 2, 'Salmon Teriyaki', 17.99, 'Grilled salmon with teriyaki glaze and steamed vegetables.'),
(13,503, 3, 'Tiramisu', 8.99, 'Classic Italian tiramisu dessert.'),
(14,503, 4, 'Lemonade', 1.99, 'Homemade lemonade with fresh lemons.'),
(15,503, 1, 'Fried Calamari', 11.99, 'Crispy fried calamari served with marinara sauce.');

CREATE TABLE Cart (
    CartItemID INT PRIMARY KEY,
    ItemID INT,
    Quantity INT,
    FOREIGN KEY (ItemID) REFERENCES MenuItems(ItemID)
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    RestaurantID INT,
    AddressID INT,
    OrderDate DATETIME,
    OrderStatus VARCHAR(20),
    PaymentID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    FOREIGN KEY (RestaurantID) REFERENCES Restaurants(RestaurantID),
    FOREIGN KEY (AddressID) REFERENCES Address(AddressID),
    FOREIGN KEY (PaymentID) REFERENCES Payments(PaymentID)
);

CREATE TABLE Feedback (
    FeedbackID INT PRIMARY KEY,
    OrderID INT,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);







#some more info to be added for demo
insert into payments values (1, 'UPI'),(2, 'Credit Card');

insert into orders values (1, 1, 501, 109, '2023-11-22 10:10:10', 'Delivered', 1),(2, 1, 502, 109, '2023-11-23 11:00:12', 'Delivered', 2);

