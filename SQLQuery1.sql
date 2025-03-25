CREATE DATABASE TaxiCompany

CREATE TABLE Drivers(
[id_driver] INT PRIMARY KEY IDENTITY(1,1),
[name] NVARCHAR(100) NOT NULL,
[phone_number] NVARCHAR(10) NOT NULL
);

CREATE TABLE Cars(
[id_car] INT PRIMARY KEY IDENTITY(1,1),
[license_plate] NVARCHAR(100) NOT NULL,
[model] NVARCHAR(100) NOT NULL
);

CREATE TABLE Customers(
[id_customer] INT PRIMARY KEY IDENTITY(1,1),
[name] NVARCHAR(100) NOT NULL,
[phone_number] NVARCHAR(10) NOT NULL
);

CREATE TABLE Rides(
[id_ride] INT PRIMARY KEY IDENTITY(1,1),
[id_driver] INT FOREIGN KEY REFERENCES Drivers([id_driver]) ON DELETE CASCADE ON UPDATE CASCADE,
[id_car] INT FOREIGN KEY REFERENCES Cars([id_car]) ON DELETE SET NULL ON UPDATE CASCADE,
[id_customer] INT FOREIGN KEY REFERENCES Customers([id_customer]) ON DELETE SET DEFAULT ON UPDATE CASCADE,
[pickup_location] NVARCHAR(150) NOT NULL,
[dropoff_location] NVARCHAR(150) NOT NULL,
[fare] DECIMAL(10,2)
);

INSERT INTO Drivers (name, phone_number) VALUES
(N'���� ������', '0888123456'),
(N'����� ������', '0887234567'),
(N'����� ���������', '0887345678'),
(N'����� ��������', '0887456789'),
(N'������ ��������', '0887567890');

INSERT INTO Cars (license_plate, model) VALUES
('CA1234AB', 'BMW X5'),
('CA5678CD', 'Audi A4'),
('CA9101EF', 'Mercedes Benz E-Class'),
('CA1122GH', 'Volkswagen Golf'),
('CA3344IJ', 'Toyota Corolla');

INSERT INTO Customers (name, phone_number) VALUES
(N'������� ��������', '0888777665'),
(N'���� �������', '0888666554'),
(N'����� �������', '0888555443'),
(N'������� ��������', '0888444332'),
(N'������ ��������', '0888333221');

INSERT INTO Rides (id_driver, id_car, id_customer, pickup_location, dropoff_location, fare) VALUES
(1, 1, 1, N'��. �', N'���. �', 25.50),
(2, 2, 2, N'��. �', N'���. �', 30.00),
(3, 3, 3, N'��. �', N'���. �', 45.75),
(4, 4, 4, N'��. �', N'���. �', 15.20),
(5, 5, 5, N'��. �', N'���. �', 20.00);

DELETE FROM Drivers WHERE id_driver = 1;
DELETE FROM Cars WHERE id_car=1;
DELETE FROM Customers WHERE id_customer=1;

UPDATE Drivers SET name = N'���� �������' WHERE id_driver = 2;
UPDATE Cars SET model='Audi Q7' WHERE id_car=4;
UPDATE Customers SET name=N'������ �������' WHERE id_customer=2;