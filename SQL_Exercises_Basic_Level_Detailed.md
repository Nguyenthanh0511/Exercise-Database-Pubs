# Bài Tập SQL Server - Mức Cơ Bản
*35 câu hỏi dành cho người mới bắt đầu*

---

## Phần 1: SELECT Cơ Bản (Câu 1-10)

### Câu 1
**Level:** Basic  
**Yêu cầu:** Hiển thị tất cả thông tin của các tác giả trong bảng authors.  
**Expected result:** Tất cả các cột từ bảng authors (au_id, au_lname, au_fname, phone, address, city, state, zip, contract)

### Câu 2  
**Level:** Basic  
**Yêu cầu:** Hiển thị tên và họ của tất cả tác giả, sắp xếp theo họ tăng dần.  
**Expected result:** 2 cột au_lname, au_fname được sắp xếp theo au_lname

### Câu 3
**Level:** Basic  
**Yêu cầu:** Hiển thị title_id, title và giá của tất cả sách có giá lớn hơn $15.  
**Expected result:** 3 cột với các cuốn sách có price > 15

### Câu 4
**Level:** Basic  
**Yêu cầu:** Tìm tất cả tác giả sống ở California (state = 'CA').  
**Expected result:** Thông tin tác giả có state = 'CA'

### Câu 5
**Level:** Basic  
**Yêu cầu:** Hiển thị tên nhà xuất bản và thành phố của các nhà xuất bản không ở USA.  
**Expected result:** pub_name, city của publishers có country khác 'USA'

### Câu 6
**Level:** Basic  
**Yêu cầu:** Tìm tất cả sách có loại (type) là 'business'.  
**Expected result:** Thông tin sách có type = 'business'

### Câu 7
**Level:** Basic  
**Yêu cầu:** Hiển thị au_id và phone của tác giả có contract = 1.  
**Expected result:** 2 cột au_id, phone của tác giả có hợp đồng

### Câu 8
**Level:** Basic  
**Yêu cầu:** Tìm tất cả cửa hàng ở California hoặc Washington.  
**Expected result:** Thông tin stores có state = 'CA' hoặc 'WA'

### Câu 9
**Level:** Basic  
**Yêu cầu:** Hiển thị title và pubdate của sách được xuất bản từ năm 1991 trở về sau.  
**Expected result:** 2 cột title, pubdate với pubdate >= '1991-01-01'

### Câu 10
**Level:** Basic  
**Yêu cầu:** Tìm tác giả có họ bắt đầu bằng chữ 'G'.  
**Expected result:** Thông tin tác giả có au_lname LIKE 'G%'

---

## Phần 2: Aggregate Functions (Câu 11-20)

### Câu 11
**Level:** Basic  
**Yêu cầu:** Đếm tổng số tác giả trong bảng authors.  
**Expected result:** 1 số nguyên đại diện cho tổng số tác giả

### Câu 12
**Level:** Basic  
**Yêu cầu:** Tìm giá cao nhất và thấp nhất của sách trong bảng titles.  
**Expected result:** 2 cột MAX(price), MIN(price)

### Câu 13
**Level:** Basic  
**Yêu cầu:** Tính tổng số lượng sách bán được (ytd_sales) của tất cả các sách.  
**Expected result:** 1 số nguyên là tổng ytd_sales

### Câu 14
**Level:** Basic  
**Yêu cầu:** Tính giá trung bình của sách theo từng loại (type).  
**Expected result:** 2 cột type, AVG(price)

### Câu 15
**Level:** Basic  
**Yêu cầu:** Đếm số lượng sách của mỗi nhà xuất bản.  
**Expected result:** 2 cột pub_id, COUNT(*)

### Câu 16
**Level:** Basic  
**Yêu cầu:** Tìm tác giả có số điện thoại khác 'UNKNOWN'.  
**Expected result:** Thông tin tác giả có phone != 'UNKNOWN'

### Câu 17
**Level:** Basic  
**Yêu cầu:** Đếm số lượng nhân viên của mỗi nhà xuất bản.  
**Expected result:** 2 cột pub_id, COUNT(*)

### Câu 18
**Level:** Basic  
**Yêu cầu:** Tìm tổng advance money đã trả cho mỗi loại sách.  
**Expected result:** 2 cột type, SUM(advance)

### Câu 19
**Level:** Basic  
**Yêu cầu:** Hiển thị số lượng job khác nhau trong bảng jobs.  
**Expected result:** 1 số nguyên là COUNT(*) từ jobs

### Câu 20
**Level:** Basic  
**Yêu cầu:** Tìm mức lương tối thiểu và tối đa trong bảng jobs.  
**Expected result:** 2 cột MIN(min_lvl), MAX(max_lvl)

---

## Phần 3: GROUP BY và HAVING (Câu 21-25)

### Câu 21
**Level:** Basic  
**Yêu cầu:** Hiển thị số lượng tác giả theo từng state, chỉ hiển thị state có từ 2 tác giả trở lên.  
**Expected result:** 2 cột state, COUNT(*) với COUNT(*) >= 2

### Câu 22
**Level:** Basic  
**Yêu cầu:** Tìm loại sách có tổng ytd_sales lớn hơn 15000.  
**Expected result:** 2 cột type, SUM(ytd_sales) với SUM(ytd_sales) > 15000

### Câu 23
**Level:** Basic  
**Yêu cầu:** Hiển thị pub_id và số lượng nhân viên, chỉ hiển thị nhà xuất bản có từ 3 nhân viên trở lên.  
**Expected result:** 2 cột pub_id, COUNT(*) với COUNT(*) >= 3

### Câu 24
**Level:** Basic  
**Yêu cầu:** Tìm thành phố có nhiều hơn 1 tác giả.  
**Expected result:** 2 cột city, COUNT(*) với COUNT(*) > 1

### Câu 25
**Level:** Basic  
**Yêu cầu:** Hiển thị job_id và mức lương trung bình của nhân viên, chỉ hiển thị job có mức lương trung bình > 100.  
**Expected result:** 2 cột job_id, AVG(job_lvl) với AVG(job_lvl) > 100

---

## Phần 4: Basic JOINs (Câu 26-30)

### Câu 26
**Level:** Basic  
**Yêu cầu:** Hiển thị title và pub_name của tất cả sách cùng với tên nhà xuất bản.  
**Expected result:** 2 cột title, pub_name từ INNER JOIN titles và publishers

### Câu 27
**Level:** Basic  
**Yêu cầu:** Hiển thị au_fname, au_lname và title của tất cả sách có tác giả.  
**Expected result:** 3 cột từ JOIN authors, titleauthor, titles

### Câu 28
**Level:** Basic  
**Yêu cầu:** Tìm tên nhân viên và tên công việc của họ.  
**Expected result:** fname, lname, job_desc từ JOIN employee và jobs

### Câu 29
**Level:** Basic  
**Yêu cầu:** Hiển thị stor_name và title của tất cả đơn hàng.  
**Expected result:** stor_name, title từ JOIN stores, sales, titles

### Câu 30
**Level:** Basic  
**Yêu cầu:** Tìm tên tác giả và nhà xuất bản của họ thông qua sách đã viết.  
**Expected result:** au_fname, au_lname, pub_name từ JOIN nhiều bảng

---

## Phần 5: DML và DDL Cơ Bản (Câu 31-35)

### Câu 31
**Level:** Basic  
**Yêu cầu:** Tạo bảng temp_authors với cấu trúc tương tự bảng authors nhưng chỉ có các cột: au_id, au_lname, au_fname, city, state.  
**Expected result:** CREATE TABLE statement tạo bảng mới

### Câu 32
**Level:** Basic  
**Yêu cầu:** Insert một tác giả mới vào bảng temp_authors với thông tin: au_id='123-45-6789', au_lname='Nguyen', au_fname='Van', city='Ho Chi Minh', state='VN'.  
**Expected result:** INSERT statement thêm 1 record

### Câu 33
**Level:** Basic  
**Yêu cầu:** Cập nhật phone của tác giả có au_id = '409-56-7008' thành '415 658-0000'.  
**Expected result:** UPDATE statement thay đổi phone

### Câu 34
**Level:** Basic  
**Yêu cầu:** Xóa tất cả tác giả không có hợp đồng (contract = 0) khỏi bảng temp_authors.  
**Expected result:** DELETE statement xóa records có contract = 0

### Câu 35
**Level:** Basic  
**Yêu cầu:** Thêm cột email kiểu varchar(50) vào bảng temp_authors.  
**Expected result:** ALTER TABLE statement thêm cột mới

---

## Ghi chú
- Tất cả câu hỏi trên yêu cầu viết câu lệnh SQL hoàn chỉnh
- Không cung cấp câu trả lời, chỉ mô tả expected result
- Sinh viên cần tự viết và test câu lệnh SQL
- Có thể sử dụng sample data từ database Pubs để verify kết quả
