
IF COL_LENGTH('dbo.Customers', 'Address') IS NULL
BEGIN
    ALTER TABLE dbo.Customers
    ADD Address NVARCHAR(500) NULL;
END;
GO

SELECT
    CustomerId,
    FullName,
    Phone,
    Email,
    Address
FROM dbo.Customers;
GO
