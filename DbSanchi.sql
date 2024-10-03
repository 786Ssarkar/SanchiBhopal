USE [master]
GO
/****** Object:  Database [DbSanchi]    Script Date: 03-Oct-24 7:29:25 PM ******/
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
/****** Object:  UserDefinedTableType [dbo].[DemandItems]    Script Date: 03-Oct-24 7:29:25 PM ******/
CREATE TYPE [dbo].[DemandItems] AS TABLE(
	[ItemName] [varchar](50) NULL,
	[Quantity] [int] NULL,
	[AdvancedCard] [int] NULL
)
GO
/****** Object:  Table [dbo].[mst_InflowUnits]    Script Date: 03-Oct-24 7:29:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mst_InflowUnits](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Unit name] [varchar](50) NULL,
 CONSTRAINT [PK_mst_InflowUnits] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[mst_Item]    Script Date: 03-Oct-24 7:29:25 PM ******/
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
/****** Object:  Table [dbo].[mst_Unit]    Script Date: 03-Oct-24 7:29:25 PM ******/
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
/****** Object:  Table [dbo].[PlantManufacturingData]    Script Date: 03-Oct-24 7:29:25 PM ******/
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
/****** Object:  Table [dbo].[trn_Demand]    Script Date: 03-Oct-24 7:29:25 PM ******/
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
/****** Object:  Table [dbo].[trn_DemandsChild]    Script Date: 03-Oct-24 7:29:25 PM ******/
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
/****** Object:  Table [dbo].[Trn_InflowDetails]    Script Date: 03-Oct-24 7:29:25 PM ******/
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
	[WholeMilkPowderqty] [int] NULL,
	[WholeMilkPowderstock] [int] NULL,
	[Gheeqty] [int] NULL,
	[Gheestock] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[InflowId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[trn_Sale]    Script Date: 03-Oct-24 7:29:25 PM ******/
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
/****** Object:  Table [dbo].[trn_SaleChild]    Script Date: 03-Oct-24 7:29:25 PM ******/
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
SET IDENTITY_INSERT [dbo].[mst_InflowUnits] ON 

INSERT [dbo].[mst_InflowUnits] ([Id], [Unit name]) VALUES (1, N'SMP at Ware House')
INSERT [dbo].[mst_InflowUnits] ([Id], [Unit name]) VALUES (2, N'SMP at Gwalior')
INSERT [dbo].[mst_InflowUnits] ([Id], [Unit name]) VALUES (3, N'SMP at Powan Shri Food')
INSERT [dbo].[mst_InflowUnits] ([Id], [Unit name]) VALUES (4, N'SMP at Jai Shri Gayatri')
INSERT [dbo].[mst_InflowUnits] ([Id], [Unit name]) VALUES (5, N'SMP at Health Food LLP')
INSERT [dbo].[mst_InflowUnits] ([Id], [Unit name]) VALUES (6, N'SMP at Indore')
INSERT [dbo].[mst_InflowUnits] ([Id], [Unit name]) VALUES (7, N'SMP at USDS Ujjain')
INSERT [dbo].[mst_InflowUnits] ([Id], [Unit name]) VALUES (8, N'BMC BHOPAL ')
INSERT [dbo].[mst_InflowUnits] ([Id], [Unit name]) VALUES (9, N'ASHTA')
INSERT [dbo].[mst_InflowUnits] ([Id], [Unit name]) VALUES (10, N'NARSINGARH')
INSERT [dbo].[mst_InflowUnits] ([Id], [Unit name]) VALUES (11, N'BETUL')
INSERT [dbo].[mst_InflowUnits] ([Id], [Unit name]) VALUES (12, N'MULTAI')
INSERT [dbo].[mst_InflowUnits] ([Id], [Unit name]) VALUES (13, N'BARELI')
INSERT [dbo].[mst_InflowUnits] ([Id], [Unit name]) VALUES (14, N'VIDISHA')
INSERT [dbo].[mst_InflowUnits] ([Id], [Unit name]) VALUES (15, N'SOHAGPUR')
INSERT [dbo].[mst_InflowUnits] ([Id], [Unit name]) VALUES (16, N'HARDA')
INSERT [dbo].[mst_InflowUnits] ([Id], [Unit name]) VALUES (17, N'LATERI')
INSERT [dbo].[mst_InflowUnits] ([Id], [Unit name]) VALUES (18, N'SHUJALPUR')
INSERT [dbo].[mst_InflowUnits] ([Id], [Unit name]) VALUES (19, N'MALIWAYA')
INSERT [dbo].[mst_InflowUnits] ([Id], [Unit name]) VALUES (20, N'GAIRATGANJ')
INSERT [dbo].[mst_InflowUnits] ([Id], [Unit name]) VALUES (21, N'SILWANI')
INSERT [dbo].[mst_InflowUnits] ([Id], [Unit name]) VALUES (22, N'PACHORE')
INSERT [dbo].[mst_InflowUnits] ([Id], [Unit name]) VALUES (23, N'DEORI')
INSERT [dbo].[mst_InflowUnits] ([Id], [Unit name]) VALUES (24, N'GOHARGANJ')
INSERT [dbo].[mst_InflowUnits] ([Id], [Unit name]) VALUES (25, N'GUNA')
SET IDENTITY_INSERT [dbo].[mst_InflowUnits] OFF
GO
SET IDENTITY_INSERT [dbo].[mst_Item] ON 

INSERT [dbo].[mst_Item] ([ItemID], [ItemName], [ItemCategory]) VALUES (1, N'STD', N'Milk')
INSERT [dbo].[mst_Item] ([ItemID], [ItemName], [ItemCategory]) VALUES (2, N'DTM', N'Milk')
INSERT [dbo].[mst_Item] ([ItemID], [ItemName], [ItemCategory]) VALUES (3, N'LITE', N'Milk')
INSERT [dbo].[mst_Item] ([ItemID], [ItemName], [ItemCategory]) VALUES (4, N'FCM', N'Milk')
INSERT [dbo].[mst_Item] ([ItemID], [ItemName], [ItemCategory]) VALUES (5, N'Diamond', N'Milk')
INSERT [dbo].[mst_Item] ([ItemID], [ItemName], [ItemCategory]) VALUES (6, N'TM', N'Milk')
INSERT [dbo].[mst_Item] ([ItemID], [ItemName], [ItemCategory]) VALUES (7, N'CHAH', N'Milk')
INSERT [dbo].[mst_Item] ([ItemID], [ItemName], [ItemCategory]) VALUES (8, N'FCM 1L', N'Milk')
INSERT [dbo].[mst_Item] ([ItemID], [ItemName], [ItemCategory]) VALUES (9, N'Chai spl. 1000ML', N'Milk')
INSERT [dbo].[mst_Item] ([ItemID], [ItemName], [ItemCategory]) VALUES (10, N'SMP', N'Product')
INSERT [dbo].[mst_Item] ([ItemID], [ItemName], [ItemCategory]) VALUES (11, N'Sweeten SMP', N'Product')
INSERT [dbo].[mst_Item] ([ItemID], [ItemName], [ItemCategory]) VALUES (12, N'WB', N'Product')
INSERT [dbo].[mst_Item] ([ItemID], [ItemName], [ItemCategory]) VALUES (13, N'Plain curd', N'Product')
INSERT [dbo].[mst_Item] ([ItemID], [ItemName], [ItemCategory]) VALUES (14, N'Sweet Curd', N'Product')
INSERT [dbo].[mst_Item] ([ItemID], [ItemName], [ItemCategory]) VALUES (15, N'Salted Butter Milk 200 ML', N'Product')
INSERT [dbo].[mst_Item] ([ItemID], [ItemName], [ItemCategory]) VALUES (16, N'Plain Butter Milk', N'Product')
INSERT [dbo].[mst_Item] ([ItemID], [ItemName], [ItemCategory]) VALUES (17, N'Cold Coffee', N'Product')
INSERT [dbo].[mst_Item] ([ItemID], [ItemName], [ItemCategory]) VALUES (18, N'Fl.Milk Pet Bottle', N'Product')
INSERT [dbo].[mst_Item] ([ItemID], [ItemName], [ItemCategory]) VALUES (19, N'S.F.M Glass(Bottles)', N'Product')
INSERT [dbo].[mst_Item] ([ItemID], [ItemName], [ItemCategory]) VALUES (20, N'Lassi 200 ML Glass', N'Product')
INSERT [dbo].[mst_Item] ([ItemID], [ItemName], [ItemCategory]) VALUES (21, N'Lite Lassi 200 ML', N'Product')
INSERT [dbo].[mst_Item] ([ItemID], [ItemName], [ItemCategory]) VALUES (22, N'Shrikhand', N'Product')
INSERT [dbo].[mst_Item] ([ItemID], [ItemName], [ItemCategory]) VALUES (23, N'Chena Rabdi', N'Product')
INSERT [dbo].[mst_Item] ([ItemID], [ItemName], [ItemCategory]) VALUES (24, N'Sabudana Kheer 100 gm', N'Product')
INSERT [dbo].[mst_Item] ([ItemID], [ItemName], [ItemCategory]) VALUES (25, N'Peda', N'Product')
INSERT [dbo].[mst_Item] ([ItemID], [ItemName], [ItemCategory]) VALUES (26, N'Milk Cake', N'Product')
INSERT [dbo].[mst_Item] ([ItemID], [ItemName], [ItemCategory]) VALUES (27, N'Mawa', N'Product')
INSERT [dbo].[mst_Item] ([ItemID], [ItemName], [ItemCategory]) VALUES (28, N'Paneer', N'Product')
INSERT [dbo].[mst_Item] ([ItemID], [ItemName], [ItemCategory]) VALUES (29, N'Vaccum Paneer', N'Product')
INSERT [dbo].[mst_Item] ([ItemID], [ItemName], [ItemCategory]) VALUES (30, N'Rasogulla', N'Product')
INSERT [dbo].[mst_Item] ([ItemID], [ItemName], [ItemCategory]) VALUES (31, N'Gulabjamun', N'Product')
INSERT [dbo].[mst_Item] ([ItemID], [ItemName], [ItemCategory]) VALUES (32, N'Shrikhand Lite 100 gms cups', N'Product')
INSERT [dbo].[mst_Item] ([ItemID], [ItemName], [ItemCategory]) VALUES (33, N'Table Butter', N'Product')
INSERT [dbo].[mst_Item] ([ItemID], [ItemName], [ItemCategory]) VALUES (34, N'Cookies', N'Product')
INSERT [dbo].[mst_Item] ([ItemID], [ItemName], [ItemCategory]) VALUES (35, N'Sugar Free Peda', N'Product')
INSERT [dbo].[mst_Item] ([ItemID], [ItemName], [ItemCategory]) VALUES (36, N'Butter Chiplet', N'Product')
INSERT [dbo].[mst_Item] ([ItemID], [ItemName], [ItemCategory]) VALUES (37, N'Besan Laddu', N'Product')
INSERT [dbo].[mst_Item] ([ItemID], [ItemName], [ItemCategory]) VALUES (38, N'Sanchi Neer lit', N'Product')
INSERT [dbo].[mst_Item] ([ItemID], [ItemName], [ItemCategory]) VALUES (39, N'Misti Doi 100gm', N'Product')
INSERT [dbo].[mst_Item] ([ItemID], [ItemName], [ItemCategory]) VALUES (40, N'Braj Peda', N'Product')
INSERT [dbo].[mst_Item] ([ItemID], [ItemName], [ItemCategory]) VALUES (41, N'Amrakhand 100 gms', N'Product')
SET IDENTITY_INSERT [dbo].[mst_Item] OFF
GO
SET IDENTITY_INSERT [dbo].[mst_Unit] ON 

INSERT [dbo].[mst_Unit] ([UnitID], [UnitName]) VALUES (2, N'BHOPAL Route')
INSERT [dbo].[mst_Unit] ([UnitID], [UnitName]) VALUES (3, N'TIMARNI Route')
INSERT [dbo].[mst_Unit] ([UnitID], [UnitName]) VALUES (4, N'HOSHANGABAD Route')
INSERT [dbo].[mst_Unit] ([UnitID], [UnitName]) VALUES (5, N'ITARSI Route')
INSERT [dbo].[mst_Unit] ([UnitID], [UnitName]) VALUES (6, N'PIPRIYA Route')
INSERT [dbo].[mst_Unit] ([UnitID], [UnitName]) VALUES (7, N'VIDISHA Route')
INSERT [dbo].[mst_Unit] ([UnitID], [UnitName]) VALUES (8, N'GANJBASODA Route')
INSERT [dbo].[mst_Unit] ([UnitID], [UnitName]) VALUES (9, N'RAISEN Route')
INSERT [dbo].[mst_Unit] ([UnitID], [UnitName]) VALUES (10, N'BADI Route')
INSERT [dbo].[mst_Unit] ([UnitID], [UnitName]) VALUES (11, N'NARSINGHGARH Route')
INSERT [dbo].[mst_Unit] ([UnitID], [UnitName]) VALUES (12, N'GUNA Route')
INSERT [dbo].[mst_Unit] ([UnitID], [UnitName]) VALUES (13, N'NASRULLAGANJ Route')
INSERT [dbo].[mst_Unit] ([UnitID], [UnitName]) VALUES (14, N'SEHORE Route')
INSERT [dbo].[mst_Unit] ([UnitID], [UnitName]) VALUES (15, N'SIRONJ Route')
INSERT [dbo].[mst_Unit] ([UnitID], [UnitName]) VALUES (16, N'HARDA Route')
INSERT [dbo].[mst_Unit] ([UnitID], [UnitName]) VALUES (17, N'BARELI Route')
INSERT [dbo].[mst_Unit] ([UnitID], [UnitName]) VALUES (18, N'BIAORA Route')
INSERT [dbo].[mst_Unit] ([UnitID], [UnitName]) VALUES (19, N'BETUL')
INSERT [dbo].[mst_Unit] ([UnitID], [UnitName]) VALUES (20, N'SMP at BSDS')
INSERT [dbo].[mst_Unit] ([UnitID], [UnitName]) VALUES (21, N'SMP at Ware House')
INSERT [dbo].[mst_Unit] ([UnitID], [UnitName]) VALUES (22, N'SMP at Gwalior')
INSERT [dbo].[mst_Unit] ([UnitID], [UnitName]) VALUES (23, N'SMP at Powan Shri Food')
INSERT [dbo].[mst_Unit] ([UnitID], [UnitName]) VALUES (24, N'SMP at Jai Shri Gayatri')
INSERT [dbo].[mst_Unit] ([UnitID], [UnitName]) VALUES (25, N'SMP at Health Food LLP')
INSERT [dbo].[mst_Unit] ([UnitID], [UnitName]) VALUES (26, N'SMP at Indore')
INSERT [dbo].[mst_Unit] ([UnitID], [UnitName]) VALUES (27, N'SMP at USDS Ujjain')
SET IDENTITY_INSERT [dbo].[mst_Unit] OFF
GO
SET IDENTITY_INSERT [dbo].[PlantManufacturingData] ON 

INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity]) VALUES (1, CAST(N'2024-10-03' AS Date), N'SMP', 0)
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity]) VALUES (2, CAST(N'2024-10-03' AS Date), N'Sweeten SMP', 0)
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity]) VALUES (3, CAST(N'2024-10-03' AS Date), N'WB', 2300)
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity]) VALUES (4, CAST(N'2024-10-03' AS Date), N'Plain curd', 2030)
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity]) VALUES (5, CAST(N'2024-10-03' AS Date), N'Sweet Curd', 609)
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity]) VALUES (6, CAST(N'2024-10-03' AS Date), N'Salted Butter Milk 200 ML', 488)
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity]) VALUES (7, CAST(N'2024-10-03' AS Date), N'Plain Butter Milk', 6650)
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity]) VALUES (8, CAST(N'2024-10-03' AS Date), N'Cold Coffee', 0)
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity]) VALUES (9, CAST(N'2024-10-03' AS Date), N'Fl.Milk Pet Bottle', 0)
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity]) VALUES (10, CAST(N'2024-10-03' AS Date), N'S.F.M Glass(Bottles)', 0)
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity]) VALUES (11, CAST(N'2024-10-03' AS Date), N'Lassi 200 ML Glass', 272)
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity]) VALUES (12, CAST(N'2024-10-03' AS Date), N'Lite Lassi 200 ML', 0)
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity]) VALUES (13, CAST(N'2024-10-03' AS Date), N'Shrikhand', 274)
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity]) VALUES (14, CAST(N'2024-10-03' AS Date), N'Chena Rabdi', 215)
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity]) VALUES (15, CAST(N'2024-10-03' AS Date), N'Sabudana Kheer 100 gm', 0)
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity]) VALUES (16, CAST(N'2024-10-03' AS Date), N'Peda', 192)
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity]) VALUES (17, CAST(N'2024-10-03' AS Date), N'Milk Cake', 25)
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity]) VALUES (18, CAST(N'2024-10-03' AS Date), N'Mawa', 31)
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity]) VALUES (19, CAST(N'2024-10-03' AS Date), N'Paneer', 197)
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity]) VALUES (20, CAST(N'2024-10-03' AS Date), N'Vaccum Paneer', 0)
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity]) VALUES (21, CAST(N'2024-10-03' AS Date), N'Rasogulla', 0)
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity]) VALUES (22, CAST(N'2024-10-03' AS Date), N'Gulabjamun', 0)
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity]) VALUES (23, CAST(N'2024-10-03' AS Date), N'Shrikhand Lite 100 gms cups', 0)
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity]) VALUES (24, CAST(N'2024-10-03' AS Date), N'Table Butter', 0)
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity]) VALUES (25, CAST(N'2024-10-03' AS Date), N'Cookies', 0)
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity]) VALUES (26, CAST(N'2024-10-03' AS Date), N'Sugar Free Peda', 0)
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity]) VALUES (27, CAST(N'2024-10-03' AS Date), N'Butter Chiplet', 0)
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity]) VALUES (28, CAST(N'2024-10-03' AS Date), N'Besan Laddu', 0)
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity]) VALUES (29, CAST(N'2024-10-03' AS Date), N'Sanchi Neer lit', 0)
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity]) VALUES (30, CAST(N'2024-10-03' AS Date), N'Misti Doi 100gm', 0)
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity]) VALUES (31, CAST(N'2024-10-03' AS Date), N'Braj Peda', 0)
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity]) VALUES (32, CAST(N'2024-10-03' AS Date), N'Amrakhand 100 gms', 15)
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity]) VALUES (33, CAST(N'2024-10-03' AS Date), N'STD', 0)
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity]) VALUES (34, CAST(N'2024-10-03' AS Date), N'DTM', 0)
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity]) VALUES (35, CAST(N'2024-10-03' AS Date), N'LITE', 0)
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity]) VALUES (36, CAST(N'2024-10-03' AS Date), N'FCM', 0)
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity]) VALUES (37, CAST(N'2024-10-03' AS Date), N'Diamond', 0)
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity]) VALUES (38, CAST(N'2024-10-03' AS Date), N'TM', 0)
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity]) VALUES (39, CAST(N'2024-10-03' AS Date), N'CHAH', 0)
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity]) VALUES (40, CAST(N'2024-10-03' AS Date), N'FCM 1L', 0)
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity]) VALUES (41, CAST(N'2024-10-03' AS Date), N'Chai spl. 1000ML', 0)
SET IDENTITY_INSERT [dbo].[PlantManufacturingData] OFF
GO
SET IDENTITY_INSERT [dbo].[trn_Demand] ON 

INSERT [dbo].[trn_Demand] ([DemandId], [Date], [ItemCategory], [Shift], [Retailer], [VehicleNo], [DemandType]) VALUES (1, CAST(N'2024-10-03' AS Date), N'Product', N'Morning', N'Depot No. 94[D75]', N'MP-04-GB-0338', N'Regular')
SET IDENTITY_INSERT [dbo].[trn_Demand] OFF
GO
SET IDENTITY_INSERT [dbo].[trn_DemandsChild] ON 

INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard]) VALUES (1, 1, N'SMP', 0, 0)
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard]) VALUES (2, 1, N'Sweeten SMP', 0, 0)
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard]) VALUES (3, 1, N'WB', 0, 0)
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard]) VALUES (4, 1, N'Plain curd', 1855, 0)
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard]) VALUES (5, 1, N'Sweet Curd', 541, 0)
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard]) VALUES (6, 1, N'Salted Butter Milk 200 ML', 855, 0)
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard]) VALUES (7, 1, N'Plain Butter Milk', 6238, 0)
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard]) VALUES (8, 1, N'Cold Coffee', 0, 0)
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard]) VALUES (9, 1, N'Fl.Milk Pet Bottle', 19, 0)
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard]) VALUES (10, 1, N'S.F.M Glass(Bottles)', 40, 0)
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard]) VALUES (11, 1, N'Lassi 200 ML Glass', 149, 0)
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard]) VALUES (12, 1, N'Lite Lassi 200 ML', 0, 0)
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard]) VALUES (13, 1, N'Shrikhand', 246, 0)
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard]) VALUES (14, 1, N'Chena Rabdi', 125, 0)
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard]) VALUES (15, 1, N'Sabudana Kheer 100 gm', 0, 0)
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard]) VALUES (16, 1, N'Peda', 132, 0)
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard]) VALUES (17, 1, N'Milk Cake', 22, 0)
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard]) VALUES (18, 1, N'Mawa', 11, 0)
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard]) VALUES (19, 1, N'Paneer', 83, 0)
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard]) VALUES (20, 1, N'Vaccum Paneer', 0, 0)
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard]) VALUES (21, 1, N'Rasogulla', 0, 0)
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard]) VALUES (22, 1, N'Gulabjamun', 0, 0)
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard]) VALUES (23, 1, N'Shrikhand Lite 100 gms cups', 0, 0)
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard]) VALUES (24, 1, N'Table Butter', 8, 0)
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard]) VALUES (25, 1, N'Cookies', 0, 0)
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard]) VALUES (26, 1, N'Sugar Free Peda', 0, 0)
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard]) VALUES (27, 1, N'Butter Chiplet', 6, 0)
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard]) VALUES (28, 1, N'Besan Laddu', 0, 0)
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard]) VALUES (29, 1, N'Sanchi Neer lit', 720, 0)
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard]) VALUES (30, 1, N'Misti Doi 100gm', 0, 0)
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard]) VALUES (31, 1, N'Braj Peda', 0, 0)
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard]) VALUES (32, 1, N'Amrakhand 100 gms', 13, 0)
SET IDENTITY_INSERT [dbo].[trn_DemandsChild] OFF
GO
SET IDENTITY_INSERT [dbo].[Trn_InflowDetails] ON 

INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock]) VALUES (1, 8, CAST(N'2024-10-03' AS Date), 166390, CAST(8386.06 AS Decimal(18, 2)), CAST(13560.79 AS Decimal(18, 2)), CAST(5.04 AS Decimal(18, 2)), CAST(8.15 AS Decimal(18, 2)), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock]) VALUES (2, 9, CAST(N'2024-10-03' AS Date), 8749, CAST(401.58 AS Decimal(18, 2)), CAST(707.79 AS Decimal(18, 2)), CAST(4.59 AS Decimal(18, 2)), CAST(8.09 AS Decimal(18, 2)), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock]) VALUES (3, 10, CAST(N'2024-10-03' AS Date), 621, CAST(32.04 AS Decimal(18, 2)), CAST(50.86 AS Decimal(18, 2)), CAST(5.16 AS Decimal(18, 2)), CAST(8.19 AS Decimal(18, 2)), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock]) VALUES (4, 11, CAST(N'2024-10-03' AS Date), 16680, CAST(835.67 AS Decimal(18, 2)), CAST(1366.09 AS Decimal(18, 2)), CAST(5.01 AS Decimal(18, 2)), CAST(8.19 AS Decimal(18, 2)), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock]) VALUES (5, 12, CAST(N'2024-10-03' AS Date), 20911, CAST(1079.01 AS Decimal(18, 2)), CAST(1710.52 AS Decimal(18, 2)), CAST(5.16 AS Decimal(18, 2)), CAST(8.18 AS Decimal(18, 2)), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock]) VALUES (6, 13, CAST(N'2024-10-03' AS Date), 748, CAST(28.87 AS Decimal(18, 2)), CAST(59.54 AS Decimal(18, 2)), CAST(3.86 AS Decimal(18, 2)), CAST(7.96 AS Decimal(18, 2)), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock]) VALUES (7, 14, CAST(N'2024-10-03' AS Date), 958, CAST(50.49 AS Decimal(18, 2)), CAST(79.32 AS Decimal(18, 2)), CAST(5.27 AS Decimal(18, 2)), CAST(8.28 AS Decimal(18, 2)), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock]) VALUES (8, 15, CAST(N'2024-10-03' AS Date), 3354, CAST(154.28 AS Decimal(18, 2)), CAST(284.08 AS Decimal(18, 2)), CAST(4.60 AS Decimal(18, 2)), CAST(8.47 AS Decimal(18, 2)), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock]) VALUES (9, 16, CAST(N'2024-10-03' AS Date), 1298, CAST(65.81 AS Decimal(18, 2)), CAST(106.31 AS Decimal(18, 2)), CAST(5.07 AS Decimal(18, 2)), CAST(8.19 AS Decimal(18, 2)), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock]) VALUES (10, 17, CAST(N'2024-10-03' AS Date), 4607, CAST(258.45 AS Decimal(18, 2)), CAST(404.49 AS Decimal(18, 2)), CAST(5.61 AS Decimal(18, 2)), CAST(8.78 AS Decimal(18, 2)), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock]) VALUES (11, 18, CAST(N'2024-10-03' AS Date), 15543, CAST(752.28 AS Decimal(18, 2)), CAST(1268.31 AS Decimal(18, 2)), CAST(4.84 AS Decimal(18, 2)), CAST(8.16 AS Decimal(18, 2)), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock]) VALUES (12, 19, CAST(N'2024-10-03' AS Date), 2592, CAST(126.23 AS Decimal(18, 2)), CAST(215.14 AS Decimal(18, 2)), CAST(4.87 AS Decimal(18, 2)), CAST(8.30 AS Decimal(18, 2)), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock]) VALUES (13, 20, CAST(N'2024-10-03' AS Date), 2806, CAST(151.24 AS Decimal(18, 2)), CAST(231.21 AS Decimal(18, 2)), CAST(5.39 AS Decimal(18, 2)), CAST(8.24 AS Decimal(18, 2)), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock]) VALUES (14, 21, CAST(N'2024-10-03' AS Date), 1317, CAST(80.47 AS Decimal(18, 2)), CAST(111.95 AS Decimal(18, 2)), CAST(6.11 AS Decimal(18, 2)), CAST(8.50 AS Decimal(18, 2)), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock]) VALUES (15, 22, CAST(N'2024-10-03' AS Date), 10594, CAST(602.80 AS Decimal(18, 2)), CAST(879.30 AS Decimal(18, 2)), CAST(5.69 AS Decimal(18, 2)), CAST(8.30 AS Decimal(18, 2)), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock]) VALUES (16, 23, CAST(N'2024-10-03' AS Date), 517, CAST(25.95 AS Decimal(18, 2)), CAST(41.52 AS Decimal(18, 2)), CAST(5.02 AS Decimal(18, 2)), CAST(8.03 AS Decimal(18, 2)), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock]) VALUES (17, 24, CAST(N'2024-10-03' AS Date), 0, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock]) VALUES (18, 25, CAST(N'2024-10-03' AS Date), 2293, CAST(110.06 AS Decimal(18, 2)), CAST(199.26 AS Decimal(18, 2)), CAST(4.80 AS Decimal(18, 2)), CAST(8.69 AS Decimal(18, 2)), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
SET IDENTITY_INSERT [dbo].[Trn_InflowDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[trn_Sale] ON 

INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory]) VALUES (1, N'2', CAST(N'2024-10-03' AS Date), N'Milk')
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory]) VALUES (2, N'3', CAST(N'2024-10-03' AS Date), N'Milk')
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory]) VALUES (3, N'4', CAST(N'2024-10-03' AS Date), N'Milk')
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory]) VALUES (4, N'5', CAST(N'2024-10-03' AS Date), N'Milk')
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory]) VALUES (5, N'6', CAST(N'2024-10-03' AS Date), N'Milk')
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory]) VALUES (6, N'7', CAST(N'2024-10-03' AS Date), N'Milk')
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory]) VALUES (7, N'8', CAST(N'2024-10-03' AS Date), N'Milk')
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory]) VALUES (9, N'9', CAST(N'2024-10-03' AS Date), N'Milk')
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory]) VALUES (10, N'10', CAST(N'2024-10-03' AS Date), N'Milk')
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory]) VALUES (11, N'11', CAST(N'2024-10-03' AS Date), N'Milk')
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory]) VALUES (12, N'12', CAST(N'2024-10-03' AS Date), N'Milk')
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory]) VALUES (13, N'13', CAST(N'2024-10-03' AS Date), N'Milk')
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory]) VALUES (14, N'14', CAST(N'2024-10-03' AS Date), N'Milk')
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory]) VALUES (15, N'15', CAST(N'2024-10-03' AS Date), N'Milk')
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory]) VALUES (16, N'16', CAST(N'2024-10-03' AS Date), N'Milk')
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory]) VALUES (18, N'17', CAST(N'2024-10-03' AS Date), N'Milk')
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory]) VALUES (19, N'18', CAST(N'2024-10-03' AS Date), N'Milk')
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory]) VALUES (20, N'19', CAST(N'2024-10-03' AS Date), N'Milk')
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory]) VALUES (21, N'2', CAST(N'2024-10-03' AS Date), N'Product')
SET IDENTITY_INSERT [dbo].[trn_Sale] OFF
GO
SET IDENTITY_INSERT [dbo].[trn_SaleChild] ON 

INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (1, 1, N'STD', 22695)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (2, 1, N'DTM', 33322)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (3, 1, N'LITE', 0)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (4, 1, N'FCM', 105454)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (5, 1, N'Diamond', 84)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (6, 1, N'TM', 4647)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (7, 1, N'CHAH', 56827)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (8, 1, N'FCM 1L', 7459)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (9, 1, N'Chai spl. 1000ML', 1882)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (10, 2, N'STD', 10)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (11, 2, N'DTM', 69)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (12, 2, N'LITE', 0)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (13, 2, N'FCM', 400)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (14, 2, N'Diamond', 0)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (15, 2, N'TM', 530)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (16, 2, N'CHAH', 570)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (17, 2, N'FCM 1L', 30)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (18, 2, N'Chai spl. 1000ML', 30)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (19, 3, N'STD', 85)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (20, 3, N'DTM', 453)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (21, 3, N'LITE', 0)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (22, 3, N'FCM', 1635)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (23, 3, N'Diamond', 0)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (24, 3, N'TM', 688)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (25, 3, N'CHAH', 667)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (26, 3, N'FCM 1L', 1)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (27, 3, N'Chai spl. 1000ML', 325)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (28, 4, N'STD', 490)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (29, 4, N'DTM', 288)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (30, 4, N'LITE', 0)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (31, 4, N'FCM', 550)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (32, 4, N'Diamond', 0)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (33, 4, N'TM', 1230)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (34, 4, N'CHAH', 1220)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (35, 4, N'FCM 1L', 0)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (36, 4, N'Chai spl. 1000ML', 0)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (37, 5, N'STD', 14)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (38, 5, N'DTM', 470)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (39, 5, N'LITE', 0)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (40, 5, N'FCM', 550)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (41, 5, N'Diamond', 0)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (42, 5, N'TM', 370)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (43, 5, N'CHAH', 760)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (44, 5, N'FCM 1L', 80)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (45, 5, N'Chai spl. 1000ML', 130)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (46, 6, N'STD', 66)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (47, 6, N'DTM', 232)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (48, 6, N'LITE', 0)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (49, 6, N'FCM', 229)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (50, 6, N'Diamond', 0)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (51, 6, N'TM', 546)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (52, 6, N'CHAH', 610)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (53, 6, N'FCM 1L', 15)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (54, 6, N'Chai spl. 1000ML', 60)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (55, 7, N'STD', 0)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (56, 7, N'DTM', 351)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (57, 7, N'LITE', 0)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (58, 7, N'FCM', 630)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (59, 7, N'Diamond', 0)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (60, 7, N'TM', 1525)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (61, 7, N'CHAH', 10)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (62, 7, N'FCM 1L', 0)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (63, 7, N'Chai spl. 1000ML', 0)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (72, 9, N'STD', 54)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (73, 9, N'DTM', 365)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (74, 9, N'LITE', 210)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (75, 9, N'FCM', 5)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (76, 9, N'Diamond', 260)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (77, 9, N'TM', 380)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (78, 9, N'CHAH', 5)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (79, 9, N'FCM 1L', 210)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (80, 10, N'STD', 0)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (81, 10, N'DTM', 342)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (82, 10, N'LITE', 0)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (83, 10, N'FCM', 460)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (84, 10, N'Diamond', 0)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (85, 10, N'TM', 780)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (86, 10, N'CHAH', 1100)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (87, 10, N'FCM 1L', 0)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (88, 10, N'Chai spl. 1000ML', 230)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (89, 11, N'STD', 10)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (90, 11, N'DTM', 361)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (91, 11, N'LITE', 0)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (92, 11, N'FCM', 190)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (93, 11, N'Diamond', 12)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (94, 11, N'TM', 998)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (95, 11, N'CHAH', 1810)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (96, 11, N'FCM 1L', 20)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (97, 11, N'Chai spl. 1000ML', 60)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (98, 12, N'STD', 240)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (99, 12, N'DTM', 443)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (100, 12, N'LITE', 0)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (101, 12, N'FCM', 1110)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (102, 12, N'Diamond', 30)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (103, 12, N'TM', 840)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (104, 12, N'CHAH', 2020)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (105, 12, N'FCM 1L', 150)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (106, 12, N'Chai spl. 1000ML', 90)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (107, 13, N'STD', 0)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (108, 13, N'DTM', 54)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (109, 13, N'LITE', 0)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (110, 13, N'FCM', 170)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (111, 13, N'Diamond', 0)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (112, 13, N'TM', 405)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (113, 13, N'CHAH', 725)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (114, 13, N'FCM 1L', 100)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (115, 13, N'Chai spl. 1000ML', 110)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (116, 14, N'STD', 0)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (117, 14, N'STD', 25)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (118, 14, N'DTM', 925)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (119, 14, N'LITE', 0)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (120, 14, N'FCM', 575)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (121, 14, N'Diamond', 0)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (122, 14, N'TM', 360)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (123, 14, N'CHAH', 3805)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (124, 14, N'FCM 1L', 555)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (125, 14, N'Chai spl. 1000ML', 90)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (126, 15, N'STD', 0)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (127, 15, N'DTM', 337)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (128, 15, N'LITE', 0)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (129, 15, N'FCM', 158)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (130, 15, N'Diamond', 0)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (131, 15, N'TM', 1120)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (132, 15, N'CHAH', 880)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (133, 15, N'FCM 1L', 0)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (134, 15, N'Chai spl. 1000ML', 115)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (135, 16, N'STD', 0)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (136, 16, N'DTM', 559)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (137, 16, N'LITE', 0)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (138, 16, N'FCM', 815)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (139, 16, N'Diamond', 0)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (140, 16, N'TM', 1260)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (141, 16, N'CHAH', 590)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (142, 16, N'FCM 1L', 540)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (143, 16, N'Chai spl. 1000ML', 10)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (153, 18, N'STD', 23)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (154, 18, N'DTM', 482)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (155, 18, N'LITE', 0)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (156, 18, N'FCM', 445)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (157, 18, N'Diamond', 0)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (158, 18, N'TM', 1170)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (159, 18, N'CHAH', 1480)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (160, 18, N'FCM 1L', 90)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (161, 18, N'Chai spl. 1000ML', 240)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (162, 19, N'STD', 0)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (163, 19, N'DTM', 827)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (164, 19, N'LITE', 0)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (165, 19, N'FCM', 305)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (166, 19, N'Diamond', 13)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (167, 19, N'TM', 1283)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (168, 19, N'CHAH', 4310)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (169, 19, N'FCM 1L', 220)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (170, 19, N'Chai spl. 1000ML', 180)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (171, 20, N'STD', 420)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (172, 20, N'DTM', 837)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (173, 20, N'LITE', 0)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (174, 20, N'FCM', 1750)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (175, 20, N'Diamond', 0)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (176, 20, N'TM', 1370)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (177, 20, N'CHAH', 7130)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (178, 20, N'FCM 1L', 0)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (179, 20, N'Chai spl. 1000ML', 0)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (180, 21, N'SMP', 0)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (181, 21, N'Sweeten SMP', 0)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (182, 21, N'WB', 22000)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (183, 21, N'Plain curd', 1856)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (184, 21, N'Sweet Curd', 555)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (185, 21, N'Salted Butter Milk 200 ML', 899)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (186, 21, N'Plain Butter Milk', 6219)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (187, 21, N'Cold Coffee', 0)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (188, 21, N'Fl.Milk Pet Bottle', 0)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (189, 21, N'S.F.M Glass(Bottles)', 40)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (190, 21, N'Lassi 200 ML Glass', 169)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (191, 21, N'Lite Lassi 200 ML', 0)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (192, 21, N'Shrikhand', 261)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (193, 21, N'Chena Rabdi', 139)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (194, 21, N'Sabudana Kheer 100 gm', 0)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (195, 21, N'Peda', 191)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (196, 21, N'Milk Cake', 24)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (197, 21, N'Mawa', 31)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (198, 21, N'Paneer', 105)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (199, 21, N'Vaccum Paneer', 0)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (200, 21, N'Rasogulla', 0)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (201, 21, N'Gulabjamun', 0)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (202, 21, N'Shrikhand Lite 100 gms cups', 0)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (203, 21, N'Table Butter', 8)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (204, 21, N'Cookies', 0)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (205, 21, N'Sugar Free Peda', 0)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (206, 21, N'Butter Chiplet', 6)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (207, 21, N'Besan Laddu', 0)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (208, 21, N'Sanchi Neer lit', 0)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (209, 21, N'Misti Doi 100gm', 0)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (210, 21, N'Braj Peda', 0)
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity]) VALUES (211, 21, N'Amrakhand 100 gms', 13)
SET IDENTITY_INSERT [dbo].[trn_SaleChild] OFF
GO
ALTER TABLE [dbo].[trn_DemandsChild]  WITH CHECK ADD FOREIGN KEY([DemandId])
REFERENCES [dbo].[trn_Demand] ([DemandId])
GO
/****** Object:  StoredProcedure [dbo].[GetItemsByCategory]    Script Date: 03-Oct-24 7:29:26 PM ******/
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
/****** Object:  StoredProcedure [dbo].[usp_AddDemand]    Script Date: 03-Oct-24 7:29:26 PM ******/
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
/****** Object:  StoredProcedure [dbo].[usp_AddInFlow]    Script Date: 03-Oct-24 7:29:26 PM ******/
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
	,@WholeMilkPowderqty	int
	,@WholeMilkPowderstock	int
	,@Gheeqty				int
	,@Gheestock				int
		
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
				,WholeMilkPowderqty 
				,WholeMilkPowderstock	
				,Gheeqty				
				,Gheestock				
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
				,@WholeMilkPowderqty 
				,@WholeMilkPowderstock	
				,@Gheeqty				
				,@Gheestock				
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
/****** Object:  StoredProcedure [dbo].[usp_AddManufItem]    Script Date: 03-Oct-24 7:29:26 PM ******/
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
/****** Object:  StoredProcedure [dbo].[usp_AddSales]    Script Date: 03-Oct-24 7:29:26 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Usp_AproveInflow]    Script Date: 03-Oct-24 7:29:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  proc  [dbo].[Usp_AproveInflow]
    
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
				,@WholeMilkPowderqty int
				,@WholeMilkPowderstock	int
				,@Gheeqty				int
				,@Gheestock				int
				
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
			,WholeMilkPowderqty 	   =@WholeMilkPowderqty 
			,WholeMilkPowderstock	   =@WholeMilkPowderstock	
			,Gheeqty				   =@Gheeqty				
			,Gheestock				   =@Gheestock				
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
/****** Object:  StoredProcedure [dbo].[Usp_GetInflowToAprove]    Script Date: 03-Oct-24 7:29:26 PM ******/
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
				,unit.[Unit name] UnitName
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
				,WholeMilkPowderqty		
				,WholeMilkPowderstock	
				,Gheeqty				
				,Gheestock				
				
				,IsApproved from [Trn_InflowDetails]
				inner join [mst_InflowUnits] unit on unit.Id= [Trn_InflowDetails].UnitID
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
/****** Object:  StoredProcedure [dbo].[Usp_GetinflowUnit]    Script Date: 03-Oct-24 7:29:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  create proc  [dbo].[Usp_GetinflowUnit]
  as
  begin
  declare @status bit=0 ,@msg varchar(100)=null
  BEGIN TRY

		select id [Id] ,[Unit name] [Name] from [mst_InflowUnits]
	
	    SELECT	@status =1 ,@msg='Unit Name selectted Successfully'	 
	END TRY
    BEGIN CATCH          
		SELECT	@status =0 ,@msg=ERROR_MESSAGE()	 
    END CATCH;
	SELECT	@status [status] ,@msg [msg]
  end
GO
/****** Object:  StoredProcedure [dbo].[Usp_GetUnit]    Script Date: 03-Oct-24 7:29:26 PM ******/
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
/****** Object:  StoredProcedure [dbo].[uspTransReport]    Script Date: 03-Oct-24 7:29:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc  [dbo].[uspTransReport] 
  as
  begin
	declare @status bit=0 ,@msg varchar(100)=null  
	BEGIN TRY
		BEGIN TRANSACTION   
		select SC.ItemName, isnull(sum(sc.Demand),0) Demand,isnull(sum( sc.Sales),0) Sales, isnull(sum(m.Quantity) ,0)as Manufacturing  from 
				(select DC.ItemName , dc.Demand , sum(sc.Quantity) as Sales from(SELECT 
					item.ItemName,
					SUM(dc.Quantity) AS Demand    
				FROM 
					trn_DemandsChild dc
				full join mst_Item item on (item.ItemName=dc.ItemName)
				GROUP BY item.ItemName
					) as DC
				full join trn_SaleChild sc on dc.ItemName = sc.ItemName
				group by DC.ItemName , dc.Demand) as SC
			full join PlantManufacturingData m on m.ItemName = sc.ItemName
			
				group by SC.ItemName, sc.Demand, sc.Sales
			order by ( isnull(sum(sc.Sales),0)+ isnull(sum(sc.Demand),0)+ isnull(sum(m.Quantity),0))  desc

	
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
/****** Object:  StoredProcedure [dbo].[uspVerifierDetails]    Script Date: 03-Oct-24 7:29:26 PM ******/
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
        mu.[Unit name] UnitName,
        tf.Date,
        tf.Milkqty,
        tf.Milkfat,
        tf.MilkSNF,
        tf.Milkfatperc,
        tf.MilkSNFperc,
        tf.Butterqty,
        tf.Butterstock,
        tf.MilkPowderqty,
        tf.MilkPowderstock
			,tf.WholeMilkPowderqty	
			,tf.WholeMilkPowderstock	
			,tf.Gheeqty				
			,tf.Gheestock				
		,IsVerifed

    FROM Trn_InflowDetails tf
    INNER JOIN [mst_InflowUnits] mu
    ON tf.UnitID = mu.id
		where IsApproved =0 and( IsVerifed= @IsVerifed or @IsVerifed is NULL)
	order by IsVerifed
END
GO
/****** Object:  StoredProcedure [dbo].[uspVerifierUpdate]    Script Date: 03-Oct-24 7:29:26 PM ******/
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
	,@WholeMilkPowderqty		int
	,@WholeMilkPowderstock		int
	,@Gheeqty					int
	,@Gheestock					int
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
            MilkPowderstock = @MilkPowderstock
			,WholeMilkPowderqty		 =@WholeMilkPowderqty		
			,WholeMilkPowderstock	 =@WholeMilkPowderstock	
			,Gheeqty				 =@Gheeqty				
			,Gheestock				 =@Gheestock				

			,IsVerifed   = 1
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
