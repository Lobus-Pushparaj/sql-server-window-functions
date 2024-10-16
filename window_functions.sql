-- 1. Running Total of Sales per Salesperson using SUM() with OVER()
SELECT SalespersonID, OrderDate, 
       SUM(Quantity) OVER (PARTITION BY SalespersonID ORDER BY OrderDate) AS RunningTotal
FROM Orders
ORDER BY SalespersonID, OrderDate;


-- 2. Rank Salespersons Based on Total Sales using RANK()
SELECT SalespersonID, 
       SUM(Quantity) AS TotalSales,
       RANK() OVER (ORDER BY SUM(Quantity) DESC) AS SalesRank
FROM Orders
GROUP BY SalespersonID;


-- 3. Rank Salespersons using DENSE_RANK() - no gaps in rank
SELECT SalespersonID, 
       SUM(Quantity) AS TotalSales,
       DENSE_RANK() OVER (ORDER BY SUM(Quantity) DESC) AS SalesDenseRank
FROM Orders
GROUP BY SalespersonID;


-- 4. Row Number of Each Order for Each Salesperson using ROW_NUMBER()
SELECT SalespersonID, OrderDate, Quantity, 
       ROW_NUMBER() OVER (PARTITION BY SalespersonID ORDER BY OrderDate) AS OrderRowNumber
FROM Orders
ORDER BY SalespersonID, OrderDate;


-- 5. Divide Salespersons into Quartiles using NTILE()
SELECT SalespersonID, 
       SUM(Quantity) AS TotalSales,
       NTILE(4) OVER (ORDER BY SUM(Quantity) DESC) AS SalesQuartile
FROM Orders
GROUP BY SalespersonID;


-- 6. Show Previous Order's Quantity using LAG()
SELECT SalespersonID, OrderDate, Quantity, 
       LAG(Quantity, 1, 0) OVER (PARTITION BY SalespersonID ORDER BY OrderDate) AS PreviousQuantity
FROM Orders
ORDER BY SalespersonID, OrderDate;


-- 7. Show Next Order's Date using LEAD()
SELECT SalespersonID, OrderDate, Quantity, 
       LEAD(OrderDate, 1) OVER (PARTITION BY SalespersonID ORDER BY OrderDate) AS NextOrderDate
FROM Orders
ORDER BY SalespersonID, OrderDate;


-- 8. First Order Date for Each Salesperson using FIRST_VALUE()
SELECT SalespersonID, OrderDate, Quantity, 
       FIRST_VALUE(OrderDate) OVER (PARTITION BY SalespersonID ORDER BY OrderDate) AS FirstOrderDate
FROM Orders
ORDER BY SalespersonID, OrderDate;


-- 9. Last Order Date for Each Salesperson using LAST_VALUE()
-- Note: LAST_VALUE() requires ROWS or RANGE to define the window explicitly
SELECT SalespersonID, OrderDate, Quantity, 
       LAST_VALUE(OrderDate) OVER (PARTITION BY SalespersonID ORDER BY OrderDate 
                                   ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS LastOrderDate
FROM Orders
ORDER BY SalespersonID, OrderDate;

