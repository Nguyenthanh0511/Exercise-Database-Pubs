# Bộ Bài Tập SQL Server - Database Pubs

## Tổng Quan

### Mục tiêu

- Hiểu rõ cấu trúc database Pubs
- Nắm vững các kỹ thuật truy vấn SQL từ cơ bản đến nâng cao
- Khai thác dữ liệu hiệu quả với các loại JOIN, subquery, window functions

### Cơ sở dữ liệu: Pubs

Database Pubs mô phỏng hệ thống quản lý nhà xuất bản với các bảng chính:

#### Cấu trúc Database

```
authors         - Thông tin tác giả
publishers      - Thông tin nhà xuất bản  
titles          - Thông tin sách
titleauthor     - Quan hệ nhiều-nhiều giữa tác giả và sách
stores          - Thông tin cửa hàng
sales           - Dữ liệu bán hàng
employee        - Thông tin nhân viên
jobs            - Thông tin công việc
roysched        - Lịch trả nhuận bút
discounts       - Thông tin giảm giá
pub_info        - Thông tin chi tiết nhà xuất bản
```

#### Quan hệ chính

- `authors` ←→ `titleauthor` ←→ `titles`
- `titles` → `publishers`
- `sales` → `stores`, `titles`
- `employee` → `publishers`, `jobs`

## **Phần 1: Truy vấn đơn giản - SELECT & WHERE (12 câu)**

### **Câu 1: Hiển thị danh sách tác giả**

**Yêu cầu**: Hiển thị tất cả thông tin của tác giả trong bảng `authors`

**Expected Result**: Bảng chứa tất cả cột và dòng dữ liệu từ bảng authors

```sql
-- Your query here
```

---

### **Câu 2: Lọc tác giả theo bang**

**Yêu cầu**: Hiển thị họ tên và số điện thoại của tác giả sống ở bang 'CA'

**Expected Result**:

```
au_lname    au_fname    phone
----------- ----------- ------------
Johnson     White       408 496-7223
Green       Marjorie    415 986-7020
Carson      Cheryl      415 548-7723
...
```

```sql
-- Your query here
```

---

### **Câu 3: Tìm sách theo giá**

**Yêu cầu**: Hiển thị title_id, title và price của những cuốn sách có giá từ 15 đến 25 đô la

**Expected Result**:

```
title_id  title                    price
--------  ----------------------   -------
BU1032    The Busy Executive...    19.99
BU7832    Straight Talk About...   19.99
...
```

```sql
-- Your query here
```

---

### **Câu 4: Tìm sách theo loại**

**Yêu cầu**: Hiển thị title và type của những cuốn sách thuộc loại 'business' hoặc 'psychology'

**Expected Result**:

```
title                           type
------------------------------- ------------
The Busy Executive's Database   business
Cooking with Computers...       business
Straight Talk About...          business
...
```

```sql
-- Your query here
```

---

### **Câu 5: Tìm tác giả có hợp đồng**

**Yêu cầu**: Hiển thị au_id, au_lname, au_fname của những tác giả đã có hợp đồng (contract = 1)

**Expected Result**:

```
au_id       au_lname     au_fname
----------- ------------ ----------
172-32-1176 White        Johnson
213-46-8915 Green        Marjorie
...
```

```sql
-- Your query here
```

---

### **Câu 6: Tìm sách chưa có giá**

**Yêu cầu**: Hiển thị title_id và title của những cuốn sách chưa có giá (price IS NULL)

**Expected Result**:

```
title_id  title
--------  ------------------------
MC3026    The Psychology of...
PC9999    Net Etiquette
```

```sql
-- Your query here
```

---

### **Câu 7: Tìm theo mẫu tên**

**Yêu cầu**: Hiển thị au_lname và au_fname của tác giả có tên (au_fname) bắt đầu bằng chữ 'A'

**Expected Result**:

```
au_lname     au_fname
------------ ----------
Bennet       Abraham
DeFrance     Anne
...
```

```sql
-- Your query here
```

---

### **Câu 8: Tìm cửa hàng theo thành phố**

**Yêu cầu**: Hiển thị stor_name và city của những cửa hàng ở thành phố 'Seattle' hoặc 'Los Gatos'

**Expected Result**:

```
stor_name                city
------------------------ ----------
Doc-U-Mat: Quality...    Seattle
News & Brews            Los Gatos
```

```sql
-- Your query here
```

---

### **Câu 9: Sách xuất bản trong năm**

**Yêu cầu**: Hiển thị title và pubdate của những cuốn sách được xuất bản trong năm 1991

**Expected Result**:

```
title                          pubdate
------------------------------ -----------
The Busy Executive's Database  1991-06-12
Cooking with Computers...      1991-06-09
...
```

```sql
-- Your query here
```

---

### **Câu 10: Nhà xuất bản nước ngoài**

**Yêu cầu**: Hiển thị pub_name và country của những nhà xuất bản không ở USA

**Expected Result**:

```
pub_name             country
-------------------- ----------
(nếu có dữ liệu)
```

```sql
-- Your query here
```

---

### **Câu 11: Tìm theo khoảng ngày**

**Yêu cầu**: Hiển thị title_id, title của những cuốn sách được xuất bản từ '1990-01-01' đến '1991-12-31'

**Expected Result**:

```
title_id  title
--------  ------------------------------
BU1032    The Busy Executive's Database
PC1035    But Is It User Friendly?
...
```

```sql
-- Your query here
```

---

### **Câu 12: Kết hợp nhiều điều kiện**

**Yêu cầu**: Hiển thị title, type, price của những cuốn sách loại 'business' có giá > 15 hoặc loại 'popular_comp' có giá < 20

**Expected Result**:

```
title                          type          price
------------------------------ ------------- -------
The Busy Executive's Database  business      19.99
Cooking with Computers...      business      11.95
...
```

```sql
-- Your query here
```

---

## **Phần 2: Sắp xếp và nhóm dữ liệu - ORDER BY, GROUP BY (8 câu)**

### **Câu 13: Sắp xếp tác giả**

**Yêu cầu**: Hiển thị au_lname, au_fname của tất cả tác giả, sắp xếp theo họ tăng dần

**Expected Result**:

```
au_lname     au_fname
------------ ----------
Bennet       Abraham
Blotchet-Halls Reginald
Carson       Cheryl
...
```

```sql
-- Your query here
```

---

### **Câu 14: Sắp xếp sách theo giá**

**Yêu cầu**: Hiển thị title, price của các cuốn sách có giá, sắp xếp theo giá giảm dần

**Expected Result**:

```
title                          price
------------------------------ -------
But Is It User Friendly?       22.95
Secrets of Silicon Valley      20.00
...
```

```sql
-- Your query here
```

---

### **Câu 15: Đếm số sách theo loại**

**Yêu cầu**: Đếm số lượng sách theo từng loại (type)

**Expected Result**:

```
type          book_count
------------- -----------
business      4
mod_cook      2
popular_comp  3
...
```

```sql
-- Your query here
```

---

### **Câu 16: Tính giá trung bình theo nhà xuất bản**

**Yêu cầu**: Tính giá trung bình của sách theo từng nhà xuất bản (pub_id)

**Expected Result**:

```
pub_id  avg_price
------  -----------
0736    14.77
0877    15.41
...
```

```sql
-- Your query here
```

---

### **Câu 17: Đếm tác giả theo bang**

**Yêu cầu**: Đếm số lượng tác giả theo từng bang (state), chỉ tính những tác giả có hợp đồng

**Expected Result**:

```
state  author_count
-----  ------------
CA     15
IN     1
...
```

```sql
-- Your query here
```

---

### **Câu 18: Tìm tổng doanh số theo cửa hàng**

**Yêu cầu**: Tính tổng số lượng sách bán được (qty) theo từng cửa hàng (stor_id)

**Expected Result**:

```
stor_id  total_qty
-------  ---------
6380     125
7066     90
...
```

```sql
-- Your query here
```

---

### **Câu 19: Lọc nhóm với HAVING**

**Yêu cầu**: Hiển thị type và số lượng sách của những loại sách có hơn 2 cuốn

**Expected Result**:

```
type          book_count
------------- -----------
business      4
popular_comp  3
```

```sql
-- Your query here
```

---

### **Câu 20: Giá cao nhất và thấp nhất**

**Yêu cầu**: Tìm giá cao nhất và thấp nhất của tất cả sách

**Expected Result**:

```
max_price  min_price
---------  ---------
22.95      2.99
```

```sql
-- Your query here
```

---

## **Phần 3: JOIN cơ bản (10 câu)**

### **Câu 21: JOIN hai bảng đơn giản**

**Yêu cầu**: Hiển thị title và pub_name của tất cả sách cùng với tên nhà xuất bản

**Expected Result**:

```
title                          pub_name
------------------------------ --------------------
The Busy Executive's Database  New Moon Books
Cooking with Computers...      Binnet & Hardley
...
```

```sql
-- Your query here
```

---

### **Câu 22: JOIN với điều kiện**

**Yêu cầu**: Hiển thị title, pub_name của những cuốn sách loại 'business'

**Expected Result**:

```
title                          pub_name
------------------------------ --------------------
The Busy Executive's Database  New Moon Books
Cooking with Computers...      Binnet & Hardley
...
```

```sql
-- Your query here
```

---

### **Câu 23: JOIN ba bảng**

**Yêu cầu**: Hiển thị title, au_lname, au_fname của tất cả sách cùng với tác giả

**Expected Result**:

```
title                          au_lname     au_fname
------------------------------ ------------ ----------
The Busy Executive's Database  Green        Marjorie
The Busy Executive's Database  Bennet       Abraham
...
```

```sql
-- Your query here
```

---

### **Câu 24: Thông tin cửa hàng và đơn hàng**

**Yêu cầu**: Hiển thị stor_name, ord_num, ord_date của tất cả đơn hàng

**Expected Result**:

```
stor_name                ord_num              ord_date
------------------------ -------------------- -----------
Eric the Read Books      6871                1994-09-14
Barnum's                 BA27618             1994-09-13
...
```

```sql
-- Your query here
```

---

### **Câu 25: Sách và doanh số**

**Yêu cầu**: Hiển thị title, qty, ord_date của tất cả giao dịch bán sách

**Expected Result**:

```
title                    qty  ord_date
------------------------ ---  -----------
The Busy Executive's...  5    1994-09-14
Cooking with Computers   3    1994-09-13
...
```

```sql
-- Your query here
```

---

### **Câu 26: LEFT JOIN - Sách chưa bán**

**Yêu cầu**: Hiển thị title_id, title của tất cả sách, kể cả những sách chưa được bán

**Expected Result**:

```
title_id  title                    has_sales
--------  ----------------------   ---------
BU1032    The Busy Executive's...  Yes
MC3026    The Psychology of...     NULL
...
```

```sql
-- Your query here
```

---

### **Câu 27: Thông tin đầy đủ tác giả-sách**

**Yêu cầu**: Hiển thị au_lname, au_fname, title, royaltyper của tất cả mối quan hệ tác giả-sách

**Expected Result**:

```
au_lname     au_fname    title                    royaltyper
------------ ----------  ----------------------   ----------
Green        Marjorie    The Busy Executive's...  40
Bennet       Abraham     The Busy Executive's...  60
...
```

```sql
-- Your query here
```

---

### **Câu 28: Nhà xuất bản và số sách**

**Yêu cầu**: Đếm số lượng sách của từng nhà xuất bản

**Expected Result**:

```
pub_name             book_count
-------------------- -----------
New Moon Books       8
Binnet & Hardley     6
...
```

```sql
-- Your query here
```

---

### **Câu 29: Tác giả nhiều sách nhất**

**Yêu cầu**: Hiển thị 3 tác giả có nhiều sách nhất (au_lname, au_fname, số lượng sách)

**Expected Result**:

```
au_lname     au_fname    book_count
------------ ----------  -----------
Ringer       Anne        3
Ringer       Albert      2
...
```

```sql
-- Your query here
```

---

### **Câu 30: Doanh thu theo nhà xuất bản**

**Yêu cầu**: Tính tổng doanh thu (qty * price) theo từng nhà xuất bản

**Expected Result**:

```
pub_name             total_revenue
-------------------- -------------
New Moon Books       1234.50
Binnet & Hardley     2345.25
...
```

```sql
-- Your query here
```

---

## **Phần 4: DDL/DML Cơ bản (5 câu)**

### **Câu 31: Tạo bảng mới**

**Yêu cầu**: Tạo bảng `book_reviews` với các cột:

- review_id (int, primary key, identity)
- title_id (varchar(6), foreign key tham chiếu titles)
- reviewer_name (varchar(50), not null)
- rating (tinyint, 1-5)
- review_date (datetime, default getdate())
- comments (varchar(500))

```sql
-- Your query here
```

---

### **Câu 32: Thêm dữ liệu**

**Yêu cầu**: Thêm 3 bản ghi vào bảng `book_reviews` vừa tạo với dữ liệu tùy ý

```sql
-- Your query here
```

---

### **Câu 33: Cập nhật dữ liệu**

**Yêu cầu**: Tăng giá tất cả sách loại 'business' lên 10%

```sql
-- Your query here
```

---

### **Câu 34: Thêm cột mới**

**Learning Objective**: Sử dụng ALTER TABLE
**Level**: Basic
**Thời gian**: 5 phút | **Điểm**: 2

**Yêu cầu**: Thêm cột `email` (varchar(100)) vào bảng `authors`

```sql
-- Your query here
```



# Bài Tập SQL Server - Mức Trung Bình

*30 câu hỏi cho người đã có kinh nghiệm cơ bản*

---

## Phần 1: Complex JOINs và Subqueries (Câu 1-10)

### Câu 1

**Level:** Intermediate

**Yêu cầu:** Tìm tất cả tác giả chưa viết sách nào (sử dụng LEFT JOIN).

**Expected result:** Thông tin tác giả không có trong titleauthor

### Câu 2

**Level:** Intermediate

**Yêu cầu:** Hiển thị title, publisher name và tổng số lượng bán (ytd_sales) của những sách có doanh số cao hơn trung bình.

**Expected result:** 3 cột với ytd_sales > (subquery AVG)

### Câu 3

**Level:** Intermediate

**Yêu cầu:** Tìm nhà xuất bản có nhiều sách nhất.

**Expected result:** pub_name của publisher có COUNT(titles) cao nhất

### Câu 4

**Level:** Intermediate

**Yêu cầu:** Hiển thị tên tác giả và số lượng sách họ đã viết, bao gồm cả tác giả chưa viết sách nào.

**Expected result:** au_fname, au_lname, COUNT(titles) từ LEFT JOIN

### Câu 5

**Level:** Intermediate

**Yêu cầu:** Tìm tất cả sách có giá cao hơn sách đắt nhất của loại 'business'.

**Expected result:** Thông tin sách có price > MAX(price WHERE type='business')

### Câu 6

**Level:** Intermediate

**Yêu cầu:** Hiển thị store name và tổng doanh thu từ mỗi cửa hàng (qty * price).

**Expected result:** stor_name, SUM(qty * price) từ JOIN stores, sales, titles

### Câu 7

**Level:** Intermediate

**Yêu cầu:** Tìm tác giả ở cùng thành phố với ít nhất một nhà xuất bản.

**Expected result:** Thông tin authors có city trùng với publishers.city

### Câu 8

**Level:** Intermediate

**Yêu cầu:** Hiển thị title và số lượng tác giả của mỗi sách có nhiều hơn 1 tác giả.

**Expected result:** title, COUNT(authors) với COUNT > 1

### Câu 9

**Level:** Intermediate

**Yêu cầu:** Tìm nhân viên có mức lương cao nhất trong mỗi nhà xuất bản.

**Expected result:** fname, lname, pub_id, job_lvl cho mỗi publisher

### Câu 10

**Level:** Intermediate

**Yêu cầu:** Hiển thị pub_name và tổng advance money đã trả, chỉ hiển thị publisher đã trả advance > $50,000.

**Expected result:** pub_name, SUM(advance) với SUM > 50000

## Phần 4: Advanced Aggregations (Câu 21-25)

### Câu 11

**Level:** Intermediate

**Yêu cầu:** Tính phần trăm doanh số của mỗi sách so với tổng doanh số của nhà xuất bản đó.

**Expected result:** title, ytd_sales, percentage_of_publisher_sales

### Câu 12

**Level:** Intermediate

**Yêu cầu:** Hiển thị running total của ytd_sales theo pubdate (sắp xếp theo thời gian).

**Expected result:** title, pubdate, ytd_sales, running_total

### Câu 13

**Level:** Intermediate

**Yêu cầu:** Tìm sự chênh lệch giữa giá cao nhất và thấp nhất của mỗi loại sách.

**Expected result:** type, price_range (MAX - MIN)

### Câu 14

**Level:** Intermediate

**Yêu cầu:** Tính tổng số tác giả unique đã làm việc với mỗi nhà xuất bản.

**Expected result:** pub_name, unique_authors_count

### Câu 15

**Level:** Intermediate
**Yêu cầu:** Hiển thị median price của sách cho mỗi loại sách.
**Expected result:** type, median_price (sử dụng PERCENTILE_CONT)

---

## Phần 5: Advanced DML (Câu 26-30)


### Câu 16

Level: Intermediate

Yêu cầu: Tạo view tên 'author_sales_summary' hiển thị tác giả và tổng doanh số từ tất cả sách của họ.

Expected result: CREATE VIEW statement

### Câu 17

**Level:** Intermediate

**Yêu cầu:** Thêm constraint check để đảm bảo giá sách không được âm.

**Expected result:** ALTER TABLE ADD CONSTRAINT



# Bài Tập SQL Server - Mức Nâng Cao

*8 câu hỏi thử thách cho chuyên gia SQL*

---

## Window Functions và Advanced Analytics (Câu 1-4)

### Câu 1

**Level:** Advanced

**Yêu cầu:** Sử dụng ROW_NUMBER() để ranking sách theo ytd_sales trong mỗi loại sách, đồng thời hiển thị lag và lead values của ytd_sales.

**Expected result:**

- Các cột: type, title, ytd_sales, rank_in_type, prev_sales, next_sales
- Ranking theo ytd_sales DESC trong từng type
- prev_sales là ytd_sales của sách có rank trước đó
- next_sales là ytd_sales của sách có rank tiếp theo
- Ví dụ kết quả:

```
type        title                    ytd_sales  rank_in_type  prev_sales  next_sales
business    The Busy Executive      4095       1             NULL        3876
business    Cooking with Computer   3876       2             4095        2032
psychology  You Can Combat...       9564       1             NULL        7896
```

### Câu 2

**Level:** Advanced

**Yêu cầu:** Tạo báo cáo phân tích cohort của tác giả theo năm xuất bản sách đầu tiên. Sử dụng DENSE_RANK() để xếp hạng tác giả theo tổng ytd_sales trong mỗi cohort.

**Expected result:**

- Các cột: first_publish_year, author_cohort_rank, au_fname, au_lname, total_sales, books_count
- Cohort được xác định bởi năm xuất bản sách đầu tiên của tác giả
- Ranking theo tổng ytd_sales trong từng cohort
- Ví dụ kết quả:

```
first_publish_year  cohort_rank  au_fname   au_lname    total_sales  books_count
1991               1            Marjorie   Green       22246        2
1991               2            Abraham    Bennet      18722        1
1992               1            Cheryl     Carson      4095         1
```

### Câu 3

**Level:** Advanced

**Yêu cầu:** Tính running percentage của doanh số tích lũy theo publisher. Sử dụng window function để tính phần trăm doanh số tích lũy so với tổng doanh số của publisher đó.

**Expected result:**

- Các cột: pub_name, title, ytd_sales, running_total, running_percentage
- Sắp xếp theo ytd_sales DESC trong mỗi publisher
- running_percentage = running_total / total_publisher_sales * 100
- Ví dụ kết quả:

```
pub_name            title                running_total  running_percentage
Algodata Infosystems You Can Combat...   9564          45.2%
Algodata Infosystems Life Without Fear   7896          82.6%
Algodata Infosystems Emotional Security  3672          100.0%
```

### Câu 4

**Level:** Advanced

**Yêu cầu:** Sử dụng window functions để tìm "outliers" trong doanh số - những sách có ytd_sales lệch khỏi median hơn 2 standard deviations trong cùng loại sách.

**Expected result:**

- Các cột: type, title, ytd_sales, median_sales, std_dev, deviation_from_median, is_outlier
- is_outlier = 'YES' nếu |ytd_sales - median| > 2 * std_dev
- Sử dụng PERCENTILE_CONT và STDEV

---

## PIVOT, CTE và Recursive Queries (Câu 5-6)

### Câu 5

**Level:** Advanced

**Yêu cầu:** Tạo pivot table hiển thị ma trận tác giả vs loại sách, với values là số lượng sách mỗi tác giả viết cho mỗi loại.

**Expected result:**

- Rows: au_fname + au_lname
- Columns: type (business, psychology, popular_comp, mod_cook, trad_cook, UNDECIDED)
- Values: số lượng sách
- NULL values hiển thị là 0
- Ví dụ kết quả:

```
Author Name          business  psychology  popular_comp  mod_cook  trad_cook  UNDECIDED
Abraham Bennet       1         0           0             0         0          0
Marjorie Green       1         0           1             0         0          0
Cheryl Carson        1         0           0             0         0          0
```


## Ghi chú Quan Trọng

### Yêu cầu Kỹ Thuật:

- Tất cả queries phải được optimize cho performance
- Sử dụng proper indexing strategy (chỉ mô tả, không implement)
- Handle NULL values appropriately
- Use meaningful aliases và comments

### Evaluation Criteria:

- **Correctness**: Logic và syntax chính xác
- **Performance**: Query execution plan hiệu quả
- **Readability**: Code dễ đọc và maintain
- **Business Logic**: Kết quả có ý nghĩa business

### Advanced Features Required:

- Window Functions: ROW_NUMBER, RANK, DENSE_RANK, LAG, LEAD
- Aggregate Window Functions: SUM() OVER, AVG() OVER
- Statistical Functions: PERCENTILE_CONT, STDEV
- PIVOT/UNPIVOT operations
- Common Table Expressions (CTEs)
- Recursive Queries
- Complex subqueries và correlated subqueries

Những bài tập này đòi hỏi hiểu biết sâu về SQL Server và khả năng tư duy phân tích dữ liệu phức tạp.



### Câu 18

Level: Intermediate
Yêu cầu: Xóa tất cả sales records của những sách không còn trong bảng titles.
Expected result: DELETE với NOT EXISTS subquery
