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

--UC4 - Edit existing contact person using name
update AddressBook_Table set City = 'Beed' where FirstName = 'gouri' and LastName = 'shete';
update AddressBook_Table set State = 'Goa' where FirstName = 'Pooja' and LastName = 'hudge';
select * from AddressBook_Table;

--UC5 - Delete existing contact person using name.
delete from AddressBook_Table where FirstName = 'Pooja' and LastName = 'hudge';
select * from AddressBook_Table;

--UC6 - Retrieve person belonging to a city or state from AddressBook.
select * from AddressBook_Table where City = 'Latur' or State = 'Maharashtra';

--UC7 - Size of AddressBook by city and state 
select COUNT(*) as StateCount, State from AddressBook_Table group by State;
select COUNT(*) as CityCount, City from AddressBook_Table group by City;

--UC8 - Get Sorted entries alphabeticaly by person's name for a given city.
select * from AddressBook_Table where City = 'Latur' order by FirstName,LastName;

--UC9 - Adding Address Book With Name and Type.
alter table AddressBook_Table add AddressBookName varchar(50),AddressBookType varchar(50);
select * from AddressBook_Table;
--update values for created book name and book type column
update AddressBook_Table set AddressBookName = 'family address book', AddressBookType = 'Family' where FirstName = 'Pratiksha';
update AddressBook_Table set AddressBookName = 'friends address book', AddressBookType = 'Friends' where FirstName = 'Priya';
update AddressBook_Table set AddressBookName = 'profession address book', AddressBookType = 'Profession' where FirstName = 'gouri';

--UC10 - Get number of contact persons i,e count by type.
select count(AddressBookType) as 'NumberOfContacts' from AddressBook_Table where AddressBookType='Family';
select count(AddressBookType) as 'NumberOfContacts' from AddressBook_Table where AddressBookType='Friends';
select count(AddressBookType) as 'NumberOfContacts' from AddressBook_Table where AddressBookType='Profession';

--UC11-- Add person to friend and family
insert into AddressBook_Table(FirstName, LastName, Address, City, State, Zip, PhoneNumber, Email, AddressBookName, AddressBookType)
values
('Virat', 'Kohli', 'RCB', 'Bangalore', 'Karnataka', 560040, 1231231235, 'virat@gmail.com','friends address book', 'Friends'),
('Virat', 'Kohli', 'RCB', 'Bangalore', 'Karnataka', 560040, 1231231235, 'virat@gmail.com', 'family address book', 'Family');
select * from AddressBook_Table;

--UC12 - Creating different entities.
--creating table of typeofcontacts
create table TypesOfContacts
(
typeid int primary key ,
typename varchar(50) not null);
--inserting data into type of contacts
insert into Typesofcontacts
values
(1,'Family'),
(2,'Friends'),
(3,'Business');

alter table AddressBook_Table
add contactid int primary key identity(1,1);
select *from AddressBook_Table;

--Creating table of address book names
create table AddressBookNames
(addressBookId int primary key identity(1,1),
addressBookName varchar(50) not null );
--inserting values to addressbook table
insert into AddressBooknames values ('S'),('P'),('H');
select * from AddressBookNames;

--creating table address book names mapper which will contain contact id and address book names id
create table addressbookMapping
(contactid int not null, addressbookid int not null);
--inserting data into address book mapper id
insert into addressbookMapping values (1,1),(2,1),(3,2);
select * from addressbookMapping;

select a.firstname, a.phoneNumber, a.city, a.state, a.eMail, b.addressbookname, b.addressBookId
from AddressBook_Table a
join addressbookMapping d
on a.contactid = d.contactId
join AddressBookNames b
on b.addressBookId= d.addressbookId

--UC13 - Retrieving data using new table structure.
--For UC6
select FirstName,LastName,city from AddressBook_Table where FirstName='Virat';

--For UC7
select city,count(*) from AddressBook_Table where city='Latur' group by city;

--For UC8
select * from  AddressBook_Table where city='Latur' order by FirstName,LastName;

--For UC10
select typename,count(*) numberOfContactPersons from AddressBook_Table a
join addressbookMapping am
on am.contactid= a.contactid
join TypesOfContacts t
on t.typeid= am.addressbookid
group by t.typename;
select * from AddressBook_Table;