create database BANHANG
use BANHANG
go
create table KHACHHANG
(
	MAKH CHAR(4) PRIMARY KEY,
	HOTEN VARCHAR(40),
	DCHI VARCHAR(50),
	SODT VARCHAR(20),
	NGSINH DATETIME,
	NGDK DATETIME,
	DOANHSO INT
)
go
CREATE TABLE NHANVIEN
(
	MANV CHAR(4) PRIMARY KEY,
	HOTEN VARCHAR(40),
	SODT VARCHAR(20),
	NGVL DATETIME,
)
GO
CREATE TABLE SANPHAM
(
	MASP CHAR(4) PRIMARY KEY,
	TENSP VARCHAR(40),
	DVT VARCHAR(20),
	NUOCSX VARCHAR(40),
	GIA int
)
GO
CREATE TABLE HOADON
(
	SOHD INT PRIMARY KEY,
	NGHD DATETIME,
	MAKH CHAR(4),
	MANV CHAR(4),
	TRIGIA int,
	CONSTRAINT FK_MAKH FOREIGN KEY(MAKH) REFERENCES KHACHHANG(MAKH),
	CONSTRAINT FK_MANV FOREIGN KEY(MANV) REFERENCES NHANVIEN(MANV)
)
GO
CREATE TABLE CTHD
(
	SOHD INT,
	MASP CHAR(4),
	SL INT,
	CONSTRAINT FK_SOHD FOREIGN KEY(SOHD) REFERENCES HOADON(SOHD),
	CONSTRAINT FK_MASP FOREIGN KEY(MASP) REFERENCES SANPHAM(MASP)
)
GO
insert into NHANVIEN
values ('NV01','Nguyen Nhu Nhut','0927345678','2006-04-13'),
('NV02','Le Thi Phi Yen','0908777888','2006-04-21'),
('NV03','Nguyen Van B','0906737876','2006-04-27'),
('NV04','Ngo Thanh Tuan','0397646980','2006-06-24'),
('NV05','Nguyen Thi Truc Thanh','0907736366','2006-07-20')

insert into KHACHHANG
values ('KH01','Nguyen Van A','731 Tran Hung Dao, Q5, TpHCM','0344377373','1990-10-20','2006-07-22',13060000),
('KH02','Tran Ngoc Han','235 Nguyen Trai, Q5, TpHCM','0838675573','1977-04-03','2006-07-30',280000),
('KH03','Tran Ngoc Linh','45 Nguyen Canh Chan, Q1, TpHCM','0838345678','1997-05-04','2006-07-11',3860000),
('KH04','Tran Minh Long','30/34 Le Dai Hanh, Q10, TpHCM','0838345573','1966-10-09','2006-10-05',250000),
('KH05','Le Nhat Minh','31 Truong Chinh, Q3, TpHCM','0908377373','2000-12-10','2006-12-11',21000),
('KH06','Le Hoai Thuong','227 Nguyen Van Cu, Q5, TpHCM','0903773373','1998-08-09','2006-10-10',915000),
('KH07','Nguyen Van Tam','32/3 Tran Binh Trong, Q5, TpHCM','3455445666','1993-11-10','2007-12-01',12500),
('KH08','Phan Thi Thanh','45/2 An Duong Vuong, Q5, TpHCM','0292929243','1994-07-10','2007-01-01',365000), 
('KH09','Le Ha Vinh','873 Le Hong Phong, Q5, TpHCM','0908736352','2003-05-09','2007-01-02',70000), 
('KH10','Ha Duy Lap','73 Nguyen Trai, Q1, TpHCM','0907636222','1966-12-11','2007-03-23',67500)
select * from SANPHAM
delete SANPHAM
insert into SANPHAM
values ('BC01', 'But chi', 'cay', 'Singapore', 3000),
('BC02', 'But chi', 'cay', 'Singapore', 5000), 
('BC03', 'But chi', 'cay', 'Viet Nam', 3500),
('BC04', 'But chi', 'hop', 'Viet Nam', 30000),
('BB01', 'But bi', 'cay', 'Viet Nam', 5000),
('BB02', 'But bi', 'cay', 'Trung Quoc', 7000),
('BB03', 'But bi', 'hop', 'Thai Lan', 100000),
('TV01', 'Tap 100 giay mong', 'quyen', 'Trung Quoc', 2500), 
('TV02', 'Tap 200 giay mong', 'quyen', 'Trung Quoc', 4500), 
('TV03', 'Tap 100 giay tot', 'quyen', 'Viet Nam', 3000),
('TV04', 'Tap 200 giay tot', 'quyen', 'Viet Nam', 5500),
('TV05', 'Tap 100 trang', 'chuc', 'Viet Nam', 23000),
('TV06', 'Tap 200 trang', 'chuc', 'Viet Nam', 53000),
('TV07', 'Tap 100 trang', 'chuc', 'Trung Quoc', 34000),
('ST01', 'So tay 500 trang', 'quyen', 'Trung Quoc', 40000),
('ST02', 'So tay loai 1', 'quyen', 'Viet Nam', 55000),
('ST03','So tay loai 2', 'quyen', 'Viet Nam', 51000),
('ST04', 'So tay', 'quyen', 'Thai Lan', 55000),
('ST05', 'So tay mong', 'quyen', 'Thai Lan', 20000),
('ST06', 'Phan viet bang', 'hop', 'Viet Nam', 5000),
('ST07', 'Phan khong bui', 'hop', 'Viet Nam', 7000),
('ST08', 'Bong bang', 'cai', 'Viet Nam', 1000), 
('ST09', 'But long', 'cay', 'Viet Nam', 5000),
('ST10', 'But long', 'cay', 'Trung Quoc', 7000);
select * from HOADON
delete HOADON
INSERT into HOADON
values ('1001', '2006-07-23', 'KH01', 'NV01', 320000),
('1002', '2006-08-12', 'KH01', 'NV02', 840000), 
('1003', '2006-08-23', 'KH02','NV01', 100000),
('1004', '2006-09-01', 'KH02', 'NV01', 180.000),
('1005', '2006-10-20', 'KH01', 'NV02', 3800000),
('1006', '2006-02-16', 'KH01', 'NV03', 2430000), 
('1007', '2006-10-28', 'KH03', 'NV03', 510000),
('1008', '2006-11-1', 'KH01', 'NV03', 440000),
('1009', '2006-11-4', 'KH03', 'NV04', 200000),
('1010', '2006-11-30', 'KH01', 'NV01', 5200000),
('1011', '2006-12-12', 'KH04', 'NV03', 250000),
('1012', '2006-12-31', 'KH05', 'NV03', 21000),
('1013', '2007-01-01', 'KH06', 'NV01', 5000),
('1014', '2007-01-02', 'KH03', 'NV02', 3150000),
('1015', '2007-01-13', 'KH06', 'NV01', 910000),
('1016', '2007-01-13', 'KH07', 'NV02', 12000), 
('1017', '2007-01-14', 'KH08', 'NV03', 35000),
('1018', '2007-01-16', 'KH08', 'NV03', 330000), 
('1019', '2007-01-16', 'KH01', 'NV03', 30000),
('1020', '2007-01-18', 'KH09', 'NV04', 70000),
('1021', '2007-01-17', 'KH10', 'NV03', 67500),
('1022', '2007-01-17', null, 'NV03', 7000),
('1023', '2007-01-17', null, 'NV01', 330000)
SELECT * FROM CTHD
SELECT * FROM SANPHAM
DELETE CTHD
INSERT INTO CTHD
values (1001,'TV01',10),
(1001,'ST01',5),
(1001,'BC01',5),
(1001,'BC02',10),
(1001,'ST08',10),
(1002,'BC04',20),
(1002,'BB01',20),
(1002,'BB02',20),
(1003,'BB03',10),
(1004,'TV01',20),
(1004,'TV02',10),
(1004,'TV03',10),
(1004,'TV04',10),
(1005,'TV05',50),
(1005,'TV06',50),
(1006,'TV07',20)

INSERT INTO CTHD
VALUES (1006,'ST01',30),
(1006,'ST02',20),
(1007,'ST03',10),
(1008,'ST04',8),
(1009,'ST05',10),
(1010,'TV07',50),
(1010,'ST07',50),
(1010,'ST08',100),
(1010,'ST04',50),
(1010,'TV03',100),
(1011,'ST06',50),
(1012,'ST07',3),
(1013,'ST08',5),
(1014,'BC02',80),
(1014,'BB02',100),
(1014,'BC04',60)

INSERT INTO CTHD
VALUES (1014,'BB01',50),
(1015,'BB02',30),
(1015,'BB03',7),
(1016,'TV01',5),
(1017,'TV02',1),
(1017,'TV03',1),
(1017,'TV04',5),
(1018,'ST04',6),
(1019,'ST05',1),
(1019,'ST06',2),
(1020,'ST07',10),
(1021,'ST08',5),
(1021,'TV01',5),
(1021,'TV02',7),
(1022,'ST07',1),
(1023,'ST04',6)

---- CÂU 1:
SELECT * FROM SANPHAM
WHERE NUOCSX='TRUNG QUOC'
---- CÂU 2:
SELECT * FROM SANPHAM
WHERE DVT='CAY' OR DVT='QUYEN'
---- CÂU 3: 
SELECT * FROM SANPHAM
WHERE MASP LIKE 'B%' AND MASP LIKE '%01'
---- CÂU 4: 
SELECT * FROM SANPHAM
WHERE NUOCSX='TRUNG QUOC' AND (GIA BETWEEN 30000 AND 40000)
---- CÂU 5:
SELECT * FROM SANPHAM
WHERE (NUOCSX='TRUNG QUOC' OR NUOCSX='THAI LAN') AND (GIA BETWEEN 30000 AND 40000)
--- CÂU 6:
SELECT * FROM HOADON
WHERE NGHD='2007-01-01' OR NGHD='2007-01-02'
---- CÂU 7:
SELECT * FROM HOADON
WHERE MONTH(NGHD)=1 AND YEAR(NGHD)=2007 
ORDER BY NGHD ASC, TRIGIA DESC
--- CÂU 8: In ra danh sách các khách hàng (MAKH, HOTEN) đã mua hàng trong ngày 1/1/2007.
SELECT K.MAKH, HOTEN, NGHD
FROM KHACHHANG K JOIN HOADON H
ON K.MAKH=H.MAKH
WHERE MONTH(NGHD)=1 AND YEAR(NGHD)=2007 
--- CÂU 9:In ra số hóa đơn, trị giá các hóa đơn do nhân viên có tên “Nguyen Van B” lập trong ngày 28/10/2006.
SELECT N.MANV, N.HOTEN, NGHD, TRIGIA
FROM NHANVIEN N JOIN HOADON H
ON N.MANV=H.MANV
WHERE HOTEN='NGUYEN VAN B' AND NGHD='2006-10-28'
--- CÂU 10: In ra danh sách các sản phẩm (MASP,TENSP) được khách hàng có tên “Nguyen Van A” mua trong tháng 10/2006.
SELECT S.MASP, TENSP, K.MAKH, HOTEN, NGHD
FROM CTHD C JOIN SANPHAM S
ON C.MASP=S.MASP
JOIN HOADON H
ON C.SOHD=H.SOHD 
JOIN KHACHHANG K
ON K.MAKH=H.MAKH
WHERE K.HOTEN='NGUYEN VAN A' AND (YEAR(NGHD)=2006 AND MONTH(NGHD)=10)

--- CÂU 11: Tìm các số hóa đơn đã mua sản phẩm có mã số “BB01” hoặc “BB02”.
SELECT C.SOHD,MASP
FROM CTHD C JOIN HOADON H
ON C.SOHD=H.SOHD
WHERE MASP='BB01' OR MASP='BB02'
--- CÂU 12: Tìm các số hóa đơn đã mua sản phẩm có mã số “BB01” hoặc “BB02”, mỗi sản phẩm mua với số lượng từ 10 đến 20.
SELECT SOHD,MASP, SL
FROM CTHD C 
WHERE (MASP='BB01' OR MASP='BB02') AND (SL BETWEEN 10 AND 20)
---- CÂU 13:  Tìm các số hóa đơn mua cùng lúc 2 sản phẩm có mã số “BB01” và “BB02”, mỗi sản phẩm mua với số lượng từ 10 đến 20.
SELECT A.SOHD
FROM (SELECT SOHD,MASP, SL
FROM CTHD C 
WHERE (MASP='BB01')) A
JOIN (SELECT SOHD,MASP, SL
FROM CTHD C 
WHERE (MASP='BB02')) B
ON A.SOHD=B.SOHD 
WHERE (A.SL BETWEEN 10 AND 20) AND (B.SL BETWEEN 10 AND 20)

---- CÂU 14: In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quoc” sản xuất hoặc các sản phẩm được bán ra trong ngày 1/1/2007.

SELECT DISTINCT S.MASP, TENSP,NUOCSX
FROM SANPHAM S LEFT JOIN CTHD C
ON S.MASP=C.MASP
LEFT JOIN HOADON H 
ON C.SOHD=H.SOHD
WHERE NUOCSX='TRUNG QUOC' OR NGHD='2007-01-01'

---- CÂU 15: In ra danh sách các sản phẩm (MASP,TENSP) không bán được.
SELECT S.MASP,TENSP, NGHD
FROM SANPHAM S LEFT JOIN CTHD C
ON S.MASP=C.MASP
LEFT JOIN HOADON H
ON H.SOHD=C.SOHD
WHERE NGHD IS NULL

SELECT MASP,TENSP
FROM SANPHAM
EXCEPT
SELECT DISTINCT S.MASP,TENSP
FROM SANPHAM S JOIN CTHD C
ON S.MASP=C.MASP


--- CÂU 16: In ra danh sách các sản phẩm (MASP,TENSP) không bán được trong năm 2006.
---------------------------
SELECT S.MASP,TENSP 
FROM SANPHAM S
EXCEPT 
SELECT DISTINCT S.MASP,TENSP
FROM SANPHAM S JOIN CTHD C
ON S.MASP=C.MASP
JOIN HOADON H
ON H.SOHD=C.SOHD
WHERE YEAR(NGHD)=2006
-------------------------
SELECT DISTINCT S.MASP,TENSP,YEAR(NGHD)
FROM SANPHAM S JOIN CTHD C
ON S.MASP=C.MASP
JOIN HOADON H
ON H.SOHD=C.SOHD
WHERE YEAR(NGHD)=2006



---- CÂU 17: In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quoc” sản xuất không bán được trong năm 2006.

SELECT S.MASP,TENSP, NUOCSX
FROM SANPHAM S
WHERE NUOCSX='TRUNG QUOC'
EXCEPT 
SELECT DISTINCT S.MASP,TENSP, NUOCSX
FROM SANPHAM S JOIN CTHD C
ON S.MASP=C.MASP
JOIN HOADON H
ON H.SOHD=C.SOHD
WHERE YEAR(NGHD)=2006 AND NUOCSX='TRUNG QUOC'

SELECT  S.MASP, TENSP,NUOCSX
FROM SANPHAM S JOIN CTHD C
ON S.MASP=C.MASP
JOIN HOADON H
ON H.SOHD=C.SOHD
WHERE NUOCSX='TRUNG QUOC' AND YEAR(NGHD)=2006



---- CÂU 18:Tìm số hóa đơn đã mua tất cả các sản phẩm do Singapore sản xuất.
SELECT SOHD, COUNT(*) 'SỐ LƯỢNG SANPHAM SINGAPORE'
FROM SANPHAM S JOIN CTHD C
ON S.MASP=C.MASP
WHERE NUOCSX='Singapore'
GROUP BY SOHD,NUOCSX --- Ý LÀ ĐOẠN NI TRỞ LÊN LÀ LẤY RA HÓA ĐƠN VỚI SỐ LƯỢNG SẢN PHẨM SING CÓ TRONG HÓA ĐƠN
HAVING COUNT(*)=(SELECT COUNT(*) FROM SANPHAM WHERE NUOCSX='Singapore' GROUP BY NUOCSX)
--- ĐOẠN DƯỚI NI IN RA VỚI ĐIỀU KIỆN SỐ LƯỢNG SẢN PHẨM SING TRONG HÓA ĐƠN PHẢI BẰNG TỔNG SẢN PHẨM CỦA SING SẢN XUẤT 
-- MỚI GỌI LÀ MUA TẤT CẢ


SELECT * FROM CTHD
WHERE MASP='BC01' OR MASP='BC02'
---- CÂU 19:Có bao nhiêu hóa đơn không phải của khách hàng đăng ký thành viên mua?
SELECT COUNT(*)
FROM HOADON
WHERE MAKH IS NULL


--- CÂU 20:Có bao nhiêu sản phẩm khác nhau được bán ra trong năm 2006.
SELECT COUNT(DISTINCT S.MASP)
FROM SANPHAM S JOIN CTHD C
ON S.MASP=C.MASP
JOIN HOADON H
ON H.SOHD=C.SOHD
WHERE YEAR(NGHD)=2006

---KIỂM TRA: 
SELECT DISTINCT MASP, YEAR(NGHD) AS 'YEAR'
FROM CTHD C JOIN HOADON H
ON C.SOHD=H.SOHD
WHERE YEAR(NGHD)=2006

--- CÂU 21:Cho biết trị giá hóa đơn cao nhất, thấp nhất là bao nhiêu ?
SELECT MAX(TRIGIA) AS 'MAX', MIN(TRIGIA) AS 'MIN'
FROM HOADON

--- CÂU 22:Trị giá trung bình của tất cả các hóa đơn được bán ra trong năm 2006 là bao nhiêu?
SELECT 2006 AS 'NĂM', AVG(TRIGIA) 'TRUNG BÌNH'
FROM HOADON H
WHERE YEAR(NGHD)=2006

--- CÂU 23:Tính doanh thu bán hàng trong năm 2006.
SELECT 2006 AS 'NĂM', SUM(TRIGIA) 'DOANH THU'
FROM HOADON H 
WHERE YEAR(NGHD)=2006



--- CÂU 24:Tìm số hóa đơn có trị giá cao nhất trong năm 2006.
SELECT SOHD, TRIGIA 'MAX'
FROM HOADON H
WHERE YEAR(NGHD)=2006 AND TRIGIA=(SELECT MAX(TRIGIA) FROM HOADON WHERE YEAR(NGHD)=2006)

SELECT SOHD, MTRIGIA 'MAX'
FROM HOADON H
WHERE YEAR(NGHD)=2006
--- CÂU 25:Tìm họ tên khách hàng đã mua hóa đơn có trị giá cao nhất trong năm 2006.
SELECT SOHD,K.MAKH,HOTEN, TRIGIA 'MAX'
FROM HOADON H JOIN KHACHHANG K
ON K.MAKH=H.MAKH
WHERE YEAR(NGHD)=2006 AND TRIGIA=(SELECT MAX(TRIGIA) FROM HOADON WHERE YEAR(NGHD)=2006)




--- CÂU 26:In ra danh sách 3 khách hàng (MAKH, HOTEN) có doanh số cao nhất.
SELECT TOP 3 MAKH,HOTEN,DOANHSO
FROM KHACHHANG
ORDER BY DOANHSO DESC
--- CÂU 27:In ra danh sách các sản phẩm (MASP, TENSP) có giá bán bằng 1 trong 3 mức giá cao nhất.
SELECT S.MASP, S.TENSP, S.GIA
FROM SANPHAM S JOIN (SELECT DISTINCT TOP 3 GIA
FROM SANPHAM
ORDER BY GIA DESC) B1
ON S.GIA=B1.GIA

--- CÂU 28:In ra danh sách các sản phẩm (MASP, TENSP) do “Thai Lan” sản xuất có giá bằng 1 trong 3 mức giá cao nhất (của tất cả các sản phẩm).
SELECT S.MASP, S.TENSP, S.GIA
FROM SANPHAM S JOIN (SELECT DISTINCT TOP 3 GIA
FROM SANPHAM
ORDER BY GIA DESC) B1
ON S.GIA=B1.GIA
where NUOCSX='THAI LAN'

--- CÂU 29:In ra danh sách các sản phẩm (MASP, TENSP) do “Trung Quoc” sản xuất có giá bằng 1 trong 3 mức giá cao nhất (của sản phẩm do “Trung Quoc” sản xuất).
SELECT S.MASP, S.TENSP, S.GIA
FROM SANPHAM S JOIN (SELECT DISTINCT TOP 3 GIA
FROM SANPHAM
WHERE NUOCSX='TRUNG QUOC'
ORDER BY GIA desc) B1
ON S.GIA=B1.GIA
where NUOCSX='Trung quoc'
--- CÂU 30:* In ra danh sách 3 khách hàng có doanh số cao nhất (sắp xếp theo kiểu xếp hạng).
SELECT TOP 3 MAKH,HOTEN,DOANHSO
FROM KHACHHANG
ORDER BY DOANHSO DESC



--- CÂU 31:Tính tổng số sản phẩm do “Trung Quoc” sản xuất.
SELECT NUOCSX, COUNT(NUOCSX)
FROM SANPHAM
WHERE NUOCSX='TRUNG QUOC'
GROUP BY NUOCSX

--- CÂU 32:Tính tổng số sản phẩm của từng nước sản xuất.
SELECT NUOCSX, COUNT(NUOCSX)
FROM SANPHAM
GROUP BY NUOCSX
--- CÂU 33:Với từng nước sản xuất, tìm giá bán cao nhất, thấp nhất, trung bình của các sản phẩm.
SELECT NUOCSX, COUNT(NUOCSX) AS 'COUNT', MAX(GIA) 'MAX', MIN(GIA) 'MIN', AVG(GIA) 'AVG'
FROM SANPHAM
GROUP BY NUOCSX

--- CÂU 34:Tính doanh thu bán hàng mỗi ngày.
SELECT format(NGHD, 'dd-MM-yyyy') AS 'NGÀY', SUM(TRIGIA) 'DOANH THU'
FROM HOADON
GROUP BY NGHD

--- CÂU 35:Tính tổng số lượng của từng sản phẩm bán ra trong tháng 10/2006.
SELECT MASP, SUM(SL)
FROM CTHD C JOIN HOADON H
ON C.SOHD=H.SOHD
WHERE YEAR(NGHD)=2006 AND MONTH(NGHD)=10
GROUP BY MASP
--- CÂU 36:Tính doanh thu bán hàng của từng tháng trong năm 2006.
SELECT MONTH(NGHD) 'THANG', SUM(TRIGIA) 'DOANH THU'
FROM HOADON
GROUP BY MONTH(NGHD)

--- CÂU 37:Tìm hóa đơn có mua ít nhất 4 sản phẩm khác nhau.
SELECT SOHD, COUNT(DISTINCT MASP)
FROM CTHD
GROUP BY SOHD
HAVING COUNT(DISTINCT MASP)>=4
--- CÂU 38:Tìm hóa đơn có mua 3 sản phẩm do “Viet Nam” sản xuất (3 sản phẩm khác nhau).
SELECT SOHD, COUNT(DISTINCT C.MASP)
FROM CTHD C JOIN SANPHAM S
ON C.MASP=S.MASP
WHERE NUOCSX='VIET NAM'
GROUP BY SOHD
HAVING COUNT(DISTINCT C.MASP)>=3
--- CÂU 39:Tìm khách hàng (MAKH, HOTEN) có số lần mua hàng nhiều nhất.
SELECT TOP 1 K.MAKH, HOTEN, COUNT(H.MAKH) 'SỐ LẦN MUA'
FROM KHACHHANG K JOIN HOADON H
ON H.MAKH=K.MAKH
GROUP BY K.MAKH, HOTEN
ORDER BY COUNT(H.MAKH) DESC


--- CÂU 40:Tháng mấy trong năm 2006, doanh số bán hàng cao nhất ?
SELECT TOP 1 MONTH(NGHD) 'THANG', SUM(TRIGIA) 'DOANH THU'
FROM HOADON
GROUP BY MONTH(NGHD)
ORDER BY SUM(TRIGIA) DESC

--- CÂU 41: Tìm sản phẩm (MASP, TENSP) có tổng số lượng bán ra thấp nhất trong năm 2006.
 SELECT TOP 1 S.MASP,TENSP, SUM(SL)
 FROM SANPHAM S JOIN CTHD C
 ON S.MASP=C.MASP
 JOIN HOADON H
 ON H.SOHD=C.SOHD
 WHERE YEAR(NGHD)=2006
 GROUP BY S.MASP,TENSP
 ORDER BY SUM(SL) ASC



--- CÂU 42: Mỗi nước sản xuất, tìm sản phẩm (MASP,TENSP) có giá bán cao nhất.

SELECT NUOCSX,MAX(GIA), MASP
FROM SANPHAM
GROUP BY NUOCSX,MASP
-- CÁCH 1
SELECT MASP, TENSP, NUOCSX, GIA
FROM SANPHAM S1
WHERE GIA=(SELECT MAX(GIA) FROM SANPHAM S2 WHERE S2.NUOCSX=S1.NUOCSX)
--- CÁCH 2
SELECT MASP, TENSP, S1.NUOCSX, S1.GIA
FROM SANPHAM S1 JOIN (SELECT NUOCSX,MAX(GIA) AS GIA FROM SANPHAM GROUP BY NUOCSX) S
ON S1.NUOCSX=S.NUOCSX AND S1.GIA=S.GIA

--- CÂU 43:Tìm nước sản xuất sản xuất ít nhất 3 sản phẩm có giá bán khác nhau.
SELECT NUOCSX, COUNT(DISTINCT GIA)
FROM SANPHAM
GROUP BY NUOCSX
HAVING COUNT(DISTINCT GIA)>=3


--- CÂU 44:*Trong 10 khách hàng có doanh số cao nhất, tìm khách hàng có số lần mua hàng nhiều nhất.
SELECT TOP 1 H.MAKH, COUNT(SOHD)
FROM HOADON H JOIN (SELECT TOP 10 * FROM KHACHHANG ORDER BY DOANHSO DESC) B
ON H.MAKH=B.MAKH
GROUP BY H.MAKH
ORDER BY COUNT(SOHD) DESC






SELECT * FROM HOADON
SELECT * FROM CTHD
SELECT * FROM SANPHAM
INSERT INTO SANPHAM
VALUES ('TV08',	'Tap 100 trang','chuc','Trung Quoc',34000)