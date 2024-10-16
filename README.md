
# SQL Server Window Functions - Project

## Introduction
This project demonstrates the use of various SQL Server window functions in an existing database context. Window functions provide powerful capabilities for analyzing and reporting on data, such as ranking, calculating running totals, and accessing previous or subsequent rows' data.

## Database Schema
This project operates on an existing database that includes the following tables:

- **Salespersons**: Stores details of salespeople.
  - Columns: `SalespersonID`, `Name`, `HireDate`
  
- **Products**: Stores details of products.
  - Columns: `ProductID`, `ProductName`, `UnitPrice`
  
- **Orders**: Stores orders placed by salespersons for products.
  - Columns: `OrderID`, `SalespersonID`, `ProductID`, `OrderDate`, `Quantity`

## Window Function Examples
This project demonstrates the following window functions:

1. **SUM() OVER()**: Calculates a running total of sales per salesperson.
2. **RANK()**: Assigns ranks to salespersons based on total sales (with ties).
3. **DENSE_RANK()**: Similar to `RANK()`, but without gaps in ranking numbers.
4. **ROW_NUMBER()**: Assigns a sequential row number to each order per salesperson.
5. **NTILE()**: Divides salespersons into quartiles based on total sales.
6. **LAG()**: Shows the previous order’s quantity for each salesperson.
7. **LEAD()**: Shows the next order date for each salesperson.
8. **FIRST_VALUE()**: Shows the first order date for each salesperson.
9. **LAST_VALUE()**: Shows the last order date for each salesperson.

## Usage
- Run the `window_functions.sql` file in SQL Server Management Studio (SSMS) or any SQL query tool connected to your SQL Server database.
