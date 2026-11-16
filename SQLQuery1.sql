
USE MINI_SHOP_LUXURY;
GO

IF COL_LENGTH('dbo.Customers', 'IsAdmin') IS NULL
BEGIN
    ALTER TABLE dbo.Customers
    ADD IsAdmin BIT NOT NULL
        CONSTRAINT DF_Customers_IsAdmin DEFAULT (0);
END;
GO

SELECT CustomerId, FullName, Email, IsAdmin
FROM dbo.Customers;
