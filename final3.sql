USE [master]
GO
/****** Object:  Database [QUANLYBANVEXEBUS7]    Script Date: 8/12/2021 1:29:00 AM ******/
CREATE DATABASE [QUANLYBANVEXEBUS7]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QUANLYBANVEXEBUS7', FILENAME = N'D:\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\QUANLYBANVEXEBUS7.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'QUANLYBANVEXEBUS7_log', FILENAME = N'D:\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\QUANLYBANVEXEBUS7_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [QUANLYBANVEXEBUS7] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QUANLYBANVEXEBUS7].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QUANLYBANVEXEBUS7] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QUANLYBANVEXEBUS7] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QUANLYBANVEXEBUS7] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QUANLYBANVEXEBUS7] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QUANLYBANVEXEBUS7] SET ARITHABORT OFF 
GO
ALTER DATABASE [QUANLYBANVEXEBUS7] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [QUANLYBANVEXEBUS7] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QUANLYBANVEXEBUS7] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QUANLYBANVEXEBUS7] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QUANLYBANVEXEBUS7] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QUANLYBANVEXEBUS7] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QUANLYBANVEXEBUS7] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QUANLYBANVEXEBUS7] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QUANLYBANVEXEBUS7] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QUANLYBANVEXEBUS7] SET  ENABLE_BROKER 
GO
ALTER DATABASE [QUANLYBANVEXEBUS7] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QUANLYBANVEXEBUS7] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QUANLYBANVEXEBUS7] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QUANLYBANVEXEBUS7] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QUANLYBANVEXEBUS7] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QUANLYBANVEXEBUS7] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QUANLYBANVEXEBUS7] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QUANLYBANVEXEBUS7] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QUANLYBANVEXEBUS7] SET  MULTI_USER 
GO
ALTER DATABASE [QUANLYBANVEXEBUS7] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QUANLYBANVEXEBUS7] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QUANLYBANVEXEBUS7] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QUANLYBANVEXEBUS7] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [QUANLYBANVEXEBUS7] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [QUANLYBANVEXEBUS7] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'QUANLYBANVEXEBUS7', N'ON'
GO
ALTER DATABASE [QUANLYBANVEXEBUS7] SET QUERY_STORE = OFF
GO
USE [QUANLYBANVEXEBUS7]
GO
/****** Object:  Table [dbo].[CheDo]    Script Date: 8/12/2021 1:29:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CheDo](
	[maCheDo] [varchar](255) NOT NULL,
	[tenCheDo] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[maCheDo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChuyenXe]    Script Date: 8/12/2021 1:29:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChuyenXe](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[maTuyen] [int] NULL,
	[gioXuatPhat] [time](7) NULL,
	[gioKetThuc] [time](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CTChuyen]    Script Date: 8/12/2021 1:29:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CTChuyen](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idPhanCong] [int] NULL,
	[idChuyen] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GiaVeLuot]    Script Date: 8/12/2021 1:29:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GiaVeLuot](
	[maGia] [int] IDENTITY(1,1) NOT NULL,
	[maCheDo] [varchar](255) NULL,
	[giaVeLuot] [money] NULL,
	[thoiGianApDung] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[maGia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GiaVeThang]    Script Date: 8/12/2021 1:29:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GiaVeThang](
	[maGia] [int] IDENTITY(1,1) NOT NULL,
	[maCheDo] [varchar](255) NULL,
	[giaVeThang] [money] NULL,
	[thoiGianApDung] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[maGia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhachThang]    Script Date: 8/12/2021 1:29:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachThang](
	[maKhachThang] [int] IDENTITY(1,1) NOT NULL,
	[hoTen] [nvarchar](255) NULL,
	[ngaySinh] [date] NULL,
	[note] [ntext] NULL,
PRIMARY KEY CLUSTERED 
(
	[maKhachThang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhanVien]    Script Date: 8/12/2021 1:29:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhanVien](
	[maNhanvien] [int] IDENTITY(1,1) NOT NULL,
	[hoTen] [nvarchar](255) NULL,
	[email] [varchar](255) NULL,
	[soDienThoai] [varchar](255) NULL,
	[gioiTinh] [bit] NULL,
	[namSinh] [date] NULL,
	[diaChi] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[maNhanvien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhanCong]    Script Date: 8/12/2021 1:29:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhanCong](
	[idPhanCong] [int] IDENTITY(1,1) NOT NULL,
	[maNhanVien] [int] NULL,
	[bienSoXe] [varchar](255) NULL,
	[ngay] [date] NULL,
 CONSTRAINT [pk_phancong_vxc] PRIMARY KEY CLUSTERED 
(
	[idPhanCong] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 8/12/2021 1:29:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[maRole] [varchar](255) NOT NULL,
	[tenRole] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[maRole] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaiKhoan]    Script Date: 8/12/2021 1:29:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaiKhoan](
	[maTaiKhoan] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](255) NULL,
	[password] [varchar](255) NULL,
	[maRole] [varchar](255) NULL,
	[maNhanVien] [int] NULL,
	[image] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[maTaiKhoan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ThongTinVeLuot]    Script Date: 8/12/2021 1:29:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThongTinVeLuot](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[maPhanCong] [int] NULL,
	[maGiaLuot] [int] NULL,
	[soLuong] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ThongTinVeThang]    Script Date: 8/12/2021 1:29:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThongTinVeThang](
	[maVeThang] [int] IDENTITY(1,1) NOT NULL,
	[maKhachThang] [int] NULL,
	[maTuyenXe] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[maVeThang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ThongTinVeThangDetail]    Script Date: 8/12/2021 1:29:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThongTinVeThangDetail](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[maGiaThang] [int] NULL,
	[ngayMua] [date] NULL,
	[ngayHetHan] [date] NULL,
	[maVeThang] [int] NULL,
	[addNewBy] [int] NULL,
	[addNewDate] [date] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TuyenXe]    Script Date: 8/12/2021 1:29:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TuyenXe](
	[maTuyen] [int] IDENTITY(1,1) NOT NULL,
	[tenTuyen] [nvarchar](255) NULL,
	[thoiGianChuyen] [int] NULL,
	[thoiGianNghi] [int] NULL,
	[mocTuyen1] [nvarchar](255) NULL,
	[mocTuyen2] [nvarchar](255) NULL,
	[thoiGianBatDau] [time](7) NULL,
	[thoiGianKetThuc] [time](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[maTuyen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Xe]    Script Date: 8/12/2021 1:29:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Xe](
	[bienSoXe] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[bienSoXe] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[CheDo] ([maCheDo], [tenCheDo]) VALUES (N'thuong', N'Thường')
INSERT [dbo].[CheDo] ([maCheDo], [tenCheDo]) VALUES (N'uutien', N'Ưu tiên')
GO
SET IDENTITY_INSERT [dbo].[ChuyenXe] ON 

INSERT [dbo].[ChuyenXe] ([id], [maTuyen], [gioXuatPhat], [gioKetThuc]) VALUES (1, 1, CAST(N'06:00:00' AS Time), CAST(N'06:45:00' AS Time))
INSERT [dbo].[ChuyenXe] ([id], [maTuyen], [gioXuatPhat], [gioKetThuc]) VALUES (2, 1, CAST(N'06:10:00' AS Time), CAST(N'06:55:00' AS Time))
INSERT [dbo].[ChuyenXe] ([id], [maTuyen], [gioXuatPhat], [gioKetThuc]) VALUES (3, 1, CAST(N'06:20:00' AS Time), CAST(N'07:05:00' AS Time))
INSERT [dbo].[ChuyenXe] ([id], [maTuyen], [gioXuatPhat], [gioKetThuc]) VALUES (4, 1, CAST(N'06:30:00' AS Time), CAST(N'07:15:00' AS Time))
INSERT [dbo].[ChuyenXe] ([id], [maTuyen], [gioXuatPhat], [gioKetThuc]) VALUES (5, 1, CAST(N'06:40:00' AS Time), CAST(N'07:25:00' AS Time))
INSERT [dbo].[ChuyenXe] ([id], [maTuyen], [gioXuatPhat], [gioKetThuc]) VALUES (6, 1, CAST(N'06:50:00' AS Time), CAST(N'07:35:00' AS Time))
INSERT [dbo].[ChuyenXe] ([id], [maTuyen], [gioXuatPhat], [gioKetThuc]) VALUES (7, 1, CAST(N'07:00:00' AS Time), CAST(N'07:45:00' AS Time))
INSERT [dbo].[ChuyenXe] ([id], [maTuyen], [gioXuatPhat], [gioKetThuc]) VALUES (8, 1, CAST(N'07:10:00' AS Time), CAST(N'07:55:00' AS Time))
INSERT [dbo].[ChuyenXe] ([id], [maTuyen], [gioXuatPhat], [gioKetThuc]) VALUES (9, 1, CAST(N'07:20:00' AS Time), CAST(N'08:05:00' AS Time))
INSERT [dbo].[ChuyenXe] ([id], [maTuyen], [gioXuatPhat], [gioKetThuc]) VALUES (10, 1, CAST(N'07:30:00' AS Time), CAST(N'08:15:00' AS Time))
INSERT [dbo].[ChuyenXe] ([id], [maTuyen], [gioXuatPhat], [gioKetThuc]) VALUES (11, 1, CAST(N'07:40:00' AS Time), CAST(N'08:25:00' AS Time))
INSERT [dbo].[ChuyenXe] ([id], [maTuyen], [gioXuatPhat], [gioKetThuc]) VALUES (12, 1, CAST(N'07:50:00' AS Time), CAST(N'08:35:00' AS Time))
INSERT [dbo].[ChuyenXe] ([id], [maTuyen], [gioXuatPhat], [gioKetThuc]) VALUES (13, 1, CAST(N'08:00:00' AS Time), CAST(N'08:45:00' AS Time))
INSERT [dbo].[ChuyenXe] ([id], [maTuyen], [gioXuatPhat], [gioKetThuc]) VALUES (14, 1, CAST(N'08:10:00' AS Time), CAST(N'08:55:00' AS Time))
INSERT [dbo].[ChuyenXe] ([id], [maTuyen], [gioXuatPhat], [gioKetThuc]) VALUES (15, 1, CAST(N'08:20:00' AS Time), CAST(N'09:05:00' AS Time))
INSERT [dbo].[ChuyenXe] ([id], [maTuyen], [gioXuatPhat], [gioKetThuc]) VALUES (16, 1, CAST(N'08:30:00' AS Time), CAST(N'09:15:00' AS Time))
INSERT [dbo].[ChuyenXe] ([id], [maTuyen], [gioXuatPhat], [gioKetThuc]) VALUES (17, 1, CAST(N'08:40:00' AS Time), CAST(N'09:25:00' AS Time))
INSERT [dbo].[ChuyenXe] ([id], [maTuyen], [gioXuatPhat], [gioKetThuc]) VALUES (18, 1, CAST(N'08:50:00' AS Time), CAST(N'09:35:00' AS Time))
INSERT [dbo].[ChuyenXe] ([id], [maTuyen], [gioXuatPhat], [gioKetThuc]) VALUES (19, 1, CAST(N'09:00:00' AS Time), CAST(N'09:45:00' AS Time))
INSERT [dbo].[ChuyenXe] ([id], [maTuyen], [gioXuatPhat], [gioKetThuc]) VALUES (20, 1, CAST(N'09:10:00' AS Time), CAST(N'09:55:00' AS Time))
INSERT [dbo].[ChuyenXe] ([id], [maTuyen], [gioXuatPhat], [gioKetThuc]) VALUES (21, 1, CAST(N'09:20:00' AS Time), CAST(N'10:05:00' AS Time))
INSERT [dbo].[ChuyenXe] ([id], [maTuyen], [gioXuatPhat], [gioKetThuc]) VALUES (22, 1, CAST(N'09:30:00' AS Time), CAST(N'10:15:00' AS Time))
INSERT [dbo].[ChuyenXe] ([id], [maTuyen], [gioXuatPhat], [gioKetThuc]) VALUES (23, 1, CAST(N'09:40:00' AS Time), CAST(N'10:25:00' AS Time))
INSERT [dbo].[ChuyenXe] ([id], [maTuyen], [gioXuatPhat], [gioKetThuc]) VALUES (24, 1, CAST(N'09:50:00' AS Time), CAST(N'10:35:00' AS Time))
INSERT [dbo].[ChuyenXe] ([id], [maTuyen], [gioXuatPhat], [gioKetThuc]) VALUES (25, 1, CAST(N'10:00:00' AS Time), CAST(N'10:45:00' AS Time))
INSERT [dbo].[ChuyenXe] ([id], [maTuyen], [gioXuatPhat], [gioKetThuc]) VALUES (26, 1, CAST(N'10:10:00' AS Time), CAST(N'10:55:00' AS Time))
INSERT [dbo].[ChuyenXe] ([id], [maTuyen], [gioXuatPhat], [gioKetThuc]) VALUES (27, 1, CAST(N'10:20:00' AS Time), CAST(N'11:05:00' AS Time))
INSERT [dbo].[ChuyenXe] ([id], [maTuyen], [gioXuatPhat], [gioKetThuc]) VALUES (28, 1, CAST(N'10:30:00' AS Time), CAST(N'11:15:00' AS Time))
INSERT [dbo].[ChuyenXe] ([id], [maTuyen], [gioXuatPhat], [gioKetThuc]) VALUES (29, 1, CAST(N'10:40:00' AS Time), CAST(N'11:25:00' AS Time))
INSERT [dbo].[ChuyenXe] ([id], [maTuyen], [gioXuatPhat], [gioKetThuc]) VALUES (30, 1, CAST(N'10:50:00' AS Time), CAST(N'11:35:00' AS Time))
INSERT [dbo].[ChuyenXe] ([id], [maTuyen], [gioXuatPhat], [gioKetThuc]) VALUES (31, 1, CAST(N'11:00:00' AS Time), CAST(N'11:45:00' AS Time))
INSERT [dbo].[ChuyenXe] ([id], [maTuyen], [gioXuatPhat], [gioKetThuc]) VALUES (32, 1, CAST(N'11:10:00' AS Time), CAST(N'11:55:00' AS Time))
INSERT [dbo].[ChuyenXe] ([id], [maTuyen], [gioXuatPhat], [gioKetThuc]) VALUES (33, 1, CAST(N'11:20:00' AS Time), CAST(N'12:05:00' AS Time))
INSERT [dbo].[ChuyenXe] ([id], [maTuyen], [gioXuatPhat], [gioKetThuc]) VALUES (34, 1, CAST(N'11:30:00' AS Time), CAST(N'12:15:00' AS Time))
INSERT [dbo].[ChuyenXe] ([id], [maTuyen], [gioXuatPhat], [gioKetThuc]) VALUES (35, 1, CAST(N'11:40:00' AS Time), CAST(N'12:25:00' AS Time))
INSERT [dbo].[ChuyenXe] ([id], [maTuyen], [gioXuatPhat], [gioKetThuc]) VALUES (36, 1, CAST(N'11:50:00' AS Time), CAST(N'12:35:00' AS Time))
INSERT [dbo].[ChuyenXe] ([id], [maTuyen], [gioXuatPhat], [gioKetThuc]) VALUES (37, 1, CAST(N'12:00:00' AS Time), CAST(N'12:45:00' AS Time))
INSERT [dbo].[ChuyenXe] ([id], [maTuyen], [gioXuatPhat], [gioKetThuc]) VALUES (38, 1, CAST(N'12:10:00' AS Time), CAST(N'12:55:00' AS Time))
INSERT [dbo].[ChuyenXe] ([id], [maTuyen], [gioXuatPhat], [gioKetThuc]) VALUES (39, 1, CAST(N'12:20:00' AS Time), CAST(N'13:05:00' AS Time))
INSERT [dbo].[ChuyenXe] ([id], [maTuyen], [gioXuatPhat], [gioKetThuc]) VALUES (40, 1, CAST(N'12:30:00' AS Time), CAST(N'13:15:00' AS Time))
INSERT [dbo].[ChuyenXe] ([id], [maTuyen], [gioXuatPhat], [gioKetThuc]) VALUES (41, 1, CAST(N'12:40:00' AS Time), CAST(N'13:25:00' AS Time))
INSERT [dbo].[ChuyenXe] ([id], [maTuyen], [gioXuatPhat], [gioKetThuc]) VALUES (42, 1, CAST(N'12:50:00' AS Time), CAST(N'13:35:00' AS Time))
INSERT [dbo].[ChuyenXe] ([id], [maTuyen], [gioXuatPhat], [gioKetThuc]) VALUES (43, 1, CAST(N'13:00:00' AS Time), CAST(N'13:45:00' AS Time))
INSERT [dbo].[ChuyenXe] ([id], [maTuyen], [gioXuatPhat], [gioKetThuc]) VALUES (44, 1, CAST(N'13:10:00' AS Time), CAST(N'13:55:00' AS Time))
INSERT [dbo].[ChuyenXe] ([id], [maTuyen], [gioXuatPhat], [gioKetThuc]) VALUES (45, 1, CAST(N'13:20:00' AS Time), CAST(N'14:05:00' AS Time))
INSERT [dbo].[ChuyenXe] ([id], [maTuyen], [gioXuatPhat], [gioKetThuc]) VALUES (46, 1, CAST(N'13:30:00' AS Time), CAST(N'14:15:00' AS Time))
INSERT [dbo].[ChuyenXe] ([id], [maTuyen], [gioXuatPhat], [gioKetThuc]) VALUES (47, 1, CAST(N'13:40:00' AS Time), CAST(N'14:25:00' AS Time))
INSERT [dbo].[ChuyenXe] ([id], [maTuyen], [gioXuatPhat], [gioKetThuc]) VALUES (48, 1, CAST(N'13:50:00' AS Time), CAST(N'14:35:00' AS Time))
INSERT [dbo].[ChuyenXe] ([id], [maTuyen], [gioXuatPhat], [gioKetThuc]) VALUES (49, 1, CAST(N'14:00:00' AS Time), CAST(N'14:45:00' AS Time))
INSERT [dbo].[ChuyenXe] ([id], [maTuyen], [gioXuatPhat], [gioKetThuc]) VALUES (50, 1, CAST(N'14:10:00' AS Time), CAST(N'14:55:00' AS Time))
INSERT [dbo].[ChuyenXe] ([id], [maTuyen], [gioXuatPhat], [gioKetThuc]) VALUES (51, 1, CAST(N'14:20:00' AS Time), CAST(N'15:05:00' AS Time))
INSERT [dbo].[ChuyenXe] ([id], [maTuyen], [gioXuatPhat], [gioKetThuc]) VALUES (52, 1, CAST(N'14:30:00' AS Time), CAST(N'15:15:00' AS Time))
INSERT [dbo].[ChuyenXe] ([id], [maTuyen], [gioXuatPhat], [gioKetThuc]) VALUES (53, 1, CAST(N'14:40:00' AS Time), CAST(N'15:25:00' AS Time))
INSERT [dbo].[ChuyenXe] ([id], [maTuyen], [gioXuatPhat], [gioKetThuc]) VALUES (54, 1, CAST(N'14:50:00' AS Time), CAST(N'15:35:00' AS Time))
INSERT [dbo].[ChuyenXe] ([id], [maTuyen], [gioXuatPhat], [gioKetThuc]) VALUES (55, 1, CAST(N'15:00:00' AS Time), CAST(N'15:45:00' AS Time))
INSERT [dbo].[ChuyenXe] ([id], [maTuyen], [gioXuatPhat], [gioKetThuc]) VALUES (56, 1, CAST(N'15:10:00' AS Time), CAST(N'15:55:00' AS Time))
INSERT [dbo].[ChuyenXe] ([id], [maTuyen], [gioXuatPhat], [gioKetThuc]) VALUES (57, 1, CAST(N'15:20:00' AS Time), CAST(N'16:05:00' AS Time))
INSERT [dbo].[ChuyenXe] ([id], [maTuyen], [gioXuatPhat], [gioKetThuc]) VALUES (58, 1, CAST(N'15:30:00' AS Time), CAST(N'16:15:00' AS Time))
INSERT [dbo].[ChuyenXe] ([id], [maTuyen], [gioXuatPhat], [gioKetThuc]) VALUES (59, 1, CAST(N'15:40:00' AS Time), CAST(N'16:25:00' AS Time))
INSERT [dbo].[ChuyenXe] ([id], [maTuyen], [gioXuatPhat], [gioKetThuc]) VALUES (60, 1, CAST(N'15:50:00' AS Time), CAST(N'16:35:00' AS Time))
INSERT [dbo].[ChuyenXe] ([id], [maTuyen], [gioXuatPhat], [gioKetThuc]) VALUES (61, 1, CAST(N'16:00:00' AS Time), CAST(N'16:45:00' AS Time))
INSERT [dbo].[ChuyenXe] ([id], [maTuyen], [gioXuatPhat], [gioKetThuc]) VALUES (62, 1, CAST(N'16:10:00' AS Time), CAST(N'16:55:00' AS Time))
INSERT [dbo].[ChuyenXe] ([id], [maTuyen], [gioXuatPhat], [gioKetThuc]) VALUES (63, 1, CAST(N'16:20:00' AS Time), CAST(N'17:05:00' AS Time))
INSERT [dbo].[ChuyenXe] ([id], [maTuyen], [gioXuatPhat], [gioKetThuc]) VALUES (64, 1, CAST(N'16:30:00' AS Time), CAST(N'17:15:00' AS Time))
INSERT [dbo].[ChuyenXe] ([id], [maTuyen], [gioXuatPhat], [gioKetThuc]) VALUES (65, 1, CAST(N'16:40:00' AS Time), CAST(N'17:25:00' AS Time))
INSERT [dbo].[ChuyenXe] ([id], [maTuyen], [gioXuatPhat], [gioKetThuc]) VALUES (66, 1, CAST(N'16:50:00' AS Time), CAST(N'17:35:00' AS Time))
INSERT [dbo].[ChuyenXe] ([id], [maTuyen], [gioXuatPhat], [gioKetThuc]) VALUES (67, 1, CAST(N'17:00:00' AS Time), CAST(N'17:45:00' AS Time))
INSERT [dbo].[ChuyenXe] ([id], [maTuyen], [gioXuatPhat], [gioKetThuc]) VALUES (68, 1, CAST(N'17:10:00' AS Time), CAST(N'17:55:00' AS Time))
INSERT [dbo].[ChuyenXe] ([id], [maTuyen], [gioXuatPhat], [gioKetThuc]) VALUES (69, 1, CAST(N'17:20:00' AS Time), CAST(N'18:05:00' AS Time))
INSERT [dbo].[ChuyenXe] ([id], [maTuyen], [gioXuatPhat], [gioKetThuc]) VALUES (70, 1, CAST(N'17:30:00' AS Time), CAST(N'18:15:00' AS Time))
INSERT [dbo].[ChuyenXe] ([id], [maTuyen], [gioXuatPhat], [gioKetThuc]) VALUES (71, 1, CAST(N'17:40:00' AS Time), CAST(N'18:25:00' AS Time))
INSERT [dbo].[ChuyenXe] ([id], [maTuyen], [gioXuatPhat], [gioKetThuc]) VALUES (72, 1, CAST(N'17:50:00' AS Time), CAST(N'18:35:00' AS Time))
INSERT [dbo].[ChuyenXe] ([id], [maTuyen], [gioXuatPhat], [gioKetThuc]) VALUES (73, 1, CAST(N'18:00:00' AS Time), CAST(N'18:45:00' AS Time))
INSERT [dbo].[ChuyenXe] ([id], [maTuyen], [gioXuatPhat], [gioKetThuc]) VALUES (74, 2, CAST(N'06:30:00' AS Time), CAST(N'07:05:00' AS Time))
INSERT [dbo].[ChuyenXe] ([id], [maTuyen], [gioXuatPhat], [gioKetThuc]) VALUES (75, 2, CAST(N'06:40:00' AS Time), CAST(N'07:15:00' AS Time))
INSERT [dbo].[ChuyenXe] ([id], [maTuyen], [gioXuatPhat], [gioKetThuc]) VALUES (76, 2, CAST(N'06:50:00' AS Time), CAST(N'07:25:00' AS Time))
INSERT [dbo].[ChuyenXe] ([id], [maTuyen], [gioXuatPhat], [gioKetThuc]) VALUES (77, 2, CAST(N'07:00:00' AS Time), CAST(N'07:35:00' AS Time))
INSERT [dbo].[ChuyenXe] ([id], [maTuyen], [gioXuatPhat], [gioKetThuc]) VALUES (78, 2, CAST(N'07:10:00' AS Time), CAST(N'07:45:00' AS Time))
INSERT [dbo].[ChuyenXe] ([id], [maTuyen], [gioXuatPhat], [gioKetThuc]) VALUES (79, 2, CAST(N'07:20:00' AS Time), CAST(N'07:55:00' AS Time))
INSERT [dbo].[ChuyenXe] ([id], [maTuyen], [gioXuatPhat], [gioKetThuc]) VALUES (80, 2, CAST(N'07:30:00' AS Time), CAST(N'08:05:00' AS Time))
INSERT [dbo].[ChuyenXe] ([id], [maTuyen], [gioXuatPhat], [gioKetThuc]) VALUES (81, 2, CAST(N'07:40:00' AS Time), CAST(N'08:15:00' AS Time))
INSERT [dbo].[ChuyenXe] ([id], [maTuyen], [gioXuatPhat], [gioKetThuc]) VALUES (82, 2, CAST(N'07:50:00' AS Time), CAST(N'08:25:00' AS Time))
INSERT [dbo].[ChuyenXe] ([id], [maTuyen], [gioXuatPhat], [gioKetThuc]) VALUES (83, 2, CAST(N'08:00:00' AS Time), CAST(N'08:35:00' AS Time))
INSERT [dbo].[ChuyenXe] ([id], [maTuyen], [gioXuatPhat], [gioKetThuc]) VALUES (84, 2, CAST(N'08:10:00' AS Time), CAST(N'08:45:00' AS Time))
INSERT [dbo].[ChuyenXe] ([id], [maTuyen], [gioXuatPhat], [gioKetThuc]) VALUES (85, 2, CAST(N'08:20:00' AS Time), CAST(N'08:55:00' AS Time))
INSERT [dbo].[ChuyenXe] ([id], [maTuyen], [gioXuatPhat], [gioKetThuc]) VALUES (86, 2, CAST(N'08:30:00' AS Time), CAST(N'09:05:00' AS Time))
INSERT [dbo].[ChuyenXe] ([id], [maTuyen], [gioXuatPhat], [gioKetThuc]) VALUES (87, 2, CAST(N'08:40:00' AS Time), CAST(N'09:15:00' AS Time))
INSERT [dbo].[ChuyenXe] ([id], [maTuyen], [gioXuatPhat], [gioKetThuc]) VALUES (88, 2, CAST(N'08:50:00' AS Time), CAST(N'09:25:00' AS Time))
INSERT [dbo].[ChuyenXe] ([id], [maTuyen], [gioXuatPhat], [gioKetThuc]) VALUES (89, 2, CAST(N'09:00:00' AS Time), CAST(N'09:35:00' AS Time))
INSERT [dbo].[ChuyenXe] ([id], [maTuyen], [gioXuatPhat], [gioKetThuc]) VALUES (90, 2, CAST(N'09:10:00' AS Time), CAST(N'09:45:00' AS Time))
INSERT [dbo].[ChuyenXe] ([id], [maTuyen], [gioXuatPhat], [gioKetThuc]) VALUES (91, 2, CAST(N'09:20:00' AS Time), CAST(N'09:55:00' AS Time))
INSERT [dbo].[ChuyenXe] ([id], [maTuyen], [gioXuatPhat], [gioKetThuc]) VALUES (92, 2, CAST(N'09:30:00' AS Time), CAST(N'10:05:00' AS Time))
INSERT [dbo].[ChuyenXe] ([id], [maTuyen], [gioXuatPhat], [gioKetThuc]) VALUES (93, 2, CAST(N'09:40:00' AS Time), CAST(N'10:15:00' AS Time))
INSERT [dbo].[ChuyenXe] ([id], [maTuyen], [gioXuatPhat], [gioKetThuc]) VALUES (94, 2, CAST(N'09:50:00' AS Time), CAST(N'10:25:00' AS Time))
INSERT [dbo].[ChuyenXe] ([id], [maTuyen], [gioXuatPhat], [gioKetThuc]) VALUES (95, 2, CAST(N'10:00:00' AS Time), CAST(N'10:35:00' AS Time))
INSERT [dbo].[ChuyenXe] ([id], [maTuyen], [gioXuatPhat], [gioKetThuc]) VALUES (96, 2, CAST(N'10:10:00' AS Time), CAST(N'10:45:00' AS Time))
INSERT [dbo].[ChuyenXe] ([id], [maTuyen], [gioXuatPhat], [gioKetThuc]) VALUES (97, 2, CAST(N'10:20:00' AS Time), CAST(N'10:55:00' AS Time))
INSERT [dbo].[ChuyenXe] ([id], [maTuyen], [gioXuatPhat], [gioKetThuc]) VALUES (98, 2, CAST(N'10:30:00' AS Time), CAST(N'11:05:00' AS Time))
INSERT [dbo].[ChuyenXe] ([id], [maTuyen], [gioXuatPhat], [gioKetThuc]) VALUES (99, 2, CAST(N'10:40:00' AS Time), CAST(N'11:15:00' AS Time))
GO
INSERT [dbo].[ChuyenXe] ([id], [maTuyen], [gioXuatPhat], [gioKetThuc]) VALUES (100, 2, CAST(N'10:50:00' AS Time), CAST(N'11:25:00' AS Time))
INSERT [dbo].[ChuyenXe] ([id], [maTuyen], [gioXuatPhat], [gioKetThuc]) VALUES (101, 2, CAST(N'11:00:00' AS Time), CAST(N'11:35:00' AS Time))
INSERT [dbo].[ChuyenXe] ([id], [maTuyen], [gioXuatPhat], [gioKetThuc]) VALUES (102, 2, CAST(N'11:10:00' AS Time), CAST(N'11:45:00' AS Time))
INSERT [dbo].[ChuyenXe] ([id], [maTuyen], [gioXuatPhat], [gioKetThuc]) VALUES (103, 2, CAST(N'11:20:00' AS Time), CAST(N'11:55:00' AS Time))
INSERT [dbo].[ChuyenXe] ([id], [maTuyen], [gioXuatPhat], [gioKetThuc]) VALUES (104, 2, CAST(N'11:30:00' AS Time), CAST(N'12:05:00' AS Time))
INSERT [dbo].[ChuyenXe] ([id], [maTuyen], [gioXuatPhat], [gioKetThuc]) VALUES (105, 2, CAST(N'11:40:00' AS Time), CAST(N'12:15:00' AS Time))
INSERT [dbo].[ChuyenXe] ([id], [maTuyen], [gioXuatPhat], [gioKetThuc]) VALUES (106, 2, CAST(N'11:50:00' AS Time), CAST(N'12:25:00' AS Time))
INSERT [dbo].[ChuyenXe] ([id], [maTuyen], [gioXuatPhat], [gioKetThuc]) VALUES (107, 2, CAST(N'12:00:00' AS Time), CAST(N'12:35:00' AS Time))
INSERT [dbo].[ChuyenXe] ([id], [maTuyen], [gioXuatPhat], [gioKetThuc]) VALUES (108, 2, CAST(N'12:10:00' AS Time), CAST(N'12:45:00' AS Time))
INSERT [dbo].[ChuyenXe] ([id], [maTuyen], [gioXuatPhat], [gioKetThuc]) VALUES (109, 2, CAST(N'12:20:00' AS Time), CAST(N'12:55:00' AS Time))
INSERT [dbo].[ChuyenXe] ([id], [maTuyen], [gioXuatPhat], [gioKetThuc]) VALUES (110, 2, CAST(N'12:30:00' AS Time), CAST(N'13:05:00' AS Time))
INSERT [dbo].[ChuyenXe] ([id], [maTuyen], [gioXuatPhat], [gioKetThuc]) VALUES (111, 2, CAST(N'12:40:00' AS Time), CAST(N'13:15:00' AS Time))
INSERT [dbo].[ChuyenXe] ([id], [maTuyen], [gioXuatPhat], [gioKetThuc]) VALUES (112, 2, CAST(N'12:50:00' AS Time), CAST(N'13:25:00' AS Time))
INSERT [dbo].[ChuyenXe] ([id], [maTuyen], [gioXuatPhat], [gioKetThuc]) VALUES (113, 2, CAST(N'13:00:00' AS Time), CAST(N'13:35:00' AS Time))
INSERT [dbo].[ChuyenXe] ([id], [maTuyen], [gioXuatPhat], [gioKetThuc]) VALUES (114, 2, CAST(N'13:10:00' AS Time), CAST(N'13:45:00' AS Time))
INSERT [dbo].[ChuyenXe] ([id], [maTuyen], [gioXuatPhat], [gioKetThuc]) VALUES (115, 2, CAST(N'13:20:00' AS Time), CAST(N'13:55:00' AS Time))
INSERT [dbo].[ChuyenXe] ([id], [maTuyen], [gioXuatPhat], [gioKetThuc]) VALUES (116, 2, CAST(N'13:30:00' AS Time), CAST(N'14:05:00' AS Time))
INSERT [dbo].[ChuyenXe] ([id], [maTuyen], [gioXuatPhat], [gioKetThuc]) VALUES (117, 2, CAST(N'13:40:00' AS Time), CAST(N'14:15:00' AS Time))
INSERT [dbo].[ChuyenXe] ([id], [maTuyen], [gioXuatPhat], [gioKetThuc]) VALUES (118, 2, CAST(N'13:50:00' AS Time), CAST(N'14:25:00' AS Time))
INSERT [dbo].[ChuyenXe] ([id], [maTuyen], [gioXuatPhat], [gioKetThuc]) VALUES (119, 2, CAST(N'14:00:00' AS Time), CAST(N'14:35:00' AS Time))
INSERT [dbo].[ChuyenXe] ([id], [maTuyen], [gioXuatPhat], [gioKetThuc]) VALUES (120, 2, CAST(N'14:10:00' AS Time), CAST(N'14:45:00' AS Time))
INSERT [dbo].[ChuyenXe] ([id], [maTuyen], [gioXuatPhat], [gioKetThuc]) VALUES (121, 2, CAST(N'14:20:00' AS Time), CAST(N'14:55:00' AS Time))
INSERT [dbo].[ChuyenXe] ([id], [maTuyen], [gioXuatPhat], [gioKetThuc]) VALUES (122, 2, CAST(N'14:30:00' AS Time), CAST(N'15:05:00' AS Time))
INSERT [dbo].[ChuyenXe] ([id], [maTuyen], [gioXuatPhat], [gioKetThuc]) VALUES (123, 2, CAST(N'14:40:00' AS Time), CAST(N'15:15:00' AS Time))
INSERT [dbo].[ChuyenXe] ([id], [maTuyen], [gioXuatPhat], [gioKetThuc]) VALUES (124, 2, CAST(N'14:50:00' AS Time), CAST(N'15:25:00' AS Time))
INSERT [dbo].[ChuyenXe] ([id], [maTuyen], [gioXuatPhat], [gioKetThuc]) VALUES (125, 2, CAST(N'15:00:00' AS Time), CAST(N'15:35:00' AS Time))
INSERT [dbo].[ChuyenXe] ([id], [maTuyen], [gioXuatPhat], [gioKetThuc]) VALUES (126, 2, CAST(N'15:10:00' AS Time), CAST(N'15:45:00' AS Time))
INSERT [dbo].[ChuyenXe] ([id], [maTuyen], [gioXuatPhat], [gioKetThuc]) VALUES (127, 2, CAST(N'15:20:00' AS Time), CAST(N'15:55:00' AS Time))
INSERT [dbo].[ChuyenXe] ([id], [maTuyen], [gioXuatPhat], [gioKetThuc]) VALUES (128, 2, CAST(N'15:30:00' AS Time), CAST(N'16:05:00' AS Time))
INSERT [dbo].[ChuyenXe] ([id], [maTuyen], [gioXuatPhat], [gioKetThuc]) VALUES (129, 2, CAST(N'15:40:00' AS Time), CAST(N'16:15:00' AS Time))
INSERT [dbo].[ChuyenXe] ([id], [maTuyen], [gioXuatPhat], [gioKetThuc]) VALUES (130, 2, CAST(N'15:50:00' AS Time), CAST(N'16:25:00' AS Time))
INSERT [dbo].[ChuyenXe] ([id], [maTuyen], [gioXuatPhat], [gioKetThuc]) VALUES (131, 2, CAST(N'16:00:00' AS Time), CAST(N'16:35:00' AS Time))
INSERT [dbo].[ChuyenXe] ([id], [maTuyen], [gioXuatPhat], [gioKetThuc]) VALUES (132, 2, CAST(N'16:10:00' AS Time), CAST(N'16:45:00' AS Time))
INSERT [dbo].[ChuyenXe] ([id], [maTuyen], [gioXuatPhat], [gioKetThuc]) VALUES (133, 2, CAST(N'16:20:00' AS Time), CAST(N'16:55:00' AS Time))
INSERT [dbo].[ChuyenXe] ([id], [maTuyen], [gioXuatPhat], [gioKetThuc]) VALUES (134, 2, CAST(N'16:30:00' AS Time), CAST(N'17:05:00' AS Time))
INSERT [dbo].[ChuyenXe] ([id], [maTuyen], [gioXuatPhat], [gioKetThuc]) VALUES (135, 2, CAST(N'16:40:00' AS Time), CAST(N'17:15:00' AS Time))
INSERT [dbo].[ChuyenXe] ([id], [maTuyen], [gioXuatPhat], [gioKetThuc]) VALUES (136, 2, CAST(N'16:50:00' AS Time), CAST(N'17:25:00' AS Time))
INSERT [dbo].[ChuyenXe] ([id], [maTuyen], [gioXuatPhat], [gioKetThuc]) VALUES (137, 2, CAST(N'17:00:00' AS Time), CAST(N'17:35:00' AS Time))
INSERT [dbo].[ChuyenXe] ([id], [maTuyen], [gioXuatPhat], [gioKetThuc]) VALUES (138, 2, CAST(N'17:10:00' AS Time), CAST(N'17:45:00' AS Time))
INSERT [dbo].[ChuyenXe] ([id], [maTuyen], [gioXuatPhat], [gioKetThuc]) VALUES (139, 2, CAST(N'17:20:00' AS Time), CAST(N'17:55:00' AS Time))
INSERT [dbo].[ChuyenXe] ([id], [maTuyen], [gioXuatPhat], [gioKetThuc]) VALUES (140, 2, CAST(N'17:30:00' AS Time), CAST(N'18:05:00' AS Time))
SET IDENTITY_INSERT [dbo].[ChuyenXe] OFF
GO
SET IDENTITY_INSERT [dbo].[CTChuyen] ON 

INSERT [dbo].[CTChuyen] ([id], [idPhanCong], [idChuyen]) VALUES (1, 1, 1)
INSERT [dbo].[CTChuyen] ([id], [idPhanCong], [idChuyen]) VALUES (2, 2, 2)
INSERT [dbo].[CTChuyen] ([id], [idPhanCong], [idChuyen]) VALUES (3, 3, 74)
INSERT [dbo].[CTChuyen] ([id], [idPhanCong], [idChuyen]) VALUES (4, 4, 1)
SET IDENTITY_INSERT [dbo].[CTChuyen] OFF
GO
SET IDENTITY_INSERT [dbo].[GiaVeLuot] ON 

INSERT [dbo].[GiaVeLuot] ([maGia], [maCheDo], [giaVeLuot], [thoiGianApDung]) VALUES (1, N'uutien', 3000.0000, NULL)
INSERT [dbo].[GiaVeLuot] ([maGia], [maCheDo], [giaVeLuot], [thoiGianApDung]) VALUES (2, N'thuong', 7000.0000, NULL)
SET IDENTITY_INSERT [dbo].[GiaVeLuot] OFF
GO
SET IDENTITY_INSERT [dbo].[GiaVeThang] ON 

INSERT [dbo].[GiaVeThang] ([maGia], [maCheDo], [giaVeThang], [thoiGianApDung]) VALUES (1, N'uutien', 180000.0000, NULL)
INSERT [dbo].[GiaVeThang] ([maGia], [maCheDo], [giaVeThang], [thoiGianApDung]) VALUES (2, N'thuong', 220000.0000, NULL)
SET IDENTITY_INSERT [dbo].[GiaVeThang] OFF
GO
SET IDENTITY_INSERT [dbo].[KhachThang] ON 

INSERT [dbo].[KhachThang] ([maKhachThang], [hoTen], [ngaySinh], [note]) VALUES (1, N'Nguyễn Ngọc Quang', CAST(N'2021-08-11' AS Date), N'')
INSERT [dbo].[KhachThang] ([maKhachThang], [hoTen], [ngaySinh], [note]) VALUES (2, N'Nguyễn Thành Thắng', CAST(N'2021-08-11' AS Date), N'')
SET IDENTITY_INSERT [dbo].[KhachThang] OFF
GO
SET IDENTITY_INSERT [dbo].[NhanVien] ON 

INSERT [dbo].[NhanVien] ([maNhanvien], [hoTen], [email], [soDienThoai], [gioiTinh], [namSinh], [diaChi]) VALUES (1, N'Trần Thị Thanh Tâm', N'shyn.tt@gmail.com', N'0386523343', 0, CAST(N'2000-01-30' AS Date), N'Quận 9')
INSERT [dbo].[NhanVien] ([maNhanvien], [hoTen], [email], [soDienThoai], [gioiTinh], [namSinh], [diaChi]) VALUES (2, N'Nguyễn Quốc Huy', N'n18dcat067@student.ptithcm.edu.vn', N'0338504340', 1, CAST(N'2000-08-11' AS Date), NULL)
INSERT [dbo].[NhanVien] ([maNhanvien], [hoTen], [email], [soDienThoai], [gioiTinh], [namSinh], [diaChi]) VALUES (3, N'Huỳnh Đình Vũ', N'hdinhvu156@gmail.com', N'0386523347', 1, CAST(N'2000-01-02' AS Date), NULL)
INSERT [dbo].[NhanVien] ([maNhanvien], [hoTen], [email], [soDienThoai], [gioiTinh], [namSinh], [diaChi]) VALUES (4, N'Võ Thành Nam', N'shyn.tt02@gmail.com', N'0386523349', 1, CAST(N'2000-01-20' AS Date), NULL)
SET IDENTITY_INSERT [dbo].[NhanVien] OFF
GO
SET IDENTITY_INSERT [dbo].[PhanCong] ON 

INSERT [dbo].[PhanCong] ([idPhanCong], [maNhanVien], [bienSoXe], [ngay]) VALUES (1, 2, N'XXX-XXXX', CAST(N'2021-08-11' AS Date))
INSERT [dbo].[PhanCong] ([idPhanCong], [maNhanVien], [bienSoXe], [ngay]) VALUES (2, 4, N'YYY-YYYY', CAST(N'2021-08-11' AS Date))
INSERT [dbo].[PhanCong] ([idPhanCong], [maNhanVien], [bienSoXe], [ngay]) VALUES (3, 3, N'ZZZ-ZZZZ', CAST(N'2021-08-11' AS Date))
INSERT [dbo].[PhanCong] ([idPhanCong], [maNhanVien], [bienSoXe], [ngay]) VALUES (4, 2, N'XXX-XXXX', CAST(N'2021-08-12' AS Date))
SET IDENTITY_INSERT [dbo].[PhanCong] OFF
GO
INSERT [dbo].[Role] ([maRole], [tenRole]) VALUES (N'admin', N'Admin')
INSERT [dbo].[Role] ([maRole], [tenRole]) VALUES (N'staff', N'Nhân viên')
GO
SET IDENTITY_INSERT [dbo].[TaiKhoan] ON 

INSERT [dbo].[TaiKhoan] ([maTaiKhoan], [username], [password], [maRole], [maNhanVien], [image]) VALUES (1, N'admin', N'21232f297a57a5a743894a0e4a801fc3', N'admin', 1, N'1628696843001-30442528_850202555159747_8709276425892397056_n.jpg')
SET IDENTITY_INSERT [dbo].[TaiKhoan] OFF
GO
SET IDENTITY_INSERT [dbo].[ThongTinVeLuot] ON 

INSERT [dbo].[ThongTinVeLuot] ([id], [maPhanCong], [maGiaLuot], [soLuong]) VALUES (1, 1, 1, 9)
INSERT [dbo].[ThongTinVeLuot] ([id], [maPhanCong], [maGiaLuot], [soLuong]) VALUES (2, 1, 2, 13)
INSERT [dbo].[ThongTinVeLuot] ([id], [maPhanCong], [maGiaLuot], [soLuong]) VALUES (3, 2, 1, 0)
INSERT [dbo].[ThongTinVeLuot] ([id], [maPhanCong], [maGiaLuot], [soLuong]) VALUES (4, 2, 2, 0)
INSERT [dbo].[ThongTinVeLuot] ([id], [maPhanCong], [maGiaLuot], [soLuong]) VALUES (5, 3, 1, 4)
INSERT [dbo].[ThongTinVeLuot] ([id], [maPhanCong], [maGiaLuot], [soLuong]) VALUES (6, 3, 2, 4)
INSERT [dbo].[ThongTinVeLuot] ([id], [maPhanCong], [maGiaLuot], [soLuong]) VALUES (7, 4, 1, 0)
INSERT [dbo].[ThongTinVeLuot] ([id], [maPhanCong], [maGiaLuot], [soLuong]) VALUES (8, 4, 2, 0)
SET IDENTITY_INSERT [dbo].[ThongTinVeLuot] OFF
GO
SET IDENTITY_INSERT [dbo].[ThongTinVeThang] ON 

INSERT [dbo].[ThongTinVeThang] ([maVeThang], [maKhachThang], [maTuyenXe]) VALUES (7, 1, 1)
SET IDENTITY_INSERT [dbo].[ThongTinVeThang] OFF
GO
SET IDENTITY_INSERT [dbo].[ThongTinVeThangDetail] ON 

INSERT [dbo].[ThongTinVeThangDetail] ([id], [maGiaThang], [ngayMua], [ngayHetHan], [maVeThang], [addNewBy], [addNewDate]) VALUES (10, 1, CAST(N'2021-08-12' AS Date), CAST(N'2021-08-31' AS Date), 7, 1, CAST(N'2021-08-12' AS Date))
INSERT [dbo].[ThongTinVeThangDetail] ([id], [maGiaThang], [ngayMua], [ngayHetHan], [maVeThang], [addNewBy], [addNewDate]) VALUES (11, 2, CAST(N'2021-08-12' AS Date), CAST(N'2021-08-31' AS Date), 7, 2, CAST(N'2021-08-12' AS Date))
SET IDENTITY_INSERT [dbo].[ThongTinVeThangDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[TuyenXe] ON 

INSERT [dbo].[TuyenXe] ([maTuyen], [tenTuyen], [thoiGianChuyen], [thoiGianNghi], [mocTuyen1], [mocTuyen2], [thoiGianBatDau], [thoiGianKetThuc]) VALUES (1, N'Tuyến 1', 45, 10, N'ĐH FPT', N'PTITHCM', CAST(N'06:00:00' AS Time), CAST(N'18:00:00' AS Time))
INSERT [dbo].[TuyenXe] ([maTuyen], [tenTuyen], [thoiGianChuyen], [thoiGianNghi], [mocTuyen1], [mocTuyen2], [thoiGianBatDau], [thoiGianKetThuc]) VALUES (2, N'Tuyến 2', 35, 10, N'PTITHCM', N'ĐH Nông Lâm', CAST(N'06:30:00' AS Time), CAST(N'17:30:00' AS Time))
SET IDENTITY_INSERT [dbo].[TuyenXe] OFF
GO
INSERT [dbo].[Xe] ([bienSoXe]) VALUES (N'AAA-AAAA')
INSERT [dbo].[Xe] ([bienSoXe]) VALUES (N'XXX-XXXX')
INSERT [dbo].[Xe] ([bienSoXe]) VALUES (N'YYY-YYYY')
INSERT [dbo].[Xe] ([bienSoXe]) VALUES (N'ZZZ-ZZZZ')
GO
/****** Object:  Index [UQ__TaiKhoan__BDDEF20C196D9AE6]    Script Date: 8/12/2021 1:29:00 AM ******/
ALTER TABLE [dbo].[TaiKhoan] ADD UNIQUE NONCLUSTERED 
(
	[maNhanVien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__TaiKhoan__F3DBC572E5D1F0D9]    Script Date: 8/12/2021 1:29:00 AM ******/
ALTER TABLE [dbo].[TaiKhoan] ADD UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ChuyenXe]  WITH CHECK ADD  CONSTRAINT [fk_chuyenxe_tuyenxe_123] FOREIGN KEY([maTuyen])
REFERENCES [dbo].[TuyenXe] ([maTuyen])
GO
ALTER TABLE [dbo].[ChuyenXe] CHECK CONSTRAINT [fk_chuyenxe_tuyenxe_123]
GO
ALTER TABLE [dbo].[CTChuyen]  WITH CHECK ADD FOREIGN KEY([idChuyen])
REFERENCES [dbo].[ChuyenXe] ([id])
GO
ALTER TABLE [dbo].[CTChuyen]  WITH CHECK ADD FOREIGN KEY([idChuyen])
REFERENCES [dbo].[ChuyenXe] ([id])
GO
ALTER TABLE [dbo].[CTChuyen]  WITH CHECK ADD FOREIGN KEY([idPhanCong])
REFERENCES [dbo].[PhanCong] ([idPhanCong])
GO
ALTER TABLE [dbo].[CTChuyen]  WITH CHECK ADD FOREIGN KEY([idPhanCong])
REFERENCES [dbo].[PhanCong] ([idPhanCong])
GO
ALTER TABLE [dbo].[GiaVeLuot]  WITH CHECK ADD FOREIGN KEY([maCheDo])
REFERENCES [dbo].[CheDo] ([maCheDo])
GO
ALTER TABLE [dbo].[GiaVeLuot]  WITH CHECK ADD FOREIGN KEY([maCheDo])
REFERENCES [dbo].[CheDo] ([maCheDo])
GO
ALTER TABLE [dbo].[GiaVeLuot]  WITH CHECK ADD FOREIGN KEY([maCheDo])
REFERENCES [dbo].[CheDo] ([maCheDo])
GO
ALTER TABLE [dbo].[GiaVeLuot]  WITH CHECK ADD FOREIGN KEY([maCheDo])
REFERENCES [dbo].[CheDo] ([maCheDo])
GO
ALTER TABLE [dbo].[GiaVeThang]  WITH CHECK ADD FOREIGN KEY([maCheDo])
REFERENCES [dbo].[CheDo] ([maCheDo])
GO
ALTER TABLE [dbo].[GiaVeThang]  WITH CHECK ADD FOREIGN KEY([maCheDo])
REFERENCES [dbo].[CheDo] ([maCheDo])
GO
ALTER TABLE [dbo].[GiaVeThang]  WITH CHECK ADD FOREIGN KEY([maCheDo])
REFERENCES [dbo].[CheDo] ([maCheDo])
GO
ALTER TABLE [dbo].[GiaVeThang]  WITH CHECK ADD FOREIGN KEY([maCheDo])
REFERENCES [dbo].[CheDo] ([maCheDo])
GO
ALTER TABLE [dbo].[PhanCong]  WITH CHECK ADD FOREIGN KEY([bienSoXe])
REFERENCES [dbo].[Xe] ([bienSoXe])
GO
ALTER TABLE [dbo].[PhanCong]  WITH CHECK ADD FOREIGN KEY([bienSoXe])
REFERENCES [dbo].[Xe] ([bienSoXe])
GO
ALTER TABLE [dbo].[PhanCong]  WITH CHECK ADD FOREIGN KEY([maNhanVien])
REFERENCES [dbo].[NhanVien] ([maNhanvien])
GO
ALTER TABLE [dbo].[PhanCong]  WITH CHECK ADD FOREIGN KEY([maNhanVien])
REFERENCES [dbo].[NhanVien] ([maNhanvien])
GO
ALTER TABLE [dbo].[TaiKhoan]  WITH CHECK ADD FOREIGN KEY([maNhanVien])
REFERENCES [dbo].[NhanVien] ([maNhanvien])
GO
ALTER TABLE [dbo].[TaiKhoan]  WITH CHECK ADD FOREIGN KEY([maNhanVien])
REFERENCES [dbo].[NhanVien] ([maNhanvien])
GO
ALTER TABLE [dbo].[TaiKhoan]  WITH CHECK ADD FOREIGN KEY([maNhanVien])
REFERENCES [dbo].[NhanVien] ([maNhanvien])
GO
ALTER TABLE [dbo].[TaiKhoan]  WITH CHECK ADD FOREIGN KEY([maNhanVien])
REFERENCES [dbo].[NhanVien] ([maNhanvien])
GO
ALTER TABLE [dbo].[TaiKhoan]  WITH CHECK ADD FOREIGN KEY([maRole])
REFERENCES [dbo].[Role] ([maRole])
GO
ALTER TABLE [dbo].[TaiKhoan]  WITH CHECK ADD FOREIGN KEY([maRole])
REFERENCES [dbo].[Role] ([maRole])
GO
ALTER TABLE [dbo].[TaiKhoan]  WITH CHECK ADD FOREIGN KEY([maRole])
REFERENCES [dbo].[Role] ([maRole])
GO
ALTER TABLE [dbo].[TaiKhoan]  WITH CHECK ADD FOREIGN KEY([maRole])
REFERENCES [dbo].[Role] ([maRole])
GO
ALTER TABLE [dbo].[ThongTinVeLuot]  WITH CHECK ADD FOREIGN KEY([maGiaLuot])
REFERENCES [dbo].[GiaVeLuot] ([maGia])
GO
ALTER TABLE [dbo].[ThongTinVeLuot]  WITH CHECK ADD FOREIGN KEY([maGiaLuot])
REFERENCES [dbo].[GiaVeLuot] ([maGia])
GO
ALTER TABLE [dbo].[ThongTinVeLuot]  WITH CHECK ADD  CONSTRAINT [fk_ThongTinVeLuot_PhanCong_mdf] FOREIGN KEY([maPhanCong])
REFERENCES [dbo].[PhanCong] ([idPhanCong])
GO
ALTER TABLE [dbo].[ThongTinVeLuot] CHECK CONSTRAINT [fk_ThongTinVeLuot_PhanCong_mdf]
GO
ALTER TABLE [dbo].[ThongTinVeThang]  WITH CHECK ADD FOREIGN KEY([maKhachThang])
REFERENCES [dbo].[KhachThang] ([maKhachThang])
GO
ALTER TABLE [dbo].[ThongTinVeThang]  WITH CHECK ADD FOREIGN KEY([maKhachThang])
REFERENCES [dbo].[KhachThang] ([maKhachThang])
GO
ALTER TABLE [dbo].[ThongTinVeThang]  WITH CHECK ADD FOREIGN KEY([maKhachThang])
REFERENCES [dbo].[KhachThang] ([maKhachThang])
GO
ALTER TABLE [dbo].[ThongTinVeThang]  WITH CHECK ADD FOREIGN KEY([maKhachThang])
REFERENCES [dbo].[KhachThang] ([maKhachThang])
GO
ALTER TABLE [dbo].[ThongTinVeThangDetail]  WITH CHECK ADD FOREIGN KEY([maGiaThang])
REFERENCES [dbo].[GiaVeThang] ([maGia])
GO
ALTER TABLE [dbo].[ThongTinVeThangDetail]  WITH CHECK ADD FOREIGN KEY([maGiaThang])
REFERENCES [dbo].[GiaVeThang] ([maGia])
GO
ALTER TABLE [dbo].[ThongTinVeThangDetail]  WITH CHECK ADD FOREIGN KEY([maGiaThang])
REFERENCES [dbo].[GiaVeThang] ([maGia])
GO
ALTER TABLE [dbo].[ThongTinVeThangDetail]  WITH CHECK ADD FOREIGN KEY([maGiaThang])
REFERENCES [dbo].[GiaVeThang] ([maGia])
GO
ALTER TABLE [dbo].[ThongTinVeThangDetail]  WITH CHECK ADD FOREIGN KEY([maVeThang])
REFERENCES [dbo].[ThongTinVeThang] ([maVeThang])
GO
ALTER TABLE [dbo].[ThongTinVeThangDetail]  WITH CHECK ADD FOREIGN KEY([maVeThang])
REFERENCES [dbo].[ThongTinVeThang] ([maVeThang])
GO
ALTER TABLE [dbo].[ThongTinVeThangDetail]  WITH CHECK ADD FOREIGN KEY([maVeThang])
REFERENCES [dbo].[ThongTinVeThang] ([maVeThang])
GO
ALTER TABLE [dbo].[ThongTinVeThangDetail]  WITH CHECK ADD FOREIGN KEY([maVeThang])
REFERENCES [dbo].[ThongTinVeThang] ([maVeThang])
GO
ALTER TABLE [dbo].[GiaVeLuot]  WITH CHECK ADD CHECK  (([giaVeLuot]>(0)))
GO
ALTER TABLE [dbo].[GiaVeLuot]  WITH CHECK ADD CHECK  (([giaVeLuot]>(0)))
GO
ALTER TABLE [dbo].[GiaVeLuot]  WITH CHECK ADD CHECK  (([giaVeLuot]>(0)))
GO
ALTER TABLE [dbo].[GiaVeLuot]  WITH CHECK ADD CHECK  (([giaVeLuot]>(0)))
GO
ALTER TABLE [dbo].[GiaVeThang]  WITH CHECK ADD CHECK  (([giaVeThang]>(0)))
GO
ALTER TABLE [dbo].[GiaVeThang]  WITH CHECK ADD CHECK  (([giaVeThang]>(0)))
GO
ALTER TABLE [dbo].[GiaVeThang]  WITH CHECK ADD CHECK  (([giaVeThang]>(0)))
GO
ALTER TABLE [dbo].[GiaVeThang]  WITH CHECK ADD CHECK  (([giaVeThang]>(0)))
GO
USE [master]
GO
ALTER DATABASE [QUANLYBANVEXEBUS7] SET  READ_WRITE 
GO
