
-- TẠO BẢNG DANH MỤC
IF OBJECT_ID('dbo.Categories', 'U') IS NULL
BEGIN
    CREATE TABLE dbo.Categories
    (
        CategoryId INT IDENTITY(1,1) PRIMARY KEY,
        CategoryName NVARCHAR(100) NOT NULL,
        IsActive BIT NOT NULL DEFAULT 1
    );
END;

-- TẠO BẢNG SẢN PHẨM
IF OBJECT_ID('dbo.Products', 'U') IS NULL
BEGIN
    CREATE TABLE dbo.Products
    (
        ProductId INT IDENTITY(1,1) PRIMARY KEY,
        ProductName NVARCHAR(200) NOT NULL,
        CategoryId INT NOT NULL,
        Price DECIMAL(18,2) NOT NULL,
        StockQuantity INT NOT NULL DEFAULT 0,
        ImageUrl NVARCHAR(500) NULL,
        Description NVARCHAR(MAX) NULL,
        IsActive BIT NOT NULL DEFAULT 1,
        CreatedAt DATETIME NOT NULL DEFAULT GETDATE(),

        CONSTRAINT FK_Products_Categories
            FOREIGN KEY (CategoryId)
            REFERENCES dbo.Categories(CategoryId),

        CONSTRAINT CK_Products_Price
            CHECK (Price >= 0),

        CONSTRAINT CK_Products_Stock
            CHECK (StockQuantity >= 0)
    );
END;

-- THÊM 3 DANH MỤC BAN ĐẦU
IF NOT EXISTS (SELECT 1 FROM dbo.Categories)
BEGIN
    INSERT INTO dbo.Categories (CategoryName)
    VALUES
        (N'Áo'),
        (N'Quần'),
        (N'Phụ kiện');
END;

-- KIỂM TRA KẾT QUẢ
SELECT * FROM dbo.Categories;
SELECT * FROM dbo.Products;
