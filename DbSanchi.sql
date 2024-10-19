USE [master]
GO
/****** Object:  Database [DbSanchi]    Script Date: 18-Oct-24 3:59:33 PM ******/
CREATE DATABASE [DbSanchi]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DbSanchi', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\DbSanchi.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
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
/****** Object:  UserDefinedTableType [dbo].[DemandedItemsList]    Script Date: 18-Oct-24 3:59:33 PM ******/
CREATE TYPE [dbo].[DemandedItemsList] AS TABLE(
	[ItemID] [int] NULL,
	[ItemName] [varchar](50) NULL,
	[Quantity] [int] NULL,
	[AdvancedCard] [int] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[DemandItems]    Script Date: 18-Oct-24 3:59:33 PM ******/
CREATE TYPE [dbo].[DemandItems] AS TABLE(
	[ItemName] [varchar](50) NULL,
	[Quantity] [int] NULL,
	[AdvancedCard] [int] NULL
)
GO
/****** Object:  Table [dbo].[mst_InflowUnits]    Script Date: 18-Oct-24 3:59:33 PM ******/
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
/****** Object:  Table [dbo].[mst_Item]    Script Date: 18-Oct-24 3:59:33 PM ******/
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
/****** Object:  Table [dbo].[mst_Unit]    Script Date: 18-Oct-24 3:59:33 PM ******/
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
/****** Object:  Table [dbo].[PlantManufacturingData]    Script Date: 18-Oct-24 3:59:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlantManufacturingData](
	[ManufItemId] [int] IDENTITY(1,1) NOT NULL,
	[Date] [date] NULL,
	[ItemName] [varchar](50) NULL,
	[Quantity] [int] NULL,
	[ItemID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[trn_Demand]    Script Date: 18-Oct-24 3:59:33 PM ******/
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
/****** Object:  Table [dbo].[trn_DemandsChild]    Script Date: 18-Oct-24 3:59:33 PM ******/
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
	[ItemID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[DemandsChildID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Trn_InflowDetails]    Script Date: 18-Oct-24 3:59:33 PM ******/
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
	[lysdqty] [decimal](18, 2) NULL,
	[LYSDDate] [date] NULL,
	[LYSDFatPercent] [decimal](18, 2) NULL,
	[LYSDSNFPercent] [decimal](18, 2) NULL,
	[LYSDFatKG] [decimal](18, 2) NULL,
	[LYSDSNFKG] [decimal](18, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[InflowId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[trn_Sale]    Script Date: 18-Oct-24 3:59:33 PM ******/
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
/****** Object:  Table [dbo].[trn_SaleChild]    Script Date: 18-Oct-24 3:59:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[trn_SaleChild](
	[SaleChildid] [int] IDENTITY(1,1) NOT NULL,
	[SalesID] [int] NULL,
	[ItemName] [varchar](50) NOT NULL,
	[Quantity] [int] NOT NULL,
	[ItemID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[SaleChildid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[mst_InflowUnits] ON 
GO
INSERT [dbo].[mst_InflowUnits] ([Id], [Unit name]) VALUES (1, N'SMP at Ware House')
GO
INSERT [dbo].[mst_InflowUnits] ([Id], [Unit name]) VALUES (2, N'SMP at Gwalior')
GO
INSERT [dbo].[mst_InflowUnits] ([Id], [Unit name]) VALUES (3, N'SMP at Powan Shri Food')
GO
INSERT [dbo].[mst_InflowUnits] ([Id], [Unit name]) VALUES (4, N'SMP at Jai Shri Gayatri')
GO
INSERT [dbo].[mst_InflowUnits] ([Id], [Unit name]) VALUES (5, N'SMP at Health Food LLP')
GO
INSERT [dbo].[mst_InflowUnits] ([Id], [Unit name]) VALUES (6, N'SMP at Indore')
GO
INSERT [dbo].[mst_InflowUnits] ([Id], [Unit name]) VALUES (7, N'SMP at USDS Ujjain')
GO
INSERT [dbo].[mst_InflowUnits] ([Id], [Unit name]) VALUES (8, N'BMC BHOPAL ')
GO
INSERT [dbo].[mst_InflowUnits] ([Id], [Unit name]) VALUES (9, N'ASHTA')
GO
INSERT [dbo].[mst_InflowUnits] ([Id], [Unit name]) VALUES (10, N'NARSINGARH')
GO
INSERT [dbo].[mst_InflowUnits] ([Id], [Unit name]) VALUES (11, N'BETUL')
GO
INSERT [dbo].[mst_InflowUnits] ([Id], [Unit name]) VALUES (12, N'MULTAI')
GO
INSERT [dbo].[mst_InflowUnits] ([Id], [Unit name]) VALUES (13, N'BARELI')
GO
INSERT [dbo].[mst_InflowUnits] ([Id], [Unit name]) VALUES (14, N'VIDISHA')
GO
INSERT [dbo].[mst_InflowUnits] ([Id], [Unit name]) VALUES (15, N'SOHAGPUR')
GO
INSERT [dbo].[mst_InflowUnits] ([Id], [Unit name]) VALUES (16, N'HARDA')
GO
INSERT [dbo].[mst_InflowUnits] ([Id], [Unit name]) VALUES (17, N'LATERI')
GO
INSERT [dbo].[mst_InflowUnits] ([Id], [Unit name]) VALUES (18, N'SHUJALPUR')
GO
INSERT [dbo].[mst_InflowUnits] ([Id], [Unit name]) VALUES (19, N'MALIWAYA')
GO
INSERT [dbo].[mst_InflowUnits] ([Id], [Unit name]) VALUES (20, N'GAIRATGANJ')
GO
INSERT [dbo].[mst_InflowUnits] ([Id], [Unit name]) VALUES (21, N'SILWANI')
GO
INSERT [dbo].[mst_InflowUnits] ([Id], [Unit name]) VALUES (22, N'PACHORE')
GO
INSERT [dbo].[mst_InflowUnits] ([Id], [Unit name]) VALUES (23, N'DEORI')
GO
INSERT [dbo].[mst_InflowUnits] ([Id], [Unit name]) VALUES (24, N'GOHARGANJ')
GO
INSERT [dbo].[mst_InflowUnits] ([Id], [Unit name]) VALUES (25, N'GUNA')
GO
SET IDENTITY_INSERT [dbo].[mst_InflowUnits] OFF
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
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (1, CAST(N'2024-10-03' AS Date), N'SMP', 0, 10)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (2, CAST(N'2024-10-03' AS Date), N'Sweeten SMP', 0, 11)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (3, CAST(N'2024-10-03' AS Date), N'WB', 2300, 12)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (4, CAST(N'2024-10-03' AS Date), N'Plain curd', 2030, 13)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (5, CAST(N'2024-10-03' AS Date), N'Sweet Curd', 609, 14)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (6, CAST(N'2024-10-03' AS Date), N'Salted Butter Milk 200 ML', 488, 15)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (7, CAST(N'2024-10-03' AS Date), N'Plain Butter Milk', 6650, 16)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (8, CAST(N'2024-10-03' AS Date), N'Cold Coffee', 0, 17)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (9, CAST(N'2024-10-03' AS Date), N'Fl.Milk Pet Bottle', 0, 18)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (10, CAST(N'2024-10-03' AS Date), N'S.F.M Glass(Bottles)', 0, 19)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (11, CAST(N'2024-10-03' AS Date), N'Lassi 200 ML Glass', 272, 20)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (12, CAST(N'2024-10-03' AS Date), N'Lite Lassi 200 ML', 0, 21)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (13, CAST(N'2024-10-03' AS Date), N'Shrikhand', 274, 22)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (14, CAST(N'2024-10-03' AS Date), N'Chena Rabdi', 215, 23)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (15, CAST(N'2024-10-03' AS Date), N'Sabudana Kheer 100 gm', 0, 24)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (16, CAST(N'2024-10-03' AS Date), N'Peda', 192, 25)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (17, CAST(N'2024-10-03' AS Date), N'Milk Cake', 25, 26)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (18, CAST(N'2024-10-03' AS Date), N'Mawa', 31, 27)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (19, CAST(N'2024-10-03' AS Date), N'Paneer', 197, 28)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (20, CAST(N'2024-10-03' AS Date), N'Vaccum Paneer', 0, 29)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (21, CAST(N'2024-10-03' AS Date), N'Rasogulla', 0, 30)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (22, CAST(N'2024-10-03' AS Date), N'Gulabjamun', 0, 31)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (23, CAST(N'2024-10-03' AS Date), N'Shrikhand Lite 100 gms cups', 0, 32)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (24, CAST(N'2024-10-03' AS Date), N'Table Butter', 0, 33)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (25, CAST(N'2024-10-03' AS Date), N'Cookies', 0, 34)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (26, CAST(N'2024-10-03' AS Date), N'Sugar Free Peda', 0, 35)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (27, CAST(N'2024-10-03' AS Date), N'Butter Chiplet', 0, 36)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (28, CAST(N'2024-10-03' AS Date), N'Besan Laddu', 0, 37)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (29, CAST(N'2024-10-03' AS Date), N'Sanchi Neer lit', 0, 38)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (30, CAST(N'2024-10-03' AS Date), N'Misti Doi 100gm', 0, 39)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (31, CAST(N'2024-10-03' AS Date), N'Braj Peda', 0, 40)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (32, CAST(N'2024-10-03' AS Date), N'Amrakhand 100 gms', 15, 41)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (33, CAST(N'2024-10-03' AS Date), N'STD', 0, 1)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (34, CAST(N'2024-10-03' AS Date), N'DTM', 0, 2)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (35, CAST(N'2024-10-03' AS Date), N'LITE', 0, 3)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (36, CAST(N'2024-10-03' AS Date), N'FCM', 0, 4)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (37, CAST(N'2024-10-03' AS Date), N'Diamond', 0, 5)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (38, CAST(N'2024-10-03' AS Date), N'TM', 0, 6)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (39, CAST(N'2024-10-03' AS Date), N'CHAH', 0, 7)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (40, CAST(N'2024-10-03' AS Date), N'FCM 1L', 0, 8)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (41, CAST(N'2024-10-03' AS Date), N'Chai spl. 1000ML', 0, 9)
GO
SET IDENTITY_INSERT [dbo].[PlantManufacturingData] OFF
GO
SET IDENTITY_INSERT [dbo].[trn_Demand] ON 
GO
INSERT [dbo].[trn_Demand] ([DemandId], [Date], [ItemCategory], [Shift], [Retailer], [VehicleNo], [DemandType]) VALUES (1, CAST(N'2024-10-03' AS Date), N'Product', N'Morning', N'Depot No. 94[D75]', N'MP-04-GB-0338', N'Regular')
GO
SET IDENTITY_INSERT [dbo].[trn_Demand] OFF
GO
SET IDENTITY_INSERT [dbo].[trn_DemandsChild] ON 
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (1, 1, N'SMP', 0, 0, 10)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (2, 1, N'Sweeten SMP', 0, 0, 11)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (3, 1, N'WB', 0, 0, 12)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (4, 1, N'Plain curd', 1855, 0, 13)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (5, 1, N'Sweet Curd', 541, 0, 14)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (6, 1, N'Salted Butter Milk 200 ML', 855, 0, 15)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (7, 1, N'Plain Butter Milk', 6238, 0, 16)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (8, 1, N'Cold Coffee', 0, 0, 17)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (9, 1, N'Fl.Milk Pet Bottle', 19, 0, 18)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (10, 1, N'S.F.M Glass(Bottles)', 40, 0, 19)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (11, 1, N'Lassi 200 ML Glass', 149, 0, 20)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (12, 1, N'Lite Lassi 200 ML', 0, 0, 21)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (13, 1, N'Shrikhand', 246, 0, 22)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (14, 1, N'Chena Rabdi', 125, 0, 23)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (15, 1, N'Sabudana Kheer 100 gm', 0, 0, 24)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (16, 1, N'Peda', 132, 0, 25)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (17, 1, N'Milk Cake', 22, 0, 26)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (18, 1, N'Mawa', 11, 0, 27)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (19, 1, N'Paneer', 83, 0, 28)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (20, 1, N'Vaccum Paneer', 0, 0, 29)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (21, 1, N'Rasogulla', 0, 0, 30)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (22, 1, N'Gulabjamun', 0, 0, 31)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (23, 1, N'Shrikhand Lite 100 gms cups', 0, 0, 32)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (24, 1, N'Table Butter', 8, 0, 33)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (25, 1, N'Cookies', 0, 0, 34)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (26, 1, N'Sugar Free Peda', 0, 0, 35)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (27, 1, N'Butter Chiplet', 6, 0, 36)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (28, 1, N'Besan Laddu', 0, 0, 37)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (29, 1, N'Sanchi Neer lit', 720, 0, 38)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (30, 1, N'Misti Doi 100gm', 0, 0, 39)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (31, 1, N'Braj Peda', 0, 0, 40)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (32, 1, N'Amrakhand 100 gms', 13, 0, 41)
GO
SET IDENTITY_INSERT [dbo].[trn_DemandsChild] OFF
GO
SET IDENTITY_INSERT [dbo].[Trn_InflowDetails] ON 
GO
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock], [lysdqty], [LYSDDate], [LYSDFatPercent], [LYSDSNFPercent], [LYSDFatKG], [LYSDSNFKG]) VALUES (1, 8, CAST(N'2024-10-03' AS Date), 166390, CAST(8386.06 AS Decimal(18, 2)), CAST(13560.79 AS Decimal(18, 2)), CAST(5.04 AS Decimal(18, 2)), CAST(8.15 AS Decimal(18, 2)), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock], [lysdqty], [LYSDDate], [LYSDFatPercent], [LYSDSNFPercent], [LYSDFatKG], [LYSDSNFKG]) VALUES (2, 9, CAST(N'2024-10-03' AS Date), 8749, CAST(401.58 AS Decimal(18, 2)), CAST(707.79 AS Decimal(18, 2)), CAST(4.59 AS Decimal(18, 2)), CAST(8.09 AS Decimal(18, 2)), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock], [lysdqty], [LYSDDate], [LYSDFatPercent], [LYSDSNFPercent], [LYSDFatKG], [LYSDSNFKG]) VALUES (3, 10, CAST(N'2024-10-03' AS Date), 621, CAST(34.53 AS Decimal(18, 2)), CAST(50.86 AS Decimal(18, 2)), CAST(5.56 AS Decimal(18, 2)), CAST(8.19 AS Decimal(18, 2)), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock], [lysdqty], [LYSDDate], [LYSDFatPercent], [LYSDSNFPercent], [LYSDFatKG], [LYSDSNFKG]) VALUES (4, 11, CAST(N'2024-10-03' AS Date), 16680, CAST(835.67 AS Decimal(18, 2)), CAST(1366.09 AS Decimal(18, 2)), CAST(5.01 AS Decimal(18, 2)), CAST(8.19 AS Decimal(18, 2)), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock], [lysdqty], [LYSDDate], [LYSDFatPercent], [LYSDSNFPercent], [LYSDFatKG], [LYSDSNFKG]) VALUES (5, 12, CAST(N'2024-10-03' AS Date), 20911, CAST(1079.01 AS Decimal(18, 2)), CAST(1710.52 AS Decimal(18, 2)), CAST(5.16 AS Decimal(18, 2)), CAST(8.18 AS Decimal(18, 2)), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock], [lysdqty], [LYSDDate], [LYSDFatPercent], [LYSDSNFPercent], [LYSDFatKG], [LYSDSNFKG]) VALUES (6, 13, CAST(N'2024-10-03' AS Date), 748, CAST(28.87 AS Decimal(18, 2)), CAST(59.54 AS Decimal(18, 2)), CAST(3.86 AS Decimal(18, 2)), CAST(7.96 AS Decimal(18, 2)), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock], [lysdqty], [LYSDDate], [LYSDFatPercent], [LYSDSNFPercent], [LYSDFatKG], [LYSDSNFKG]) VALUES (7, 14, CAST(N'2024-10-03' AS Date), 958, CAST(50.49 AS Decimal(18, 2)), CAST(79.32 AS Decimal(18, 2)), CAST(5.27 AS Decimal(18, 2)), CAST(8.28 AS Decimal(18, 2)), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock], [lysdqty], [LYSDDate], [LYSDFatPercent], [LYSDSNFPercent], [LYSDFatKG], [LYSDSNFKG]) VALUES (8, 15, CAST(N'2024-10-03' AS Date), 3354, CAST(154.28 AS Decimal(18, 2)), CAST(284.08 AS Decimal(18, 2)), CAST(4.60 AS Decimal(18, 2)), CAST(8.47 AS Decimal(18, 2)), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock], [lysdqty], [LYSDDate], [LYSDFatPercent], [LYSDSNFPercent], [LYSDFatKG], [LYSDSNFKG]) VALUES (9, 16, CAST(N'2024-10-03' AS Date), 1298, CAST(65.81 AS Decimal(18, 2)), CAST(106.31 AS Decimal(18, 2)), CAST(5.07 AS Decimal(18, 2)), CAST(8.19 AS Decimal(18, 2)), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock], [lysdqty], [LYSDDate], [LYSDFatPercent], [LYSDSNFPercent], [LYSDFatKG], [LYSDSNFKG]) VALUES (10, 17, CAST(N'2024-10-03' AS Date), 4607, CAST(258.45 AS Decimal(18, 2)), CAST(404.49 AS Decimal(18, 2)), CAST(5.61 AS Decimal(18, 2)), CAST(8.78 AS Decimal(18, 2)), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock], [lysdqty], [LYSDDate], [LYSDFatPercent], [LYSDSNFPercent], [LYSDFatKG], [LYSDSNFKG]) VALUES (11, 18, CAST(N'2024-10-03' AS Date), 15543, CAST(752.28 AS Decimal(18, 2)), CAST(1268.31 AS Decimal(18, 2)), CAST(4.84 AS Decimal(18, 2)), CAST(8.16 AS Decimal(18, 2)), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock], [lysdqty], [LYSDDate], [LYSDFatPercent], [LYSDSNFPercent], [LYSDFatKG], [LYSDSNFKG]) VALUES (12, 19, CAST(N'2024-10-03' AS Date), 2592, CAST(126.23 AS Decimal(18, 2)), CAST(215.14 AS Decimal(18, 2)), CAST(4.87 AS Decimal(18, 2)), CAST(8.30 AS Decimal(18, 2)), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock], [lysdqty], [LYSDDate], [LYSDFatPercent], [LYSDSNFPercent], [LYSDFatKG], [LYSDSNFKG]) VALUES (13, 20, CAST(N'2024-10-03' AS Date), 2806, CAST(151.24 AS Decimal(18, 2)), CAST(231.21 AS Decimal(18, 2)), CAST(5.39 AS Decimal(18, 2)), CAST(8.24 AS Decimal(18, 2)), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock], [lysdqty], [LYSDDate], [LYSDFatPercent], [LYSDSNFPercent], [LYSDFatKG], [LYSDSNFKG]) VALUES (14, 21, CAST(N'2024-10-03' AS Date), 1317, CAST(80.47 AS Decimal(18, 2)), CAST(111.95 AS Decimal(18, 2)), CAST(6.11 AS Decimal(18, 2)), CAST(8.50 AS Decimal(18, 2)), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock], [lysdqty], [LYSDDate], [LYSDFatPercent], [LYSDSNFPercent], [LYSDFatKG], [LYSDSNFKG]) VALUES (15, 22, CAST(N'2024-10-03' AS Date), 10594, CAST(602.80 AS Decimal(18, 2)), CAST(879.30 AS Decimal(18, 2)), CAST(5.69 AS Decimal(18, 2)), CAST(8.30 AS Decimal(18, 2)), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock], [lysdqty], [LYSDDate], [LYSDFatPercent], [LYSDSNFPercent], [LYSDFatKG], [LYSDSNFKG]) VALUES (16, 23, CAST(N'2024-10-03' AS Date), 517, CAST(25.95 AS Decimal(18, 2)), CAST(41.52 AS Decimal(18, 2)), CAST(5.02 AS Decimal(18, 2)), CAST(8.03 AS Decimal(18, 2)), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock], [lysdqty], [LYSDDate], [LYSDFatPercent], [LYSDSNFPercent], [LYSDFatKG], [LYSDSNFKG]) VALUES (17, 24, CAST(N'2024-10-03' AS Date), 0, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock], [lysdqty], [LYSDDate], [LYSDFatPercent], [LYSDSNFPercent], [LYSDFatKG], [LYSDSNFKG]) VALUES (18, 25, CAST(N'2024-10-03' AS Date), 2293, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, CAST(0.00 AS Decimal(18, 2)), NULL, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
SET IDENTITY_INSERT [dbo].[Trn_InflowDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[trn_Sale] ON 
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory]) VALUES (1, N'2', CAST(N'2024-10-03' AS Date), N'Milk')
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory]) VALUES (2, N'3', CAST(N'2024-10-03' AS Date), N'Milk')
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory]) VALUES (3, N'4', CAST(N'2024-10-03' AS Date), N'Milk')
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory]) VALUES (4, N'5', CAST(N'2024-10-03' AS Date), N'Milk')
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory]) VALUES (5, N'6', CAST(N'2024-10-03' AS Date), N'Milk')
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory]) VALUES (6, N'7', CAST(N'2024-10-03' AS Date), N'Milk')
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory]) VALUES (7, N'8', CAST(N'2024-10-03' AS Date), N'Milk')
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory]) VALUES (9, N'9', CAST(N'2024-10-03' AS Date), N'Milk')
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory]) VALUES (10, N'10', CAST(N'2024-10-03' AS Date), N'Milk')
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory]) VALUES (11, N'11', CAST(N'2024-10-03' AS Date), N'Milk')
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory]) VALUES (12, N'12', CAST(N'2024-10-03' AS Date), N'Milk')
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory]) VALUES (13, N'13', CAST(N'2024-10-03' AS Date), N'Milk')
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory]) VALUES (14, N'14', CAST(N'2024-10-03' AS Date), N'Milk')
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory]) VALUES (15, N'15', CAST(N'2024-10-03' AS Date), N'Milk')
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory]) VALUES (16, N'16', CAST(N'2024-10-03' AS Date), N'Milk')
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory]) VALUES (18, N'17', CAST(N'2024-10-03' AS Date), N'Milk')
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory]) VALUES (19, N'18', CAST(N'2024-10-03' AS Date), N'Milk')
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory]) VALUES (20, N'19', CAST(N'2024-10-03' AS Date), N'Milk')
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory]) VALUES (21, N'2', CAST(N'2024-10-03' AS Date), N'Product')
GO
SET IDENTITY_INSERT [dbo].[trn_Sale] OFF
GO
SET IDENTITY_INSERT [dbo].[trn_SaleChild] ON 
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1, 1, N'STD', 22695, 1)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (2, 1, N'DTM', 33322, 2)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (3, 1, N'LITE', 0, 3)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (4, 1, N'FCM', 105454, 4)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (5, 1, N'Diamond', 84, 5)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (6, 1, N'TM', 4647, 6)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (7, 1, N'CHAH', 56827, 7)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (8, 1, N'FCM 1L', 7459, 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (9, 1, N'Chai spl. 1000ML', 1882, 9)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (10, 2, N'STD', 10, 1)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (11, 2, N'DTM', 69, 2)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (12, 2, N'LITE', 0, 3)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (13, 2, N'FCM', 400, 4)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (14, 2, N'Diamond', 0, 5)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (15, 2, N'TM', 530, 6)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (16, 2, N'CHAH', 570, 7)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (17, 2, N'FCM 1L', 30, 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (18, 2, N'Chai spl. 1000ML', 30, 9)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (19, 3, N'STD', 85, 1)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (20, 3, N'DTM', 453, 2)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (21, 3, N'LITE', 0, 3)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (22, 3, N'FCM', 1635, 4)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (23, 3, N'Diamond', 0, 5)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (24, 3, N'TM', 688, 6)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (25, 3, N'CHAH', 667, 7)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (26, 3, N'FCM 1L', 1, 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (27, 3, N'Chai spl. 1000ML', 325, 9)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (28, 4, N'STD', 490, 1)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (29, 4, N'DTM', 288, 2)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (30, 4, N'LITE', 0, 3)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (31, 4, N'FCM', 550, 4)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (32, 4, N'Diamond', 0, 5)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (33, 4, N'TM', 1230, 6)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (34, 4, N'CHAH', 1220, 7)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (35, 4, N'FCM 1L', 0, 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (36, 4, N'Chai spl. 1000ML', 0, 9)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (37, 5, N'STD', 14, 1)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (38, 5, N'DTM', 470, 2)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (39, 5, N'LITE', 0, 3)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (40, 5, N'FCM', 550, 4)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (41, 5, N'Diamond', 0, 5)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (42, 5, N'TM', 370, 6)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (43, 5, N'CHAH', 760, 7)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (44, 5, N'FCM 1L', 80, 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (45, 5, N'Chai spl. 1000ML', 130, 9)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (46, 6, N'STD', 66, 1)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (47, 6, N'DTM', 232, 2)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (48, 6, N'LITE', 0, 3)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (49, 6, N'FCM', 229, 4)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (50, 6, N'Diamond', 0, 5)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (51, 6, N'TM', 546, 6)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (52, 6, N'CHAH', 610, 7)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (53, 6, N'FCM 1L', 15, 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (54, 6, N'Chai spl. 1000ML', 60, 9)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (55, 7, N'STD', 0, 1)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (56, 7, N'DTM', 351, 2)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (57, 7, N'LITE', 0, 3)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (58, 7, N'FCM', 630, 4)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (59, 7, N'Diamond', 0, 5)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (60, 7, N'TM', 1525, 6)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (61, 7, N'CHAH', 10, 7)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (62, 7, N'FCM 1L', 0, 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (63, 7, N'Chai spl. 1000ML', 0, 9)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (72, 9, N'STD', 54, 1)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (73, 9, N'DTM', 365, 2)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (74, 9, N'LITE', 0, 3)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (75, 9, N'FCM', 210, 4)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (76, 9, N'Diamond', 5, 5)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (77, 9, N'TM', 260, 6)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (78, 9, N'CHAH', 380, 7)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (79, 9, N'FCM 1L', 5, 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (80, 10, N'STD', 0, 1)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (81, 10, N'DTM', 342, 2)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (82, 10, N'LITE', 0, 3)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (83, 10, N'FCM', 460, 4)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (84, 10, N'Diamond', 0, 5)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (85, 10, N'TM', 780, 6)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (86, 10, N'CHAH', 1100, 7)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (87, 10, N'FCM 1L', 0, 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (88, 10, N'Chai spl. 1000ML', 230, 9)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (89, 11, N'STD', 10, 1)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (90, 11, N'DTM', 361, 2)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (91, 11, N'LITE', 0, 3)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (92, 11, N'FCM', 190, 4)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (93, 11, N'Diamond', 12, 5)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (94, 11, N'TM', 998, 6)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (95, 11, N'CHAH', 1810, 7)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (96, 11, N'FCM 1L', 20, 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (97, 11, N'Chai spl. 1000ML', 60, 9)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (98, 12, N'STD', 240, 1)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (99, 12, N'DTM', 443, 2)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (100, 12, N'LITE', 0, 3)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (101, 12, N'FCM', 1110, 4)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (102, 12, N'Diamond', 30, 5)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (103, 12, N'TM', 840, 6)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (104, 12, N'CHAH', 2020, 7)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (105, 12, N'FCM 1L', 150, 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (106, 12, N'Chai spl. 1000ML', 90, 9)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (107, 13, N'STD', 0, 1)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (108, 13, N'DTM', 54, 2)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (109, 13, N'LITE', 0, 3)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (110, 13, N'FCM', 170, 4)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (111, 13, N'Diamond', 0, 5)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (112, 13, N'TM', 405, 6)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (113, 13, N'CHAH', 725, 7)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (114, 13, N'FCM 1L', 100, 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (115, 13, N'Chai spl. 1000ML', 110, 9)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (117, 14, N'STD', 25, 1)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (118, 14, N'DTM', 925, 2)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (119, 14, N'LITE', 0, 3)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (120, 14, N'FCM', 575, 4)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (121, 14, N'Diamond', 0, 5)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (122, 14, N'TM', 360, 6)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (123, 14, N'CHAH', 3805, 7)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (124, 14, N'FCM 1L', 555, 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (125, 14, N'Chai spl. 1000ML', 90, 9)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (126, 15, N'STD', 0, 1)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (127, 15, N'DTM', 337, 2)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (128, 15, N'LITE', 0, 3)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (129, 15, N'FCM', 158, 4)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (130, 15, N'Diamond', 0, 5)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (131, 15, N'TM', 1120, 6)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (132, 15, N'CHAH', 880, 7)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (133, 15, N'FCM 1L', 0, 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (134, 15, N'Chai spl. 1000ML', 115, 9)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (135, 16, N'STD', 0, 1)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (136, 16, N'DTM', 559, 2)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (137, 16, N'LITE', 0, 3)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (138, 16, N'FCM', 815, 4)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (139, 16, N'Diamond', 0, 5)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (140, 16, N'TM', 1260, 6)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (141, 16, N'CHAH', 590, 7)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (142, 16, N'FCM 1L', 540, 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (143, 16, N'Chai spl. 1000ML', 10, 9)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (153, 18, N'STD', 23, 1)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (154, 18, N'DTM', 482, 2)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (155, 18, N'LITE', 0, 3)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (156, 18, N'FCM', 445, 4)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (157, 18, N'Diamond', 0, 5)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (158, 18, N'TM', 1170, 6)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (159, 18, N'CHAH', 1480, 7)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (160, 18, N'FCM 1L', 90, 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (161, 18, N'Chai spl. 1000ML', 240, 9)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (162, 19, N'STD', 0, 1)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (163, 19, N'DTM', 827, 2)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (164, 19, N'LITE', 0, 3)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (165, 19, N'FCM', 305, 4)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (166, 19, N'Diamond', 13, 5)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (167, 19, N'TM', 1283, 6)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (168, 19, N'CHAH', 4310, 7)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (169, 19, N'FCM 1L', 220, 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (170, 19, N'Chai spl. 1000ML', 180, 9)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (171, 20, N'STD', 420, 1)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (172, 20, N'DTM', 837, 2)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (173, 20, N'LITE', 0, 3)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (174, 20, N'FCM', 1750, 4)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (175, 20, N'Diamond', 0, 5)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (176, 20, N'TM', 1370, 6)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (177, 20, N'CHAH', 7130, 7)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (178, 20, N'FCM 1L', 0, 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (179, 20, N'Chai spl. 1000ML', 0, 9)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (180, 21, N'SMP', 0, 10)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (181, 21, N'Sweeten SMP', 0, 11)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (182, 21, N'WB', 22000, 12)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (183, 21, N'Plain curd', 1856, 13)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (184, 21, N'Sweet Curd', 555, 14)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (185, 21, N'Salted Butter Milk 200 ML', 899, 15)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (186, 21, N'Plain Butter Milk', 6219, 16)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (187, 21, N'Cold Coffee', 0, 17)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (188, 21, N'Fl.Milk Pet Bottle', 0, 18)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (189, 21, N'S.F.M Glass(Bottles)', 40, 19)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (190, 21, N'Lassi 200 ML Glass', 169, 20)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (191, 21, N'Lite Lassi 200 ML', 0, 21)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (192, 21, N'Shrikhand', 261, 22)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (193, 21, N'Chena Rabdi', 139, 23)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (194, 21, N'Sabudana Kheer 100 gm', 0, 24)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (195, 21, N'Peda', 191, 25)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (196, 21, N'Milk Cake', 24, 26)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (197, 21, N'Mawa', 31, 27)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (198, 21, N'Paneer', 105, 28)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (199, 21, N'Vaccum Paneer', 0, 29)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (200, 21, N'Rasogulla', 0, 30)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (201, 21, N'Gulabjamun', 0, 31)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (202, 21, N'Shrikhand Lite 100 gms cups', 0, 32)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (203, 21, N'Table Butter', 8, 33)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (204, 21, N'Cookies', 0, 34)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (205, 21, N'Sugar Free Peda', 0, 35)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (206, 21, N'Butter Chiplet', 6, 36)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (207, 21, N'Besan Laddu', 0, 37)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (208, 21, N'Sanchi Neer lit', 0, 38)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (209, 21, N'Misti Doi 100gm', 0, 39)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (210, 21, N'Braj Peda', 0, 40)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (211, 21, N'Amrakhand 100 gms', 13, 41)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (215, 9, N'Chai spl. 1000ML', 210, 9)
GO
SET IDENTITY_INSERT [dbo].[trn_SaleChild] OFF
GO
/****** Object:  StoredProcedure [dbo].[GetItemsByCategory]    Script Date: 18-Oct-24 3:59:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  CREATE proc  [dbo].[GetItemsByCategory]
  @ItemCategory varchar(50) =null
  as
  begin
  declare @status bit=0 ,@msg varchar(100)=null
  BEGIN TRY
        SELECT [ItemName] ,[ItemID] FROM [mst_Item] 
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
/****** Object:  StoredProcedure [dbo].[sp_GetItemDetails]    Script Date: 18-Oct-24 3:59:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  proc  [dbo].[sp_GetItemDetails]
   
  @ItemCategory nvarchar(50)		
  as
  begin
	declare @status bit=0 ,@msg varchar(100)=null  
	BEGIN TRY
		BEGIN TRANSACTION   
		 SELECT unit.UnitName NameOfUnit, TS.ItemCategory, i.ItemName, TC.Quantity
			FROM trn_Sale TS
			JOIN trn_SaleChild TC ON TS.SalesID = TC.SalesID
			join mst_Unit unit on unit.UnitID=TS.NameOfUnit
			join mst_Item i on i.ItemID=TC.ItemID
			WHERE TS.ItemCategory = @ItemCategory;
	
			SELECT	@status =1 ,@msg='OutFlow Flow Details Saved Successfully'	 	
		COMMIT TRANSACTION;
	END TRY
	BEGIN CATCH   
		ROLLBACK TRANSACTION;
		SELECT	@status =0 ,@msg=ERROR_MESSAGE()	 
	END CATCH;
	SELECT @status AS [status], @msg AS [msg];
  end


GO
/****** Object:  StoredProcedure [dbo].[usp_AddDemand]    Script Date: 18-Oct-24 3:59:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

  CREATE  proc  [dbo].[usp_AddDemand]
	@Date date
	,@ItemCategory varchar(50)
	,@Shift varchar(10)
	,@Retailer varchar(50)
	,@VehicleNo varchar(20)
	,@DemandType varchar(20)
	,@DemandItems [DemandedItemsList]   readonly
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
					   ,ItemID
					   ,[ItemName]
					   ,[Quantity]
					   ,[AdvancedCard])
     
				 select @DemandId,ItemID, ItemName,Quantity,AdvancedCard from @DemandItems


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
/****** Object:  StoredProcedure [dbo].[usp_AddManufItem]    Script Date: 18-Oct-24 3:59:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_AddManufItem]
    @Date DATE,
    @ManufItems [DemandedItemsList] READONLY
AS
BEGIN
    DECLARE @status BIT = 0, @msg VARCHAR(100) = NULL, @DemandId INT = NULL
    BEGIN TRY
        BEGIN TRANSACTION
			INSERT INTO PlantManufacturingData ([Date],ItemID, ItemName, Quantity)
			SELECT @Date,ItemID, ItemName, Quantity  FROM @ManufItems;

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
/****** Object:  StoredProcedure [dbo].[usp_AddSales]    Script Date: 18-Oct-24 3:59:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc  [dbo].[usp_AddSales]
		@Date date
		,@NameOfUnit		VARCHAR(100)		
		,@ItemCategory varchar(50)
		,@Items [DemandedItemsList]   readonly
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
					   ,  ItemID,
					   [ItemName]
					   ,[Quantity]
					   )     
				 select @SalesID,ItemID, ItemName,Quantity from @Items


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
/****** Object:  StoredProcedure [dbo].[Usp_AproveInflow]    Script Date: 18-Oct-24 3:59:33 PM ******/
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
				
				,@lysdqty			decimal(18,2)
				,@LYSDFatPercent decimal(18,2) null
				,@LYSDSNFPercent decimal(18,2) null
				,@LYSDFatKG		decimal(18,2) null
				,@LYSDSNFKG		decimal(18,2) null
				
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
			,lysdqty				   =@lysdqty
			,LYSDFatPercent			   =@LYSDFatPercent	
			,LYSDSNFPercent			   =@LYSDSNFPercent	
			,LYSDFatKG				   =@LYSDFatKG		
			,LYSDSNFKG				   =@LYSDSNFKG		
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
/****** Object:  StoredProcedure [dbo].[Usp_GetInflowToAprove]    Script Date: 18-Oct-24 3:59:33 PM ******/
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
				,lysdqty
				,LYSDFatPercent	
				,LYSDSNFPercent	
				,LYSDFatKG		
				,LYSDSNFKG		
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
/****** Object:  StoredProcedure [dbo].[Usp_GetinflowUnit]    Script Date: 18-Oct-24 3:59:33 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Usp_GetUnit]    Script Date: 18-Oct-24 3:59:33 PM ******/
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
/****** Object:  StoredProcedure [dbo].[uspTransReport]    Script Date: 18-Oct-24 3:59:33 PM ******/
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
					(
					select DC.ItemName , dc.Demand ,DC.ItemID, sum(sc.Quantity) as Sales 
					from
						(
							SELECT 
								item.ItemName,item.ItemID,
								SUM(dc.Quantity) AS Demand    
							FROM 
								trn_DemandsChild dc
							full join mst_Item item on (item.ItemID=dc.ItemID)
							GROUP BY item.ItemName,item.ItemID					
						) as DC
					full join trn_SaleChild sc on dc.ItemID = sc.ItemID
					group by DC.ItemName , dc.Demand ,DC.ItemID
					) as SC
				full join PlantManufacturingData m on m.ItemID = sc.ItemID
			
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
/****** Object:  StoredProcedure [dbo].[uspVerifierDetails]    Script Date: 18-Oct-24 3:59:33 PM ******/
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
			,tf.lysdqty
			,tf.LYSDFatPercent		
			,tf.LYSDSNFPercent		
			,tf.LYSDFatKG			
			,tf.LYSDSNFKG			
		,IsVerifed

    FROM Trn_InflowDetails tf
    INNER JOIN [mst_InflowUnits] mu
    ON tf.UnitID = mu.id
		where IsApproved =0 and( IsVerifed= @IsVerifed or @IsVerifed is NULL)
	order by IsVerifed
END
GO
/****** Object:  StoredProcedure [dbo].[uspVerifierUpdate]    Script Date: 18-Oct-24 3:59:33 PM ******/
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

	,@lysdqty			decimal(18,2)
	,@LYSDFatPercent decimal(18,2) null
	,@LYSDSNFPercent decimal(18,2) null
	,@LYSDFatKG		decimal(18,2) null
	,@LYSDSNFKG		decimal(18,2) null
AS
BEGIN
    DECLARE @Status bit, @msg varchar(100) = ''

    IF EXISTS (SELECT 1 FROM Trn_InflowDetails WHERE InflowId = @InflowId)
    BEGIN
        UPDATE Trn_InflowDetails
        SET 
             Milkqty				 =@Milkqty
            ,Milkfat				 =@Milkfat
            ,MilkSNF				 =@MilkSNF
            ,Milkfatperc			 =@Milkfatperc
            ,MilkSNFperc			 =@MilkSNFperc
            ,Butterqty				 =@Butterqty
            ,Butterstock			 =@Butterstock
            ,MilkPowderqty			 =@MilkPowderqty
            ,MilkPowderstock		 =@MilkPowderstock
			,WholeMilkPowderqty		 =@WholeMilkPowderqty		
			,WholeMilkPowderstock	 =@WholeMilkPowderstock	
			,Gheeqty				 =@Gheeqty				
			,Gheestock				 =@Gheestock
			,lysdqty				 =@lysdqty			
			,LYSDFatPercent			 =@LYSDFatPercent
			,LYSDSNFPercent			 =@LYSDSNFPercent
			,LYSDFatKG				 =@LYSDFatKG		
			,LYSDSNFKG				 =@LYSDSNFKG
			,IsVerifed				 = 1
        WHERE InflowId				 = @InflowId

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
-----------------------
USE [master]
GO
ALTER DATABASE [DbSanchi] SET  READ_WRITE 
GO

-----------------------------------------------
USE [DbSanchi]
GO

  CREATE TYPE [dbo].[typ_SoldItems] AS TABLE(
	[ItemID] [int] NULL,
	[ItemName] [varchar](50) NULL,
	[TargetData] [decimal](18, 2) NULL,
	[SaleCumulative] [decimal](18, 2) NULL,
	[SaleAbsolute] [decimal](18, 2) NULL,
	[AvgGrowthPer] [decimal](18, 2) NULL
)
GO


alter table [Trn_InflowDetails]
add TargetDate		date null
	,TargetMilk		decimal(18,2) null
	,MilkCumulative		decimal(18,2) null


------------------------------
go
--------------------------------
ALTER proc  [dbo].[usp_AddInFlow]
   @Date				date
	,@UnitID     		int
	,@Milkqty			int
	,@lysdqty			decimal(18,2)
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
	,@LYSDDate		 date null
	,@LYSDFatPercent decimal(18,2) null
	,@LYSDSNFPercent decimal(18,2) null
	,@LYSDFatKG		decimal(18,2) null
	,@LYSDSNFKG		decimal(18,2) null

	,@TargetDate		date null
	,@TargetMilk		decimal(18,2) null
	,@MilkCumulative		decimal(18,2) null
		
  as
  begin
	declare @status bit=0 ,@msg varchar(100)=null  ,@DemandId int=null
	BEGIN TRY
		BEGIN TRANSACTION
			INSERT INTO [dbo].[Trn_InflowDetails]
				([Date]
				,[UnitID]
				,[Milkqty]
				,[lysdqty]
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
				,[IsApproved]
				,LYSDDate
				,LYSDFatPercent
				,LYSDSNFPercent
				,LYSDFatKG		
				,LYSDSNFKG
				,TargetDate
				,TargetMilk
				,MilkCumulative
				)
			VALUES
				( @Date		
				,@UnitID
				,@Milkqty
				,@lysdqty
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
				,0
				,@LYSDDate		
				,@LYSDFatPercent
				,@LYSDSNFPercent
				,@LYSDFatKG		
				,@LYSDSNFKG
				,@TargetDate
				,@TargetMilk
				,@MilkCumulative)
	
			SELECT	@status =1 ,@msg='In Flow Details Added Successfully'	 	
		COMMIT TRANSACTION;
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION;
		SELECT	@status =0 ,@msg=ERROR_MESSAGE()	
	END CATCH;
	SELECT @status AS [status], @msg AS [msg];
  end


CREATE TABLE [dbo].[TrnTarget](
	[TargetId] [int] IDENTITY(1,1) NOT NULL,
	[Targetmonth] [date] NULL,
	[ItemCategory] [varchar](50) NULL
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[trnTargetChild](
	[TargetChildID] [int] IDENTITY(1,1) NOT NULL,
	[TargetId] [int] NULL,
	[ItemID] [int] NULL,
	[ItemName] [varchar](50) NULL,
	[TargetData] [decimal](18, 2) NULL,
	[Cumulative] [decimal](18, 2) NULL,
	[TargetAbsolute] [decimal](18, 2) NULL,
	[AvggrowthPerc] [decimal](18, 2) NULL
) ON [PRIMARY]
GO

CREATE  proc  [dbo].[usp_AddTarget]
	@Targetmonth date
	,@ItemCategory varchar(50)
	,@TargetItems [typ_SoldItems]   readonly
  as
  begin
	  declare @status bit=0 ,@msg varchar(100)=null  ,@TargetId int=null
	  BEGIN TRY
		  BEGIN transaction
			INSERT INTO TrnTarget
					   (Targetmonth
					   ,ItemCategory)
					 
				 VALUES
					   (@Targetmonth
					   ,@ItemCategory
					   )
			select @TargetId =SCOPE_IDENTITY();
			INSERT INTO trnTargetChild
					   (TargetId
					   ,ItemID
					   ,ItemName,TargetData
					   ,Cumulative
					   ,TargetAbsolute,AvggrowthPerc)
				 select @TargetId,ItemID, ItemName,TargetData,[SaleCumulative],[SaleAbsolute],[AvgGrowthPer] from @TargetItems
			SELECT	@status =1 ,@msg='Target added Successfully'	
	
			COMMIT TRANSACTION;
		END TRY
		BEGIN CATCH
			ROLLBACK TRANSACTION;
			SELECT	@status =0 ,@msg=ERROR_MESSAGE()	
		
		END CATCH;
		 SELECT @status AS [status], @msg AS [msg];
  end
GO
