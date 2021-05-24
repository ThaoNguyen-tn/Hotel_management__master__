USE [master]
GO
/****** Object:  Database [QLKS]    Script Date: 5/5/2021 18:35:40 PM ******/
CREATE DATABASE [QLKS]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QLKS', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\QLKS.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'QLKS_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\QLKS_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [QLKS] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QLKS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QLKS] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QLKS] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QLKS] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QLKS] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QLKS] SET ARITHABORT OFF 
GO
ALTER DATABASE [QLKS] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [QLKS] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QLKS] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QLKS] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QLKS] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QLKS] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QLKS] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QLKS] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QLKS] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QLKS] SET  ENABLE_BROKER 
GO
ALTER DATABASE [QLKS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QLKS] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QLKS] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QLKS] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QLKS] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QLKS] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QLKS] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QLKS] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QLKS] SET  MULTI_USER 
GO
ALTER DATABASE [QLKS] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QLKS] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QLKS] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QLKS] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [QLKS] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [QLKS] SET QUERY_STORE = OFF
GO
USE [QLKS]
GO
/****** Object:  Table [dbo].[TBL_TAIKHOAN]    Script Date: 5/5/2021 18:35:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_TAIKHOAN](
	[TAIKHOAN] [varchar](20) NOT NULL,
	[MANV] [varchar](4) NOT NULL,
	[MATKHAU] [varchar](20) NOT NULL,
	[CHUCVU] [int] NOT NULL,
 CONSTRAINT [PK__TBL_TAIK__8C5E61058456D005] PRIMARY KEY CLUSTERED 
(
	[TAIKHOAN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TBL_CTHD]    Script Date: 5/6/2021 18:35:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_CTHD](
	[MACTHD] [varchar](4) NULL,
	[MAKH] [varchar](5) NULL,
	[MANV] [varchar](4) NULL,
	[NGAYNHANPHONG] [smalldatetime] NULL,
	[NGAYDI] [smalldatetime] NULL,
	[SOPHONG] [char](4) NULL,
	[TRATRUOC] [money] NULL,
	[DONVI] [varchar](10) NULL,
	[MADV] [varchar](4) NULL
) ON [PRIMARY]
GO

ALTER TABLE TBL_CTHD
ALTER COLUMN MACTHD varchar(4) NOT NULL

ALTER TABLE TBL_CTHD
ADD PRIMARY KEY (MACTHD)

/****** Object:  Table [dbo].[TBL_DICHVU]    Script Date: 5/5/2021 18:35:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_DICHVU](
	[MADV] [varchar](4) NOT NULL,
	[TENDV] [nvarchar](20) NULL,
	[GIADV] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[MADV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TBL_HOADON]    Script Date: 5/5/2021 18:35:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_HOADON](
	[MAHD] [varchar](4) NOT NULL,
	[NGAYTHANHTOAN] [smalldatetime] NULL,
	[TRATRUOC] [money] NULL,
	[MANV] [varchar](4) NULL,
PRIMARY KEY CLUSTERED 
(
	[MAHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TBL_KHACHHANG]    Script Date: 5/5/2021 18:35:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_KHACHHANG](
	[MAKH] [varchar](5) NOT NULL,
	[TENKH] [nvarchar](30) NULL,
	[DIACHI] [nvarchar](30) NULL,
	[GIOITINH] [nvarchar](6) NULL,
	[CMND] [char](13) NULL,
	[QUOCTICH] [nvarchar](20) NULL,
	[SDT] [char](15) NULL,
PRIMARY KEY CLUSTERED 
(
	[MAKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TBL_LOAINHANVIEN]    Script Date: 5/5/2021 18:35:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_LOAINHANVIEN](
	[MALNV] [varchar](4) NOT NULL,
	[TENLNV] [nvarchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[MALNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TBL_LOAIPHONG]    Script Date: 5/5/2021 18:35:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_LOAIPHONG](
	[MALP] [varchar](4) NOT NULL,
	[TENLP] [nvarchar](20) NULL,
	[TRANGTHIETBI] [nvarchar](100) NULL,
	[GIA] [money] NULL,
	[DONVI] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[MALP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TBL_NHANVIEN]    Script Date: 5/5/2021 18:35:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_NHANVIEN](
	[MANV] [varchar](4) NOT NULL,
	[TENNV] [nvarchar](30) NULL,
	[MALNV] [varchar](4) NULL,
	[NGSINH] [smalldatetime] NULL,
	[GIOITINH] [nvarchar](6) NULL,
	[SDT] [char](15) NULL,
	[DIACHI] [nvarchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[MANV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TBL_PHONG]    Script Date: 5/5/2021 18:35:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_PHONG](
	[SOPHONG] [char](4) NOT NULL,
	[TINHTRANG] [nvarchar](15) NULL,
	[MALP] [varchar](4) NULL,
PRIMARY KEY CLUSTERED 
(
	[SOPHONG] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE TBL_CTDV
(
MACTHD varchar(4),
MADV varchar(4)

PRIMARY KEY (MACTHD, MADV)
)
GO

ALTER TABLE TBL_CTDV
ADD constraint FK_CTDV_DICHVU
FOREIGN KEY (MADV)
REFERENCES TBL_DICHVU(MADV)

ALTER TABLE TBL_CTHD   

DROP CONSTRAINT FK_TBL_CTHD_TBL_DICHVU
ALTER TABLE TBL_CTHD DROP COLUMN MADV


INSERT [dbo].[TBL_TAIKHOAN] ([TAIKHOAN], [MANV], [MATKHAU], [CHUCVU]) VALUES (N'admin', N'QL01', N'admin', 1)

INSERT [dbo].[TBL_DICHVU] ([MADV], [TENDV], [GIADV]) VALUES (N'DV01', N'an', 200000.0000)
INSERT [dbo].[TBL_DICHVU] ([MADV], [TENDV], [GIADV]) VALUES (N'DV02', N'bar', 500000.0000)

INSERT [dbo].[TBL_KHACHHANG] ([MAKH], [TENKH], [DIACHI], [GIOITINH], [CMND], [QUOCTICH], [SDT]) VALUES (N'KH001', N'LKT', N'DAU CUNG DC', N'NU', N'CMND', N'VN', N'SO GI CUNG DC  ')
INSERT [dbo].[TBL_KHACHHANG] ([MAKH], [TENKH], [DIACHI], [GIOITINH], [CMND], [QUOCTICH], [SDT]) VALUES (N'KH002', N'NTC', N'DAU CUNG DC', N'NAM', N'CMND', N'VN', N'SO GI CUNG DC  ')
INSERT [dbo].[TBL_KHACHHANG] ([MAKH], [TENKH], [DIACHI], [GIOITINH], [CMND], [QUOCTICH], [SDT]) VALUES (N'KH003', N'HKT', N'DAU CUNG DC', N'NU', N'CMND', N'VN', N'SO GI CUNG DC  ')
INSERT [dbo].[TBL_KHACHHANG] ([MAKH], [TENKH], [DIACHI], [GIOITINH], [CMND], [QUOCTICH], [SDT]) VALUES (N'KH004', N'JACK', N'DAU CUNG DC', N'NAM', N'CMND', N'USA', N'SO GI CUNG DC  ')
INSERT [dbo].[TBL_KHACHHANG] ([MAKH], [TENKH], [DIACHI], [GIOITINH], [CMND], [QUOCTICH], [SDT]) VALUES (N'KH005', N'MINE', N'DAU CUNG DC', N'NU', N'CMND', N'SGP', N'SO GI CUNG DC  ')

INSERT [dbo].[TBL_LOAINHANVIEN] ([MALNV], [TENLNV]) VALUES (N'L01', N'Quan ly')
INSERT [dbo].[TBL_LOAINHANVIEN] ([MALNV], [TENLNV]) VALUES (N'L02', N'Nhan vien tiep tan')
INSERT [dbo].[TBL_LOAINHANVIEN] ([MALNV], [TENLNV]) VALUES (N'L03', N'Nhan vien ve sinh')
INSERT [dbo].[TBL_LOAINHANVIEN] ([MALNV], [TENLNV]) VALUES (N'L04', N'Nhan vien phuc vu')

INSERT [dbo].[TBL_LOAIPHONG] ([MALP], [TENLP], [TRANGTHIETBI], [GIA], [DONVI]) VALUES (N'LP01', N'PHONG DON', N'1 GIUONG DON', 300000.0000, N'VND')
INSERT [dbo].[TBL_LOAIPHONG] ([MALP], [TENLP], [TRANGTHIETBI], [GIA], [DONVI]) VALUES (N'LP02', N'PHONG DOI', N'2 GIUONG DON', 500000.0000, N'VND')
INSERT [dbo].[TBL_LOAIPHONG] ([MALP], [TENLP], [TRANGTHIETBI], [GIA], [DONVI]) VALUES (N'LP03', N'PHONG VIP DON', N'1 GIUONG DOI', 650000.0000, N'VND')
INSERT [dbo].[TBL_LOAIPHONG] ([MALP], [TENLP], [TRANGTHIETBI], [GIA], [DONVI]) VALUES (N'LP04', N'PHONG VIP DOI', N'2 GIUONG DOI', 800000.0000, N'VND')
INSERT [dbo].[TBL_LOAIPHONG] ([MALP], [TENLP], [TRANGTHIETBI], [GIA], [DONVI]) VALUES (N'LP05', N'PHONG GIA DINH', N'2 GIUONG DOI', 700000.0000, N'VND')

INSERT [dbo].[TBL_NHANVIEN] ([MANV], [TENNV], [MALNV], [NGSINH], [GIOITINH], [SDT], [DIACHI]) VALUES (N'NV01', N'NTN', N'L01', CAST(N'2000-12-19T00:00:00' AS SmallDateTime), N'NAM', N'0919002541     ', N'DAU CUNG DC')
INSERT [dbo].[TBL_NHANVIEN] ([MANV], [TENNV], [MALNV], [NGSINH], [GIOITINH], [SDT], [DIACHI]) VALUES (N'NV02', N'NVN', N'L02', CAST(N'2000-01-19T00:00:00' AS SmallDateTime), N'NU', N'0919123441     ', N'DAU CUNG DC')
INSERT [dbo].[TBL_NHANVIEN] ([MANV], [TENNV], [MALNV], [NGSINH], [GIOITINH], [SDT], [DIACHI]) VALUES (N'NV03', N'TDB', N'L02', CAST(N'1999-12-01T00:00:00' AS SmallDateTime), N'NAM', N'0929005541     ', N'DAU CUNG DC')
INSERT [dbo].[TBL_NHANVIEN] ([MANV], [TENNV], [MALNV], [NGSINH], [GIOITINH], [SDT], [DIACHI]) VALUES (N'NV04', N'VTTT', N'L03', CAST(N'2000-04-03T00:00:00' AS SmallDateTime), N'NU', N'0918002541     ', N'DAU CUNG DC')
INSERT [dbo].[TBL_NHANVIEN] ([MANV], [TENNV], [MALNV], [NGSINH], [GIOITINH], [SDT], [DIACHI]) VALUES (N'NV05', N'NTNY', N'L03', CAST(N'1998-12-07T00:00:00' AS SmallDateTime), N'NU', N'0914002561     ', N'DAU CUNG DC')
INSERT [dbo].[TBL_NHANVIEN] ([MANV], [TENNV], [MALNV], [NGSINH], [GIOITINH], [SDT], [DIACHI]) VALUES (N'NV06', N'CMT', N'L04', CAST(N'2001-12-22T00:00:00' AS SmallDateTime), N'NAM', N'0919012541     ', N'DAU CUNG DC')
INSERT [dbo].[TBL_NHANVIEN] ([MANV], [TENNV], [MALNV], [NGSINH], [GIOITINH], [SDT], [DIACHI]) VALUES (N'QL01', N'Quan Ly', N'L01', CAST(N'2000-04-27T00:00:00' AS SmallDateTime), N'NAM', N'0352796298     ', N'DAU CUNG DC')

INSERT [dbo].[TBL_PHONG] ([SOPHONG], [TINHTRANG], [MALP]) VALUES (N'P001', N'EMPTY', N'LP01')
INSERT [dbo].[TBL_PHONG] ([SOPHONG], [TINHTRANG], [MALP]) VALUES (N'P002', N'EMPTY', N'LP01')
INSERT [dbo].[TBL_PHONG] ([SOPHONG], [TINHTRANG], [MALP]) VALUES (N'P003', N'USED', N'LP02')
INSERT [dbo].[TBL_PHONG] ([SOPHONG], [TINHTRANG], [MALP]) VALUES (N'P004', N'EMPTY', N'LP02')
INSERT [dbo].[TBL_PHONG] ([SOPHONG], [TINHTRANG], [MALP]) VALUES (N'P005', N'EMPTY', N'LP02')
INSERT [dbo].[TBL_PHONG] ([SOPHONG], [TINHTRANG], [MALP]) VALUES (N'P011', N'EMPTY', N'LP03')
INSERT [dbo].[TBL_PHONG] ([SOPHONG], [TINHTRANG], [MALP]) VALUES (N'P012', N'EMPTY', N'LP03')
INSERT [dbo].[TBL_PHONG] ([SOPHONG], [TINHTRANG], [MALP]) VALUES (N'P013', N'USED', N'LP03')
INSERT [dbo].[TBL_PHONG] ([SOPHONG], [TINHTRANG], [MALP]) VALUES (N'P014', N'EMPTY', N'LP03')
INSERT [dbo].[TBL_PHONG] ([SOPHONG], [TINHTRANG], [MALP]) VALUES (N'P015', N'USED', N'LP03')
INSERT [dbo].[TBL_PHONG] ([SOPHONG], [TINHTRANG], [MALP]) VALUES (N'P021', N'EMPTY', N'LP04')
INSERT [dbo].[TBL_PHONG] ([SOPHONG], [TINHTRANG], [MALP]) VALUES (N'P022', N'EMPTY', N'LP04')
INSERT [dbo].[TBL_PHONG] ([SOPHONG], [TINHTRANG], [MALP]) VALUES (N'P023', N'EMPTY', N'LP04')
INSERT [dbo].[TBL_PHONG] ([SOPHONG], [TINHTRANG], [MALP]) VALUES (N'P024', N'EMPTY', N'LP05')
INSERT [dbo].[TBL_PHONG] ([SOPHONG], [TINHTRANG], [MALP]) VALUES (N'P025', N'EMPTY', N'LP05')

ALTER TABLE [dbo].[TBL_TAIKHOAN]  WITH CHECK ADD  CONSTRAINT [FK__TBL_TAIKHO__MANV__5CD6CB2B] FOREIGN KEY([MANV])
REFERENCES [dbo].[TBL_NHANVIEN] ([MANV])
GO
ALTER TABLE [dbo].[TBL_TAIKHOAN] CHECK CONSTRAINT [FK__TBL_TAIKHO__MANV__5CD6CB2B]
GO
ALTER TABLE [dbo].[TBL_CTHD]  WITH CHECK ADD  CONSTRAINT [FK_TBL_CTHD_TBL_DICHVU] FOREIGN KEY([MADV])
REFERENCES [dbo].[TBL_DICHVU] ([MADV])
GO
ALTER TABLE [dbo].[TBL_CTHD] CHECK CONSTRAINT [FK_TBL_CTHD_TBL_DICHVU]
GO
ALTER TABLE [dbo].[TBL_CTHD]  WITH CHECK ADD  CONSTRAINT [FK_TBL_CTHD_TBL_KHACHHANG] FOREIGN KEY([MAKH])
REFERENCES [dbo].[TBL_KHACHHANG] ([MAKH])
GO
ALTER TABLE [dbo].[TBL_CTHD] CHECK CONSTRAINT [FK_TBL_CTHD_TBL_KHACHHANG]
GO
ALTER TABLE [dbo].[TBL_CTHD]  WITH CHECK ADD  CONSTRAINT [FK_TBL_CTHD_TBL_NHANVIEN] FOREIGN KEY([MANV])
REFERENCES [dbo].[TBL_NHANVIEN] ([MANV])
GO
ALTER TABLE [dbo].[TBL_CTHD] CHECK CONSTRAINT [FK_TBL_CTHD_TBL_NHANVIEN]
GO
ALTER TABLE [dbo].[TBL_CTHD]  WITH CHECK ADD  CONSTRAINT [FK_TBL_CTHD_TBL_PHONG] FOREIGN KEY([SOPHONG])
REFERENCES [dbo].[TBL_PHONG] ([SOPHONG])
GO
ALTER TABLE [dbo].[TBL_CTHD] CHECK CONSTRAINT [FK_TBL_CTHD_TBL_PHONG]
GO
ALTER TABLE [dbo].[TBL_HOADON]  WITH CHECK ADD  CONSTRAINT [FK_TBL_HOADON_TBL_NHANVIEN] FOREIGN KEY([MANV])
REFERENCES [dbo].[TBL_NHANVIEN] ([MANV])
GO
ALTER TABLE [dbo].[TBL_HOADON] CHECK CONSTRAINT [FK_TBL_HOADON_TBL_NHANVIEN]
GO
ALTER TABLE [dbo].[TBL_NHANVIEN]  WITH CHECK ADD  CONSTRAINT [FK_TBL_NHANVIEN_TBL_LOAINHANVIEN] FOREIGN KEY([MALNV])
REFERENCES [dbo].[TBL_LOAINHANVIEN] ([MALNV])
GO
ALTER TABLE [dbo].[TBL_NHANVIEN] CHECK CONSTRAINT [FK_TBL_NHANVIEN_TBL_LOAINHANVIEN]
GO
ALTER TABLE [dbo].[TBL_PHONG]  WITH CHECK ADD  CONSTRAINT [FK_TBL_PHONG_TBL_LOAIPHONG] FOREIGN KEY([MALP])
REFERENCES [dbo].[TBL_LOAIPHONG] ([MALP])
GO
ALTER TABLE [dbo].[TBL_PHONG] CHECK CONSTRAINT [FK_TBL_PHONG_TBL_LOAIPHONG]
GO
USE [master]
GO
ALTER DATABASE [QLKS] SET  READ_WRITE 
GO

--
--TBL_PHONG
CREATE PROC USP_GETROOMNUMBER
@SOPHONG char(4)
AS
BEGIN
	SELECT * FROM TBL_PHONG WHERE SOPHONG = @SOPHONG
END
GO

CREATE PROC USP_GETROOM
AS
BEGIN
	SELECT * FROM TBL_PHONG 
END
GO

create proc USP_GETCOSTROOM
as
Begin
	select TBL_PHONG.SOPHONG, TBL_PHONG.TINHTRANG, TBL_PHONG.MALP, TBL_LOAIPHONG.GIA
	from tbl_phong, tbl_Loaiphong
	where tbl_phong.malp = tbl_Loaiphong.malp
end
GO
DROP PROC USP_GETCOSTROOM
EXEC USP_GETCOSTROOM

create proc USP_INSERTROOM
@SOPHONG CHAR(4),
@TINHTRANG NVARCHAR(15),
@MALP VARCHAR(4)
AS
BEGIN
	SET NOCOUNT ON
	INSERT [dbo].[TBL_PHONG] ([SOPHONG], [TINHTRANG], [MALP]) 
	VALUES (@SOPHONG, @TINHTRANG, @MALP)
END
GO

CREATE PROC USP_DELETEROOM
@SOPHONG CHAR(4)
AS
BEGIN
	DELETE FROM TBL_PHONG 
	WHERE SOPHONG = @SOPHONG
END
GO

CREATE PROC USP_UPDATEROOM
@SOPHONG CHAR(4),
@TINHTRANG NVARCHAR(15),
@MALP VARCHAR(4)
AS
BEGIN
	UPDATE TBL_PHONG
	SET TINHTRANG = @TINHTRANG,
		MALP = @MALP
	WHERE SOPHONG = @SOPHONG
END
GO

--
--TBL_NHANVIEN
CREATE PROC USP_GETNHANVIEN
@MANV char(4)
AS
BEGIN
	SELECT * FROM TBL_NHANVIEN
END
GO

CREATE PROC USP_GETNHANVIENBYMANV
@MANV char(4)
AS
BEGIN
	SELECT * FROM TBL_NHANVIEN WHERE MANV = @MANV
END
GO

create proc USP_INSERTNHANVIEN
@MANV VARCHAR(4),
@TENNV NVARCHAR(30),
@MALNV VARCHAR(4),
@NGSINH SMALLDATETIME,
@GIOITINH NVARCHAR(6),
@SDT CHAR(15),
@DIACHI NVARCHAR(30)
AS
BEGIN
	SET NOCOUNT ON
	INSERT [dbo].[TBL_NHANVIEN] ([MANV], [TENNV], [MALNV], [NGSINH], [GIOITINH], [SDT], [DIACHI]) 
	VALUES (@MANV, @TENNV, @MALNV, CAST(@NGSINH AS SmallDateTime), @GIOITINH, @SDT, @DIACHI)
END
GO

CREATE PROC USP_DELETENHANVIEN
@MANV VARCHAR(4)
AS
BEGIN
	DELETE FROM TBL_NHANVIEN 
	WHERE MANV = @MANV
END
GO

CREATE PROC USP_UPDATENHANVIEN
@MANV VARCHAR(4),
@TENNV NVARCHAR(30),
@MALNV VARCHAR(4),
@NGSINH SMALLDATETIME,
@GIOITINH NVARCHAR(6),
@SDT CHAR(15),
@DIACHI NVARCHAR(30)
AS
BEGIN
	UPDATE TBL_NHANVIEN
	SET TENNV = @TENNV,
		MALNV = @MALNV,
		NGSINH = CAST(@NGSINH AS SMALLDATETIME),
		GIOITINH = @GIOITINH,
		SDT = @SDT,
		DIACHI = @DIACHI
	WHERE MANV = @MANV
END
GO

EXECUTE USP_GETNHANVIEN @MANV

--
--TBL_KHACHHANG
CREATE PROC USP_GETKHACHHANGBYMAKH
@MAKH char(4)
AS
BEGIN
	SELECT * FROM TBL_KHACHHANG WHERE MAKH = @MAKH
END
GO

CREATE PROC USP_GETKHACHHANG
AS
BEGIN
	SELECT * FROM TBL_KHACHHANG
END
GO

create proc USP_INSERTKHACHHANG
@MAKH VARCHAR(5),
@TENKH NVARCHAR(30),
@DIACHI NVARCHAR(30),
@GIOITINH NVARCHAR(6),
@CMND CHAR(13),
@QUOCTICH NVARCHAR(20),
@SDT CHAR(15)
AS
BEGIN
	SET NOCOUNT ON
	INSERT [dbo].[TBL_NHANVIEN] ([MAKH], [TENKH], [DIACHI], [GIOITINH], [CMND], [QUOCTICH], [SDT]) 
	VALUES (@MAKH, @TENKH, @DIACHI, @GIOITINH, @CMND, @QUOCTICH, @SDT)
END
GO

CREATE PROC USP_DELETEKHACHHANG
@MAKH VARCHAR(4)
AS
BEGIN
	DELETE FROM TBL_KHACHHANG
	WHERE MAKH = @MAKH
END
GO

CREATE PROC USP_UPDATEKHACHHANG
@MAKH VARCHAR(5),
@TENKH NVARCHAR(30),
@DIACHI NVARCHAR(6),
@GIOITINH NVARCHAR(6),
@CMND CHAR(13),
@QUOCTICH NVARCHAR(20),
@SDT CHAR(15)

AS
BEGIN
	UPDATE TBL_KHACHHANG
	SET TENKH = @TENKH,
		DIACHI = @DIACHI,
		GIOITINH = @GIOITINH,
		CMND = @CMND,
		QUOCTICH = @QUOCTICH,
		SDT = @SDT
	WHERE MAKH = @MAKH
END
GO

--
--TBL_DICHVU

CREATE PROC USP_GETBYMADV
@MADV char(4)
AS
BEGIN
	SELECT * FROM TBL_DICHVU WHERE MADV = @MADV
END
GO

CREATE PROC USP_GETDICHVU
AS
BEGIN
	SELECT * FROM TBL_DICHVU
END
GO
drop PROC USP_GETDICHVU
create proc USP_INSERTDICHVU
@MADV VARCHAR(4),
@TENDV NVARCHAR(20),
@GIADV MONEY
AS
BEGIN
	SET NOCOUNT ON
	INSERT [dbo].[TBL_DICHVU] ([MADV], [TENDV], [GIADV]) 
	VALUES (@MADV, @TENDV, @GIADV)
END
GO

CREATE PROC USP_DELETEDICHVU
@MADV VARCHAR(4)
AS
BEGIN
	DELETE FROM TBL_DICHVU
	WHERE MADV = @MADV
END
GO

CREATE PROC USP_UPDATEDICHVU
@MADV VARCHAR(4),
@TENDV NVARCHAR(20),
@GIADV MONEY

AS
BEGIN
	UPDATE TBL_DICHVU
	SET TENDV = @TENDV,
		GIADV = @GIADV
	WHERE MADV = @MADV
END
GO

--
--TBL_CTHD
CREATE PROC USP_GETCTHD
@MACTHD char(4)
AS
BEGIN
	SELECT * FROM TBL_CTHD
END
GO

create proc USP_INSERTCTHD
@MACTHD VARCHAR(4),
@MAKH VARCHAR(5),
@MANV VARCHAR(4),
@NGAYNHANPHONG SMALLDATETIME,
@NGAYDI SMALLDATETIME,
@SOPHONG CHAR(4),
@TRATRUOC MONEY,
@DONVI VARCHAR(10),
AS
BEGIN
	SET NOCOUNT ON
	INSERT [dbo].[TBL_CTHD] ([MACTHD], [MAKH], [MANV], [NGAYNHANPHONG], [NGAYDI], [SOPHONG], [TRATRUOC], [DONVI]) 
	VALUES (@MACTHD, @MAKH, @MANV, @NGAYNHANPHONG, @NGAYDI, @SOPHONG, @TRATRUOC, @DONVI)
END
GO

CREATE PROC USP_DELETECTHD
@MADV VARCHAR(4)
AS
BEGIN
	DELETE FROM TBL_CTHD
	WHERE MACTHD = @MACTHD
END
GO

CREATE PROC USP_UPDATECTHD
@MACTHD VARCHAR(4),
@MAKH VARCHAR(5),
@MANV VARCHAR(4),
@NGAYNHANPHONG SMALLDATETIME,
@NGAYDI SMALLDATETIME,
@SOPHONG CHAR(4),
@TRATRUOC MONEY,
@DONVI VARCHAR(10)
AS
BEGIN
	UPDATE TBL_CTHD
	SET	MAKH = @MAKH,
		MANV = @MANV,
		NGAYNHANPHONG = @NGAYNHANPHONG,
		NGAYDI = @NGAYDI,
		SOPHONG = @SOPHONG,
		TRATRUOC = @TRATRUOC,
		DONVI = @DONVI
	WHERE MACTHD = @MACTHD
END
GO

--
--TBL_HOADON

CREATE PROC USP_GETHOADON
@MAHOADON char(4)
AS
BEGIN
	SELECT * FROM TBL_HOADON
END
GO

create proc USP_INSERTHOADON
@MAHD VARCHAR(4),
@NGAYTHANHTOAN SMALLDATETIME,
@TRATRUOC MONEY,
@MANV VARCHAR(4)
AS
BEGIN
	SET NOCOUNT ON
	INSERT [dbo].[TBL_HOADON] ([MAHD], [NGAYTHANHTOAN], [TRATRUOC], [MANV]) 
	VALUES (@MAHD, @NGAYTHANHTOAN, @TRATRUOC, @MANV)
END
GO

CREATE PROC USP_DELETEHOADON
@MAHD CHAR(4)
AS
BEGIN
	DELETE FROM TBL_HOADON
	WHERE MAHD = @MAHD
END
GO

CREATE PROC USP_UPDATEHOADON
@MAHD VARCHAR(4),
@NGAYTHANHTOAN SMALLDATETIME,
@TRATRUOC MONEY,
@MANV VARCHAR(4)
AS
BEGIN
	UPDATE TBL_HOADON
	SET NGAYTHANHTOAN = @NGAYTHANHTOAN,
		TRATRUOC = @TRATRUOC,
		MANV = @MANV
	WHERE MAHD = @MAHD
END
GO

--
--TBL_LOAINHANVIEN

CREATE PROC USP_GETLOAINHANVIEN
AS
BEGIN
	SELECT * FROM TBL_LOAINHANVIEN
END
GO

create proc USP_INSERTLOAINHANVIEN
@MALNV VARCHAR(4),
@TENLNV NVARCHAR(30)
AS
BEGIN
	SET NOCOUNT ON
	INSERT TBL_LOAINHANVIEN (MALNV, TENLNV) 
	VALUES (@MALNV, @TENLNV)
END
GO

CREATE PROC USP_DELETELOAINHANVIEN
@MALNV CHAR(4)
AS
BEGIN
	DELETE FROM TBL_LOAINHANVIEN
	WHERE MALNV = @MALNV
END
GO

CREATE PROC USP_UPDATELOAINHANVIEN
@MALNV VARCHAR(4),
@TENLNV NVARCHAR(30)
AS
BEGIN
	UPDATE TBL_LOAINHANVIEN
	SET TENLNV = @TENLNV
	WHERE MALNV = @MALNV
END
GO

--
--TBL_LOAIPHONG

CREATE PROC USP_GETBYMALP
@MALP char(4)
AS
BEGIN
	SELECT * FROM TBL_LOAIPHONG WHERE MALP = @MALP
END
GO

CREATE PROC USP_GETLOAIPHONG
AS
BEGIN
	SELECT * FROM TBL_LOAIPHONG
END
GO
exec USP_GETLOAIPHONG
create proc USP_INSERTLOAIPHONG
@MALP VARCHAR(4),
@TENLP NVARCHAR(20),
@TRANGTHIETBI NVARCHAR(10),
@GIA MONEY,
@DONVI VARCHAR(10)
AS
BEGIN
	SET NOCOUNT ON
	INSERT TBL_LOAIPHONG (MALP, TENLP, TRANGTHIETBI, GIA, DONVI) 
	VALUES (@MALP, @TENLP, @TRANGTHIETBI, @GIA, @DONVI)
END


GO

CREATE PROC USP_DELETELOAIPHONG
@MALP CHAR(4)
AS
BEGIN
	DELETE FROM TBL_LOAIPHONG
	WHERE MALP = @MALP
END
GO

CREATE PROC USP_UPDATELOAIPHONG
@MALP VARCHAR(4),
@TENLP NVARCHAR(20),
@TRANGTHIETBI NVARCHAR(10),
@GIA MONEY,
@DONVI VARCHAR(10)
AS
BEGIN
	UPDATE TBL_LOAIPHONG
	SET TENLP = @TENLP,
		TRANGTHIETBI = @TRANGTHIETBI,
		GIA = @GIA,
		DONVI = @DONVI
	WHERE MALP = @MALP
END
GO

EXEC USP_UPDATELOAIPHONG
