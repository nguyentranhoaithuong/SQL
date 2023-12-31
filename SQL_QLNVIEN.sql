﻿CREATE DATABASE QLNVIEN
GO 
DROP TABLE PHONGBAN
CREATE TABLE PHONGBAN
(
	MAPHONG VARCHAR(8),
	TENPHONG VARCHAR(100),
	TRUONGPHONG VARCHAR(8),
	NGAYNHANCHUC DATETIME,
	CONSTRAINT PK_PHONGBAN PRIMARY KEY(MAPHONG),
	CONSTRAINT UQ_PB_TP UNIQUE(TENPHONG),
	CONSTRAINT CHK_NGNC CHECK (NGAYNHANCHUC<=GETDATE())
)
GO
CREATE TABLE NHANVIEN
(
	MANV VARCHAR(8),
	HONV NVARCHAR(50),
	TENLOT NVARCHAR(50),
	TENNV NVARCHAR(50),
	NGAYSINH DATETIME,
	PHAI VARCHAR(5),
	DIACHI NVARCHAR(100),
	MUCLUONG FLOAT DEFAULT 1500000,
	MANQL VARCHAR(8),
	PHONG VARCHAR(8),
	CONSTRAINT PK_NV PRIMARY KEY(MANV),
	CONSTRAINT CHK_NGSINH CHECK (YEAR(GETDATE())-YEAR(NGAYSINH)>=15),
	CONSTRAINT CHK_PHAI CHECK (PHAI='NU' OR PHAI='NAM' OR PHAI='KHAC'),
	CONSTRAINT FK_MANQL FOREIGN KEY (MANQL) REFERENCES NHANVIEN(MANV),
	CONSTRAINT FK_PHONG FOREIGN KEY (PHONG) REFERENCES PHONGBAN(MAPHONG)
)
GO
ALTER TABLE PHONGBAN ADD CONSTRAINT FK_PB_TP FOREIGN KEY(TRUONGPHONG) REFERENCES NHANVIEN(MANV)
ALTER TABLE PHONGBAN DROP CONSTRAINT FK_PB_TP
CREATE TABLE THANNHAN
(
	MATN VARCHAR(8) not null,
	MANV VARCHAR(8) not null,
	TENTN VARCHAR(50),
	PHAI VARCHAR(5),
	NGSINH DATETIME,
	QUANHE NVARCHAR(30)
)
CREATE TABLE DEAN
(
	MADA VARCHAR(8),
	MAPHONG VARCHAR(8),
	TENDA NVARCHAR(50),
	DIADIEM_DA VARCHAR(100),
	NGBD_DK DATETIME,
	NGKT_DK DATETIME,
	CONSTRAINT PK_DEAN PRIMARY KEY(MADA),
	CONSTRAINT FK_DEAN_MP FOREIGN KEY(MAPHONG) REFERENCES PHONGBAN(MAPHONG),
	CONSTRAINT CHK_NGAYDEAN CHECK (DATEDIFF(DAY,NGBD_DK,NGKT_DK)>0)
)
GO
CREATE TABLE PHANCONG
(
	MANV VARCHAR(8) NOT NULL,
	MADA VARCHAR(8) NOT NULL,
	THOIGIAN FLOAT
)
GO
DROP TABLE PHANCONG
CREATE TABLE DIADIEMPHONG
(
	MAPHONG VARCHAR(8) NOT NULL,
	DIADIEM VARCHAR(30) NOT NULL,
)
GO
DROP TABLE DIADIEMPHONG
--NHAP BANG PHONG BAN
INSERT INTO NHANVIEN(MANV)
VALUES ('001'),('002'),('003'),('004'),('005'),('006'),('007'),('008')
INSERT INTO PHONGBAN
VALUES ('QL','QuanLy','001','2000-05-22')
INSERT INTO PHONGBAN
VALUES ('DH','Dieu Hanh','003','2002-10-10'),
('NC','Nghien Cuu','002','2002-03-15')

SELECT * FROM PHONGBAN
SELECT * FROM NHANVIEN

--NHẬP BẢNG NHANVIEN
UPDATE NHANVIEN
SET HONV='Vuong', TENLOT='Ngoc', TENNV='Quyen', NGAYSINH='1957-10-22', PHAI='NU', DIACHI='450 Trung Vuong, Ha Noi', MUCLUONG=3000000, PHONG='QL'
WHERE MANV='001'
UPDATE NHANVIEN
SET HONV='Nguyen',TENLOT='Thanh',TENNV= 'Tung',NGAYSINH='1955-01-09',PHAI='Nam',DIACHI='731 Tran Hung Dao, Q1, TpHCM',MANQL='001',MUCLUONG=2500000,PHONG='NC'
WHERE MANV='002'
UPDATE NHANVIEN
SET HONV='Le',TENLOT='Thi',TENNV='Nhan',NGAYSINH='1960-12-18',PHAI='Nu',DIACHI='219 Ho Van Hue, QPN, TpHCM',MANQL='001',MUCLUONG=2500000,PHONG='DH'
WHERE MANV='003'
UPDATE NHANVIEN
SET HONV='Dinh',TENLOT='Ba',TENNV='Tien',NGAYSINH='1968-01-19',PHAI='Nam',DIACHI='638 Nguyen Van Cu, Q5, TpHCM',MANQL='002',MUCLUONG=2200000,PHONG='NC'
WHERE MANV='004'
UPDATE NHANVIEN
SET HONV='Bui',TENLOT='Thuy',TENNV='Vu',NGAYSINH='1972-07-19',PHAI='Nam',DIACHI='332 Nguyen Thai Hoc, Q1, TpHCM',MANQL='003',MUCLUONG=2200000,PHONG='DH'
WHERE MANV='005'
UPDATE NHANVIEN
SET HONV='Nguyen',TENLOT='Manh',TENNV='Hung',NGAYSINH='1973-09-15',PHAI='Nam',DIACHI='978 Ba Ria, Vung Tau',MANQL='002',MUCLUONG=2000000,PHONG='NC'
WHERE MANV='006'
UPDATE NHANVIEN
SET HONV='Tran',TENLOT='Thanh',TENNV='Tam',NGAYSINH='1975-07-31',PHAI='Nu',DIACHI='543 Mai Thi Luu, Q1, TpHCM',MANQL='002',MUCLUONG=2200000,PHONG='NC'
WHERE MANV='007'
UPDATE NHANVIEN
SET HONV='Tran',TENLOT='Hong',TENNV='Van',NGAYSINH='1976-07-04',PHAI='Nu',DIACHI='980 Le Hong Phong, Q10, TpHCM',MANQL='004',MUCLUONG=1800000,PHONG='NC'
WHERE MANV='008'
GO
--NHẬP BẢNG THÂN NHÂN 
SELECT * FROM THANNHAN
INSERT INTO THANNHAN
VALUES ('1','003','Tran Minh Tien','Nam','1990-12-11','Con'),
('2','003','Tran Ngoc Linh','Nu','1993-03-10','Con'),
('3','003','Tran Minh Long','Nam','1957-10-10','Vo Chong'),
('1','001','Le Nhat Minh','Nam','1955-04-27','Vo Chong'),
('1','002','Le Hoai Thuong','Nu','1960-12-05','Vo Chong'), 
('1','004','Le Phi Phung','Nu','1972-12-23','Vo Chong'), 
('1','005','Tran Thu Hong','Nu','1978-04-11','Vo Chong'), 
('2','005','Nguyen Manh Tam','Nam','2003-01-13','Con')    
ALTER TABLE THANNHAN ADD CONSTRAINT PK_TN PRIMARY KEY(MATN,MANV)
ALTER TABLE THANNHAN ADD CONSTRAINT FK_MANV FOREIGN KEY(MANV) REFERENCES NHANVIEN(MANV)
GO
--NHẬP DỮ LIỆU BẢNG ĐỀ ÁN
SELECT * FROM DEAN
INSERT INTO DEAN
VALUES ('TH001','NC','Tinhochoa1','HANOI','2003-02-01','2004-02-01'),
('TH002','NC','Tinhochoa2','TPHCM','2003-06-04','2004-02-01'),
('DT001','DH','Daotao1','NHATRANG','2002-02-01','2006-02-01'),
('DT002','DH','Daotao1','HANOI','2002-02-01','2006-02-01')

--NHẬP DỮ LIỆU BẢNG PHÂN CÔNG
SELECT * FROM PHANCONG
INSERT INTO PHANCONG
VALUES ('001','TH001',30.0),
('001','TH002',12.5),
('002','TH001',10.0),
('002','TH002',10.0),
('002','DT001',10.0),
('002','DT002',10.0),
('003','TH001',37.5),
('004','DT001',22.5),
('004','DT002',10.0),
('006','DT001',30.5),
('007','TH001',20.0),
('007','TH002',10.0),
('008','TH001',10.0),
('008','DT002',12.5)
ALTER TABLE PHANCONG ADD CONSTRAINT PK_PHANCONG PRIMARY KEY(MANV,MADA)
ALTER TABLE PHANCONG ADD CONSTRAINT FK_PC_MANV FOREIGN KEY(MANV) REFERENCES NHANVIEN(MANV)
ALTER TABLE PHANCONG ADD CONSTRAINT FK_PC_MADA FOREIGN KEY(MADA) REFERENCES DEAN(MADA)
--NHẬP DỮ LIỆU ĐỊA ĐIỂM PHÒNG
SELECT * FROM DIADIEMPHONG
INSERT INTO DIADIEMPHONG
VALUES ('NC','HANOI'),
('NC','TPHCM'),
('QL','TPHCM'),
('DH','HANOI'),
('DH','TPHCM'),
('DH','NHATRANG')
ALTER TABLE DIADIEMPHONG ADD CONSTRAINT PK_DIADIEMPHONG PRIMARY KEY(MAPHONG,DIADIEM)
ALTER TABLE DIADIEMPHONG ADD CONSTRAINT FK_DD_MP FOREIGN KEY (MAPHONG) REFERENCES PHONGBAN(MAPHONG)


SELECT *FROM NHANVIEN
SELECT *FROM PHONGBAN
SELECT *FROM DEAN
SELECT *FROM PHANCONG
SELECT *FROM THANNHAN
SELECT * FROM DIADIEMPHONG

--1. 
SELECT MANV, HONV,TENLOT, TENNV,PHONG
FROM NHANVIEN 
WHERE PHONG='NC'
--2. 
SELECT MANV,HONV,TENLOT, TENNV,PHAI,MUCLUONG
FROM NHANVIEN
WHERE MUCLUONG>=3000000
--3.
SELECT HONV,TENLOT,TENNV, TENPHONG, MUCLUONG
FROM NHANVIEN N, PHONGBAN P
WHERE N.PHONG=P.MAPHONG AND (MUCLUONG>=2000000 AND MUCLUONG<=3000000)
--4.
SELECT HONV,TENLOT,TENNV,DIACHI
FROM NHANVIEN 
WHERE DIACHI LIKE N'%TpHCM'
--5.
SELECT HONV,TENLOT,TENNV, NGAYSINH,DIACHI
FROM NHANVIEN
WHERE HONV='Dinh' AND TENLOT='Ba' AND TENNV='Tien'
--6.
SELECT TENTN, MANV, YEAR(GETDATE())-YEAR(NGSINH) 'TUỔI TN'
FROM THANNHAN 
WHERE YEAR(GETDATE())-YEAR(NGSINH)<18 AND MANV='001'
--7. 
SELECT HONV,TENLOT,TENNV,PHAI, YEAR(GETDATE())-YEAR(NGAYSINH) 'TUỔI NV'
FROM NHANVIEN
WHERE YEAR(GETDATE())-YEAR(NGAYSINH)>30 AND PHAI='NU'