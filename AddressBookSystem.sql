--UC1 - Create AddressBook_Service Database.
create database AddressBook_Service;

--UC2 - Create AddressBook Table
create table AddressBook_Table(FirstName varchar(100),LastName varchar(100),Address varchar(100),City varchar(100),State varchar (100),Zip bigint,PhoneNumber bigint,Email varchar(100));
select * from AddressBook_Table;

--UC3 - Insert new contacts into Addressbook
insert into AddressBook_Table(FirstName, LastName, Address, City, State, Zip, PhoneNumber, Email)
values
('Pratiksha', 'bhange', 'shivaji nagar', 'Latur', 'Maharashtra', 413678, 8179713160, 'pratiksha@gmail.com'),
('Priya', 'pawar', 'shivaji chowk', 'mumbai', 'andhra', 748949, 8149703160, 'pri34@gmail.com'),
('Pooja', 'hudge', 'ashok hotel', 'udagir', 'rajshthan', 413562, 9149713160, 'phudge123@gmail.com'),
('gouri', 'shete', 'bashweshwar', 'bangalore', 'chennai', 587315, 9740049061, 'gourishete@gmail.com');

-- for Displaying adressbook
select * from AddressBook_Table;