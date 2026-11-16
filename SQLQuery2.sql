
USE MINI_SHOP_LUXURY;
GO

UPDATE dbo.Customers
SET IsAdmin = 1
WHERE Email = N'bolaadmin@gmail.com';
GO

SELECT CustomerId, FullName, Email, IsAdmin
FROM dbo.Customers;
