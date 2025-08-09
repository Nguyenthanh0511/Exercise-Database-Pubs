# SQL EXERCISES - BASIC LEVEL (35 Câu)
## Database: Pubs
**Mục tiêu**: Làm quen với cấu trúc database và các truy vấn cơ bản

---

## **Phần 1: Truy vấn đơn giản - SELECT & WHERE (12 câu)**

### **Câu 1: Hiển thị danh sách tác giả**
**Learning Objective**: Làm quen với câu lệnh SELECT cơ bản  
**Level**: Basic  
**Thời gian**: 2 phút | **Điểm**: 1

**Yêu cầu**: Hiển thị tất cả thông tin của tác giả trong bảng `authors`

**Expected Result**: Bảng chứa tất cả cột và dòng dữ liệu từ bảng authors

```sql
-- Your query here
```

---

### **Câu 2: Lọc tác giả theo bang**
**Learning Objective**: Sử dụng mệnh đề WHERE với điều kiện đơn giản  
**Level**: Basic  
**Thời gian**: 3 phút | **Điểm**: 1

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
**Learning Objective**: Sử dụng toán tử so sánh trong WHERE  
**Level**: Basic  
**Thời gian**: 3 phút | **Điểm**: 1

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
**Learning Objective**: Sử dụng toán tử IN  
**Level**: Basic  
**Thời gian**: 3 phút | **Điểm**: 1

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
**Learning Objective**: Làm việc với kiểu dữ liệu bit  
**Level**: Basic  
**Thời gian**: 2 phút | **Điểm**: 1

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
**Learning Objective**: Sử dụng IS NULL  
**Level**: Basic  
**Thời gian**: 3 phút | **Điểm**: 1

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
**Learning Objective**: Sử dụng toán tử LIKE  
**Level**: Basic  
**Thời gian**: 4 phút | **Điểm**: 1

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
**Learning Objective**: WHERE với điều kiện phức tạp  
**Level**: Basic  
**Thời gian**: 3 phút | **Điểm**: 1

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
**Learning Objective**: Làm việc với kiểu dữ liệu datetime  
**Level**: Basic  
**Thời gian**: 4 phút | **Điểm**: 2

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
**Learning Objective**: Sử dụng NOT với WHERE  
**Level**: Basic  
**Thời gian**: 3 phút | **Điểm**: 1

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
**Learning Objective**: Sử dụng BETWEEN với datetime  
**Level**: Basic  
**Thời gian**: 4 phút | **Điểm**: 2

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
**Learning Objective**: Sử dụng AND/OR trong WHERE  
**Level**: Basic  
**Thời gian**: 5 phút | **Điểm**: 2

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
**Learning Objective**: Sử dụng ORDER BY đơn giản  
**Level**: Basic  
**Thời gian**: 2 phút | **Điểm**: 1

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
**Learning Objective**: ORDER BY với kiểu số  
**Level**: Basic  
**Thời gian**: 3 phút | **Điểm**: 1

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
**Learning Objective**: Sử dụng GROUP BY và COUNT  
**Level**: Basic  
**Thời gian**: 4 phút | **Điểm**: 2

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
**Learning Objective**: Sử dụng GROUP BY với AVG  
**Level**: Basic  
**Thời gian**: 5 phút | **Điểm**: 2

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
**Learning Objective**: GROUP BY với điều kiện WHERE  
**Level**: Basic  
**Thời gian**: 4 phút | **Điểm**: 2

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
**Learning Objective**: GROUP BY với SUM  
**Level**: Basic  
**Thời gian**: 5 phút | **Điểm**: 2

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
**Learning Objective**: Sử dụng HAVING với GROUP BY  
**Level**: Basic  
**Thời gian**: 6 phút | **Điểm**: 3

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
**Learning Objective**: Sử dụng MIN và MAX  
**Level**: Basic  
**Thời gian**: 4 phút | **Điểm**: 2

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
**Learning Objective**: Làm quen với INNER JOIN  
**Level**: Basic  
**Thời gian**: 5 phút | **Điểm**: 2

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
**Learning Objective**: Kết hợp JOIN và WHERE  
**Level**: Basic  
**Thời gian**: 6 phút | **Điểm**: 2

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
**Learning Objective**: JOIN nhiều bảng  
**Level**: Basic  
**Thời gian**: 7 phút | **Điểm**: 3

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
**Learning Objective**: JOIN với quan hệ 1-nhiều  
**Level**: Basic  
**Thời gian**: 6 phút | **Điểm**: 2

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
**Learning Objective**: JOIN để phân tích doanh số  
**Level**: Basic  
**Thời gian**: 7 phút | **Điểm**: 3

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
**Learning Objective**: Hiểu về LEFT JOIN  
**Level**: Basic  
**Thời gian**: 8 phút | **Điểm**: 3

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
**Learning Objective**: JOIN phức tạp  
**Level**: Basic  
**Thời gian**: 8 phút | **Điểm**: 3

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
**Learning Objective**: JOIN với GROUP BY  
**Level**: Basic  
**Thời gian**: 7 phút | **Điểm**: 3

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
**Learning Objective**: JOIN với ORDER BY và TOP  
**Level**: Basic  
**Thời gian**: 8 phút | **Điểm**: 3

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
**Learning Objective**: JOIN nhiều bảng với tính toán  
**Level**: Basic  
**Thời gian**: 10 phút | **Điểm**: 4

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
**Learning Objective**: Sử dụng CREATE TABLE  
**Level**: Basic  
**Thời gian**: 8 phút | **Điểm**: 3

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
**Learning Objective**: Sử dụng INSERT  
**Level**: Basic  
**Thời gian**: 6 phút | **Điểm**: 2

**Yêu cầu**: Thêm 3 bản ghi vào bảng `book_reviews` vừa tạo với dữ liệu tùy ý

```sql
-- Your query here
```

---

### **Câu 33: Cập nhật dữ liệu**
**Learning Objective**: Sử dụng UPDATE  
**Level**: Basic  
**Thời gian**: 5 phút | **Điểm**: 2

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

---

### **Câu 35: Xóa dữ liệu có điều kiện**
**Learning Objective**: Sử dụng DELETE với WHERE  
**Level**: Basic  
**Thời gian**: 4 phút | **Điểm**: 2

**Yêu cầu**: Xóa tất cả review có rating < 3 từ bảng `book_reviews`

```sql
-- Your query here
```

---

## **Tổng kết Level Basic**
- **Tổng thời gian**: 180 phút (3 giờ)
- **Tổng điểm**: 70 điểm
- **Kỹ năng chính**: SELECT, WHERE, JOIN, GROUP BY, ORDER BY, DDL/DML cơ bản

**Lưu ý**: Đây là các bài tập cơ bản giúp học viên làm quen với SQL và cấu trúc database Pubs. Không cung cấp đáp án để khuyến khích tự lực giải quyết.
