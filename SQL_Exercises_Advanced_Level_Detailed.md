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

### Câu 6
**Level:** Advanced  
**Yêu cầu:** Sử dụng Common Table Expression (CTE) để tạo hierarchical report của employee-manager relationship (giả sử job_id càng thấp thì level càng cao). Hiển thị cấu trúc tổ chức theo tree format.  
**Expected result:**
- Sử dụng recursive CTE để build hierarchy
- Các cột: level, emp_id, full_name, job_desc, manager_id, path
- level 0 là CEO (job_id = 1), level 1 là direct reports, etc.
- path hiển thị đường dẫn từ CEO đến employee đó
- Ví dụ kết quả:
```
level  emp_id     full_name        job_desc            manager_id  path
0      CEO001     Paolo Accorti    Chief Executive     NULL        CEO001
1      PMA42628M  Paulo Accorti    Marketing Manager   CEO001      CEO001->PMA42628M  
2      PSA89086M  Pedro Afonso     Sales Associate     PMA42628M   CEO001->PMA42628M->PSA89086M
```

---

## Complex Analytics và Performance (Câu 7-8)

### Câu 7
**Level:** Advanced  
**Yêu cầu:** Tạo advanced analytics report để identify "cross-selling opportunities" - tìm những cặp sách thường được bán cùng nhau trong cùng store và cùng thời gian.  
**Expected result:**
- Sử dụng self-join trên sales table
- Các cột: title1, title2, co_occurrence_count, total_sales_title1, total_sales_title2, affinity_score
- affinity_score = co_occurrence_count / MIN(total_sales_title1, total_sales_title2)
- Chỉ hiển thị pairs có co_occurrence_count >= 2
- Sắp xếp theo affinity_score DESC
- Ví dụ kết quả:
```
title1                title2              co_occurrence  affinity_score
The Busy Executive   Computer Phobic     3              0.75
You Can Combat...    Life Without Fear   2              0.40
```

### Câu 8
**Level:** Advanced  
**Yêu cầu:** Tạo comprehensive business intelligence dashboard query sử dụng multiple CTEs và window functions để phân tích performance toàn diện.  
**Expected result:**
Dashboard bao gồm:
1. **Publisher Performance CTE**: Ranking publishers theo revenue, market share
2. **Author Productivity CTE**: Tác giả với productivity metrics (books/year, avg_sales, etc.)
3. **Seasonal Trends CTE**: Phân tích trend theo quarter/month
4. **Final Output**: Kết hợp tất cả metrics thành một comprehensive report

Các cột cuối cùng:
- publisher_rank, pub_name, total_revenue, market_share_pct
- top_author_in_publisher, author_productivity_score  
- best_quarter, seasonal_trend_direction
- growth_rate_yoy, performance_grade (A/B/C/D)

Ví dụ kết quả:
```
pub_rank  pub_name        total_revenue  market_share  top_author      seasonal_trend  performance_grade
1         Binnet & Hardley 44,428        35.2%         Abraham Bennet  Q4_Strong       A
2         Algodata Info    21,132        16.8%         Anne Ringer     Q2_Peak         B
```

---

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
