-- Create the SalesDB database
CREATE DATABASE SalesDB;

-- Use database SalesDB
USE SalesDB;


-- Create Salespersons table
CREATE TABLE Salespersons (
    SalespersonID INT PRIMARY KEY,
    Name NVARCHAR(50),
    HireDate DATE
);

-- Create Products table
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName NVARCHAR(50),
    UnitPrice DECIMAL(10, 2)
);

-- Create Orders table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    SalespersonID INT,
    ProductID INT,
    OrderDate DATE,
    Quantity INT,
    FOREIGN KEY (SalespersonID) REFERENCES Salespersons(SalespersonID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Insert sample data into Salespersons
INSERT INTO Salespersons VALUES (1, 'Alice', '2021-05-01');
INSERT INTO Salespersons VALUES (2, 'Bob', '2020-06-15');
INSERT INTO Salespersons VALUES (3, 'Charlie', '2019-07-22');

-- Insert sample data into Products
INSERT INTO Products VALUES (1, 'Laptop', 1200);
INSERT INTO Products VALUES (2, 'Smartphone', 800);
INSERT INTO Products VALUES (3, 'Tablet', 600);

-- Insert sample data into Orders
INSERT INTO Orders VALUES (1, 1, 1, '2023-09-01', 10);
INSERT INTO Orders VALUES (2, 1, 2, '2023-09-02', 5);
INSERT INTO Orders VALUES (3, 2, 1, '2023-09-05', 8);
INSERT INTO Orders VALUES (4, 2, 3, '2023-09-07', 12);
INSERT INTO Orders VALUES (5, 3, 2, '2023-09-08', 7);
