use NORTHWND
-- 1. Dùng Like hợp lý
select * 
from Employees
where Firstname Like '%N'
-- Cách 2
select * 
from Employees
where Firstname >= 'N'
-- Sử dụng 
-- 2. Dùng index
exec sp_helpindex 'employees'
create index idxFirstname on Employees(Firstname)
drop index idxFirstname on Employees

create index idxFirstname on Employees(Firstname)

Select *
from employees
where Extension = 5467

select * 
from Employees
where FirstName Like 'N%'

create table wecommit_test_index (id int, name varchar(20), salary int);

insert into wecommit_test_index values(3, 'Tran Quoc Huy', 5000);

insert into wecommit_test_index values(2, 'Wecommit', 200);

insert into wecommit_test_index values(1, 'Tran Dinh Huy', 3000);

insert into wecommit_test_index values(4, 'Tran Duc Tuan', 4000);


select * from wecommit_test_index
drop index id_table on wecommit_test_index
create clustered index id_table on wecommit_test_index(id)

SELECT * FROM sys.indexes WHERE name = 'wecommit_test_index.id_table';

--Tối ưu dùng index cho Firstname nó sẽ tìm đúng tên thay vì tìm hết
/*Lưu ý khi dùng :
- Ở các table nhỏ, ít dữ liệu.
- Ở các column ít xuất hiện ở điều kiện trong câu query.
- Ở các column phải cập nhật dữ liệu thường xuyên.*/
--3. Tối ưu hóa bằng union
/*
Dùng union thay vì or : Vì nếu dùng or sẽ tìm kiếm duyệt tất cả bản ghi trong bảng
Sự khác nhau giữa union và union all
-union : giữ các giá trị không trùng lặp
-union all : giữ các giá trị có tr
*/
select EmployeeID
from Employees
where lastname like 'D%'
union all
select EmployeeID from Employees where firstname like 'N%'

--4. Không dùng truy vấn con

--5. Tránh dùng distinct , thay vì đó dùng cột xác định duy nhất một hàng
