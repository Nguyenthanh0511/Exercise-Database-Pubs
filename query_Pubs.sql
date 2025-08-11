use pubs

-- 1
select *
from authors;

-- 2 Yêu cầu: Hiển thị họ tên và số điện thoại của tác giả sống ở bang 'CA'
select *
from authors
where state = 'CA';

-- 3 Yêu cầu: Hiển thị title_id, title và price của những cuốn sách có giá từ 15 đến 25 đô la
select title_id, title, price
from titles
where price >= 15 and price <= 25

-- 4 Yêu cầu: Hiển thị title và type của những cuốn sách thuộc loại 'business' hoặc 'psychology'
select title, type
from titles
where type in ('business', 'psychology')

-- 5 Yêu cầu: Hiển thị au_id, au_lname, au_fname của những tác giả đã có hợp đồng (contract = 1)
select au_id, au_lname, au_fname
from authors
where contract = 1
