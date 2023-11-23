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
(1,501, 1, 'French Fries', 70, 'Deep-fried potatoes sticks with cheese sauce.'),
(2,501, 2, 'Coffee', 99, 'A double shot of espresso with steamed milk and a small layer of foam.'),
(3,501, 3, 'Salad', 120, 'Seasonal salads made fresh daily for a quick and healthy lunch.'),
(4,501, 4, 'Burger', 100, 'Juicy, big, loaded with toppings of your choice.'),
(5,501, 1, 'Thali', 100, 'rice, dal, vegetables, roti, papad, dahi (yoghurt), small amounts of chutney or pickle, and a sweet dish.'),
(6,502, 1, 'Pizza', 120, 'A classic Italian pizza with fresh mozzarella, basil and tomato sauce.'),
(7,502, 2, 'Coffee', 100, 'A double shot of espresso with steamed milk, a small layer of foam and a special sweetened coffee flavoured syrup.'),
(8,502, 3, 'Salad', 200, 'A refreshing salad with crispy romaine lettuce, grated Parmesan cheese, and our signature Caesar dressing.'),
(9,502, 4, 'ChocoChip Cookies', 99, 'Indulge in a timeless treat that has delighted generations – our irresistible Classic Chocolate Chip Cookies.'),
(10,502, 1, 'Grilled Cheese', 90, 'A timeless classic that never disappoints.'),
(11,503, 1, 'Sub', 220, 'Sink your teeth into a symphony of flavours and textures with this meatball marinara sub.'),
(12,503, 2, 'Pasta', 150, 'A creamy tomato sauce with vodka added for a subtle sweetness and a kick of alcohol.'),
(13,503, 3, 'French Fries', 100, 'A timeless favourite, these slender, crispy fries are made with perfectly seasoned potatoes, cut into thin strips, and fried to golden perfection.'),
(14,503, 4, 'Pizza', 210, 'A controversial yet beloved pizza, this combination features sweet pineapple chunks nestled among savory ham slices and a bed of melted mozzarella cheese.'),
(15,503, 1, 'Salad', 150, 'A hearty salad with grilled chicken, bacon, avocado, blue cheese, and hard-boiled eggs, all tossed in our signature Cobb dressing.'),
(16,503, 2, 'Burger', 190, 'A bite-sized indulgence, these mini burgers are perfect for parties, appetizers, or a quick snack.'),
(17,503, 3, 'Cafe Latte', 110, 'A single shot of espresso with a small layer of foam'),
(18,503, 4, 'Pasta', 140, 'A classic comfort food made with macaroni pasta, béchamel sauce, and cheese.');

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

