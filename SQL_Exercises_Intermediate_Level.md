# SQL Exercises - Intermediate Level (Database Pubs)
*30 câu hỏi dành cho người đã nắm vững SQL cơ bản*

---

## 📋 Thông Tin Chung
- **Số lượng bài tập:** 30 câu
- **Độ khó:** Trung bình
- **Tỷ lệ kỹ năng:** 80% SELECT queries / 20% DDL-DML
- **Database:** Pubs (authors, titles, publishers, sales, stores, employee, jobs, etc.)

---

## Phần 1: Complex JOINs và Subqueries (Câu 1-8)

### Câu 1
**Level:** Intermediate  
**Yêu cầu:** Tìm tất cả tác giả chưa viết sách nào. Sử dụng LEFT JOIN để hiển thị thông tin tác giả kèm theo số lượng sách đã viết.  
**Input:** Bảng authors và titleauthor  
**Expected Result:** 
- Các cột: au_id, au_fname, au_lname, city, state, books_count
- books_count = 0 cho những tác giả chưa viết sách
- Sắp xếp theo au_lname

### Câu 2
**Level:** Intermediate  
**Yêu cầu:** Hiển thị title, publisher name và tổng số lượng bán (ytd_sales) của những sách có doanh số cao hơn doanh số trung bình của tất cả sách.  
**Input:** Bảng titles và publishers  
**Expected Result:**
- Các cột: title, pub_name, ytd_sales, avg_all_sales
- Chỉ hiển thị sách có ytd_sales > average ytd_sales
- Sắp xếp theo ytd_sales DESC

### Câu 3
**Level:** Intermediate  
**Yêu cầu:** Tìm nhà xuất bản có nhiều sách nhất. Hiển thị tên nhà xuất bản, số lượng sách và danh sách các loại sách họ xuất bản.  
**Input:** Bảng publishers và titles  
**Expected Result:**
- Các cột: pub_name, total_books, book_types_list
- book_types_list là danh sách các type được nối bằng dấu phẩy
- Chỉ hiển thị publisher có số sách nhiều nhất

### Câu 4
**Level:** Intermediate  
**Yêu cầu:** Hiển thị tên tác giả và số lượng sách họ đã viết, bao gồm cả tác giả chưa viết sách nào. Chỉ hiển thị những tác giả có hợp đồng.  
**Input:** Bảng authors và titleauthor  
**Expected Result:**
- Các cột: au_fname, au_lname, books_written
- books_written = 0 nếu chưa viết sách nào
- Chỉ authors có contract = 1
- Sắp xếp theo books_written DESC

### Câu 5
**Level:** Intermediate  
**Yêu cầu:** Tìm tất cả sách có giá cao hơn sách đắt nhất của loại 'business'. Hiển thị thông tin chi tiết và so sánh với giá reference.  
**Input:** Bảng titles  
**Expected Result:**
- Các cột: title_id, title, type, price, max_business_price, price_difference
- price_difference = price - max_business_price
- Chỉ sách có price > MAX(price WHERE type='business')

### Câu 6
**Level:** Intermediate  
**Yêu cầu:** Hiển thị store name và tổng doanh thu từ mỗi cửa hàng (tính bằng qty * price). Chỉ hiển thị store có doanh thu > $1000.  
**Input:** Bảng stores, sales, titles  
**Expected Result:**
- Các cột: stor_name, total_revenue, total_books_sold
- total_revenue = SUM(qty * price)
- total_books_sold = SUM(qty)
- Chỉ store có total_revenue > 1000

### Câu 7
**Level:** Intermediate  
**Yêu cầu:** Tìm tác giả ở cùng thành phố với ít nhất một nhà xuất bản. Hiển thị thông tin matching và số lượng publishers trong cùng thành phố.  
**Input:** Bảng authors và publishers  
**Expected Result:**
- Các cột: au_fname, au_lname, city, publishers_in_city
- publishers_in_city = số lượng publishers cùng city
- Chỉ authors có city trùng với ít nhất 1 publisher

### Câu 8
**Level:** Intermediate  
**Yêu cầu:** Hiển thị title và số lượng tác giả của mỗi sách. Chỉ hiển thị sách có nhiều hơn 1 tác giả và tính tỷ lệ royalty trung bình.  
**Input:** Bảng titles và titleauthor  
**Expected Result:**
- Các cột: title, authors_count, avg_royalty_per
- avg_royalty_per = trung bình royaltyper của các authors
- Chỉ sách có authors_count > 1

---

## Phần 2: String Functions và Date Functions (Câu 9-13)

### Câu 9
**Level:** Intermediate  
**Yêu cầu:** Hiển thị họ tên đầy đủ của tác giả dưới dạng "Họ, Tên" viết hoa, độ dài tên đầy đủ và initials (VD: "Smith, John" -> "S.J.").  
**Input:** Bảng authors  
**Expected Result:**
- Các cột: full_name_upper, name_length, initials
- full_name_upper = "LASTNAME, FIRSTNAME"
- initials = first letter của last name + "." + first letter của first name + "."

### Câu 10
**Level:** Intermediate  
**Yêu cầu:** Tìm tất cả sách được xuất bản trong quý 4 (tháng 10-12) của bất kỳ năm nào. Hiển thị thông tin và số ngày từ khi xuất bản.  
**Input:** Bảng titles  
**Expected Result:**
- Các cột: title, pubdate, quarter, days_since_published
- quarter = 'Q4'
- days_since_published = số ngày từ pubdate đến hiện tại

### Câu 11
**Level:** Intermediate  
**Yêu cầu:** Hiển thị title và số năm từ khi xuất bản đến hiện tại. Phân loại sách: 'New' (<2 years), 'Recent' (2-5 years), 'Old' (>5 years).  
**Input:** Bảng titles  
**Expected Result:**
- Các cột: title, years_since_published, age_category
- years_since_published = DATEDIFF years từ pubdate đến hiện tại
- age_category theo phân loại trên

### Câu 12
**Level:** Intermediate  
**Yêu cầu:** Tạo địa chỉ email giả định cho tác giả theo format: [firstname].[lastname]@[city].com. Xử lý trường hợp có space trong tên.  
**Input:** Bảng authors  
**Expected Result:**
- Các cột: au_fname, au_lname, city, generated_email
- Replace spaces với underscore
- Convert to lowercase cho email

### Câu 13
**Level:** Intermediate  
**Yêu cầu:** Hiển thị title với định dạng: viết hoa chữ cái đầu mỗi từ, thay thế 'and' thành '&', và đếm số từ trong title.  
**Input:** Bảng titles  
**Expected Result:**
- Các cột: original_title, formatted_title, word_count
- formatted_title = title với format yêu cầu
- word_count = số từ trong title

---

## Phần 3: CASE WHEN và Conditional Logic (Câu 14-18)

### Câu 14
**Level:** Intermediate  
**Yêu cầu:** Tạo báo cáo phân loại sách theo giá và doanh số. Price category: 'Premium' (>$20), 'Standard' ($10-$20), 'Budget' (<$10). Sales category: 'Bestseller' (ytd_sales>10000), 'Popular' (5000-10000), 'Regular' (<5000).  
**Input:** Bảng titles  
**Expected Result:**
- Các cột: title, price, ytd_sales, price_category, sales_category, overall_rating
- overall_rating = combination của price và sales category

### Câu 15
**Level:** Intermediate  
**Yêu cầu:** Hiển thị tác giả với trạng thái chi tiết: contract status, productivity level dựa trên số sách đã viết, và geographic region.  
**Input:** Bảng authors và titleauthor  
**Expected Result:**
- Các cột: au_name, contract_status, productivity_level, geographic_region
- contract_status: 'Active Contract'/'No Contract'
- productivity_level: 'High' (>2 books), 'Medium' (1-2), 'New' (0)
- geographic_region: 'West Coast', 'East Coast', 'Central', 'Other'

### Câu 16
**Level:** Intermediate  
**Yêu cầu:** Tạo báo cáo doanh số với handling NULL values. Sales performance: 'Excellent' (ytd_sales>15000), 'Good' (5000-15000), 'Poor' (<5000), 'No Data' (NULL).  
**Input:** Bảng titles  
**Expected Result:**
- Các cột: title, ytd_sales, sales_performance, needs_attention
- needs_attention = 'YES' nếu sales_performance = 'Poor' hoặc 'No Data'

### Câu 17
**Level:** Intermediate  
**Yêu cầu:** Phân loại nhân viên theo kinh nghiệm và level. Experience: 'Veteran' (>10 years), 'Experienced' (5-10), 'Mid-level' (2-5), 'Junior' (<2). Job level rating dựa trên job_lvl.  
**Input:** Bảng employee  
**Expected Result:**
- Các cột: fname, lname, hire_date, experience_category, job_level_rating, career_stage
- job_level_rating: 'Senior' (>200), 'Mid' (100-200), 'Entry' (<100)
- career_stage = combination of experience và job level

### Câu 18
**Level:** Intermediate  
**Yêu cầu:** Tạo performance matrix cho sách dựa trên royalty rate và advance payment. Tính recommendation score.  
**Input:** Bảng titles  
**Expected Result:**
- Các cột: title, royalty, advance, royalty_rating, advance_rating, recommendation_score
- royalty_rating: 'High' (>15%), 'Standard' (10-15%), 'Low' (<10%)
- advance_rating: 'High' (>$8000), 'Medium' ($5000-$8000), 'Low' (<$5000)
- recommendation_score: 1-10 scale based on ratings

---

## Phần 4: Advanced Aggregations và Window Functions (Câu 19-24)

### Câu 19
**Level:** Intermediate  
**Yêu cầu:** Tính phần trăm contribution của mỗi sách đến tổng doanh số của publisher đó. Hiển thị ranking trong publisher.  
**Input:** Bảng titles và publishers  
**Expected Result:**
- Các cột: pub_name, title, ytd_sales, publisher_total_sales, contribution_percentage, rank_in_publisher
- contribution_percentage = (ytd_sales / publisher_total_sales) * 100

### Câu 20
**Level:** Intermediate  
**Yêu cầu:** Tạo running total của ytd_sales theo publication date. Hiển thị cumulative sales và percentage of grand total.  
**Input:** Bảng titles  
**Expected Result:**
- Các cột: title, pubdate, ytd_sales, running_total, cumulative_percentage
- Sắp xếp theo pubdate
- cumulative_percentage = running_total / grand_total * 100

### Câu 21
**Level:** Intermediate  
**Yêu cầu:** Tính price variance analysis cho mỗi loại sách: min, max, avg, median, standard deviation.  
**Input:** Bảng titles  
**Expected Result:**
- Các cột: type, min_price, max_price, avg_price, median_price, price_std_dev, price_range
- price_range = max_price - min_price
- Sử dụng PERCENTILE_CONT cho median

### Câu 22
**Level:** Intermediate  
**Yêu cầu:** Đếm số tác giả unique đã colaborate với mỗi publisher (thông qua sách). Tính collaboration score.  
**Input:** Bảng authors, titleauthor, titles, publishers  
**Expected Result:**
- Các cột: pub_name, unique_authors_count, total_collaborations, avg_books_per_author, collaboration_score
- total_collaborations = tổng số quan hệ author-title
- collaboration_score = unique_authors / total_books ratio

### Câu 23
**Level:** Intermediate  
**Yêu cầu:** Phân tích sales pattern theo quarter. Tính total sales, average, và growth rate so với quarter trước.  
**Input:** Bảng titles  
**Expected Result:**
- Các cột: publish_quarter, publish_year, total_books, total_sales, avg_sales_per_book, quarter_growth_rate
- publish_quarter = Q1, Q2, Q3, Q4 từ pubdate
- quarter_growth_rate so với quarter trước đó

### Câu 24
**Level:** Intermediate  
**Yêu cầu:** Tạo author productivity report với ranking. So sánh với average productivity trong cùng state.  
**Input:** Bảng authors, titleauthor, titles  
**Expected Result:**
- Các cột: au_name, state, books_count, total_sales, avg_sales_per_book, state_avg_productivity, productivity_vs_state_avg
- productivity_vs_state_avg = 'Above Average', 'Below Average', 'Average'

---

## Phần 5: Views, Advanced DML và Data Management (Câu 25-30)

### Câu 25
**Level:** Intermediate  
**Yêu cầu:** Tạo view tên 'vw_author_performance_summary' hiển thị comprehensive author statistics bao gồm sales metrics và geographic info.  
**Input:** Multiple tables  
**Expected Result:**
```sql
CREATE VIEW vw_author_performance_summary AS
-- View should include: au_id, full_name, total_books, total_sales, 
-- avg_price, best_selling_book, worst_selling_book, geographic_region
```

### Câu 26
**Level:** Intermediate  
**Yêu cầu:** Tạo stored procedure để cập nhật giá sách theo percentage và type. Include error handling và logging.  
**Input:** Parameters: @book_type, @percentage_increase, @effective_date  
**Expected Result:**
- Procedure cập nhật price của books có type = @book_type
- Tăng giá theo @percentage_increase
- Log changes vào audit table
- Return số lượng records affected

### Câu 27
**Level:** Intermediate  
**Yêu cầu:** Bulk update operation: Cập nhật ytd_sales của tất cả sách dựa trên calculated sales từ sales table.  
**Input:** Bảng titles và sales  
**Expected Result:**
- UPDATE titles SET ytd_sales = calculated value
- Calculated value = SUM(qty) từ sales table
- Chỉ update nếu có data trong sales table
- Include verification query

### Câu 28
**Level:** Intermediate  
**Yêu cầu:** Thêm business rules constraints: giá sách không được âm, advance không vượt quá 50% projected revenue (price * projected_sales).  
**Input:** Bảng titles  
**Expected Result:**
```sql
ALTER TABLE titles ADD CONSTRAINT chk_price_positive 
CHECK (price >= 0);

ALTER TABLE titles ADD CONSTRAINT chk_advance_reasonable 
CHECK (advance <= (price * ISNULL(ytd_sales, 1000) * 0.5));
```

### Câu 29
**Level:** Intermediate  
**Yêu cầu:** Tạo backup strategy: Tạo bảng titles_archive và migrate old books (published before 1990) với complete audit trail.  
**Input:** Bảng titles  
**Expected Result:**
- CREATE TABLE titles_archive (same structure + archive_date, archived_by)
- INSERT archived records với metadata
- Verification queries
- Optional: DELETE from original table

### Câu 30
**Level:** Intermediate  
**Yêu cầu:** Data cleanup operation: Xóa orphan records và inconsistent data. Tạo comprehensive cleanup report.  
**Input:** All tables  
**Expected Result:**
- Identify và DELETE titleauthor records không có corresponding titles
- Identify sales records với invalid title_id hoặc stor_id
- Tạo cleanup_report table với details
- Return summary statistics

---

## 📊 Hướng Dẫn Thực Hành

### Prerequisites:
- Đã hoàn thành ít nhất 80% bài tập Basic Level
- Hiểu rõ ERD của database Pubs
- Có kiến thức về window functions cơ bản

### Evaluation Criteria:
1. **Query Correctness** (40%): Logic đúng, syntax chính xác
2. **Performance** (25%): Query optimization, proper indexing usage
3. **Business Logic** (20%): Hiểu và implement đúng requirements
4. **Code Quality** (15%): Readable, maintainable, well-commented

### Tips:
- Sử dụng proper aliases cho readability
- Comment complex logic
- Test với edge cases (NULL values, empty results)
- Consider performance implications
- Validate business logic của results

### Common Pitfalls:
- Không handle NULL values properly
- Cartesian products trong complex JOINs
- Không optimize subqueries
- Ignore data type compatibility
- Missing edge case scenarios

---

*Hoàn thành intermediate level sẽ chuẩn bị tốt cho advanced SQL concepts và real-world database challenges.*