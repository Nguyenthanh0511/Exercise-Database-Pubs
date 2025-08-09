# Hướng Dẫn Sử Dụng Bộ Bài Tập SQL Server - Database Pubs

## Cấu Trúc Bộ Bài Tập

### 📁 Files Đã Tạo:
1. **`SQL_Exercise_Overview.md`** - Tổng quan và hướng dẫn chung
2. **`SQL_Exercises_Basic_Level_Detailed.md`** - 35 câu cơ bản
3. **`SQL_Exercises_Intermediate_Level_Detailed.md`** - 30 câu trung bình  
4. **`SQL_Exercises_Advanced_Level_Detailed.md`** - 8 câu nâng cao
5. **`Instructions_Usage_Guide.md`** - File này

---

## 🎯 Phân Bố Kỹ Năng Theo Yêu Cầu

### Cơ Bản (35 câu)
- **80% SELECT Queries (28 câu):**
  - WHERE, ORDER BY (10 câu)
  - Aggregate functions (10 câu) 
  - GROUP BY, HAVING (5 câu)
  - Basic JOINs (5 câu)

- **20% DDL/DML (7 câu):**
  - CREATE TABLE (1 câu)
  - INSERT (1 câu)
  - UPDATE (1 câu)
  - DELETE (1 câu)
  - ALTER TABLE (1 câu)

### Trung Bình (30 câu)
- **80% SELECT Queries (24 câu):**
  - Complex JOINs & Subqueries (10 câu)
  - String & Date functions (5 câu)
  - CASE WHEN statements (5 câu)
  - Advanced aggregations (5 câu)

- **20% DDL/DML (6 câu):**
  - CREATE VIEW (1 câu)
  - Complex UPDATE (1 câu)
  - ADD CONSTRAINT (1 câu)
  - Backup operations (1 câu)
  - Advanced DELETE (1 câu)

### Nâng Cao (8 câu)
- **100% Advanced Queries:**
  - Window functions (4 câu)
  - PIVOT operations (1 câu)
  - CTE & Recursive queries (1 câu)
  - Complex analytics (2 câu)

---

## 📚 Cách Sử Dụng

### Bước 1: Chuẩn Bị
1. Cài đặt SQL Server và tạo database Pubs từ `Create_DB_Pubs.sql`
2. Đọc `SQL_Exercise_Overview.md` để hiểu cấu trúc database
3. Verify data với một vài SELECT queries đơn giản

### Bước 2: Thực Hành Theo Trình Tự
1. **Bắt đầu với Basic Level** - Làm từ câu 1 đến câu 35
2. **Chuyển sang Intermediate** - Khi đã nắm vững 80% basic
3. **Thử thách Advanced** - Khi confident với intermediate

### Bước 3: Validation
- Mỗi câu có mô tả **Expected Result**
- Kiểm tra output format và business logic
- So sánh performance với sample data

---

## 🔧 Database Schema Quick Reference

```sql
-- Core Tables Relationships
authors ←→ titleauthor ←→ titles → publishers
                          ↓
                        sales → stores
                          
employee → jobs
employee → publishers

-- Key Columns for JOINs
authors.au_id = titleauthor.au_id
titles.title_id = titleauthor.title_id  
titles.pub_id = publishers.pub_id
sales.title_id = titles.title_id
sales.stor_id = stores.stor_id
employee.job_id = jobs.job_id
employee.pub_id = publishers.pub_id
```

---

## 💡 Tips Thực Hành

### Cho Beginner:
- Bắt đầu với các câu SELECT đơn giản
- Học cách đọc error messages
- Sử dụng DESCRIBE/sp_help để hiểu table structure
- Practice với sample data nhỏ trước

### Cho Intermediate:
- Focus vào query optimization
- Học cách sử dụng execution plan
- Practice với complex business scenarios
- Hiểu về indexing implications

### Cho Advanced:
- Focus vào performance tuning
- Tư duy về scalability
- Consider memory và CPU usage
- Practice với large datasets

---

## 📊 Sample Learning Path

### Week 1-2: Basic Mastery
- Hoàn thành 35 câu basic
- Target: 30+ câu đúng
- Focus: Syntax và basic concepts

### Week 3-4: Intermediate Skills  
- Hoàn thành 30 câu intermediate
- Target: 25+ câu đúng
- Focus: Business logic và complex queries

### Week 5-6: Advanced Techniques
- Hoàn thành 8 câu advanced
- Target: 6+ câu đúng  
- Focus: Performance và analytics

---

## ⚠️ Lưu Ý Quan Trọng

### Không Làm:
- Không copy-paste solutions từ internet
- Không skip basic level
- Không sử dụng stored procedures  
- Không ignore performance implications

### Nên Làm:
- Đọc kỹ requirements trước khi code
- Test với different data scenarios
- Comment code khi cần thiết
- Validate business logic của kết quả

### Error Handling:
- Handle NULL values appropriately
- Consider edge cases
- Validate data types
- Check for logical errors

---

## 🎓 Evaluation Criteria

### Basic Level:
- ✅ Syntax correctness
- ✅ Result accuracy  
- ✅ Basic optimization

### Intermediate Level:
- ✅ Complex logic implementation
- ✅ Proper JOIN usage
- ✅ Function application
- ✅ Business requirement fulfillment

### Advanced Level:
- ✅ Performance optimization
- ✅ Advanced feature usage
- ✅ Scalable solution design
- ✅ Analytics accuracy

---

## 📞 Support Resources

- **SQL Server Documentation**: Microsoft official docs
- **Execution Plan Analysis**: SQL Server Management Studio
- **Performance Monitoring**: Built-in SQL Server tools
- **Sample Data**: Use existing Pubs database records

**Chúc bạn học tập hiệu quả với bộ bài tập SQL Server Database Pubs!** 🚀
