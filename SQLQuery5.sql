
-- Thêm 16 sản phẩm áo
DECLARE @i INT = 1;
DECLARE @CategoryAo INT;

SELECT TOP 1 @CategoryAo = CategoryId
FROM dbo.Categories
WHERE CategoryName = N'Áo';

WHILE @i <= 16 AND @CategoryAo IS NOT NULL
BEGIN
    INSERT INTO dbo.Products
    (
        ProductName,
        CategoryId,
        Price,
        StockQuantity,
        ImageUrl,
        Description
    )
    VALUES
    (
        N'Áo thời trang cao cấp ' + CAST(@i AS NVARCHAR(10)),
        @CategoryAo,
        290000 + @i * 35000,
        50,
        N'/Content/images san_pham/ao' +
            CAST(@i AS NVARCHAR(10)) + N'.jpg',
        N'Sản phẩm thời trang cao cấp'
    );

    SET @i = @i + 1;
END;


-- Thêm 5 sản phẩm quần
SET @i = 1;
DECLARE @CategoryQuan INT;

SELECT TOP 1 @CategoryQuan = CategoryId
FROM dbo.Categories
WHERE CategoryName = N'Quần';

WHILE @i <= 5 AND @CategoryQuan IS NOT NULL
BEGIN
    INSERT INTO dbo.Products
    (
        ProductName,
        CategoryId,
        Price,
        StockQuantity,
        ImageUrl,
        Description
    )
    VALUES
    (
        N'Quần thời trang cao cấp ' + CAST(@i AS NVARCHAR(10)),
        @CategoryQuan,
        390000 + @i * 60000,
        50,
        N'/Content/images san_pham/quan' +
            CAST(@i AS NVARCHAR(10)) + N'.jpg',
        N'Sản phẩm thời trang cao cấp'
    );

    SET @i = @i + 1;
END;


-- Thêm 9 phụ kiện
SET @i = 1;
DECLARE @CategoryPhuKien INT;

SELECT TOP 1 @CategoryPhuKien = CategoryId
FROM dbo.Categories
WHERE CategoryName = N'Phụ kiện';

WHILE @i <= 9 AND @CategoryPhuKien IS NOT NULL
BEGIN
    INSERT INTO dbo.Products
    (
        ProductName,
        CategoryId,
        Price,
        StockQuantity,
        ImageUrl,
        Description
    )
    VALUES
    (
        N'Phụ kiện thời trang ' + CAST(@i AS NVARCHAR(10)),
        @CategoryPhuKien,
        150000 + @i * 45000,
        50,
        N'/Content/images san_pham/phukien' +
            CAST(@i AS NVARCHAR(10)) + N'.jpg',
        N'Phụ kiện thời trang cao cấp'
    );

    SET @i = @i + 1;
END;


-- Kiểm tra kết quả
SELECT COUNT(*) AS TotalProducts
FROM dbo.Products;

SELECT
    ProductId,
    ProductName,
    Price,
    StockQuantity,
    ImageUrl
FROM dbo.Products
ORDER BY ProductId;
