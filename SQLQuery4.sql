
-- Bảng lưu thông tin đơn hàng
IF OBJECT_ID('dbo.Orders', 'U') IS NULL
BEGIN
    CREATE TABLE dbo.Orders
    (
        OrderId INT IDENTITY(1,1) PRIMARY KEY,

        CustomerId INT NULL,

        CustomerName NVARCHAR(150) NOT NULL,

        Phone NVARCHAR(20) NOT NULL,

        Address NVARCHAR(500) NOT NULL,

        TotalAmount DECIMAL(18,2) NOT NULL,

        OrderStatus NVARCHAR(50) NOT NULL
            DEFAULT N'Chờ xác nhận',

        CreatedAt DATETIME NOT NULL
            DEFAULT GETDATE(),

        CONSTRAINT FK_Orders_Customers
            FOREIGN KEY (CustomerId)
            REFERENCES dbo.Customers(CustomerId)
    );
END;


-- Bảng lưu sản phẩm trong từng đơn hàng
IF OBJECT_ID('dbo.OrderDetails', 'U') IS NULL
BEGIN
    CREATE TABLE dbo.OrderDetails
    (
        OrderDetailId INT IDENTITY(1,1) PRIMARY KEY,

        OrderId INT NOT NULL,

        ProductId INT NOT NULL,

        Quantity INT NOT NULL,

        UnitPrice DECIMAL(18,2) NOT NULL,

        CONSTRAINT FK_OrderDetails_Orders
            FOREIGN KEY (OrderId)
            REFERENCES dbo.Orders(OrderId),

        CONSTRAINT FK_OrderDetails_Products
            FOREIGN KEY (ProductId)
            REFERENCES dbo.Products(ProductId)
    );
END;


-- Kiểm tra các bảng
SELECT TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE'
ORDER BY TABLE_NAME;
