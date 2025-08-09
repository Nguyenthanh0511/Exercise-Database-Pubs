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

---

## Phần 2: String Functions và Date Functions (Câu 11-15)

### Câu 11
**Level:** Intermediate  
**Yêu cầu:** Hiển thị họ tên đầy đủ của tác giả dưới dạng "Họ, Tên" và độ dài của tên đầy đủ.  
**Expected result:** CONCAT hoặc + operator, LEN function

### Câu 12
**Level:** Intermediate  
**Yêu cầu:** Tìm tất cả sách được xuất bản trong quý 4 của bất kỳ năm nào.  
**Expected result:** Sách có MONTH(pubdate) BETWEEN 10 AND 12

### Câu 13
**Level:** Intermediate  
**Yêu cầu:** Hiển thị title và số năm từ khi xuất bản đến hiện tại.  
**Expected result:** title, DATEDIFF(year, pubdate, GETDATE())

### Câu 14
**Level:** Intermediate  
**Yêu cầu:** Tìm tác giả có địa chỉ email giả định theo format: [tên].[họ]@publisher.com (tạo từ tên và họ).  
**Expected result:** Tạo email format từ au_fname và au_lname

### Câu 15
**Level:** Intermediate  
**Yêu cầu:** Hiển thị title viết hoa chữ cái đầu và thay thế tất cả ký tự 'a' thành '@'.  
**Expected result:** UPPER, REPLACE functions

---

## Phần 3: CASE WHEN và Conditional Logic (Câu 16-20)

### Câu 16
**Level:** Intermediate  
**Yêu cầu:** Tạo báo cáo phân loại sách theo giá: 'Expensive' (>$20), 'Moderate' ($10-$20), 'Cheap' (<$10).  
**Expected result:** title, price, price_category từ CASE WHEN

### Câu 17
**Level:** Intermediate  
**Yêu cầu:** Hiển thị tác giả với trạng thái hợp đồng: 'Has Contract' hoặc 'No Contract'.  
**Expected result:** au_name, contract_status từ CASE

### Câu 18
**Level:** Intermediate  
**Yêu cầu:** Tạo báo cáo doanh số: 'High' (ytd_sales > 10000), 'Medium' (5000-10000), 'Low' (<5000), 'No Sales' (NULL).  
**Expected result:** title, sales_category từ CASE WHEN với NULL handling

### Câu 19
**Level:** Intermediate  
**Yêu cầu:** Phân loại nhân viên theo kinh nghiệm: 'Senior' (>5 năm), 'Mid-level' (2-5 năm), 'Junior' (<2 năm).  
**Expected result:** fname, lname, experience_level từ DATEDIFF và CASE

### Câu 20
**Level:** Intermediate  
**Yêu cầu:** Tạo báo cáo royalty: 'High Royalty' (>15%), 'Standard' (10-15%), 'Low' (<10%).  
**Expected result:** title_id, royalty_category từ titles.royalty

---

## Phần 4: Advanced Aggregations (Câu 21-25)

### Câu 21
**Level:** Intermediate  
**Yêu cầu:** Tính phần trăm doanh số của mỗi sách so với tổng doanh số của nhà xuất bản đó.  
**Expected result:** title, ytd_sales, percentage_of_publisher_sales

### Câu 22
**Level:** Intermediate  
**Yêu cầu:** Hiển thị running total của ytd_sales theo pubdate (sắp xếp theo thời gian).  
**Expected result:** title, pubdate, ytd_sales, running_total

### Câu 23
**Level:** Intermediate  
**Yêu cầu:** Tìm sự chênh lệch giữa giá cao nhất và thấp nhất của mỗi loại sách.  
**Expected result:** type, price_range (MAX - MIN)

### Câu 24
**Level:** Intermediate  
**Yêu cầu:** Tính tổng số tác giả unique đã làm việc với mỗi nhà xuất bản.  
**Expected result:** pub_name, unique_authors_count

### Câu 25
**Level:** Intermediate  
**Yêu cầu:** Hiển thị median price của sách cho mỗi loại sách.  
**Expected result:** type, median_price (sử dụng PERCENTILE_CONT)

---

## Phần 5: Views và Advanced DML (Câu 26-30)

### Câu 26
**Level:** Intermediate  
**Yêu cầu:** Tạo view tên 'author_sales_summary' hiển thị tác giả và tổng doanh số từ tất cả sách của họ.  
**Expected result:** CREATE VIEW statement

### Câu 27
**Level:** Intermediate  
**Yêu cầu:** Cập nhật giá của tất cả sách loại 'business' tăng 10%.  
**Expected result:** UPDATE với calculation

### Câu 28
**Level:** Intermediate  
**Yêu cầu:** Thêm constraint check để đảm bảo giá sách không được âm.  
**Expected result:** ALTER TABLE ADD CONSTRAINT

### Câu 29
**Level:** Intermediate  
**Yêu cầu:** Tạo bảng backup của titles và insert tất cả sách có ytd_sales > 5000.  
**Expected result:** CREATE TABLE + INSERT SELECT

### Câu 30
**Level:** Intermediate  
**Yêu cầu:** Xóa tất cả sales records của những sách không còn trong bảng titles.  
**Expected result:** DELETE với NOT EXISTS subquery

---

## Ghi chú
- Mức trung bình yêu cầu hiểu biết sâu hơn về SQL
- Tập trung vào optimization và business logic
- Sử dụng nhiều function và advanced features
- Cần validate performance với dataset lớn
