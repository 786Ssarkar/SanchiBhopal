USE [master]
GO
/****** Object:  Database [DbSanchi]    Script Date: 30-Sep-24 1:45:54 PM ******/
CREATE DATABASE [DbSanchi]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DbSanchi', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\DbSanchi.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DbSanchi_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\DbSanchi_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [DbSanchi] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DbSanchi].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DbSanchi] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DbSanchi] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DbSanchi] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DbSanchi] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DbSanchi] SET ARITHABORT OFF 
GO
ALTER DATABASE [DbSanchi] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DbSanchi] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DbSanchi] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DbSanchi] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DbSanchi] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DbSanchi] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DbSanchi] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DbSanchi] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DbSanchi] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DbSanchi] SET  ENABLE_BROKER 
GO
ALTER DATABASE [DbSanchi] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DbSanchi] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DbSanchi] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DbSanchi] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DbSanchi] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DbSanchi] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DbSanchi] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DbSanchi] SET RECOVERY FULL 
GO
ALTER DATABASE [DbSanchi] SET  MULTI_USER 
GO
ALTER DATABASE [DbSanchi] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DbSanchi] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DbSanchi] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DbSanchi] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DbSanchi] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DbSanchi] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'DbSanchi', N'ON'
GO
ALTER DATABASE [DbSanchi] SET QUERY_STORE = ON
GO
ALTER DATABASE [DbSanchi] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [DbSanchi]
GO
/****** Object:  UserDefinedTableType [dbo].[DemandItems]    Script Date: 30-Sep-24 1:45:55 PM ******/
CREATE TYPE [dbo].[DemandItems] AS TABLE(
	[ItemName] [varchar](50) NULL,
	[Quantity] [int] NULL,
	[AdvancedCard] [int] NULL
)
GO
/****** Object:  Table [dbo].[mst_Item]    Script Date: 30-Sep-24 1:45:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mst_Item](
	[ItemID] [int] IDENTITY(1,1) NOT NULL,
	[ItemName] [varchar](50) NULL,
	[ItemCategory] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[mst_Unit]    Script Date: 30-Sep-24 1:45:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mst_Unit](
	[UnitID] [int] IDENTITY(1,1) NOT NULL,
	[UnitName] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[UnitID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PlantManufacturingData]    Script Date: 30-Sep-24 1:45:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlantManufacturingData](
	[ManufItemId] [int] IDENTITY(1,1) NOT NULL,
	[Date] [date] NULL,
	[ItemName] [varchar](50) NULL,
	[Quantity] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[trn_Demand]    Script Date: 30-Sep-24 1:45:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[trn_Demand](
	[DemandId] [int] IDENTITY(1,1) NOT NULL,
	[Date] [date] NULL,
	[ItemCategory] [varchar](50) NULL,
	[Shift] [varchar](10) NULL,
	[Retailer] [varchar](50) NULL,
	[VehicleNo] [varchar](20) NULL,
	[DemandType] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[DemandId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[trn_DemandsChild]    Script Date: 30-Sep-24 1:45:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[trn_DemandsChild](
	[DemandsChildID] [int] IDENTITY(1,1) NOT NULL,
	[DemandId] [int] NULL,
	[ItemName] [varchar](50) NULL,
	[Quantity] [int] NULL,
	[AdvancedCard] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[DemandsChildID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Trn_InflowDetails]    Script Date: 30-Sep-24 1:45:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Trn_InflowDetails](
	[InflowId] [int] IDENTITY(1,1) NOT NULL,
	[UnitID] [int] NULL,
	[Date] [date] NULL,
	[Milkqty] [int] NULL,
	[Milkfat] [decimal](18, 2) NULL,
	[MilkSNF] [decimal](18, 2) NULL,
	[Milkfatperc] [decimal](18, 2) NULL,
	[MilkSNFperc] [decimal](18, 2) NULL,
	[Butterqty] [int] NULL,
	[Butterstock] [int] NULL,
	[MilkPowderqty] [int] NULL,
	[MilkPowderstock] [int] NULL,
	[IsVerifed] [bit] NULL,
	[IsApproved] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[InflowId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[trn_Sale]    Script Date: 30-Sep-24 1:45:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[trn_Sale](
	[SalesID] [int] IDENTITY(1,1) NOT NULL,
	[NameOfUnit] [varchar](100) NOT NULL,
	[Date] [date] NOT NULL,
	[ItemCategory] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SalesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[trn_SaleChild]    Script Date: 30-Sep-24 1:45:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[trn_SaleChild](
	[SaleChildid] [int] IDENTITY(1,1) NOT NULL,
	[SalesID] [int] NULL,
	[ItemName] [varchar](50) NOT NULL,
	[Quantity] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SaleChildid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[mst_Item] ON 
GO
INSERT [dbo].[mst_Item] ([ItemID], [ItemName], [ItemCategory]) VALUES (1, N'STD', N'Milk')
GO
INSERT [dbo].[mst_Item] ([ItemID], [ItemName], [ItemCategory]) VALUES (2, N'DTM', N'Milk')
GO
INSERT [dbo].[mst_Item] ([ItemID], [ItemName], [ItemCategory]) VALUES (3, N'LITE', N'Milk')
GO
INSERT [dbo].[mst_Item] ([ItemID], [ItemName], [ItemCategory]) VALUES (4, N'FCM', N'Milk')
GO
INSERT [dbo].[mst_Item] ([ItemID], [ItemName], [ItemCategory]) VALUES (5, N'Diamond', N'Milk')
GO
INSERT [dbo].[mst_Item] ([ItemID], [ItemName], [ItemCategory]) VALUES (6, N'TM', N'Milk')
GO
INSERT [dbo].[mst_Item] ([ItemID], [ItemName], [ItemCategory]) VALUES (7, N'CHAH', N'Milk')
GO
INSERT [dbo].[mst_Item] ([ItemID], [ItemName], [ItemCategory]) VALUES (8, N'FCM 1L', N'Milk')
GO
INSERT [dbo].[mst_Item] ([ItemID], [ItemName], [ItemCategory]) VALUES (9, N'Chai spl. 1000ML', N'Milk')
GO
INSERT [dbo].[mst_Item] ([ItemID], [ItemName], [ItemCategory]) VALUES (10, N'SMP', N'Product')
GO
INSERT [dbo].[mst_Item] ([ItemID], [ItemName], [ItemCategory]) VALUES (11, N'Sweeten SMP', N'Product')
GO
INSERT [dbo].[mst_Item] ([ItemID], [ItemName], [ItemCategory]) VALUES (12, N'WB', N'Product')
GO
INSERT [dbo].[mst_Item] ([ItemID], [ItemName], [ItemCategory]) VALUES (13, N'Plain curd', N'Product')
GO
INSERT [dbo].[mst_Item] ([ItemID], [ItemName], [ItemCategory]) VALUES (14, N'Sweet Curd', N'Product')
GO
INSERT [dbo].[mst_Item] ([ItemID], [ItemName], [ItemCategory]) VALUES (15, N'Salted Butter Milk 200 ML', N'Product')
GO
INSERT [dbo].[mst_Item] ([ItemID], [ItemName], [ItemCategory]) VALUES (16, N'Plain Butter Milk', N'Product')
GO
INSERT [dbo].[mst_Item] ([ItemID], [ItemName], [ItemCategory]) VALUES (17, N'Cold Coffee', N'Product')
GO
INSERT [dbo].[mst_Item] ([ItemID], [ItemName], [ItemCategory]) VALUES (18, N'Fl.Milk Pet Bottle', N'Product')
GO
INSERT [dbo].[mst_Item] ([ItemID], [ItemName], [ItemCategory]) VALUES (19, N'S.F.M Glass(Bottles)', N'Product')
GO
INSERT [dbo].[mst_Item] ([ItemID], [ItemName], [ItemCategory]) VALUES (20, N'Lassi 200 ML Glass', N'Product')
GO
INSERT [dbo].[mst_Item] ([ItemID], [ItemName], [ItemCategory]) VALUES (21, N'Lite Lassi 200 ML', N'Product')
GO
INSERT [dbo].[mst_Item] ([ItemID], [ItemName], [ItemCategory]) VALUES (22, N'Shrikhand', N'Product')
GO
INSERT [dbo].[mst_Item] ([ItemID], [ItemName], [ItemCategory]) VALUES (23, N'Chena Rabdi', N'Product')
GO
INSERT [dbo].[mst_Item] ([ItemID], [ItemName], [ItemCategory]) VALUES (24, N'Sabudana Kheer 100 gm', N'Product')
GO
INSERT [dbo].[mst_Item] ([ItemID], [ItemName], [ItemCategory]) VALUES (25, N'Peda', N'Product')
GO
INSERT [dbo].[mst_Item] ([ItemID], [ItemName], [ItemCategory]) VALUES (26, N'Milk Cake', N'Product')
GO
INSERT [dbo].[mst_Item] ([ItemID], [ItemName], [ItemCategory]) VALUES (27, N'Mawa', N'Product')
GO
INSERT [dbo].[mst_Item] ([ItemID], [ItemName], [ItemCategory]) VALUES (28, N'Paneer', N'Product')
GO
INSERT [dbo].[mst_Item] ([ItemID], [ItemName], [ItemCategory]) VALUES (29, N'Vaccum Paneer', N'Product')
GO
INSERT [dbo].[mst_Item] ([ItemID], [ItemName], [ItemCategory]) VALUES (30, N'Rasogulla', N'Product')
GO
INSERT [dbo].[mst_Item] ([ItemID], [ItemName], [ItemCategory]) VALUES (31, N'Gulabjamun', N'Product')
GO
INSERT [dbo].[mst_Item] ([ItemID], [ItemName], [ItemCategory]) VALUES (32, N'Shrikhand Lite 100 gms cups', N'Product')
GO
INSERT [dbo].[mst_Item] ([ItemID], [ItemName], [ItemCategory]) VALUES (33, N'Table Butter', N'Product')
GO
INSERT [dbo].[mst_Item] ([ItemID], [ItemName], [ItemCategory]) VALUES (34, N'Cookies', N'Product')
GO
INSERT [dbo].[mst_Item] ([ItemID], [ItemName], [ItemCategory]) VALUES (35, N'Sugar Free Peda', N'Product')
GO
INSERT [dbo].[mst_Item] ([ItemID], [ItemName], [ItemCategory]) VALUES (36, N'Butter Chiplet', N'Product')
GO
INSERT [dbo].[mst_Item] ([ItemID], [ItemName], [ItemCategory]) VALUES (37, N'Besan Laddu', N'Product')
GO
INSERT [dbo].[mst_Item] ([ItemID], [ItemName], [ItemCategory]) VALUES (38, N'Sanchi Neer lit', N'Product')
GO
INSERT [dbo].[mst_Item] ([ItemID], [ItemName], [ItemCategory]) VALUES (39, N'Misti Doi 100gm', N'Product')
GO
INSERT [dbo].[mst_Item] ([ItemID], [ItemName], [ItemCategory]) VALUES (40, N'Braj Peda', N'Product')
GO
INSERT [dbo].[mst_Item] ([ItemID], [ItemName], [ItemCategory]) VALUES (41, N'Amrakhand 100 gms', N'Product')
GO
SET IDENTITY_INSERT [dbo].[mst_Item] OFF
GO
SET IDENTITY_INSERT [dbo].[mst_Unit] ON 
GO
INSERT [dbo].[mst_Unit] ([UnitID], [UnitName]) VALUES (2, N'BHOPAL Route')
GO
INSERT [dbo].[mst_Unit] ([UnitID], [UnitName]) VALUES (3, N'TIMARNI Route')
GO
INSERT [dbo].[mst_Unit] ([UnitID], [UnitName]) VALUES (4, N'HOSHANGABAD Route')
GO
INSERT [dbo].[mst_Unit] ([UnitID], [UnitName]) VALUES (5, N'ITARSI Route')
GO
INSERT [dbo].[mst_Unit] ([UnitID], [UnitName]) VALUES (6, N'PIPRIYA Route')
GO
INSERT [dbo].[mst_Unit] ([UnitID], [UnitName]) VALUES (7, N'VIDISHA Route')
GO
INSERT [dbo].[mst_Unit] ([UnitID], [UnitName]) VALUES (8, N'GANJBASODA Route')
GO
INSERT [dbo].[mst_Unit] ([UnitID], [UnitName]) VALUES (9, N'RAISEN Route')
GO
INSERT [dbo].[mst_Unit] ([UnitID], [UnitName]) VALUES (10, N'BADI Route')
GO
INSERT [dbo].[mst_Unit] ([UnitID], [UnitName]) VALUES (11, N'NARSINGHGARH Route')
GO
INSERT [dbo].[mst_Unit] ([UnitID], [UnitName]) VALUES (12, N'GUNA Route')
GO
INSERT [dbo].[mst_Unit] ([UnitID], [UnitName]) VALUES (13, N'NASRULLAGANJ Route')
GO
INSERT [dbo].[mst_Unit] ([UnitID], [UnitName]) VALUES (14, N'SEHORE Route')
GO
INSERT [dbo].[mst_Unit] ([UnitID], [UnitName]) VALUES (15, N'SIRONJ Route')
GO
INSERT [dbo].[mst_Unit] ([UnitID], [UnitName]) VALUES (16, N'HARDA Route')
GO
INSERT [dbo].[mst_Unit] ([UnitID], [UnitName]) VALUES (17, N'BARELI Route')
GO
INSERT [dbo].[mst_Unit] ([UnitID], [UnitName]) VALUES (18, N'BIAORA Route')
GO
INSERT [dbo].[mst_Unit] ([UnitID], [UnitName]) VALUES (19, N'BETUL')
GO
INSERT [dbo].[mst_Unit] ([UnitID], [UnitName]) VALUES (20, N'SMP at BSDS')
GO
INSERT [dbo].[mst_Unit] ([UnitID], [UnitName]) VALUES (21, N'SMP at Ware House')
GO
INSERT [dbo].[mst_Unit] ([UnitID], [UnitName]) VALUES (22, N'SMP at Gwalior')
GO
INSERT [dbo].[mst_Unit] ([UnitID], [UnitName]) VALUES (23, N'SMP at Powan Shri Food')
GO
INSERT [dbo].[mst_Unit] ([UnitID], [UnitName]) VALUES (24, N'SMP at Jai Shri Gayatri')
GO
INSERT [dbo].[mst_Unit] ([UnitID], [UnitName]) VALUES (25, N'SMP at Health Food LLP')
GO
INSERT [dbo].[mst_Unit] ([UnitID], [UnitName]) VALUES (26, N'SMP at Indore')
GO
INSERT [dbo].[mst_Unit] ([UnitID], [UnitName]) VALUES (27, N'SMP at USDS Ujjain')
GO
SET IDENTITY_INSERT [dbo].[mst_Unit] OFF
GO
SET IDENTITY_INSERT [dbo].[PlantManufacturingData] ON 
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity]) VALUES (42, CAST(N'2024-09-30' AS Date), N'STD', 55)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity]) VALUES (43, CAST(N'2024-09-30' AS Date), N'DTM', 99)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity]) VALUES (44, CAST(N'2024-09-30' AS Date), N'LITE', 99)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity]) VALUES (45, CAST(N'2024-09-30' AS Date), N'FCM', 0)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity]) VALUES (46, CAST(N'2024-09-30' AS Date), N'Diamond', 99)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity]) VALUES (47, CAST(N'2024-09-30' AS Date), N'TM', 9)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity]) VALUES (48, CAST(N'2024-09-30' AS Date), N'CHAH', 99)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity]) VALUES (49, CAST(N'2024-09-30' AS Date), N'FCM 1L', 9)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity]) VALUES (50, CAST(N'2024-09-30' AS Date), N'Chai spl. 1000ML', 9)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity]) VALUES (51, CAST(N'2024-09-30' AS Date), N'SMP', 9)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity]) VALUES (52, CAST(N'2024-09-30' AS Date), N'Sweeten SMP', 9)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity]) VALUES (53, CAST(N'2024-09-30' AS Date), N'WB', 9)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity]) VALUES (54, CAST(N'2024-09-30' AS Date), N'Plain curd', 99)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity]) VALUES (55, CAST(N'2024-09-30' AS Date), N'Sweet Curd', 9)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity]) VALUES (56, CAST(N'2024-09-30' AS Date), N'Salted Butter Milk 200 ML', 9)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity]) VALUES (57, CAST(N'2024-09-30' AS Date), N'Plain Butter Milk', 9)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity]) VALUES (58, CAST(N'2024-09-30' AS Date), N'Cold Coffee', 9)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity]) VALUES (59, CAST(N'2024-09-30' AS Date), N'Fl.Milk Pet Bottle', 9)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity]) VALUES (60, CAST(N'2024-09-30' AS Date), N'S.F.M Glass(Bottles)', 9)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity]) VALUES (61, CAST(N'2024-09-30' AS Date), N'Lassi 200 ML Glass', 9)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity]) VALUES (62, CAST(N'2024-09-30' AS Date), N'Lite Lassi 200 ML', 9)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity]) VALUES (63, CAST(N'2024-09-30' AS Date), N'Shrikhand', 9)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity]) VALUES (64, CAST(N'2024-09-30' AS Date), N'Chena Rabdi', 9)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity]) VALUES (65, CAST(N'2024-09-30' AS Date), N'Sabudana Kheer 100 gm', 9)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity]) VALUES (66, CAST(N'2024-09-30' AS Date), N'Peda', 9)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity]) VALUES (67, CAST(N'2024-09-30' AS Date), N'Milk Cake', 99)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity]) VALUES (68, CAST(N'2024-09-30' AS Date), N'Mawa', 9)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity]) VALUES (69, CAST(N'2024-09-30' AS Date), N'Paneer', 9)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity]) VALUES (70, CAST(N'2024-09-30' AS Date), N'Vaccum Paneer', 0)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity]) VALUES (71, CAST(N'2024-09-30' AS Date), N'Rasogulla', 99)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity]) VALUES (72, CAST(N'2024-09-30' AS Date), N'Gulabjamun', 9)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity]) VALUES (73, CAST(N'2024-09-30' AS Date), N'Shrikhand Lite 100 gms cups', 9)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity]) VALUES (74, CAST(N'2024-09-30' AS Date), N'Table Butter', 9)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity]) VALUES (75, CAST(N'2024-09-30' AS Date), N'Cookies', 9)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity]) VALUES (76, CAST(N'2024-09-30' AS Date), N'Sugar Free Peda', 9)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity]) VALUES (77, CAST(N'2024-09-30' AS Date), N'Butter Chiplet', 99)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity]) VALUES (78, CAST(N'2024-09-30' AS Date), N'Besan Laddu', 0)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity]) VALUES (79, CAST(N'2024-09-30' AS Date), N'Sanchi Neer lit', 99)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity]) VALUES (80, CAST(N'2024-09-30' AS Date), N'Misti Doi 100gm', 9)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity]) VALUES (81, CAST(N'2024-09-30' AS Date), N'Braj Peda', 0)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity]) VALUES (82, CAST(N'2024-09-30' AS Date), N'Amrakhand 100 gms', 0)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity]) VALUES (83, CAST(N'2024-09-30' AS Date), N'STD', 88)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity]) VALUES (84, CAST(N'2024-09-30' AS Date), N'DTM', 88)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity]) VALUES (85, CAST(N'2024-09-30' AS Date), N'LITE', 8)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity]) VALUES (86, CAST(N'2024-09-30' AS Date), N'FCM', 8)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity]) VALUES (87, CAST(N'2024-09-30' AS Date), N'Diamond', 8)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity]) VALUES (88, CAST(N'2024-09-30' AS Date), N'TM', 8)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity]) VALUES (89, CAST(N'2024-09-30' AS Date), N'CHAH', 8)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity]) VALUES (90, CAST(N'2024-09-30' AS Date), N'FCM 1L', 8)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity]) VALUES (91, CAST(N'2024-09-30' AS Date), N'Chai spl. 1000ML', 8)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity]) VALUES (92, CAST(N'2024-09-30' AS Date), N'SMP', 8)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity]) VALUES (93, CAST(N'2024-09-30' AS Date), N'Sweeten SMP', 88)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity]) VALUES (94, CAST(N'2024-09-30' AS Date), N'WB', 8)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity]) VALUES (95, CAST(N'2024-09-30' AS Date), N'Plain curd', 8)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity]) VALUES (96, CAST(N'2024-09-30' AS Date), N'Sweet Curd', 8)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity]) VALUES (97, CAST(N'2024-09-30' AS Date), N'Salted Butter Milk 200 ML', 8)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity]) VALUES (98, CAST(N'2024-09-30' AS Date), N'Plain Butter Milk', 8)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity]) VALUES (99, CAST(N'2024-09-30' AS Date), N'Cold Coffee', 8)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity]) VALUES (100, CAST(N'2024-09-30' AS Date), N'Fl.Milk Pet Bottle', 8)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity]) VALUES (101, CAST(N'2024-09-30' AS Date), N'S.F.M Glass(Bottles)', 88)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity]) VALUES (102, CAST(N'2024-09-30' AS Date), N'Lassi 200 ML Glass', 8)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity]) VALUES (103, CAST(N'2024-09-30' AS Date), N'Lite Lassi 200 ML', 8)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity]) VALUES (104, CAST(N'2024-09-30' AS Date), N'Shrikhand', 8)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity]) VALUES (105, CAST(N'2024-09-30' AS Date), N'Chena Rabdi', 8)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity]) VALUES (106, CAST(N'2024-09-30' AS Date), N'Sabudana Kheer 100 gm', 88)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity]) VALUES (107, CAST(N'2024-09-30' AS Date), N'Peda', 8)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity]) VALUES (108, CAST(N'2024-09-30' AS Date), N'Milk Cake', 8)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity]) VALUES (109, CAST(N'2024-09-30' AS Date), N'Mawa', 8)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity]) VALUES (110, CAST(N'2024-09-30' AS Date), N'Paneer', 888)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity]) VALUES (111, CAST(N'2024-09-30' AS Date), N'Vaccum Paneer', 8)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity]) VALUES (112, CAST(N'2024-09-30' AS Date), N'Rasogulla', 8)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity]) VALUES (113, CAST(N'2024-09-30' AS Date), N'Gulabjamun', 8)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity]) VALUES (114, CAST(N'2024-09-30' AS Date), N'Shrikhand Lite 100 gms cups', 8)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity]) VALUES (115, CAST(N'2024-09-30' AS Date), N'Table Butter', 8)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity]) VALUES (116, CAST(N'2024-09-30' AS Date), N'Cookies', 8)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity]) VALUES (117, CAST(N'2024-09-30' AS Date), N'Sugar Free Peda', 8)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity]) VALUES (118, CAST(N'2024-09-30' AS Date), N'Butter Chiplet', 8)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity]) VALUES (119, CAST(N'2024-09-30' AS Date), N'Besan Laddu', 8)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity]) VALUES (120, CAST(N'2024-09-30' AS Date), N'Sanchi Neer lit', 8)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity]) VALUES (121, CAST(N'2024-09-30' AS Date), N'Misti Doi 100gm', 8)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity]) VALUES (122, CAST(N'2024-09-30' AS Date), N'Braj Peda', 8)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity]) VALUES (123, CAST(N'2024-09-30' AS Date), N'Amrakhand 100 gms', 8)
GO
SET IDENTITY_INSERT [dbo].[PlantManufacturingData] OFF
GO
SET IDENTITY_INSERT [dbo].[trn_Demand] ON 
GO
INSERT [dbo].[trn_Demand] ([DemandId], [Date], [ItemCategory], [Shift], [Retailer], [VehicleNo], [DemandType]) VALUES (1, CAST(N'1900-01-01' AS Date), N'Milk', N'', N'', N'', N'')
GO
INSERT [dbo].[trn_Demand] ([DemandId], [Date], [ItemCategory], [Shift], [Retailer], [VehicleNo], [DemandType]) VALUES (2, CAST(N'2024-09-27' AS Date), N'Product', N'Evening', N'Depot No. 81[D05]', N'MP-04-GB-0338', N'Irregular')
GO
INSERT [dbo].[trn_Demand] ([DemandId], [Date], [ItemCategory], [Shift], [Retailer], [VehicleNo], [DemandType]) VALUES (3, CAST(N'2024-09-06' AS Date), N'Milk', N'Morning', N'Depot No. 94[D75]', N'MP-04-GB-0338', N'Regular')
GO
INSERT [dbo].[trn_Demand] ([DemandId], [Date], [ItemCategory], [Shift], [Retailer], [VehicleNo], [DemandType]) VALUES (4, CAST(N'2024-09-06' AS Date), N'Milk', N'Morning', N'Depot No. 94[D75]', N'MP-04-GB-0338', N'Regular')
GO
INSERT [dbo].[trn_Demand] ([DemandId], [Date], [ItemCategory], [Shift], [Retailer], [VehicleNo], [DemandType]) VALUES (5, CAST(N'2024-09-13' AS Date), N'Milk', N'Morning', N'Depot No. 81[D05]', N'MP-04-MF-3212', N'Regular')
GO
INSERT [dbo].[trn_Demand] ([DemandId], [Date], [ItemCategory], [Shift], [Retailer], [VehicleNo], [DemandType]) VALUES (6, CAST(N'2024-09-05' AS Date), N'Milk', N'Morning', N'Depot No. 94[D75]', N'MP-04-HR-0554', N'Irregular')
GO
INSERT [dbo].[trn_Demand] ([DemandId], [Date], [ItemCategory], [Shift], [Retailer], [VehicleNo], [DemandType]) VALUES (7, CAST(N'2024-09-05' AS Date), N'Milk', N'Morning', N'Depot No. 94[D75]', N'MP-04-HR-0554', N'Irregular')
GO
INSERT [dbo].[trn_Demand] ([DemandId], [Date], [ItemCategory], [Shift], [Retailer], [VehicleNo], [DemandType]) VALUES (8, CAST(N'2024-09-24' AS Date), N'Milk', N'Morning', N'Depot No. 94[D75]', N'MP-04-GB-0338', N'Regular')
GO
INSERT [dbo].[trn_Demand] ([DemandId], [Date], [ItemCategory], [Shift], [Retailer], [VehicleNo], [DemandType]) VALUES (9, CAST(N'2024-09-10' AS Date), N'Milk', N'Morning', N'Depot No. 94[D75]', N'MP-04-HR-0554', N'Regular')
GO
SET IDENTITY_INSERT [dbo].[trn_Demand] OFF
GO
SET IDENTITY_INSERT [dbo].[trn_DemandsChild] ON 
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard]) VALUES (1, 1, N'STD', 1, 0)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard]) VALUES (2, 1, N'DTM', 4, 0)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard]) VALUES (3, 1, N'LITE', 3, 0)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard]) VALUES (4, 1, N'FCM', 4, 0)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard]) VALUES (5, 1, N'Diamond', 5, 0)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard]) VALUES (6, 1, N'TM', 6, 0)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard]) VALUES (7, 1, N'CHAH', 7, 0)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard]) VALUES (8, 1, N'FCM 1L', 8, 0)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard]) VALUES (9, 1, N'Chai spl. 1000ML', 9, 0)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard]) VALUES (10, 2, N'SMP', 1, 0)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard]) VALUES (11, 2, N'Sweeten SMP', 2, 0)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard]) VALUES (12, 2, N'WB', 3, 0)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard]) VALUES (13, 2, N'Plain curd', 4, 0)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard]) VALUES (14, 2, N'Sweet Curd', 5, 0)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard]) VALUES (15, 2, N'Salted Butter Milk 200 ML', 6, 0)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard]) VALUES (16, 2, N'Plain Butter Milk', 7, 0)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard]) VALUES (17, 2, N'Cold Coffee', 8, 0)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard]) VALUES (18, 2, N'Fl.Milk Pet Bottle', 9, 0)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard]) VALUES (19, 2, N'S.F.M Glass(Bottles)', 10, 0)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard]) VALUES (20, 2, N'Lassi 200 ML Glass', 11, 0)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard]) VALUES (21, 2, N'Lite Lassi 200 ML', 12, 0)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard]) VALUES (22, 2, N'Shrikhand', 13, 0)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard]) VALUES (23, 2, N'Chena Rabdi', 14, 0)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard]) VALUES (24, 2, N'Sabudana Kheer 100 gm', 15, 0)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard]) VALUES (25, 2, N'Peda', 16, 0)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard]) VALUES (26, 2, N'Milk Cake', 17, 0)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard]) VALUES (27, 2, N'Mawa', 18, 0)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard]) VALUES (28, 2, N'Paneer', 19, 0)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard]) VALUES (29, 2, N'Vaccum Paneer', 20, 0)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard]) VALUES (30, 2, N'Rasogulla', 21, 0)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard]) VALUES (31, 2, N'Gulabjamun', 22, 0)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard]) VALUES (32, 2, N'Shrikhand Lite 100 gms cups', 23, 0)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard]) VALUES (33, 2, N'Table Butter', 24, 0)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard]) VALUES (34, 2, N'Cookies', 25, 0)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard]) VALUES (35, 2, N'Sugar Free Peda', 26, 0)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard]) VALUES (36, 2, N'Butter Chiplet', 27, 0)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard]) VALUES (37, 2, N'Besan Laddu', 28, 0)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard]) VALUES (38, 2, N'Sanchi Neer lit', 29, 0)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard]) VALUES (39, 2, N'Misti Doi 100gm', 30, 0)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard]) VALUES (40, 2, N'Braj Peda', 31, 0)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard]) VALUES (41, 2, N'Amrakhand 100 gms', 32, 0)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard]) VALUES (42, 3, N'STD', 4, 0)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard]) VALUES (43, 3, N'DTM', 5, 0)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard]) VALUES (44, 3, N'LITE', 5, 0)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard]) VALUES (45, 3, N'FCM', 5, 0)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard]) VALUES (46, 3, N'Diamond', 5, 0)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard]) VALUES (47, 3, N'TM', 45, 0)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard]) VALUES (48, 3, N'CHAH', 45, 0)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard]) VALUES (49, 3, N'FCM 1L', 131, 0)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard]) VALUES (50, 3, N'Chai spl. 1000ML', 1, 0)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard]) VALUES (51, 4, N'STD', 4, 0)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard]) VALUES (52, 4, N'DTM', 5, 0)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard]) VALUES (53, 4, N'LITE', 5, 0)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard]) VALUES (54, 4, N'FCM', 5, 0)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard]) VALUES (55, 4, N'Diamond', 5, 0)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard]) VALUES (56, 4, N'TM', 45, 0)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard]) VALUES (57, 4, N'CHAH', 45, 0)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard]) VALUES (58, 4, N'FCM 1L', 131, 0)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard]) VALUES (59, 4, N'Chai spl. 1000ML', 1, 0)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard]) VALUES (60, 5, N'STD', 9, 0)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard]) VALUES (61, 5, N'DTM', 9, 0)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard]) VALUES (62, 5, N'LITE', 9, 0)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard]) VALUES (63, 5, N'FCM', 9, 0)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard]) VALUES (64, 5, N'Diamond', 9, 0)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard]) VALUES (65, 5, N'TM', 9, 0)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard]) VALUES (66, 5, N'CHAH', 9, 0)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard]) VALUES (67, 5, N'FCM 1L', 9, 0)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard]) VALUES (68, 5, N'Chai spl. 1000ML', 9, 0)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard]) VALUES (69, 6, N'STD', 0, 0)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard]) VALUES (70, 6, N'DTM', 0, 0)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard]) VALUES (71, 6, N'LITE', 0, 0)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard]) VALUES (72, 6, N'FCM', 0, 0)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard]) VALUES (73, 6, N'Diamond', 0, 0)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard]) VALUES (74, 6, N'TM', 0, 0)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard]) VALUES (75, 6, N'CHAH', 0, 0)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard]) VALUES (76, 6, N'FCM 1L', 0, 0)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard]) VALUES (77, 6, N'Chai spl. 1000ML', 0, 0)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard]) VALUES (78, 7, N'STD', 0, 0)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard]) VALUES (79, 7, N'DTM', 0, 0)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard]) VALUES (80, 7, N'LITE', 0, 0)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard]) VALUES (81, 7, N'FCM', 0, 0)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard]) VALUES (82, 7, N'Diamond', 0, 0)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard]) VALUES (83, 7, N'TM', 0, 0)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard]) VALUES (84, 7, N'CHAH', 0, 0)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard]) VALUES (85, 7, N'FCM 1L', 0, 0)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard]) VALUES (86, 7, N'Chai spl. 1000ML', 0, 0)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard]) VALUES (87, 8, N'STD', 13, 0)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard]) VALUES (88, 8, N'DTM', 3, 0)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard]) VALUES (89, 8, N'LITE', 33, 0)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard]) VALUES (90, 8, N'FCM', 3, 0)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard]) VALUES (91, 8, N'Diamond', 3, 0)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard]) VALUES (92, 8, N'TM', 3, 0)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard]) VALUES (93, 8, N'CHAH', 3, 0)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard]) VALUES (94, 8, N'FCM 1L', 3, 0)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard]) VALUES (95, 8, N'Chai spl. 1000ML', 4, 0)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard]) VALUES (96, 9, N'STD', 5, 0)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard]) VALUES (97, 9, N'DTM', 5, 0)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard]) VALUES (98, 9, N'LITE', 5, 0)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard]) VALUES (99, 9, N'FCM', 5, 0)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard]) VALUES (100, 9, N'Diamond', 5, 0)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard]) VALUES (101, 9, N'TM', 5, 0)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard]) VALUES (102, 9, N'CHAH', 5, 0)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard]) VALUES (103, 9, N'FCM 1L', 6, 0)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard]) VALUES (104, 9, N'Chai spl. 1000ML', 6, 0)
GO
SET IDENTITY_INSERT [dbo].[trn_DemandsChild] OFF
GO
SET IDENTITY_INSERT [dbo].[Trn_InflowDetails] ON 
GO
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved]) VALUES (1, 3, CAST(N'2024-09-08' AS Date), 500, CAST(40.00 AS Decimal(18, 2)), CAST(36.65 AS Decimal(18, 2)), CAST(8.00 AS Decimal(18, 2)), CAST(7.33 AS Decimal(18, 2)), 789, 5555, 78954, 230, 1, 0)
GO
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved]) VALUES (2, 7, CAST(N'2024-09-08' AS Date), 9999, CAST(77.99 AS Decimal(18, 2)), CAST(30.00 AS Decimal(18, 2)), CAST(0.78 AS Decimal(18, 2)), CAST(0.30 AS Decimal(18, 2)), 52, 859, 996, 859, 1, 0)
GO
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved]) VALUES (3, 9, CAST(N'2024-09-28' AS Date), 555, CAST(27.75 AS Decimal(18, 2)), CAST(27.75 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), 555, 555, 55, 55, 1, 1)
GO
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved]) VALUES (4, 12, CAST(N'2024-09-25' AS Date), 8568, CAST(59.98 AS Decimal(18, 2)), CAST(6.68 AS Decimal(18, 2)), CAST(0.70 AS Decimal(18, 2)), CAST(0.08 AS Decimal(18, 2)), 4734, 44, 444, 44, 1, 0)
GO
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved]) VALUES (5, 12, CAST(N'2024-09-28' AS Date), 8568, CAST(85.68 AS Decimal(18, 2)), CAST(6.68 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), CAST(0.08 AS Decimal(18, 2)), 4734, 44, 444, 44, 1, 1)
GO
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved]) VALUES (6, 12, CAST(N'2024-09-28' AS Date), 8568, CAST(59.98 AS Decimal(18, 2)), CAST(6.68 AS Decimal(18, 2)), CAST(0.70 AS Decimal(18, 2)), CAST(0.08 AS Decimal(18, 2)), 4734, 44, 444, 44, 0, 0)
GO
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved]) VALUES (7, 4, CAST(N'2024-09-30' AS Date), 5555, CAST(277.75 AS Decimal(18, 2)), CAST(277.75 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), 555, 55, 55, 55, 0, 0)
GO
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved]) VALUES (8, 3, CAST(N'2024-09-30' AS Date), 10, CAST(1.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), 55, 55, 55, 55, 0, 0)
GO
SET IDENTITY_INSERT [dbo].[Trn_InflowDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[trn_Sale] ON 
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory]) VALUES (1, N'HOSHANGABAD Route', CAST(N'2024-09-28' AS Date), N'Milk')
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory]) VALUES (2, N'PIPRIYA Route', CAST(N'2024-09-28' AS Date), N'Product')
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory]) VALUES (3, N'BHOPAL Route', CAST(N'2024-09-28' AS Date), N'Product')
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory]) VALUES (4, N'BHOPAL Route', CAST(N'2024-09-28' AS Date), N'Milk')
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory]) VALUES (5, N'3', CAST(N'2024-09-28' AS Date), N'Milk')
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory]) VALUES (6, N'3', CAST(N'2024-09-28' AS Date), N'Milk')
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory]) VALUES (7, N'5', CAST(N'2024-09-28' AS Date), N'Product')
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory]) VALUES (8, N'6', CAST(N'2024-09-28' AS Date), N'Product')
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory]) VALUES (9, N'6', CAST(N'2024-09-30' AS Date), N'Milk')
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory]) VALUES (10, N'8', CAST(N'2024-09-30' AS Date), N'Product')
GO
SET IDENTITY_INSERT [dbo].[trn_Sale] OFF
GO
SET IDENTITY_INSERT [dbo].[trn_SaleChild] ON 
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (1, 1, N'STD', 5)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (2, 1, N'DTM', 5)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (3, 1, N'LITE', 5)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (4, 1, N'FCM', 5)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (5, 1, N'Diamond', 5)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (6, 1, N'TM', 5)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (7, 1, N'CHAH', 5)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (8, 1, N'FCM 1L', 5)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (9, 1, N'Chai spl. 1000ML', 5)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (10, 2, N'SMP', 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (11, 2, N'Sweeten SMP', 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (12, 2, N'WB', 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (13, 2, N'Plain curd', 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (14, 2, N'Sweet Curd', 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (15, 2, N'Salted Butter Milk 200 ML', 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (16, 2, N'Plain Butter Milk', 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (17, 2, N'Cold Coffee', 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (18, 2, N'Fl.Milk Pet Bottle', 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (19, 2, N'S.F.M Glass(Bottles)', 88)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (20, 2, N'Lassi 200 ML Glass', 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (21, 2, N'Lite Lassi 200 ML', 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (22, 2, N'Shrikhand', 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (23, 2, N'Chena Rabdi', 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (24, 2, N'Sabudana Kheer 100 gm', 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (25, 2, N'Peda', 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (26, 2, N'Milk Cake', 88)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (27, 2, N'Mawa', 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (28, 2, N'Paneer', 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (29, 2, N'Vaccum Paneer', 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (30, 2, N'Rasogulla', 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (31, 2, N'Gulabjamun', 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (32, 2, N'Shrikhand Lite 100 gms cups', 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (33, 2, N'Table Butter', 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (34, 2, N'Cookies', 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (35, 2, N'Sugar Free Peda', 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (36, 2, N'Butter Chiplet', 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (37, 2, N'Besan Laddu', 88)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (38, 2, N'Sanchi Neer lit', 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (39, 2, N'Misti Doi 100gm', 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (40, 2, N'Braj Peda', 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (41, 2, N'Amrakhand 100 gms', 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (42, 3, N'SMP', 0)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (43, 3, N'Sweeten SMP', 0)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (44, 3, N'WB', 0)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (45, 3, N'Plain curd', 0)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (46, 3, N'Sweet Curd', 0)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (47, 3, N'Salted Butter Milk 200 ML', 0)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (48, 3, N'Plain Butter Milk', 0)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (49, 3, N'Cold Coffee', 0)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (50, 3, N'Fl.Milk Pet Bottle', 0)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (51, 3, N'S.F.M Glass(Bottles)', 0)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (52, 3, N'Lassi 200 ML Glass', 0)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (53, 3, N'Lite Lassi 200 ML', 0)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (54, 3, N'Shrikhand', 0)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (55, 3, N'Chena Rabdi', 0)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (56, 3, N'Sabudana Kheer 100 gm', 0)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (57, 3, N'Peda', 0)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (58, 3, N'Milk Cake', 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (59, 3, N'Mawa', 0)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (60, 3, N'Paneer', 0)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (61, 3, N'Vaccum Paneer', 0)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (62, 3, N'Rasogulla', 0)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (63, 3, N'Gulabjamun', 0)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (64, 3, N'Shrikhand Lite 100 gms cups', 0)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (65, 3, N'Table Butter', 0)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (66, 3, N'Cookies', 0)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (67, 3, N'Sugar Free Peda', 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (68, 3, N'Butter Chiplet', 7)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (69, 3, N'Besan Laddu', 0)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (70, 3, N'Sanchi Neer lit', 6)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (71, 3, N'Misti Doi 100gm', 7)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (72, 3, N'Braj Peda', 78)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (73, 3, N'Amrakhand 100 gms', 0)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (74, 4, N'STD', 0)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (75, 4, N'DTM', 0)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (76, 4, N'LITE', 0)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (77, 4, N'FCM', 7)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (78, 4, N'Diamond', 6)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (79, 4, N'TM', 6)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (80, 4, N'CHAH', 6)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (81, 4, N'FCM 1L', 77)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (82, 4, N'Chai spl. 1000ML', 7)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (83, 5, N'STD', 0)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (84, 5, N'DTM', 0)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (85, 5, N'LITE', 0)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (86, 5, N'FCM', 0)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (87, 5, N'Diamond', 0)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (88, 5, N'TM', 0)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (89, 5, N'CHAH', 88)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (90, 5, N'FCM 1L', 0)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (91, 5, N'Chai spl. 1000ML', 0)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (92, 6, N'STD', 0)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (93, 6, N'DTM', 0)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (94, 6, N'LITE', 0)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (95, 6, N'FCM', 0)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (96, 6, N'Diamond', 0)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (97, 6, N'TM', 0)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (98, 6, N'CHAH', 88)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (99, 6, N'FCM 1L', 99)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (100, 6, N'Chai spl. 1000ML', 0)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (101, 7, N'SMP', 99)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (102, 7, N'Sweeten SMP', 99)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (103, 7, N'WB', 0)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (104, 7, N'Plain curd', 0)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (105, 7, N'Sweet Curd', 0)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (106, 7, N'Salted Butter Milk 200 ML', 0)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (107, 7, N'Plain Butter Milk', 0)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (108, 7, N'Cold Coffee', 0)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (109, 7, N'Fl.Milk Pet Bottle', 0)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (110, 7, N'S.F.M Glass(Bottles)', 0)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (111, 7, N'Lassi 200 ML Glass', 0)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (112, 7, N'Lite Lassi 200 ML', 0)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (113, 7, N'Shrikhand', 0)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (114, 7, N'Chena Rabdi', 0)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (115, 7, N'Sabudana Kheer 100 gm', 0)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (116, 7, N'Peda', 0)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (117, 7, N'Milk Cake', 0)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (118, 7, N'Mawa', 0)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (119, 7, N'Paneer', 0)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (120, 7, N'Vaccum Paneer', 0)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (121, 7, N'Rasogulla', 0)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (122, 7, N'Gulabjamun', 0)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (123, 7, N'Shrikhand Lite 100 gms cups', 0)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (124, 7, N'Table Butter', 0)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (125, 7, N'Cookies', 0)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (126, 7, N'Sugar Free Peda', 0)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (127, 7, N'Butter Chiplet', 0)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (128, 7, N'Besan Laddu', 0)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (129, 7, N'Sanchi Neer lit', 0)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (130, 7, N'Misti Doi 100gm', 0)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (131, 7, N'Braj Peda', 0)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (132, 7, N'Amrakhand 100 gms', 0)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (133, 8, N'SMP', 0)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (134, 8, N'Sweeten SMP', 0)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (135, 8, N'WB', 0)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (136, 8, N'Plain curd', 0)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (137, 8, N'Sweet Curd', 0)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (138, 8, N'Salted Butter Milk 200 ML', 0)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (139, 8, N'Plain Butter Milk', 0)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (140, 8, N'Cold Coffee', 0)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (141, 8, N'Fl.Milk Pet Bottle', 0)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (142, 8, N'S.F.M Glass(Bottles)', 0)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (143, 8, N'Lassi 200 ML Glass', 0)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (144, 8, N'Lite Lassi 200 ML', 0)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (145, 8, N'Shrikhand', 0)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (146, 8, N'Chena Rabdi', 0)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (147, 8, N'Sabudana Kheer 100 gm', 0)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (148, 8, N'Peda', 0)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (149, 8, N'Milk Cake', 0)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (150, 8, N'Mawa', 0)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (151, 8, N'Paneer', 0)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (152, 8, N'Vaccum Paneer', 0)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (153, 8, N'Rasogulla', 0)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (154, 8, N'Gulabjamun', 0)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (155, 8, N'Shrikhand Lite 100 gms cups', 0)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (156, 8, N'Table Butter', 0)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (157, 8, N'Cookies', 0)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (158, 8, N'Sugar Free Peda', 99)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (159, 8, N'Butter Chiplet', 999)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (160, 8, N'Besan Laddu', 0)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (161, 8, N'Sanchi Neer lit', 0)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (162, 8, N'Misti Doi 100gm', 0)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (163, 8, N'Braj Peda', 0)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (164, 8, N'Amrakhand 100 gms', 99)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (165, 9, N'STD', 77)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (166, 9, N'DTM', 77)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (167, 9, N'LITE', 88)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (168, 9, N'FCM', 88)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (169, 9, N'Diamond', 99)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (170, 9, N'TM', 99)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (171, 9, N'CHAH', 77)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (172, 9, N'FCM 1L', 55)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (173, 9, N'Chai spl. 1000ML', 66)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (174, 10, N'SMP', 188)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (175, 10, N'Sweeten SMP', 88)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (176, 10, N'WB', 88)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (177, 10, N'Plain curd', 88)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (178, 10, N'Sweet Curd', 88)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (179, 10, N'Salted Butter Milk 200 ML', 88)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (180, 10, N'Plain Butter Milk', 99)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (181, 10, N'Cold Coffee', 99)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (182, 10, N'Fl.Milk Pet Bottle', 99)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (183, 10, N'S.F.M Glass(Bottles)', 66)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (184, 10, N'Lassi 200 ML Glass', 66)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (185, 10, N'Lite Lassi 200 ML', 33)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (186, 10, N'Shrikhand', 32)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (187, 10, N'Chena Rabdi', 22)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (188, 10, N'Sabudana Kheer 100 gm', 545)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (189, 10, N'Peda', 11)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (190, 10, N'Milk Cake', 44)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (191, 10, N'Mawa', 44)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (192, 10, N'Paneer', 55)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (193, 10, N'Vaccum Paneer', 222)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (194, 10, N'Rasogulla', 333)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (195, 10, N'Gulabjamun', 77)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (196, 10, N'Shrikhand Lite 100 gms cups', 55858)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (197, 10, N'Table Butter', 6333)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (198, 10, N'Cookies', 11)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (199, 10, N'Sugar Free Peda', 11)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (200, 10, N'Butter Chiplet', 22)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (201, 10, N'Besan Laddu', 33)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (202, 10, N'Sanchi Neer lit', 0)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (203, 10, N'Misti Doi 100gm', 55)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (204, 10, N'Braj Peda', 33)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (205, 10, N'Amrakhand 100 gms', 55)
GO
SET IDENTITY_INSERT [dbo].[trn_SaleChild] OFF
GO
ALTER TABLE [dbo].[trn_DemandsChild]  WITH CHECK ADD FOREIGN KEY([DemandId])
REFERENCES [dbo].[trn_Demand] ([DemandId])
GO
/****** Object:  StoredProcedure [dbo].[GetItemsByCategory]    Script Date: 30-Sep-24 1:45:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  create proc  [dbo].[GetItemsByCategory]
  @ItemCategory varchar(50) =null
  as
  begin
  declare @status bit=0 ,@msg varchar(100)=null
  BEGIN TRY
        SELECT [ItemName] FROM [mst_Item] 
        WHERE (@ItemCategory IS NULL OR [ItemCategory] = @ItemCategory);

		SELECT	@status =1 ,@msg='Item Name selectted Successfully'	 
		SELECT	@status [status] ,@msg [msg]
	END TRY
    BEGIN CATCH          
		SELECT	@status =0 ,@msg=ERROR_MESSAGE()	 
		SELECT	@status [status] ,@msg [msg]
    END CATCH;
  end
GO
/****** Object:  StoredProcedure [dbo].[usp_AddDemand]    Script Date: 30-Sep-24 1:45:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

  CREATE proc  [dbo].[usp_AddDemand]
	@Date date
	,@ItemCategory varchar(50)
	,@Shift varchar(10)
	,@Retailer varchar(50)
	,@VehicleNo varchar(20)
	,@DemandType varchar(20)
	,@DemandItems DemandItems   readonly
  as
  begin
	  declare @status bit=0 ,@msg varchar(100)=null  ,@DemandId int=null
	  BEGIN TRY
		  BEGIN transaction 
      
			INSERT INTO [dbo].[trn_Demand]
					   ([Date]
					   ,[ItemCategory]
					   ,[Shift]
					   ,[Retailer]
					   ,[VehicleNo]
					   ,[DemandType])
				 VALUES
					   (@date
					   ,@ItemCategory
					   ,@Shift
					   ,@Retailer
					   ,@VehicleNo
					   ,@DemandType)
			select @DemandId =SCOPE_IDENTITY();

			INSERT INTO [dbo].[trn_DemandsChild]
					   ([DemandId]
					   ,[ItemName]
					   ,[Quantity]
					   ,[AdvancedCard])
     
				 select @DemandId, ItemName,Quantity,AdvancedCard from @DemandItems


			SELECT	@status =1 ,@msg='Demand added Successfully'	 
	
			COMMIT TRANSACTION;
		END TRY
		BEGIN CATCH   
			ROLLBACK TRANSACTION;
			SELECT	@status =0 ,@msg=ERROR_MESSAGE()	 
		
		END CATCH;
		 SELECT @status AS [status], @msg AS [msg];
  end
GO
/****** Object:  StoredProcedure [dbo].[usp_AddInFlow]    Script Date: 30-Sep-24 1:45:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE proc  [dbo].[usp_AddInFlow]
     @Date				date
	,@UnitID     		int
	,@Milkqty			int
	,@Milkfat			decimal(18,2)
	,@MilkSNF			decimal(18,2)
	,@Milkfatperc		decimal(18,2)
	,@MilkSNFperc		decimal(18,2)
	,@Butterqty  		int
	,@Butterstock  		int
	,@MilkPowderqty  	int
	,@MilkPowderstock  	int
		
  as
  begin
	declare @status bit=0 ,@msg varchar(100)=null  ,@DemandId int=null
	BEGIN TRY
		BEGIN TRANSACTION   
			INSERT INTO [dbo].[Trn_InflowDetails]
				([Date]
				,[UnitID]
				,[Milkqty]
				,[Milkfat]
				,[MilkSNF]
				,[Milkfatperc]
				,[MilkSNFperc]
				,[Butterqty]
				,[Butterstock]
				,[MilkPowderqty]
				,[MilkPowderstock]
				,[IsVerifed]
				,[IsApproved])
			VALUES
				( @Date		
				,@UnitID
				,@Milkqty		
				,@Milkfat		
				,@MilkSNF		
				,@Milkfatperc	
				,@MilkSNFperc	
				,@Butterqty  	
				,@Butterstock  	
				,@MilkPowderqty  
				,@MilkPowderstock
				,0
				,0)
	
			SELECT	@status =1 ,@msg='In Flow Details Added Successfully'	 	
		COMMIT TRANSACTION;
	END TRY
	BEGIN CATCH   
		ROLLBACK TRANSACTION;
		SELECT	@status =0 ,@msg=ERROR_MESSAGE()	 
	END CATCH;
	SELECT @status AS [status], @msg AS [msg];
  end
GO
/****** Object:  StoredProcedure [dbo].[usp_AddManufItem]    Script Date: 30-Sep-24 1:45:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_AddManufItem]
    @Date DATE,
    @ManufItems DemandItems READONLY
AS
BEGIN
    DECLARE @status BIT = 0, @msg VARCHAR(100) = NULL, @DemandId INT = NULL
    BEGIN TRY
        BEGIN TRANSACTION
			INSERT INTO PlantManufacturingData (Date, ItemName, Quantity)
			SELECT @Date, ItemName, Quantity  FROM @ManufItems

			SELECT @status = 1, @msg = 'Items added Successfully'
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        SELECT @status = 0, @msg = ERROR_MESSAGE()
    END CATCH;
    SELECT @status AS [status], @msg AS [msg];
END
GO
/****** Object:  StoredProcedure [dbo].[usp_AddSales]    Script Date: 30-Sep-24 1:45:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc  [dbo].[usp_AddSales]
		@Date date
		,@NameOfUnit		VARCHAR(100)		
		,@ItemCategory varchar(50)
		,@Items DemandItems   readonly
  as
  begin
	  declare @status bit=0 ,@msg varchar(100)=null  ,@SalesID int=null
	  BEGIN TRY
		  BEGIN transaction 
      
			INSERT INTO [dbo].trn_Sale
					   ([Date]
					   ,[NameOfUnit]
					   ,[ItemCategory]
					  )
				 VALUES
					   (@date
					   ,@NameOfUnit
					   ,@ItemCategory)

			select @SalesID =SCOPE_IDENTITY();

			INSERT INTO [dbo].trn_SaleChild
					   ([SalesID]
					   ,[ItemName]
					   ,[Quantity]
					   )     
				 select @SalesID, ItemName,Quantity from @Items


			SELECT	@status =1 ,@msg='Sales Details  Added Successfully'	 
	
			COMMIT TRANSACTION;
		END TRY
		BEGIN CATCH   
			ROLLBACK TRANSACTION;
			SELECT	@status =0 ,@msg=ERROR_MESSAGE()	 
		
		END CATCH;
		 SELECT @status AS [status], @msg AS [msg];
  end
GO
/****** Object:  StoredProcedure [dbo].[Usp_AproveInflow]    Script Date: 30-Sep-24 1:45:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create  proc  [dbo].[Usp_AproveInflow]
    
				 @InflowId 				 int
				,@Milkqty				 int
				,@Milkfat				 decimal(18,2)
				,@MilkSNF				 decimal(18,2)
				,@Milkfatperc			 decimal(18,2)
				,@MilkSNFperc			 decimal(18,2)
				,@Butterqty				 int
				,@Butterstock			 int
				,@MilkPowderqty			 int
				,@MilkPowderstock		 int
				
  as
  begin
	declare @status bit=0 ,@msg varchar(100)=null  ,@DemandId int=null
	BEGIN TRY
		BEGIN TRANSACTION  
			update Trn_InflowDetails
			set 
			 [Milkqty]		   =@Milkqty		
			,[Milkfat]		   =@Milkfat		
			,[MilkSNF]		   =@MilkSNF		
			,[Milkfatperc]	   =@Milkfatperc	
			,[MilkSNFperc]	   =@MilkSNFperc	
			,[Butterqty]	   =@Butterqty		
			,[Butterstock]	   =@Butterstock	
			,[MilkPowderqty]	=@MilkPowderqty	
			,[MilkPowderstock]  =@MilkPowderstock
			,IsApproved     =    1
			where 
			InflowId=@InflowId
		sELECT	@status =1 ,@msg='In Flow Is Approved  and Updated'	 	
		COMMIT TRANSACTION;
	END TRY
	BEGIN CATCH   
		ROLLBACK TRANSACTION;
		SELECT	@status =0 ,@msg=ERROR_MESSAGE()	 
	END CATCH;
	SELECT @status AS [status], @msg AS [msg];
  end
GO
/****** Object:  StoredProcedure [dbo].[Usp_GetInflowToAprove]    Script Date: 30-Sep-24 1:45:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  proc  [dbo].[Usp_GetInflowToAprove]
     @IsApproved bit =null
		
  as
  begin
	declare @status bit=0 ,@msg varchar(100)=null  ,@DemandId int=null
	BEGIN TRY
		BEGIN TRANSACTION   
		select InflowId
				,[Trn_InflowDetails].UnitID
				,mst_Unit.UnitName
				,Date
				,Milkqty
				,Milkfat
				,MilkSNF
				,Milkfatperc
				,MilkSNFperc
				,Butterqty
				,Butterstock
				,MilkPowderqty
				,MilkPowderstock
				,IsApproved from [Trn_InflowDetails]
				inner join mst_Unit on mst_Unit.UnitID= [Trn_InflowDetails].UnitID
				where IsVerifed =1 and( IsApproved= @IsApproved or @IsApproved is NULL)
	
			SELECT	@status =1 ,@msg='In Flow Details Selected  Successfully'	 	
		COMMIT TRANSACTION;
	END TRY
	BEGIN CATCH   
		ROLLBACK TRANSACTION;
		SELECT	@status =0 ,@msg=ERROR_MESSAGE()	 
	END CATCH;
	SELECT @status AS [status], @msg AS [msg];
  end
GO
/****** Object:  StoredProcedure [dbo].[Usp_GetUnit]    Script Date: 30-Sep-24 1:45:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  create proc  [dbo].[Usp_GetUnit]
  as
  begin
  declare @status bit=0 ,@msg varchar(100)=null
  BEGIN TRY
		select UnitID [Id] ,UnitName [Name] from [mst_Unit]
	
	    SELECT	@status =1 ,@msg='Unit Name selectted Successfully'	 
	END TRY
    BEGIN CATCH          
		SELECT	@status =0 ,@msg=ERROR_MESSAGE()	 
    END CATCH;
	SELECT	@status [status] ,@msg [msg]
  end
GO
/****** Object:  StoredProcedure [dbo].[uspVerifierDetails]    Script Date: 30-Sep-24 1:45:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[uspVerifierDetails]
@IsVerifed bit =null
AS
BEGIN
    SELECT 
        tf.InflowId,
        mu.UnitName,
        tf.Date,
        tf.Milkqty,
        tf.Milkfat,
        tf.MilkSNF,
        tf.Milkfatperc,
        tf.MilkSNFperc,
        tf.Butterqty,
        tf.Butterstock,
        tf.MilkPowderqty,
        tf.MilkPowderstock,
		IsVerifed

    FROM Trn_InflowDetails tf
    INNER JOIN mst_Unit mu
    ON tf.UnitID = mu.UnitID
		where IsApproved =0 and( IsVerifed= @IsVerifed or @IsVerifed is NULL)
END
GO
/****** Object:  StoredProcedure [dbo].[uspVerifierUpdate]    Script Date: 30-Sep-24 1:45:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspVerifierUpdate]
    @InflowId int, 
    @Milkqty int, 
    @Milkfat decimal(18, 2),
    @MilkSNF decimal(18, 2),
    @Milkfatperc decimal(18, 2), 
    @MilkSNFperc decimal(18, 2), 
    @Butterqty int, 
    @Butterstock int, 
    @MilkPowderqty int, 
    @MilkPowderstock int
AS
BEGIN
    DECLARE @Status bit, @msg varchar(100) = ''

    IF EXISTS (SELECT 1 FROM Trn_InflowDetails WHERE InflowId = @InflowId)
    BEGIN
        UPDATE Trn_InflowDetails
        SET 
            Milkqty = @Milkqty,
            Milkfat = @Milkfat,
            MilkSNF = @MilkSNF,
            Milkfatperc = @Milkfatperc,
            MilkSNFperc = @MilkSNFperc,
            Butterqty = @Butterqty,
            Butterstock = @Butterstock,
            MilkPowderqty = @MilkPowderqty,
            MilkPowderstock = @MilkPowderstock,
			IsVerifed   = 1
        WHERE InflowId = @InflowId

        SET @Status = 1
        SET @msg = 'Item Verified successfully'
    END
    ELSE
    BEGIN
        SET @Status = 0
        SET @msg = 'Not Verified'
    END

    SELECT @Status AS sts, @msg AS msg
END
GO
USE [master]
GO
ALTER DATABASE [DbSanchi] SET  READ_WRITE 
GO
