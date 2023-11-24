SET LINESIZE 150
SET PAGESIZE 200

DROP TABLE Invoice;
DROP TABLE Tariff;
DROP TABLE Elec_board;
DROP TABLE Electricity_Bill;
DROP TABLE Account;
DROP TABLE Customer;

create table Customer(
Cust_id number(10),
Cust_name varchar(20),
Address varchar(25),
City varchar(15),
Occupation varchar(25),
primary key(Cust_id)
);

create table Account(
Acc_id number(05),
Cust_id number(10),
Account_no number(10),
Name varchar(20),
primary key(Acc_id),
foreign key(Cust_id) references Customer
);

create table Electricity_Bill(
Meter_number number(10),
Acc_id number(05),
Cust_id number(10),
Monthly_unit float(10),
Per_unit float(10),
Amount float(10),
primary key(Meter_number),
foreign key(Cust_id) references Customer,
foreign key(Acc_id) references Account
);

create table Tariff (
Tariff_id number(05),
Tariff_type varchar(50) DEFAULT NULL,
PRIMARY KEY (Tariff_id)
);

create table Elec_board (
Eboard_id number(05),
Board_name varchar(50),
PRIMARY KEY (Eboard_id)
);

create table Invoice(
Invoice_id number(05),
Eboard_id number(05),
Tariff_id number(05),
Account_no number(10),
Meter_number number(10),
Reading_date  date,
primary key(Invoice_id),
foreign key(Eboard_id) references Elec_board,
foreign key(Tariff_id) references Tariff,
foreign key(Meter_number) references Electricity_Bill
);

-- Insert 6 values into the Customer table
INSERT INTO Customer (Cust_id, Cust_name, Address, City, Occupation)VALUES(1, 'Md.Rahman', '12/A Bijoy Nagar', 'Dhaka', 'Engineer');
INSERT INTO Customer (Cust_id, Cust_name, Address, City, Occupation)VALUES(2, 'Fatima Akter', '34/B Mirpur', 'Dhaka', 'Teacher');
INSERT INTO Customer (Cust_id, Cust_name, Address, City, Occupation)VALUES(3, 'Aminul Islam', '56/C Dhanmondi', 'Dhaka', 'Doctor');
INSERT INTO Customer (Cust_id, Cust_name, Address, City, Occupation)VALUES(4, 'Sadia Ahmed', '78/D Uttara', 'Dhaka', 'Artist');
INSERT INTO Customer (Cust_id, Cust_name, Address, City, Occupation)VALUES(5, 'Kamal Hussain', '90/E Gulshan', 'Dhaka', 'Student');
INSERT INTO Customer (Cust_id, Cust_name, Address, City, Occupation)VALUES(6, 'Nusrat Jahan', '112/F Baridhara', 'Dhaka', 'Accountant'); 

-- Insert 6 values into the Account table using names from the Customer table
INSERT INTO Account (Acc_id, Cust_id, Account_no, Name)VALUES    (1, 01, 100000001,(SELECT Cust_name FROM Customer WHERE Cust_id = 1));
INSERT INTO Account (Acc_id, Cust_id, Account_no, Name)VALUES    (2, 02, 100000002, (SELECT Cust_name FROM Customer WHERE Cust_id = 2));
INSERT INTO Account (Acc_id, Cust_id, Account_no, Name)VALUES   (3, 03, 100000003, (SELECT Cust_name FROM Customer WHERE Cust_id = 3));
INSERT INTO Account (Acc_id, Cust_id, Account_no, Name)VALUES    (4, 04, 100000004, (SELECT Cust_name FROM Customer WHERE Cust_id = 4));
INSERT INTO Account (Acc_id, Cust_id, Account_no, Name)VALUES    (5, 05, 100000005, (SELECT Cust_name FROM Customer WHERE Cust_id = 5));
INSERT INTO Account (Acc_id, Cust_id, Account_no, Name)VALUES    (6, 06, 100000006, (SELECT Cust_name FROM Customer WHERE Cust_id = 6));
  
-- Insert 6 entries into the Electricity_Bill table
INSERT INTO Electricity_Bill (Meter_number, Acc_id, Cust_id, Monthly_unit, Per_unit, Amount)VALUES (1234567890, 1, 1, 150.5, 0.10, 15.05);
INSERT INTO Electricity_Bill (Meter_number, Acc_id, Cust_id, Monthly_unit, Per_unit, Amount)VALUES (2345678901, 2, 2, 200.0, 0.15, 30.00);
INSERT INTO Electricity_Bill (Meter_number, Acc_id, Cust_id, Monthly_unit, Per_unit, Amount)VALUES (3456789012, 3, 3, 100.75, 0.08, 8.06);
INSERT INTO Electricity_Bill (Meter_number, Acc_id, Cust_id, Monthly_unit, Per_unit, Amount)VALUES (4567890123, 4, 4, 300.25, 0.12, 36.03);
INSERT INTO Electricity_Bill (Meter_number, Acc_id, Cust_id, Monthly_unit, Per_unit, Amount)VALUES (5678901234, 5, 5, 180.3, 0.09, 16.23);
INSERT INTO Electricity_Bill (Meter_number, Acc_id, Cust_id, Monthly_unit, Per_unit, Amount)VALUES (6789012345, 6, 6, 250.0, 0.11, 27.50);
 
-- Insert 4 entries into the Tariff table
INSERT INTO Tariff (Tariff_id, Tariff_type) VALUES (1, 'Residential');
INSERT INTO Tariff (Tariff_id, Tariff_type) VALUES (2, 'Commercial');
INSERT INTO Tariff (Tariff_id, Tariff_type) VALUES (3, 'Industrial');
INSERT INTO Tariff (Tariff_id, Tariff_type) VALUES (4, 'Special');

-- Insert 4 entries into the Elec_board table
INSERT INTO Elec_board (Eboard_id, Board_name) VALUES (1, 'Dhaka Electric Supply Company Limited (DESCO)');
INSERT INTO Elec_board (Eboard_id, Board_name) VALUES (2, 'Dhaka Power Distribution Company Limited (DPDC)');
INSERT INTO Elec_board (Eboard_id, Board_name) VALUES (3, 'Bangladesh Rural Electrification Board (BREB)');
INSERT INTO Elec_board (Eboard_id, Board_name) VALUES (4, 'Chittagong Electric Supply Company Limited (CESCO)');

-- Insert 6 values into the Invoice table
INSERT INTO Invoice (Invoice_id, Eboard_id, Tariff_id, Account_no, Meter_number, Reading_date)VALUES (1, 1, 1, 100000001, 1234567890, TO_DATE('2023-11-11', 'YYYY-MM-DD'));
INSERT INTO Invoice (Invoice_id, Eboard_id, Tariff_id, Account_no, Meter_number, Reading_date)VALUES (2, 2, 2, 100000002, 2345678901, TO_DATE('2022-11-12', 'YYYY-MM-DD'));
INSERT INTO Invoice (Invoice_id, Eboard_id, Tariff_id, Account_no, Meter_number, Reading_date)VALUES (3, 3, 3, 100000003, 3456789012, TO_DATE('2023-11-13', 'YYYY-MM-DD'));
INSERT INTO Invoice (Invoice_id, Eboard_id, Tariff_id, Account_no, Meter_number, Reading_date)VALUES (4, 4, 4, 100000004, 4567890123, TO_DATE('2023-11-14', 'YYYY-MM-DD'));
INSERT INTO Invoice (Invoice_id, Eboard_id, Tariff_id, Account_no, Meter_number, Reading_date)VALUES (5, 1, 2, 100000005, 5678901234, TO_DATE('2023-11-15', 'YYYY-MM-DD'));
INSERT INTO Invoice (Invoice_id, Eboard_id, Tariff_id, Account_no, Meter_number, Reading_date)VALUES (6, 2, 3, 100000006, 6789012345, TO_DATE('2023-11-16', 'YYYY-MM-DD'));

select * from Customer;
select * from Account;
select * from Electricity_Bill;
select * from Elec_board;
select * from Tariff;
select * from Invoice;

-- Create trigger
CREATE OR REPLACE TRIGGER before_amount
BEFORE INSERT OR UPDATE ON Electricity_Bill
FOR EACH ROW
BEGIN
:NEW.Amount := :NEW.Monthly_unit * :NEW.Per_unit;
END before_amount;
 /

--Check if the trigger works
INSERT INTO Electricity_Bill (Meter_number, Acc_id, Cust_id, Monthly_unit, Per_unit, Amount)VALUES (1234567855, 3, 3, 30, 3, null);
select * from electricity_bill;

