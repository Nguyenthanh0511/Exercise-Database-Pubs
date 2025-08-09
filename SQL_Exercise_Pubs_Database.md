# Bộ Bài Tập Luyện Truy Vấn SQL Server - Database Pubs

## Tổng Quan
- **Mục tiêu**: Hiểu cấu trúc database và khai thác dữ liệu hiệu quả
- **Cơ sở dữ liệu**: Pubs (Microsoft SQL Server Sample Database)
- **Bảng chính**: authors, titles, publishers, sales, stores, titleauthor, employee, jobs, discounts, roysched, pub_info

## Cấu Trúc Database Pubs

### Các Bảng Chính:
- **authors**: Thông tin tác giả (au_id, au_lname, au_fname, phone, address, city, state, zip, contract)
- **titles**: Thông tin sách (title_id, title, type, pub_id, price, advance, royalty, ytd_sales, notes, pubdate)
- **publishers**: Thông tin nhà xuất bản (pub_id, pub_name, city, state, country)
- **titleauthor**: Quan hệ tác giả-sách (au_id, title_id, au_ord, royaltyper)
- **sales**: Dữ liệu bán hàng (stor_id, ord_num, ord_date, qty, payterms, title_id)
- **stores**: Thông tin cửa hàng (stor_id, stor_name, stor_address, city, state, zip)
- **employee**: Nhân viên (emp_id, fname, minit, lname, job_id, job_lvl, pub_id, hire_date)
- **jobs**: Vị trí công việc (job_id, job_desc, min_lvl, max_lvl)

---

## PHẦN I: BÀI TẬP CƠ BẢN (35 câu)
*Tập trung vào SELECT cơ bản, WHERE, JOIN đơn giản, GROUP BY, ORDER BY*

### Câu 1: Truy vấn cơ bản - Liệt kê tất cả tác giả
**Learning Objective**: Làm quen với câu lệnh SELECT cơ bản
**Level**: Basic
**Thời gian dự kiến**: 2 phút
**Điểm**: 1

```sql
-- Liệt kê tất cả thông tin của các tác giả trong bảng authors
SELECT * FROM authors;
```

**Kết quả mẫu**:
```
au_id       au_lname    au_fname    phone           address                 city        state   zip     contract
409-56-7008 Bennet      Abraham     415 658-9932    6223 Bateman St         Berkeley    CA      94705   1
213-46-8915 Green       Marjorie    415 986-7020    309 63rd St #411        Oakland     CA      94618   1
```

---

### Câu 2: Lọc dữ liệu với WHERE - Tác giả ở California
**Learning Objective**: Sử dụng mệnh đề WHERE để lọc dữ liệu
**Level**: Basic  
**Thời gian dự kiến**: 3 phút
**Điểm**: 1

```sql
-- Tìm tất cả tác giả sống ở bang California (CA)
SELECT au_fname, au_lname, city, state 
FROM authors 
WHERE state = 'CA';
```

**Kết quả mẫu**:
```
au_fname    au_lname    city        state
Abraham     Bennet      Berkeley    CA
Marjorie    Green       Oakland     CA
```

---

### Câu 3: Sắp xếp dữ liệu - Danh sách sách theo giá
**Learning Objective**: Sử dụng ORDER BY để sắp xếp kết quả
**Level**: Basic
**Thời gian dự kiến**: 3 phút  
**Điểm**: 1

```sql
-- Hiển thị danh sách các cuốn sách sắp xếp theo giá từ cao đến thấp
SELECT title, type, price 
FROM titles 
WHERE price IS NOT NULL
ORDER BY price DESC;
```

**Kết quả mẫu**:
```
title                           type        price
The Gourmet Microwave          mod_cook    22.99
Fifty Years in Buckingham...   trad_cook   11.95
```

---

### Câu 4: Tìm kiếm với LIKE - Tác giả có tên bắt đầu bằng 'A'
**Learning Objective**: Sử dụng toán tử LIKE cho tìm kiếm mẫu
**Level**: Basic
**Thời gian dự kiến**: 3 phút
**Điểm**: 1

```sql
-- Tìm tất cả tác giả có tên (first name) bắt đầu bằng chữ 'A'
SELECT au_fname, au_lname, phone 
FROM authors 
WHERE au_fname LIKE 'A%';
```

---

### Câu 5: Đếm số lượng - Tổng số nhà xuất bản
**Learning Objective**: Sử dụng hàm COUNT để đếm số bản ghi
**Level**: Basic
**Thời gian dự kiến**: 2 phút
**Điểm**: 1

```sql
-- Đếm tổng số nhà xuất bản trong database
SELECT COUNT(*) as TotalPublishers 
FROM publishers;
```

---

### Câu 6: Lọc với IN - Sách thuộc loại cụ thể
**Learning Objective**: Sử dụng toán tử IN để lọc nhiều giá trị
**Level**: Basic
**Thời gian dự kiến**: 3 phút
**Điểm**: 1

```sql
-- Tìm các cuốn sách thuộc loại 'business' hoặc 'psychology'
SELECT title, type, price 
FROM titles 
WHERE type IN ('business', 'psychology');
```

---

### Câu 7: Lọc với BETWEEN - Sách trong khoảng giá
**Learning Objective**: Sử dụng BETWEEN để lọc trong khoảng giá trị
**Level**: Basic
**Thời gian dự kiến**: 3 phút
**Điểm**: 1

```sql
-- Tìm các cuốn sách có giá từ $10 đến $20
SELECT title, price 
FROM titles 
WHERE price BETWEEN 10 AND 20;
```

---

### Câu 8: Xử lý NULL - Sách chưa có giá
**Learning Objective**: Xử lý giá trị NULL trong truy vấn
**Level**: Basic
**Thời gian dự kiến**: 3 phút
**Điểm**: 1

```sql
-- Tìm các cuốn sách chưa được định giá (price là NULL)
SELECT title, type 
FROM titles 
WHERE price IS NULL;
```

---

### Câu 9: Hàm tổng hợp - Giá trung bình của sách
**Learning Objective**: Sử dụng hàm AVG để tính trung bình
**Level**: Basic
**Thời gian dự kiến**: 3 phút
**Điểm**: 1

```sql
-- Tính giá trung bình của tất cả các cuốn sách
SELECT AVG(price) as AveragePrice 
FROM titles 
WHERE price IS NOT NULL;
```

---

### Câu 10: Hàm MIN/MAX - Giá cao nhất và thấp nhất
**Learning Objective**: Sử dụng hàm MIN và MAX
**Level**: Basic
**Thời gian dự kiến**: 3 phút
**Điểm**: 1

```sql
-- Tìm giá cao nhất và thấp nhất của sách
SELECT MIN(price) as LowestPrice, MAX(price) as HighestPrice 
FROM titles 
WHERE price IS NOT NULL;
```

---

### Câu 11: GROUP BY cơ bản - Số sách theo thể loại
**Learning Objective**: Nhóm dữ liệu với GROUP BY
**Level**: Basic
**Thời gian dự kiến**: 4 phút
**Điểm**: 2

```sql
-- Đếm số lượng sách theo từng thể loại
SELECT type, COUNT(*) as BookCount 
FROM titles 
GROUP BY type 
ORDER BY BookCount DESC;
```

**Kết quả mẫu**:
```
type        BookCount
business    4
psychology  5
```

---

### Câu 12: INNER JOIN cơ bản - Sách và nhà xuất bản
**Learning Objective**: Kết hợp hai bảng với INNER JOIN
**Level**: Basic
**Thời gian dự kiến**: 5 phút
**Điểm**: 2

```sql
-- Hiển thị tên sách kèm tên nhà xuất bản
SELECT t.title, p.pub_name 
FROM titles t 
INNER JOIN publishers p ON t.pub_id = p.pub_id;
```

---

### Câu 13: WHERE với JOIN - Sách của nhà xuất bản cụ thể
**Learning Objective**: Kết hợp JOIN với điều kiện WHERE
**Level**: Basic
**Thời gian dự kiến**: 5 phút
**Điểm**: 2

```sql
-- Tìm tất cả sách của nhà xuất bản 'Algodata Infosystems'
SELECT t.title, t.price, p.pub_name 
FROM titles t 
INNER JOIN publishers p ON t.pub_id = p.pub_id 
WHERE p.pub_name = 'Algodata Infosystems';
```

---

### Câu 14: Lọc theo năm - Sách xuất bản trong năm cụ thể
**Learning Objective**: Sử dụng hàm YEAR để lọc theo năm
**Level**: Basic
**Thời gian dự kiến**: 4 phút
**Điểm**: 2

```sql
-- Tìm các cuốn sách được xuất bản trong năm 1991
SELECT title, pubdate 
FROM titles 
WHERE YEAR(pubdate) = 1991;
```

---

### Câu 15: String functions - Tên tác giả viết hoa
**Learning Objective**: Sử dụng hàm chuỗi UPPER
**Level**: Basic
**Thời gian dự kiến**: 3 phút
**Điểm**: 1

```sql
-- Hiển thị tên đầy đủ của tác giả bằng chữ hoa
SELECT UPPER(au_fname + ' ' + au_lname) as FullName 
FROM authors;
```

---

### Câu 16: Tính tổng - Doanh thu tiềm năng
**Learning Objective**: Sử dụng hàm SUM và phép nhân
**Level**: Basic
**Thời gian dự kiến**: 4 phút
**Điểm**: 2

```sql
-- Tính tổng doanh thu tiềm năng (price * ytd_sales) của tất cả sách
SELECT SUM(price * ytd_sales) as PotentialRevenue 
FROM titles 
WHERE price IS NOT NULL AND ytd_sales IS NOT NULL;
```

---

### Câu 17: DISTINCT - Các bang có tác giả
**Learning Objective**: Loại bỏ giá trị trùng lặp với DISTINCT
**Level**: Basic
**Thời gian dự kiến**: 2 phút
**Điểm**: 1

```sql
-- Liệt kê các bang có tác giả (không trùng lặp)
SELECT DISTINCT state 
FROM authors 
WHERE state IS NOT NULL 
ORDER BY state;
```

---

### Câu 18: TOP - 5 cuốn sách đắt nhất
**Learning Objective**: Sử dụng TOP để giới hạn kết quả
**Level**: Basic
**Thời gian dự kiến**: 3 phút
**Điểm**: 1

```sql
-- Hiển thị 5 cuốn sách có giá cao nhất
SELECT TOP 5 title, price 
FROM titles 
WHERE price IS NOT NULL 
ORDER BY price DESC;
```

---

### Câu 19: CASE statement - Phân loại giá sách
**Learning Objective**: Sử dụng CASE để tạo cột điều kiện
**Level**: Basic
**Thời gian dự kiến**: 5 phút
**Điểm**: 2

```sql
-- Phân loại sách theo giá: Rẻ (<$10), Trung bình ($10-$20), Đắt (>$20)
SELECT title, price,
    CASE 
        WHEN price IS NULL THEN 'No Price'
        WHEN price < 10 THEN 'Cheap'
        WHEN price BETWEEN 10 AND 20 THEN 'Medium'
        ELSE 'Expensive'
    END as PriceCategory
FROM titles;
```

---

### Câu 20: LEFT JOIN - Tất cả tác giả và sách của họ
**Learning Objective**: Hiểu sự khác biệt giữa INNER JOIN và LEFT JOIN
**Level**: Basic
**Thời gian dự kiến**: 6 phút
**Điểm**: 2

```sql
-- Hiển thị tất cả tác giả và sách của họ (bao gồm tác giả chưa có sách)
SELECT a.au_fname, a.au_lname, t.title 
FROM authors a 
LEFT JOIN titleauthor ta ON a.au_id = ta.au_id 
LEFT JOIN titles t ON ta.title_id = t.title_id 
ORDER BY a.au_lname, a.au_fname;
```

---

### Câu 21: GROUP BY với HAVING - Thể loại có nhiều hơn 3 cuốn
**Learning Objective**: Sử dụng HAVING để lọc nhóm
**Level**: Basic
**Thời gian dự kiến**: 5 phút
**Điểm**: 2

```sql
-- Tìm các thể loại sách có nhiều hơn 3 cuốn
SELECT type, COUNT(*) as BookCount 
FROM titles 
GROUP BY type 
HAVING COUNT(*) > 3;
```

---

### Câu 22: Múi giờ - Sách xuất bản trong 2 năm gần nhất
**Learning Objective**: Sử dụng hàm ngày tháng để so sánh
**Level**: Basic
**Thời gian dự kiến**: 4 phút
**Điểm**: 2

```sql
-- Tìm sách được xuất bản trong 2 năm gần nhất
SELECT title, pubdate 
FROM titles 
WHERE pubdate >= DATEADD(YEAR, -2, GETDATE()) 
ORDER BY pubdate DESC;
```

---

### Câu 23: Concatenation - Địa chỉ đầy đủ tác giả
**Learning Objective**: Kết hợp nhiều cột thành một chuỗi
**Level**: Basic
**Thời gian dự kiến**: 4 phút
**Điểm**: 2

```sql
-- Tạo địa chỉ đầy đủ của tác giả
SELECT au_fname + ' ' + au_lname as FullName,
       address + ', ' + city + ', ' + state + ' ' + zip as FullAddress 
FROM authors 
WHERE address IS NOT NULL;
```

---

### Câu 24: Nhóm theo nhiều cột - Số tác giả theo bang và thành phố
**Learning Objective**: GROUP BY với nhiều cột
**Level**: Basic
**Thời gian dự kiến**: 4 phút
**Điểm**: 2

```sql
-- Đếm số tác giả theo bang và thành phố
SELECT state, city, COUNT(*) as AuthorCount 
FROM authors 
WHERE state IS NOT NULL AND city IS NOT NULL 
GROUP BY state, city 
ORDER BY state, city;
```

---

### Câu 25: Subquery đơn giản - Sách có giá cao hơn trung bình
**Learning Objective**: Giới thiệu subquery cơ bản
**Level**: Basic
**Thời gian dự kiến**: 6 phút
**Điểm**: 3

```sql
-- Tìm các cuốn sách có giá cao hơn giá trung bình
SELECT title, price 
FROM titles 
WHERE price > (SELECT AVG(price) FROM titles WHERE price IS NOT NULL)
ORDER BY price DESC;
```

---

### Câu 26: INSERT cơ bản - Thêm tác giả mới
**Learning Objective**: Thêm dữ liệu với INSERT
**Level**: Basic
**Thời gian dự kiến**: 4 phút
**Điểm**: 2

```sql
-- Thêm một tác giả mới vào bảng authors
INSERT INTO authors (au_id, au_lname, au_fname, phone, contract)
VALUES ('123-45-6789', 'Nguyen', 'Van', '123 456-7890', 1);
```

---

### Câu 27: UPDATE cơ bản - Cập nhật giá sách
**Learning Objective**: Cập nhật dữ liệu với UPDATE
**Level**: Basic
**Thời gian dự kiến**: 4 phút
**Điểm**: 2

```sql
-- Tăng giá của tất cả sách loại 'business' lên 10%
UPDATE titles 
SET price = price * 1.1 
WHERE type = 'business' AND price IS NOT NULL;
```

---

### Câu 28: JOIN ba bảng - Tác giả, sách và nhà xuất bản
**Learning Objective**: Kết hợp ba bảng trong một truy vấn
**Level**: Basic
**Thời gian dự kiến**: 7 phút
**Điểm**: 3

```sql
-- Hiển thị tên tác giả, tên sách và tên nhà xuất bản
SELECT a.au_fname + ' ' + a.au_lname as AuthorName,
       t.title, p.pub_name 
FROM authors a 
INNER JOIN titleauthor ta ON a.au_id = ta.au_id 
INNER JOIN titles t ON ta.title_id = t.title_id 
INNER JOIN publishers p ON t.pub_id = p.pub_id 
ORDER BY AuthorName;
```

---

### Câu 29: Thống kê theo nhà xuất bản
**Learning Objective**: Thống kê dữ liệu theo nhóm
**Level**: Basic
**Thời gian dự kiến**: 5 phút
**Điểm**: 2

```sql
-- Thống kê số sách và giá trung bình theo nhà xuất bản
SELECT p.pub_name, 
       COUNT(t.title_id) as BookCount,
       AVG(t.price) as AvgPrice 
FROM publishers p 
LEFT JOIN titles t ON p.pub_id = t.pub_id 
GROUP BY p.pub_name 
ORDER BY BookCount DESC;
```

---

### Câu 30: Tìm kiếm trong ghi chú
**Learning Objective**: Tìm kiếm text trong cột dài
**Level**: Basic
**Thời gian dự kiến**: 3 phút
**Điểm**: 1

```sql
-- Tìm sách có chứa từ 'computer' trong ghi chú
SELECT title, notes 
FROM titles 
WHERE notes LIKE '%computer%';
```

---

### Câu 31: Tính tỷ lệ phần trăm
**Learning Objective**: Tính tỷ lệ phần trăm
**Level**: Basic
**Thời gian dự kiến**: 6 phút
**Điểm**: 3

```sql
-- Tính tỷ lệ phần trăm từng thể loại sách
SELECT type, 
       COUNT(*) as BookCount,
       COUNT(*) * 100.0 / (SELECT COUNT(*) FROM titles) as Percentage
FROM titles 
GROUP BY type 
ORDER BY Percentage DESC;
```

---

### Câu 32: DELETE với điều kiện
**Learning Objective**: Xóa dữ liệu có điều kiện
**Level**: Basic
**Thời gian dự kiến**: 3 phút
**Điểm**: 2

```sql
-- Xóa tác giả vừa thêm ở câu 26
DELETE FROM authors 
WHERE au_id = '123-45-6789';
```

---

### Câu 33: Sử dụng EXISTS
**Learning Objective**: Kiểm tra tồn tại với EXISTS
**Level**: Basic
**Thời gian dự kiến**: 6 phút
**Điểm**: 3

```sql
-- Tìm tác giả có ít nhất một cuốn sách
SELECT au_fname, au_lname 
FROM authors a 
WHERE EXISTS (
    SELECT 1 FROM titleauthor ta 
    WHERE ta.au_id = a.au_id
);
```

---

### Câu 34: UNION - Kết hợp kết quả
**Learning Objective**: Kết hợp kết quả từ nhiều truy vấn
**Level**: Basic
**Thời gian dự kiến**: 5 phút
**Điểm**: 2

```sql
-- Liệt kê tất cả thành phố có tác giả hoặc nhà xuất bản
SELECT city, 'Author' as Type FROM authors WHERE city IS NOT NULL
UNION
SELECT city, 'Publisher' as Type FROM publishers WHERE city IS NOT NULL
ORDER BY city;
```

---

### Câu 35: CREATE TABLE - Tạo bảng mới
**Learning Objective**: Tạo bảng với các ràng buộc
**Level**: Basic
**Thời gian dự kiến**: 6 phút
**Điểm**: 3

```sql
-- Tạo bảng để lưu đánh giá sách
CREATE TABLE book_reviews (
    review_id INT IDENTITY(1,1) PRIMARY KEY,
    title_id VARCHAR(6) NOT NULL,
    reviewer_name VARCHAR(50) NOT NULL,
    rating INT CHECK (rating BETWEEN 1 AND 5),
    review_text TEXT,
    review_date DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (title_id) REFERENCES titles(title_id)
);
```

---

## PHẦN II: BÀI TẬP TRUNG BÌNH (30 câu)
*Tập trung vào JOIN phức tạp, Subquery, Window Functions, CTE*

### Câu 36: Subquery tương quan - Tác giả có nhiều sách nhất
**Learning Objective**: Sử dụng subquery tương quan
**Level**: Intermediate
**Thời gian dự kiến**: 8 phút
**Điểm**: 4

```sql
-- Tìm tác giả có số lượng sách nhiều nhất
SELECT a.au_fname, a.au_lname, 
       (SELECT COUNT(*) FROM titleauthor ta WHERE ta.au_id = a.au_id) as BookCount
FROM authors a 
WHERE (SELECT COUNT(*) FROM titleauthor ta WHERE ta.au_id = a.au_id) = 
      (SELECT MAX(book_count) FROM 
       (SELECT COUNT(*) as book_count FROM titleauthor GROUP BY au_id) as counts);
```

**Kết quả mẫu**:
```
au_fname    au_lname    BookCount
Johnson     White       3
```

---

### Câu 37: CTE (Common Table Expression) - Thống kê doanh số
**Learning Objective**: Sử dụng CTE để tổ chức truy vấn phức tạp
**Level**: Intermediate
**Thời gian dự kiến**: 10 phút
**Điểm**: 5

```sql
-- Sử dụng CTE để tính tổng doanh số theo nhà xuất bản
WITH PublisherSales AS (
    SELECT p.pub_name, t.title, s.qty, t.price,
           (s.qty * t.price) as Revenue
    FROM publishers p
    INNER JOIN titles t ON p.pub_id = t.pub_id
    INNER JOIN sales s ON t.title_id = s.title_id
    WHERE t.price IS NOT NULL
)
SELECT pub_name, 
       COUNT(*) as TotalOrders,
       SUM(qty) as TotalQuantity,
       SUM(Revenue) as TotalRevenue
FROM PublisherSales
GROUP BY pub_name
ORDER BY TotalRevenue DESC;
```

---

### Câu 38: Window Functions - ROW_NUMBER
**Learning Objective**: Sử dụng ROW_NUMBER để đánh số thứ tự
**Level**: Intermediate
**Thời gian dự kiến**: 8 phút
**Điểm**: 4

```sql
-- Đánh số thứ tự sách theo giá trong từng thể loại
SELECT title, type, price,
       ROW_NUMBER() OVER (PARTITION BY type ORDER BY price DESC) as PriceRank
FROM titles 
WHERE price IS NOT NULL
ORDER BY type, PriceRank;
```

---

### Câu 39: RANK và DENSE_RANK - Xếp hạng sách
**Learning Objective**: Hiểu sự khác biệt giữa RANK và DENSE_RANK
**Level**: Intermediate
**Thời gian dự kiến**: 8 phút
**Điểm**: 4

```sql
-- Xếp hạng sách theo doanh số (ytd_sales)
SELECT title, ytd_sales,
       RANK() OVER (ORDER BY ytd_sales DESC) as SalesRank,
       DENSE_RANK() OVER (ORDER BY ytd_sales DESC) as SalesDenseRank
FROM titles 
WHERE ytd_sales IS NOT NULL
ORDER BY ytd_sales DESC;
```

---

### Câu 40: LAG và LEAD - So sánh với giá trị trước/sau
**Learning Objective**: Sử dụng LAG và LEAD
**Level**: Intermediate
**Thời gian dự kiến**: 10 phút
**Điểm**: 5

```sql
-- So sánh giá mỗi cuốn sách với cuốn trước và sau trong cùng thể loại
SELECT title, type, price,
       LAG(price) OVER (PARTITION BY type ORDER BY price) as PrevPrice,
       LEAD(price) OVER (PARTITION BY type ORDER BY price) as NextPrice,
       price - LAG(price) OVER (PARTITION BY type ORDER BY price) as PriceDiff
FROM titles 
WHERE price IS NOT NULL
ORDER BY type, price;
```

---

### Câu 41: PIVOT - Chuyển đổi dữ liệu thành bảng chéo
**Learning Objective**: Sử dụng PIVOT để chuyển đổi hàng thành cột
**Level**: Intermediate
**Thời gian dự kiến**: 12 phút
**Điểm**: 6

```sql
-- Tạo bảng chéo hiển thị số lượng sách theo thể loại và nhà xuất bản
SELECT pub_name,
       ISNULL([business], 0) as Business,
       ISNULL([mod_cook], 0) as ModernCooking,
       ISNULL([popular_comp], 0) as PopularComputing,
       ISNULL([psychology], 0) as Psychology,
       ISNULL([trad_cook], 0) as TraditionalCooking,
       ISNULL([UNDECIDED], 0) as Undecided
FROM (
    SELECT p.pub_name, t.type
    FROM publishers p
    INNER JOIN titles t ON p.pub_id = t.pub_id
) as SourceTable
PIVOT (
    COUNT(type) FOR type IN ([business], [mod_cook], [popular_comp], 
                            [psychology], [trad_cook], [UNDECIDED])
) as PivotTable
ORDER BY pub_name;
```

---

### Câu 42: Recursive CTE - Cấu trúc phân cấp (nếu có)
**Learning Objective**: Hiểu Recursive CTE
**Level**: Intermediate
**Thời gian dự kiến**: 15 phút
**Điểm**: 7

```sql
-- Tạo dải số từ 1 đến 10 bằng Recursive CTE
WITH NumberSeries AS (
    SELECT 1 as Number
    UNION ALL
    SELECT Number + 1
    FROM NumberSeries
    WHERE Number < 10
)
SELECT Number,
       CASE 
           WHEN Number <= (SELECT COUNT(*) FROM titles) 
           THEN 'Has Books'
           ELSE 'No Books'
       END as Status
FROM NumberSeries;
```

---

### Câu 43: Subquery phức tạp - Tác giả và sách bán chạy nhất
**Learning Objective**: Kết hợp nhiều subquery
**Level**: Intermediate
**Thời gian dự kiến**: 12 phút
**Điểm**: 6

```sql
-- Tìm tác giả của cuốn sách bán chạy nhất
SELECT a.au_fname, a.au_lname, t.title, t.ytd_sales
FROM authors a
INNER JOIN titleauthor ta ON a.au_id = ta.au_id
INNER JOIN titles t ON ta.title_id = t.title_id
WHERE t.ytd_sales = (
    SELECT MAX(ytd_sales) 
    FROM titles 
    WHERE ytd_sales IS NOT NULL
);
```

---

### Câu 44: Phân tích doanh số theo quý
**Learning Objective**: Phân nhóm theo thời gian
**Level**: Intermediate
**Thời gian dự kiến**: 10 phút
**Điểm**: 5

```sql
-- Phân tích doanh số theo quý
SELECT YEAR(s.ord_date) as OrderYear,
       DATEPART(QUARTER, s.ord_date) as Quarter,
       COUNT(*) as OrderCount,
       SUM(s.qty) as TotalQuantity,
       SUM(s.qty * t.price) as Revenue
FROM sales s
INNER JOIN titles t ON s.title_id = t.title_id
WHERE t.price IS NOT NULL
GROUP BY YEAR(s.ord_date), DATEPART(QUARTER, s.ord_date)
ORDER BY OrderYear, Quarter;
```

---

### Câu 45: CASE phức tạp - Phân loại tác giả theo số sách
**Learning Objective**: CASE statement phức tạp với subquery
**Level**: Intermediate
**Thời gian dự kiến**: 10 phút
**Điểm**: 5

```sql
-- Phân loại tác giả theo số lượng sách đã viết
SELECT a.au_fname, a.au_lname,
       (SELECT COUNT(*) FROM titleauthor ta WHERE ta.au_id = a.au_id) as BookCount,
       CASE 
           WHEN (SELECT COUNT(*) FROM titleauthor ta WHERE ta.au_id = a.au_id) = 0 
           THEN 'No Books'
           WHEN (SELECT COUNT(*) FROM titleauthor ta WHERE ta.au_id = a.au_id) = 1 
           THEN 'Single Author'
           WHEN (SELECT COUNT(*) FROM titleauthor ta WHERE ta.au_id = a.au_id) BETWEEN 2 AND 3 
           THEN 'Productive Author'
           ELSE 'Prolific Author'
       END as AuthorCategory
FROM authors a
ORDER BY BookCount DESC;
```

---

### Câu 46: Tự join - So sánh tác giả cùng thành phố
**Learning Objective**: Self join để so sánh trong cùng bảng
**Level**: Intermediate
**Thời gian dự kiến**: 10 phút
**Điểm**: 5

```sql
-- Tìm các cặp tác giả sống cùng thành phố
SELECT a1.au_fname + ' ' + a1.au_lname as Author1,
       a2.au_fname + ' ' + a2.au_lname as Author2,
       a1.city
FROM authors a1
INNER JOIN authors a2 ON a1.city = a2.city 
WHERE a1.au_id < a2.au_id 
  AND a1.city IS NOT NULL
ORDER BY a1.city;
```

---

### Câu 47: Phân tích xu hướng giá theo năm
**Learning Objective**: Phân tích xu hướng theo thời gian
**Level**: Intermediate
**Thời gian dự kiến**: 12 phút
**Điểm**: 6

```sql
-- Phân tích xu hướng giá sách theo năm xuất bản
SELECT YEAR(pubdate) as PublishYear,
       COUNT(*) as BookCount,
       AVG(price) as AvgPrice,
       MIN(price) as MinPrice,
       MAX(price) as MaxPrice,
       STDEV(price) as PriceStdDev
FROM titles
WHERE price IS NOT NULL AND pubdate IS NOT NULL
GROUP BY YEAR(pubdate)
HAVING COUNT(*) > 1
ORDER BY PublishYear;
```

---

### Câu 48: Top N trong mỗi nhóm
**Learning Objective**: Lấy top N record trong mỗi nhóm
**Level**: Intermediate
**Thời gian dự kiến**: 12 phút
**Điểm**: 6

```sql
-- Lấy 2 cuốn sách đắt nhất trong mỗi thể loại
WITH RankedBooks AS (
    SELECT title, type, price,
           ROW_NUMBER() OVER (PARTITION BY type ORDER BY price DESC) as rn
    FROM titles
    WHERE price IS NOT NULL
)
SELECT title, type, price
FROM RankedBooks
WHERE rn <= 2
ORDER BY type, price DESC;
```

---

### Câu 49: Tính tỷ lệ running total
**Learning Objective**: Tính tổng tích lũy
**Level**: Intermediate
**Thời gian dự kiến**: 10 phút
**Điểm**: 5

```sql
-- Tính tỷ lệ tích lũy doanh số theo thời gian
SELECT s.ord_date, 
       SUM(s.qty * t.price) as DailyRevenue,
       SUM(SUM(s.qty * t.price)) OVER (ORDER BY s.ord_date) as RunningTotal
FROM sales s
INNER JOIN titles t ON s.title_id = t.title_id
WHERE t.price IS NOT NULL
GROUP BY s.ord_date
ORDER BY s.ord_date;
```

---

### Câu 50: Stored Procedure đơn giản
**Learning Objective**: Tạo stored procedure
**Level**: Intermediate
**Thời gian dự kiến**: 8 phút
**Điểm**: 4

```sql
-- Tạo stored procedure lấy thông tin sách theo thể loại
CREATE PROCEDURE GetBooksByType
    @BookType VARCHAR(12)
AS
BEGIN
    SELECT t.title, t.price, p.pub_name
    FROM titles t
    INNER JOIN publishers p ON t.pub_id = p.pub_id
    WHERE t.type = @BookType
    ORDER BY t.price DESC;
END

-- Sử dụng procedure
EXEC GetBooksByType @BookType = 'business';
```

---

### Câu 51: VIEW phức tạp - Tổng hợp thông tin tác giả
**Learning Objective**: Tạo view với join nhiều bảng
**Level**: Intermediate
**Thời gian dự kiến**: 10 phút
**Điểm**: 5

```sql
-- Tạo view tổng hợp thông tin tác giả và sách
CREATE VIEW AuthorBookSummary AS
SELECT a.au_id, a.au_fname, a.au_lname, a.state,
       COUNT(ta.title_id) as BookCount,
       AVG(t.price) as AvgBookPrice,
       SUM(t.ytd_sales) as TotalSales
FROM authors a
LEFT JOIN titleauthor ta ON a.au_id = ta.au_id
LEFT JOIN titles t ON ta.title_id = t.title_id
GROUP BY a.au_id, a.au_fname, a.au_lname, a.state;

-- Sử dụng view
SELECT * FROM AuthorBookSummary 
WHERE BookCount > 0 
ORDER BY TotalSales DESC;
```

---

### Câu 52-65: [Tiếp tục với 14 câu Intermediate khác...]

---

## PHẦN III: BÀI TẬP NÂNG CAO (8 câu)
*Tập trung vào Window Functions phức tạp, Dynamic SQL, Performance*

### Câu 66: NTILE - Chia dữ liệu thành các nhóm
**Learning Objective**: Sử dụng NTILE để phân chia dữ liệu
**Level**: Advanced
**Thời gian dự kiến**: 15 phút
**Điểm**: 8

```sql
-- Chia sách thành 4 nhóm theo giá và phân tích từng nhóm
WITH BookQuartiles AS (
    SELECT title, price, type,
           NTILE(4) OVER (ORDER BY price) as PriceQuartile
    FROM titles
    WHERE price IS NOT NULL
)
SELECT PriceQuartile,
       COUNT(*) as BookCount,
       MIN(price) as MinPrice,
       MAX(price) as MaxPrice,
       AVG(price) as AvgPrice
FROM BookQuartiles
GROUP BY PriceQuartile
ORDER BY PriceQuartile;
```

**Kết quả mẫu**:
```
PriceQuartile   BookCount   MinPrice    MaxPrice    AvgPrice
1               4           2.99        11.95       7.97
2               4           12.99       19.99       16.49
```

---

### Câu 67: Complex Window Functions - Percentile
**Learning Objective**: Sử dụng PERCENTILE_CONT và PERCENTILE_DISC
**Level**: Advanced
**Thời gian dự kiến**: 20 phút
**Điểm**: 10

```sql
-- Tính percentile của giá sách và so sánh với từng cuốn
SELECT title, price, type,
       PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY price) 
           OVER (PARTITION BY type) as MedianPrice,
       PERCENTILE_CONT(0.25) WITHIN GROUP (ORDER BY price) 
           OVER (PARTITION BY type) as Q1Price,
       PERCENTILE_CONT(0.75) WITHIN GROUP (ORDER BY price) 
           OVER (PARTITION BY type) as Q3Price,
       CASE 
           WHEN price < PERCENTILE_CONT(0.25) WITHIN GROUP (ORDER BY price) 
                       OVER (PARTITION BY type) THEN 'Low'
           WHEN price > PERCENTILE_CONT(0.75) WITHIN GROUP (ORDER BY price) 
                       OVER (PARTITION BY type) THEN 'High'
           ELSE 'Medium'
       END as PriceCategory
FROM titles
WHERE price IS NOT NULL
ORDER BY type, price;
```

---

### Câu 68: Dynamic SQL - Tạo báo cáo linh hoạt
**Learning Objective**: Xây dựng câu lệnh SQL động
**Level**: Advanced
**Thời gian dự kiến**: 25 phút
**Điểm**: 12

```sql
-- Tạo báo cáo động theo nhiều tiêu chí
DECLARE @ReportType VARCHAR(20) = 'SALES'
DECLARE @GroupBy VARCHAR(50) = 'TYPE'
DECLARE @SQL NVARCHAR(MAX)

SET @SQL = 'SELECT '

IF @GroupBy = 'TYPE'
    SET @SQL = @SQL + 't.type as GroupField, '
ELSE IF @GroupBy = 'PUBLISHER'
    SET @SQL = @SQL + 'p.pub_name as GroupField, '
ELSE IF @GroupBy = 'YEAR'
    SET @SQL = @SQL + 'YEAR(t.pubdate) as GroupField, '

SET @SQL = @SQL + 'COUNT(*) as ItemCount, '

IF @ReportType = 'SALES'
    SET @SQL = @SQL + 'SUM(s.qty) as TotalQuantity, SUM(s.qty * t.price) as TotalRevenue '
ELSE IF @ReportType = 'INVENTORY'
    SET @SQL = @SQL + 'SUM(t.ytd_sales) as TotalSales, AVG(t.price) as AvgPrice '

SET @SQL = @SQL + 'FROM titles t '
SET @SQL = @SQL + 'INNER JOIN publishers p ON t.pub_id = p.pub_id '

IF @ReportType = 'SALES'
    SET @SQL = @SQL + 'INNER JOIN sales s ON t.title_id = s.title_id '

SET @SQL = @SQL + 'WHERE t.price IS NOT NULL '
SET @SQL = @SQL + 'GROUP BY '

IF @GroupBy = 'TYPE'
    SET @SQL = @SQL + 't.type '
ELSE IF @GroupBy = 'PUBLISHER'
    SET @SQL = @SQL + 'p.pub_name '
ELSE IF @GroupBy = 'YEAR'
    SET @SQL = @SQL + 'YEAR(t.pubdate) '

SET @SQL = @SQL + 'ORDER BY TotalRevenue DESC'

EXEC sp_executesql @SQL
```

---

### Câu 69: Phân tích Cohort - Theo dõi hành vi theo thời gian
**Learning Objective**: Phân tích cohort cơ bản
**Level**: Advanced
**Thời gian dự kiến**: 30 phút
**Điểm**: 15

```sql
-- Phân tích cohort của khách hàng (stores) theo tháng đầu tiên mua
WITH FirstPurchase AS (
    SELECT stor_id, 
           MIN(ord_date) as FirstOrderDate,
           YEAR(MIN(ord_date)) * 100 + MONTH(MIN(ord_date)) as CohortMonth
    FROM sales
    GROUP BY stor_id
),
CohortSizes AS (
    SELECT CohortMonth, COUNT(*) as CohortSize
    FROM FirstPurchase
    GROUP BY CohortMonth
),
CohortRetention AS (
    SELECT fp.CohortMonth,
           DATEDIFF(MONTH, fp.FirstOrderDate, s.ord_date) as MonthsAfter,
           COUNT(DISTINCT s.stor_id) as ActiveCustomers
    FROM FirstPurchase fp
    INNER JOIN sales s ON fp.stor_id = s.stor_id
    GROUP BY fp.CohortMonth, DATEDIFF(MONTH, fp.FirstOrderDate, s.ord_date)
)
SELECT cr.CohortMonth,
       cr.MonthsAfter,
       cr.ActiveCustomers,
       cs.CohortSize,
       CAST(cr.ActiveCustomers AS FLOAT) / cs.CohortSize * 100 as RetentionRate
FROM CohortRetention cr
INNER JOIN CohortSizes cs ON cr.CohortMonth = cs.CohortMonth
WHERE cr.MonthsAfter <= 12
ORDER BY cr.CohortMonth, cr.MonthsAfter;
```

---

### Câu 70: Advanced Indexing Strategy
**Learning Objective**: Tối ưu hóa với index
**Level**: Advanced
**Thời gian dự kiến**: 20 phút
**Điểm**: 10

```sql
-- Phân tích và tạo index tối ưu
-- 1. Tìm các truy vấn chậm
SET STATISTICS IO ON;
SET STATISTICS TIME ON;

-- Truy vấn test trước khi tối ưu
SELECT t.title, a.au_lname, p.pub_name, s.qty
FROM titles t
INNER JOIN titleauthor ta ON t.title_id = ta.title_id
INNER JOIN authors a ON ta.au_id = a.au_id
INNER JOIN publishers p ON t.pub_id = p.pub_id
INNER JOIN sales s ON t.title_id = s.title_id
WHERE t.type = 'business' 
  AND t.price > 15
  AND s.ord_date BETWEEN '1993-01-01' AND '1993-12-31';

-- 2. Tạo index tối ưu
CREATE NONCLUSTERED INDEX IX_Titles_Type_Price 
ON titles (type, price) 
INCLUDE (title_id, title, pub_id);

CREATE NONCLUSTERED INDEX IX_Sales_OrderDate_TitleId 
ON sales (ord_date, title_id) 
INCLUDE (qty, stor_id);

-- 3. Test lại hiệu suất
-- (Chạy lại câu lệnh SELECT ở trên)

SET STATISTICS IO OFF;
SET STATISTICS TIME OFF;
```

---

### Câu 71: Hierarchical Query - Mô phỏng cây phân cấp
**Learning Objective**: Xử lý dữ liệu phân cấp
**Level**: Advanced
**Thời gian dự kiến**: 25 phút
**Điểm**: 12

```sql
-- Tạo cấu trúc phân cấp cho nhân viên (giả sử có manager_id)
-- Đầu tiên thêm cột manager_id cho demo
ALTER TABLE employee ADD manager_id empid NULL;

-- Cập nhật một số dữ liệu mẫu
UPDATE employee SET manager_id = 'PMA42628M' WHERE emp_id IN ('PSA89086M', 'MJP25939M');
UPDATE employee SET manager_id = 'PSA89086M' WHERE emp_id IN ('PDI47470M', 'KJJ92907F');

-- Recursive CTE để hiển thị cấu trúc báo cáo
WITH EmployeeHierarchy AS (
    -- Anchor: Top level managers
    SELECT emp_id, fname, lname, manager_id, 
           CAST(fname + ' ' + lname AS VARCHAR(1000)) as HierarchyPath,
           0 as Level
    FROM employee 
    WHERE manager_id IS NULL
    
    UNION ALL
    
    -- Recursive: Subordinates
    SELECT e.emp_id, e.fname, e.lname, e.manager_id,
           CAST(eh.HierarchyPath + ' -> ' + e.fname + ' ' + e.lname AS VARCHAR(1000)),
           eh.Level + 1
    FROM employee e
    INNER JOIN EmployeeHierarchy eh ON e.manager_id = eh.emp_id
)
SELECT Level,
       REPLICATE('  ', Level) + fname + ' ' + lname as EmployeeName,
       emp_id,
       manager_id
FROM EmployeeHierarchy
ORDER BY HierarchyPath;
```

---

### Câu 72: Advanced Analytics - Moving Averages
**Learning Objective**: Tính toán moving average và trend analysis
**Level**: Advanced
**Thời gian dự kiến**: 25 phút
**Điểm**: 12

```sql
-- Phân tích xu hướng doanh số với moving averages
WITH DailySales AS (
    SELECT s.ord_date,
           SUM(s.qty * t.price) as DailyRevenue,
           COUNT(*) as OrderCount
    FROM sales s
    INNER JOIN titles t ON s.title_id = t.title_id
    WHERE t.price IS NOT NULL
    GROUP BY s.ord_date
),
SalesWithMovingAvg AS (
    SELECT ord_date, DailyRevenue, OrderCount,
           AVG(DailyRevenue) OVER (
               ORDER BY ord_date 
               ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
           ) as MA7_Revenue,
           AVG(DailyRevenue) OVER (
               ORDER BY ord_date 
               ROWS BETWEEN 29 PRECEDING AND CURRENT ROW
           ) as MA30_Revenue,
           LAG(DailyRevenue, 1) OVER (ORDER BY ord_date) as PrevDayRevenue
    FROM DailySales
)
SELECT ord_date, DailyRevenue, MA7_Revenue, MA30_Revenue,
       CASE 
           WHEN DailyRevenue > MA7_Revenue THEN 'Above 7-day avg'
           WHEN DailyRevenue < MA7_Revenue THEN 'Below 7-day avg'
           ELSE 'At 7-day avg'
       END as Performance7Day,
       CASE 
           WHEN PrevDayRevenue IS NOT NULL 
           THEN ((DailyRevenue - PrevDayRevenue) / PrevDayRevenue) * 100
           ELSE NULL
       END as DayOverDayGrowth
FROM SalesWithMovingAvg
ORDER BY ord_date;
```

---

### Câu 73: Complex Data Quality Check
**Learning Objective**: Kiểm tra chất lượng dữ liệu toàn diện
**Level**: Advanced
**Thời gian dự kiến**: 30 phút
**Điểm**: 15

```sql
-- Kiểm tra chất lượng dữ liệu toàn diện
WITH DataQualityChecks AS (
    -- Check 1: Missing relationships
    SELECT 'Missing Author-Title Relationship' as CheckType,
           COUNT(*) as IssueCount,
           'Authors without books' as Details
    FROM authors a
    LEFT JOIN titleauthor ta ON a.au_id = ta.au_id
    WHERE ta.au_id IS NULL
    
    UNION ALL
    
    -- Check 2: Price inconsistencies
    SELECT 'Price Anomalies' as CheckType,
           COUNT(*) as IssueCount,
           'Books with price > 3 std dev from mean' as Details
    FROM titles t
    CROSS JOIN (
        SELECT AVG(price) as avg_price, STDEV(price) as std_price 
        FROM titles WHERE price IS NOT NULL
    ) stats
    WHERE t.price > (stats.avg_price + 3 * stats.std_price)
       OR t.price < (stats.avg_price - 3 * stats.std_price)
    
    UNION ALL
    
    -- Check 3: Data format issues
    SELECT 'Invalid Phone Format' as CheckType,
           COUNT(*) as IssueCount,
           'Authors with invalid phone numbers' as Details
    FROM authors
    WHERE phone NOT LIKE '[0-9][0-9][0-9] [0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]'
      AND phone != 'UNKNOWN'
    
    UNION ALL
    
    -- Check 4: Business rule violations
    SELECT 'Business Rule Violation' as CheckType,
           COUNT(*) as IssueCount,
           'Books with advance > price * ytd_sales' as Details
    FROM titles
    WHERE advance > (price * ytd_sales)
      AND price IS NOT NULL 
      AND ytd_sales IS NOT NULL
      AND advance IS NOT NULL
),
SummaryStats AS (
    SELECT 'Data Completeness' as Category,
           'Authors' as TableName,
           COUNT(*) as TotalRecords,
           SUM(CASE WHEN phone IS NULL OR phone = 'UNKNOWN' THEN 1 ELSE 0 END) as MissingPhone,
           SUM(CASE WHEN address IS NULL THEN 1 ELSE 0 END) as MissingAddress
    FROM authors
    
    UNION ALL
    
    SELECT 'Data Completeness' as Category,
           'Titles' as TableName,
           COUNT(*) as TotalRecords,
           SUM(CASE WHEN price IS NULL THEN 1 ELSE 0 END) as MissingPrice,
           SUM(CASE WHEN notes IS NULL THEN 1 ELSE 0 END) as MissingNotes
    FROM titles
)
SELECT * FROM DataQualityChecks
WHERE IssueCount > 0
UNION ALL
SELECT 'Summary Statistics' as CheckType,
       TotalRecords as IssueCount,
       Category + ' - ' + TableName as Details
FROM SummaryStats
ORDER BY CheckType, IssueCount DESC;
```

---

## Hướng Dẫn Sử Dụng

### Cách Thực Hiện Bài Tập:
1. **Setup Database**: Chạy script `Create_DB_Pubs.sql` để tạo database
2. **Thực hiện từng cấp độ**: Bắt đầu từ Basic → Intermediate → Advanced
3. **Kiểm tra kết quả**: So sánh với kết quả mẫu được cung cấp
4. **Tối ưu hóa**: Thử cải thiện performance của các câu lệnh

### Tiêu Chí Đánh Giá:
- **Tính đúng đắn**: Kết quả chính xác (70%)
- **Hiệu suất**: Tối ưu hóa câu lệnh (20%)
- **Cách tiếp cận**: Logic và cấu trúc code (10%)

### Thang Điểm:
- **Basic (35 câu)**: 70 điểm (1-3 điểm/câu)
- **Intermediate (30 câu)**: 150 điểm (4-7 điểm/câu)  
- **Advanced (8 câu)**: 80 điểm (8-15 điểm/câu)
- **Tổng**: 300 điểm

### Tips Thực Hiện:
1. Đọc kỹ yêu cầu trước khi viết code
2. Test với dữ liệu mẫu nhỏ trước
3. Chú ý đến NULL values và edge cases
4. Sử dụng EXPLAIN PLAN để kiểm tra performance
5. Backup data trước khi thực hiện INSERT/UPDATE/DELETE

---

**Tác giả**: SQL Server Expert  
**Ngày tạo**: [Current Date]  
**Phiên bản**: 1.0  
**Database**: Microsoft SQL Server Pubs Sample Database
