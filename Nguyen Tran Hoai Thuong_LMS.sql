create database LMS
use LMS
go
create table categories
(
	categoryID char(3) not null primary key,
	category_name nvarchar(50),
	moreinfo nvarchar(255)
)
go
create table books
(
	book_id char(6) not null primary key,
	book_name nvarchar(50),
	publisher nvarchar(50),
	author nvarchar(50),
	categoryID char(3) not null,
	num_of_Page int,
	max_days int,
	num_of_Copy int,
	summary nvarchar(255),
	constraint FK_books foreign key(categoryID) references categories(categoryID)
)
go
create table students
(
	card_id char(8) not null primary key,
	student_name nvarchar(30),
	address_ nvarchar(50),
	tel char(11)
)
go
create table receipts
(
	receipt_id int not null primary key,
	card_id char(8) not null,
	book_id char(6) not null,
	date_borrow datetime,
	date_return datetime,
	give_back bit,
	constraint FK_card foreign key(card_id) references students(card_id),
	constraint FK_book foreign key(book_id) references books(book_id)
)
go
alter table receipts add constraint default_date_borrow default getdate() for date_borrow
go
insert into categories
values ('CSD',N'Cơ sở dữ liệu','Access, Oracle'),
('ECO','Ecommerce', N'Sách về thương mại điện tử'),
('GTT',N'Giải thuật',N'Các bài toán mẫu, các giải thuật, cấu trúc dữ liệu'),
('HTT',N'Hệ thống','Windows, Linux, Unix'),
('LTT',N'Ngôn ngữ lập trình','Visual Basic,C,C++,Java'),
('PTK',N'Phân tích và thiết kế',N'Phân tích và thiết kế giải thuật, hệ thống thông tin v.v..'),
('VPP',N'Văn phòng','Word, Excel'),
('WEB','Web','Javascript, Vbscript, HTML, Flash')
go
insert into books
values ('CSD001',N'Cơ sở dữ liệu','NXB Giáo dục','Ðỗ Trung Tấn','CSD',200,3,3,N'Thiết kế CSDL'),
('CSD002','SQL Server 7.0',N'NXB Ðồng Nai','Elicom','CSD',200,3,2,N'Thiết CSDL và sử dụng SQL Server'),
('CSD003','Oracle 8i',N'NXB Giáo dục',N'Trần Tiến Dũng','CSD',500,5,3,N'Từng bước sử dụng Oracle'),
('HTT001','Windows 2000 Professional',N'NXB Giáo dục',N'Anh Thư','HTT',500,3,2,N'Sử dụng Windows 2000'),
('HTT002','Windows 2000 Advanced Server',N'NXB Giáo dục',N'Anh Thư','HTT',500,5,2,N'Sử dụng Windows 2000 Server'),
('LTT001',N'Lập trình visual Basic 6',N'NXB Giáo dục',N'Nguyễn Tiến','LTT',600,3,3,N'Kỹ thuật lập trình Visual Basic'),
('LTT002',N'Ngôn ngữ lập trình c++',N'NXB Thống kê',N'Tăng Ðình Quý','LTT',500,5,3,N'Hướng dẫn lập trình hướng đối tượng và C++'),
('LTT003',N'Lập trình Windows bằng Visual c++',N'NXB Giáo dục',N'Ðặng Văn Ðức','LTT',300,4,3,N'Hướng dẫn từng bước lập trình trên Windows'),
('VPP001',N'Excel Toàn tập',N'NXB Trẻ',N'Ðoàn Công Hùng','VPP',1000,5,4,N'Trình bày mọi vấn đề về Excel'),
('VPP002',N'Word 2000 Toàn tập',N'NXB Trẻ',N'Ðoàn Công Hùng','VPP',1000,4,3,N'Trình bày mọi vấn đề về Word'),
('VPP003',N'Làm kế toán bằng Excel',N'NXB Thống kê','Vu Duy Sanh','VPP',200,5,2,N'Trình bày phương pháp làm kế toán'),
('WEB001','Javascript',N'NXB Trẻ',N'Lê Minh Trí','WEB',200,5,2,N'Từng bước thiết kế Web động'),
('WEB002','HTML',N'NXB Giáo dục',N'Nguyễn Thị Minh Khoa','WEB',100,3,2,N'Từng bước làm quen với WEB')

select * from books
insert into students
values ('STIT0001',N'Vy Văn Việt',N'92-Quang Trung- Đà Nẵng',02363888279),
('STIT0002',N'Nguyễn Khánh',N'92-Quang Trung- Đà Nẵng',02363888279),
('STIT0003',N'Nguyễn Minh Quốc',N'92-Quang Trung- Đà Nẵng',02363888279),
('STIT0004',N'Hồ Phước Thoi',N'92-Quang Trung- Đà Nẵng',02363888279),
('STIT0005',N'Nguyễn Văn Định',N'92-Quang Trung- Đà Nẵng',02363888279),
('STIT0006',N'Nguyễn Văn Hải',N'92-Quang Trung- Đà Nẵng',2363888279),
('STIT0007',N'Nguyễn Thị Thuý Hà',N'92-Quang Trung- Đà Nẵng',02363888279),
('STIT0008',N'Đỗ Thị Thiên Ngân',N'92-Quang Trung- Đà Nẵng',02363888279),
('STIT0009',N'Nguyễn Văn A',N'30- Phan Chu Trinh- Đà Nẵng',0913576890)

insert into receipts
values (1,'STIT0001','CSD001','2021-07-30',null,0),
(2,'STIT0001','LTT001','2021-06-30','2021-07-30',1),
(3,'STIT0002','CSD002','2021-08-15',null,0),
(4,'STIT0002','LTT003','2021-08-10','2021-08-30',1),
(5,'STIT0003','WEB001','2021-07-10','2021-07-20',1),
(6,'STIT0004','HTT001','2021-08-10',null,0),
(7,'STIT0004','HTT002','2021-08-20','2021-08-25',1),
(8,'STIT0006','WEB001','2021-08-30',null,0),
(9,'STIT0006','CSD002','2021-08-10','2021-08-15',1),
(10,'STIT0006','WEB002','2021-07-15','2021-07-20',1),
(11,'STIT0007','VPP001','2021-08-30',null,0),
(12,'STIT0007','VPP003','2021-08-20','2021-08-25',1),
(13,'STIT0008','VPP001','2021-08-30',null,0),
(14,'STIT0009','CSD001','2021-08-20','2021-08-23',1)
--II. Simple Queries: 
---- 1. List all information of books which are in the office Category (CategoryID of office books is “VPP”).
select * from books
where categoryID='VPP'
---- 2. List all receipts which are borrowed in August 2021. (CardID, BookID and borrowdate).
select card_id, book_id, date_borrow
from receipts
where month(date_borrow)=8 and year(date_borrow)=2021
--- 3. List all students who have names starting with “N” and borrowed books.
select receipt_id,s.card_id,student_name,book_id,date_borrow 
from receipts r join students s
on r.card_id=s.card_id
where student_name like '%N'
--- 4. List all the students who borrowed books in July 2021 but have not returned yet.
select receipt_id,s.card_id,student_name,book_id,date_borrow, date_return
from receipts r join students s
on r.card_id=s.card_id
where date_return is null and month(date_borrow)=7 and year(date_borrow)=2021
--- 5. List all information about book name, category name, publisher, author and number of copies of books in the library.
select book_name, category_name, publisher, author, num_of_Copy 
from books b join categories c
on b.categoryID=c.categoryID
--- 6. List all receipts which have not been returned yet and sort the data ascending by borrow date. (Name of student, name of book, borrow date)
select student_name, book_name, date_borrow, date_return
from receipts r join students s
on r.card_id=s.card_id
join books b
on r.book_id=b.book_id
where date_return is null
order by date_borrow asc
--- III. 
--1. List total of books follow category. (CategoryID, Category name and total copy of each category in the library). (8 cuốn sách trong category)
select c.categoryID, category_name, sum(num_of_Copy) as ' total copy of category'
from categories c left join books b
on b.categoryID=c.categoryID
group by c.categoryID, category_name
select * from categories
select distinct book_id from books
--2. List how many students borrow books in August 2021. (đếm số lượng sinh viên)
select count(distinct card_id) as 'So luong'
from receipts
where month(date_borrow)=8 and year(date_borrow)=2021
select * from receipts
---3. List all books which have a number of copies more than the number of copies of books that have BookID is “LTT001”.
select * from books
where num_of_Copy > (select num_of_Copy from books where book_id='LTT001')
---4. List the bookID and number of copy of this in Library (Number of copy in library = number of copy – number of copy student borrow but not return yet)
--- CÁCH 1:
select b.book_id, book_name,num_of_Copy, count(date_return) as 'số lượng mượn đã trả', (num_of_Copy - count(r.date_return))as 'số lượng còn lại'
from books b left join receipts r
on b.book_id=r.book_id
group by b.book_id, book_name,num_of_Copy

select  * from books
where book_id='web001'
select  * from receipts
where book_id='web001'
--- CÁCH 2: 
select b.book_id,num_of_Copy, count(r.book_id) as 'số lượng mượn chưa trả', (num_of_Copy - count(r.book_id)) as 'số lượng còn lại'
from books b join receipts r
on b.book_id=r.book_id
where date_return is null
group by b.book_id,num_of_Copy
union
(select b.book_id,num_of_Copy, 0 as 'số lượng mượn chưa trả', num_of_Copy as 'số lượng còn lại'
from books b 
except 
select r.book_id,num_of_Copy, 0 as 'số lượng mượn chưa trả',num_of_Copy as 'số lượng còn lại'
from books b join receipts r
on b.book_id=r.book_id
where date_return is null)


select * from books
select * from receipts


--- 5. List all books which have a number of borrows greater than the number of copies of this book in the library.


---- cách đúng
select b.book_id, book_name, num_of_Copy, count(date_borrow) as 'so luong muon', (num_of_Copy-(count(date_borrow)-count(r.date_return))) as 'số lượng còn lại'
from receipts r join books b
on b.book_id=r.book_id 
group by b.book_id, book_name, num_of_Copy 
having count(date_borrow)>(num_of_Copy-(count(date_borrow)-count(r.date_return))) 

select * from books
where book_id='csd002'
select * from receipts
where book_id='csd002'




select * from books
where book_id='web001'
select * from receipts
where book_id='web001'
insert into receipts
values (15,'STIT0003','WEB001','2021-07-10','2021-07-20',1)


select * from books
where book_id='vpp001'
select * from receipts
where book_id='vpp001'

---------------------------------------------------

select b.book_id, book_name,num_of_Copy, count(date_return) as 'số lượng mượn đã trả', (count(date_borrow)-count(r.date_return)) as 'số lượng chưa trả'
from books b left join receipts r
on b.book_id=r.book_id
group by b.book_id, book_name,num_of_Copy

select * from books


select b.book_id, book_name,num_of_Copy, count(date_return) as 'số lượng mượn đã trả', (num_of_Copy - count(date_return))as 'số lượng chưa trả'
from books b left join receipts r
on b.book_id=r.book_id
group by b.book_id, book_name,num_of_Copy

select  * from books
where book_id='web001'
select  * from receipts
where book_id='web001'




select a.book_id, a.num_of_Copy, count(a.date_return) as 'đã trả'
from
(select b.book_id, r.receipt_id, r.date_return, num_of_Copy
from books b left join receipts r 
on b.book_id=r.book_id) a 
left join (select book_id, receipt_id, date_return from receipts where date_return is null) c
on a.receipt_id=c.receipt_id
group by a.book_id, a.num_of_Copy
