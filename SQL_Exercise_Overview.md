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

### Phân bố bài tập

| Mức độ | Số lượng | Tỷ lệ kỹ năng | File |
|--------|----------|---------------|------|
| **Cơ bản** | 35 câu | 80% SELECT, 20% DDL/DML | `SQL_Exercises_Basic.md` |
| **Trung bình** | 30 câu | 80% SELECT, 20% DDL/DML | `SQL_Exercises_Intermediate.md` |
| **Nâng cao** | 8 câu | 100% Advanced Queries | `SQL_Exercises_Advanced.md` |

### Kỹ năng được rèn luyện

#### Cơ bản (35 câu)
- SELECT cơ bản với WHERE, ORDER BY
- Aggregate functions (COUNT, SUM, AVG, MIN, MAX)
- GROUP BY và HAVING
- INNER JOIN, LEFT JOIN
- INSERT, UPDATE, DELETE cơ bản
- CREATE TABLE đơn giản

#### Trung bình (30 câu)
- Multiple JOINs phức tạp
- Subqueries trong WHERE, FROM, SELECT
- UNION, INTERSECT, EXCEPT
- Date/Time functions
- String functions
- CASE WHEN statements
- CREATE VIEW, ALTER TABLE

#### Nâng cao (8 câu)
- Window functions (ROW_NUMBER, RANK, DENSE_RANK)
- PIVOT/UNPIVOT
- Complex subqueries và CTEs
- Recursive queries
- Advanced aggregate functions

### Hướng dẫn sử dụng
1. Bắt đầu với bài tập cơ bản để làm quen với cấu trúc database
2. Thực hành từng câu theo thứ tự để tích lũy kiến thức
3. Đọc kỹ yêu cầu và expected result trước khi viết query
4. Kiểm tra kết quả với ví dụ mẫu được cung cấp
5. Chuyển sang mức khó hơn khi đã thành thạo mức hiện tại

### Lưu ý quan trọng
- Không sử dụng stored procedures
- Tập trung vào SQL thuần túy
- Chú ý tối ưu performance cho các query phức tạp
- Luôn validate kết quả với business logic
