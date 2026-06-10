use Decodelabs ;

--Total Revenue by Product

SELECT Product,SUM(TotalPrice) AS TotalRevenue,COUNT(OrderID) AS OrderCount
FROM dbo.Orders
GROUP BY Product
ORDER BY TotalRevenue DESC ;




--Revenue by Order Status

SELECT OrderStatus,SUM(TotalPrice) AS TotalRevenue,COUNT(OrderID) AS OrderCount
FROM dbo.Orders
GROUP BY OrderStatus
ORDER BY TotalRevenue DESC ;


--Revenue by Referral Source

SELECT ReferralSource,SUM(TotalPrice) AS TotalRevenue,COUNT(OrderID) AS OrderCount,AVG(TotalPrice) AS AvgOrderValue
FROM dbo.Orders
GROUP BY ReferralSource
ORDER BY TotalRevenue DESC ;





--Cancelled Orders Detail

SELECT Product,COUNT(OrderID) AS CancelledOrders,SUM(TotalPrice) AS LostRevenue
FROM dbo.Orders
WHERE OrderStatus = 'Cancelled'
GROUP BY Product
ORDER BY LostRevenue DESC ;




--High Value Orders

SELECT OrderID,Product,Quantity,TotalPrice
FROM dbo.Orders
WHERE TotalPrice > 3330.41
ORDER BY TotalPrice DESC ;



--Revenue by Payment Method


SELECT PaymentMethod,SUM(TotalPrice) AS TotalRevenue,AVG(TotalPrice) AS AvgOrderValue,COUNT(OrderID) AS OrderCount
FROM dbo.Orders
GROUP BY PaymentMethod
ORDER BY AvgOrderValue DESC ;


--Monthly Revenue Trend

SELECT MONTH(Date) AS Month,YEAR(Date) AS Year,SUM(TotalPrice) AS TotalRevenue,COUNT(OrderID) AS OrderCount
FROM dbo.Orders
GROUP BY YEAR(Date), MONTH(Date)
ORDER BY Year, Month ;





--Cancellation Rate by Product

SELECT Product,COUNT(OrderID) AS TotalOrders,SUM(CASE WHEN OrderStatus = 'Cancelled' THEN 1 ELSE 0 END) AS CancelledOrders,ROUND(SUM(CASE WHEN OrderStatus = 'Cancelled' THEN 1 ELSE 0 END) * 100.0 / COUNT(OrderID), 2) AS CancellationRate
FROM dbo.Orders
GROUP BY Product
ORDER BY CancellationRate DESC ;