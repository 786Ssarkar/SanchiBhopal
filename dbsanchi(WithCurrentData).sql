USE [master]
GO
/****** Object:  Database [DbSanchi]    Script Date: 13-Nov-24 12:20:44 PM ******/
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
/****** Object:  User [TESTING-SERVER\dbsync]    Script Date: 13-Nov-24 12:20:44 PM ******/
CREATE USER [TESTING-SERVER\dbsync] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  UserDefinedTableType [dbo].[DemandedItemsList]    Script Date: 13-Nov-24 12:20:44 PM ******/
CREATE TYPE [dbo].[DemandedItemsList] AS TABLE(
	[ItemID] [int] NULL,
	[ItemName] [varchar](50) NULL,
	[Quantity] [int] NULL,
	[AdvancedCard] [int] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[typ_SoldItems]    Script Date: 13-Nov-24 12:20:44 PM ******/
CREATE TYPE [dbo].[typ_SoldItems] AS TABLE(
	[ItemID] [int] NULL,
	[ItemName] [varchar](50) NULL,
	[TargetData] [decimal](18, 2) NULL,
	[SaleCumulative] [decimal](18, 2) NULL,
	[SaleAbsolute] [decimal](18, 2) NULL,
	[AvgGrowthPer] [decimal](18, 2) NULL
)
GO
/****** Object:  Table [dbo].[mst_InflowUnits]    Script Date: 13-Nov-24 12:20:44 PM ******/
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
/****** Object:  Table [dbo].[mst_Item]    Script Date: 13-Nov-24 12:20:45 PM ******/
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
/****** Object:  Table [dbo].[mst_Unit]    Script Date: 13-Nov-24 12:20:45 PM ******/
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
/****** Object:  Table [dbo].[PlantManufacturingData]    Script Date: 13-Nov-24 12:20:45 PM ******/
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
/****** Object:  Table [dbo].[trn_Demand]    Script Date: 13-Nov-24 12:20:45 PM ******/
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
/****** Object:  Table [dbo].[trn_DemandsChild]    Script Date: 13-Nov-24 12:20:45 PM ******/
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
/****** Object:  Table [dbo].[Trn_InflowDetails]    Script Date: 13-Nov-24 12:20:45 PM ******/
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
	[TargetDate] [date] NULL,
	[TargetMilk] [decimal](18, 2) NULL,
	[MilkCumulative] [decimal](18, 2) NULL,
	[WBOBal] [decimal](18, 2) NULL,
	[WBManuf] [decimal](18, 2) NULL,
	[SMPBal] [decimal](18, 2) NULL,
	[SMPManuf] [decimal](18, 2) NULL,
	[WMPBal] [decimal](18, 2) NULL,
	[WMPManuf] [decimal](18, 2) NULL,
	[GheeBal] [decimal](18, 2) NULL,
	[GheeManuf] [decimal](18, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[InflowId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[trn_Sale]    Script Date: 13-Nov-24 12:20:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[trn_Sale](
	[SalesID] [int] IDENTITY(1,1) NOT NULL,
	[NameOfUnit] [varchar](100) NOT NULL,
	[Date] [date] NOT NULL,
	[ItemCategory] [varchar](50) NOT NULL,
	[LYSDQty] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[SalesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[trn_SaleChild]    Script Date: 13-Nov-24 12:20:45 PM ******/
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
/****** Object:  Table [dbo].[TrnTarget]    Script Date: 13-Nov-24 12:20:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TrnTarget](
	[TargetId] [int] IDENTITY(1,1) NOT NULL,
	[Targetmonth] [date] NULL,
	[ItemCategory] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[trnTargetChild]    Script Date: 13-Nov-24 12:20:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
/****** Object:  Table [dbo].[TrnTargetTotals]    Script Date: 13-Nov-24 12:20:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TrnTargetTotals](
	[TargetId] [int] IDENTITY(1,1) NOT NULL,
	[TotalTarget] [decimal](18, 2) NULL,
	[TotalCumulative] [decimal](18, 2) NULL,
	[TotalAbsolute] [decimal](18, 2) NULL,
	[TotalAvgGrowth] [decimal](18, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[TargetId] ASC
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
INSERT [dbo].[mst_InflowUnits] ([Id], [Unit name]) VALUES (26, N'JABALPUR W.M.')
GO
INSERT [dbo].[mst_InflowUnits] ([Id], [Unit name]) VALUES (27, N'UJJAIN W.M.')
GO
INSERT [dbo].[mst_InflowUnits] ([Id], [Unit name]) VALUES (28, N'INDORE W.M.')
GO
INSERT [dbo].[mst_InflowUnits] ([Id], [Unit name]) VALUES (29, N'SAGAR W.M.')
GO
INSERT [dbo].[mst_InflowUnits] ([Id], [Unit name]) VALUES (30, N'Sengamner')
GO
INSERT [dbo].[mst_InflowUnits] ([Id], [Unit name]) VALUES (31, N'Rehire')
GO
INSERT [dbo].[mst_InflowUnits] ([Id], [Unit name]) VALUES (32, N'Chaitanya Multi')
GO
INSERT [dbo].[mst_InflowUnits] ([Id], [Unit name]) VALUES (33, N'Jalgaon Jilla')
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
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (1, CAST(N'2024-10-07' AS Date), N'STD', 0, 1)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (2, CAST(N'2024-10-07' AS Date), N'DTM', 0, 2)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (3, CAST(N'2024-10-07' AS Date), N'LITE', 0, 3)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (4, CAST(N'2024-10-07' AS Date), N'FCM', 0, 4)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (5, CAST(N'2024-10-07' AS Date), N'Diamond', 0, 5)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (6, CAST(N'2024-10-07' AS Date), N'TM', 0, 6)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (7, CAST(N'2024-10-07' AS Date), N'CHAH', 0, 7)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (8, CAST(N'2024-10-07' AS Date), N'FCM 1L', 0, 8)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (9, CAST(N'2024-10-07' AS Date), N'Chai spl. 1000ML', 0, 9)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (10, CAST(N'2024-10-07' AS Date), N'SMP', 0, 10)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (11, CAST(N'2024-10-07' AS Date), N'Sweeten SMP', 0, 11)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (12, CAST(N'2024-10-07' AS Date), N'WB', 1708, 12)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (13, CAST(N'2024-10-07' AS Date), N'Plain curd', 3084, 13)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (14, CAST(N'2024-10-07' AS Date), N'Sweet Curd', 1273, 14)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (15, CAST(N'2024-10-07' AS Date), N'Salted Butter Milk 200 ML', 842, 15)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (16, CAST(N'2024-10-07' AS Date), N'Plain Butter Milk', 10340, 16)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (17, CAST(N'2024-10-07' AS Date), N'Cold Coffee', 0, 17)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (18, CAST(N'2024-10-07' AS Date), N'Fl.Milk Pet Bottle', 0, 18)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (19, CAST(N'2024-10-07' AS Date), N'S.F.M Glass(Bottles)', 0, 19)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (20, CAST(N'2024-10-07' AS Date), N'Lassi 200 ML Glass', 298, 20)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (21, CAST(N'2024-10-07' AS Date), N'Lite Lassi 200 ML', 0, 21)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (22, CAST(N'2024-10-07' AS Date), N'Shrikhand', 570, 22)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (23, CAST(N'2024-10-07' AS Date), N'Chena Rabdi', 210, 23)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (24, CAST(N'2024-10-07' AS Date), N'Sabudana Kheer 100 gm', 1, 24)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (25, CAST(N'2024-10-07' AS Date), N'Peda', 361, 25)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (26, CAST(N'2024-10-07' AS Date), N'Milk Cake', 50, 26)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (27, CAST(N'2024-10-07' AS Date), N'Mawa', 27, 27)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (28, CAST(N'2024-10-07' AS Date), N'Paneer', 132, 28)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (29, CAST(N'2024-10-07' AS Date), N'Vaccum Paneer', 0, 29)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (30, CAST(N'2024-10-07' AS Date), N'Rasogulla', 0, 30)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (31, CAST(N'2024-10-07' AS Date), N'Gulabjamun', 0, 31)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (32, CAST(N'2024-10-07' AS Date), N'Shrikhand Lite 100 gms cups', 0, 32)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (33, CAST(N'2024-10-07' AS Date), N'Table Butter', 0, 33)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (34, CAST(N'2024-10-07' AS Date), N'Cookies', 0, 34)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (35, CAST(N'2024-10-07' AS Date), N'Sugar Free Peda', 3, 35)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (36, CAST(N'2024-10-07' AS Date), N'Butter Chiplet', 0, 36)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (37, CAST(N'2024-10-07' AS Date), N'Besan Laddu', 0, 37)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (38, CAST(N'2024-10-07' AS Date), N'Sanchi Neer lit', 0, 38)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (39, CAST(N'2024-10-07' AS Date), N'Misti Doi 100gm', 0, 39)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (40, CAST(N'2024-10-07' AS Date), N'Braj Peda', 2, 40)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (41, CAST(N'2024-10-07' AS Date), N'Amrakhand 100 gms', 4, 41)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (124, CAST(N'2024-10-05' AS Date), N'STD', 0, 1)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (125, CAST(N'2024-10-05' AS Date), N'DTM', 0, 2)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (126, CAST(N'2024-10-05' AS Date), N'LITE', 0, 3)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (127, CAST(N'2024-10-05' AS Date), N'FCM', 0, 4)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (128, CAST(N'2024-10-05' AS Date), N'Diamond', 0, 5)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (129, CAST(N'2024-10-05' AS Date), N'TM', 0, 6)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (130, CAST(N'2024-10-05' AS Date), N'CHAH', 0, 7)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (131, CAST(N'2024-10-05' AS Date), N'FCM 1L', 0, 8)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (132, CAST(N'2024-10-05' AS Date), N'Chai spl. 1000ML', 0, 9)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (133, CAST(N'2024-10-05' AS Date), N'SMP', 0, 10)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (134, CAST(N'2024-10-05' AS Date), N'Sweeten SMP', 0, 11)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (135, CAST(N'2024-10-05' AS Date), N'WB', 1363, 12)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (136, CAST(N'2024-10-05' AS Date), N'Plain curd', 3100, 13)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (137, CAST(N'2024-10-05' AS Date), N'Sweet Curd', 840, 14)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (138, CAST(N'2024-10-05' AS Date), N'Salted Butter Milk 200 ML', 1482, 15)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (139, CAST(N'2024-10-05' AS Date), N'Plain Butter Milk', 11355, 16)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (140, CAST(N'2024-10-05' AS Date), N'Cold Coffee', 0, 17)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (141, CAST(N'2024-10-05' AS Date), N'Fl.Milk Pet Bottle', 0, 18)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (142, CAST(N'2024-10-05' AS Date), N'S.F.M Glass(Bottles)', 0, 19)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (143, CAST(N'2024-10-05' AS Date), N'Lassi 200 ML Glass', 548, 20)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (144, CAST(N'2024-10-05' AS Date), N'Lite Lassi 200 ML', 0, 21)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (145, CAST(N'2024-10-05' AS Date), N'Shrikhand', 376, 22)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (146, CAST(N'2024-10-05' AS Date), N'Chena Rabdi', 169, 23)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (147, CAST(N'2024-10-05' AS Date), N'Sabudana Kheer 100 gm', 0, 24)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (148, CAST(N'2024-10-05' AS Date), N'Peda', 142, 25)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (149, CAST(N'2024-10-05' AS Date), N'Milk Cake', 46, 26)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (150, CAST(N'2024-10-05' AS Date), N'Mawa', 28, 27)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (151, CAST(N'2024-10-05' AS Date), N'Paneer', 159, 28)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (152, CAST(N'2024-10-05' AS Date), N'Vaccum Paneer', 0, 29)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (153, CAST(N'2024-10-05' AS Date), N'Rasogulla', 0, 30)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (154, CAST(N'2024-10-05' AS Date), N'Gulabjamun', 0, 31)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (155, CAST(N'2024-10-05' AS Date), N'Shrikhand Lite 100 gms cups', 0, 32)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (156, CAST(N'2024-10-05' AS Date), N'Table Butter', 0, 33)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (157, CAST(N'2024-10-05' AS Date), N'Cookies', 0, 34)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (158, CAST(N'2024-10-05' AS Date), N'Sugar Free Peda', 5, 35)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (159, CAST(N'2024-10-05' AS Date), N'Butter Chiplet', 0, 36)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (160, CAST(N'2024-10-05' AS Date), N'Besan Laddu', 0, 37)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (161, CAST(N'2024-10-05' AS Date), N'Sanchi Neer lit', 0, 38)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (162, CAST(N'2024-10-05' AS Date), N'Misti Doi 100gm', 0, 39)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (163, CAST(N'2024-10-05' AS Date), N'Braj Peda', 3, 40)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (164, CAST(N'2024-10-05' AS Date), N'Amrakhand 100 gms', 4, 41)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (165, CAST(N'2024-10-06' AS Date), N'STD', 0, 1)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (166, CAST(N'2024-10-06' AS Date), N'DTM', 0, 2)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (167, CAST(N'2024-10-06' AS Date), N'LITE', 0, 3)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (168, CAST(N'2024-10-06' AS Date), N'FCM', 0, 4)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (169, CAST(N'2024-10-06' AS Date), N'Diamond', 0, 5)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (170, CAST(N'2024-10-06' AS Date), N'TM', 0, 6)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (171, CAST(N'2024-10-06' AS Date), N'CHAH', 0, 7)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (172, CAST(N'2024-10-06' AS Date), N'FCM 1L', 0, 8)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (173, CAST(N'2024-10-06' AS Date), N'Chai spl. 1000ML', 0, 9)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (174, CAST(N'2024-10-06' AS Date), N'SMP', 0, 10)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (175, CAST(N'2024-10-06' AS Date), N'Sweeten SMP', 0, 11)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (176, CAST(N'2024-10-06' AS Date), N'WB', 2061, 12)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (177, CAST(N'2024-10-06' AS Date), N'Plain curd', 2752, 13)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (178, CAST(N'2024-10-06' AS Date), N'Sweet Curd', 735, 14)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (179, CAST(N'2024-10-06' AS Date), N'Salted Butter Milk 200 ML', 2148, 15)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (180, CAST(N'2024-10-06' AS Date), N'Plain Butter Milk', 11981, 16)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (181, CAST(N'2024-10-06' AS Date), N'Cold Coffee', 0, 17)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (182, CAST(N'2024-10-06' AS Date), N'Fl.Milk Pet Bottle', 0, 18)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (183, CAST(N'2024-10-06' AS Date), N'S.F.M Glass(Bottles)', 0, 19)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (184, CAST(N'2024-10-06' AS Date), N'Lassi 200 ML Glass', 226, 20)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (185, CAST(N'2024-10-06' AS Date), N'Lite Lassi 200 ML', 0, 21)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (186, CAST(N'2024-10-06' AS Date), N'Shrikhand', 574, 22)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (187, CAST(N'2024-10-06' AS Date), N'Chena Rabdi', 295, 23)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (188, CAST(N'2024-10-06' AS Date), N'Sabudana Kheer 100 gm', 2, 24)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (189, CAST(N'2024-10-06' AS Date), N'Peda', 286, 25)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (190, CAST(N'2024-10-06' AS Date), N'Milk Cake', 60, 26)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (191, CAST(N'2024-10-06' AS Date), N'Mawa', 7, 27)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (192, CAST(N'2024-10-06' AS Date), N'Paneer', 156, 28)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (193, CAST(N'2024-10-06' AS Date), N'Vaccum Paneer', 0, 29)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (194, CAST(N'2024-10-06' AS Date), N'Rasogulla', 0, 30)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (195, CAST(N'2024-10-06' AS Date), N'Gulabjamun', 0, 31)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (196, CAST(N'2024-10-06' AS Date), N'Shrikhand Lite 100 gms cups', 0, 32)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (197, CAST(N'2024-10-06' AS Date), N'Table Butter', 0, 33)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (198, CAST(N'2024-10-06' AS Date), N'Cookies', 0, 34)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (199, CAST(N'2024-10-06' AS Date), N'Sugar Free Peda', 2, 35)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (200, CAST(N'2024-10-06' AS Date), N'Butter Chiplet', 0, 36)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (201, CAST(N'2024-10-06' AS Date), N'Besan Laddu', 0, 37)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (202, CAST(N'2024-10-06' AS Date), N'Sanchi Neer lit', 0, 38)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (203, CAST(N'2024-10-06' AS Date), N'Misti Doi 100gm', 0, 39)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (204, CAST(N'2024-10-06' AS Date), N'Braj Peda', 0, 40)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (205, CAST(N'2024-10-06' AS Date), N'Amrakhand 100 gms', 5, 41)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (206, CAST(N'2024-10-04' AS Date), N'STD', 0, 1)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (207, CAST(N'2024-10-04' AS Date), N'DTM', 0, 2)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (208, CAST(N'2024-10-04' AS Date), N'LITE', 0, 3)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (209, CAST(N'2024-10-04' AS Date), N'FCM', 0, 4)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (210, CAST(N'2024-10-04' AS Date), N'Diamond', 0, 5)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (211, CAST(N'2024-10-04' AS Date), N'TM', 0, 6)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (212, CAST(N'2024-10-04' AS Date), N'CHAH', 0, 7)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (213, CAST(N'2024-10-04' AS Date), N'FCM 1L', 0, 8)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (214, CAST(N'2024-10-04' AS Date), N'Chai spl. 1000ML', 0, 9)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (215, CAST(N'2024-10-04' AS Date), N'SMP', 0, 10)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (216, CAST(N'2024-10-04' AS Date), N'Sweeten SMP', 0, 11)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (217, CAST(N'2024-10-04' AS Date), N'WB', 370, 12)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (218, CAST(N'2024-10-04' AS Date), N'Plain curd', 2949, 13)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (219, CAST(N'2024-10-04' AS Date), N'Sweet Curd', 1169, 14)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (220, CAST(N'2024-10-04' AS Date), N'Salted Butter Milk 200 ML', 1408, 15)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (221, CAST(N'2024-10-04' AS Date), N'Plain Butter Milk', 13191, 16)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (222, CAST(N'2024-10-04' AS Date), N'Cold Coffee', 0, 17)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (223, CAST(N'2024-10-04' AS Date), N'Fl.Milk Pet Bottle', 0, 18)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (224, CAST(N'2024-10-04' AS Date), N'S.F.M Glass(Bottles)', 0, 19)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (225, CAST(N'2024-10-04' AS Date), N'Lassi 200 ML Glass', 390, 20)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (226, CAST(N'2024-10-04' AS Date), N'Lite Lassi 200 ML', 0, 21)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (227, CAST(N'2024-10-04' AS Date), N'Shrikhand', 325, 22)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (228, CAST(N'2024-10-04' AS Date), N'Chena Rabdi', 275, 23)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (229, CAST(N'2024-10-04' AS Date), N'Sabudana Kheer 100 gm', 0, 24)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (230, CAST(N'2024-10-04' AS Date), N'Peda', 508, 25)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (231, CAST(N'2024-10-04' AS Date), N'Milk Cake', 59, 26)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (232, CAST(N'2024-10-04' AS Date), N'Mawa', 9, 27)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (233, CAST(N'2024-10-04' AS Date), N'Paneer', 145, 28)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (234, CAST(N'2024-10-04' AS Date), N'Vaccum Paneer', 0, 29)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (235, CAST(N'2024-10-04' AS Date), N'Rasogulla', 0, 30)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (236, CAST(N'2024-10-04' AS Date), N'Gulabjamun', 0, 31)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (237, CAST(N'2024-10-04' AS Date), N'Shrikhand Lite 100 gms cups', 0, 32)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (238, CAST(N'2024-10-04' AS Date), N'Table Butter', 0, 33)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (239, CAST(N'2024-10-04' AS Date), N'Cookies', 0, 34)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (240, CAST(N'2024-10-04' AS Date), N'Sugar Free Peda', 3, 35)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (241, CAST(N'2024-10-04' AS Date), N'Butter Chiplet', 0, 36)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (242, CAST(N'2024-10-04' AS Date), N'Besan Laddu', 0, 37)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (243, CAST(N'2024-10-04' AS Date), N'Sanchi Neer lit', 0, 38)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (244, CAST(N'2024-10-04' AS Date), N'Misti Doi 100gm', 0, 39)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (245, CAST(N'2024-10-04' AS Date), N'Braj Peda', 4, 40)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (246, CAST(N'2024-10-04' AS Date), N'Amrakhand 100 gms', 7, 41)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (247, CAST(N'2024-10-03' AS Date), N'STD', 0, 1)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (248, CAST(N'2024-10-03' AS Date), N'DTM', 0, 2)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (249, CAST(N'2024-10-03' AS Date), N'LITE', 0, 3)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (250, CAST(N'2024-10-03' AS Date), N'FCM', 0, 4)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (251, CAST(N'2024-10-03' AS Date), N'Diamond', 0, 5)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (252, CAST(N'2024-10-03' AS Date), N'TM', 0, 6)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (253, CAST(N'2024-10-03' AS Date), N'CHAH', 0, 7)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (254, CAST(N'2024-10-03' AS Date), N'FCM 1L', 0, 8)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (255, CAST(N'2024-10-03' AS Date), N'Chai spl. 1000ML', 0, 9)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (256, CAST(N'2024-10-03' AS Date), N'SMP', 0, 10)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (257, CAST(N'2024-10-03' AS Date), N'Sweeten SMP', 0, 11)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (258, CAST(N'2024-10-03' AS Date), N'WB', 44, 12)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (259, CAST(N'2024-10-03' AS Date), N'Plain curd', 3553, 13)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (260, CAST(N'2024-10-03' AS Date), N'Sweet Curd', 1033, 14)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (261, CAST(N'2024-10-03' AS Date), N'Salted Butter Milk 200 ML', 1551, 15)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (262, CAST(N'2024-10-03' AS Date), N'Plain Butter Milk', 11635, 16)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (263, CAST(N'2024-10-03' AS Date), N'Cold Coffee', 0, 17)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (264, CAST(N'2024-10-03' AS Date), N'Fl.Milk Pet Bottle', 0, 18)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (265, CAST(N'2024-10-03' AS Date), N'S.F.M Glass(Bottles)', 0, 19)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (266, CAST(N'2024-10-03' AS Date), N'Lassi 200 ML Glass', 428, 20)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (267, CAST(N'2024-10-03' AS Date), N'Lite Lassi 200 ML', 0, 21)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (268, CAST(N'2024-10-03' AS Date), N'Shrikhand', 723, 22)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (269, CAST(N'2024-10-03' AS Date), N'Chena Rabdi', 205, 23)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (270, CAST(N'2024-10-03' AS Date), N'Sabudana Kheer 100 gm', 2, 24)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (271, CAST(N'2024-10-03' AS Date), N'Peda', 403, 25)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (272, CAST(N'2024-10-03' AS Date), N'Milk Cake', 71, 26)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (273, CAST(N'2024-10-03' AS Date), N'Mawa', 7, 27)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (274, CAST(N'2024-10-03' AS Date), N'Paneer', 150, 28)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (275, CAST(N'2024-10-03' AS Date), N'Vaccum Paneer', 0, 29)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (276, CAST(N'2024-10-03' AS Date), N'Rasogulla', 0, 30)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (277, CAST(N'2024-10-03' AS Date), N'Gulabjamun', 0, 31)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (278, CAST(N'2024-10-03' AS Date), N'Shrikhand Lite 100 gms cups', 0, 32)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (279, CAST(N'2024-10-03' AS Date), N'Table Butter', 0, 33)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (280, CAST(N'2024-10-03' AS Date), N'Cookies', 0, 34)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (281, CAST(N'2024-10-03' AS Date), N'Sugar Free Peda', 3, 35)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (282, CAST(N'2024-10-03' AS Date), N'Butter Chiplet', 0, 36)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (283, CAST(N'2024-10-03' AS Date), N'Besan Laddu', 0, 37)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (284, CAST(N'2024-10-03' AS Date), N'Sanchi Neer lit', 0, 38)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (285, CAST(N'2024-10-03' AS Date), N'Misti Doi 100gm', 0, 39)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (286, CAST(N'2024-10-03' AS Date), N'Braj Peda', 1, 40)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (287, CAST(N'2024-10-03' AS Date), N'Amrakhand 100 gms', 7, 41)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (288, CAST(N'2024-10-02' AS Date), N'STD', 0, 1)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (289, CAST(N'2024-10-02' AS Date), N'DTM', 0, 2)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (290, CAST(N'2024-10-02' AS Date), N'LITE', 0, 3)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (291, CAST(N'2024-10-02' AS Date), N'FCM', 0, 4)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (292, CAST(N'2024-10-02' AS Date), N'Diamond', 0, 5)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (293, CAST(N'2024-10-02' AS Date), N'TM', 0, 6)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (294, CAST(N'2024-10-02' AS Date), N'CHAH', 0, 7)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (295, CAST(N'2024-10-02' AS Date), N'FCM 1L', 0, 8)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (296, CAST(N'2024-10-02' AS Date), N'Chai spl. 1000ML', 0, 9)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (297, CAST(N'2024-10-02' AS Date), N'SMP', 0, 10)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (298, CAST(N'2024-10-02' AS Date), N'Sweeten SMP', 0, 11)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (299, CAST(N'2024-10-02' AS Date), N'WB', 680, 12)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (300, CAST(N'2024-10-02' AS Date), N'Plain curd', 3191, 13)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (301, CAST(N'2024-10-02' AS Date), N'Sweet Curd', 839, 14)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (302, CAST(N'2024-10-02' AS Date), N'Salted Butter Milk 200 ML', 1400, 15)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (303, CAST(N'2024-10-02' AS Date), N'Plain Butter Milk', 10370, 16)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (304, CAST(N'2024-10-02' AS Date), N'Cold Coffee', 0, 17)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (305, CAST(N'2024-10-02' AS Date), N'Fl.Milk Pet Bottle', 0, 18)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (306, CAST(N'2024-10-02' AS Date), N'S.F.M Glass(Bottles)', 0, 19)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (307, CAST(N'2024-10-02' AS Date), N'Lassi 200 ML Glass', 290, 20)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (308, CAST(N'2024-10-02' AS Date), N'Lite Lassi 200 ML', 0, 21)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (309, CAST(N'2024-10-02' AS Date), N'Shrikhand', 274, 22)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (310, CAST(N'2024-10-02' AS Date), N'Chena Rabdi', 212, 23)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (311, CAST(N'2024-10-02' AS Date), N'Sabudana Kheer 100 gm', 0, 24)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (312, CAST(N'2024-10-02' AS Date), N'Peda', 335, 25)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (313, CAST(N'2024-10-02' AS Date), N'Milk Cake', 43, 26)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (314, CAST(N'2024-10-02' AS Date), N'Mawa', 31, 27)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (315, CAST(N'2024-10-02' AS Date), N'Paneer', 185, 28)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (316, CAST(N'2024-10-02' AS Date), N'Vaccum Paneer', 0, 29)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (317, CAST(N'2024-10-02' AS Date), N'Rasogulla', 0, 30)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (318, CAST(N'2024-10-02' AS Date), N'Gulabjamun', 0, 31)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (319, CAST(N'2024-10-02' AS Date), N'Shrikhand Lite 100 gms cups', 0, 32)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (320, CAST(N'2024-10-02' AS Date), N'Table Butter', 0, 33)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (321, CAST(N'2024-10-02' AS Date), N'Cookies', 0, 34)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (322, CAST(N'2024-10-02' AS Date), N'Sugar Free Peda', 2, 35)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (323, CAST(N'2024-10-02' AS Date), N'Butter Chiplet', 0, 36)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (324, CAST(N'2024-10-02' AS Date), N'Besan Laddu', 0, 37)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (325, CAST(N'2024-10-02' AS Date), N'Sanchi Neer lit', 0, 38)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (326, CAST(N'2024-10-02' AS Date), N'Misti Doi 100gm', 0, 39)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (327, CAST(N'2024-10-02' AS Date), N'Braj Peda', 2, 40)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (328, CAST(N'2024-10-02' AS Date), N'Amrakhand 100 gms', 2, 41)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (329, CAST(N'2024-10-01' AS Date), N'STD', 0, 1)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (330, CAST(N'2024-10-01' AS Date), N'DTM', 0, 2)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (331, CAST(N'2024-10-01' AS Date), N'LITE', 0, 3)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (332, CAST(N'2024-10-01' AS Date), N'FCM', 0, 4)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (333, CAST(N'2024-10-01' AS Date), N'Diamond', 0, 5)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (334, CAST(N'2024-10-01' AS Date), N'TM', 0, 6)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (335, CAST(N'2024-10-01' AS Date), N'CHAH', 0, 7)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (336, CAST(N'2024-10-01' AS Date), N'FCM 1L', 0, 8)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (337, CAST(N'2024-10-01' AS Date), N'Chai spl. 1000ML', 0, 9)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (338, CAST(N'2024-10-01' AS Date), N'SMP', 0, 10)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (339, CAST(N'2024-10-01' AS Date), N'Sweeten SMP', 0, 11)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (340, CAST(N'2024-10-01' AS Date), N'WB', 4030, 12)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (341, CAST(N'2024-10-01' AS Date), N'Plain curd', 2836, 13)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (342, CAST(N'2024-10-01' AS Date), N'Sweet Curd', 795, 14)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (343, CAST(N'2024-10-01' AS Date), N'Salted Butter Milk 200 ML', 1049, 15)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (344, CAST(N'2024-10-01' AS Date), N'Plain Butter Milk', 7480, 16)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (345, CAST(N'2024-10-01' AS Date), N'Cold Coffee', 0, 17)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (346, CAST(N'2024-10-01' AS Date), N'Fl.Milk Pet Bottle', 0, 18)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (347, CAST(N'2024-10-01' AS Date), N'S.F.M Glass(Bottles)', 540, 19)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (348, CAST(N'2024-10-01' AS Date), N'Lassi 200 ML Glass', 124, 20)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (349, CAST(N'2024-10-01' AS Date), N'Lite Lassi 200 ML', 0, 21)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (350, CAST(N'2024-10-01' AS Date), N'Shrikhand', 495, 22)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (351, CAST(N'2024-10-01' AS Date), N'Chena Rabdi', 272, 23)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (352, CAST(N'2024-10-01' AS Date), N'Sabudana Kheer 100 gm', 0, 24)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (353, CAST(N'2024-10-01' AS Date), N'Peda', 326, 25)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (354, CAST(N'2024-10-01' AS Date), N'Milk Cake', 43, 26)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (355, CAST(N'2024-10-01' AS Date), N'Mawa', 14, 27)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (356, CAST(N'2024-10-01' AS Date), N'Paneer', 157, 28)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (357, CAST(N'2024-10-01' AS Date), N'Vaccum Paneer', 0, 29)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (358, CAST(N'2024-10-01' AS Date), N'Rasogulla', 0, 30)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (359, CAST(N'2024-10-01' AS Date), N'Gulabjamun', 0, 31)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (360, CAST(N'2024-10-01' AS Date), N'Shrikhand Lite 100 gms cups', 0, 32)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (361, CAST(N'2024-10-01' AS Date), N'Table Butter', 0, 33)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (362, CAST(N'2024-10-01' AS Date), N'Cookies', 0, 34)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (363, CAST(N'2024-10-01' AS Date), N'Sugar Free Peda', 3, 35)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (364, CAST(N'2024-10-01' AS Date), N'Butter Chiplet', 0, 36)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (365, CAST(N'2024-10-01' AS Date), N'Besan Laddu', 0, 37)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (366, CAST(N'2024-10-01' AS Date), N'Sanchi Neer lit', 0, 38)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (367, CAST(N'2024-10-01' AS Date), N'Misti Doi 100gm', 0, 39)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (368, CAST(N'2024-10-01' AS Date), N'Braj Peda', 4, 40)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (369, CAST(N'2024-10-01' AS Date), N'Amrakhand 100 gms', 6, 41)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (370, CAST(N'2024-11-08' AS Date), N'STD', 100, 1)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (371, CAST(N'2024-11-08' AS Date), N'DTM', 0, 2)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (372, CAST(N'2024-11-08' AS Date), N'LITE', 0, 3)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (373, CAST(N'2024-11-08' AS Date), N'FCM', 0, 4)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (374, CAST(N'2024-11-08' AS Date), N'Diamond', 0, 5)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (375, CAST(N'2024-11-08' AS Date), N'TM', 0, 6)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (376, CAST(N'2024-11-08' AS Date), N'CHAH', 0, 7)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (377, CAST(N'2024-11-08' AS Date), N'FCM 1L', 0, 8)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (378, CAST(N'2024-11-08' AS Date), N'Chai spl. 1000ML', 0, 9)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (379, CAST(N'2024-11-08' AS Date), N'SMP', 0, 10)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (380, CAST(N'2024-11-08' AS Date), N'Sweeten SMP', 0, 11)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (381, CAST(N'2024-11-08' AS Date), N'WB', 0, 12)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (382, CAST(N'2024-11-08' AS Date), N'Plain curd', 0, 13)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (383, CAST(N'2024-11-08' AS Date), N'Sweet Curd', 0, 14)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (384, CAST(N'2024-11-08' AS Date), N'Salted Butter Milk 200 ML', 0, 15)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (385, CAST(N'2024-11-08' AS Date), N'Plain Butter Milk', 0, 16)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (386, CAST(N'2024-11-08' AS Date), N'Cold Coffee', 0, 17)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (387, CAST(N'2024-11-08' AS Date), N'Fl.Milk Pet Bottle', 0, 18)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (388, CAST(N'2024-11-08' AS Date), N'S.F.M Glass(Bottles)', 0, 19)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (389, CAST(N'2024-11-08' AS Date), N'Lassi 200 ML Glass', 0, 20)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (390, CAST(N'2024-11-08' AS Date), N'Lite Lassi 200 ML', 0, 21)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (391, CAST(N'2024-11-08' AS Date), N'Shrikhand', 0, 22)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (392, CAST(N'2024-11-08' AS Date), N'Chena Rabdi', 0, 23)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (393, CAST(N'2024-11-08' AS Date), N'Sabudana Kheer 100 gm', 0, 24)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (394, CAST(N'2024-11-08' AS Date), N'Peda', 0, 25)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (395, CAST(N'2024-11-08' AS Date), N'Milk Cake', 0, 26)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (396, CAST(N'2024-11-08' AS Date), N'Mawa', 0, 27)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (397, CAST(N'2024-11-08' AS Date), N'Paneer', 0, 28)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (398, CAST(N'2024-11-08' AS Date), N'Vaccum Paneer', 0, 29)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (399, CAST(N'2024-11-08' AS Date), N'Rasogulla', 0, 30)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (400, CAST(N'2024-11-08' AS Date), N'Gulabjamun', 0, 31)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (401, CAST(N'2024-11-08' AS Date), N'Shrikhand Lite 100 gms cups', 0, 32)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (402, CAST(N'2024-11-08' AS Date), N'Table Butter', 0, 33)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (403, CAST(N'2024-11-08' AS Date), N'Cookies', 0, 34)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (404, CAST(N'2024-11-08' AS Date), N'Sugar Free Peda', 0, 35)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (405, CAST(N'2024-11-08' AS Date), N'Butter Chiplet', 0, 36)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (406, CAST(N'2024-11-08' AS Date), N'Besan Laddu', 0, 37)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (407, CAST(N'2024-11-08' AS Date), N'Sanchi Neer lit', 0, 38)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (408, CAST(N'2024-11-08' AS Date), N'Misti Doi 100gm', 0, 39)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (409, CAST(N'2024-11-08' AS Date), N'Braj Peda', 0, 40)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (410, CAST(N'2024-11-08' AS Date), N'Amrakhand 100 gms', 0, 41)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (411, CAST(N'2024-11-10' AS Date), N'STD', 10, 1)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (412, CAST(N'2024-11-10' AS Date), N'DTM', 2, 2)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (413, CAST(N'2024-11-10' AS Date), N'LITE', 255, 3)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (414, CAST(N'2024-11-10' AS Date), N'FCM', 21, 4)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (415, CAST(N'2024-11-10' AS Date), N'Diamond', 21, 5)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (416, CAST(N'2024-11-10' AS Date), N'TM', 258, 6)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (417, CAST(N'2024-11-10' AS Date), N'CHAH', 21, 7)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (418, CAST(N'2024-11-10' AS Date), N'FCM 1L', 25, 8)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (419, CAST(N'2024-11-10' AS Date), N'Chai spl. 1000ML', 26, 9)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (420, CAST(N'2024-11-10' AS Date), N'SMP', 0, 10)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (421, CAST(N'2024-11-10' AS Date), N'Sweeten SMP', 0, 11)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (422, CAST(N'2024-11-10' AS Date), N'WB', 0, 12)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (423, CAST(N'2024-11-10' AS Date), N'Plain curd', 0, 13)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (424, CAST(N'2024-11-10' AS Date), N'Sweet Curd', 0, 14)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (425, CAST(N'2024-11-10' AS Date), N'Salted Butter Milk 200 ML', 0, 15)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (426, CAST(N'2024-11-10' AS Date), N'Plain Butter Milk', 0, 16)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (427, CAST(N'2024-11-10' AS Date), N'Cold Coffee', 0, 17)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (428, CAST(N'2024-11-10' AS Date), N'Fl.Milk Pet Bottle', 0, 18)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (429, CAST(N'2024-11-10' AS Date), N'S.F.M Glass(Bottles)', 0, 19)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (430, CAST(N'2024-11-10' AS Date), N'Lassi 200 ML Glass', 854, 20)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (431, CAST(N'2024-11-10' AS Date), N'Lite Lassi 200 ML', 23, 21)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (432, CAST(N'2024-11-10' AS Date), N'Shrikhand', 0, 22)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (433, CAST(N'2024-11-10' AS Date), N'Chena Rabdi', 0, 23)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (434, CAST(N'2024-11-10' AS Date), N'Sabudana Kheer 100 gm', 0, 24)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (435, CAST(N'2024-11-10' AS Date), N'Peda', 0, 25)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (436, CAST(N'2024-11-10' AS Date), N'Milk Cake', 0, 26)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (437, CAST(N'2024-11-10' AS Date), N'Mawa', 0, 27)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (438, CAST(N'2024-11-10' AS Date), N'Paneer', 0, 28)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (439, CAST(N'2024-11-10' AS Date), N'Vaccum Paneer', 0, 29)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (440, CAST(N'2024-11-10' AS Date), N'Rasogulla', 0, 30)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (441, CAST(N'2024-11-10' AS Date), N'Gulabjamun', 0, 31)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (442, CAST(N'2024-11-10' AS Date), N'Shrikhand Lite 100 gms cups', 0, 32)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (443, CAST(N'2024-11-10' AS Date), N'Table Butter', 0, 33)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (444, CAST(N'2024-11-10' AS Date), N'Cookies', 0, 34)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (445, CAST(N'2024-11-10' AS Date), N'Sugar Free Peda', 0, 35)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (446, CAST(N'2024-11-10' AS Date), N'Butter Chiplet', 0, 36)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (447, CAST(N'2024-11-10' AS Date), N'Besan Laddu', 0, 37)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (448, CAST(N'2024-11-10' AS Date), N'Sanchi Neer lit', 0, 38)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (449, CAST(N'2024-11-10' AS Date), N'Misti Doi 100gm', 0, 39)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (450, CAST(N'2024-11-10' AS Date), N'Braj Peda', 0, 40)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (451, CAST(N'2024-11-10' AS Date), N'Amrakhand 100 gms', 0, 41)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (452, CAST(N'2024-11-11' AS Date), N'STD', 10, 1)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (453, CAST(N'2024-11-11' AS Date), N'DTM', 10, 2)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (454, CAST(N'2024-11-11' AS Date), N'LITE', 10, 3)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (455, CAST(N'2024-11-11' AS Date), N'FCM', 10, 4)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (456, CAST(N'2024-11-11' AS Date), N'Diamond', 0, 5)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (457, CAST(N'2024-11-11' AS Date), N'TM', 0, 6)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (458, CAST(N'2024-11-11' AS Date), N'CHAH', 0, 7)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (459, CAST(N'2024-11-11' AS Date), N'FCM 1L', 0, 8)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (460, CAST(N'2024-11-11' AS Date), N'Chai spl. 1000ML', 0, 9)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (461, CAST(N'2024-11-11' AS Date), N'SMP', 10, 10)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (462, CAST(N'2024-11-11' AS Date), N'Sweeten SMP', 10, 11)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (463, CAST(N'2024-11-11' AS Date), N'WB', 10, 12)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (464, CAST(N'2024-11-11' AS Date), N'Plain curd', 10, 13)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (465, CAST(N'2024-11-11' AS Date), N'Sweet Curd', 0, 14)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (466, CAST(N'2024-11-11' AS Date), N'Salted Butter Milk 200 ML', 0, 15)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (467, CAST(N'2024-11-11' AS Date), N'Plain Butter Milk', 0, 16)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (468, CAST(N'2024-11-11' AS Date), N'Cold Coffee', 0, 17)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (469, CAST(N'2024-11-11' AS Date), N'Fl.Milk Pet Bottle', 0, 18)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (470, CAST(N'2024-11-11' AS Date), N'S.F.M Glass(Bottles)', 0, 19)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (471, CAST(N'2024-11-11' AS Date), N'Lassi 200 ML Glass', 0, 20)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (472, CAST(N'2024-11-11' AS Date), N'Lite Lassi 200 ML', 0, 21)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (473, CAST(N'2024-11-11' AS Date), N'Shrikhand', 0, 22)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (474, CAST(N'2024-11-11' AS Date), N'Chena Rabdi', 0, 23)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (475, CAST(N'2024-11-11' AS Date), N'Sabudana Kheer 100 gm', 0, 24)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (476, CAST(N'2024-11-11' AS Date), N'Peda', 0, 25)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (477, CAST(N'2024-11-11' AS Date), N'Milk Cake', 0, 26)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (478, CAST(N'2024-11-11' AS Date), N'Mawa', 0, 27)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (479, CAST(N'2024-11-11' AS Date), N'Paneer', 0, 28)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (480, CAST(N'2024-11-11' AS Date), N'Vaccum Paneer', 0, 29)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (481, CAST(N'2024-11-11' AS Date), N'Rasogulla', 0, 30)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (482, CAST(N'2024-11-11' AS Date), N'Gulabjamun', 0, 31)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (483, CAST(N'2024-11-11' AS Date), N'Shrikhand Lite 100 gms cups', 0, 32)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (484, CAST(N'2024-11-11' AS Date), N'Table Butter', 0, 33)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (485, CAST(N'2024-11-11' AS Date), N'Cookies', 0, 34)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (486, CAST(N'2024-11-11' AS Date), N'Sugar Free Peda', 0, 35)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (487, CAST(N'2024-11-11' AS Date), N'Butter Chiplet', 0, 36)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (488, CAST(N'2024-11-11' AS Date), N'Besan Laddu', 0, 37)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (489, CAST(N'2024-11-11' AS Date), N'Sanchi Neer lit', 0, 38)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (490, CAST(N'2024-11-11' AS Date), N'Misti Doi 100gm', 0, 39)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (491, CAST(N'2024-11-11' AS Date), N'Braj Peda', 0, 40)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (492, CAST(N'2024-11-11' AS Date), N'Amrakhand 100 gms', 0, 41)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (493, CAST(N'2024-11-11' AS Date), N'STD', 0, 1)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (494, CAST(N'2024-11-11' AS Date), N'DTM', 0, 2)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (495, CAST(N'2024-11-11' AS Date), N'LITE', 0, 3)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (496, CAST(N'2024-11-11' AS Date), N'FCM', 0, 4)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (497, CAST(N'2024-11-11' AS Date), N'Diamond', 0, 5)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (498, CAST(N'2024-11-11' AS Date), N'TM', 0, 6)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (499, CAST(N'2024-11-11' AS Date), N'CHAH', 0, 7)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (500, CAST(N'2024-11-11' AS Date), N'FCM 1L', 0, 8)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (501, CAST(N'2024-11-11' AS Date), N'Chai spl. 1000ML', 0, 9)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (502, CAST(N'2024-11-11' AS Date), N'SMP', 100, 10)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (503, CAST(N'2024-11-11' AS Date), N'Sweeten SMP', 200, 11)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (504, CAST(N'2024-11-11' AS Date), N'WB', 400, 12)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (505, CAST(N'2024-11-11' AS Date), N'Plain curd', 500, 13)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (506, CAST(N'2024-11-11' AS Date), N'Sweet Curd', 800, 14)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (507, CAST(N'2024-11-11' AS Date), N'Salted Butter Milk 200 ML', 0, 15)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (508, CAST(N'2024-11-11' AS Date), N'Plain Butter Milk', 0, 16)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (509, CAST(N'2024-11-11' AS Date), N'Cold Coffee', 0, 17)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (510, CAST(N'2024-11-11' AS Date), N'Fl.Milk Pet Bottle', 0, 18)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (511, CAST(N'2024-11-11' AS Date), N'S.F.M Glass(Bottles)', 0, 19)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (512, CAST(N'2024-11-11' AS Date), N'Lassi 200 ML Glass', 0, 20)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (513, CAST(N'2024-11-11' AS Date), N'Lite Lassi 200 ML', 0, 21)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (514, CAST(N'2024-11-11' AS Date), N'Shrikhand', 0, 22)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (515, CAST(N'2024-11-11' AS Date), N'Chena Rabdi', 0, 23)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (516, CAST(N'2024-11-11' AS Date), N'Sabudana Kheer 100 gm', 0, 24)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (517, CAST(N'2024-11-11' AS Date), N'Peda', 0, 25)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (518, CAST(N'2024-11-11' AS Date), N'Milk Cake', 0, 26)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (519, CAST(N'2024-11-11' AS Date), N'Mawa', 0, 27)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (520, CAST(N'2024-11-11' AS Date), N'Paneer', 0, 28)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (521, CAST(N'2024-11-11' AS Date), N'Vaccum Paneer', 0, 29)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (522, CAST(N'2024-11-11' AS Date), N'Rasogulla', 0, 30)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (523, CAST(N'2024-11-11' AS Date), N'Gulabjamun', 0, 31)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (524, CAST(N'2024-11-11' AS Date), N'Shrikhand Lite 100 gms cups', 0, 32)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (525, CAST(N'2024-11-11' AS Date), N'Table Butter', 0, 33)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (526, CAST(N'2024-11-11' AS Date), N'Cookies', 0, 34)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (527, CAST(N'2024-11-11' AS Date), N'Sugar Free Peda', 0, 35)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (528, CAST(N'2024-11-11' AS Date), N'Butter Chiplet', 0, 36)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (529, CAST(N'2024-11-11' AS Date), N'Besan Laddu', 0, 37)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (530, CAST(N'2024-11-11' AS Date), N'Sanchi Neer lit', 0, 38)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (531, CAST(N'2024-11-11' AS Date), N'Misti Doi 100gm', 0, 39)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (532, CAST(N'2024-11-11' AS Date), N'Braj Peda', 0, 40)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (533, CAST(N'2024-11-11' AS Date), N'Amrakhand 100 gms', 0, 41)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (534, CAST(N'2024-11-11' AS Date), N'STD', 0, 1)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (535, CAST(N'2024-11-11' AS Date), N'DTM', 0, 2)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (536, CAST(N'2024-11-11' AS Date), N'LITE', 0, 3)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (537, CAST(N'2024-11-11' AS Date), N'FCM', 0, 4)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (538, CAST(N'2024-11-11' AS Date), N'Diamond', 0, 5)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (539, CAST(N'2024-11-11' AS Date), N'TM', 0, 6)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (540, CAST(N'2024-11-11' AS Date), N'CHAH', 0, 7)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (541, CAST(N'2024-11-11' AS Date), N'FCM 1L', 0, 8)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (542, CAST(N'2024-11-11' AS Date), N'Chai spl. 1000ML', 0, 9)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (543, CAST(N'2024-11-11' AS Date), N'SMP', 0, 10)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (544, CAST(N'2024-11-11' AS Date), N'Sweeten SMP', 0, 11)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (545, CAST(N'2024-11-11' AS Date), N'WB', 0, 12)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (546, CAST(N'2024-11-11' AS Date), N'Plain curd', 0, 13)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (547, CAST(N'2024-11-11' AS Date), N'Sweet Curd', 0, 14)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (548, CAST(N'2024-11-11' AS Date), N'Salted Butter Milk 200 ML', 0, 15)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (549, CAST(N'2024-11-11' AS Date), N'Plain Butter Milk', 0, 16)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (550, CAST(N'2024-11-11' AS Date), N'Cold Coffee', 0, 17)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (551, CAST(N'2024-11-11' AS Date), N'Fl.Milk Pet Bottle', 0, 18)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (552, CAST(N'2024-11-11' AS Date), N'S.F.M Glass(Bottles)', 0, 19)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (553, CAST(N'2024-11-11' AS Date), N'Lassi 200 ML Glass', 0, 20)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (554, CAST(N'2024-11-11' AS Date), N'Lite Lassi 200 ML', 0, 21)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (555, CAST(N'2024-11-11' AS Date), N'Shrikhand', 0, 22)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (556, CAST(N'2024-11-11' AS Date), N'Chena Rabdi', 0, 23)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (557, CAST(N'2024-11-11' AS Date), N'Sabudana Kheer 100 gm', 0, 24)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (558, CAST(N'2024-11-11' AS Date), N'Peda', 0, 25)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (559, CAST(N'2024-11-11' AS Date), N'Milk Cake', 0, 26)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (560, CAST(N'2024-11-11' AS Date), N'Mawa', 0, 27)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (561, CAST(N'2024-11-11' AS Date), N'Paneer', 0, 28)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (562, CAST(N'2024-11-11' AS Date), N'Vaccum Paneer', 0, 29)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (563, CAST(N'2024-11-11' AS Date), N'Rasogulla', 0, 30)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (564, CAST(N'2024-11-11' AS Date), N'Gulabjamun', 0, 31)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (565, CAST(N'2024-11-11' AS Date), N'Shrikhand Lite 100 gms cups', 0, 32)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (566, CAST(N'2024-11-11' AS Date), N'Table Butter', 0, 33)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (567, CAST(N'2024-11-11' AS Date), N'Cookies', 20, 34)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (568, CAST(N'2024-11-11' AS Date), N'Sugar Free Peda', 0, 35)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (569, CAST(N'2024-11-11' AS Date), N'Butter Chiplet', 0, 36)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (570, CAST(N'2024-11-11' AS Date), N'Besan Laddu', 0, 37)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (571, CAST(N'2024-11-11' AS Date), N'Sanchi Neer lit', 0, 38)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (572, CAST(N'2024-11-11' AS Date), N'Misti Doi 100gm', 0, 39)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (573, CAST(N'2024-11-11' AS Date), N'Braj Peda', 0, 40)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (574, CAST(N'2024-11-11' AS Date), N'Amrakhand 100 gms', 0, 41)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (616, CAST(N'2024-11-12' AS Date), N'STD', 0, 1)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (617, CAST(N'2024-11-12' AS Date), N'DTM', 0, 2)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (618, CAST(N'2024-11-12' AS Date), N'LITE', 0, 3)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (619, CAST(N'2024-11-12' AS Date), N'FCM', 0, 4)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (620, CAST(N'2024-11-12' AS Date), N'Diamond', 0, 5)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (621, CAST(N'2024-11-12' AS Date), N'TM', 0, 6)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (622, CAST(N'2024-11-12' AS Date), N'CHAH', 0, 7)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (623, CAST(N'2024-11-12' AS Date), N'FCM 1L', 0, 8)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (624, CAST(N'2024-11-12' AS Date), N'Chai spl. 1000ML', 0, 9)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (625, CAST(N'2024-11-12' AS Date), N'SMP', 0, 10)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (626, CAST(N'2024-11-12' AS Date), N'Sweeten SMP', 0, 11)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (627, CAST(N'2024-11-12' AS Date), N'WB', 0, 12)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (628, CAST(N'2024-11-12' AS Date), N'Plain curd', 0, 13)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (629, CAST(N'2024-11-12' AS Date), N'Sweet Curd', 0, 14)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (630, CAST(N'2024-11-12' AS Date), N'Salted Butter Milk 200 ML', 0, 15)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (631, CAST(N'2024-11-12' AS Date), N'Plain Butter Milk', 0, 16)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (632, CAST(N'2024-11-12' AS Date), N'Cold Coffee', 0, 17)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (633, CAST(N'2024-11-12' AS Date), N'Fl.Milk Pet Bottle', 0, 18)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (634, CAST(N'2024-11-12' AS Date), N'S.F.M Glass(Bottles)', 0, 19)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (635, CAST(N'2024-11-12' AS Date), N'Lassi 200 ML Glass', 0, 20)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (636, CAST(N'2024-11-12' AS Date), N'Lite Lassi 200 ML', 0, 21)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (637, CAST(N'2024-11-12' AS Date), N'Shrikhand', 0, 22)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (638, CAST(N'2024-11-12' AS Date), N'Chena Rabdi', 0, 23)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (639, CAST(N'2024-11-12' AS Date), N'Sabudana Kheer 100 gm', 0, 24)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (640, CAST(N'2024-11-12' AS Date), N'Peda', 0, 25)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (641, CAST(N'2024-11-12' AS Date), N'Milk Cake', 0, 26)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (642, CAST(N'2024-11-12' AS Date), N'Mawa', 0, 27)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (643, CAST(N'2024-11-12' AS Date), N'Paneer', 0, 28)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (644, CAST(N'2024-11-12' AS Date), N'Vaccum Paneer', 0, 29)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (645, CAST(N'2024-11-12' AS Date), N'Rasogulla', 0, 30)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (646, CAST(N'2024-11-12' AS Date), N'Gulabjamun', 0, 31)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (647, CAST(N'2024-11-12' AS Date), N'Shrikhand Lite 100 gms cups', 0, 32)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (648, CAST(N'2024-11-12' AS Date), N'Table Butter', 0, 33)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (649, CAST(N'2024-11-12' AS Date), N'Cookies', 0, 34)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (650, CAST(N'2024-11-12' AS Date), N'Sugar Free Peda', 0, 35)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (651, CAST(N'2024-11-12' AS Date), N'Butter Chiplet', 0, 36)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (652, CAST(N'2024-11-12' AS Date), N'Besan Laddu', 0, 37)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (653, CAST(N'2024-11-12' AS Date), N'Sanchi Neer lit', 0, 38)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (654, CAST(N'2024-11-12' AS Date), N'Misti Doi 100gm', 0, 39)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (655, CAST(N'2024-11-12' AS Date), N'Braj Peda', 0, 40)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (656, CAST(N'2024-11-12' AS Date), N'Amrakhand 100 gms', 0, 41)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (575, CAST(N'2024-11-09' AS Date), N'STD', 0, 1)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (576, CAST(N'2024-11-09' AS Date), N'DTM', 0, 2)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (577, CAST(N'2024-11-09' AS Date), N'LITE', 0, 3)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (578, CAST(N'2024-11-09' AS Date), N'FCM', 0, 4)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (579, CAST(N'2024-11-09' AS Date), N'Diamond', 0, 5)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (580, CAST(N'2024-11-09' AS Date), N'TM', 0, 6)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (581, CAST(N'2024-11-09' AS Date), N'CHAH', 0, 7)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (582, CAST(N'2024-11-09' AS Date), N'FCM 1L', 0, 8)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (583, CAST(N'2024-11-09' AS Date), N'Chai spl. 1000ML', 0, 9)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (584, CAST(N'2024-11-09' AS Date), N'SMP', 0, 10)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (585, CAST(N'2024-11-09' AS Date), N'Sweeten SMP', 0, 11)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (586, CAST(N'2024-11-09' AS Date), N'WB', 6900, 12)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (587, CAST(N'2024-11-09' AS Date), N'Plain curd', 837, 13)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (588, CAST(N'2024-11-09' AS Date), N'Sweet Curd', 282, 14)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (589, CAST(N'2024-11-09' AS Date), N'Salted Butter Milk 200 ML', 302, 15)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (590, CAST(N'2024-11-09' AS Date), N'Plain Butter Milk', 2690, 16)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (591, CAST(N'2024-11-09' AS Date), N'Cold Coffee', 0, 17)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (592, CAST(N'2024-11-09' AS Date), N'Fl.Milk Pet Bottle', 0, 18)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (593, CAST(N'2024-11-09' AS Date), N'S.F.M Glass(Bottles)', 270, 19)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (594, CAST(N'2024-11-09' AS Date), N'Lassi 200 ML Glass', 0, 20)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (595, CAST(N'2024-11-09' AS Date), N'Lite Lassi 200 ML', 0, 21)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (596, CAST(N'2024-11-09' AS Date), N'Shrikhand', 246, 22)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (597, CAST(N'2024-11-09' AS Date), N'Chena Rabdi', 145, 23)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (598, CAST(N'2024-11-09' AS Date), N'Sabudana Kheer 100 gm', 0, 24)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (599, CAST(N'2024-11-09' AS Date), N'Peda', 246, 25)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (600, CAST(N'2024-11-09' AS Date), N'Milk Cake', 231, 26)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (601, CAST(N'2024-11-09' AS Date), N'Mawa', 17, 27)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (602, CAST(N'2024-11-09' AS Date), N'Paneer', 182, 28)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (603, CAST(N'2024-11-09' AS Date), N'Vaccum Paneer', 0, 29)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (604, CAST(N'2024-11-09' AS Date), N'Rasogulla', 0, 30)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (605, CAST(N'2024-11-09' AS Date), N'Gulabjamun', 0, 31)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (606, CAST(N'2024-11-09' AS Date), N'Shrikhand Lite 100 gms cups', 0, 32)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (607, CAST(N'2024-11-09' AS Date), N'Table Butter', 0, 33)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (608, CAST(N'2024-11-09' AS Date), N'Cookies', 0, 34)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (609, CAST(N'2024-11-09' AS Date), N'Sugar Free Peda', 3, 35)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (610, CAST(N'2024-11-09' AS Date), N'Butter Chiplet', 0, 36)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (611, CAST(N'2024-11-09' AS Date), N'Besan Laddu', 0, 37)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (612, CAST(N'2024-11-09' AS Date), N'Sanchi Neer lit', 0, 38)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (613, CAST(N'2024-11-09' AS Date), N'Misti Doi 100gm', 0, 39)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (614, CAST(N'2024-11-09' AS Date), N'Braj Peda', 6, 40)
GO
INSERT [dbo].[PlantManufacturingData] ([ManufItemId], [Date], [ItemName], [Quantity], [ItemID]) VALUES (615, CAST(N'2024-11-09' AS Date), N'Amrakhand 100 gms', 5, 41)
GO
SET IDENTITY_INSERT [dbo].[PlantManufacturingData] OFF
GO
SET IDENTITY_INSERT [dbo].[trn_Demand] ON 
GO
INSERT [dbo].[trn_Demand] ([DemandId], [Date], [ItemCategory], [Shift], [Retailer], [VehicleNo], [DemandType]) VALUES (1, CAST(N'2024-10-07' AS Date), N'Product', N'Morning', N'Depot No. 94[D75]', N'MP-04-GB-0338', N'Regular')
GO
INSERT [dbo].[trn_Demand] ([DemandId], [Date], [ItemCategory], [Shift], [Retailer], [VehicleNo], [DemandType]) VALUES (2, CAST(N'2024-10-06' AS Date), N'Product', N'Morning', N'Depot No. 94[D75]', N'MP-04-GB-0338', N'Regular')
GO
INSERT [dbo].[trn_Demand] ([DemandId], [Date], [ItemCategory], [Shift], [Retailer], [VehicleNo], [DemandType]) VALUES (3, CAST(N'2024-10-05' AS Date), N'Product', N'Morning', N'Depot No. 94[D75]', N'MP-04-GB-0338', N'Regular')
GO
INSERT [dbo].[trn_Demand] ([DemandId], [Date], [ItemCategory], [Shift], [Retailer], [VehicleNo], [DemandType]) VALUES (4, CAST(N'2024-10-04' AS Date), N'Product', N'Morning', N'Depot No. 94[D75]', N'MP-04-GB-0338', N'Regular')
GO
INSERT [dbo].[trn_Demand] ([DemandId], [Date], [ItemCategory], [Shift], [Retailer], [VehicleNo], [DemandType]) VALUES (5, CAST(N'2024-10-03' AS Date), N'Product', N'Morning', N'Depot No. 94[D75]', N'MP-04-GB-0338', N'Regular')
GO
INSERT [dbo].[trn_Demand] ([DemandId], [Date], [ItemCategory], [Shift], [Retailer], [VehicleNo], [DemandType]) VALUES (6, CAST(N'2024-10-02' AS Date), N'Product', N'Morning', N'Depot No. 94[D75]', N'MP-04-GB-0338', N'Regular')
GO
INSERT [dbo].[trn_Demand] ([DemandId], [Date], [ItemCategory], [Shift], [Retailer], [VehicleNo], [DemandType]) VALUES (7, CAST(N'2024-10-01' AS Date), N'Product', N'Morning', N'Depot No. 94[D75]', N'MP-04-GB-0338', N'Regular')
GO
INSERT [dbo].[trn_Demand] ([DemandId], [Date], [ItemCategory], [Shift], [Retailer], [VehicleNo], [DemandType]) VALUES (8, CAST(N'2024-11-10' AS Date), N'Product', N'Morning', N'Depot No. 94[D75]', N'MP-04-GB-0338', N'Regular')
GO
INSERT [dbo].[trn_Demand] ([DemandId], [Date], [ItemCategory], [Shift], [Retailer], [VehicleNo], [DemandType]) VALUES (9, CAST(N'2024-11-11' AS Date), N'Product', N'Morning', N'Depot No. 94[D75]', N'MP-04-GB-0338', N'Regular')
GO
INSERT [dbo].[trn_Demand] ([DemandId], [Date], [ItemCategory], [Shift], [Retailer], [VehicleNo], [DemandType]) VALUES (10, CAST(N'2024-11-09' AS Date), N'Product', N'Morning', N'Depot No. 94[D75]', N'MP-04-HR-0554', N'Regular')
GO
INSERT [dbo].[trn_Demand] ([DemandId], [Date], [ItemCategory], [Shift], [Retailer], [VehicleNo], [DemandType]) VALUES (11, CAST(N'2024-11-10' AS Date), N'Milk', N'Morning', N'Depot No. 94[D75]', N'MP-04-GB-0338', N'Regular')
GO
INSERT [dbo].[trn_Demand] ([DemandId], [Date], [ItemCategory], [Shift], [Retailer], [VehicleNo], [DemandType]) VALUES (12, CAST(N'2024-11-14' AS Date), N'Milk', N'Morning', N'Depot No. 94[D75]', N'MP-04-HR-0554', N'Regular')
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
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (4, 1, N'Plain curd', 2798, 0, 13)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (5, 1, N'Sweet Curd', 994, 0, 14)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (6, 1, N'Salted Butter Milk 200 ML', 1404, 0, 15)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (7, 1, N'Plain Butter Milk', 10560, 0, 16)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (8, 1, N'Cold Coffee', 0, 0, 17)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (9, 1, N'Fl.Milk Pet Bottle', 24, 0, 18)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (10, 1, N'S.F.M Glass(Bottles)', 63, 0, 19)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (11, 1, N'Lassi 200 ML Glass', 322, 0, 20)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (12, 1, N'Lite Lassi 200 ML', 0, 0, 21)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (13, 1, N'Shrikhand', 457, 0, 22)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (14, 1, N'Chena Rabdi', 213, 0, 23)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (15, 1, N'Sabudana Kheer 100 gm', 1, 0, 24)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (16, 1, N'Peda', 367, 0, 25)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (17, 1, N'Milk Cake', 48, 0, 26)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (18, 1, N'Mawa', 26, 0, 27)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (19, 1, N'Paneer', 103, 0, 28)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (20, 1, N'Vaccum Paneer', 0, 0, 29)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (21, 1, N'Rasogulla', 0, 0, 30)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (22, 1, N'Gulabjamun', 0, 0, 31)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (23, 1, N'Shrikhand Lite 100 gms cups', 0, 0, 32)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (24, 1, N'Table Butter', 2, 0, 33)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (25, 1, N'Cookies', 0, 0, 34)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (26, 1, N'Sugar Free Peda', 2, 0, 35)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (27, 1, N'Butter Chiplet', 1, 0, 36)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (28, 1, N'Besan Laddu', 0, 0, 37)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (29, 1, N'Sanchi Neer lit', 0, 0, 38)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (30, 1, N'Misti Doi 100gm', 0, 0, 39)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (31, 1, N'Braj Peda', 1, 0, 40)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (32, 1, N'Amrakhand 100 gms', 3, 0, 41)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (33, 2, N'SMP', 0, 0, 10)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (34, 2, N'Sweeten SMP', 0, 0, 11)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (35, 2, N'WB', 0, 0, 12)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (36, 2, N'Plain curd', 3218, 0, 13)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (37, 2, N'Sweet Curd', 808, 0, 14)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (38, 2, N'Salted Butter Milk 200 ML', 1307, 0, 15)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (39, 2, N'Plain Butter Milk', 11230, 0, 16)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (40, 2, N'Cold Coffee', 0, 0, 17)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (41, 2, N'Fl.Milk Pet Bottle', 62, 0, 18)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (42, 2, N'S.F.M Glass(Bottles)', 36, 0, 19)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (43, 2, N'Lassi 200 ML Glass', 322, 0, 20)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (44, 2, N'Lite Lassi 200 ML', 0, 0, 21)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (45, 2, N'Shrikhand', 495, 0, 22)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (46, 2, N'Chena Rabdi', 224, 0, 23)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (47, 2, N'Sabudana Kheer 100 gm', 1, 0, 24)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (48, 2, N'Peda', 477, 0, 25)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (49, 2, N'Milk Cake', 57, 0, 26)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (50, 2, N'Mawa', 1, 0, 27)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (51, 2, N'Paneer', 98, 0, 28)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (52, 2, N'Vaccum Paneer', 0, 0, 29)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (53, 2, N'Rasogulla', 0, 0, 30)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (54, 2, N'Gulabjamun', 0, 0, 31)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (55, 2, N'Shrikhand Lite 100 gms cups', 0, 0, 32)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (56, 2, N'Table Butter', 4, 0, 33)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (57, 2, N'Cookies', 0, 0, 34)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (58, 2, N'Sugar Free Peda', 2, 0, 35)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (59, 2, N'Butter Chiplet', 2, 0, 36)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (60, 2, N'Besan Laddu', 0, 0, 37)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (61, 2, N'Sanchi Neer lit', 0, 0, 38)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (62, 2, N'Misti Doi 100gm', 0, 0, 39)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (63, 2, N'Braj Peda', 0, 0, 40)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (64, 2, N'Amrakhand 100 gms', 4, 0, 41)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (65, 3, N'SMP', 0, 0, 10)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (66, 3, N'Sweeten SMP', 0, 0, 11)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (67, 3, N'WB', 0, 0, 12)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (68, 3, N'Plain curd', 3002, 0, 13)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (69, 3, N'Sweet Curd', 976, 0, 14)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (70, 3, N'Salted Butter Milk 200 ML', 1440, 0, 15)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (71, 3, N'Plain Butter Milk', 11125, 0, 16)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (72, 3, N'Cold Coffee', 0, 0, 17)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (73, 3, N'Fl.Milk Pet Bottle', 19, 0, 18)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (74, 3, N'S.F.M Glass(Bottles)', 54, 0, 19)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (75, 3, N'Lassi 200 ML Glass', 388, 0, 20)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (76, 3, N'Lite Lassi 200 ML', 0, 0, 21)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (77, 3, N'Shrikhand', 475, 0, 22)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (78, 3, N'Chena Rabdi', 214, 0, 23)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (79, 3, N'Sabudana Kheer 100 gm', 0, 0, 24)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (80, 3, N'Peda', 362, 0, 25)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (81, 3, N'Milk Cake', 44, 0, 26)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (82, 3, N'Mawa', 27, 0, 27)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (83, 3, N'Paneer', 96, 0, 28)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (84, 3, N'Vaccum Paneer', 0, 0, 29)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (85, 3, N'Rasogulla', 0, 0, 30)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (86, 3, N'Gulabjamun', 0, 0, 31)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (87, 3, N'Shrikhand Lite 100 gms cups', 0, 0, 32)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (88, 3, N'Table Butter', 4, 0, 33)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (89, 3, N'Cookies', 0, 0, 34)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (90, 3, N'Sugar Free Peda', 5, 0, 35)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (91, 3, N'Butter Chiplet', 4, 0, 36)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (92, 3, N'Besan Laddu', 0, 0, 37)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (93, 3, N'Sanchi Neer lit', 144, 0, 38)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (94, 3, N'Misti Doi 100gm', 0, 0, 39)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (95, 3, N'Braj Peda', 1, 0, 40)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (96, 3, N'Amrakhand 100 gms', 3, 0, 41)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (97, 4, N'SMP', 0, 0, 10)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (98, 4, N'Sweeten SMP', 0, 0, 11)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (99, 4, N'WB', 0, 0, 12)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (100, 4, N'Plain curd', 3347, 0, 13)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (101, 4, N'Sweet Curd', 946, 0, 14)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (102, 4, N'Salted Butter Milk 200 ML', 1395, 0, 15)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (103, 4, N'Plain Butter Milk', 11560, 0, 16)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (104, 4, N'Cold Coffee', 0, 0, 17)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (105, 4, N'Fl.Milk Pet Bottle', 43, 0, 18)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (106, 4, N'S.F.M Glass(Bottles)', 67, 0, 19)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (107, 4, N'Lassi 200 ML Glass', 302, 0, 20)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (108, 4, N'Lite Lassi 200 ML', 0, 0, 21)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (109, 4, N'Shrikhand', 467, 0, 22)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (110, 4, N'Chena Rabdi', 212, 0, 23)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (111, 4, N'Sabudana Kheer 100 gm', 0, 0, 24)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (112, 4, N'Peda', 414, 0, 25)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (113, 4, N'Milk Cake', 56, 0, 26)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (114, 4, N'Mawa', 6, 0, 27)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (115, 4, N'Paneer', 121, 0, 28)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (116, 4, N'Vaccum Paneer', 0, 0, 29)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (117, 4, N'Rasogulla', 0, 0, 30)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (118, 4, N'Gulabjamun', 0, 0, 31)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (119, 4, N'Shrikhand Lite 100 gms cups', 0, 0, 32)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (120, 4, N'Table Butter', 25, 0, 33)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (121, 4, N'Cookies', 0, 0, 34)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (122, 4, N'Sugar Free Peda', 2, 0, 35)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (123, 4, N'Butter Chiplet', 2, 0, 36)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (124, 4, N'Besan Laddu', 0, 0, 37)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (125, 4, N'Sanchi Neer lit', 0, 0, 38)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (126, 4, N'Misti Doi 100gm', 0, 0, 39)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (127, 4, N'Braj Peda', 1, 0, 40)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (128, 4, N'Amrakhand 100 gms', 6, 0, 41)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (129, 5, N'SMP', 0, 0, 10)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (130, 5, N'Sweeten SMP', 0, 0, 11)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (131, 5, N'WB', 0, 0, 12)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (132, 5, N'Plain curd', 3489, 0, 13)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (133, 5, N'Sweet Curd', 1024, 0, 14)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (134, 5, N'Salted Butter Milk 200 ML', 1341, 0, 15)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (135, 5, N'Plain Butter Milk', 11458, 0, 16)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (136, 5, N'Cold Coffee', 0, 0, 17)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (137, 5, N'Fl.Milk Pet Bottle', 24, 0, 18)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (138, 5, N'S.F.M Glass(Bottles)', 67, 0, 19)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (139, 5, N'Lassi 200 ML Glass', 344, 0, 20)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (140, 5, N'Lite Lassi 200 ML', 0, 0, 21)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (141, 5, N'Shrikhand', 464, 0, 22)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (142, 5, N'Chena Rabdi', 229, 0, 23)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (143, 5, N'Sabudana Kheer 100 gm', 1, 0, 24)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (144, 5, N'Peda', 344, 0, 25)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (145, 5, N'Milk Cake', 67, 0, 26)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (146, 5, N'Mawa', 7, 0, 27)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (147, 5, N'Paneer', 106, 0, 28)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (148, 5, N'Vaccum Paneer', 0, 0, 29)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (149, 5, N'Rasogulla', 0, 0, 30)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (150, 5, N'Gulabjamun', 0, 0, 31)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (151, 5, N'Shrikhand Lite 100 gms cups', 0, 0, 32)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (152, 5, N'Table Butter', 8, 0, 33)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (153, 5, N'Cookies', 0, 0, 34)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (154, 5, N'Sugar Free Peda', 2, 0, 35)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (155, 5, N'Butter Chiplet', 5, 0, 36)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (156, 5, N'Besan Laddu', 0, 0, 37)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (157, 5, N'Sanchi Neer lit', 0, 0, 38)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (158, 5, N'Misti Doi 100gm', 0, 0, 39)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (159, 5, N'Braj Peda', 1, 0, 40)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (160, 5, N'Amrakhand 100 gms', 5, 0, 41)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (161, 6, N'SMP', 0, 0, 10)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (162, 6, N'Sweeten SMP', 0, 0, 11)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (163, 6, N'WB', 0, 0, 12)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (164, 6, N'Plain curd', 2650, 0, 13)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (165, 6, N'Sweet Curd', 682, 0, 14)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (166, 6, N'Salted Butter Milk 200 ML', 1116, 0, 15)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (167, 6, N'Plain Butter Milk', 9180, 0, 16)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (168, 6, N'Cold Coffee', 0, 0, 17)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (169, 6, N'Fl.Milk Pet Bottle', 24, 0, 18)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (170, 6, N'S.F.M Glass(Bottles)', 45, 0, 19)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (171, 6, N'Lassi 200 ML Glass', 194, 0, 20)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (172, 6, N'Lite Lassi 200 ML', 0, 0, 21)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (173, 6, N'Shrikhand', 361, 0, 22)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (174, 6, N'Chena Rabdi', 187, 0, 23)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (175, 6, N'Sabudana Kheer 100 gm', 0, 0, 24)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (176, 6, N'Peda', 327, 0, 25)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (177, 6, N'Milk Cake', 46, 0, 26)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (178, 6, N'Mawa', 30, 0, 27)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (179, 6, N'Paneer', 119, 0, 28)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (180, 6, N'Vaccum Paneer', 0, 0, 29)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (181, 6, N'Rasogulla', 0, 0, 30)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (182, 6, N'Gulabjamun', 0, 0, 31)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (183, 6, N'Shrikhand Lite 100 gms cups', 0, 0, 32)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (184, 6, N'Table Butter', 2, 0, 33)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (185, 6, N'Cookies', 0, 0, 34)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (186, 6, N'Sugar Free Peda', 2, 0, 35)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (187, 6, N'Butter Chiplet', 3, 0, 36)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (188, 6, N'Besan Laddu', 0, 0, 37)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (189, 6, N'Sanchi Neer lit', 0, 0, 38)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (190, 6, N'Misti Doi 100gm', 0, 0, 39)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (191, 6, N'Braj Peda', 1, 0, 40)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (192, 6, N'Amrakhand 100 gms', 1, 0, 41)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (193, 7, N'SMP', 0, 0, 10)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (194, 7, N'Sweeten SMP', 0, 0, 11)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (195, 7, N'WB', 0, 0, 12)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (196, 7, N'Plain curd', 1961, 0, 13)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (197, 7, N'Sweet Curd', 552, 0, 14)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (198, 7, N'Salted Butter Milk 200 ML', 855, 0, 15)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (199, 7, N'Plain Butter Milk', 6973, 0, 16)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (200, 7, N'Cold Coffee', 0, 0, 17)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (201, 7, N'Fl.Milk Pet Bottle', 29, 0, 18)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (202, 7, N'S.F.M Glass(Bottles)', 45, 0, 19)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (203, 7, N'Lassi 200 ML Glass', 127, 0, 20)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (204, 7, N'Lite Lassi 200 ML', 0, 0, 21)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (205, 7, N'Shrikhand', 302, 0, 22)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (206, 7, N'Chena Rabdi', 163, 0, 23)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (207, 7, N'Sabudana Kheer 100 gm', 0, 0, 24)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (208, 7, N'Peda', 287, 0, 25)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (209, 7, N'Milk Cake', 35, 0, 26)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (210, 7, N'Mawa', 12, 0, 27)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (211, 7, N'Paneer', 113, 0, 28)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (212, 7, N'Vaccum Paneer', 0, 0, 29)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (213, 7, N'Rasogulla', 0, 0, 30)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (214, 7, N'Gulabjamun', 0, 0, 31)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (215, 7, N'Shrikhand Lite 100 gms cups', 0, 0, 32)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (216, 7, N'Table Butter', 23, 0, 33)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (217, 7, N'Cookies', 0, 0, 34)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (218, 7, N'Sugar Free Peda', 2, 0, 35)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (219, 7, N'Butter Chiplet', 12, 0, 36)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (220, 7, N'Besan Laddu', 0, 0, 37)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (221, 7, N'Sanchi Neer lit', 0, 0, 38)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (222, 7, N'Misti Doi 100gm', 0, 0, 39)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (223, 7, N'Braj Peda', 1, 0, 40)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (224, 7, N'Amrakhand 100 gms', 2, 0, 41)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (225, 8, N'SMP', 10, 0, 10)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (226, 8, N'Sweeten SMP', 5, 0, 11)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (227, 8, N'WB', 23, 0, 12)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (228, 8, N'Plain curd', 10, 0, 13)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (229, 8, N'Sweet Curd', 14, 0, 14)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (230, 8, N'Salted Butter Milk 200 ML', 15, 0, 15)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (231, 8, N'Plain Butter Milk', 0, 0, 16)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (232, 8, N'Cold Coffee', 0, 0, 17)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (233, 8, N'Fl.Milk Pet Bottle', 0, 0, 18)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (234, 8, N'S.F.M Glass(Bottles)', 0, 0, 19)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (235, 8, N'Lassi 200 ML Glass', 0, 0, 20)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (236, 8, N'Lite Lassi 200 ML', 0, 0, 21)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (237, 8, N'Shrikhand', 0, 0, 22)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (238, 8, N'Chena Rabdi', 0, 0, 23)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (239, 8, N'Sabudana Kheer 100 gm', 0, 0, 24)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (240, 8, N'Peda', 0, 0, 25)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (241, 8, N'Milk Cake', 0, 0, 26)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (242, 8, N'Mawa', 0, 0, 27)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (243, 8, N'Paneer', 0, 0, 28)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (244, 8, N'Vaccum Paneer', 0, 0, 29)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (245, 8, N'Rasogulla', 0, 0, 30)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (246, 8, N'Gulabjamun', 0, 0, 31)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (247, 8, N'Shrikhand Lite 100 gms cups', 0, 0, 32)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (248, 8, N'Table Butter', 0, 0, 33)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (249, 8, N'Cookies', 0, 0, 34)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (250, 8, N'Sugar Free Peda', 0, 0, 35)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (251, 8, N'Butter Chiplet', 0, 0, 36)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (252, 8, N'Besan Laddu', 0, 0, 37)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (253, 8, N'Sanchi Neer lit', 0, 0, 38)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (254, 8, N'Misti Doi 100gm', 0, 0, 39)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (255, 8, N'Braj Peda', 0, 0, 40)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (256, 8, N'Amrakhand 100 gms', 0, 0, 41)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (257, 9, N'SMP', 10, 0, 10)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (258, 9, N'Sweeten SMP', 20, 0, 11)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (259, 9, N'WB', 30, 0, 12)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (260, 9, N'Plain curd', 40, 0, 13)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (261, 9, N'Sweet Curd', 50, 0, 14)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (262, 9, N'Salted Butter Milk 200 ML', 60, 0, 15)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (263, 9, N'Plain Butter Milk', 70, 0, 16)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (264, 9, N'Cold Coffee', 80, 0, 17)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (265, 9, N'Fl.Milk Pet Bottle', 0, 0, 18)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (266, 9, N'S.F.M Glass(Bottles)', 0, 0, 19)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (267, 9, N'Lassi 200 ML Glass', 0, 0, 20)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (268, 9, N'Lite Lassi 200 ML', 0, 0, 21)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (269, 9, N'Shrikhand', 0, 0, 22)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (270, 9, N'Chena Rabdi', 0, 0, 23)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (271, 9, N'Sabudana Kheer 100 gm', 0, 0, 24)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (272, 9, N'Peda', 0, 0, 25)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (273, 9, N'Milk Cake', 0, 0, 26)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (274, 9, N'Mawa', 0, 0, 27)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (275, 9, N'Paneer', 0, 0, 28)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (276, 9, N'Vaccum Paneer', 0, 0, 29)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (277, 9, N'Rasogulla', 0, 0, 30)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (278, 9, N'Gulabjamun', 0, 0, 31)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (279, 9, N'Shrikhand Lite 100 gms cups', 0, 0, 32)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (280, 9, N'Table Butter', 0, 0, 33)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (281, 9, N'Cookies', 0, 0, 34)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (282, 9, N'Sugar Free Peda', 0, 0, 35)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (283, 9, N'Butter Chiplet', 0, 0, 36)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (284, 9, N'Besan Laddu', 0, 0, 37)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (285, 9, N'Sanchi Neer lit', 0, 0, 38)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (286, 9, N'Misti Doi 100gm', 0, 0, 39)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (287, 9, N'Braj Peda', 0, 0, 40)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (288, 9, N'Amrakhand 100 gms', 0, 0, 41)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (289, 10, N'SMP', 0, 0, 10)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (290, 10, N'Sweeten SMP', 0, 0, 11)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (291, 10, N'WB', 0, 0, 12)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (292, 10, N'Plain curd', 1159, 0, 13)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (293, 10, N'Sweet Curd', 320, 0, 14)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (294, 10, N'Salted Butter Milk 200 ML', 720, 0, 15)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (295, 10, N'Plain Butter Milk', 3760, 0, 16)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (296, 10, N'Cold Coffee', 0, 0, 17)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (297, 10, N'Fl.Milk Pet Bottle', 0, 0, 18)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (298, 10, N'S.F.M Glass(Bottles)', 54, 0, 19)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (299, 10, N'Lassi 200 ML Glass', 86, 0, 20)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (300, 10, N'Lite Lassi 200 ML', 0, 0, 21)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (301, 10, N'Shrikhand', 184, 0, 22)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (302, 10, N'Chena Rabdi', 86, 0, 23)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (303, 10, N'Sabudana Kheer 100 gm', 0, 0, 24)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (304, 10, N'Peda', 187, 0, 25)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (305, 10, N'Milk Cake', 13, 0, 26)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (306, 10, N'Mawa', 6, 0, 27)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (307, 10, N'Paneer', 123, 0, 28)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (308, 10, N'Vaccum Paneer', 0, 0, 29)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (309, 10, N'Rasogulla', 0, 0, 30)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (310, 10, N'Gulabjamun', 0, 0, 31)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (311, 10, N'Shrikhand Lite 100 gms cups', 0, 0, 32)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (312, 10, N'Table Butter', 12, 0, 33)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (313, 10, N'Cookies', 0, 0, 34)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (314, 10, N'Sugar Free Peda', 2, 0, 35)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (315, 10, N'Butter Chiplet', 19, 0, 36)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (316, 10, N'Besan Laddu', 0, 0, 37)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (317, 10, N'Sanchi Neer lit', 0, 0, 38)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (318, 10, N'Misti Doi 100gm', 0, 0, 39)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (319, 10, N'Braj Peda', 5, 0, 40)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (320, 10, N'Amrakhand 100 gms', 4, 0, 41)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (321, 11, N'STD', 10, 0, 1)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (322, 11, N'DTM', 20, 0, 2)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (323, 11, N'LITE', 30, 0, 3)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (324, 11, N'FCM', 0, 0, 4)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (325, 11, N'Diamond', 0, 0, 5)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (326, 11, N'TM', 0, 0, 6)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (327, 11, N'CHAH', 0, 0, 7)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (328, 11, N'FCM 1L', 0, 0, 8)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (329, 11, N'Chai spl. 1000ML', 0, 0, 9)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (330, 12, N'STD', 0, 0, 1)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (331, 12, N'DTM', 0, 0, 2)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (332, 12, N'LITE', 0, 0, 3)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (333, 12, N'FCM', 0, 0, 4)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (334, 12, N'Diamond', 0, 0, 5)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (335, 12, N'TM', 0, 0, 6)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (336, 12, N'CHAH', 0, 0, 7)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (337, 12, N'FCM 1L', 0, 0, 8)
GO
INSERT [dbo].[trn_DemandsChild] ([DemandsChildID], [DemandId], [ItemName], [Quantity], [AdvancedCard], [ItemID]) VALUES (338, 12, N'Chai spl. 1000ML', 0, 0, 9)
GO
SET IDENTITY_INSERT [dbo].[trn_DemandsChild] OFF
GO
SET IDENTITY_INSERT [dbo].[Trn_InflowDetails] ON 
GO
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock], [lysdqty], [LYSDDate], [LYSDFatPercent], [LYSDSNFPercent], [LYSDFatKG], [LYSDSNFKG], [TargetDate], [TargetMilk], [MilkCumulative], [WBOBal], [WBManuf], [SMPBal], [SMPManuf], [WMPBal], [WMPManuf], [GheeBal], [GheeManuf]) VALUES (21, 8, CAST(N'2024-10-07' AS Date), 199100, CAST(10373.11 AS Decimal(18, 2)), CAST(16366.02 AS Decimal(18, 2)), CAST(5.21 AS Decimal(18, 2)), CAST(8.22 AS Decimal(18, 2)), 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, CAST(0.00 AS Decimal(18, 2)), CAST(N'2023-10-07' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-10-07' AS Date), CAST(409695.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock], [lysdqty], [LYSDDate], [LYSDFatPercent], [LYSDSNFPercent], [LYSDFatKG], [LYSDSNFKG], [TargetDate], [TargetMilk], [MilkCumulative], [WBOBal], [WBManuf], [SMPBal], [SMPManuf], [WMPBal], [WMPManuf], [GheeBal], [GheeManuf]) VALUES (22, 9, CAST(N'2024-10-07' AS Date), 9297, CAST(449.05 AS Decimal(18, 2)), CAST(749.34 AS Decimal(18, 2)), CAST(4.83 AS Decimal(18, 2)), CAST(8.06 AS Decimal(18, 2)), 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-10-07' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-10-23' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock], [lysdqty], [LYSDDate], [LYSDFatPercent], [LYSDSNFPercent], [LYSDFatKG], [LYSDSNFKG], [TargetDate], [TargetMilk], [MilkCumulative], [WBOBal], [WBManuf], [SMPBal], [SMPManuf], [WMPBal], [WMPManuf], [GheeBal], [GheeManuf]) VALUES (23, 10, CAST(N'2024-10-07' AS Date), 24231, CAST(1492.63 AS Decimal(18, 2)), CAST(2064.48 AS Decimal(18, 2)), CAST(6.16 AS Decimal(18, 2)), CAST(8.52 AS Decimal(18, 2)), 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-10-07' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-10-23' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock], [lysdqty], [LYSDDate], [LYSDFatPercent], [LYSDSNFPercent], [LYSDFatKG], [LYSDSNFKG], [TargetDate], [TargetMilk], [MilkCumulative], [WBOBal], [WBManuf], [SMPBal], [SMPManuf], [WMPBal], [WMPManuf], [GheeBal], [GheeManuf]) VALUES (24, 11, CAST(N'2024-10-07' AS Date), 21910, CAST(1113.03 AS Decimal(18, 2)), CAST(1805.38 AS Decimal(18, 2)), CAST(5.08 AS Decimal(18, 2)), CAST(8.24 AS Decimal(18, 2)), 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-10-07' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-10-23' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock], [lysdqty], [LYSDDate], [LYSDFatPercent], [LYSDSNFPercent], [LYSDFatKG], [LYSDSNFKG], [TargetDate], [TargetMilk], [MilkCumulative], [WBOBal], [WBManuf], [SMPBal], [SMPManuf], [WMPBal], [WMPManuf], [GheeBal], [GheeManuf]) VALUES (25, 12, CAST(N'2024-10-07' AS Date), 26287, CAST(1351.15 AS Decimal(18, 2)), CAST(2160.79 AS Decimal(18, 2)), CAST(5.14 AS Decimal(18, 2)), CAST(8.22 AS Decimal(18, 2)), 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-10-07' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-10-23' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock], [lysdqty], [LYSDDate], [LYSDFatPercent], [LYSDSNFPercent], [LYSDFatKG], [LYSDSNFKG], [TargetDate], [TargetMilk], [MilkCumulative], [WBOBal], [WBManuf], [SMPBal], [SMPManuf], [WMPBal], [WMPManuf], [GheeBal], [GheeManuf]) VALUES (26, 13, CAST(N'2024-10-07' AS Date), 707, CAST(30.05 AS Decimal(18, 2)), CAST(57.97 AS Decimal(18, 2)), CAST(4.25 AS Decimal(18, 2)), CAST(8.20 AS Decimal(18, 2)), 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-10-07' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-10-23' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock], [lysdqty], [LYSDDate], [LYSDFatPercent], [LYSDSNFPercent], [LYSDFatKG], [LYSDSNFKG], [TargetDate], [TargetMilk], [MilkCumulative], [WBOBal], [WBManuf], [SMPBal], [SMPManuf], [WMPBal], [WMPManuf], [GheeBal], [GheeManuf]) VALUES (27, 14, CAST(N'2024-10-07' AS Date), 1195, CAST(64.05 AS Decimal(18, 2)), CAST(98.95 AS Decimal(18, 2)), CAST(5.36 AS Decimal(18, 2)), CAST(8.28 AS Decimal(18, 2)), 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-10-07' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-10-23' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock], [lysdqty], [LYSDDate], [LYSDFatPercent], [LYSDSNFPercent], [LYSDFatKG], [LYSDSNFKG], [TargetDate], [TargetMilk], [MilkCumulative], [WBOBal], [WBManuf], [SMPBal], [SMPManuf], [WMPBal], [WMPManuf], [GheeBal], [GheeManuf]) VALUES (28, 15, CAST(N'2024-10-07' AS Date), 3421, CAST(150.52 AS Decimal(18, 2)), CAST(287.02 AS Decimal(18, 2)), CAST(4.40 AS Decimal(18, 2)), CAST(8.39 AS Decimal(18, 2)), 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-10-07' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-10-23' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock], [lysdqty], [LYSDDate], [LYSDFatPercent], [LYSDSNFPercent], [LYSDFatKG], [LYSDSNFKG], [TargetDate], [TargetMilk], [MilkCumulative], [WBOBal], [WBManuf], [SMPBal], [SMPManuf], [WMPBal], [WMPManuf], [GheeBal], [GheeManuf]) VALUES (29, 16, CAST(N'2024-10-07' AS Date), 1201, CAST(66.90 AS Decimal(18, 2)), CAST(99.80 AS Decimal(18, 2)), CAST(5.57 AS Decimal(18, 2)), CAST(8.31 AS Decimal(18, 2)), 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-10-07' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-10-23' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock], [lysdqty], [LYSDDate], [LYSDFatPercent], [LYSDSNFPercent], [LYSDFatKG], [LYSDSNFKG], [TargetDate], [TargetMilk], [MilkCumulative], [WBOBal], [WBManuf], [SMPBal], [SMPManuf], [WMPBal], [WMPManuf], [GheeBal], [GheeManuf]) VALUES (30, 17, CAST(N'2024-10-07' AS Date), 5838, CAST(329.26 AS Decimal(18, 2)), CAST(506.15 AS Decimal(18, 2)), CAST(5.64 AS Decimal(18, 2)), CAST(8.67 AS Decimal(18, 2)), 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-10-07' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-10-23' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock], [lysdqty], [LYSDDate], [LYSDFatPercent], [LYSDSNFPercent], [LYSDFatKG], [LYSDSNFKG], [TargetDate], [TargetMilk], [MilkCumulative], [WBOBal], [WBManuf], [SMPBal], [SMPManuf], [WMPBal], [WMPManuf], [GheeBal], [GheeManuf]) VALUES (31, 18, CAST(N'2024-10-07' AS Date), 17496, CAST(866.05 AS Decimal(18, 2)), CAST(1452.17 AS Decimal(18, 2)), CAST(4.95 AS Decimal(18, 2)), CAST(8.30 AS Decimal(18, 2)), 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-10-07' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-10-23' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock], [lysdqty], [LYSDDate], [LYSDFatPercent], [LYSDSNFPercent], [LYSDFatKG], [LYSDSNFKG], [TargetDate], [TargetMilk], [MilkCumulative], [WBOBal], [WBManuf], [SMPBal], [SMPManuf], [WMPBal], [WMPManuf], [GheeBal], [GheeManuf]) VALUES (32, 19, CAST(N'2024-10-07' AS Date), 1760, CAST(85.36 AS Decimal(18, 2)), CAST(141.86 AS Decimal(18, 2)), CAST(4.85 AS Decimal(18, 2)), CAST(8.06 AS Decimal(18, 2)), 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, CAST(0.00 AS Decimal(18, 2)), CAST(N'2023-10-07' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-10-23' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock], [lysdqty], [LYSDDate], [LYSDFatPercent], [LYSDSNFPercent], [LYSDFatKG], [LYSDSNFKG], [TargetDate], [TargetMilk], [MilkCumulative], [WBOBal], [WBManuf], [SMPBal], [SMPManuf], [WMPBal], [WMPManuf], [GheeBal], [GheeManuf]) VALUES (33, 20, CAST(N'2024-10-07' AS Date), 3116, CAST(170.45 AS Decimal(18, 2)), CAST(264.86 AS Decimal(18, 2)), CAST(5.47 AS Decimal(18, 2)), CAST(8.50 AS Decimal(18, 2)), 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, CAST(0.00 AS Decimal(18, 2)), CAST(N'2023-10-07' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-10-23' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock], [lysdqty], [LYSDDate], [LYSDFatPercent], [LYSDSNFPercent], [LYSDFatKG], [LYSDSNFKG], [TargetDate], [TargetMilk], [MilkCumulative], [WBOBal], [WBManuf], [SMPBal], [SMPManuf], [WMPBal], [WMPManuf], [GheeBal], [GheeManuf]) VALUES (34, 21, CAST(N'2024-10-07' AS Date), 1564, CAST(91.65 AS Decimal(18, 2)), CAST(133.25 AS Decimal(18, 2)), CAST(5.86 AS Decimal(18, 2)), CAST(8.52 AS Decimal(18, 2)), 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, CAST(0.00 AS Decimal(18, 2)), CAST(N'2023-10-07' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-10-23' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock], [lysdqty], [LYSDDate], [LYSDFatPercent], [LYSDSNFPercent], [LYSDFatKG], [LYSDSNFKG], [TargetDate], [TargetMilk], [MilkCumulative], [WBOBal], [WBManuf], [SMPBal], [SMPManuf], [WMPBal], [WMPManuf], [GheeBal], [GheeManuf]) VALUES (35, 22, CAST(N'2024-10-07' AS Date), 9457, CAST(570.26 AS Decimal(18, 2)), CAST(814.25 AS Decimal(18, 2)), CAST(6.03 AS Decimal(18, 2)), CAST(8.61 AS Decimal(18, 2)), 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, CAST(0.00 AS Decimal(18, 2)), CAST(N'2023-10-07' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-10-23' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock], [lysdqty], [LYSDDate], [LYSDFatPercent], [LYSDSNFPercent], [LYSDFatKG], [LYSDSNFKG], [TargetDate], [TargetMilk], [MilkCumulative], [WBOBal], [WBManuf], [SMPBal], [SMPManuf], [WMPBal], [WMPManuf], [GheeBal], [GheeManuf]) VALUES (36, 23, CAST(N'2024-10-07' AS Date), 541, CAST(27.92 AS Decimal(18, 2)), CAST(44.69 AS Decimal(18, 2)), CAST(5.16 AS Decimal(18, 2)), CAST(8.26 AS Decimal(18, 2)), 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, CAST(0.00 AS Decimal(18, 2)), CAST(N'2023-10-07' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-10-23' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock], [lysdqty], [LYSDDate], [LYSDFatPercent], [LYSDSNFPercent], [LYSDFatKG], [LYSDSNFKG], [TargetDate], [TargetMilk], [MilkCumulative], [WBOBal], [WBManuf], [SMPBal], [SMPManuf], [WMPBal], [WMPManuf], [GheeBal], [GheeManuf]) VALUES (37, 24, CAST(N'2024-10-07' AS Date), 0, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, CAST(0.00 AS Decimal(18, 2)), CAST(N'2023-10-07' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-10-23' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock], [lysdqty], [LYSDDate], [LYSDFatPercent], [LYSDSNFPercent], [LYSDFatKG], [LYSDSNFKG], [TargetDate], [TargetMilk], [MilkCumulative], [WBOBal], [WBManuf], [SMPBal], [SMPManuf], [WMPBal], [WMPManuf], [GheeBal], [GheeManuf]) VALUES (38, 25, CAST(N'2024-10-07' AS Date), 3821, CAST(196.40 AS Decimal(18, 2)), CAST(333.96 AS Decimal(18, 2)), CAST(5.14 AS Decimal(18, 2)), CAST(8.74 AS Decimal(18, 2)), 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, CAST(0.00 AS Decimal(18, 2)), CAST(N'2023-10-07' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-10-23' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock], [lysdqty], [LYSDDate], [LYSDFatPercent], [LYSDSNFPercent], [LYSDFatKG], [LYSDSNFKG], [TargetDate], [TargetMilk], [MilkCumulative], [WBOBal], [WBManuf], [SMPBal], [SMPManuf], [WMPBal], [WMPManuf], [GheeBal], [GheeManuf]) VALUES (39, 8, CAST(N'2024-10-06' AS Date), 191800, CAST(9800.98 AS Decimal(18, 2)), CAST(15708.42 AS Decimal(18, 2)), CAST(5.11 AS Decimal(18, 2)), CAST(8.19 AS Decimal(18, 2)), 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, CAST(0.00 AS Decimal(18, 2)), CAST(N'2023-10-06' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-10-06' AS Date), CAST(409695.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock], [lysdqty], [LYSDDate], [LYSDFatPercent], [LYSDSNFPercent], [LYSDFatKG], [LYSDSNFKG], [TargetDate], [TargetMilk], [MilkCumulative], [WBOBal], [WBManuf], [SMPBal], [SMPManuf], [WMPBal], [WMPManuf], [GheeBal], [GheeManuf]) VALUES (40, 9, CAST(N'2024-10-06' AS Date), 9240, CAST(499.88 AS Decimal(18, 2)), CAST(744.74 AS Decimal(18, 2)), CAST(5.41 AS Decimal(18, 2)), CAST(8.06 AS Decimal(18, 2)), 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, CAST(0.00 AS Decimal(18, 2)), CAST(N'2023-10-06' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-10-23' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock], [lysdqty], [LYSDDate], [LYSDFatPercent], [LYSDSNFPercent], [LYSDFatKG], [LYSDSNFKG], [TargetDate], [TargetMilk], [MilkCumulative], [WBOBal], [WBManuf], [SMPBal], [SMPManuf], [WMPBal], [WMPManuf], [GheeBal], [GheeManuf]) VALUES (41, 10, CAST(N'2024-10-06' AS Date), 26419, CAST(1616.84 AS Decimal(18, 2)), CAST(2269.39 AS Decimal(18, 2)), CAST(6.12 AS Decimal(18, 2)), CAST(8.59 AS Decimal(18, 2)), 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, CAST(0.00 AS Decimal(18, 2)), CAST(N'2023-10-06' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-10-23' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock], [lysdqty], [LYSDDate], [LYSDFatPercent], [LYSDSNFPercent], [LYSDFatKG], [LYSDSNFKG], [TargetDate], [TargetMilk], [MilkCumulative], [WBOBal], [WBManuf], [SMPBal], [SMPManuf], [WMPBal], [WMPManuf], [GheeBal], [GheeManuf]) VALUES (42, 11, CAST(N'2024-10-06' AS Date), 22510, CAST(1150.26 AS Decimal(18, 2)), CAST(1866.08 AS Decimal(18, 2)), CAST(5.11 AS Decimal(18, 2)), CAST(8.29 AS Decimal(18, 2)), 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, CAST(0.00 AS Decimal(18, 2)), CAST(N'2023-10-06' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-10-23' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock], [lysdqty], [LYSDDate], [LYSDFatPercent], [LYSDSNFPercent], [LYSDFatKG], [LYSDSNFKG], [TargetDate], [TargetMilk], [MilkCumulative], [WBOBal], [WBManuf], [SMPBal], [SMPManuf], [WMPBal], [WMPManuf], [GheeBal], [GheeManuf]) VALUES (43, 12, CAST(N'2024-10-06' AS Date), 24723, CAST(1275.71 AS Decimal(18, 2)), CAST(2032.23 AS Decimal(18, 2)), CAST(5.16 AS Decimal(18, 2)), CAST(8.22 AS Decimal(18, 2)), 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, CAST(0.00 AS Decimal(18, 2)), CAST(N'2023-10-06' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-10-23' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock], [lysdqty], [LYSDDate], [LYSDFatPercent], [LYSDSNFPercent], [LYSDFatKG], [LYSDSNFKG], [TargetDate], [TargetMilk], [MilkCumulative], [WBOBal], [WBManuf], [SMPBal], [SMPManuf], [WMPBal], [WMPManuf], [GheeBal], [GheeManuf]) VALUES (44, 13, CAST(N'2024-10-06' AS Date), 676, CAST(28.26 AS Decimal(18, 2)), CAST(55.09 AS Decimal(18, 2)), CAST(4.18 AS Decimal(18, 2)), CAST(8.15 AS Decimal(18, 2)), 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, CAST(0.00 AS Decimal(18, 2)), CAST(N'2023-10-06' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-10-23' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock], [lysdqty], [LYSDDate], [LYSDFatPercent], [LYSDSNFPercent], [LYSDFatKG], [LYSDSNFKG], [TargetDate], [TargetMilk], [MilkCumulative], [WBOBal], [WBManuf], [SMPBal], [SMPManuf], [WMPBal], [WMPManuf], [GheeBal], [GheeManuf]) VALUES (45, 14, CAST(N'2024-10-06' AS Date), 1184, CAST(64.17 AS Decimal(18, 2)), CAST(98.86 AS Decimal(18, 2)), CAST(5.42 AS Decimal(18, 2)), CAST(8.35 AS Decimal(18, 2)), 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, CAST(0.00 AS Decimal(18, 2)), CAST(N'2023-10-06' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-10-23' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock], [lysdqty], [LYSDDate], [LYSDFatPercent], [LYSDSNFPercent], [LYSDFatKG], [LYSDSNFKG], [TargetDate], [TargetMilk], [MilkCumulative], [WBOBal], [WBManuf], [SMPBal], [SMPManuf], [WMPBal], [WMPManuf], [GheeBal], [GheeManuf]) VALUES (46, 15, CAST(N'2024-10-06' AS Date), 3740, CAST(165.68 AS Decimal(18, 2)), CAST(316.03 AS Decimal(18, 2)), CAST(4.43 AS Decimal(18, 2)), CAST(8.45 AS Decimal(18, 2)), 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, CAST(0.00 AS Decimal(18, 2)), CAST(N'2023-10-06' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-10-23' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock], [lysdqty], [LYSDDate], [LYSDFatPercent], [LYSDSNFPercent], [LYSDFatKG], [LYSDSNFKG], [TargetDate], [TargetMilk], [MilkCumulative], [WBOBal], [WBManuf], [SMPBal], [SMPManuf], [WMPBal], [WMPManuf], [GheeBal], [GheeManuf]) VALUES (47, 16, CAST(N'2024-10-06' AS Date), 1270, CAST(66.68 AS Decimal(18, 2)), CAST(104.52 AS Decimal(18, 2)), CAST(5.25 AS Decimal(18, 2)), CAST(8.23 AS Decimal(18, 2)), 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, CAST(0.00 AS Decimal(18, 2)), CAST(N'2023-10-06' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-10-23' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock], [lysdqty], [LYSDDate], [LYSDFatPercent], [LYSDSNFPercent], [LYSDFatKG], [LYSDSNFKG], [TargetDate], [TargetMilk], [MilkCumulative], [WBOBal], [WBManuf], [SMPBal], [SMPManuf], [WMPBal], [WMPManuf], [GheeBal], [GheeManuf]) VALUES (48, 17, CAST(N'2024-10-06' AS Date), 5794, CAST(329.10 AS Decimal(18, 2)), CAST(502.92 AS Decimal(18, 2)), CAST(5.68 AS Decimal(18, 2)), CAST(8.68 AS Decimal(18, 2)), 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, CAST(0.00 AS Decimal(18, 2)), CAST(N'2023-10-06' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-10-23' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock], [lysdqty], [LYSDDate], [LYSDFatPercent], [LYSDSNFPercent], [LYSDFatKG], [LYSDSNFKG], [TargetDate], [TargetMilk], [MilkCumulative], [WBOBal], [WBManuf], [SMPBal], [SMPManuf], [WMPBal], [WMPManuf], [GheeBal], [GheeManuf]) VALUES (49, 18, CAST(N'2024-10-06' AS Date), 17725, CAST(879.16 AS Decimal(18, 2)), CAST(1460.54 AS Decimal(18, 2)), CAST(4.96 AS Decimal(18, 2)), CAST(8.24 AS Decimal(18, 2)), 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, CAST(0.00 AS Decimal(18, 2)), CAST(N'2023-10-06' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-10-23' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock], [lysdqty], [LYSDDate], [LYSDFatPercent], [LYSDSNFPercent], [LYSDFatKG], [LYSDSNFKG], [TargetDate], [TargetMilk], [MilkCumulative], [WBOBal], [WBManuf], [SMPBal], [SMPManuf], [WMPBal], [WMPManuf], [GheeBal], [GheeManuf]) VALUES (50, 19, CAST(N'2024-10-06' AS Date), 2226, CAST(119.54 AS Decimal(18, 2)), CAST(187.21 AS Decimal(18, 2)), CAST(5.37 AS Decimal(18, 2)), CAST(8.41 AS Decimal(18, 2)), 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, CAST(0.00 AS Decimal(18, 2)), CAST(N'2023-10-06' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-10-23' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock], [lysdqty], [LYSDDate], [LYSDFatPercent], [LYSDSNFPercent], [LYSDFatKG], [LYSDSNFKG], [TargetDate], [TargetMilk], [MilkCumulative], [WBOBal], [WBManuf], [SMPBal], [SMPManuf], [WMPBal], [WMPManuf], [GheeBal], [GheeManuf]) VALUES (51, 20, CAST(N'2024-10-06' AS Date), 3078, CAST(170.83 AS Decimal(18, 2)), CAST(261.32 AS Decimal(18, 2)), CAST(5.55 AS Decimal(18, 2)), CAST(8.49 AS Decimal(18, 2)), 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, CAST(0.00 AS Decimal(18, 2)), CAST(N'2023-10-06' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-10-23' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock], [lysdqty], [LYSDDate], [LYSDFatPercent], [LYSDSNFPercent], [LYSDFatKG], [LYSDSNFKG], [TargetDate], [TargetMilk], [MilkCumulative], [WBOBal], [WBManuf], [SMPBal], [SMPManuf], [WMPBal], [WMPManuf], [GheeBal], [GheeManuf]) VALUES (52, 21, CAST(N'2024-10-06' AS Date), 1548, CAST(90.87 AS Decimal(18, 2)), CAST(132.20 AS Decimal(18, 2)), CAST(5.87 AS Decimal(18, 2)), CAST(8.54 AS Decimal(18, 2)), 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, CAST(0.00 AS Decimal(18, 2)), CAST(N'2023-10-06' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-10-23' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock], [lysdqty], [LYSDDate], [LYSDFatPercent], [LYSDSNFPercent], [LYSDFatKG], [LYSDSNFKG], [TargetDate], [TargetMilk], [MilkCumulative], [WBOBal], [WBManuf], [SMPBal], [SMPManuf], [WMPBal], [WMPManuf], [GheeBal], [GheeManuf]) VALUES (53, 22, CAST(N'2024-10-06' AS Date), 15242, CAST(919.09 AS Decimal(18, 2)), CAST(1269.66 AS Decimal(18, 2)), CAST(6.03 AS Decimal(18, 2)), CAST(8.33 AS Decimal(18, 2)), 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, CAST(0.00 AS Decimal(18, 2)), CAST(N'2023-10-06' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-10-23' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock], [lysdqty], [LYSDDate], [LYSDFatPercent], [LYSDSNFPercent], [LYSDFatKG], [LYSDSNFKG], [TargetDate], [TargetMilk], [MilkCumulative], [WBOBal], [WBManuf], [SMPBal], [SMPManuf], [WMPBal], [WMPManuf], [GheeBal], [GheeManuf]) VALUES (54, 23, CAST(N'2024-10-06' AS Date), 523, CAST(26.46 AS Decimal(18, 2)), CAST(43.25 AS Decimal(18, 2)), CAST(5.06 AS Decimal(18, 2)), CAST(8.27 AS Decimal(18, 2)), 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, CAST(0.00 AS Decimal(18, 2)), CAST(N'2023-10-06' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-10-23' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock], [lysdqty], [LYSDDate], [LYSDFatPercent], [LYSDSNFPercent], [LYSDFatKG], [LYSDSNFKG], [TargetDate], [TargetMilk], [MilkCumulative], [WBOBal], [WBManuf], [SMPBal], [SMPManuf], [WMPBal], [WMPManuf], [GheeBal], [GheeManuf]) VALUES (55, 24, CAST(N'2024-10-06' AS Date), 0, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, CAST(0.00 AS Decimal(18, 2)), CAST(N'2023-10-06' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-10-23' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock], [lysdqty], [LYSDDate], [LYSDFatPercent], [LYSDSNFPercent], [LYSDFatKG], [LYSDSNFKG], [TargetDate], [TargetMilk], [MilkCumulative], [WBOBal], [WBManuf], [SMPBal], [SMPManuf], [WMPBal], [WMPManuf], [GheeBal], [GheeManuf]) VALUES (56, 25, CAST(N'2024-10-06' AS Date), 3914, CAST(200.01 AS Decimal(18, 2)), CAST(344.43 AS Decimal(18, 2)), CAST(5.11 AS Decimal(18, 2)), CAST(8.80 AS Decimal(18, 2)), 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, CAST(0.00 AS Decimal(18, 2)), CAST(N'2023-10-06' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-10-23' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock], [lysdqty], [LYSDDate], [LYSDFatPercent], [LYSDSNFPercent], [LYSDFatKG], [LYSDSNFKG], [TargetDate], [TargetMilk], [MilkCumulative], [WBOBal], [WBManuf], [SMPBal], [SMPManuf], [WMPBal], [WMPManuf], [GheeBal], [GheeManuf]) VALUES (57, 8, CAST(N'2024-10-05' AS Date), 192600, CAST(9745.56 AS Decimal(18, 2)), CAST(15658.38 AS Decimal(18, 2)), CAST(5.06 AS Decimal(18, 2)), CAST(8.13 AS Decimal(18, 2)), 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, CAST(0.00 AS Decimal(18, 2)), CAST(N'2023-10-05' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-10-05' AS Date), CAST(409695.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock], [lysdqty], [LYSDDate], [LYSDFatPercent], [LYSDSNFPercent], [LYSDFatKG], [LYSDSNFKG], [TargetDate], [TargetMilk], [MilkCumulative], [WBOBal], [WBManuf], [SMPBal], [SMPManuf], [WMPBal], [WMPManuf], [GheeBal], [GheeManuf]) VALUES (58, 9, CAST(N'2024-10-05' AS Date), 9234, CAST(448.77 AS Decimal(18, 2)), CAST(744.26 AS Decimal(18, 2)), CAST(4.86 AS Decimal(18, 2)), CAST(8.06 AS Decimal(18, 2)), 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, CAST(0.00 AS Decimal(18, 2)), CAST(N'2023-10-05' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-10-23' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock], [lysdqty], [LYSDDate], [LYSDFatPercent], [LYSDSNFPercent], [LYSDFatKG], [LYSDSNFKG], [TargetDate], [TargetMilk], [MilkCumulative], [WBOBal], [WBManuf], [SMPBal], [SMPManuf], [WMPBal], [WMPManuf], [GheeBal], [GheeManuf]) VALUES (59, 10, CAST(N'2024-10-05' AS Date), 22023, CAST(1323.58 AS Decimal(18, 2)), CAST(1878.56 AS Decimal(18, 2)), CAST(6.01 AS Decimal(18, 2)), CAST(8.53 AS Decimal(18, 2)), 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, CAST(0.00 AS Decimal(18, 2)), CAST(N'2023-10-05' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-10-23' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock], [lysdqty], [LYSDDate], [LYSDFatPercent], [LYSDSNFPercent], [LYSDFatKG], [LYSDSNFKG], [TargetDate], [TargetMilk], [MilkCumulative], [WBOBal], [WBManuf], [SMPBal], [SMPManuf], [WMPBal], [WMPManuf], [GheeBal], [GheeManuf]) VALUES (60, 11, CAST(N'2024-10-05' AS Date), 21520, CAST(1080.30 AS Decimal(18, 2)), CAST(1768.94 AS Decimal(18, 2)), CAST(5.02 AS Decimal(18, 2)), CAST(8.22 AS Decimal(18, 2)), 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, CAST(0.00 AS Decimal(18, 2)), CAST(N'2023-10-05' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-10-23' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock], [lysdqty], [LYSDDate], [LYSDFatPercent], [LYSDSNFPercent], [LYSDFatKG], [LYSDSNFKG], [TargetDate], [TargetMilk], [MilkCumulative], [WBOBal], [WBManuf], [SMPBal], [SMPManuf], [WMPBal], [WMPManuf], [GheeBal], [GheeManuf]) VALUES (61, 12, CAST(N'2024-10-05' AS Date), 25232, CAST(1284.31 AS Decimal(18, 2)), CAST(2053.88 AS Decimal(18, 2)), CAST(5.09 AS Decimal(18, 2)), CAST(8.14 AS Decimal(18, 2)), 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, CAST(0.00 AS Decimal(18, 2)), CAST(N'2023-10-05' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-10-23' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock], [lysdqty], [LYSDDate], [LYSDFatPercent], [LYSDSNFPercent], [LYSDFatKG], [LYSDSNFKG], [TargetDate], [TargetMilk], [MilkCumulative], [WBOBal], [WBManuf], [SMPBal], [SMPManuf], [WMPBal], [WMPManuf], [GheeBal], [GheeManuf]) VALUES (62, 13, CAST(N'2024-10-05' AS Date), 687, CAST(29.06 AS Decimal(18, 2)), CAST(56.20 AS Decimal(18, 2)), CAST(4.23 AS Decimal(18, 2)), CAST(8.18 AS Decimal(18, 2)), 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, CAST(0.00 AS Decimal(18, 2)), CAST(N'2023-10-05' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-10-23' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock], [lysdqty], [LYSDDate], [LYSDFatPercent], [LYSDSNFPercent], [LYSDFatKG], [LYSDSNFKG], [TargetDate], [TargetMilk], [MilkCumulative], [WBOBal], [WBManuf], [SMPBal], [SMPManuf], [WMPBal], [WMPManuf], [GheeBal], [GheeManuf]) VALUES (63, 14, CAST(N'2024-10-05' AS Date), 1177, CAST(62.15 AS Decimal(18, 2)), CAST(97.34 AS Decimal(18, 2)), CAST(5.28 AS Decimal(18, 2)), CAST(8.27 AS Decimal(18, 2)), 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, CAST(0.00 AS Decimal(18, 2)), CAST(N'2023-10-05' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-10-23' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock], [lysdqty], [LYSDDate], [LYSDFatPercent], [LYSDSNFPercent], [LYSDFatKG], [LYSDSNFKG], [TargetDate], [TargetMilk], [MilkCumulative], [WBOBal], [WBManuf], [SMPBal], [SMPManuf], [WMPBal], [WMPManuf], [GheeBal], [GheeManuf]) VALUES (64, 15, CAST(N'2024-10-05' AS Date), 3591, CAST(160.52 AS Decimal(18, 2)), CAST(303.08 AS Decimal(18, 2)), CAST(4.47 AS Decimal(18, 2)), CAST(8.44 AS Decimal(18, 2)), 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, CAST(0.00 AS Decimal(18, 2)), CAST(N'2023-10-05' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-10-23' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock], [lysdqty], [LYSDDate], [LYSDFatPercent], [LYSDSNFPercent], [LYSDFatKG], [LYSDSNFKG], [TargetDate], [TargetMilk], [MilkCumulative], [WBOBal], [WBManuf], [SMPBal], [SMPManuf], [WMPBal], [WMPManuf], [GheeBal], [GheeManuf]) VALUES (65, 16, CAST(N'2024-10-05' AS Date), 1376, CAST(69.90 AS Decimal(18, 2)), CAST(112.97 AS Decimal(18, 2)), CAST(5.08 AS Decimal(18, 2)), CAST(8.21 AS Decimal(18, 2)), 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, CAST(0.00 AS Decimal(18, 2)), CAST(N'2023-10-05' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-10-23' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock], [lysdqty], [LYSDDate], [LYSDFatPercent], [LYSDSNFPercent], [LYSDFatKG], [LYSDSNFKG], [TargetDate], [TargetMilk], [MilkCumulative], [WBOBal], [WBManuf], [SMPBal], [SMPManuf], [WMPBal], [WMPManuf], [GheeBal], [GheeManuf]) VALUES (66, 17, CAST(N'2024-10-05' AS Date), 4848, CAST(274.88 AS Decimal(18, 2)), CAST(420.81 AS Decimal(18, 2)), CAST(5.67 AS Decimal(18, 2)), CAST(8.68 AS Decimal(18, 2)), 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, CAST(0.00 AS Decimal(18, 2)), CAST(N'2023-10-05' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-10-23' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock], [lysdqty], [LYSDDate], [LYSDFatPercent], [LYSDSNFPercent], [LYSDFatKG], [LYSDSNFKG], [TargetDate], [TargetMilk], [MilkCumulative], [WBOBal], [WBManuf], [SMPBal], [SMPManuf], [WMPBal], [WMPManuf], [GheeBal], [GheeManuf]) VALUES (67, 18, CAST(N'2024-10-05' AS Date), 17616, CAST(866.71 AS Decimal(18, 2)), CAST(1440.99 AS Decimal(18, 2)), CAST(4.92 AS Decimal(18, 2)), CAST(8.18 AS Decimal(18, 2)), 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, CAST(0.00 AS Decimal(18, 2)), CAST(N'2023-10-05' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-10-23' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock], [lysdqty], [LYSDDate], [LYSDFatPercent], [LYSDSNFPercent], [LYSDFatKG], [LYSDSNFKG], [TargetDate], [TargetMilk], [MilkCumulative], [WBOBal], [WBManuf], [SMPBal], [SMPManuf], [WMPBal], [WMPManuf], [GheeBal], [GheeManuf]) VALUES (68, 19, CAST(N'2024-10-05' AS Date), 2185, CAST(121.05 AS Decimal(18, 2)), CAST(185.29 AS Decimal(18, 2)), CAST(5.54 AS Decimal(18, 2)), CAST(8.48 AS Decimal(18, 2)), 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, CAST(0.00 AS Decimal(18, 2)), CAST(N'2023-10-05' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-10-23' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock], [lysdqty], [LYSDDate], [LYSDFatPercent], [LYSDSNFPercent], [LYSDFatKG], [LYSDSNFKG], [TargetDate], [TargetMilk], [MilkCumulative], [WBOBal], [WBManuf], [SMPBal], [SMPManuf], [WMPBal], [WMPManuf], [GheeBal], [GheeManuf]) VALUES (69, 20, CAST(N'2024-10-05' AS Date), 3114, CAST(171.58 AS Decimal(18, 2)), CAST(264.07 AS Decimal(18, 2)), CAST(5.51 AS Decimal(18, 2)), CAST(8.48 AS Decimal(18, 2)), 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, CAST(0.00 AS Decimal(18, 2)), CAST(N'2023-10-05' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-10-23' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock], [lysdqty], [LYSDDate], [LYSDFatPercent], [LYSDSNFPercent], [LYSDFatKG], [LYSDSNFKG], [TargetDate], [TargetMilk], [MilkCumulative], [WBOBal], [WBManuf], [SMPBal], [SMPManuf], [WMPBal], [WMPManuf], [GheeBal], [GheeManuf]) VALUES (70, 21, CAST(N'2024-10-05' AS Date), 1559, CAST(90.89 AS Decimal(18, 2)), CAST(132.98 AS Decimal(18, 2)), CAST(5.83 AS Decimal(18, 2)), CAST(8.53 AS Decimal(18, 2)), 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, CAST(0.00 AS Decimal(18, 2)), CAST(N'2023-10-05' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-10-23' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock], [lysdqty], [LYSDDate], [LYSDFatPercent], [LYSDSNFPercent], [LYSDFatKG], [LYSDSNFKG], [TargetDate], [TargetMilk], [MilkCumulative], [WBOBal], [WBManuf], [SMPBal], [SMPManuf], [WMPBal], [WMPManuf], [GheeBal], [GheeManuf]) VALUES (71, 22, CAST(N'2024-10-05' AS Date), 9548, CAST(563.33 AS Decimal(18, 2)), CAST(810.63 AS Decimal(18, 2)), CAST(5.90 AS Decimal(18, 2)), CAST(8.49 AS Decimal(18, 2)), 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, CAST(0.00 AS Decimal(18, 2)), CAST(N'2023-10-05' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-10-23' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock], [lysdqty], [LYSDDate], [LYSDFatPercent], [LYSDSNFPercent], [LYSDFatKG], [LYSDSNFKG], [TargetDate], [TargetMilk], [MilkCumulative], [WBOBal], [WBManuf], [SMPBal], [SMPManuf], [WMPBal], [WMPManuf], [GheeBal], [GheeManuf]) VALUES (72, 23, CAST(N'2024-10-05' AS Date), 558, CAST(28.57 AS Decimal(18, 2)), CAST(46.37 AS Decimal(18, 2)), CAST(5.12 AS Decimal(18, 2)), CAST(8.31 AS Decimal(18, 2)), 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, CAST(0.00 AS Decimal(18, 2)), CAST(N'2023-10-05' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-10-23' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock], [lysdqty], [LYSDDate], [LYSDFatPercent], [LYSDSNFPercent], [LYSDFatKG], [LYSDSNFKG], [TargetDate], [TargetMilk], [MilkCumulative], [WBOBal], [WBManuf], [SMPBal], [SMPManuf], [WMPBal], [WMPManuf], [GheeBal], [GheeManuf]) VALUES (73, 24, CAST(N'2024-10-05' AS Date), 0, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, CAST(0.00 AS Decimal(18, 2)), CAST(N'2023-10-05' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-10-23' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock], [lysdqty], [LYSDDate], [LYSDFatPercent], [LYSDSNFPercent], [LYSDFatKG], [LYSDSNFKG], [TargetDate], [TargetMilk], [MilkCumulative], [WBOBal], [WBManuf], [SMPBal], [SMPManuf], [WMPBal], [WMPManuf], [GheeBal], [GheeManuf]) VALUES (74, 25, CAST(N'2024-10-05' AS Date), 3575, CAST(176.96 AS Decimal(18, 2)), CAST(311.38 AS Decimal(18, 2)), CAST(4.95 AS Decimal(18, 2)), CAST(8.71 AS Decimal(18, 2)), 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, CAST(0.00 AS Decimal(18, 2)), CAST(N'2023-10-05' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-10-23' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock], [lysdqty], [LYSDDate], [LYSDFatPercent], [LYSDSNFPercent], [LYSDFatKG], [LYSDSNFKG], [TargetDate], [TargetMilk], [MilkCumulative], [WBOBal], [WBManuf], [SMPBal], [SMPManuf], [WMPBal], [WMPManuf], [GheeBal], [GheeManuf]) VALUES (75, 8, CAST(N'2024-10-04' AS Date), 207110, CAST(10686.88 AS Decimal(18, 2)), CAST(16879.47 AS Decimal(18, 2)), CAST(5.16 AS Decimal(18, 2)), CAST(8.15 AS Decimal(18, 2)), 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, CAST(0.00 AS Decimal(18, 2)), CAST(N'2023-10-04' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-10-04' AS Date), CAST(409695.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock], [lysdqty], [LYSDDate], [LYSDFatPercent], [LYSDSNFPercent], [LYSDFatKG], [LYSDSNFKG], [TargetDate], [TargetMilk], [MilkCumulative], [WBOBal], [WBManuf], [SMPBal], [SMPManuf], [WMPBal], [WMPManuf], [GheeBal], [GheeManuf]) VALUES (76, 9, CAST(N'2024-10-04' AS Date), 8853, CAST(409.89 AS Decimal(18, 2)), CAST(717.09 AS Decimal(18, 2)), CAST(4.63 AS Decimal(18, 2)), CAST(8.10 AS Decimal(18, 2)), 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, CAST(0.00 AS Decimal(18, 2)), CAST(N'2023-10-04' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-10-23' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock], [lysdqty], [LYSDDate], [LYSDFatPercent], [LYSDSNFPercent], [LYSDFatKG], [LYSDSNFKG], [TargetDate], [TargetMilk], [MilkCumulative], [WBOBal], [WBManuf], [SMPBal], [SMPManuf], [WMPBal], [WMPManuf], [GheeBal], [GheeManuf]) VALUES (77, 10, CAST(N'2024-10-04' AS Date), 17988, CAST(1072.08 AS Decimal(18, 2)), CAST(1528.98 AS Decimal(18, 2)), CAST(5.96 AS Decimal(18, 2)), CAST(8.50 AS Decimal(18, 2)), 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, CAST(0.00 AS Decimal(18, 2)), CAST(N'2023-10-04' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-10-23' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock], [lysdqty], [LYSDDate], [LYSDFatPercent], [LYSDSNFPercent], [LYSDFatKG], [LYSDSNFKG], [TargetDate], [TargetMilk], [MilkCumulative], [WBOBal], [WBManuf], [SMPBal], [SMPManuf], [WMPBal], [WMPManuf], [GheeBal], [GheeManuf]) VALUES (78, 11, CAST(N'2024-10-04' AS Date), 22440, CAST(1122.00 AS Decimal(18, 2)), CAST(1846.81 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), CAST(8.23 AS Decimal(18, 2)), 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, CAST(0.00 AS Decimal(18, 2)), CAST(N'2023-10-04' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-10-23' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock], [lysdqty], [LYSDDate], [LYSDFatPercent], [LYSDSNFPercent], [LYSDFatKG], [LYSDSNFKG], [TargetDate], [TargetMilk], [MilkCumulative], [WBOBal], [WBManuf], [SMPBal], [SMPManuf], [WMPBal], [WMPManuf], [GheeBal], [GheeManuf]) VALUES (79, 12, CAST(N'2024-10-04' AS Date), 25179, CAST(1291.68 AS Decimal(18, 2)), CAST(2067.20 AS Decimal(18, 2)), CAST(5.13 AS Decimal(18, 2)), CAST(8.21 AS Decimal(18, 2)), 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, CAST(0.00 AS Decimal(18, 2)), CAST(N'2023-10-04' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-10-23' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock], [lysdqty], [LYSDDate], [LYSDFatPercent], [LYSDSNFPercent], [LYSDFatKG], [LYSDSNFKG], [TargetDate], [TargetMilk], [MilkCumulative], [WBOBal], [WBManuf], [SMPBal], [SMPManuf], [WMPBal], [WMPManuf], [GheeBal], [GheeManuf]) VALUES (81, 13, CAST(N'2024-10-04' AS Date), 726, CAST(30.78 AS Decimal(18, 2)), CAST(59.46 AS Decimal(18, 2)), CAST(4.24 AS Decimal(18, 2)), CAST(8.19 AS Decimal(18, 2)), 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, CAST(0.00 AS Decimal(18, 2)), CAST(N'2023-10-04' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-10-23' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock], [lysdqty], [LYSDDate], [LYSDFatPercent], [LYSDSNFPercent], [LYSDFatKG], [LYSDSNFKG], [TargetDate], [TargetMilk], [MilkCumulative], [WBOBal], [WBManuf], [SMPBal], [SMPManuf], [WMPBal], [WMPManuf], [GheeBal], [GheeManuf]) VALUES (82, 14, CAST(N'2024-10-04' AS Date), 1199, CAST(64.75 AS Decimal(18, 2)), CAST(99.28 AS Decimal(18, 2)), CAST(5.40 AS Decimal(18, 2)), CAST(8.28 AS Decimal(18, 2)), 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, CAST(0.00 AS Decimal(18, 2)), CAST(N'2023-10-04' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-10-23' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock], [lysdqty], [LYSDDate], [LYSDFatPercent], [LYSDSNFPercent], [LYSDFatKG], [LYSDSNFKG], [TargetDate], [TargetMilk], [MilkCumulative], [WBOBal], [WBManuf], [SMPBal], [SMPManuf], [WMPBal], [WMPManuf], [GheeBal], [GheeManuf]) VALUES (83, 15, CAST(N'2024-10-04' AS Date), 3727, CAST(166.22 AS Decimal(18, 2)), CAST(313.81 AS Decimal(18, 2)), CAST(4.46 AS Decimal(18, 2)), CAST(8.42 AS Decimal(18, 2)), 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, CAST(0.00 AS Decimal(18, 2)), CAST(N'2023-10-04' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-10-23' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock], [lysdqty], [LYSDDate], [LYSDFatPercent], [LYSDSNFPercent], [LYSDFatKG], [LYSDSNFKG], [TargetDate], [TargetMilk], [MilkCumulative], [WBOBal], [WBManuf], [SMPBal], [SMPManuf], [WMPBal], [WMPManuf], [GheeBal], [GheeManuf]) VALUES (84, 16, CAST(N'2024-10-04' AS Date), 1356, CAST(71.33 AS Decimal(18, 2)), CAST(111.46 AS Decimal(18, 2)), CAST(5.26 AS Decimal(18, 2)), CAST(8.22 AS Decimal(18, 2)), 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, CAST(0.00 AS Decimal(18, 2)), CAST(N'2023-10-04' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-10-23' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock], [lysdqty], [LYSDDate], [LYSDFatPercent], [LYSDSNFPercent], [LYSDFatKG], [LYSDSNFKG], [TargetDate], [TargetMilk], [MilkCumulative], [WBOBal], [WBManuf], [SMPBal], [SMPManuf], [WMPBal], [WMPManuf], [GheeBal], [GheeManuf]) VALUES (85, 17, CAST(N'2024-10-04' AS Date), 5718, CAST(325.35 AS Decimal(18, 2)), CAST(495.18 AS Decimal(18, 2)), CAST(5.69 AS Decimal(18, 2)), CAST(8.66 AS Decimal(18, 2)), 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, CAST(0.00 AS Decimal(18, 2)), CAST(N'2023-10-04' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-10-23' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock], [lysdqty], [LYSDDate], [LYSDFatPercent], [LYSDSNFPercent], [LYSDFatKG], [LYSDSNFKG], [TargetDate], [TargetMilk], [MilkCumulative], [WBOBal], [WBManuf], [SMPBal], [SMPManuf], [WMPBal], [WMPManuf], [GheeBal], [GheeManuf]) VALUES (86, 18, CAST(N'2024-10-04' AS Date), 17730, CAST(877.64 AS Decimal(18, 2)), CAST(1462.73 AS Decimal(18, 2)), CAST(4.95 AS Decimal(18, 2)), CAST(8.25 AS Decimal(18, 2)), 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, CAST(0.00 AS Decimal(18, 2)), CAST(N'2023-10-04' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-10-23' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock], [lysdqty], [LYSDDate], [LYSDFatPercent], [LYSDSNFPercent], [LYSDFatKG], [LYSDSNFKG], [TargetDate], [TargetMilk], [MilkCumulative], [WBOBal], [WBManuf], [SMPBal], [SMPManuf], [WMPBal], [WMPManuf], [GheeBal], [GheeManuf]) VALUES (87, 19, CAST(N'2024-10-04' AS Date), 2483, CAST(131.10 AS Decimal(18, 2)), CAST(210.81 AS Decimal(18, 2)), CAST(5.28 AS Decimal(18, 2)), CAST(8.49 AS Decimal(18, 2)), 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, CAST(0.00 AS Decimal(18, 2)), CAST(N'2023-10-04' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-10-23' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock], [lysdqty], [LYSDDate], [LYSDFatPercent], [LYSDSNFPercent], [LYSDFatKG], [LYSDSNFKG], [TargetDate], [TargetMilk], [MilkCumulative], [WBOBal], [WBManuf], [SMPBal], [SMPManuf], [WMPBal], [WMPManuf], [GheeBal], [GheeManuf]) VALUES (88, 20, CAST(N'2024-10-04' AS Date), 3082, CAST(171.67 AS Decimal(18, 2)), CAST(262.28 AS Decimal(18, 2)), CAST(5.57 AS Decimal(18, 2)), CAST(8.51 AS Decimal(18, 2)), 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, CAST(0.00 AS Decimal(18, 2)), CAST(N'2023-10-04' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-10-23' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock], [lysdqty], [LYSDDate], [LYSDFatPercent], [LYSDSNFPercent], [LYSDFatKG], [LYSDSNFKG], [TargetDate], [TargetMilk], [MilkCumulative], [WBOBal], [WBManuf], [SMPBal], [SMPManuf], [WMPBal], [WMPManuf], [GheeBal], [GheeManuf]) VALUES (89, 21, CAST(N'2024-10-04' AS Date), 1599, CAST(93.54 AS Decimal(18, 2)), CAST(136.23 AS Decimal(18, 2)), CAST(5.85 AS Decimal(18, 2)), CAST(8.52 AS Decimal(18, 2)), 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, CAST(0.00 AS Decimal(18, 2)), CAST(N'2023-10-04' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-10-23' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock], [lysdqty], [LYSDDate], [LYSDFatPercent], [LYSDSNFPercent], [LYSDFatKG], [LYSDSNFKG], [TargetDate], [TargetMilk], [MilkCumulative], [WBOBal], [WBManuf], [SMPBal], [SMPManuf], [WMPBal], [WMPManuf], [GheeBal], [GheeManuf]) VALUES (90, 22, CAST(N'2024-10-04' AS Date), 14412, CAST(879.13 AS Decimal(18, 2)), CAST(1204.84 AS Decimal(18, 2)), CAST(6.10 AS Decimal(18, 2)), CAST(8.36 AS Decimal(18, 2)), 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, CAST(0.00 AS Decimal(18, 2)), CAST(N'2023-10-04' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-10-23' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock], [lysdqty], [LYSDDate], [LYSDFatPercent], [LYSDSNFPercent], [LYSDFatKG], [LYSDSNFKG], [TargetDate], [TargetMilk], [MilkCumulative], [WBOBal], [WBManuf], [SMPBal], [SMPManuf], [WMPBal], [WMPManuf], [GheeBal], [GheeManuf]) VALUES (91, 23, CAST(N'2024-10-04' AS Date), 564, CAST(29.16 AS Decimal(18, 2)), CAST(46.25 AS Decimal(18, 2)), CAST(5.17 AS Decimal(18, 2)), CAST(8.20 AS Decimal(18, 2)), 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, CAST(0.00 AS Decimal(18, 2)), CAST(N'2023-10-04' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-10-23' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock], [lysdqty], [LYSDDate], [LYSDFatPercent], [LYSDSNFPercent], [LYSDFatKG], [LYSDSNFKG], [TargetDate], [TargetMilk], [MilkCumulative], [WBOBal], [WBManuf], [SMPBal], [SMPManuf], [WMPBal], [WMPManuf], [GheeBal], [GheeManuf]) VALUES (92, 24, CAST(N'2024-10-04' AS Date), 0, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, CAST(0.00 AS Decimal(18, 2)), CAST(N'2023-10-04' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-10-23' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock], [lysdqty], [LYSDDate], [LYSDFatPercent], [LYSDSNFPercent], [LYSDFatKG], [LYSDSNFKG], [TargetDate], [TargetMilk], [MilkCumulative], [WBOBal], [WBManuf], [SMPBal], [SMPManuf], [WMPBal], [WMPManuf], [GheeBal], [GheeManuf]) VALUES (93, 25, CAST(N'2024-10-04' AS Date), 3878, CAST(193.51 AS Decimal(18, 2)), CAST(337.77 AS Decimal(18, 2)), CAST(4.99 AS Decimal(18, 2)), CAST(8.71 AS Decimal(18, 2)), 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, CAST(0.00 AS Decimal(18, 2)), CAST(N'2023-10-04' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-10-23' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock], [lysdqty], [LYSDDate], [LYSDFatPercent], [LYSDSNFPercent], [LYSDFatKG], [LYSDSNFKG], [TargetDate], [TargetMilk], [MilkCumulative], [WBOBal], [WBManuf], [SMPBal], [SMPManuf], [WMPBal], [WMPManuf], [GheeBal], [GheeManuf]) VALUES (94, 8, CAST(N'2024-10-03' AS Date), 203060, CAST(10457.59 AS Decimal(18, 2)), CAST(16590.00 AS Decimal(18, 2)), CAST(5.15 AS Decimal(18, 2)), CAST(8.17 AS Decimal(18, 2)), 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, CAST(0.00 AS Decimal(18, 2)), CAST(N'2023-10-03' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-10-03' AS Date), CAST(409695.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock], [lysdqty], [LYSDDate], [LYSDFatPercent], [LYSDSNFPercent], [LYSDFatKG], [LYSDSNFKG], [TargetDate], [TargetMilk], [MilkCumulative], [WBOBal], [WBManuf], [SMPBal], [SMPManuf], [WMPBal], [WMPManuf], [GheeBal], [GheeManuf]) VALUES (95, 9, CAST(N'2024-10-03' AS Date), 9401, CAST(442.79 AS Decimal(18, 2)), CAST(761.48 AS Decimal(18, 2)), CAST(4.71 AS Decimal(18, 2)), CAST(8.10 AS Decimal(18, 2)), 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, CAST(0.00 AS Decimal(18, 2)), CAST(N'2023-10-03' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-10-23' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock], [lysdqty], [LYSDDate], [LYSDFatPercent], [LYSDSNFPercent], [LYSDFatKG], [LYSDSNFKG], [TargetDate], [TargetMilk], [MilkCumulative], [WBOBal], [WBManuf], [SMPBal], [SMPManuf], [WMPBal], [WMPManuf], [GheeBal], [GheeManuf]) VALUES (96, 10, CAST(N'2024-10-03' AS Date), 28119, CAST(1706.82 AS Decimal(18, 2)), CAST(2429.48 AS Decimal(18, 2)), CAST(6.07 AS Decimal(18, 2)), CAST(8.64 AS Decimal(18, 2)), 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, CAST(0.00 AS Decimal(18, 2)), CAST(N'2023-10-03' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-10-23' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock], [lysdqty], [LYSDDate], [LYSDFatPercent], [LYSDSNFPercent], [LYSDFatKG], [LYSDSNFKG], [TargetDate], [TargetMilk], [MilkCumulative], [WBOBal], [WBManuf], [SMPBal], [SMPManuf], [WMPBal], [WMPManuf], [GheeBal], [GheeManuf]) VALUES (97, 11, CAST(N'2024-10-03' AS Date), 22140, CAST(1118.07 AS Decimal(18, 2)), CAST(1839.83 AS Decimal(18, 2)), CAST(5.05 AS Decimal(18, 2)), CAST(8.31 AS Decimal(18, 2)), 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, CAST(0.00 AS Decimal(18, 2)), CAST(N'2023-10-03' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-10-23' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock], [lysdqty], [LYSDDate], [LYSDFatPercent], [LYSDSNFPercent], [LYSDFatKG], [LYSDSNFKG], [TargetDate], [TargetMilk], [MilkCumulative], [WBOBal], [WBManuf], [SMPBal], [SMPManuf], [WMPBal], [WMPManuf], [GheeBal], [GheeManuf]) VALUES (98, 12, CAST(N'2024-10-03' AS Date), 24662, CAST(1267.63 AS Decimal(18, 2)), CAST(2024.75 AS Decimal(18, 2)), CAST(5.14 AS Decimal(18, 2)), CAST(8.21 AS Decimal(18, 2)), 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, CAST(0.00 AS Decimal(18, 2)), CAST(N'2023-10-03' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-10-23' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock], [lysdqty], [LYSDDate], [LYSDFatPercent], [LYSDSNFPercent], [LYSDFatKG], [LYSDSNFKG], [TargetDate], [TargetMilk], [MilkCumulative], [WBOBal], [WBManuf], [SMPBal], [SMPManuf], [WMPBal], [WMPManuf], [GheeBal], [GheeManuf]) VALUES (99, 13, CAST(N'2024-10-03' AS Date), 733, CAST(30.79 AS Decimal(18, 2)), CAST(59.52 AS Decimal(18, 2)), CAST(4.20 AS Decimal(18, 2)), CAST(8.12 AS Decimal(18, 2)), 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, CAST(0.00 AS Decimal(18, 2)), CAST(N'2023-10-03' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-10-23' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock], [lysdqty], [LYSDDate], [LYSDFatPercent], [LYSDSNFPercent], [LYSDFatKG], [LYSDSNFKG], [TargetDate], [TargetMilk], [MilkCumulative], [WBOBal], [WBManuf], [SMPBal], [SMPManuf], [WMPBal], [WMPManuf], [GheeBal], [GheeManuf]) VALUES (100, 14, CAST(N'2024-10-03' AS Date), 1213, CAST(64.41 AS Decimal(18, 2)), CAST(100.07 AS Decimal(18, 2)), CAST(5.31 AS Decimal(18, 2)), CAST(8.25 AS Decimal(18, 2)), 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, CAST(0.00 AS Decimal(18, 2)), CAST(N'2023-10-03' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-10-23' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock], [lysdqty], [LYSDDate], [LYSDFatPercent], [LYSDSNFPercent], [LYSDFatKG], [LYSDSNFKG], [TargetDate], [TargetMilk], [MilkCumulative], [WBOBal], [WBManuf], [SMPBal], [SMPManuf], [WMPBal], [WMPManuf], [GheeBal], [GheeManuf]) VALUES (101, 15, CAST(N'2024-10-03' AS Date), 3961, CAST(189.34 AS Decimal(18, 2)), CAST(335.89 AS Decimal(18, 2)), CAST(4.78 AS Decimal(18, 2)), CAST(8.48 AS Decimal(18, 2)), 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, CAST(0.00 AS Decimal(18, 2)), CAST(N'2023-10-03' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-10-23' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock], [lysdqty], [LYSDDate], [LYSDFatPercent], [LYSDSNFPercent], [LYSDFatKG], [LYSDSNFKG], [TargetDate], [TargetMilk], [MilkCumulative], [WBOBal], [WBManuf], [SMPBal], [SMPManuf], [WMPBal], [WMPManuf], [GheeBal], [GheeManuf]) VALUES (102, 16, CAST(N'2024-10-03' AS Date), 1319, CAST(69.78 AS Decimal(18, 2)), CAST(108.16 AS Decimal(18, 2)), CAST(5.29 AS Decimal(18, 2)), CAST(8.20 AS Decimal(18, 2)), 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, CAST(0.00 AS Decimal(18, 2)), CAST(N'2023-10-03' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-10-23' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock], [lysdqty], [LYSDDate], [LYSDFatPercent], [LYSDSNFPercent], [LYSDFatKG], [LYSDSNFKG], [TargetDate], [TargetMilk], [MilkCumulative], [WBOBal], [WBManuf], [SMPBal], [SMPManuf], [WMPBal], [WMPManuf], [GheeBal], [GheeManuf]) VALUES (103, 17, CAST(N'2024-10-03' AS Date), 5679, CAST(328.25 AS Decimal(18, 2)), CAST(439.55 AS Decimal(18, 2)), CAST(5.78 AS Decimal(18, 2)), CAST(7.74 AS Decimal(18, 2)), 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, CAST(0.00 AS Decimal(18, 2)), CAST(N'2023-10-03' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-10-23' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock], [lysdqty], [LYSDDate], [LYSDFatPercent], [LYSDSNFPercent], [LYSDFatKG], [LYSDSNFKG], [TargetDate], [TargetMilk], [MilkCumulative], [WBOBal], [WBManuf], [SMPBal], [SMPManuf], [WMPBal], [WMPManuf], [GheeBal], [GheeManuf]) VALUES (104, 18, CAST(N'2024-10-03' AS Date), 18251, CAST(897.95 AS Decimal(18, 2)), CAST(1502.06 AS Decimal(18, 2)), CAST(4.92 AS Decimal(18, 2)), CAST(8.23 AS Decimal(18, 2)), 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, CAST(0.00 AS Decimal(18, 2)), CAST(N'2023-10-03' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-10-23' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock], [lysdqty], [LYSDDate], [LYSDFatPercent], [LYSDSNFPercent], [LYSDFatKG], [LYSDSNFKG], [TargetDate], [TargetMilk], [MilkCumulative], [WBOBal], [WBManuf], [SMPBal], [SMPManuf], [WMPBal], [WMPManuf], [GheeBal], [GheeManuf]) VALUES (105, 19, CAST(N'2024-10-03' AS Date), 2591, CAST(135.77 AS Decimal(18, 2)), CAST(217.13 AS Decimal(18, 2)), CAST(5.24 AS Decimal(18, 2)), CAST(8.38 AS Decimal(18, 2)), 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, CAST(0.00 AS Decimal(18, 2)), CAST(N'2023-10-03' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-10-23' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock], [lysdqty], [LYSDDate], [LYSDFatPercent], [LYSDSNFPercent], [LYSDFatKG], [LYSDSNFKG], [TargetDate], [TargetMilk], [MilkCumulative], [WBOBal], [WBManuf], [SMPBal], [SMPManuf], [WMPBal], [WMPManuf], [GheeBal], [GheeManuf]) VALUES (106, 20, CAST(N'2024-10-03' AS Date), 2990, CAST(166.84 AS Decimal(18, 2)), CAST(253.85 AS Decimal(18, 2)), CAST(5.58 AS Decimal(18, 2)), CAST(8.49 AS Decimal(18, 2)), 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, CAST(0.00 AS Decimal(18, 2)), CAST(N'2023-10-03' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-10-23' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock], [lysdqty], [LYSDDate], [LYSDFatPercent], [LYSDSNFPercent], [LYSDFatKG], [LYSDSNFKG], [TargetDate], [TargetMilk], [MilkCumulative], [WBOBal], [WBManuf], [SMPBal], [SMPManuf], [WMPBal], [WMPManuf], [GheeBal], [GheeManuf]) VALUES (107, 21, CAST(N'2024-10-03' AS Date), 1513, CAST(89.27 AS Decimal(18, 2)), CAST(129.36 AS Decimal(18, 2)), CAST(5.90 AS Decimal(18, 2)), CAST(8.55 AS Decimal(18, 2)), 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, CAST(0.00 AS Decimal(18, 2)), CAST(N'2023-10-03' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-10-23' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock], [lysdqty], [LYSDDate], [LYSDFatPercent], [LYSDSNFPercent], [LYSDFatKG], [LYSDSNFKG], [TargetDate], [TargetMilk], [MilkCumulative], [WBOBal], [WBManuf], [SMPBal], [SMPManuf], [WMPBal], [WMPManuf], [GheeBal], [GheeManuf]) VALUES (108, 22, CAST(N'2024-10-03' AS Date), 9952, CAST(593.14 AS Decimal(18, 2)), CAST(846.92 AS Decimal(18, 2)), CAST(5.96 AS Decimal(18, 2)), CAST(8.51 AS Decimal(18, 2)), 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, CAST(0.00 AS Decimal(18, 2)), CAST(N'2023-10-03' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-10-23' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock], [lysdqty], [LYSDDate], [LYSDFatPercent], [LYSDSNFPercent], [LYSDFatKG], [LYSDSNFKG], [TargetDate], [TargetMilk], [MilkCumulative], [WBOBal], [WBManuf], [SMPBal], [SMPManuf], [WMPBal], [WMPManuf], [GheeBal], [GheeManuf]) VALUES (109, 23, CAST(N'2024-10-03' AS Date), 569, CAST(29.13 AS Decimal(18, 2)), CAST(46.71 AS Decimal(18, 2)), CAST(5.12 AS Decimal(18, 2)), CAST(8.21 AS Decimal(18, 2)), 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, CAST(0.00 AS Decimal(18, 2)), CAST(N'2023-10-03' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-10-23' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock], [lysdqty], [LYSDDate], [LYSDFatPercent], [LYSDSNFPercent], [LYSDFatKG], [LYSDSNFKG], [TargetDate], [TargetMilk], [MilkCumulative], [WBOBal], [WBManuf], [SMPBal], [SMPManuf], [WMPBal], [WMPManuf], [GheeBal], [GheeManuf]) VALUES (110, 24, CAST(N'2024-10-03' AS Date), 0, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, CAST(0.00 AS Decimal(18, 2)), CAST(N'2023-10-03' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-10-23' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock], [lysdqty], [LYSDDate], [LYSDFatPercent], [LYSDSNFPercent], [LYSDFatKG], [LYSDSNFKG], [TargetDate], [TargetMilk], [MilkCumulative], [WBOBal], [WBManuf], [SMPBal], [SMPManuf], [WMPBal], [WMPManuf], [GheeBal], [GheeManuf]) VALUES (111, 25, CAST(N'2024-10-03' AS Date), 3762, CAST(191.86 AS Decimal(18, 2)), CAST(332.56 AS Decimal(18, 2)), CAST(5.10 AS Decimal(18, 2)), CAST(8.84 AS Decimal(18, 2)), 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, CAST(0.00 AS Decimal(18, 2)), CAST(N'2023-10-03' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-10-23' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock], [lysdqty], [LYSDDate], [LYSDFatPercent], [LYSDSNFPercent], [LYSDFatKG], [LYSDSNFKG], [TargetDate], [TargetMilk], [MilkCumulative], [WBOBal], [WBManuf], [SMPBal], [SMPManuf], [WMPBal], [WMPManuf], [GheeBal], [GheeManuf]) VALUES (112, 8, CAST(N'2024-10-02' AS Date), 181380, CAST(9014.59 AS Decimal(18, 2)), CAST(14691.78 AS Decimal(18, 2)), CAST(4.97 AS Decimal(18, 2)), CAST(8.10 AS Decimal(18, 2)), 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, CAST(0.00 AS Decimal(18, 2)), CAST(N'2023-10-02' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-10-02' AS Date), CAST(409695.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock], [lysdqty], [LYSDDate], [LYSDFatPercent], [LYSDSNFPercent], [LYSDFatKG], [LYSDSNFKG], [TargetDate], [TargetMilk], [MilkCumulative], [WBOBal], [WBManuf], [SMPBal], [SMPManuf], [WMPBal], [WMPManuf], [GheeBal], [GheeManuf]) VALUES (113, 9, CAST(N'2024-10-02' AS Date), 9081, CAST(420.45 AS Decimal(18, 2)), CAST(735.56 AS Decimal(18, 2)), CAST(4.63 AS Decimal(18, 2)), CAST(8.10 AS Decimal(18, 2)), 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, CAST(0.00 AS Decimal(18, 2)), CAST(N'2023-10-02' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-10-23' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock], [lysdqty], [LYSDDate], [LYSDFatPercent], [LYSDSNFPercent], [LYSDFatKG], [LYSDSNFKG], [TargetDate], [TargetMilk], [MilkCumulative], [WBOBal], [WBManuf], [SMPBal], [SMPManuf], [WMPBal], [WMPManuf], [GheeBal], [GheeManuf]) VALUES (114, 10, CAST(N'2024-10-02' AS Date), 10565, CAST(610.66 AS Decimal(18, 2)), CAST(892.74 AS Decimal(18, 2)), CAST(5.78 AS Decimal(18, 2)), CAST(8.45 AS Decimal(18, 2)), 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, CAST(0.00 AS Decimal(18, 2)), CAST(N'2023-10-02' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-10-23' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock], [lysdqty], [LYSDDate], [LYSDFatPercent], [LYSDSNFPercent], [LYSDFatKG], [LYSDSNFKG], [TargetDate], [TargetMilk], [MilkCumulative], [WBOBal], [WBManuf], [SMPBal], [SMPManuf], [WMPBal], [WMPManuf], [GheeBal], [GheeManuf]) VALUES (115, 11, CAST(N'2024-10-02' AS Date), 22700, CAST(1155.43 AS Decimal(18, 2)), CAST(1881.83 AS Decimal(18, 2)), CAST(5.09 AS Decimal(18, 2)), CAST(8.29 AS Decimal(18, 2)), 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, CAST(0.00 AS Decimal(18, 2)), CAST(N'2023-10-02' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-10-23' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock], [lysdqty], [LYSDDate], [LYSDFatPercent], [LYSDSNFPercent], [LYSDFatKG], [LYSDSNFKG], [TargetDate], [TargetMilk], [MilkCumulative], [WBOBal], [WBManuf], [SMPBal], [SMPManuf], [WMPBal], [WMPManuf], [GheeBal], [GheeManuf]) VALUES (116, 12, CAST(N'2024-10-02' AS Date), 25807, CAST(1326.48 AS Decimal(18, 2)), CAST(2113.59 AS Decimal(18, 2)), CAST(5.14 AS Decimal(18, 2)), CAST(8.19 AS Decimal(18, 2)), 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, CAST(0.00 AS Decimal(18, 2)), CAST(N'2023-10-02' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-10-23' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock], [lysdqty], [LYSDDate], [LYSDFatPercent], [LYSDSNFPercent], [LYSDFatKG], [LYSDSNFKG], [TargetDate], [TargetMilk], [MilkCumulative], [WBOBal], [WBManuf], [SMPBal], [SMPManuf], [WMPBal], [WMPManuf], [GheeBal], [GheeManuf]) VALUES (117, 13, CAST(N'2024-10-02' AS Date), 664, CAST(26.56 AS Decimal(18, 2)), CAST(54.25 AS Decimal(18, 2)), CAST(4.00 AS Decimal(18, 2)), CAST(8.17 AS Decimal(18, 2)), 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, CAST(0.00 AS Decimal(18, 2)), CAST(N'2023-10-02' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-10-23' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock], [lysdqty], [LYSDDate], [LYSDFatPercent], [LYSDSNFPercent], [LYSDFatKG], [LYSDSNFKG], [TargetDate], [TargetMilk], [MilkCumulative], [WBOBal], [WBManuf], [SMPBal], [SMPManuf], [WMPBal], [WMPManuf], [GheeBal], [GheeManuf]) VALUES (118, 14, CAST(N'2024-10-02' AS Date), 1076, CAST(56.92 AS Decimal(18, 2)), CAST(88.55 AS Decimal(18, 2)), CAST(5.29 AS Decimal(18, 2)), CAST(8.23 AS Decimal(18, 2)), 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, CAST(0.00 AS Decimal(18, 2)), CAST(N'2023-10-02' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-10-23' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock], [lysdqty], [LYSDDate], [LYSDFatPercent], [LYSDSNFPercent], [LYSDFatKG], [LYSDSNFKG], [TargetDate], [TargetMilk], [MilkCumulative], [WBOBal], [WBManuf], [SMPBal], [SMPManuf], [WMPBal], [WMPManuf], [GheeBal], [GheeManuf]) VALUES (119, 15, CAST(N'2024-10-02' AS Date), 3357, CAST(158.45 AS Decimal(18, 2)), CAST(285.68 AS Decimal(18, 2)), CAST(4.72 AS Decimal(18, 2)), CAST(8.51 AS Decimal(18, 2)), 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, CAST(0.00 AS Decimal(18, 2)), CAST(N'2023-10-02' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-10-23' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock], [lysdqty], [LYSDDate], [LYSDFatPercent], [LYSDSNFPercent], [LYSDFatKG], [LYSDSNFKG], [TargetDate], [TargetMilk], [MilkCumulative], [WBOBal], [WBManuf], [SMPBal], [SMPManuf], [WMPBal], [WMPManuf], [GheeBal], [GheeManuf]) VALUES (120, 16, CAST(N'2024-10-02' AS Date), 1070, CAST(57.57 AS Decimal(18, 2)), CAST(88.06 AS Decimal(18, 2)), CAST(5.38 AS Decimal(18, 2)), CAST(8.23 AS Decimal(18, 2)), 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, CAST(0.00 AS Decimal(18, 2)), CAST(N'2023-10-02' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-10-23' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock], [lysdqty], [LYSDDate], [LYSDFatPercent], [LYSDSNFPercent], [LYSDFatKG], [LYSDSNFKG], [TargetDate], [TargetMilk], [MilkCumulative], [WBOBal], [WBManuf], [SMPBal], [SMPManuf], [WMPBal], [WMPManuf], [GheeBal], [GheeManuf]) VALUES (121, 17, CAST(N'2024-10-02' AS Date), 4553, CAST(256.33 AS Decimal(18, 2)), CAST(395.20 AS Decimal(18, 2)), CAST(5.63 AS Decimal(18, 2)), CAST(8.68 AS Decimal(18, 2)), 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, CAST(0.00 AS Decimal(18, 2)), CAST(N'2023-10-02' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-10-23' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock], [lysdqty], [LYSDDate], [LYSDFatPercent], [LYSDSNFPercent], [LYSDFatKG], [LYSDSNFKG], [TargetDate], [TargetMilk], [MilkCumulative], [WBOBal], [WBManuf], [SMPBal], [SMPManuf], [WMPBal], [WMPManuf], [GheeBal], [GheeManuf]) VALUES (122, 18, CAST(N'2024-10-02' AS Date), 15875, CAST(774.70 AS Decimal(18, 2)), CAST(1312.86 AS Decimal(18, 2)), CAST(4.88 AS Decimal(18, 2)), CAST(8.27 AS Decimal(18, 2)), 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, CAST(0.00 AS Decimal(18, 2)), CAST(N'2023-10-02' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-10-23' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock], [lysdqty], [LYSDDate], [LYSDFatPercent], [LYSDSNFPercent], [LYSDFatKG], [LYSDSNFKG], [TargetDate], [TargetMilk], [MilkCumulative], [WBOBal], [WBManuf], [SMPBal], [SMPManuf], [WMPBal], [WMPManuf], [GheeBal], [GheeManuf]) VALUES (123, 19, CAST(N'2024-10-02' AS Date), 2294, CAST(118.14 AS Decimal(18, 2)), CAST(193.38 AS Decimal(18, 2)), CAST(5.15 AS Decimal(18, 2)), CAST(8.43 AS Decimal(18, 2)), 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, CAST(0.00 AS Decimal(18, 2)), CAST(N'2023-10-02' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-10-23' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock], [lysdqty], [LYSDDate], [LYSDFatPercent], [LYSDSNFPercent], [LYSDFatKG], [LYSDSNFKG], [TargetDate], [TargetMilk], [MilkCumulative], [WBOBal], [WBManuf], [SMPBal], [SMPManuf], [WMPBal], [WMPManuf], [GheeBal], [GheeManuf]) VALUES (124, 20, CAST(N'2024-10-02' AS Date), 2932, CAST(162.43 AS Decimal(18, 2)), CAST(249.81 AS Decimal(18, 2)), CAST(5.54 AS Decimal(18, 2)), CAST(8.52 AS Decimal(18, 2)), 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, CAST(0.00 AS Decimal(18, 2)), CAST(N'2023-10-02' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-10-23' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock], [lysdqty], [LYSDDate], [LYSDFatPercent], [LYSDSNFPercent], [LYSDFatKG], [LYSDSNFKG], [TargetDate], [TargetMilk], [MilkCumulative], [WBOBal], [WBManuf], [SMPBal], [SMPManuf], [WMPBal], [WMPManuf], [GheeBal], [GheeManuf]) VALUES (125, 21, CAST(N'2024-10-02' AS Date), 1511, CAST(89.90 AS Decimal(18, 2)), CAST(129.34 AS Decimal(18, 2)), CAST(5.95 AS Decimal(18, 2)), CAST(8.56 AS Decimal(18, 2)), 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, CAST(0.00 AS Decimal(18, 2)), CAST(N'2023-10-02' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-10-23' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock], [lysdqty], [LYSDDate], [LYSDFatPercent], [LYSDSNFPercent], [LYSDFatKG], [LYSDSNFKG], [TargetDate], [TargetMilk], [MilkCumulative], [WBOBal], [WBManuf], [SMPBal], [SMPManuf], [WMPBal], [WMPManuf], [GheeBal], [GheeManuf]) VALUES (126, 22, CAST(N'2024-10-02' AS Date), 12983, CAST(740.03 AS Decimal(18, 2)), CAST(1046.43 AS Decimal(18, 2)), CAST(5.70 AS Decimal(18, 2)), CAST(8.06 AS Decimal(18, 2)), 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, CAST(0.00 AS Decimal(18, 2)), CAST(N'2023-10-02' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-10-23' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock], [lysdqty], [LYSDDate], [LYSDFatPercent], [LYSDSNFPercent], [LYSDFatKG], [LYSDSNFKG], [TargetDate], [TargetMilk], [MilkCumulative], [WBOBal], [WBManuf], [SMPBal], [SMPManuf], [WMPBal], [WMPManuf], [GheeBal], [GheeManuf]) VALUES (127, 23, CAST(N'2024-10-02' AS Date), 519, CAST(27.04 AS Decimal(18, 2)), CAST(42.45 AS Decimal(18, 2)), CAST(5.21 AS Decimal(18, 2)), CAST(8.18 AS Decimal(18, 2)), 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, CAST(0.00 AS Decimal(18, 2)), CAST(N'2023-10-02' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-10-23' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock], [lysdqty], [LYSDDate], [LYSDFatPercent], [LYSDSNFPercent], [LYSDFatKG], [LYSDSNFKG], [TargetDate], [TargetMilk], [MilkCumulative], [WBOBal], [WBManuf], [SMPBal], [SMPManuf], [WMPBal], [WMPManuf], [GheeBal], [GheeManuf]) VALUES (128, 24, CAST(N'2024-10-02' AS Date), 0, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, CAST(0.00 AS Decimal(18, 2)), CAST(N'2023-10-02' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-10-23' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock], [lysdqty], [LYSDDate], [LYSDFatPercent], [LYSDSNFPercent], [LYSDFatKG], [LYSDSNFKG], [TargetDate], [TargetMilk], [MilkCumulative], [WBOBal], [WBManuf], [SMPBal], [SMPManuf], [WMPBal], [WMPManuf], [GheeBal], [GheeManuf]) VALUES (129, 25, CAST(N'2024-10-02' AS Date), 1937, CAST(92.98 AS Decimal(18, 2)), CAST(166.58 AS Decimal(18, 2)), CAST(4.80 AS Decimal(18, 2)), CAST(8.60 AS Decimal(18, 2)), 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, CAST(0.00 AS Decimal(18, 2)), CAST(N'2023-10-02' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-10-23' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock], [lysdqty], [LYSDDate], [LYSDFatPercent], [LYSDSNFPercent], [LYSDFatKG], [LYSDSNFKG], [TargetDate], [TargetMilk], [MilkCumulative], [WBOBal], [WBManuf], [SMPBal], [SMPManuf], [WMPBal], [WMPManuf], [GheeBal], [GheeManuf]) VALUES (130, 8, CAST(N'2024-10-01' AS Date), 213950, CAST(11082.61 AS Decimal(18, 2)), CAST(17458.32 AS Decimal(18, 2)), CAST(5.18 AS Decimal(18, 2)), CAST(8.16 AS Decimal(18, 2)), 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, CAST(0.00 AS Decimal(18, 2)), CAST(N'2023-10-01' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-10-01' AS Date), CAST(409695.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock], [lysdqty], [LYSDDate], [LYSDFatPercent], [LYSDSNFPercent], [LYSDFatKG], [LYSDSNFKG], [TargetDate], [TargetMilk], [MilkCumulative], [WBOBal], [WBManuf], [SMPBal], [SMPManuf], [WMPBal], [WMPManuf], [GheeBal], [GheeManuf]) VALUES (131, 9, CAST(N'2024-10-01' AS Date), 9256, CAST(430.40 AS Decimal(18, 2)), CAST(750.66 AS Decimal(18, 2)), CAST(4.65 AS Decimal(18, 2)), CAST(8.11 AS Decimal(18, 2)), 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, CAST(0.00 AS Decimal(18, 2)), CAST(N'2023-10-01' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-10-23' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock], [lysdqty], [LYSDDate], [LYSDFatPercent], [LYSDSNFPercent], [LYSDFatKG], [LYSDSNFKG], [TargetDate], [TargetMilk], [MilkCumulative], [WBOBal], [WBManuf], [SMPBal], [SMPManuf], [WMPBal], [WMPManuf], [GheeBal], [GheeManuf]) VALUES (132, 10, CAST(N'2024-10-01' AS Date), 17538, CAST(1062.80 AS Decimal(18, 2)), CAST(1504.76 AS Decimal(18, 2)), CAST(6.06 AS Decimal(18, 2)), CAST(8.58 AS Decimal(18, 2)), 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, CAST(0.00 AS Decimal(18, 2)), CAST(N'2023-10-01' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-10-23' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock], [lysdqty], [LYSDDate], [LYSDFatPercent], [LYSDSNFPercent], [LYSDFatKG], [LYSDSNFKG], [TargetDate], [TargetMilk], [MilkCumulative], [WBOBal], [WBManuf], [SMPBal], [SMPManuf], [WMPBal], [WMPManuf], [GheeBal], [GheeManuf]) VALUES (133, 11, CAST(N'2024-10-01' AS Date), 21640, CAST(1099.31 AS Decimal(18, 2)), CAST(1780.97 AS Decimal(18, 2)), CAST(5.08 AS Decimal(18, 2)), CAST(8.23 AS Decimal(18, 2)), 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, CAST(0.00 AS Decimal(18, 2)), CAST(N'2023-10-01' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-10-23' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock], [lysdqty], [LYSDDate], [LYSDFatPercent], [LYSDSNFPercent], [LYSDFatKG], [LYSDSNFKG], [TargetDate], [TargetMilk], [MilkCumulative], [WBOBal], [WBManuf], [SMPBal], [SMPManuf], [WMPBal], [WMPManuf], [GheeBal], [GheeManuf]) VALUES (134, 12, CAST(N'2024-10-01' AS Date), 23776, CAST(1214.95 AS Decimal(18, 2)), CAST(1947.25 AS Decimal(18, 2)), CAST(5.11 AS Decimal(18, 2)), CAST(8.19 AS Decimal(18, 2)), 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, CAST(0.00 AS Decimal(18, 2)), CAST(N'2023-10-01' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-10-23' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock], [lysdqty], [LYSDDate], [LYSDFatPercent], [LYSDSNFPercent], [LYSDFatKG], [LYSDSNFKG], [TargetDate], [TargetMilk], [MilkCumulative], [WBOBal], [WBManuf], [SMPBal], [SMPManuf], [WMPBal], [WMPManuf], [GheeBal], [GheeManuf]) VALUES (135, 13, CAST(N'2024-10-01' AS Date), 718, CAST(29.87 AS Decimal(18, 2)), CAST(58.80 AS Decimal(18, 2)), CAST(4.16 AS Decimal(18, 2)), CAST(8.19 AS Decimal(18, 2)), 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, CAST(0.00 AS Decimal(18, 2)), CAST(N'2023-10-01' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-10-23' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock], [lysdqty], [LYSDDate], [LYSDFatPercent], [LYSDSNFPercent], [LYSDFatKG], [LYSDSNFKG], [TargetDate], [TargetMilk], [MilkCumulative], [WBOBal], [WBManuf], [SMPBal], [SMPManuf], [WMPBal], [WMPManuf], [GheeBal], [GheeManuf]) VALUES (136, 14, CAST(N'2024-10-01' AS Date), 1145, CAST(61.37 AS Decimal(18, 2)), CAST(94.69 AS Decimal(18, 2)), CAST(5.36 AS Decimal(18, 2)), CAST(8.27 AS Decimal(18, 2)), 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, CAST(0.00 AS Decimal(18, 2)), CAST(N'2023-10-01' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-10-23' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock], [lysdqty], [LYSDDate], [LYSDFatPercent], [LYSDSNFPercent], [LYSDFatKG], [LYSDSNFKG], [TargetDate], [TargetMilk], [MilkCumulative], [WBOBal], [WBManuf], [SMPBal], [SMPManuf], [WMPBal], [WMPManuf], [GheeBal], [GheeManuf]) VALUES (137, 15, CAST(N'2024-10-01' AS Date), 3667, CAST(176.02 AS Decimal(18, 2)), CAST(308.39 AS Decimal(18, 2)), CAST(4.80 AS Decimal(18, 2)), CAST(8.41 AS Decimal(18, 2)), 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, CAST(0.00 AS Decimal(18, 2)), CAST(N'2023-10-01' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-10-23' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock], [lysdqty], [LYSDDate], [LYSDFatPercent], [LYSDSNFPercent], [LYSDFatKG], [LYSDSNFKG], [TargetDate], [TargetMilk], [MilkCumulative], [WBOBal], [WBManuf], [SMPBal], [SMPManuf], [WMPBal], [WMPManuf], [GheeBal], [GheeManuf]) VALUES (138, 16, CAST(N'2024-10-01' AS Date), 1211, CAST(63.82 AS Decimal(18, 2)), CAST(99.79 AS Decimal(18, 2)), CAST(5.27 AS Decimal(18, 2)), CAST(8.24 AS Decimal(18, 2)), 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, CAST(0.00 AS Decimal(18, 2)), CAST(N'2023-10-01' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-10-23' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock], [lysdqty], [LYSDDate], [LYSDFatPercent], [LYSDSNFPercent], [LYSDFatKG], [LYSDSNFKG], [TargetDate], [TargetMilk], [MilkCumulative], [WBOBal], [WBManuf], [SMPBal], [SMPManuf], [WMPBal], [WMPManuf], [GheeBal], [GheeManuf]) VALUES (139, 17, CAST(N'2024-10-01' AS Date), 5281, CAST(301.02 AS Decimal(18, 2)), CAST(459.98 AS Decimal(18, 2)), CAST(5.70 AS Decimal(18, 2)), CAST(8.71 AS Decimal(18, 2)), 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, CAST(0.00 AS Decimal(18, 2)), CAST(N'2023-10-01' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-10-23' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock], [lysdqty], [LYSDDate], [LYSDFatPercent], [LYSDSNFPercent], [LYSDFatKG], [LYSDSNFKG], [TargetDate], [TargetMilk], [MilkCumulative], [WBOBal], [WBManuf], [SMPBal], [SMPManuf], [WMPBal], [WMPManuf], [GheeBal], [GheeManuf]) VALUES (140, 18, CAST(N'2024-10-01' AS Date), 17655, CAST(866.86 AS Decimal(18, 2)), CAST(1493.61 AS Decimal(18, 2)), CAST(4.91 AS Decimal(18, 2)), CAST(8.46 AS Decimal(18, 2)), 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, CAST(0.00 AS Decimal(18, 2)), CAST(N'2023-10-01' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-10-23' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock], [lysdqty], [LYSDDate], [LYSDFatPercent], [LYSDSNFPercent], [LYSDFatKG], [LYSDSNFKG], [TargetDate], [TargetMilk], [MilkCumulative], [WBOBal], [WBManuf], [SMPBal], [SMPManuf], [WMPBal], [WMPManuf], [GheeBal], [GheeManuf]) VALUES (141, 19, CAST(N'2024-10-01' AS Date), 2574, CAST(133.33 AS Decimal(18, 2)), CAST(216.22 AS Decimal(18, 2)), CAST(5.18 AS Decimal(18, 2)), CAST(8.40 AS Decimal(18, 2)), 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, CAST(0.00 AS Decimal(18, 2)), CAST(N'2023-10-01' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-10-23' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock], [lysdqty], [LYSDDate], [LYSDFatPercent], [LYSDSNFPercent], [LYSDFatKG], [LYSDSNFKG], [TargetDate], [TargetMilk], [MilkCumulative], [WBOBal], [WBManuf], [SMPBal], [SMPManuf], [WMPBal], [WMPManuf], [GheeBal], [GheeManuf]) VALUES (142, 20, CAST(N'2024-10-01' AS Date), 3011, CAST(168.01 AS Decimal(18, 2)), CAST(258.64 AS Decimal(18, 2)), CAST(5.58 AS Decimal(18, 2)), CAST(8.59 AS Decimal(18, 2)), 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, CAST(0.00 AS Decimal(18, 2)), CAST(N'2023-10-01' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-10-23' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock], [lysdqty], [LYSDDate], [LYSDFatPercent], [LYSDSNFPercent], [LYSDFatKG], [LYSDSNFKG], [TargetDate], [TargetMilk], [MilkCumulative], [WBOBal], [WBManuf], [SMPBal], [SMPManuf], [WMPBal], [WMPManuf], [GheeBal], [GheeManuf]) VALUES (143, 21, CAST(N'2024-10-01' AS Date), 1565, CAST(90.93 AS Decimal(18, 2)), CAST(133.34 AS Decimal(18, 2)), CAST(5.81 AS Decimal(18, 2)), CAST(8.52 AS Decimal(18, 2)), 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, CAST(0.00 AS Decimal(18, 2)), CAST(N'2023-10-01' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-10-23' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock], [lysdqty], [LYSDDate], [LYSDFatPercent], [LYSDSNFPercent], [LYSDFatKG], [LYSDSNFKG], [TargetDate], [TargetMilk], [MilkCumulative], [WBOBal], [WBManuf], [SMPBal], [SMPManuf], [WMPBal], [WMPManuf], [GheeBal], [GheeManuf]) VALUES (144, 22, CAST(N'2024-10-01' AS Date), 10192, CAST(600.31 AS Decimal(18, 2)), CAST(865.30 AS Decimal(18, 2)), CAST(5.89 AS Decimal(18, 2)), CAST(8.49 AS Decimal(18, 2)), 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, CAST(0.00 AS Decimal(18, 2)), CAST(N'2023-10-01' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-10-23' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock], [lysdqty], [LYSDDate], [LYSDFatPercent], [LYSDSNFPercent], [LYSDFatKG], [LYSDSNFKG], [TargetDate], [TargetMilk], [MilkCumulative], [WBOBal], [WBManuf], [SMPBal], [SMPManuf], [WMPBal], [WMPManuf], [GheeBal], [GheeManuf]) VALUES (145, 23, CAST(N'2024-10-01' AS Date), 608, CAST(30.83 AS Decimal(18, 2)), CAST(49.86 AS Decimal(18, 2)), CAST(5.07 AS Decimal(18, 2)), CAST(8.20 AS Decimal(18, 2)), 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, CAST(0.00 AS Decimal(18, 2)), CAST(N'2023-10-01' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-10-23' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock], [lysdqty], [LYSDDate], [LYSDFatPercent], [LYSDSNFPercent], [LYSDFatKG], [LYSDSNFKG], [TargetDate], [TargetMilk], [MilkCumulative], [WBOBal], [WBManuf], [SMPBal], [SMPManuf], [WMPBal], [WMPManuf], [GheeBal], [GheeManuf]) VALUES (146, 24, CAST(N'2024-10-01' AS Date), 0, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, CAST(0.00 AS Decimal(18, 2)), CAST(N'2023-10-01' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-10-23' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock], [lysdqty], [LYSDDate], [LYSDFatPercent], [LYSDSNFPercent], [LYSDFatKG], [LYSDSNFKG], [TargetDate], [TargetMilk], [MilkCumulative], [WBOBal], [WBManuf], [SMPBal], [SMPManuf], [WMPBal], [WMPManuf], [GheeBal], [GheeManuf]) VALUES (147, 25, CAST(N'2024-10-01' AS Date), 3306, CAST(164.31 AS Decimal(18, 2)), CAST(287.62 AS Decimal(18, 2)), CAST(4.97 AS Decimal(18, 2)), CAST(8.70 AS Decimal(18, 2)), 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, CAST(0.00 AS Decimal(18, 2)), CAST(N'2023-10-01' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-10-23' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock], [lysdqty], [LYSDDate], [LYSDFatPercent], [LYSDSNFPercent], [LYSDFatKG], [LYSDSNFKG], [TargetDate], [TargetMilk], [MilkCumulative], [WBOBal], [WBManuf], [SMPBal], [SMPManuf], [WMPBal], [WMPManuf], [GheeBal], [GheeManuf]) VALUES (148, 8, CAST(N'2024-10-02' AS Date), 0, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 220, 680, 0, 0, 1, 0, 0, 0, 0, 3700, CAST(0.00 AS Decimal(18, 2)), CAST(N'2023-10-24' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-10-24' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(460.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(3700.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock], [lysdqty], [LYSDDate], [LYSDFatPercent], [LYSDSNFPercent], [LYSDFatKG], [LYSDSNFKG], [TargetDate], [TargetMilk], [MilkCumulative], [WBOBal], [WBManuf], [SMPBal], [SMPManuf], [WMPBal], [WMPManuf], [GheeBal], [GheeManuf]) VALUES (149, 8, CAST(N'2024-10-03' AS Date), 0, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 0, 0, 0, 0, 0, 0, 0, 0, 0, 1340, CAST(0.00 AS Decimal(18, 2)), CAST(N'2023-10-24' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-10-24' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(1340.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock], [lysdqty], [LYSDDate], [LYSDFatPercent], [LYSDSNFPercent], [LYSDFatKG], [LYSDSNFKG], [TargetDate], [TargetMilk], [MilkCumulative], [WBOBal], [WBManuf], [SMPBal], [SMPManuf], [WMPBal], [WMPManuf], [GheeBal], [GheeManuf]) VALUES (150, 8, CAST(N'2024-10-05' AS Date), 0, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 0, 1320, 0, 0, 0, 0, 0, 0, 0, 0, CAST(0.00 AS Decimal(18, 2)), CAST(N'2023-10-24' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-10-24' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(1320.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock], [lysdqty], [LYSDDate], [LYSDFatPercent], [LYSDSNFPercent], [LYSDFatKG], [LYSDSNFKG], [TargetDate], [TargetMilk], [MilkCumulative], [WBOBal], [WBManuf], [SMPBal], [SMPManuf], [WMPBal], [WMPManuf], [GheeBal], [GheeManuf]) VALUES (151, 3, CAST(N'2024-10-06' AS Date), 0, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 511, 2061, 0, 0, 0, 0, 0, 0, 0, 0, CAST(0.00 AS Decimal(18, 2)), CAST(N'2023-10-24' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-10-24' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(1550.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock], [lysdqty], [LYSDDate], [LYSDFatPercent], [LYSDSNFPercent], [LYSDFatKG], [LYSDSNFKG], [TargetDate], [TargetMilk], [MilkCumulative], [WBOBal], [WBManuf], [SMPBal], [SMPManuf], [WMPBal], [WMPManuf], [GheeBal], [GheeManuf]) VALUES (152, 3, CAST(N'2024-10-07' AS Date), 0, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 0, 1680, 0, 0, 0, 0, 0, 0, 0, 0, CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-10-24' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-10-24' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(1680.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock], [lysdqty], [LYSDDate], [LYSDFatPercent], [LYSDSNFPercent], [LYSDFatKG], [LYSDSNFKG], [TargetDate], [TargetMilk], [MilkCumulative], [WBOBal], [WBManuf], [SMPBal], [SMPManuf], [WMPBal], [WMPManuf], [GheeBal], [GheeManuf]) VALUES (153, 8, CAST(N'2024-10-01' AS Date), 0, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 0, 4030, 0, 0, 0, 0, 0, 0, 0, 0, CAST(0.00 AS Decimal(18, 2)), CAST(N'2023-10-24' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-10-24' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(4030.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock], [lysdqty], [LYSDDate], [LYSDFatPercent], [LYSDSNFPercent], [LYSDFatKG], [LYSDSNFKG], [TargetDate], [TargetMilk], [MilkCumulative], [WBOBal], [WBManuf], [SMPBal], [SMPManuf], [WMPBal], [WMPManuf], [GheeBal], [GheeManuf]) VALUES (154, 8, CAST(N'2024-10-04' AS Date), 0, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 0, 370, 0, 0, 0, 0, 0, 0, 224, 224, CAST(0.00 AS Decimal(18, 2)), CAST(N'2023-10-24' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-10-24' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(370.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock], [lysdqty], [LYSDDate], [LYSDFatPercent], [LYSDSNFPercent], [LYSDFatKG], [LYSDSNFKG], [TargetDate], [TargetMilk], [MilkCumulative], [WBOBal], [WBManuf], [SMPBal], [SMPManuf], [WMPBal], [WMPManuf], [GheeBal], [GheeManuf]) VALUES (156, 11, CAST(N'2024-11-11' AS Date), 100, CAST(10.00 AS Decimal(18, 2)), CAST(15.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), CAST(15.00 AS Decimal(18, 2)), 15, 45, 0, 0, 1, 1, 0, 0, 0, 0, CAST(0.00 AS Decimal(18, 2)), CAST(N'2023-11-11' AS Date), CAST(20.00 AS Decimal(18, 2)), CAST(200.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-11-11' AS Date), CAST(100.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), CAST(20.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock], [lysdqty], [LYSDDate], [LYSDFatPercent], [LYSDSNFPercent], [LYSDFatKG], [LYSDSNFKG], [TargetDate], [TargetMilk], [MilkCumulative], [WBOBal], [WBManuf], [SMPBal], [SMPManuf], [WMPBal], [WMPManuf], [GheeBal], [GheeManuf]) VALUES (157, 9, CAST(N'2024-11-11' AS Date), 2000, CAST(600.00 AS Decimal(18, 2)), CAST(400.00 AS Decimal(18, 2)), CAST(30.00 AS Decimal(18, 2)), CAST(20.00 AS Decimal(18, 2)), 0, 0, 30, 60, 1, 1, 0, 0, 0, 0, CAST(0.00 AS Decimal(18, 2)), CAST(N'2023-11-11' AS Date), CAST(20.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-11-11' AS Date), CAST(500.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), CAST(20.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock], [lysdqty], [LYSDDate], [LYSDFatPercent], [LYSDSNFPercent], [LYSDFatKG], [LYSDSNFKG], [TargetDate], [TargetMilk], [MilkCumulative], [WBOBal], [WBManuf], [SMPBal], [SMPManuf], [WMPBal], [WMPManuf], [GheeBal], [GheeManuf]) VALUES (158, 8, CAST(N'2024-11-09' AS Date), 196970, CAST(10084.86 AS Decimal(18, 2)), CAST(16151.54 AS Decimal(18, 2)), CAST(5.12 AS Decimal(18, 2)), CAST(8.20 AS Decimal(18, 2)), 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, CAST(0.00 AS Decimal(18, 2)), CAST(N'2023-11-09' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-11-12' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock], [lysdqty], [LYSDDate], [LYSDFatPercent], [LYSDSNFPercent], [LYSDFatKG], [LYSDSNFKG], [TargetDate], [TargetMilk], [MilkCumulative], [WBOBal], [WBManuf], [SMPBal], [SMPManuf], [WMPBal], [WMPManuf], [GheeBal], [GheeManuf]) VALUES (159, 9, CAST(N'2024-11-09' AS Date), 9738, CAST(490.80 AS Decimal(18, 2)), CAST(797.54 AS Decimal(18, 2)), CAST(5.04 AS Decimal(18, 2)), CAST(8.19 AS Decimal(18, 2)), 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-11-09' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-11-12' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock], [lysdqty], [LYSDDate], [LYSDFatPercent], [LYSDSNFPercent], [LYSDFatKG], [LYSDSNFKG], [TargetDate], [TargetMilk], [MilkCumulative], [WBOBal], [WBManuf], [SMPBal], [SMPManuf], [WMPBal], [WMPManuf], [GheeBal], [GheeManuf]) VALUES (160, 10, CAST(N'2024-11-09' AS Date), 28014, CAST(1285.84 AS Decimal(18, 2)), CAST(1795.70 AS Decimal(18, 2)), CAST(4.59 AS Decimal(18, 2)), CAST(6.41 AS Decimal(18, 2)), 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-11-09' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-11-12' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock], [lysdqty], [LYSDDate], [LYSDFatPercent], [LYSDSNFPercent], [LYSDFatKG], [LYSDSNFKG], [TargetDate], [TargetMilk], [MilkCumulative], [WBOBal], [WBManuf], [SMPBal], [SMPManuf], [WMPBal], [WMPManuf], [GheeBal], [GheeManuf]) VALUES (161, 11, CAST(N'2024-11-09' AS Date), 22310, CAST(1151.20 AS Decimal(18, 2)), CAST(1838.34 AS Decimal(18, 2)), CAST(5.16 AS Decimal(18, 2)), CAST(8.24 AS Decimal(18, 2)), 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-11-09' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-11-12' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock], [lysdqty], [LYSDDate], [LYSDFatPercent], [LYSDSNFPercent], [LYSDFatKG], [LYSDSNFKG], [TargetDate], [TargetMilk], [MilkCumulative], [WBOBal], [WBManuf], [SMPBal], [SMPManuf], [WMPBal], [WMPManuf], [GheeBal], [GheeManuf]) VALUES (162, 12, CAST(N'2024-11-09' AS Date), 27220, CAST(1410.00 AS Decimal(18, 2)), CAST(2253.82 AS Decimal(18, 2)), CAST(5.18 AS Decimal(18, 2)), CAST(8.28 AS Decimal(18, 2)), 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-11-09' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-11-12' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock], [lysdqty], [LYSDDate], [LYSDFatPercent], [LYSDSNFPercent], [LYSDFatKG], [LYSDSNFKG], [TargetDate], [TargetMilk], [MilkCumulative], [WBOBal], [WBManuf], [SMPBal], [SMPManuf], [WMPBal], [WMPManuf], [GheeBal], [GheeManuf]) VALUES (163, 13, CAST(N'2024-11-09' AS Date), 987, CAST(40.47 AS Decimal(18, 2)), CAST(81.33 AS Decimal(18, 2)), CAST(4.10 AS Decimal(18, 2)), CAST(8.24 AS Decimal(18, 2)), 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-11-09' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-11-12' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock], [lysdqty], [LYSDDate], [LYSDFatPercent], [LYSDSNFPercent], [LYSDFatKG], [LYSDSNFKG], [TargetDate], [TargetMilk], [MilkCumulative], [WBOBal], [WBManuf], [SMPBal], [SMPManuf], [WMPBal], [WMPManuf], [GheeBal], [GheeManuf]) VALUES (164, 14, CAST(N'2024-11-09' AS Date), 1372, CAST(75.32 AS Decimal(18, 2)), CAST(115.25 AS Decimal(18, 2)), CAST(5.49 AS Decimal(18, 2)), CAST(8.40 AS Decimal(18, 2)), 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-11-09' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-11-12' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock], [lysdqty], [LYSDDate], [LYSDFatPercent], [LYSDSNFPercent], [LYSDFatKG], [LYSDSNFKG], [TargetDate], [TargetMilk], [MilkCumulative], [WBOBal], [WBManuf], [SMPBal], [SMPManuf], [WMPBal], [WMPManuf], [GheeBal], [GheeManuf]) VALUES (165, 15, CAST(N'2024-11-09' AS Date), 5612, CAST(259.84 AS Decimal(18, 2)), CAST(472.53 AS Decimal(18, 2)), CAST(4.63 AS Decimal(18, 2)), CAST(8.42 AS Decimal(18, 2)), 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-11-09' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-11-12' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock], [lysdqty], [LYSDDate], [LYSDFatPercent], [LYSDSNFPercent], [LYSDFatKG], [LYSDSNFKG], [TargetDate], [TargetMilk], [MilkCumulative], [WBOBal], [WBManuf], [SMPBal], [SMPManuf], [WMPBal], [WMPManuf], [GheeBal], [GheeManuf]) VALUES (166, 16, CAST(N'2024-11-09' AS Date), 2197, CAST(122.37 AS Decimal(18, 2)), CAST(184.77 AS Decimal(18, 2)), CAST(5.57 AS Decimal(18, 2)), CAST(8.41 AS Decimal(18, 2)), 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-11-09' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-11-12' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock], [lysdqty], [LYSDDate], [LYSDFatPercent], [LYSDSNFPercent], [LYSDFatKG], [LYSDSNFKG], [TargetDate], [TargetMilk], [MilkCumulative], [WBOBal], [WBManuf], [SMPBal], [SMPManuf], [WMPBal], [WMPManuf], [GheeBal], [GheeManuf]) VALUES (167, 17, CAST(N'2024-11-09' AS Date), 4463, CAST(274.03 AS Decimal(18, 2)), CAST(401.22 AS Decimal(18, 2)), CAST(6.14 AS Decimal(18, 2)), CAST(8.99 AS Decimal(18, 2)), 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-11-09' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-11-12' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock], [lysdqty], [LYSDDate], [LYSDFatPercent], [LYSDSNFPercent], [LYSDFatKG], [LYSDSNFKG], [TargetDate], [TargetMilk], [MilkCumulative], [WBOBal], [WBManuf], [SMPBal], [SMPManuf], [WMPBal], [WMPManuf], [GheeBal], [GheeManuf]) VALUES (168, 18, CAST(N'2024-11-09' AS Date), 18477, CAST(922.00 AS Decimal(18, 2)), CAST(1502.18 AS Decimal(18, 2)), CAST(4.99 AS Decimal(18, 2)), CAST(8.13 AS Decimal(18, 2)), 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-11-09' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-11-12' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock], [lysdqty], [LYSDDate], [LYSDFatPercent], [LYSDSNFPercent], [LYSDFatKG], [LYSDSNFKG], [TargetDate], [TargetMilk], [MilkCumulative], [WBOBal], [WBManuf], [SMPBal], [SMPManuf], [WMPBal], [WMPManuf], [GheeBal], [GheeManuf]) VALUES (169, 19, CAST(N'2024-11-09' AS Date), 3370, CAST(178.27 AS Decimal(18, 2)), CAST(282.41 AS Decimal(18, 2)), CAST(5.29 AS Decimal(18, 2)), CAST(8.38 AS Decimal(18, 2)), 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-11-09' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-11-12' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock], [lysdqty], [LYSDDate], [LYSDFatPercent], [LYSDSNFPercent], [LYSDFatKG], [LYSDSNFKG], [TargetDate], [TargetMilk], [MilkCumulative], [WBOBal], [WBManuf], [SMPBal], [SMPManuf], [WMPBal], [WMPManuf], [GheeBal], [GheeManuf]) VALUES (170, 20, CAST(N'2024-11-09' AS Date), 3353, CAST(188.44 AS Decimal(18, 2)), CAST(286.01 AS Decimal(18, 2)), CAST(5.62 AS Decimal(18, 2)), CAST(8.53 AS Decimal(18, 2)), 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-11-09' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-11-12' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock], [lysdqty], [LYSDDate], [LYSDFatPercent], [LYSDSNFPercent], [LYSDFatKG], [LYSDSNFKG], [TargetDate], [TargetMilk], [MilkCumulative], [WBOBal], [WBManuf], [SMPBal], [SMPManuf], [WMPBal], [WMPManuf], [GheeBal], [GheeManuf]) VALUES (171, 21, CAST(N'2024-11-09' AS Date), 1594, CAST(91.66 AS Decimal(18, 2)), CAST(135.33 AS Decimal(18, 2)), CAST(5.75 AS Decimal(18, 2)), CAST(8.49 AS Decimal(18, 2)), 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-11-09' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-11-12' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock], [lysdqty], [LYSDDate], [LYSDFatPercent], [LYSDSNFPercent], [LYSDFatKG], [LYSDSNFKG], [TargetDate], [TargetMilk], [MilkCumulative], [WBOBal], [WBManuf], [SMPBal], [SMPManuf], [WMPBal], [WMPManuf], [GheeBal], [GheeManuf]) VALUES (172, 22, CAST(N'2024-11-09' AS Date), 11449, CAST(692.66 AS Decimal(18, 2)), CAST(968.59 AS Decimal(18, 2)), CAST(6.05 AS Decimal(18, 2)), CAST(8.46 AS Decimal(18, 2)), 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, CAST(0.00 AS Decimal(18, 2)), CAST(N'2023-11-09' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-11-12' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock], [lysdqty], [LYSDDate], [LYSDFatPercent], [LYSDSNFPercent], [LYSDFatKG], [LYSDSNFKG], [TargetDate], [TargetMilk], [MilkCumulative], [WBOBal], [WBManuf], [SMPBal], [SMPManuf], [WMPBal], [WMPManuf], [GheeBal], [GheeManuf]) VALUES (173, 23, CAST(N'2024-11-09' AS Date), 1229, CAST(64.15 AS Decimal(18, 2)), CAST(102.99 AS Decimal(18, 2)), CAST(5.22 AS Decimal(18, 2)), CAST(8.38 AS Decimal(18, 2)), 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-11-09' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-11-12' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock], [lysdqty], [LYSDDate], [LYSDFatPercent], [LYSDSNFPercent], [LYSDFatKG], [LYSDSNFKG], [TargetDate], [TargetMilk], [MilkCumulative], [WBOBal], [WBManuf], [SMPBal], [SMPManuf], [WMPBal], [WMPManuf], [GheeBal], [GheeManuf]) VALUES (174, 25, CAST(N'2024-11-09' AS Date), 2963, CAST(151.11 AS Decimal(18, 2)), CAST(253.93 AS Decimal(18, 2)), CAST(5.10 AS Decimal(18, 2)), CAST(8.57 AS Decimal(18, 2)), 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, CAST(0.00 AS Decimal(18, 2)), CAST(N'2023-11-09' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-11-12' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Trn_InflowDetails] ([InflowId], [UnitID], [Date], [Milkqty], [Milkfat], [MilkSNF], [Milkfatperc], [MilkSNFperc], [Butterqty], [Butterstock], [MilkPowderqty], [MilkPowderstock], [IsVerifed], [IsApproved], [WholeMilkPowderqty], [WholeMilkPowderstock], [Gheeqty], [Gheestock], [lysdqty], [LYSDDate], [LYSDFatPercent], [LYSDSNFPercent], [LYSDFatKG], [LYSDSNFKG], [TargetDate], [TargetMilk], [MilkCumulative], [WBOBal], [WBManuf], [SMPBal], [SMPManuf], [WMPBal], [WMPManuf], [GheeBal], [GheeManuf]) VALUES (175, 32, CAST(N'2024-10-13' AS Date), 2000, CAST(104.00 AS Decimal(18, 2)), CAST(162.00 AS Decimal(18, 2)), CAST(5.20 AS Decimal(18, 2)), CAST(8.10 AS Decimal(18, 2)), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(1000.00 AS Decimal(18, 2)), CAST(N'2023-10-13' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-11-13' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
SET IDENTITY_INSERT [dbo].[Trn_InflowDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[trn_Sale] ON 
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory], [LYSDQty]) VALUES (1, N'2', CAST(N'2024-10-07' AS Date), N'Milk', 241402)
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory], [LYSDQty]) VALUES (2, N'3', CAST(N'2024-10-07' AS Date), N'Milk', 2509)
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory], [LYSDQty]) VALUES (3, N'4', CAST(N'2024-10-07' AS Date), N'Milk', 4546)
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory], [LYSDQty]) VALUES (4, N'5', CAST(N'2024-10-07' AS Date), N'Milk', 4684)
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory], [LYSDQty]) VALUES (5, N'6', CAST(N'2024-10-07' AS Date), N'Milk', 3089)
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory], [LYSDQty]) VALUES (6, N'7', CAST(N'2024-10-07' AS Date), N'Milk', 2015)
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory], [LYSDQty]) VALUES (7, N'8', CAST(N'2024-10-07' AS Date), N'Milk', 4099)
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory], [LYSDQty]) VALUES (8, N'9', CAST(N'2024-10-07' AS Date), N'Milk', 1664)
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory], [LYSDQty]) VALUES (9, N'10', CAST(N'2024-10-07' AS Date), N'Milk', 3388)
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory], [LYSDQty]) VALUES (10, N'11', CAST(N'2024-10-07' AS Date), N'Milk', 3579)
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory], [LYSDQty]) VALUES (11, N'12', CAST(N'2024-10-07' AS Date), N'Milk', 5418)
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory], [LYSDQty]) VALUES (12, N'13', CAST(N'2024-10-07' AS Date), N'Milk', 1732)
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory], [LYSDQty]) VALUES (13, N'14', CAST(N'2024-10-07' AS Date), N'Milk', 7976)
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory], [LYSDQty]) VALUES (14, N'15', CAST(N'2024-10-07' AS Date), N'Milk', 3604)
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory], [LYSDQty]) VALUES (15, N'16', CAST(N'2024-10-07' AS Date), N'Milk', 4525)
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory], [LYSDQty]) VALUES (16, N'17', CAST(N'2024-10-07' AS Date), N'Milk', 4786)
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory], [LYSDQty]) VALUES (17, N'18', CAST(N'2024-10-07' AS Date), N'Milk', 8742)
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory], [LYSDQty]) VALUES (18, N'19', CAST(N'2024-10-07' AS Date), N'Milk', 11982)
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory], [LYSDQty]) VALUES (19, N'2', CAST(N'2024-10-06' AS Date), N'Milk', 241080)
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory], [LYSDQty]) VALUES (20, N'3', CAST(N'2024-10-06' AS Date), N'Milk', 2439)
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory], [LYSDQty]) VALUES (21, N'4', CAST(N'2024-10-06' AS Date), N'Milk', 4633)
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory], [LYSDQty]) VALUES (22, N'5', CAST(N'2024-10-06' AS Date), N'Milk', 4244)
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory], [LYSDQty]) VALUES (23, N'6', CAST(N'2024-10-06' AS Date), N'Milk', 2656)
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory], [LYSDQty]) VALUES (24, N'7', CAST(N'2024-10-06' AS Date), N'Milk', 1806)
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory], [LYSDQty]) VALUES (25, N'8', CAST(N'2024-10-06' AS Date), N'Milk', 3771)
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory], [LYSDQty]) VALUES (26, N'9', CAST(N'2024-10-06' AS Date), N'Milk', 1583)
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory], [LYSDQty]) VALUES (27, N'10', CAST(N'2024-10-06' AS Date), N'Milk', 3252)
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory], [LYSDQty]) VALUES (28, N'11', CAST(N'2024-10-06' AS Date), N'Milk', 3551)
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory], [LYSDQty]) VALUES (29, N'12', CAST(N'2024-10-06' AS Date), N'Milk', 4828)
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory], [LYSDQty]) VALUES (30, N'13', CAST(N'2024-10-06' AS Date), N'Milk', 1966)
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory], [LYSDQty]) VALUES (31, N'14', CAST(N'2024-10-06' AS Date), N'Milk', 7818)
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory], [LYSDQty]) VALUES (32, N'15', CAST(N'2024-10-06' AS Date), N'Milk', 3479)
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory], [LYSDQty]) VALUES (33, N'16', CAST(N'2024-10-06' AS Date), N'Milk', 4528)
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory], [LYSDQty]) VALUES (34, N'17', CAST(N'2024-10-06' AS Date), N'Milk', 4697)
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory], [LYSDQty]) VALUES (35, N'18', CAST(N'2024-10-06' AS Date), N'Milk', 9127)
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory], [LYSDQty]) VALUES (36, N'19', CAST(N'2024-10-06' AS Date), N'Milk', 11876)
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory], [LYSDQty]) VALUES (37, N'2', CAST(N'2024-10-05' AS Date), N'Milk', 238385)
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory], [LYSDQty]) VALUES (38, N'3', CAST(N'2024-10-05' AS Date), N'Milk', 2453)
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory], [LYSDQty]) VALUES (39, N'4', CAST(N'2024-10-05' AS Date), N'Milk', 4589)
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory], [LYSDQty]) VALUES (40, N'5', CAST(N'2024-10-05' AS Date), N'Milk', 3978)
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory], [LYSDQty]) VALUES (41, N'6', CAST(N'2024-10-05' AS Date), N'Milk', 3509)
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory], [LYSDQty]) VALUES (42, N'7', CAST(N'2024-10-05' AS Date), N'Milk', 1904)
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory], [LYSDQty]) VALUES (43, N'8', CAST(N'2024-10-05' AS Date), N'Milk', 3954)
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory], [LYSDQty]) VALUES (44, N'9', CAST(N'2024-10-05' AS Date), N'Milk', 1634)
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory], [LYSDQty]) VALUES (45, N'10', CAST(N'2024-10-05' AS Date), N'Milk', 3757)
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory], [LYSDQty]) VALUES (46, N'11', CAST(N'2024-10-05' AS Date), N'Milk', 3709)
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory], [LYSDQty]) VALUES (47, N'12', CAST(N'2024-10-05' AS Date), N'Milk', 5097)
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory], [LYSDQty]) VALUES (48, N'13', CAST(N'2024-10-05' AS Date), N'Milk', 2207)
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory], [LYSDQty]) VALUES (49, N'14', CAST(N'2024-10-05' AS Date), N'Milk', 7240)
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory], [LYSDQty]) VALUES (50, N'15', CAST(N'2024-10-05' AS Date), N'Milk', 3135)
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory], [LYSDQty]) VALUES (51, N'16', CAST(N'2024-10-05' AS Date), N'Milk', 4469)
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory], [LYSDQty]) VALUES (52, N'17', CAST(N'2024-10-05' AS Date), N'Milk', 4818)
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory], [LYSDQty]) VALUES (53, N'18', CAST(N'2024-10-05' AS Date), N'Milk', 8444)
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory], [LYSDQty]) VALUES (54, N'19', CAST(N'2024-10-05' AS Date), N'Milk', 12480)
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory], [LYSDQty]) VALUES (55, N'2', CAST(N'2024-10-04' AS Date), N'Milk', 239559)
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory], [LYSDQty]) VALUES (56, N'3', CAST(N'2024-10-04' AS Date), N'Milk', 2374)
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory], [LYSDQty]) VALUES (57, N'4', CAST(N'2024-10-04' AS Date), N'Milk', 4496)
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory], [LYSDQty]) VALUES (58, N'5', CAST(N'2024-10-04' AS Date), N'Milk', 4369)
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory], [LYSDQty]) VALUES (59, N'6', CAST(N'2024-10-04' AS Date), N'Milk', 3131)
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory], [LYSDQty]) VALUES (60, N'7', CAST(N'2024-10-04' AS Date), N'Milk', 1972)
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory], [LYSDQty]) VALUES (61, N'8', CAST(N'2024-10-04' AS Date), N'Milk', 3685)
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory], [LYSDQty]) VALUES (62, N'9', CAST(N'2024-10-04' AS Date), N'Milk', 1611)
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory], [LYSDQty]) VALUES (63, N'10', CAST(N'2024-10-04' AS Date), N'Milk', 3640)
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory], [LYSDQty]) VALUES (64, N'11', CAST(N'2024-10-04' AS Date), N'Milk', 3711)
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory], [LYSDQty]) VALUES (65, N'12', CAST(N'2024-10-04' AS Date), N'Milk', 4756)
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory], [LYSDQty]) VALUES (66, N'13', CAST(N'2024-10-04' AS Date), N'Milk', 2161)
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory], [LYSDQty]) VALUES (67, N'14', CAST(N'2024-10-04' AS Date), N'Milk', 7709)
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory], [LYSDQty]) VALUES (68, N'15', CAST(N'2024-10-04' AS Date), N'Milk', 3195)
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory], [LYSDQty]) VALUES (69, N'16', CAST(N'2024-10-04' AS Date), N'Milk', 4460)
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory], [LYSDQty]) VALUES (70, N'17', CAST(N'2024-10-04' AS Date), N'Milk', 4839)
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory], [LYSDQty]) VALUES (71, N'18', CAST(N'2024-10-04' AS Date), N'Milk', 8168)
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory], [LYSDQty]) VALUES (72, N'19', CAST(N'2024-10-04' AS Date), N'Milk', 12371)
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory], [LYSDQty]) VALUES (73, N'2', CAST(N'2024-10-03' AS Date), N'Milk', 237837)
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory], [LYSDQty]) VALUES (74, N'3', CAST(N'2024-10-03' AS Date), N'Milk', 2708)
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory], [LYSDQty]) VALUES (75, N'4', CAST(N'2024-10-03' AS Date), N'Milk', 4599)
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory], [LYSDQty]) VALUES (76, N'5', CAST(N'2024-10-03' AS Date), N'Milk', 4446)
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory], [LYSDQty]) VALUES (77, N'6', CAST(N'2024-10-03' AS Date), N'Milk', 3084)
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory], [LYSDQty]) VALUES (78, N'7', CAST(N'2024-10-03' AS Date), N'Milk', 1955)
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory], [LYSDQty]) VALUES (79, N'8', CAST(N'2024-10-03' AS Date), N'Milk', 3736)
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory], [LYSDQty]) VALUES (80, N'9', CAST(N'2024-10-03' AS Date), N'Milk', 1553)
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory], [LYSDQty]) VALUES (81, N'10', CAST(N'2024-10-03' AS Date), N'Milk', 3370)
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory], [LYSDQty]) VALUES (82, N'11', CAST(N'2024-10-03' AS Date), N'Milk', 3377)
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory], [LYSDQty]) VALUES (83, N'12', CAST(N'2024-10-03' AS Date), N'Milk', 4618)
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory], [LYSDQty]) VALUES (84, N'13', CAST(N'2024-10-03' AS Date), N'Milk', 1970)
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory], [LYSDQty]) VALUES (85, N'14', CAST(N'2024-10-03' AS Date), N'Milk', 7129)
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory], [LYSDQty]) VALUES (86, N'15', CAST(N'2024-10-03' AS Date), N'Milk', 2838)
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory], [LYSDQty]) VALUES (87, N'16', CAST(N'2024-10-03' AS Date), N'Milk', 4700)
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory], [LYSDQty]) VALUES (88, N'17', CAST(N'2024-10-03' AS Date), N'Milk', 4693)
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory], [LYSDQty]) VALUES (89, N'18', CAST(N'2024-10-03' AS Date), N'Milk', 8135)
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory], [LYSDQty]) VALUES (90, N'19', CAST(N'2024-10-03' AS Date), N'Milk', 12042)
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory], [LYSDQty]) VALUES (91, N'2', CAST(N'2024-10-02' AS Date), N'Milk', 230920)
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory], [LYSDQty]) VALUES (92, N'3', CAST(N'2024-10-02' AS Date), N'Milk', 2446)
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory], [LYSDQty]) VALUES (93, N'4', CAST(N'2024-10-02' AS Date), N'Milk', 4329)
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory], [LYSDQty]) VALUES (94, N'5', CAST(N'2024-10-02' AS Date), N'Milk', 4405)
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory], [LYSDQty]) VALUES (95, N'6', CAST(N'2024-10-02' AS Date), N'Milk', 3748)
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory], [LYSDQty]) VALUES (96, N'7', CAST(N'2024-10-02' AS Date), N'Milk', 1936)
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory], [LYSDQty]) VALUES (97, N'8', CAST(N'2024-10-02' AS Date), N'Milk', 3982)
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory], [LYSDQty]) VALUES (98, N'9', CAST(N'2024-10-02' AS Date), N'Milk', 1605)
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory], [LYSDQty]) VALUES (99, N'10', CAST(N'2024-10-02' AS Date), N'Milk', 3732)
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory], [LYSDQty]) VALUES (100, N'11', CAST(N'2024-10-02' AS Date), N'Milk', 3622)
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory], [LYSDQty]) VALUES (101, N'12', CAST(N'2024-10-02' AS Date), N'Milk', 5083)
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory], [LYSDQty]) VALUES (102, N'13', CAST(N'2024-10-02' AS Date), N'Milk', 1806)
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory], [LYSDQty]) VALUES (103, N'14', CAST(N'2024-10-02' AS Date), N'Milk', 7374)
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory], [LYSDQty]) VALUES (104, N'15', CAST(N'2024-10-02' AS Date), N'Milk', 3028)
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory], [LYSDQty]) VALUES (105, N'16', CAST(N'2024-10-02' AS Date), N'Milk', 4566)
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory], [LYSDQty]) VALUES (106, N'17', CAST(N'2024-10-02' AS Date), N'Milk', 4609)
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory], [LYSDQty]) VALUES (107, N'18', CAST(N'2024-10-02' AS Date), N'Milk', 8166)
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory], [LYSDQty]) VALUES (108, N'19', CAST(N'2024-10-02' AS Date), N'Milk', 12163)
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory], [LYSDQty]) VALUES (109, N'2', CAST(N'2024-10-01' AS Date), N'Milk', 224244)
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory], [LYSDQty]) VALUES (110, N'3', CAST(N'2024-10-01' AS Date), N'Milk', 2205)
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory], [LYSDQty]) VALUES (111, N'4', CAST(N'2024-10-01' AS Date), N'Milk', 4634)
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory], [LYSDQty]) VALUES (112, N'5', CAST(N'2024-10-01' AS Date), N'Milk', 3888)
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory], [LYSDQty]) VALUES (113, N'6', CAST(N'2024-10-01' AS Date), N'Milk', 3078)
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory], [LYSDQty]) VALUES (114, N'7', CAST(N'2024-10-01' AS Date), N'Milk', 1800)
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory], [LYSDQty]) VALUES (115, N'8', CAST(N'2024-10-01' AS Date), N'Milk', 3521)
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory], [LYSDQty]) VALUES (116, N'9', CAST(N'2024-10-01' AS Date), N'Milk', 1583)
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory], [LYSDQty]) VALUES (117, N'10', CAST(N'2024-10-01' AS Date), N'Milk', 3046)
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory], [LYSDQty]) VALUES (118, N'11', CAST(N'2024-10-01' AS Date), N'Milk', 3490)
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory], [LYSDQty]) VALUES (119, N'12', CAST(N'2024-10-01' AS Date), N'Milk', 5129)
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory], [LYSDQty]) VALUES (120, N'13', CAST(N'2024-10-01' AS Date), N'Milk', 1630)
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory], [LYSDQty]) VALUES (121, N'14', CAST(N'2024-10-01' AS Date), N'Milk', 6763)
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory], [LYSDQty]) VALUES (122, N'15', CAST(N'2024-10-01' AS Date), N'Milk', 3099)
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory], [LYSDQty]) VALUES (123, N'16', CAST(N'2024-10-01' AS Date), N'Milk', 4004)
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory], [LYSDQty]) VALUES (124, N'17', CAST(N'2024-10-01' AS Date), N'Milk', 5140)
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory], [LYSDQty]) VALUES (125, N'18', CAST(N'2024-10-01' AS Date), N'Milk', 8132)
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory], [LYSDQty]) VALUES (126, N'19', CAST(N'2024-10-01' AS Date), N'Milk', 11487)
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory], [LYSDQty]) VALUES (127, N'2', CAST(N'2024-10-07' AS Date), N'Product', 0)
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory], [LYSDQty]) VALUES (128, N'2', CAST(N'2024-10-06' AS Date), N'Product', 0)
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory], [LYSDQty]) VALUES (129, N'2', CAST(N'2024-10-05' AS Date), N'Product', 0)
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory], [LYSDQty]) VALUES (130, N'2', CAST(N'2024-10-04' AS Date), N'Product', 0)
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory], [LYSDQty]) VALUES (131, N'2', CAST(N'2024-10-03' AS Date), N'Product', 0)
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory], [LYSDQty]) VALUES (132, N'2', CAST(N'2024-10-02' AS Date), N'Product', 0)
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory], [LYSDQty]) VALUES (133, N'2', CAST(N'2024-10-01' AS Date), N'Product', 0)
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory], [LYSDQty]) VALUES (134, N'2', CAST(N'2024-11-08' AS Date), N'Milk', 100)
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory], [LYSDQty]) VALUES (135, N'5', CAST(N'2024-11-10' AS Date), N'Milk', 1000)
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory], [LYSDQty]) VALUES (136, N'5', CAST(N'2024-11-10' AS Date), N'Product', 1000)
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory], [LYSDQty]) VALUES (137, N'2', CAST(N'2024-11-11' AS Date), N'Milk', 1000)
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory], [LYSDQty]) VALUES (138, N'2', CAST(N'2024-11-11' AS Date), N'Product', 100)
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory], [LYSDQty]) VALUES (139, N'25', CAST(N'2024-11-11' AS Date), N'Milk', 1000)
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory], [LYSDQty]) VALUES (140, N'8', CAST(N'2024-11-10' AS Date), N'Product', 1236)
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory], [LYSDQty]) VALUES (141, N'2', CAST(N'2024-11-09' AS Date), N'Milk', 236247)
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory], [LYSDQty]) VALUES (142, N'3', CAST(N'2024-11-09' AS Date), N'Milk', 2529)
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory], [LYSDQty]) VALUES (143, N'4', CAST(N'2024-11-09' AS Date), N'Milk', 4519)
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory], [LYSDQty]) VALUES (144, N'5', CAST(N'2024-11-09' AS Date), N'Milk', 4316)
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory], [LYSDQty]) VALUES (145, N'6', CAST(N'2024-11-09' AS Date), N'Milk', 2724)
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory], [LYSDQty]) VALUES (146, N'7', CAST(N'2024-11-09' AS Date), N'Milk', 1848)
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory], [LYSDQty]) VALUES (147, N'8', CAST(N'2024-11-09' AS Date), N'Milk', 4245)
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory], [LYSDQty]) VALUES (148, N'9', CAST(N'2024-11-09' AS Date), N'Milk', 1630)
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory], [LYSDQty]) VALUES (149, N'10', CAST(N'2024-11-09' AS Date), N'Milk', 3113)
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory], [LYSDQty]) VALUES (150, N'11', CAST(N'2024-11-09' AS Date), N'Milk', 3494)
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory], [LYSDQty]) VALUES (151, N'12', CAST(N'2024-11-09' AS Date), N'Milk', 4515)
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory], [LYSDQty]) VALUES (152, N'13', CAST(N'2024-11-09' AS Date), N'Milk', 2202)
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory], [LYSDQty]) VALUES (153, N'14', CAST(N'2024-11-09' AS Date), N'Milk', 7566)
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory], [LYSDQty]) VALUES (154, N'15', CAST(N'2024-11-09' AS Date), N'Milk', 3149)
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory], [LYSDQty]) VALUES (155, N'16', CAST(N'2024-11-09' AS Date), N'Milk', 4357)
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory], [LYSDQty]) VALUES (156, N'17', CAST(N'2024-11-09' AS Date), N'Milk', 4609)
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory], [LYSDQty]) VALUES (157, N'18', CAST(N'2024-11-09' AS Date), N'Milk', 8586)
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory], [LYSDQty]) VALUES (158, N'19', CAST(N'2024-11-09' AS Date), N'Milk', 12841)
GO
INSERT [dbo].[trn_Sale] ([SalesID], [NameOfUnit], [Date], [ItemCategory], [LYSDQty]) VALUES (159, N'6', CAST(N'2024-11-12' AS Date), N'Milk', 9943)
GO
SET IDENTITY_INSERT [dbo].[trn_Sale] OFF
GO
SET IDENTITY_INSERT [dbo].[trn_SaleChild] ON 
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1, 1, N'STD', 23392, 1)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (2, 1, N'DTM', 33791, 2)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (3, 1, N'LITE', 0, 3)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (4, 1, N'FCM', 110349, 4)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (5, 1, N'Diamond', 93, 5)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (6, 1, N'TM', 4763, 6)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (7, 1, N'CHAH', 60673, 7)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (8, 1, N'FCM 1L', 8147, 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (9, 1, N'Chai spl. 1000ML', 1692, 9)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (10, 2, N'STD', 10, 1)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (11, 2, N'DTM', 170, 2)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (12, 2, N'LITE', 0, 3)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (13, 2, N'FCM', 440, 4)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (14, 2, N'Diamond', 0, 5)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (15, 2, N'TM', 530, 6)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (16, 2, N'CHAH', 840, 7)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (17, 2, N'FCM 1L', 305, 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (18, 2, N'Chai spl. 1000ML', 40, 9)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (19, 3, N'STD', 90, 1)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (20, 3, N'DTM', 546, 2)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (21, 3, N'LITE', 0, 3)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (22, 3, N'FCM', 1943, 4)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (23, 3, N'Diamond', 0, 5)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (24, 3, N'TM', 780, 6)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (25, 3, N'CHAH', 732, 7)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (26, 3, N'FCM 1L', 0, 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (27, 3, N'Chai spl. 1000ML', 375, 9)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (28, 4, N'STD', 480, 1)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (29, 4, N'DTM', 297, 2)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (30, 4, N'LITE', 0, 3)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (31, 4, N'FCM', 630, 4)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (32, 4, N'Diamond', 0, 5)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (33, 4, N'TM', 1380, 6)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (34, 4, N'CHAH', 1570, 7)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (35, 4, N'FCM 1L', 0, 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (36, 4, N'Chai spl. 1000ML', 0, 9)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (37, 5, N'STD', 14, 1)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (38, 5, N'DTM', 515, 2)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (39, 5, N'LITE', 0, 3)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (40, 5, N'FCM', 700, 4)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (41, 5, N'Diamond', 0, 5)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (42, 5, N'TM', 390, 6)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (43, 5, N'CHAH', 1020, 7)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (44, 5, N'FCM 1L', 220, 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (45, 5, N'Chai spl. 1000ML', 150, 9)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (46, 6, N'STD', 65, 1)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (47, 6, N'DTM', 200, 2)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (48, 6, N'LITE', 0, 3)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (49, 6, N'FCM', 202, 4)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (50, 6, N'Diamond', 0, 5)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (51, 6, N'TM', 500, 6)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (52, 6, N'CHAH', 555, 7)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (53, 6, N'FCM 1L', 15, 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (54, 6, N'Chai spl. 1000ML', 45, 9)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (55, 7, N'STD', 0, 1)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (56, 7, N'DTM', 330, 2)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (57, 7, N'LITE', 0, 3)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (58, 7, N'FCM', 735, 4)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (59, 7, N'Diamond', 0, 5)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (60, 7, N'TM', 1580, 6)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (61, 7, N'CHAH', 8, 7)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (62, 7, N'FCM 1L', 0, 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (63, 7, N'Chai spl. 1000ML', 0, 9)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (64, 8, N'STD', 54, 1)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (65, 8, N'DTM', 380, 2)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (66, 8, N'LITE', 0, 3)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (67, 8, N'FCM', 255, 4)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (68, 8, N'Diamond', 5, 5)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (69, 8, N'TM', 280, 6)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (70, 8, N'CHAH', 450, 7)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (71, 8, N'FCM 1L', 5, 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (72, 8, N'Chai spl. 1000ML', 195, 9)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (73, 9, N'STD', 0, 1)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (74, 9, N'DTM', 306, 2)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (75, 9, N'LITE', 0, 3)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (76, 9, N'FCM', 500, 4)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (77, 9, N'Diamond', 0, 5)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (78, 9, N'TM', 800, 6)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (79, 9, N'CHAH', 1510, 7)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (80, 9, N'FCM 1L', 0, 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (81, 9, N'Chai spl. 1000ML', 260, 9)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (82, 10, N'STD', 10, 1)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (83, 10, N'DTM', 375, 2)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (84, 10, N'LITE', 0, 3)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (85, 10, N'FCM', 198, 4)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (86, 10, N'Diamond', 8, 5)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (87, 10, N'TM', 886, 6)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (88, 10, N'CHAH', 1640, 7)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (89, 10, N'FCM 1L', 30, 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (90, 10, N'Chai spl. 1000ML', 60, 9)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (91, 11, N'STD', 230, 1)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (92, 11, N'DTM', 490, 2)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (93, 11, N'LITE', 0, 3)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (94, 11, N'FCM', 1070, 4)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (95, 11, N'Diamond', 40, 5)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (96, 11, N'TM', 790, 6)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (97, 11, N'CHAH', 1980, 7)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (98, 11, N'FCM 1L', 170, 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (99, 11, N'Chai spl. 1000ML', 70, 9)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (100, 12, N'STD', 0, 1)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (101, 12, N'DTM', 43, 2)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (102, 12, N'LITE', 0, 3)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (103, 12, N'FCM', 185, 4)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (104, 12, N'Diamond', 0, 5)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (105, 12, N'TM', 760, 6)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (106, 12, N'CHAH', 2010, 7)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (107, 12, N'FCM 1L', 145, 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (108, 12, N'Chai spl. 1000ML', 240, 9)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (109, 13, N'STD', 27, 1)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (110, 13, N'DTM', 958, 2)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (111, 13, N'LITE', 0, 3)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (112, 13, N'FCM', 610, 4)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (113, 13, N'Diamond', 0, 5)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (114, 13, N'TM', 320, 6)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (115, 13, N'CHAH', 3960, 7)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (116, 13, N'FCM 1L', 590, 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (117, 13, N'Chai spl. 1000ML', 60, 9)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (118, 14, N'STD', 0, 1)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (119, 14, N'DTM', 367, 2)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (120, 14, N'LITE', 0, 3)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (121, 14, N'FCM', 140, 4)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (122, 14, N'Diamond', 0, 5)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (123, 14, N'TM', 1170, 6)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (124, 14, N'CHAH', 930, 7)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (125, 14, N'FCM 1L', 0, 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (126, 14, N'Chai spl. 1000ML', 100, 9)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (127, 15, N'STD', 0, 1)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (128, 15, N'DTM', 483, 2)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (129, 15, N'LITE', 0, 3)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (130, 15, N'FCM', 875, 4)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (131, 15, N'Diamond', 0, 5)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (132, 15, N'TM', 1175, 6)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (133, 15, N'CHAH', 650, 7)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (134, 15, N'FCM 1L', 1380, 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (135, 15, N'Chai spl. 1000ML', 15, 9)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (136, 16, N'STD', 43, 1)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (137, 16, N'DTM', 531, 2)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (138, 16, N'LITE', 0, 3)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (139, 16, N'FCM', 480, 4)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (140, 16, N'Diamond', 0, 5)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (141, 16, N'TM', 1390, 6)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (142, 16, N'CHAH', 1870, 7)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (143, 16, N'FCM 1L', 190, 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (144, 16, N'Chai spl. 1000ML', 300, 9)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (145, 17, N'STD', 0, 1)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (146, 17, N'DTM', 684, 2)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (147, 17, N'LITE', 0, 3)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (148, 17, N'FCM', 403, 4)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (149, 17, N'Diamond', 13, 5)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (150, 17, N'TM', 1215, 6)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (151, 17, N'CHAH', 4960, 7)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (152, 17, N'FCM 1L', 550, 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (153, 17, N'Chai spl. 1000ML', 160, 9)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (154, 18, N'STD', 515, 1)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (155, 18, N'DTM', 855, 2)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (156, 18, N'LITE', 0, 3)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (157, 18, N'FCM', 1830, 4)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (158, 18, N'Diamond', 0, 5)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (159, 18, N'TM', 1370, 6)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (160, 18, N'CHAH', 7590, 7)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (161, 18, N'FCM 1L', 0, 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (162, 18, N'Chai spl. 1000ML', 0, 9)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (163, 19, N'STD', 22033, 1)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (164, 19, N'DTM', 32954, 2)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (165, 19, N'LITE', 0, 3)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (166, 19, N'FCM', 102738, 4)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (167, 19, N'Diamond', 240, 5)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (168, 19, N'TM', 4541, 6)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (169, 19, N'CHAH', 54199, 7)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (170, 19, N'FCM 1L', 8210, 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (171, 19, N'Chai spl. 1000ML', 1517, 9)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (172, 20, N'STD', 10, 1)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (173, 20, N'DTM', 165, 2)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (174, 20, N'LITE', 0, 3)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (175, 20, N'FCM', 405, 4)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (176, 20, N'Diamond', 0, 5)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (177, 20, N'TM', 490, 6)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (178, 20, N'CHAH', 600, 7)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (179, 20, N'FCM 1L', 60, 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (180, 20, N'Chai spl. 1000ML', 40, 9)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (181, 21, N'STD', 92, 1)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (182, 21, N'DTM', 544, 2)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (183, 21, N'LITE', 0, 3)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (184, 21, N'FCM', 1805, 4)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (185, 21, N'Diamond', 0, 5)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (186, 21, N'TM', 750, 6)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (187, 21, N'CHAH', 717, 7)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (188, 21, N'FCM 1L', 30, 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (189, 21, N'Chai spl. 1000ML', 340, 9)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (190, 22, N'STD', 250, 1)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (191, 22, N'DTM', 306, 2)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (192, 22, N'LITE', 0, 3)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (193, 22, N'FCM', 620, 4)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (194, 22, N'Diamond', 0, 5)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (195, 22, N'TM', 1240, 6)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (196, 22, N'CHAH', 1320, 7)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (197, 22, N'FCM 1L', 0, 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (198, 22, N'Chai spl. 1000ML', 0, 9)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (199, 23, N'STD', 14, 1)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (200, 23, N'DTM', 514, 2)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (201, 23, N'LITE', 0, 3)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (202, 23, N'FCM', 640, 4)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (203, 23, N'Diamond', 0, 5)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (204, 23, N'TM', 390, 6)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (205, 23, N'CHAH', 740, 7)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (206, 23, N'FCM 1L', 70, 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (207, 23, N'Chai spl. 1000ML', 160, 9)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (208, 24, N'STD', 75, 1)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (209, 24, N'DTM', 207, 2)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (210, 24, N'LITE', 0, 3)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (211, 24, N'FCM', 219, 4)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (212, 24, N'Diamond', 0, 5)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (213, 24, N'TM', 502, 6)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (214, 24, N'CHAH', 475, 7)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (215, 24, N'FCM 1L', 21, 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (216, 24, N'Chai spl. 1000ML', 40, 9)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (217, 25, N'STD', 0, 1)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (218, 25, N'DTM', 335, 2)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (219, 25, N'LITE', 0, 3)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (220, 25, N'FCM', 685, 4)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (221, 25, N'Diamond', 0, 5)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (222, 25, N'TM', 1500, 6)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (223, 25, N'CHAH', 28, 7)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (224, 25, N'FCM 1L', 0, 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (225, 25, N'Chai spl. 1000ML', 0, 9)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (226, 26, N'STD', 54, 1)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (227, 26, N'DTM', 380, 2)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (228, 26, N'LITE', 0, 3)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (229, 26, N'FCM', 240, 4)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (230, 26, N'Diamond', 5, 5)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (231, 26, N'TM', 275, 6)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (232, 26, N'CHAH', 370, 7)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (233, 26, N'FCM 1L', 5, 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (234, 26, N'Chai spl. 1000ML', 230, 9)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (235, 27, N'STD', 0, 1)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (236, 27, N'DTM', 324, 2)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (237, 27, N'LITE', 0, 3)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (238, 27, N'FCM', 560, 4)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (239, 27, N'Diamond', 0, 5)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (240, 27, N'TM', 800, 6)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (241, 27, N'CHAH', 1810, 7)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (242, 27, N'FCM 1L', 50, 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (243, 27, N'Chai spl. 1000ML', 350, 9)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (244, 28, N'STD', 10, 1)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (245, 28, N'DTM', 378, 2)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (246, 28, N'LITE', 0, 3)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (247, 28, N'FCM', 170, 4)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (248, 28, N'Diamond', 8, 5)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (249, 28, N'TM', 856, 6)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (250, 28, N'CHAH', 1670, 7)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (251, 28, N'FCM 1L', 30, 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (252, 28, N'Chai spl. 1000ML', 50, 9)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (253, 29, N'STD', 240, 1)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (254, 29, N'DTM', 520, 2)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (255, 29, N'LITE', 0, 3)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (256, 29, N'FCM', 990, 4)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (257, 29, N'Diamond', 40, 5)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (258, 29, N'TM', 730, 6)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (259, 29, N'CHAH', 1840, 7)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (260, 29, N'FCM 1L', 250, 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (261, 29, N'Chai spl. 1000ML', 70, 9)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (262, 30, N'STD', 0, 1)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (263, 30, N'DTM', 58, 2)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (264, 30, N'LITE', 0, 3)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (265, 30, N'FCM', 173, 4)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (266, 30, N'Diamond', 0, 5)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (267, 30, N'TM', 650, 6)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (268, 30, N'CHAH', 1570, 7)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (269, 30, N'FCM 1L', 165, 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (270, 30, N'Chai spl. 1000ML', 240, 9)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (271, 31, N'STD', 26, 1)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (272, 31, N'DTM', 938, 2)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (273, 31, N'LITE', 0, 3)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (274, 31, N'FCM', 625, 4)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (275, 31, N'Diamond', 0, 5)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (276, 31, N'TM', 300, 6)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (277, 31, N'CHAH', 3500, 7)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (278, 31, N'FCM 1L', 505, 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (279, 31, N'Chai spl. 1000ML', 70, 9)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (280, 32, N'STD', 0, 1)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (281, 32, N'DTM', 359, 2)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (282, 32, N'LITE', 0, 3)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (283, 32, N'FCM', 125, 4)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (284, 32, N'Diamond', 0, 5)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (285, 32, N'TM', 1180, 6)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (286, 32, N'CHAH', 860, 7)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (287, 32, N'FCM 1L', 0, 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (288, 32, N'Chai spl. 1000ML', 100, 9)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (289, 33, N'STD', 0, 1)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (290, 33, N'DTM', 472, 2)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (291, 33, N'LITE', 0, 3)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (292, 33, N'FCM', 743, 4)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (293, 33, N'Diamond', 0, 5)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (294, 33, N'TM', 1105, 6)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (295, 33, N'CHAH', 470, 7)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (296, 33, N'FCM 1L', 810, 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (297, 33, N'Chai spl. 1000ML', 0, 9)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (298, 34, N'STD', 23, 1)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (299, 34, N'DTM', 459, 2)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (300, 34, N'LITE', 0, 3)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (301, 34, N'FCM', 430, 4)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (302, 34, N'Diamond', 0, 5)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (303, 34, N'TM', 1100, 6)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (304, 34, N'CHAH', 1600, 7)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (305, 34, N'FCM 1L', 210, 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (306, 34, N'Chai spl. 1000ML', 290, 9)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (307, 35, N'STD', 0, 1)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (308, 35, N'DTM', 779, 2)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (309, 35, N'LITE', 0, 3)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (310, 35, N'FCM', 335, 4)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (311, 35, N'Diamond', 13, 5)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (312, 35, N'TM', 1183, 6)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (313, 35, N'CHAH', 4370, 7)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (314, 35, N'FCM 1L', 440, 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (315, 35, N'Chai spl. 1000ML', 160, 9)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (316, 36, N'STD', 325, 1)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (317, 36, N'DTM', 837, 2)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (318, 36, N'LITE', 0, 3)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (319, 36, N'FCM', 1880, 4)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (320, 36, N'Diamond', 0, 5)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (321, 36, N'TM', 1360, 6)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (322, 36, N'CHAH', 6800, 7)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (323, 36, N'FCM 1L', 0, 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (324, 36, N'Chai spl. 1000ML', 0, 9)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (325, 37, N'STD', 22890, 1)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (326, 37, N'DTM', 33783, 2)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (327, 37, N'LITE', 0, 3)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (328, 37, N'FCM', 106750, 4)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (329, 37, N'Diamond', 92, 5)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (330, 37, N'TM', 4663, 6)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (331, 37, N'CHAH', 57448, 7)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (332, 37, N'FCM 1L', 8127, 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (333, 37, N'Chai spl. 1000ML', 1661, 9)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (334, 38, N'STD', 10, 1)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (335, 38, N'DTM', 165, 2)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (336, 38, N'LITE', 0, 3)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (337, 38, N'FCM', 390, 4)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (338, 38, N'Diamond', 0, 5)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (339, 38, N'TM', 490, 6)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (340, 38, N'CHAH', 620, 7)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (341, 38, N'FCM 1L', 90, 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (342, 38, N'Chai spl. 1000ML', 40, 9)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (343, 39, N'STD', 85, 1)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (344, 39, N'DTM', 546, 2)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (345, 39, N'LITE', 0, 3)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (346, 39, N'FCM', 1843, 4)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (347, 39, N'Diamond', 0, 5)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (348, 39, N'TM', 783, 6)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (349, 39, N'CHAH', 722, 7)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (350, 39, N'FCM 1L', 0, 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (351, 39, N'Chai spl. 1000ML', 435, 9)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (352, 40, N'STD', 460, 1)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (353, 40, N'DTM', 306, 2)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (354, 40, N'LITE', 0, 3)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (355, 40, N'FCM', 600, 4)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (356, 40, N'Diamond', 0, 5)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (357, 40, N'TM', 1360, 6)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (358, 40, N'CHAH', 1440, 7)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (359, 40, N'FCM 1L', 0, 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (360, 40, N'Chai spl. 1000ML', 0, 9)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (361, 41, N'STD', 14, 1)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (362, 41, N'DTM', 551, 2)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (363, 41, N'LITE', 0, 3)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (364, 41, N'FCM', 630, 4)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (365, 41, N'Diamond', 0, 5)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (366, 41, N'TM', 410, 6)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (367, 41, N'CHAH', 880, 7)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (368, 41, N'FCM 1L', 90, 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (369, 41, N'Chai spl. 1000ML', 150, 9)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (370, 42, N'STD', 65, 1)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (371, 42, N'DTM', 207, 2)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (372, 42, N'LITE', 0, 3)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (373, 42, N'FCM', 211, 4)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (374, 42, N'Diamond', 0, 5)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (375, 42, N'TM', 557, 6)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (376, 42, N'CHAH', 523, 7)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (377, 42, N'FCM 1L', 15, 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (378, 42, N'Chai spl. 1000ML', 45, 9)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (379, 43, N'STD', 0, 1)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (380, 43, N'DTM', 353, 2)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (381, 43, N'LITE', 0, 3)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (382, 43, N'FCM', 720, 4)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (383, 43, N'Diamond', 0, 5)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (384, 43, N'TM', 1610, 6)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (385, 43, N'CHAH', 8, 7)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (386, 43, N'FCM 1L', 0, 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (387, 43, N'Chai spl. 1000ML', 0, 9)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (388, 44, N'STD', 54, 1)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (389, 44, N'DTM', 380, 2)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (390, 44, N'LITE', 0, 3)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (391, 44, N'FCM', 240, 4)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (392, 44, N'Diamond', 5, 5)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (393, 44, N'TM', 255, 6)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (394, 44, N'CHAH', 360, 7)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (395, 44, N'FCM 1L', 0, 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (396, 44, N'Chai spl. 1000ML', 180, 9)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (397, 45, N'STD', 0, 1)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (398, 45, N'DTM', 324, 2)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (399, 45, N'LITE', 0, 3)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (400, 45, N'FCM', 590, 4)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (401, 45, N'Diamond', 0, 5)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (402, 45, N'TM', 810, 6)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (403, 45, N'CHAH', 1770, 7)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (404, 45, N'FCM 1L', 0, 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (405, 45, N'Chai spl. 1000ML', 300, 9)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (406, 46, N'STD', 10, 1)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (407, 46, N'DTM', 366, 2)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (408, 46, N'LITE', 0, 3)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (409, 46, N'FCM', 152, 4)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (410, 46, N'Diamond', 8, 5)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (411, 46, N'TM', 903, 6)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (412, 46, N'CHAH', 1760, 7)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (413, 46, N'FCM 1L', 30, 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (414, 46, N'Chai spl. 1000ML', 50, 9)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (415, 47, N'STD', 240, 1)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (416, 47, N'DTM', 513, 2)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (417, 47, N'LITE', 0, 3)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (418, 47, N'FCM', 1090, 4)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (419, 47, N'Diamond', 40, 5)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (420, 47, N'TM', 800, 6)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (421, 47, N'CHAH', 2060, 7)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (422, 47, N'FCM 1L', 210, 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (423, 47, N'Chai spl. 1000ML', 70, 9)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (424, 48, N'STD', 0, 1)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (425, 48, N'DTM', 63, 2)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (426, 48, N'LITE', 0, 3)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (427, 48, N'FCM', 143, 4)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (428, 48, N'Diamond', 0, 5)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (429, 48, N'TM', 660, 6)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (430, 48, N'CHAH', 1085, 7)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (431, 48, N'FCM 1L', 140, 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (432, 48, N'Chai spl. 1000ML', 140, 9)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (433, 49, N'STD', 27, 1)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (434, 49, N'DTM', 979, 2)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (435, 49, N'LITE', 0, 3)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (436, 49, N'FCM', 620, 4)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (437, 49, N'Diamond', 0, 5)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (438, 49, N'TM', 310, 6)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (439, 49, N'CHAH', 3730, 7)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (440, 49, N'FCM 1L', 640, 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (441, 49, N'Chai spl. 1000ML', 70, 9)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (442, 50, N'STD', 0, 1)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (443, 50, N'DTM', 350, 2)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (444, 50, N'LITE', 0, 3)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (445, 50, N'FCM', 138, 4)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (446, 50, N'Diamond', 0, 5)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (447, 50, N'TM', 1100, 6)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (448, 50, N'CHAH', 850, 7)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (449, 50, N'FCM 1L', 0, 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (450, 50, N'Chai spl. 1000ML', 110, 9)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (451, 51, N'STD', 0, 1)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (452, 51, N'DTM', 481, 2)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (453, 51, N'LITE', 0, 3)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (454, 51, N'FCM', 793, 4)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (455, 51, N'Diamond', 0, 5)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (456, 51, N'TM', 1155, 6)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (457, 51, N'CHAH', 600, 7)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (458, 51, N'FCM 1L', 650, 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (459, 51, N'Chai spl. 1000ML', 0, 9)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (460, 52, N'STD', 23, 1)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (461, 52, N'DTM', 504, 2)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (462, 52, N'LITE', 0, 3)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (463, 52, N'FCM', 475, 4)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (464, 52, N'Diamond', 0, 5)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (465, 52, N'TM', 1220, 6)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (466, 52, N'CHAH', 1790, 7)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (467, 52, N'FCM 1L', 150, 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (468, 52, N'Chai spl. 1000ML', 270, 9)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (469, 53, N'STD', 0, 1)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (470, 53, N'DTM', 700, 2)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (471, 53, N'LITE', 0, 3)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (472, 53, N'FCM', 343, 4)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (473, 53, N'Diamond', 13, 5)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (474, 53, N'TM', 1178, 6)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (475, 53, N'CHAH', 4200, 7)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (476, 53, N'FCM 1L', 305, 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (477, 53, N'Chai spl. 1000ML', 170, 9)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (478, 54, N'STD', 365, 1)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (479, 54, N'DTM', 873, 2)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (480, 54, N'LITE', 0, 3)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (481, 54, N'FCM', 1840, 4)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (482, 54, N'Diamond', 0, 5)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (483, 54, N'TM', 1390, 6)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (484, 54, N'CHAH', 7020, 7)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (485, 54, N'FCM 1L', 0, 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (486, 54, N'Chai spl. 1000ML', 0, 9)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (487, 55, N'STD', 23390, 1)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (488, 55, N'DTM', 34164, 2)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (489, 55, N'LITE', 0, 3)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (490, 55, N'FCM', 111023, 4)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (491, 55, N'Diamond', 91, 5)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (492, 55, N'TM', 4802, 6)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (493, 55, N'CHAH', 58972, 7)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (494, 55, N'FCM 1L', 8162, 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (495, 55, N'Chai spl. 1000ML', 1698, 9)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (496, 56, N'STD', 10, 1)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (497, 56, N'DTM', 160, 2)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (498, 56, N'LITE', 0, 3)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (499, 56, N'FCM', 465, 4)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (500, 56, N'Diamond', 0, 5)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (501, 56, N'TM', 530, 6)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (502, 56, N'CHAH', 610, 7)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (503, 56, N'FCM 1L', 60, 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (504, 56, N'Chai spl. 1000ML', 40, 9)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (505, 57, N'STD', 95, 1)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (506, 57, N'DTM', 543, 2)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (507, 57, N'LITE', 0, 3)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (508, 57, N'FCM', 1885, 4)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (509, 57, N'Diamond', 0, 5)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (510, 57, N'TM', 793, 6)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (511, 57, N'CHAH', 777, 7)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (512, 57, N'FCM 1L', 0, 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (513, 57, N'Chai spl. 1000ML', 320, 9)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (514, 58, N'STD', 480, 1)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (515, 58, N'DTM', 288, 2)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (516, 58, N'LITE', 0, 3)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (517, 58, N'FCM', 610, 4)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (518, 58, N'Diamond', 0, 5)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (519, 58, N'TM', 1270, 6)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (520, 58, N'CHAH', 1270, 7)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (521, 58, N'FCM 1L', 0, 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (522, 58, N'Chai spl. 1000ML', 0, 9)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (523, 59, N'STD', 14, 1)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (524, 59, N'DTM', 542, 2)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (525, 59, N'LITE', 0, 3)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (526, 59, N'FCM', 730, 4)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (527, 59, N'Diamond', 0, 5)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (528, 59, N'TM', 440, 6)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (529, 59, N'CHAH', 1080, 7)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (530, 59, N'FCM 1L', 110, 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (531, 59, N'Chai spl. 1000ML', 160, 9)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (532, 60, N'STD', 65, 1)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (533, 60, N'DTM', 240, 2)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (534, 60, N'LITE', 0, 3)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (535, 60, N'FCM', 221, 4)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (536, 60, N'Diamond', 0, 5)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (537, 60, N'TM', 587, 6)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (538, 60, N'CHAH', 525, 7)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (539, 60, N'FCM 1L', 80, 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (540, 60, N'Chai spl. 1000ML', 50, 9)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (541, 61, N'STD', 0, 1)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (542, 61, N'DTM', 348, 2)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (543, 61, N'LITE', 0, 3)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (544, 61, N'FCM', 840, 4)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (545, 61, N'Diamond', 0, 5)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (546, 61, N'TM', 1710, 6)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (547, 61, N'CHAH', 8, 7)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (548, 61, N'FCM 1L', 0, 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (549, 61, N'Chai spl. 1000ML', 0, 9)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (550, 62, N'STD', 54, 1)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (551, 62, N'DTM', 387, 2)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (552, 62, N'LITE', 0, 3)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (553, 62, N'FCM', 230, 4)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (554, 62, N'Diamond', 5, 5)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (555, 62, N'TM', 260, 6)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (556, 62, N'CHAH', 390, 7)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (557, 62, N'FCM 1L', 75, 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (558, 62, N'Chai spl. 1000ML', 215, 9)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (559, 63, N'STD', 0, 1)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (560, 63, N'DTM', 306, 2)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (561, 63, N'LITE', 0, 3)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (562, 63, N'FCM', 550, 4)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (563, 63, N'Diamond', 0, 5)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (564, 63, N'TM', 780, 6)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (565, 63, N'CHAH', 1380, 7)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (566, 63, N'FCM 1L', 0, 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (567, 63, N'Chai spl. 1000ML', 330, 9)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (568, 64, N'STD', 10, 1)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (569, 64, N'DTM', 387, 2)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (570, 64, N'LITE', 0, 3)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (571, 64, N'FCM', 191, 4)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (572, 64, N'Diamond', 8, 5)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (573, 64, N'TM', 931, 6)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (574, 64, N'CHAH', 1600, 7)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (575, 64, N'FCM 1L', 70, 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (576, 64, N'Chai spl. 1000ML', 50, 9)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (577, 65, N'STD', 250, 1)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (578, 65, N'DTM', 495, 2)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (579, 65, N'LITE', 0, 3)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (580, 65, N'FCM', 1020, 4)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (581, 65, N'Diamond', 40, 5)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (582, 65, N'TM', 800, 6)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (583, 65, N'CHAH', 2090, 7)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (584, 65, N'FCM 1L', 190, 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (585, 65, N'Chai spl. 1000ML', 90, 9)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (586, 66, N'STD', 0, 1)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (587, 66, N'DTM', 62, 2)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (588, 66, N'LITE', 0, 3)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (589, 66, N'FCM', 193, 4)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (590, 66, N'Diamond', 0, 5)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (591, 66, N'TM', 533, 6)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (592, 66, N'CHAH', 1130, 7)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (593, 66, N'FCM 1L', 165, 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (594, 66, N'Chai spl. 1000ML', 230, 9)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (595, 67, N'STD', 26, 1)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (596, 67, N'DTM', 1003, 2)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (597, 67, N'LITE', 0, 3)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (598, 67, N'FCM', 675, 4)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (599, 67, N'Diamond', 0, 5)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (600, 67, N'TM', 330, 6)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (601, 67, N'CHAH', 3760, 7)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (602, 67, N'FCM 1L', 505, 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (603, 67, N'Chai spl. 1000ML', 60, 9)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (604, 68, N'STD', 0, 1)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (605, 68, N'DTM', 359, 2)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (606, 68, N'LITE', 0, 3)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (607, 68, N'FCM', 135, 4)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (608, 68, N'Diamond', 0, 5)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (609, 68, N'TM', 1160, 6)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (610, 68, N'CHAH', 780, 7)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (611, 68, N'FCM 1L', 0, 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (612, 68, N'Chai spl. 1000ML', 100, 9)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (613, 69, N'STD', 0, 1)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (614, 69, N'DTM', 461, 2)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (615, 69, N'LITE', 0, 3)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (616, 69, N'FCM', 790, 4)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (617, 69, N'Diamond', 0, 5)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (618, 69, N'TM', 1200, 6)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (619, 69, N'CHAH', 610, 7)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (620, 69, N'FCM 1L', 660, 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (621, 69, N'Chai spl. 1000ML', 10, 9)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (622, 70, N'STD', 23, 1)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (623, 70, N'DTM', 531, 2)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (624, 70, N'LITE', 0, 3)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (625, 70, N'FCM', 515, 4)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (626, 70, N'Diamond', 0, 5)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (627, 70, N'TM', 1250, 6)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (628, 70, N'CHAH', 1760, 7)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (629, 70, N'FCM 1L', 160, 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (630, 70, N'Chai spl. 1000ML', 300, 9)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (631, 71, N'STD', 0, 1)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (632, 71, N'DTM', 785, 2)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (633, 71, N'LITE', 0, 3)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (634, 71, N'FCM', 358, 4)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (635, 71, N'Diamond', 13, 5)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (636, 71, N'TM', 1213, 6)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (637, 71, N'CHAH', 4410, 7)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (638, 71, N'FCM 1L', 275, 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (639, 71, N'Chai spl. 1000ML', 160, 9)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (640, 72, N'STD', 440, 1)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (641, 72, N'DTM', 909, 2)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (642, 72, N'LITE', 0, 3)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (643, 72, N'FCM', 2060, 4)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (644, 72, N'Diamond', 0, 5)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (645, 72, N'TM', 1420, 6)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (646, 72, N'CHAH', 7260, 7)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (647, 72, N'FCM 1L', 0, 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (648, 72, N'Chai spl. 1000ML', 0, 9)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (649, 73, N'STD', 23567, 1)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (650, 73, N'DTM', 34043, 2)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (651, 73, N'LITE', 0, 3)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (652, 73, N'FCM', 115182, 4)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (653, 73, N'Diamond', 90, 5)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (654, 73, N'TM', 4824, 6)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (655, 73, N'CHAH', 59735, 7)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (656, 73, N'FCM 1L', 8462, 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (657, 73, N'Chai spl. 1000ML', 1670, 9)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (658, 74, N'STD', 10, 1)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (659, 74, N'DTM', 151, 2)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (660, 74, N'LITE', 0, 3)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (661, 74, N'FCM', 455, 4)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (662, 74, N'Diamond', 0, 5)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (663, 74, N'TM', 590, 6)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (664, 74, N'CHAH', 770, 7)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (665, 74, N'FCM 1L', 100, 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (666, 74, N'Chai spl. 1000ML', 40, 9)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (667, 75, N'STD', 87, 1)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (668, 75, N'DTM', 545, 2)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (669, 75, N'LITE', 0, 3)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (670, 75, N'FCM', 1905, 4)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (671, 75, N'Diamond', 0, 5)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (672, 75, N'TM', 795, 6)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (673, 75, N'CHAH', 792, 7)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (674, 75, N'FCM 1L', 0, 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (675, 75, N'Chai spl. 1000ML', 330, 9)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (676, 76, N'STD', 480, 1)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (677, 76, N'DTM', 279, 2)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (678, 76, N'LITE', 0, 3)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (679, 76, N'FCM', 610, 4)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (680, 76, N'Diamond', 0, 5)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (681, 76, N'TM', 1320, 6)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (682, 76, N'CHAH', 1360, 7)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (683, 76, N'FCM 1L', 0, 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (684, 76, N'Chai spl. 1000ML', 0, 9)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (685, 77, N'STD', 14, 1)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (686, 77, N'DTM', 524, 2)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (687, 77, N'LITE', 0, 3)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (688, 77, N'FCM', 740, 4)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (689, 77, N'Diamond', 0, 5)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (690, 77, N'TM', 400, 6)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (691, 77, N'CHAH', 1100, 7)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (692, 77, N'FCM 1L', 90, 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (693, 77, N'Chai spl. 1000ML', 150, 9)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (694, 78, N'STD', 75, 1)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (695, 78, N'DTM', 219, 2)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (696, 78, N'LITE', 0, 3)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (697, 78, N'FCM', 198, 4)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (698, 78, N'Diamond', 0, 5)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (699, 78, N'TM', 506, 6)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (700, 78, N'CHAH', 530, 7)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (701, 78, N'FCM 1L', 15, 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (702, 78, N'Chai spl. 1000ML', 50, 9)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (703, 79, N'STD', 0, 1)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (704, 79, N'DTM', 337, 2)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (705, 79, N'LITE', 0, 3)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (706, 79, N'FCM', 825, 4)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (707, 79, N'Diamond', 0, 5)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (708, 79, N'TM', 1680, 6)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (709, 79, N'CHAH', 10, 7)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (710, 79, N'FCM 1L', 0, 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (711, 79, N'Chai spl. 1000ML', 0, 9)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (712, 80, N'STD', 54, 1)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (713, 80, N'DTM', 405, 2)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (714, 80, N'LITE', 0, 3)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (715, 80, N'FCM', 315, 4)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (716, 80, N'Diamond', 5, 5)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (717, 80, N'TM', 315, 6)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (718, 80, N'CHAH', 440, 7)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (719, 80, N'FCM 1L', 5, 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (720, 80, N'Chai spl. 1000ML', 230, 9)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (721, 81, N'STD', 0, 1)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (722, 81, N'DTM', 315, 2)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (723, 81, N'LITE', 0, 3)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (724, 81, N'FCM', 550, 4)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (725, 81, N'Diamond', 0, 5)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (726, 81, N'TM', 790, 6)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (727, 81, N'CHAH', 1450, 7)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (728, 81, N'FCM 1L', 0, 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (729, 81, N'Chai spl. 1000ML', 350, 9)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (730, 82, N'STD', 10, 1)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (731, 82, N'DTM', 387, 2)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (732, 82, N'LITE', 0, 3)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (733, 82, N'FCM', 203, 4)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (734, 82, N'Diamond', 20, 5)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (735, 82, N'TM', 941, 6)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (736, 82, N'CHAH', 1570, 7)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (737, 82, N'FCM 1L', 30, 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (738, 82, N'Chai spl. 1000ML', 40, 9)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (739, 83, N'STD', 240, 1)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (740, 83, N'DTM', 511, 2)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (741, 83, N'LITE', 0, 3)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (742, 83, N'FCM', 1150, 4)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (743, 83, N'Diamond', 40, 5)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (744, 83, N'TM', 810, 6)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (745, 83, N'CHAH', 2150, 7)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (746, 83, N'FCM 1L', 260, 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (747, 83, N'Chai spl. 1000ML', 80, 9)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (748, 84, N'STD', 0, 1)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (749, 84, N'DTM', 56, 2)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (750, 84, N'LITE', 0, 3)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (751, 84, N'FCM', 193, 4)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (752, 84, N'Diamond', 0, 5)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (753, 84, N'TM', 605, 6)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (754, 84, N'CHAH', 545, 7)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (755, 84, N'FCM 1L', 195, 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (756, 84, N'Chai spl. 1000ML', 155, 9)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (757, 85, N'STD', 77, 1)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (758, 85, N'DTM', 975, 2)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (759, 85, N'LITE', 0, 3)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (760, 85, N'FCM', 695, 4)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (761, 85, N'Diamond', 0, 5)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (762, 85, N'TM', 330, 6)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (763, 85, N'CHAH', 3850, 7)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (764, 85, N'FCM 1L', 790, 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (765, 85, N'Chai spl. 1000ML', 60, 9)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (766, 86, N'STD', 0, 1)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (767, 86, N'DTM', 356, 2)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (768, 86, N'LITE', 0, 3)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (769, 86, N'FCM', 138, 4)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (770, 86, N'Diamond', 0, 5)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (771, 86, N'TM', 1100, 6)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (772, 86, N'CHAH', 890, 7)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (773, 86, N'FCM 1L', 0, 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (774, 86, N'Chai spl. 1000ML', 90, 9)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (775, 87, N'STD', 0, 1)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (776, 87, N'DTM', 484, 2)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (777, 87, N'LITE', 0, 3)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (778, 87, N'FCM', 893, 4)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (779, 87, N'Diamond', 0, 5)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (780, 87, N'TM', 1210, 6)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (781, 87, N'CHAH', 640, 7)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (782, 87, N'FCM 1L', 1030, 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (783, 87, N'Chai spl. 1000ML', 0, 9)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (784, 88, N'STD', 23, 1)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (785, 88, N'DTM', 540, 2)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (786, 88, N'LITE', 0, 3)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (787, 88, N'FCM', 480, 4)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (788, 88, N'Diamond', 0, 5)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (789, 88, N'TM', 1370, 6)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (790, 88, N'CHAH', 1790, 7)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (791, 88, N'FCM 1L', 120, 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (792, 88, N'Chai spl. 1000ML', 390, 9)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (793, 89, N'STD', 0, 1)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (794, 89, N'DTM', 738, 2)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (795, 89, N'LITE', 0, 3)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (796, 89, N'FCM', 385, 4)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (797, 89, N'Diamond', 18, 5)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (798, 89, N'TM', 1235, 6)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (799, 89, N'CHAH', 4690, 7)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (800, 89, N'FCM 1L', 300, 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (801, 89, N'Chai spl. 1000ML', 200, 9)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (802, 90, N'STD', 420, 1)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (803, 90, N'DTM', 927, 2)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (804, 90, N'LITE', 0, 3)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (805, 90, N'FCM', 2040, 4)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (806, 90, N'Diamond', 0, 5)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (807, 90, N'TM', 1550, 6)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (808, 90, N'CHAH', 7700, 7)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (809, 90, N'FCM 1L', 0, 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (810, 90, N'Chai spl. 1000ML', 0, 9)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (811, 91, N'STD', 23948, 1)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (812, 91, N'DTM', 33395, 2)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (813, 91, N'LITE', 0, 3)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (814, 91, N'FCM', 116266, 4)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (815, 91, N'Diamond', 88, 5)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (816, 91, N'TM', 4633, 6)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (817, 91, N'CHAH', 59018, 7)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (818, 91, N'FCM 1L', 8518, 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (819, 91, N'Chai spl. 1000ML', 1627, 9)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (820, 92, N'STD', 10, 1)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (821, 92, N'DTM', 174, 2)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (822, 92, N'LITE', 0, 3)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (823, 92, N'FCM', 560, 4)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (824, 92, N'Diamond', 0, 5)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (825, 92, N'TM', 590, 6)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (826, 92, N'CHAH', 850, 7)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (827, 92, N'FCM 1L', 130, 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (828, 92, N'Chai spl. 1000ML', 60, 9)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (829, 93, N'STD', 82, 1)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (830, 93, N'DTM', 562, 2)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (831, 93, N'LITE', 0, 3)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (832, 93, N'FCM', 2055, 4)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (833, 93, N'Diamond', 0, 5)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (834, 93, N'TM', 780, 6)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (835, 93, N'CHAH', 757, 7)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (836, 93, N'FCM 1L', 10, 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (837, 93, N'Chai spl. 1000ML', 320, 9)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (838, 94, N'STD', 270, 1)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (839, 94, N'DTM', 279, 2)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (840, 94, N'LITE', 0, 3)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (841, 94, N'FCM', 730, 4)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (842, 94, N'Diamond', 0, 5)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (843, 94, N'TM', 1280, 6)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (844, 94, N'CHAH', 1660, 7)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (845, 94, N'FCM 1L', 0, 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (846, 94, N'Chai spl. 1000ML', 0, 9)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (847, 95, N'STD', 14, 1)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (848, 95, N'DTM', 551, 2)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (849, 95, N'LITE', 0, 3)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (850, 95, N'FCM', 750, 4)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (851, 95, N'Diamond', 0, 5)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (852, 95, N'TM', 390, 6)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (853, 95, N'CHAH', 1090, 7)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (854, 95, N'FCM 1L', 410, 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (855, 95, N'Chai spl. 1000ML', 150, 9)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (856, 96, N'STD', 72, 1)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (857, 96, N'DTM', 198, 2)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (858, 96, N'LITE', 0, 3)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (859, 96, N'FCM', 218, 4)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (860, 96, N'Diamond', 0, 5)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (861, 96, N'TM', 509, 6)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (862, 96, N'CHAH', 600, 7)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (863, 96, N'FCM 1L', 15, 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (864, 96, N'Chai spl. 1000ML', 50, 9)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (865, 97, N'STD', 0, 1)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (866, 97, N'DTM', 329, 2)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (867, 97, N'LITE', 0, 3)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (868, 97, N'FCM', 1010, 4)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (869, 97, N'Diamond', 0, 5)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (870, 97, N'TM', 1640, 6)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (871, 97, N'CHAH', 12, 7)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (872, 97, N'FCM 1L', 0, 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (873, 97, N'Chai spl. 1000ML', 0, 9)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (874, 98, N'STD', 54, 1)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (875, 98, N'DTM', 373, 2)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (876, 98, N'LITE', 0, 3)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (877, 98, N'FCM', 255, 4)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (878, 98, N'Diamond', 5, 5)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (879, 98, N'TM', 290, 6)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (880, 98, N'CHAH', 410, 7)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (881, 98, N'FCM 1L', 20, 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (882, 98, N'Chai spl. 1000ML', 230, 9)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (883, 99, N'STD', 0, 1)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (884, 99, N'DTM', 333, 2)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (885, 99, N'LITE', 0, 3)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (886, 99, N'FCM', 550, 4)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (887, 99, N'Diamond', 0, 5)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (888, 99, N'TM', 830, 6)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (889, 99, N'CHAH', 1600, 7)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (890, 99, N'FCM 1L', 0, 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (891, 99, N'Chai spl. 1000ML', 410, 9)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (892, 100, N'STD', 10, 1)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (893, 100, N'DTM', 406, 2)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (894, 100, N'LITE', 0, 3)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (895, 100, N'FCM', 269, 4)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (896, 100, N'Diamond', 12, 5)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (897, 100, N'TM', 1021, 6)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (898, 100, N'CHAH', 1950, 7)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (899, 100, N'FCM 1L', 40, 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (900, 100, N'Chai spl. 1000ML', 40, 9)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (901, 101, N'STD', 250, 1)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (902, 101, N'DTM', 511, 2)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (903, 101, N'LITE', 0, 3)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (904, 101, N'FCM', 1570, 4)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (905, 101, N'Diamond', 40, 5)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (906, 101, N'TM', 840, 6)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (907, 101, N'CHAH', 2410, 7)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (908, 101, N'FCM 1L', 410, 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (909, 101, N'Chai spl. 1000ML', 100, 9)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (910, 102, N'STD', 0, 1)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (911, 102, N'DTM', 57, 2)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (912, 102, N'LITE', 0, 3)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (913, 102, N'FCM', 260, 4)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (914, 102, N'Diamond', 0, 5)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (915, 102, N'TM', 720, 6)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (916, 102, N'CHAH', 1660, 7)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (917, 102, N'FCM 1L', 440, 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (918, 102, N'Chai spl. 1000ML', 115, 9)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (919, 103, N'STD', 25, 1)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (920, 103, N'DTM', 1084, 2)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (921, 103, N'LITE', 0, 3)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (922, 103, N'FCM', 655, 4)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (923, 103, N'Diamond', 0, 5)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (924, 103, N'TM', 300, 6)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (925, 103, N'CHAH', 4015, 7)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (926, 103, N'FCM 1L', 825, 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (927, 103, N'Chai spl. 1000ML', 70, 9)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (928, 104, N'STD', 0, 1)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (929, 104, N'DTM', 342, 2)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (930, 104, N'LITE', 0, 3)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (931, 104, N'FCM', 138, 4)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (932, 104, N'Diamond', 0, 5)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (933, 104, N'TM', 1180, 6)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (934, 104, N'CHAH', 950, 7)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (935, 104, N'FCM 1L', 0, 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (936, 104, N'Chai spl. 1000ML', 80, 9)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (937, 105, N'STD', 0, 1)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (938, 105, N'DTM', 470, 2)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (939, 105, N'LITE', 0, 3)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (940, 105, N'FCM', 1105, 4)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (941, 105, N'Diamond', 0, 5)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (942, 105, N'TM', 1195, 6)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (943, 105, N'CHAH', 820, 7)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (944, 105, N'FCM 1L', 1420, 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (945, 105, N'Chai spl. 1000ML', 10, 9)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (946, 106, N'STD', 23, 1)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (947, 106, N'DTM', 531, 2)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (948, 106, N'LITE', 0, 3)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (949, 106, N'FCM', 520, 4)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (950, 106, N'Diamond', 0, 5)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (951, 106, N'TM', 1270, 6)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (952, 106, N'CHAH', 2070, 7)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (953, 106, N'FCM 1L', 500, 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (954, 106, N'Chai spl. 1000ML', 440, 9)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (955, 107, N'STD', 0, 1)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (956, 107, N'DTM', 789, 2)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (957, 107, N'LITE', 0, 3)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (958, 107, N'FCM', 395, 4)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (959, 107, N'Diamond', 15, 5)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (960, 107, N'TM', 1438, 6)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (961, 107, N'CHAH', 6030, 7)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (962, 107, N'FCM 1L', 590, 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (963, 107, N'Chai spl. 1000ML', 165, 9)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (964, 108, N'STD', 355, 1)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (965, 108, N'DTM', 882, 2)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (966, 108, N'LITE', 0, 3)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (967, 108, N'FCM', 2020, 4)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (968, 108, N'Diamond', 0, 5)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (969, 108, N'TM', 1480, 6)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (970, 108, N'CHAH', 7740, 7)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (971, 108, N'FCM 1L', 0, 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (972, 108, N'Chai spl. 1000ML', 0, 9)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (973, 109, N'STD', 22853, 1)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (974, 109, N'DTM', 33383, 2)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (975, 109, N'LITE', 0, 3)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (976, 109, N'FCM', 107729, 4)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (977, 109, N'Diamond', 86, 5)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (978, 109, N'TM', 4607, 6)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (979, 109, N'CHAH', 57704, 7)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (980, 109, N'FCM 1L', 8728, 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (981, 109, N'Chai spl. 1000ML', 1519, 9)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (982, 110, N'STD', 10, 1)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (983, 110, N'DTM', 163, 2)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (984, 110, N'LITE', 0, 3)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (985, 110, N'FCM', 365, 4)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (986, 110, N'Diamond', 0, 5)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (987, 110, N'TM', 820, 6)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (988, 110, N'CHAH', 600, 7)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (989, 110, N'FCM 1L', 80, 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (990, 110, N'Chai spl. 1000ML', 30, 9)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (991, 111, N'STD', 87, 1)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (992, 111, N'DTM', 547, 2)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (993, 111, N'LITE', 0, 3)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (994, 111, N'FCM', 1813, 4)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (995, 111, N'Diamond', 0, 5)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (996, 111, N'TM', 785, 6)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (997, 111, N'CHAH', 757, 7)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (998, 111, N'FCM 1L', 0, 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (999, 111, N'Chai spl. 1000ML', 320, 9)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1000, 112, N'STD', 470, 1)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1001, 112, N'DTM', 270, 2)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1002, 112, N'LITE', 0, 3)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1003, 112, N'FCM', 640, 4)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1004, 112, N'Diamond', 0, 5)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1005, 112, N'TM', 1250, 6)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1006, 112, N'CHAH', 1510, 7)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1007, 112, N'FCM 1L', 0, 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1008, 112, N'Chai spl. 1000ML', 0, 9)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1009, 113, N'STD', 14, 1)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1010, 113, N'DTM', 551, 2)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1011, 113, N'LITE', 0, 3)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1012, 113, N'FCM', 690, 4)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1013, 113, N'Diamond', 0, 5)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1014, 113, N'TM', 390, 6)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1015, 113, N'CHAH', 960, 7)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1016, 113, N'FCM 1L', 270, 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1017, 113, N'Chai spl. 1000ML', 150, 9)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1018, 114, N'STD', 59, 1)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1019, 114, N'DTM', 199, 2)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1020, 114, N'LITE', 0, 3)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1021, 114, N'FCM', 214, 4)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1022, 114, N'Diamond', 0, 5)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1023, 114, N'TM', 483, 6)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1024, 114, N'CHAH', 533, 7)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1025, 114, N'FCM 1L', 32, 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1026, 114, N'Chai spl. 1000ML', 60, 9)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1027, 115, N'STD', 0, 1)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1028, 115, N'DTM', 344, 2)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1029, 115, N'LITE', 0, 3)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1030, 115, N'FCM', 1025, 4)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1031, 115, N'Diamond', 0, 5)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1032, 115, N'TM', 1640, 6)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1033, 115, N'CHAH', 10, 7)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1034, 115, N'FCM 1L', 20, 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1035, 115, N'Chai spl. 1000ML', 0, 9)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1036, 116, N'STD', 54, 1)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1037, 116, N'DTM', 379, 2)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1038, 116, N'LITE', 0, 3)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1039, 116, N'FCM', 250, 4)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1040, 116, N'Diamond', 5, 5)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1041, 116, N'TM', 280, 6)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1042, 116, N'CHAH', 400, 7)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1043, 116, N'FCM 1L', 25, 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1044, 116, N'Chai spl. 1000ML', 220, 9)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1045, 117, N'STD', 0, 1)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1046, 117, N'DTM', 324, 2)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1047, 117, N'LITE', 0, 3)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1048, 117, N'FCM', 580, 4)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1049, 117, N'Diamond', 0, 5)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1050, 117, N'TM', 830, 6)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1051, 117, N'CHAH', 1380, 7)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1052, 117, N'FCM 1L', 40, 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1053, 117, N'Chai spl. 1000ML', 380, 9)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1054, 118, N'STD', 10, 1)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1055, 118, N'DTM', 390, 2)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1056, 118, N'LITE', 0, 3)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1057, 118, N'FCM', 208, 4)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1058, 118, N'Diamond', 11, 5)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1059, 118, N'TM', 891, 6)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1060, 118, N'CHAH', 1760, 7)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1061, 118, N'FCM 1L', 70, 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1062, 118, N'Chai spl. 1000ML', 50, 9)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1063, 119, N'STD', 250, 1)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1064, 119, N'DTM', 511, 2)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1065, 119, N'LITE', 0, 3)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1066, 119, N'FCM', 1070, 4)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1067, 119, N'Diamond', 40, 5)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1068, 119, N'TM', 820, 6)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1069, 119, N'CHAH', 1910, 7)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1070, 119, N'FCM 1L', 210, 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1071, 119, N'Chai spl. 1000ML', 80, 9)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1072, 120, N'STD', 0, 1)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1073, 120, N'DTM', 55, 2)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1074, 120, N'LITE', 0, 3)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1075, 120, N'FCM', 190, 4)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1076, 120, N'Diamond', 0, 5)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1077, 120, N'TM', 780, 6)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1078, 120, N'CHAH', 1205, 7)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1079, 120, N'FCM 1L', 325, 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1080, 120, N'Chai spl. 1000ML', 165, 9)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1081, 121, N'STD', 26, 1)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1082, 121, N'DTM', 957, 2)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1083, 121, N'LITE', 0, 3)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1084, 121, N'FCM', 645, 4)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1085, 121, N'Diamond', 0, 5)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1086, 121, N'TM', 280, 6)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1087, 121, N'CHAH', 3920, 7)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1088, 121, N'FCM 1L', 735, 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1089, 121, N'Chai spl. 1000ML', 60, 9)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1090, 122, N'STD', 0, 1)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1091, 122, N'DTM', 358, 2)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1092, 122, N'LITE', 0, 3)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1093, 122, N'FCM', 138, 4)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1094, 122, N'Diamond', 0, 5)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1095, 122, N'TM', 1180, 6)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1096, 122, N'CHAH', 940, 7)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1097, 122, N'FCM 1L', 75, 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1098, 122, N'Chai spl. 1000ML', 100, 9)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1099, 123, N'STD', 0, 1)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1100, 123, N'DTM', 475, 2)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1101, 123, N'LITE', 0, 3)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1102, 123, N'FCM', 928, 4)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1103, 123, N'Diamond', 0, 5)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1104, 123, N'TM', 1200, 6)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1105, 123, N'CHAH', 700, 7)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1106, 123, N'FCM 1L', 1250, 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1107, 123, N'Chai spl. 1000ML', 10, 9)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1108, 124, N'STD', 23, 1)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1109, 124, N'DTM', 522, 2)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1110, 124, N'LITE', 0, 3)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1111, 124, N'FCM', 460, 4)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1112, 124, N'Diamond', 0, 5)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1113, 124, N'TM', 1300, 6)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1114, 124, N'CHAH', 1740, 7)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1115, 124, N'FCM 1L', 340, 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1116, 124, N'Chai spl. 1000ML', 425, 9)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1117, 125, N'STD', 0, 1)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1118, 125, N'DTM', 789, 2)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1119, 125, N'LITE', 0, 3)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1120, 125, N'FCM', 365, 4)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1121, 125, N'Diamond', 18, 5)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1122, 125, N'TM', 1233, 6)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1123, 125, N'CHAH', 4610, 7)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1124, 125, N'FCM 1L', 355, 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1125, 125, N'Chai spl. 1000ML', 170, 9)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1126, 126, N'STD', 410, 1)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1127, 126, N'DTM', 864, 2)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1128, 126, N'LITE', 0, 3)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1129, 126, N'FCM', 1880, 4)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1130, 126, N'Diamond', 0, 5)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1131, 126, N'TM', 1380, 6)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1132, 126, N'CHAH', 7340, 7)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1133, 126, N'FCM 1L', 0, 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1134, 126, N'Chai spl. 1000ML', 0, 9)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1135, 127, N'SMP', 0, 10)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1136, 127, N'Sweeten SMP', 0, 11)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1137, 127, N'WB', 0, 12)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1138, 127, N'Plain curd', 2792, 13)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1139, 127, N'Sweet Curd', 995, 14)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1140, 127, N'Salted Butter Milk 200 ML', 1407, 15)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1141, 127, N'Plain Butter Milk', 10642, 16)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1142, 127, N'Cold Coffee', 0, 17)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1143, 127, N'Fl.Milk Pet Bottle', 0, 18)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1144, 127, N'S.F.M Glass(Bottles)', 63, 19)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1145, 127, N'Lassi 200 ML Glass', 322, 20)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1146, 127, N'Lite Lassi 200 ML', 0, 21)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1147, 127, N'Shrikhand', 458, 22)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1148, 127, N'Chena Rabdi', 214, 23)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1149, 127, N'Sabudana Kheer 100 gm', 1, 24)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1150, 127, N'Peda', 359, 25)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1151, 127, N'Milk Cake', 49, 26)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1152, 127, N'Mawa', 26, 27)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1153, 127, N'Paneer', 112, 28)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1154, 127, N'Vaccum Paneer', 0, 29)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1155, 127, N'Rasogulla', 0, 30)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1156, 127, N'Gulabjamun', 0, 31)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1157, 127, N'Shrikhand Lite 100 gms cups', 0, 32)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1158, 127, N'Table Butter', 192, 33)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1159, 127, N'Cookies', 0, 34)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1160, 127, N'Sugar Free Peda', 2, 35)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1161, 127, N'Butter Chiplet', 0, 36)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1162, 127, N'Besan Laddu', 0, 37)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1163, 127, N'Sanchi Neer lit', 0, 38)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1164, 127, N'Misti Doi 100gm', 0, 39)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1165, 127, N'Braj Peda', 2, 40)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1166, 127, N'Amrakhand 100 gms', 3, 41)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1167, 128, N'SMP', 0, 10)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1168, 128, N'Sweeten SMP', 0, 11)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1169, 128, N'WB', 0, 12)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1170, 128, N'Plain curd', 3216, 13)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1171, 128, N'Sweet Curd', 839, 14)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1172, 128, N'Salted Butter Milk 200 ML', 1289, 15)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1173, 128, N'Plain Butter Milk', 11230, 16)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1174, 128, N'Cold Coffee', 0, 17)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1175, 128, N'Fl.Milk Pet Bottle', 0, 18)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1176, 128, N'S.F.M Glass(Bottles)', 36, 19)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1177, 128, N'Lassi 200 ML Glass', 322, 20)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1178, 128, N'Lite Lassi 200 ML', 0, 21)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1179, 128, N'Shrikhand', 512, 22)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1180, 128, N'Chena Rabdi', 226, 23)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1181, 128, N'Sabudana Kheer 100 gm', 1, 24)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1182, 128, N'Peda', 284, 25)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1183, 128, N'Milk Cake', 58, 26)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1184, 128, N'Mawa', 6, 27)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1185, 128, N'Paneer', 113, 28)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1186, 128, N'Vaccum Paneer', 0, 29)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1187, 128, N'Rasogulla', 0, 30)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1188, 128, N'Gulabjamun', 0, 31)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1189, 128, N'Shrikhand Lite 100 gms cups', 0, 32)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1190, 128, N'Table Butter', 4, 33)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1191, 128, N'Cookies', 0, 34)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1192, 128, N'Sugar Free Peda', 2, 35)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1193, 128, N'Butter Chiplet', 1, 36)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1194, 128, N'Besan Laddu', 0, 37)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1195, 128, N'Sanchi Neer lit', 0, 38)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1196, 128, N'Misti Doi 100gm', 0, 39)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1197, 128, N'Braj Peda', 0, 40)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1198, 128, N'Amrakhand 100 gms', 4, 41)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1199, 129, N'SMP', 0, 10)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1200, 129, N'Sweeten SMP', 0, 11)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1201, 129, N'WB', 0, 12)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1202, 129, N'Plain curd', 3003, 13)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1203, 129, N'Sweet Curd', 975, 14)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1204, 129, N'Salted Butter Milk 200 ML', 1460, 15)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1205, 129, N'Plain Butter Milk', 11125, 16)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1206, 129, N'Cold Coffee', 0, 17)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1207, 129, N'Fl.Milk Pet Bottle', 0, 18)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1208, 129, N'S.F.M Glass(Bottles)', 54, 19)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1209, 129, N'Lassi 200 ML Glass', 380, 20)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1210, 129, N'Lite Lassi 200 ML', 0, 21)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1211, 129, N'Shrikhand', 473, 22)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1212, 129, N'Chena Rabdi', 214, 23)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1213, 129, N'Sabudana Kheer 100 gm', 0, 24)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1214, 129, N'Peda', 140, 25)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1215, 129, N'Milk Cake', 44, 26)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1216, 129, N'Mawa', 27, 27)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1217, 129, N'Paneer', 97, 28)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1218, 129, N'Vaccum Paneer', 0, 29)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1219, 129, N'Rasogulla', 0, 30)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1220, 129, N'Gulabjamun', 0, 31)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1221, 129, N'Shrikhand Lite 100 gms cups', 0, 32)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1222, 129, N'Table Butter', 4, 33)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1223, 129, N'Cookies', 0, 34)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1224, 129, N'Sugar Free Peda', 5, 35)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1225, 129, N'Butter Chiplet', 1, 36)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1226, 129, N'Besan Laddu', 0, 37)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1227, 129, N'Sanchi Neer lit', 0, 38)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1228, 129, N'Misti Doi 100gm', 0, 39)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1229, 129, N'Braj Peda', 3, 40)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1230, 129, N'Amrakhand 100 gms', 3, 41)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1231, 130, N'SMP', 0, 10)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1232, 130, N'Sweeten SMP', 0, 11)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1233, 130, N'WB', 0, 12)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1234, 130, N'Plain curd', 3351, 13)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1235, 130, N'Sweet Curd', 954, 14)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1236, 130, N'Salted Butter Milk 200 ML', 1422, 15)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1237, 130, N'Plain Butter Milk', 11570, 16)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1238, 130, N'Cold Coffee', 0, 17)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1239, 130, N'Fl.Milk Pet Bottle', 0, 18)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1240, 130, N'S.F.M Glass(Bottles)', 67, 19)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1241, 130, N'Lassi 200 ML Glass', 306, 20)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1242, 130, N'Lite Lassi 200 ML', 0, 21)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1243, 130, N'Shrikhand', 467, 22)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1244, 130, N'Chena Rabdi', 214, 23)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1245, 130, N'Sabudana Kheer 100 gm', 0, 24)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1246, 130, N'Peda', 506, 25)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1247, 130, N'Milk Cake', 58, 26)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1248, 130, N'Mawa', 8, 27)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1249, 130, N'Paneer', 135, 28)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1250, 130, N'Vaccum Paneer', 0, 29)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1251, 130, N'Rasogulla', 0, 30)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1252, 130, N'Gulabjamun', 0, 31)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1253, 130, N'Shrikhand Lite 100 gms cups', 0, 32)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1254, 130, N'Table Butter', 45, 33)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1255, 130, N'Cookies', 0, 34)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1256, 130, N'Sugar Free Peda', 2, 35)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1257, 130, N'Butter Chiplet', 0, 36)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1258, 130, N'Besan Laddu', 0, 37)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1259, 130, N'Sanchi Neer lit', 0, 38)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1260, 130, N'Misti Doi 100gm', 0, 39)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1261, 130, N'Braj Peda', 4, 40)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1262, 130, N'Amrakhand 100 gms', 6, 41)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1263, 131, N'SMP', 0, 10)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1264, 131, N'Sweeten SMP', 0, 11)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1265, 131, N'WB', 0, 12)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1266, 131, N'Plain curd', 3544, 13)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1267, 131, N'Sweet Curd', 1053, 14)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1268, 131, N'Salted Butter Milk 200 ML', 1359, 15)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1269, 131, N'Plain Butter Milk', 11975, 16)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1270, 131, N'Cold Coffee', 0, 17)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1271, 131, N'Fl.Milk Pet Bottle', 62, 18)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1272, 131, N'S.F.M Glass(Bottles)', 67, 19)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1273, 131, N'Lassi 200 ML Glass', 372, 20)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1274, 131, N'Lite Lassi 200 ML', 0, 21)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1275, 131, N'Shrikhand', 478, 22)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1276, 131, N'Chena Rabdi', 246, 23)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1277, 131, N'Sabudana Kheer 100 gm', 1, 24)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1278, 131, N'Peda', 402, 25)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1279, 131, N'Milk Cake', 69, 26)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1280, 131, N'Mawa', 7, 27)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1281, 131, N'Paneer', 121, 28)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1282, 131, N'Vaccum Paneer', 0, 29)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1283, 131, N'Rasogulla', 0, 30)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1284, 131, N'Gulabjamun', 0, 31)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1285, 131, N'Shrikhand Lite 100 gms cups', 0, 32)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1286, 131, N'Table Butter', 8, 33)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1287, 131, N'Cookies', 0, 34)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1288, 131, N'Sugar Free Peda', 2, 35)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1289, 131, N'Butter Chiplet', 2, 36)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1290, 131, N'Besan Laddu', 0, 37)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1291, 131, N'Sanchi Neer lit', 128, 38)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1292, 131, N'Misti Doi 100gm', 0, 39)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1293, 131, N'Braj Peda', 1, 40)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1294, 131, N'Amrakhand 100 gms', 5, 41)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1295, 132, N'SMP', 0, 10)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1296, 132, N'Sweeten SMP', 0, 11)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1297, 132, N'WB', 0, 12)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1298, 132, N'Plain curd', 2659, 13)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1299, 132, N'Sweet Curd', 682, 14)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1300, 132, N'Salted Butter Milk 200 ML', 1116, 15)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1301, 132, N'Plain Butter Milk', 9150, 16)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1302, 132, N'Cold Coffee', 0, 17)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1303, 132, N'Fl.Milk Pet Bottle', 0, 18)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1304, 132, N'S.F.M Glass(Bottles)', 45, 19)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1305, 132, N'Lassi 200 ML Glass', 190, 20)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1306, 132, N'Lite Lassi 200 ML', 0, 21)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1307, 132, N'Shrikhand', 358, 22)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1308, 132, N'Chena Rabdi', 212, 23)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1309, 132, N'Sabudana Kheer 100 gm', 0, 24)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1310, 132, N'Peda', 324, 25)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1311, 132, N'Milk Cake', 42, 26)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1312, 132, N'Mawa', 30, 27)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1313, 132, N'Paneer', 124, 28)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1314, 132, N'Vaccum Paneer', 0, 29)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1315, 132, N'Rasogulla', 0, 30)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1316, 132, N'Gulabjamun', 0, 31)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1317, 132, N'Shrikhand Lite 100 gms cups', 0, 32)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1318, 132, N'Table Butter', 2, 33)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1319, 132, N'Cookies', 0, 34)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1320, 132, N'Sugar Free Peda', 2, 35)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1321, 132, N'Butter Chiplet', 0, 36)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1322, 132, N'Besan Laddu', 0, 37)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1323, 132, N'Sanchi Neer lit', 0, 38)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1324, 132, N'Misti Doi 100gm', 0, 39)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1325, 132, N'Braj Peda', 1, 40)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1326, 132, N'Amrakhand 100 gms', 1, 41)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1327, 133, N'SMP', 0, 10)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1328, 133, N'Sweeten SMP', 0, 11)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1329, 133, N'WB', 0, 12)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1330, 133, N'Plain curd', 1978, 13)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1331, 133, N'Sweet Curd', 573, 14)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1332, 133, N'Salted Butter Milk 200 ML', 864, 15)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1333, 133, N'Plain Butter Milk', 6998, 16)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1334, 133, N'Cold Coffee', 0, 17)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1335, 133, N'Fl.Milk Pet Bottle', 0, 18)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1336, 133, N'S.F.M Glass(Bottles)', 45, 19)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1337, 133, N'Lassi 200 ML Glass', 128, 20)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1338, 133, N'Lite Lassi 200 ML', 0, 21)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1339, 133, N'Shrikhand', 305, 22)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1340, 133, N'Chena Rabdi', 195, 23)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1341, 133, N'Sabudana Kheer 100 gm', 0, 24)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1342, 133, N'Peda', 310, 25)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1343, 133, N'Milk Cake', 41, 26)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1344, 133, N'Mawa', 13, 27)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1345, 133, N'Paneer', 114, 28)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1346, 133, N'Vaccum Paneer', 0, 29)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1347, 133, N'Rasogulla', 0, 30)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1348, 133, N'Gulabjamun', 0, 31)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1349, 133, N'Shrikhand Lite 100 gms cups', 0, 32)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1350, 133, N'Table Butter', 23, 33)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1351, 133, N'Cookies', 0, 34)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1352, 133, N'Sugar Free Peda', 2, 35)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1353, 133, N'Butter Chiplet', 3, 36)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1354, 133, N'Besan Laddu', 0, 37)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1355, 133, N'Sanchi Neer lit', 0, 38)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1356, 133, N'Misti Doi 100gm', 0, 39)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1357, 133, N'Braj Peda', 4, 40)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1358, 133, N'Amrakhand 100 gms', 4, 41)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1359, 134, N'STD', 0, 1)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1360, 134, N'DTM', 0, 2)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1361, 134, N'LITE', 0, 3)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1362, 134, N'FCM', 0, 4)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1363, 134, N'Diamond', 0, 5)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1364, 134, N'TM', 0, 6)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1365, 134, N'CHAH', 0, 7)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1366, 134, N'FCM 1L', 0, 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1367, 134, N'Chai spl. 1000ML', 0, 9)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1368, 135, N'STD', 10, 1)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1369, 135, N'DTM', 10, 2)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1370, 135, N'LITE', 10, 3)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1371, 135, N'FCM', 10, 4)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1372, 135, N'Diamond', 0, 5)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1373, 135, N'TM', 0, 6)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1374, 135, N'CHAH', 0, 7)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1375, 135, N'FCM 1L', 0, 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1376, 135, N'Chai spl. 1000ML', 0, 9)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1377, 136, N'SMP', 10, 10)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1378, 136, N'Sweeten SMP', 10, 11)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1379, 136, N'WB', 10, 12)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1380, 136, N'Plain curd', 0, 13)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1381, 136, N'Sweet Curd', 0, 14)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1382, 136, N'Salted Butter Milk 200 ML', 0, 15)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1383, 136, N'Plain Butter Milk', 0, 16)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1384, 136, N'Cold Coffee', 0, 17)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1385, 136, N'Fl.Milk Pet Bottle', 0, 18)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1386, 136, N'S.F.M Glass(Bottles)', 0, 19)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1387, 136, N'Lassi 200 ML Glass', 0, 20)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1388, 136, N'Lite Lassi 200 ML', 0, 21)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1389, 136, N'Shrikhand', 0, 22)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1390, 136, N'Chena Rabdi', 0, 23)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1391, 136, N'Sabudana Kheer 100 gm', 0, 24)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1392, 136, N'Peda', 0, 25)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1393, 136, N'Milk Cake', 0, 26)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1394, 136, N'Mawa', 0, 27)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1395, 136, N'Paneer', 0, 28)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1396, 136, N'Vaccum Paneer', 0, 29)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1397, 136, N'Rasogulla', 0, 30)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1398, 136, N'Gulabjamun', 0, 31)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1399, 136, N'Shrikhand Lite 100 gms cups', 0, 32)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1400, 136, N'Table Butter', 0, 33)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1401, 136, N'Cookies', 0, 34)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1402, 136, N'Sugar Free Peda', 0, 35)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1403, 136, N'Butter Chiplet', 0, 36)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1404, 136, N'Besan Laddu', 0, 37)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1405, 136, N'Sanchi Neer lit', 0, 38)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1406, 136, N'Misti Doi 100gm', 0, 39)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1407, 136, N'Braj Peda', 0, 40)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1408, 136, N'Amrakhand 100 gms', 0, 41)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1409, 137, N'STD', 1, 1)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1410, 137, N'DTM', 1, 2)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1411, 137, N'LITE', 10, 3)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1412, 137, N'FCM', 10, 4)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1413, 137, N'Diamond', 10, 5)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1414, 137, N'TM', 10, 6)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1415, 137, N'CHAH', 0, 7)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1416, 137, N'FCM 1L', 0, 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1417, 137, N'Chai spl. 1000ML', 0, 9)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1418, 138, N'SMP', 100, 10)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1419, 138, N'Sweeten SMP', 200, 11)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1420, 138, N'WB', 500, 12)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1421, 138, N'Plain curd', 800, 13)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1422, 138, N'Sweet Curd', 900, 14)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1423, 138, N'Salted Butter Milk 200 ML', 0, 15)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1424, 138, N'Plain Butter Milk', 0, 16)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1425, 138, N'Cold Coffee', 0, 17)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1426, 138, N'Fl.Milk Pet Bottle', 0, 18)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1427, 138, N'S.F.M Glass(Bottles)', 0, 19)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1428, 138, N'Lassi 200 ML Glass', 0, 20)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1429, 138, N'Lite Lassi 200 ML', 0, 21)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1430, 138, N'Shrikhand', 0, 22)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1431, 138, N'Chena Rabdi', 0, 23)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1432, 138, N'Sabudana Kheer 100 gm', 0, 24)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1433, 138, N'Peda', 0, 25)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1434, 138, N'Milk Cake', 0, 26)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1435, 138, N'Mawa', 0, 27)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1436, 138, N'Paneer', 0, 28)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1437, 138, N'Vaccum Paneer', 0, 29)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1438, 138, N'Rasogulla', 0, 30)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1439, 138, N'Gulabjamun', 0, 31)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1440, 138, N'Shrikhand Lite 100 gms cups', 0, 32)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1441, 138, N'Table Butter', 0, 33)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1442, 138, N'Cookies', 0, 34)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1443, 138, N'Sugar Free Peda', 0, 35)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1444, 138, N'Butter Chiplet', 0, 36)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1445, 138, N'Besan Laddu', 0, 37)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1446, 138, N'Sanchi Neer lit', 0, 38)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1447, 138, N'Misti Doi 100gm', 0, 39)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1448, 138, N'Braj Peda', 0, 40)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1449, 138, N'Amrakhand 100 gms', 0, 41)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1450, 139, N'STD', 15, 1)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1451, 139, N'DTM', 25, 2)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1452, 139, N'LITE', 35, 3)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1453, 139, N'FCM', 15, 4)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1454, 139, N'Diamond', 40, 5)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1455, 139, N'TM', 0, 6)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1456, 139, N'CHAH', 0, 7)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1457, 139, N'FCM 1L', 0, 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1458, 139, N'Chai spl. 1000ML', 0, 9)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1459, 140, N'SMP', 22, 10)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1460, 140, N'Sweeten SMP', 55, 11)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1461, 140, N'WB', 11, 12)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1462, 140, N'Plain curd', 33, 13)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1463, 140, N'Sweet Curd', 55, 14)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1464, 140, N'Salted Butter Milk 200 ML', 22, 15)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1465, 140, N'Plain Butter Milk', 0, 16)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1466, 140, N'Cold Coffee', 0, 17)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1467, 140, N'Fl.Milk Pet Bottle', 0, 18)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1468, 140, N'S.F.M Glass(Bottles)', 0, 19)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1469, 140, N'Lassi 200 ML Glass', 0, 20)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1470, 140, N'Lite Lassi 200 ML', 0, 21)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1471, 140, N'Shrikhand', 0, 22)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1472, 140, N'Chena Rabdi', 0, 23)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1473, 140, N'Sabudana Kheer 100 gm', 0, 24)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1474, 140, N'Peda', 0, 25)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1475, 140, N'Milk Cake', 0, 26)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1476, 140, N'Mawa', 0, 27)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1477, 140, N'Paneer', 0, 28)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1478, 140, N'Vaccum Paneer', 0, 29)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1479, 140, N'Rasogulla', 0, 30)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1480, 140, N'Gulabjamun', 0, 31)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1481, 140, N'Shrikhand Lite 100 gms cups', 0, 32)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1482, 140, N'Table Butter', 0, 33)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1483, 140, N'Cookies', 0, 34)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1484, 140, N'Sugar Free Peda', 0, 35)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1485, 140, N'Butter Chiplet', 0, 36)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1486, 140, N'Besan Laddu', 0, 37)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1487, 140, N'Sanchi Neer lit', 0, 38)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1488, 140, N'Misti Doi 100gm', 0, 39)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1489, 140, N'Braj Peda', 0, 40)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1490, 140, N'Amrakhand 100 gms', 0, 41)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1491, 141, N'STD', 21602, 1)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1492, 141, N'DTM', 30343, 2)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1493, 141, N'LITE', 0, 3)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1494, 141, N'FCM', 98819, 4)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1495, 141, N'Diamond', 92, 5)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1496, 141, N'TM', 4293, 6)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1497, 141, N'CHAH', 55801, 7)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1498, 141, N'FCM 1L', 7598, 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1499, 141, N'Chai spl. 1000ML', 1479, 9)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1500, 142, N'STD', 10, 1)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1501, 142, N'DTM', 173, 2)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1502, 142, N'LITE', 0, 3)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1503, 142, N'FCM', 330, 4)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1504, 142, N'Diamond', 0, 5)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1505, 142, N'TM', 415, 6)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1506, 142, N'CHAH', 470, 7)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1507, 142, N'FCM 1L', 30, 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1508, 142, N'Chai spl. 1000ML', 30, 9)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1509, 143, N'STD', 80, 1)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1510, 143, N'DTM', 492, 2)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1511, 143, N'LITE', 0, 3)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1512, 143, N'FCM', 1558, 4)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1513, 143, N'Diamond', 0, 5)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1514, 143, N'TM', 698, 6)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1515, 143, N'CHAH', 588, 7)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1516, 143, N'FCM 1L', 0, 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1517, 143, N'Chai spl. 1000ML', 260, 9)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1518, 144, N'STD', 450, 1)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1519, 144, N'DTM', 270, 2)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1520, 144, N'LITE', 0, 3)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1521, 144, N'FCM', 570, 4)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1522, 144, N'Diamond', 0, 5)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1523, 144, N'TM', 1160, 6)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1524, 144, N'CHAH', 1300, 7)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1525, 144, N'FCM 1L', 0, 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1526, 144, N'Chai spl. 1000ML', 0, 9)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1527, 145, N'STD', 14, 1)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1528, 145, N'DTM', 451, 2)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1529, 145, N'LITE', 0, 3)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1530, 145, N'FCM', 520, 4)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1531, 145, N'Diamond', 0, 5)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1532, 145, N'TM', 350, 6)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1533, 145, N'CHAH', 800, 7)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1534, 145, N'FCM 1L', 40, 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1535, 145, N'Chai spl. 1000ML', 120, 9)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1536, 146, N'STD', 66, 1)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1537, 146, N'DTM', 200, 2)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1538, 146, N'LITE', 0, 3)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1539, 146, N'FCM', 188, 4)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1540, 146, N'Diamond', 0, 5)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1541, 146, N'TM', 575, 6)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1542, 146, N'CHAH', 460, 7)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1543, 146, N'FCM 1L', 15, 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1544, 146, N'Chai spl. 1000ML', 40, 9)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1545, 147, N'STD', 0, 1)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1546, 147, N'DTM', 283, 2)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1547, 147, N'LITE', 0, 3)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1548, 147, N'FCM', 675, 4)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1549, 147, N'Diamond', 0, 5)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1550, 147, N'TM', 1380, 6)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1551, 147, N'CHAH', 17, 7)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1552, 147, N'FCM 1L', 0, 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1553, 147, N'Chai spl. 1000ML', 0, 9)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1554, 148, N'STD', 59, 1)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1555, 148, N'DTM', 343, 2)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1556, 148, N'LITE', 0, 3)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1557, 148, N'FCM', 225, 4)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1558, 148, N'Diamond', 5, 5)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1559, 148, N'TM', 270, 6)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1560, 148, N'CHAH', 410, 7)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1561, 148, N'FCM 1L', 5, 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1562, 148, N'Chai spl. 1000ML', 175, 9)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1563, 149, N'STD', 0, 1)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1564, 149, N'DTM', 297, 2)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1565, 149, N'LITE', 0, 3)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1566, 149, N'FCM', 440, 4)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1567, 149, N'Diamond', 0, 5)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1568, 149, N'TM', 640, 6)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1569, 149, N'CHAH', 1020, 7)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1570, 149, N'FCM 1L', 0, 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1571, 149, N'Chai spl. 1000ML', 200, 9)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1572, 150, N'STD', 10, 1)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1573, 150, N'DTM', 382, 2)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1574, 150, N'LITE', 0, 3)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1575, 150, N'FCM', 158, 4)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1576, 150, N'Diamond', 9, 5)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1577, 150, N'TM', 831, 6)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1578, 150, N'CHAH', 1410, 7)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1579, 150, N'FCM 1L', 50, 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1580, 150, N'Chai spl. 1000ML', 50, 9)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1581, 151, N'STD', 240, 1)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1582, 151, N'DTM', 499, 2)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1583, 151, N'LITE', 0, 3)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1584, 151, N'FCM', 955, 4)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1585, 151, N'Diamond', 40, 5)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1586, 151, N'TM', 760, 6)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1587, 151, N'CHAH', 1820, 7)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1588, 151, N'FCM 1L', 230, 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1589, 151, N'Chai spl. 1000ML', 70, 9)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1590, 152, N'STD', 0, 1)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1591, 152, N'DTM', 45, 2)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1592, 152, N'LITE', 0, 3)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1593, 152, N'FCM', 118, 4)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1594, 152, N'Diamond', 0, 5)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1595, 152, N'TM', 385, 6)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1596, 152, N'CHAH', 555, 7)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1597, 152, N'FCM 1L', 85, 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1598, 152, N'Chai spl. 1000ML', 85, 9)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1599, 153, N'STD', 28, 1)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1600, 153, N'DTM', 905, 2)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1601, 153, N'LITE', 0, 3)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1602, 153, N'FCM', 590, 4)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1603, 153, N'Diamond', 0, 5)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1604, 153, N'TM', 220, 6)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1605, 153, N'CHAH', 3780, 7)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1606, 153, N'FCM 1L', 455, 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1607, 153, N'Chai spl. 1000ML', 80, 9)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1608, 154, N'STD', 0, 1)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1609, 154, N'DTM', 368, 2)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1610, 154, N'LITE', 0, 3)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1611, 154, N'FCM', 143, 4)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1612, 154, N'Diamond', 0, 5)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1613, 154, N'TM', 1050, 6)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1614, 154, N'CHAH', 970, 7)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1615, 154, N'FCM 1L', 0, 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1616, 154, N'Chai spl. 1000ML', 90, 9)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1617, 155, N'STD', 0, 1)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1618, 155, N'DTM', 456, 2)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1619, 155, N'LITE', 0, 3)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1620, 155, N'FCM', 680, 4)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1621, 155, N'Diamond', 0, 5)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1622, 155, N'TM', 1100, 6)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1623, 155, N'CHAH', 570, 7)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1624, 155, N'FCM 1L', 490, 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1625, 155, N'Chai spl. 1000ML', 10, 9)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1626, 156, N'STD', 23, 1)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1627, 156, N'DTM', 468, 2)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1628, 156, N'LITE', 0, 3)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1629, 156, N'FCM', 430, 4)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1630, 156, N'Diamond', 0, 5)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1631, 156, N'TM', 1050, 6)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1632, 156, N'CHAH', 1680, 7)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1633, 156, N'FCM 1L', 60, 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1634, 156, N'Chai spl. 1000ML', 220, 9)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1635, 157, N'STD', 0, 1)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1636, 157, N'DTM', 673, 2)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1637, 157, N'LITE', 0, 3)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1638, 157, N'FCM', 290, 4)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1639, 157, N'Diamond', 10, 5)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1640, 157, N'TM', 1088, 6)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1641, 157, N'CHAH', 4120, 7)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1642, 157, N'FCM 1L', 255, 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1643, 157, N'Chai spl. 1000ML', 150, 9)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1644, 158, N'STD', 305, 1)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1645, 158, N'DTM', 774, 2)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1646, 158, N'LITE', 0, 3)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1647, 158, N'FCM', 1670, 4)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1648, 158, N'Diamond', 0, 5)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1649, 158, N'TM', 1250, 6)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1650, 158, N'CHAH', 6560, 7)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1651, 158, N'FCM 1L', 0, 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1652, 158, N'Chai spl. 1000ML', 0, 9)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1653, 159, N'STD', 10, 1)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1654, 159, N'DTM', 20, 2)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1655, 159, N'LITE', 22, 3)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1656, 159, N'FCM', 55, 4)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1657, 159, N'Diamond', 0, 5)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1658, 159, N'TM', 0, 6)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1659, 159, N'CHAH', 0, 7)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1660, 159, N'FCM 1L', 0, 8)
GO
INSERT [dbo].[trn_SaleChild] ([SaleChildid], [SalesID], [ItemName], [Quantity], [ItemID]) VALUES (1661, 159, N'Chai spl. 1000ML', 0, 9)
GO
SET IDENTITY_INSERT [dbo].[trn_SaleChild] OFF
GO
SET IDENTITY_INSERT [dbo].[TrnTarget] ON 
GO
INSERT [dbo].[TrnTarget] ([TargetId], [Targetmonth], [ItemCategory]) VALUES (2, CAST(N'2024-10-01' AS Date), N'Milk')
GO
INSERT [dbo].[TrnTarget] ([TargetId], [Targetmonth], [ItemCategory]) VALUES (3, CAST(N'2024-10-03' AS Date), N'Milk')
GO
INSERT [dbo].[TrnTarget] ([TargetId], [Targetmonth], [ItemCategory]) VALUES (4, CAST(N'2024-10-04' AS Date), N'Milk')
GO
INSERT [dbo].[TrnTarget] ([TargetId], [Targetmonth], [ItemCategory]) VALUES (5, CAST(N'2024-10-05' AS Date), N'Milk')
GO
INSERT [dbo].[TrnTarget] ([TargetId], [Targetmonth], [ItemCategory]) VALUES (6, CAST(N'2024-10-06' AS Date), N'Milk')
GO
INSERT [dbo].[TrnTarget] ([TargetId], [Targetmonth], [ItemCategory]) VALUES (7, CAST(N'2024-10-07' AS Date), N'Milk')
GO
INSERT [dbo].[TrnTarget] ([TargetId], [Targetmonth], [ItemCategory]) VALUES (8, CAST(N'2024-10-02' AS Date), N'Milk')
GO
INSERT [dbo].[TrnTarget] ([TargetId], [Targetmonth], [ItemCategory]) VALUES (9, CAST(N'2024-11-10' AS Date), N'Milk')
GO
INSERT [dbo].[TrnTarget] ([TargetId], [Targetmonth], [ItemCategory]) VALUES (10, CAST(N'2024-11-11' AS Date), N'Milk')
GO
INSERT [dbo].[TrnTarget] ([TargetId], [Targetmonth], [ItemCategory]) VALUES (11, CAST(N'2024-11-11' AS Date), N'Product')
GO
INSERT [dbo].[TrnTarget] ([TargetId], [Targetmonth], [ItemCategory]) VALUES (12, CAST(N'2024-11-08' AS Date), N'Product')
GO
SET IDENTITY_INSERT [dbo].[TrnTarget] OFF
GO
SET IDENTITY_INSERT [dbo].[trnTargetChild] ON 
GO
INSERT [dbo].[trnTargetChild] ([TargetChildID], [TargetId], [ItemID], [ItemName], [TargetData], [Cumulative], [TargetAbsolute], [AvggrowthPerc]) VALUES (10, 2, 1, N'STD', CAST(347743.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[trnTargetChild] ([TargetChildID], [TargetId], [ItemID], [ItemName], [TargetData], [Cumulative], [TargetAbsolute], [AvggrowthPerc]) VALUES (11, 2, 2, N'DTM', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[trnTargetChild] ([TargetChildID], [TargetId], [ItemID], [ItemName], [TargetData], [Cumulative], [TargetAbsolute], [AvggrowthPerc]) VALUES (12, 2, 3, N'LITE', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[trnTargetChild] ([TargetChildID], [TargetId], [ItemID], [ItemName], [TargetData], [Cumulative], [TargetAbsolute], [AvggrowthPerc]) VALUES (13, 2, 4, N'FCM', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[trnTargetChild] ([TargetChildID], [TargetId], [ItemID], [ItemName], [TargetData], [Cumulative], [TargetAbsolute], [AvggrowthPerc]) VALUES (14, 2, 5, N'Diamond', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[trnTargetChild] ([TargetChildID], [TargetId], [ItemID], [ItemName], [TargetData], [Cumulative], [TargetAbsolute], [AvggrowthPerc]) VALUES (15, 2, 6, N'TM', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[trnTargetChild] ([TargetChildID], [TargetId], [ItemID], [ItemName], [TargetData], [Cumulative], [TargetAbsolute], [AvggrowthPerc]) VALUES (16, 2, 7, N'CHAH', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[trnTargetChild] ([TargetChildID], [TargetId], [ItemID], [ItemName], [TargetData], [Cumulative], [TargetAbsolute], [AvggrowthPerc]) VALUES (17, 2, 8, N'FCM 1L', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[trnTargetChild] ([TargetChildID], [TargetId], [ItemID], [ItemName], [TargetData], [Cumulative], [TargetAbsolute], [AvggrowthPerc]) VALUES (18, 2, 9, N'Chai spl. 1000ML', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[trnTargetChild] ([TargetChildID], [TargetId], [ItemID], [ItemName], [TargetData], [Cumulative], [TargetAbsolute], [AvggrowthPerc]) VALUES (19, 3, 1, N'STD', CAST(347743.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[trnTargetChild] ([TargetChildID], [TargetId], [ItemID], [ItemName], [TargetData], [Cumulative], [TargetAbsolute], [AvggrowthPerc]) VALUES (20, 3, 2, N'DTM', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[trnTargetChild] ([TargetChildID], [TargetId], [ItemID], [ItemName], [TargetData], [Cumulative], [TargetAbsolute], [AvggrowthPerc]) VALUES (21, 3, 3, N'LITE', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[trnTargetChild] ([TargetChildID], [TargetId], [ItemID], [ItemName], [TargetData], [Cumulative], [TargetAbsolute], [AvggrowthPerc]) VALUES (22, 3, 4, N'FCM', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[trnTargetChild] ([TargetChildID], [TargetId], [ItemID], [ItemName], [TargetData], [Cumulative], [TargetAbsolute], [AvggrowthPerc]) VALUES (23, 3, 5, N'Diamond', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[trnTargetChild] ([TargetChildID], [TargetId], [ItemID], [ItemName], [TargetData], [Cumulative], [TargetAbsolute], [AvggrowthPerc]) VALUES (24, 3, 6, N'TM', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[trnTargetChild] ([TargetChildID], [TargetId], [ItemID], [ItemName], [TargetData], [Cumulative], [TargetAbsolute], [AvggrowthPerc]) VALUES (25, 3, 7, N'CHAH', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[trnTargetChild] ([TargetChildID], [TargetId], [ItemID], [ItemName], [TargetData], [Cumulative], [TargetAbsolute], [AvggrowthPerc]) VALUES (26, 3, 8, N'FCM 1L', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[trnTargetChild] ([TargetChildID], [TargetId], [ItemID], [ItemName], [TargetData], [Cumulative], [TargetAbsolute], [AvggrowthPerc]) VALUES (27, 3, 9, N'Chai spl. 1000ML', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[trnTargetChild] ([TargetChildID], [TargetId], [ItemID], [ItemName], [TargetData], [Cumulative], [TargetAbsolute], [AvggrowthPerc]) VALUES (28, 4, 1, N'STD', CAST(347743.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[trnTargetChild] ([TargetChildID], [TargetId], [ItemID], [ItemName], [TargetData], [Cumulative], [TargetAbsolute], [AvggrowthPerc]) VALUES (29, 4, 2, N'DTM', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[trnTargetChild] ([TargetChildID], [TargetId], [ItemID], [ItemName], [TargetData], [Cumulative], [TargetAbsolute], [AvggrowthPerc]) VALUES (30, 4, 3, N'LITE', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[trnTargetChild] ([TargetChildID], [TargetId], [ItemID], [ItemName], [TargetData], [Cumulative], [TargetAbsolute], [AvggrowthPerc]) VALUES (31, 4, 4, N'FCM', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[trnTargetChild] ([TargetChildID], [TargetId], [ItemID], [ItemName], [TargetData], [Cumulative], [TargetAbsolute], [AvggrowthPerc]) VALUES (32, 4, 5, N'Diamond', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[trnTargetChild] ([TargetChildID], [TargetId], [ItemID], [ItemName], [TargetData], [Cumulative], [TargetAbsolute], [AvggrowthPerc]) VALUES (33, 4, 6, N'TM', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[trnTargetChild] ([TargetChildID], [TargetId], [ItemID], [ItemName], [TargetData], [Cumulative], [TargetAbsolute], [AvggrowthPerc]) VALUES (34, 4, 7, N'CHAH', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[trnTargetChild] ([TargetChildID], [TargetId], [ItemID], [ItemName], [TargetData], [Cumulative], [TargetAbsolute], [AvggrowthPerc]) VALUES (35, 4, 8, N'FCM 1L', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[trnTargetChild] ([TargetChildID], [TargetId], [ItemID], [ItemName], [TargetData], [Cumulative], [TargetAbsolute], [AvggrowthPerc]) VALUES (36, 4, 9, N'Chai spl. 1000ML', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[trnTargetChild] ([TargetChildID], [TargetId], [ItemID], [ItemName], [TargetData], [Cumulative], [TargetAbsolute], [AvggrowthPerc]) VALUES (37, 5, 1, N'STD', CAST(347743.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[trnTargetChild] ([TargetChildID], [TargetId], [ItemID], [ItemName], [TargetData], [Cumulative], [TargetAbsolute], [AvggrowthPerc]) VALUES (38, 5, 2, N'DTM', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[trnTargetChild] ([TargetChildID], [TargetId], [ItemID], [ItemName], [TargetData], [Cumulative], [TargetAbsolute], [AvggrowthPerc]) VALUES (39, 5, 3, N'LITE', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[trnTargetChild] ([TargetChildID], [TargetId], [ItemID], [ItemName], [TargetData], [Cumulative], [TargetAbsolute], [AvggrowthPerc]) VALUES (40, 5, 4, N'FCM', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[trnTargetChild] ([TargetChildID], [TargetId], [ItemID], [ItemName], [TargetData], [Cumulative], [TargetAbsolute], [AvggrowthPerc]) VALUES (41, 5, 5, N'Diamond', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[trnTargetChild] ([TargetChildID], [TargetId], [ItemID], [ItemName], [TargetData], [Cumulative], [TargetAbsolute], [AvggrowthPerc]) VALUES (42, 5, 6, N'TM', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[trnTargetChild] ([TargetChildID], [TargetId], [ItemID], [ItemName], [TargetData], [Cumulative], [TargetAbsolute], [AvggrowthPerc]) VALUES (43, 5, 7, N'CHAH', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[trnTargetChild] ([TargetChildID], [TargetId], [ItemID], [ItemName], [TargetData], [Cumulative], [TargetAbsolute], [AvggrowthPerc]) VALUES (44, 5, 8, N'FCM 1L', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[trnTargetChild] ([TargetChildID], [TargetId], [ItemID], [ItemName], [TargetData], [Cumulative], [TargetAbsolute], [AvggrowthPerc]) VALUES (45, 5, 9, N'Chai spl. 1000ML', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[trnTargetChild] ([TargetChildID], [TargetId], [ItemID], [ItemName], [TargetData], [Cumulative], [TargetAbsolute], [AvggrowthPerc]) VALUES (46, 6, 1, N'STD', CAST(347743.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[trnTargetChild] ([TargetChildID], [TargetId], [ItemID], [ItemName], [TargetData], [Cumulative], [TargetAbsolute], [AvggrowthPerc]) VALUES (47, 6, 2, N'DTM', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[trnTargetChild] ([TargetChildID], [TargetId], [ItemID], [ItemName], [TargetData], [Cumulative], [TargetAbsolute], [AvggrowthPerc]) VALUES (48, 6, 3, N'LITE', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[trnTargetChild] ([TargetChildID], [TargetId], [ItemID], [ItemName], [TargetData], [Cumulative], [TargetAbsolute], [AvggrowthPerc]) VALUES (49, 6, 4, N'FCM', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[trnTargetChild] ([TargetChildID], [TargetId], [ItemID], [ItemName], [TargetData], [Cumulative], [TargetAbsolute], [AvggrowthPerc]) VALUES (50, 6, 5, N'Diamond', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[trnTargetChild] ([TargetChildID], [TargetId], [ItemID], [ItemName], [TargetData], [Cumulative], [TargetAbsolute], [AvggrowthPerc]) VALUES (51, 6, 6, N'TM', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[trnTargetChild] ([TargetChildID], [TargetId], [ItemID], [ItemName], [TargetData], [Cumulative], [TargetAbsolute], [AvggrowthPerc]) VALUES (52, 6, 7, N'CHAH', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[trnTargetChild] ([TargetChildID], [TargetId], [ItemID], [ItemName], [TargetData], [Cumulative], [TargetAbsolute], [AvggrowthPerc]) VALUES (53, 6, 8, N'FCM 1L', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[trnTargetChild] ([TargetChildID], [TargetId], [ItemID], [ItemName], [TargetData], [Cumulative], [TargetAbsolute], [AvggrowthPerc]) VALUES (54, 6, 9, N'Chai spl. 1000ML', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[trnTargetChild] ([TargetChildID], [TargetId], [ItemID], [ItemName], [TargetData], [Cumulative], [TargetAbsolute], [AvggrowthPerc]) VALUES (55, 7, 1, N'STD', CAST(347743.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[trnTargetChild] ([TargetChildID], [TargetId], [ItemID], [ItemName], [TargetData], [Cumulative], [TargetAbsolute], [AvggrowthPerc]) VALUES (56, 7, 2, N'DTM', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[trnTargetChild] ([TargetChildID], [TargetId], [ItemID], [ItemName], [TargetData], [Cumulative], [TargetAbsolute], [AvggrowthPerc]) VALUES (57, 7, 3, N'LITE', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[trnTargetChild] ([TargetChildID], [TargetId], [ItemID], [ItemName], [TargetData], [Cumulative], [TargetAbsolute], [AvggrowthPerc]) VALUES (58, 7, 4, N'FCM', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[trnTargetChild] ([TargetChildID], [TargetId], [ItemID], [ItemName], [TargetData], [Cumulative], [TargetAbsolute], [AvggrowthPerc]) VALUES (59, 7, 5, N'Diamond', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[trnTargetChild] ([TargetChildID], [TargetId], [ItemID], [ItemName], [TargetData], [Cumulative], [TargetAbsolute], [AvggrowthPerc]) VALUES (60, 7, 6, N'TM', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[trnTargetChild] ([TargetChildID], [TargetId], [ItemID], [ItemName], [TargetData], [Cumulative], [TargetAbsolute], [AvggrowthPerc]) VALUES (61, 7, 7, N'CHAH', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[trnTargetChild] ([TargetChildID], [TargetId], [ItemID], [ItemName], [TargetData], [Cumulative], [TargetAbsolute], [AvggrowthPerc]) VALUES (62, 7, 8, N'FCM 1L', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[trnTargetChild] ([TargetChildID], [TargetId], [ItemID], [ItemName], [TargetData], [Cumulative], [TargetAbsolute], [AvggrowthPerc]) VALUES (63, 7, 9, N'Chai spl. 1000ML', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[trnTargetChild] ([TargetChildID], [TargetId], [ItemID], [ItemName], [TargetData], [Cumulative], [TargetAbsolute], [AvggrowthPerc]) VALUES (64, 8, 1, N'STD', CAST(347743.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[trnTargetChild] ([TargetChildID], [TargetId], [ItemID], [ItemName], [TargetData], [Cumulative], [TargetAbsolute], [AvggrowthPerc]) VALUES (65, 8, 2, N'DTM', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[trnTargetChild] ([TargetChildID], [TargetId], [ItemID], [ItemName], [TargetData], [Cumulative], [TargetAbsolute], [AvggrowthPerc]) VALUES (66, 8, 3, N'LITE', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[trnTargetChild] ([TargetChildID], [TargetId], [ItemID], [ItemName], [TargetData], [Cumulative], [TargetAbsolute], [AvggrowthPerc]) VALUES (67, 8, 4, N'FCM', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[trnTargetChild] ([TargetChildID], [TargetId], [ItemID], [ItemName], [TargetData], [Cumulative], [TargetAbsolute], [AvggrowthPerc]) VALUES (68, 8, 5, N'Diamond', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[trnTargetChild] ([TargetChildID], [TargetId], [ItemID], [ItemName], [TargetData], [Cumulative], [TargetAbsolute], [AvggrowthPerc]) VALUES (69, 8, 6, N'TM', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[trnTargetChild] ([TargetChildID], [TargetId], [ItemID], [ItemName], [TargetData], [Cumulative], [TargetAbsolute], [AvggrowthPerc]) VALUES (70, 8, 7, N'CHAH', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[trnTargetChild] ([TargetChildID], [TargetId], [ItemID], [ItemName], [TargetData], [Cumulative], [TargetAbsolute], [AvggrowthPerc]) VALUES (71, 8, 8, N'FCM 1L', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[trnTargetChild] ([TargetChildID], [TargetId], [ItemID], [ItemName], [TargetData], [Cumulative], [TargetAbsolute], [AvggrowthPerc]) VALUES (72, 8, 9, N'Chai spl. 1000ML', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[trnTargetChild] ([TargetChildID], [TargetId], [ItemID], [ItemName], [TargetData], [Cumulative], [TargetAbsolute], [AvggrowthPerc]) VALUES (73, 9, 1, N'STD', CAST(10.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[trnTargetChild] ([TargetChildID], [TargetId], [ItemID], [ItemName], [TargetData], [Cumulative], [TargetAbsolute], [AvggrowthPerc]) VALUES (74, 9, 2, N'DTM', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[trnTargetChild] ([TargetChildID], [TargetId], [ItemID], [ItemName], [TargetData], [Cumulative], [TargetAbsolute], [AvggrowthPerc]) VALUES (75, 9, 3, N'LITE', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[trnTargetChild] ([TargetChildID], [TargetId], [ItemID], [ItemName], [TargetData], [Cumulative], [TargetAbsolute], [AvggrowthPerc]) VALUES (76, 9, 4, N'FCM', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[trnTargetChild] ([TargetChildID], [TargetId], [ItemID], [ItemName], [TargetData], [Cumulative], [TargetAbsolute], [AvggrowthPerc]) VALUES (77, 9, 5, N'Diamond', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[trnTargetChild] ([TargetChildID], [TargetId], [ItemID], [ItemName], [TargetData], [Cumulative], [TargetAbsolute], [AvggrowthPerc]) VALUES (78, 9, 6, N'TM', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[trnTargetChild] ([TargetChildID], [TargetId], [ItemID], [ItemName], [TargetData], [Cumulative], [TargetAbsolute], [AvggrowthPerc]) VALUES (79, 9, 7, N'CHAH', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[trnTargetChild] ([TargetChildID], [TargetId], [ItemID], [ItemName], [TargetData], [Cumulative], [TargetAbsolute], [AvggrowthPerc]) VALUES (80, 9, 8, N'FCM 1L', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[trnTargetChild] ([TargetChildID], [TargetId], [ItemID], [ItemName], [TargetData], [Cumulative], [TargetAbsolute], [AvggrowthPerc]) VALUES (81, 9, 9, N'Chai spl. 1000ML', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[trnTargetChild] ([TargetChildID], [TargetId], [ItemID], [ItemName], [TargetData], [Cumulative], [TargetAbsolute], [AvggrowthPerc]) VALUES (82, 10, 1, N'STD', CAST(10.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[trnTargetChild] ([TargetChildID], [TargetId], [ItemID], [ItemName], [TargetData], [Cumulative], [TargetAbsolute], [AvggrowthPerc]) VALUES (83, 10, 2, N'DTM', CAST(20.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[trnTargetChild] ([TargetChildID], [TargetId], [ItemID], [ItemName], [TargetData], [Cumulative], [TargetAbsolute], [AvggrowthPerc]) VALUES (84, 10, 3, N'LITE', CAST(30.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[trnTargetChild] ([TargetChildID], [TargetId], [ItemID], [ItemName], [TargetData], [Cumulative], [TargetAbsolute], [AvggrowthPerc]) VALUES (85, 10, 4, N'FCM', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[trnTargetChild] ([TargetChildID], [TargetId], [ItemID], [ItemName], [TargetData], [Cumulative], [TargetAbsolute], [AvggrowthPerc]) VALUES (86, 10, 5, N'Diamond', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[trnTargetChild] ([TargetChildID], [TargetId], [ItemID], [ItemName], [TargetData], [Cumulative], [TargetAbsolute], [AvggrowthPerc]) VALUES (87, 10, 6, N'TM', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[trnTargetChild] ([TargetChildID], [TargetId], [ItemID], [ItemName], [TargetData], [Cumulative], [TargetAbsolute], [AvggrowthPerc]) VALUES (88, 10, 7, N'CHAH', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[trnTargetChild] ([TargetChildID], [TargetId], [ItemID], [ItemName], [TargetData], [Cumulative], [TargetAbsolute], [AvggrowthPerc]) VALUES (89, 10, 8, N'FCM 1L', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[trnTargetChild] ([TargetChildID], [TargetId], [ItemID], [ItemName], [TargetData], [Cumulative], [TargetAbsolute], [AvggrowthPerc]) VALUES (90, 10, 9, N'Chai spl. 1000ML', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[trnTargetChild] ([TargetChildID], [TargetId], [ItemID], [ItemName], [TargetData], [Cumulative], [TargetAbsolute], [AvggrowthPerc]) VALUES (91, 11, 10, N'SMP', CAST(10.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[trnTargetChild] ([TargetChildID], [TargetId], [ItemID], [ItemName], [TargetData], [Cumulative], [TargetAbsolute], [AvggrowthPerc]) VALUES (92, 11, 11, N'Sweeten SMP', CAST(23.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[trnTargetChild] ([TargetChildID], [TargetId], [ItemID], [ItemName], [TargetData], [Cumulative], [TargetAbsolute], [AvggrowthPerc]) VALUES (93, 11, 12, N'WB', CAST(33.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[trnTargetChild] ([TargetChildID], [TargetId], [ItemID], [ItemName], [TargetData], [Cumulative], [TargetAbsolute], [AvggrowthPerc]) VALUES (94, 11, 13, N'Plain curd', CAST(44.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[trnTargetChild] ([TargetChildID], [TargetId], [ItemID], [ItemName], [TargetData], [Cumulative], [TargetAbsolute], [AvggrowthPerc]) VALUES (95, 11, 14, N'Sweet Curd', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[trnTargetChild] ([TargetChildID], [TargetId], [ItemID], [ItemName], [TargetData], [Cumulative], [TargetAbsolute], [AvggrowthPerc]) VALUES (96, 11, 15, N'Salted Butter Milk 200 ML', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[trnTargetChild] ([TargetChildID], [TargetId], [ItemID], [ItemName], [TargetData], [Cumulative], [TargetAbsolute], [AvggrowthPerc]) VALUES (97, 11, 16, N'Plain Butter Milk', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[trnTargetChild] ([TargetChildID], [TargetId], [ItemID], [ItemName], [TargetData], [Cumulative], [TargetAbsolute], [AvggrowthPerc]) VALUES (98, 11, 17, N'Cold Coffee', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[trnTargetChild] ([TargetChildID], [TargetId], [ItemID], [ItemName], [TargetData], [Cumulative], [TargetAbsolute], [AvggrowthPerc]) VALUES (99, 11, 18, N'Fl.Milk Pet Bottle', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[trnTargetChild] ([TargetChildID], [TargetId], [ItemID], [ItemName], [TargetData], [Cumulative], [TargetAbsolute], [AvggrowthPerc]) VALUES (100, 11, 19, N'S.F.M Glass(Bottles)', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[trnTargetChild] ([TargetChildID], [TargetId], [ItemID], [ItemName], [TargetData], [Cumulative], [TargetAbsolute], [AvggrowthPerc]) VALUES (101, 11, 20, N'Lassi 200 ML Glass', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[trnTargetChild] ([TargetChildID], [TargetId], [ItemID], [ItemName], [TargetData], [Cumulative], [TargetAbsolute], [AvggrowthPerc]) VALUES (102, 11, 21, N'Lite Lassi 200 ML', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[trnTargetChild] ([TargetChildID], [TargetId], [ItemID], [ItemName], [TargetData], [Cumulative], [TargetAbsolute], [AvggrowthPerc]) VALUES (103, 11, 22, N'Shrikhand', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[trnTargetChild] ([TargetChildID], [TargetId], [ItemID], [ItemName], [TargetData], [Cumulative], [TargetAbsolute], [AvggrowthPerc]) VALUES (104, 11, 23, N'Chena Rabdi', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[trnTargetChild] ([TargetChildID], [TargetId], [ItemID], [ItemName], [TargetData], [Cumulative], [TargetAbsolute], [AvggrowthPerc]) VALUES (105, 11, 24, N'Sabudana Kheer 100 gm', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[trnTargetChild] ([TargetChildID], [TargetId], [ItemID], [ItemName], [TargetData], [Cumulative], [TargetAbsolute], [AvggrowthPerc]) VALUES (106, 11, 25, N'Peda', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[trnTargetChild] ([TargetChildID], [TargetId], [ItemID], [ItemName], [TargetData], [Cumulative], [TargetAbsolute], [AvggrowthPerc]) VALUES (107, 11, 26, N'Milk Cake', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[trnTargetChild] ([TargetChildID], [TargetId], [ItemID], [ItemName], [TargetData], [Cumulative], [TargetAbsolute], [AvggrowthPerc]) VALUES (108, 11, 27, N'Mawa', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[trnTargetChild] ([TargetChildID], [TargetId], [ItemID], [ItemName], [TargetData], [Cumulative], [TargetAbsolute], [AvggrowthPerc]) VALUES (109, 11, 28, N'Paneer', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[trnTargetChild] ([TargetChildID], [TargetId], [ItemID], [ItemName], [TargetData], [Cumulative], [TargetAbsolute], [AvggrowthPerc]) VALUES (110, 11, 29, N'Vaccum Paneer', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[trnTargetChild] ([TargetChildID], [TargetId], [ItemID], [ItemName], [TargetData], [Cumulative], [TargetAbsolute], [AvggrowthPerc]) VALUES (111, 11, 30, N'Rasogulla', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[trnTargetChild] ([TargetChildID], [TargetId], [ItemID], [ItemName], [TargetData], [Cumulative], [TargetAbsolute], [AvggrowthPerc]) VALUES (112, 11, 31, N'Gulabjamun', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[trnTargetChild] ([TargetChildID], [TargetId], [ItemID], [ItemName], [TargetData], [Cumulative], [TargetAbsolute], [AvggrowthPerc]) VALUES (113, 11, 32, N'Shrikhand Lite 100 gms cups', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[trnTargetChild] ([TargetChildID], [TargetId], [ItemID], [ItemName], [TargetData], [Cumulative], [TargetAbsolute], [AvggrowthPerc]) VALUES (114, 11, 33, N'Table Butter', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[trnTargetChild] ([TargetChildID], [TargetId], [ItemID], [ItemName], [TargetData], [Cumulative], [TargetAbsolute], [AvggrowthPerc]) VALUES (115, 11, 34, N'Cookies', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[trnTargetChild] ([TargetChildID], [TargetId], [ItemID], [ItemName], [TargetData], [Cumulative], [TargetAbsolute], [AvggrowthPerc]) VALUES (116, 11, 35, N'Sugar Free Peda', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[trnTargetChild] ([TargetChildID], [TargetId], [ItemID], [ItemName], [TargetData], [Cumulative], [TargetAbsolute], [AvggrowthPerc]) VALUES (117, 11, 36, N'Butter Chiplet', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[trnTargetChild] ([TargetChildID], [TargetId], [ItemID], [ItemName], [TargetData], [Cumulative], [TargetAbsolute], [AvggrowthPerc]) VALUES (118, 11, 37, N'Besan Laddu', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[trnTargetChild] ([TargetChildID], [TargetId], [ItemID], [ItemName], [TargetData], [Cumulative], [TargetAbsolute], [AvggrowthPerc]) VALUES (119, 11, 38, N'Sanchi Neer lit', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[trnTargetChild] ([TargetChildID], [TargetId], [ItemID], [ItemName], [TargetData], [Cumulative], [TargetAbsolute], [AvggrowthPerc]) VALUES (120, 11, 39, N'Misti Doi 100gm', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[trnTargetChild] ([TargetChildID], [TargetId], [ItemID], [ItemName], [TargetData], [Cumulative], [TargetAbsolute], [AvggrowthPerc]) VALUES (121, 11, 40, N'Braj Peda', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[trnTargetChild] ([TargetChildID], [TargetId], [ItemID], [ItemName], [TargetData], [Cumulative], [TargetAbsolute], [AvggrowthPerc]) VALUES (122, 11, 41, N'Amrakhand 100 gms', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[trnTargetChild] ([TargetChildID], [TargetId], [ItemID], [ItemName], [TargetData], [Cumulative], [TargetAbsolute], [AvggrowthPerc]) VALUES (123, 12, 10, N'SMP', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[trnTargetChild] ([TargetChildID], [TargetId], [ItemID], [ItemName], [TargetData], [Cumulative], [TargetAbsolute], [AvggrowthPerc]) VALUES (124, 12, 11, N'Sweeten SMP', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[trnTargetChild] ([TargetChildID], [TargetId], [ItemID], [ItemName], [TargetData], [Cumulative], [TargetAbsolute], [AvggrowthPerc]) VALUES (125, 12, 12, N'WB', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[trnTargetChild] ([TargetChildID], [TargetId], [ItemID], [ItemName], [TargetData], [Cumulative], [TargetAbsolute], [AvggrowthPerc]) VALUES (126, 12, 13, N'Plain curd', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[trnTargetChild] ([TargetChildID], [TargetId], [ItemID], [ItemName], [TargetData], [Cumulative], [TargetAbsolute], [AvggrowthPerc]) VALUES (127, 12, 14, N'Sweet Curd', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[trnTargetChild] ([TargetChildID], [TargetId], [ItemID], [ItemName], [TargetData], [Cumulative], [TargetAbsolute], [AvggrowthPerc]) VALUES (128, 12, 15, N'Salted Butter Milk 200 ML', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[trnTargetChild] ([TargetChildID], [TargetId], [ItemID], [ItemName], [TargetData], [Cumulative], [TargetAbsolute], [AvggrowthPerc]) VALUES (129, 12, 16, N'Plain Butter Milk', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[trnTargetChild] ([TargetChildID], [TargetId], [ItemID], [ItemName], [TargetData], [Cumulative], [TargetAbsolute], [AvggrowthPerc]) VALUES (130, 12, 17, N'Cold Coffee', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[trnTargetChild] ([TargetChildID], [TargetId], [ItemID], [ItemName], [TargetData], [Cumulative], [TargetAbsolute], [AvggrowthPerc]) VALUES (131, 12, 18, N'Fl.Milk Pet Bottle', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[trnTargetChild] ([TargetChildID], [TargetId], [ItemID], [ItemName], [TargetData], [Cumulative], [TargetAbsolute], [AvggrowthPerc]) VALUES (132, 12, 19, N'S.F.M Glass(Bottles)', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[trnTargetChild] ([TargetChildID], [TargetId], [ItemID], [ItemName], [TargetData], [Cumulative], [TargetAbsolute], [AvggrowthPerc]) VALUES (133, 12, 20, N'Lassi 200 ML Glass', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[trnTargetChild] ([TargetChildID], [TargetId], [ItemID], [ItemName], [TargetData], [Cumulative], [TargetAbsolute], [AvggrowthPerc]) VALUES (134, 12, 21, N'Lite Lassi 200 ML', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[trnTargetChild] ([TargetChildID], [TargetId], [ItemID], [ItemName], [TargetData], [Cumulative], [TargetAbsolute], [AvggrowthPerc]) VALUES (135, 12, 22, N'Shrikhand', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[trnTargetChild] ([TargetChildID], [TargetId], [ItemID], [ItemName], [TargetData], [Cumulative], [TargetAbsolute], [AvggrowthPerc]) VALUES (136, 12, 23, N'Chena Rabdi', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[trnTargetChild] ([TargetChildID], [TargetId], [ItemID], [ItemName], [TargetData], [Cumulative], [TargetAbsolute], [AvggrowthPerc]) VALUES (137, 12, 24, N'Sabudana Kheer 100 gm', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[trnTargetChild] ([TargetChildID], [TargetId], [ItemID], [ItemName], [TargetData], [Cumulative], [TargetAbsolute], [AvggrowthPerc]) VALUES (138, 12, 25, N'Peda', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[trnTargetChild] ([TargetChildID], [TargetId], [ItemID], [ItemName], [TargetData], [Cumulative], [TargetAbsolute], [AvggrowthPerc]) VALUES (139, 12, 26, N'Milk Cake', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[trnTargetChild] ([TargetChildID], [TargetId], [ItemID], [ItemName], [TargetData], [Cumulative], [TargetAbsolute], [AvggrowthPerc]) VALUES (140, 12, 27, N'Mawa', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[trnTargetChild] ([TargetChildID], [TargetId], [ItemID], [ItemName], [TargetData], [Cumulative], [TargetAbsolute], [AvggrowthPerc]) VALUES (141, 12, 28, N'Paneer', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[trnTargetChild] ([TargetChildID], [TargetId], [ItemID], [ItemName], [TargetData], [Cumulative], [TargetAbsolute], [AvggrowthPerc]) VALUES (142, 12, 29, N'Vaccum Paneer', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[trnTargetChild] ([TargetChildID], [TargetId], [ItemID], [ItemName], [TargetData], [Cumulative], [TargetAbsolute], [AvggrowthPerc]) VALUES (143, 12, 30, N'Rasogulla', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[trnTargetChild] ([TargetChildID], [TargetId], [ItemID], [ItemName], [TargetData], [Cumulative], [TargetAbsolute], [AvggrowthPerc]) VALUES (144, 12, 31, N'Gulabjamun', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[trnTargetChild] ([TargetChildID], [TargetId], [ItemID], [ItemName], [TargetData], [Cumulative], [TargetAbsolute], [AvggrowthPerc]) VALUES (145, 12, 32, N'Shrikhand Lite 100 gms cups', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[trnTargetChild] ([TargetChildID], [TargetId], [ItemID], [ItemName], [TargetData], [Cumulative], [TargetAbsolute], [AvggrowthPerc]) VALUES (146, 12, 33, N'Table Butter', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[trnTargetChild] ([TargetChildID], [TargetId], [ItemID], [ItemName], [TargetData], [Cumulative], [TargetAbsolute], [AvggrowthPerc]) VALUES (147, 12, 34, N'Cookies', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[trnTargetChild] ([TargetChildID], [TargetId], [ItemID], [ItemName], [TargetData], [Cumulative], [TargetAbsolute], [AvggrowthPerc]) VALUES (148, 12, 35, N'Sugar Free Peda', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[trnTargetChild] ([TargetChildID], [TargetId], [ItemID], [ItemName], [TargetData], [Cumulative], [TargetAbsolute], [AvggrowthPerc]) VALUES (149, 12, 36, N'Butter Chiplet', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[trnTargetChild] ([TargetChildID], [TargetId], [ItemID], [ItemName], [TargetData], [Cumulative], [TargetAbsolute], [AvggrowthPerc]) VALUES (150, 12, 37, N'Besan Laddu', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[trnTargetChild] ([TargetChildID], [TargetId], [ItemID], [ItemName], [TargetData], [Cumulative], [TargetAbsolute], [AvggrowthPerc]) VALUES (151, 12, 38, N'Sanchi Neer lit', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[trnTargetChild] ([TargetChildID], [TargetId], [ItemID], [ItemName], [TargetData], [Cumulative], [TargetAbsolute], [AvggrowthPerc]) VALUES (152, 12, 39, N'Misti Doi 100gm', CAST(0.00 AS Decimal(18, 2)), CAST(7.00 AS Decimal(18, 2)), CAST(7.00 AS Decimal(18, 2)), CAST(7.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[trnTargetChild] ([TargetChildID], [TargetId], [ItemID], [ItemName], [TargetData], [Cumulative], [TargetAbsolute], [AvggrowthPerc]) VALUES (153, 12, 40, N'Braj Peda', CAST(7.00 AS Decimal(18, 2)), CAST(7.00 AS Decimal(18, 2)), CAST(7.00 AS Decimal(18, 2)), CAST(7.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[trnTargetChild] ([TargetChildID], [TargetId], [ItemID], [ItemName], [TargetData], [Cumulative], [TargetAbsolute], [AvggrowthPerc]) VALUES (154, 12, 41, N'Amrakhand 100 gms', CAST(7.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
SET IDENTITY_INSERT [dbo].[trnTargetChild] OFF
GO
SET IDENTITY_INSERT [dbo].[TrnTargetTotals] ON 
GO
INSERT [dbo].[TrnTargetTotals] ([TargetId], [TotalTarget], [TotalCumulative], [TotalAbsolute], [TotalAvgGrowth]) VALUES (9, CAST(10.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[TrnTargetTotals] ([TargetId], [TotalTarget], [TotalCumulative], [TotalAbsolute], [TotalAvgGrowth]) VALUES (10, CAST(60.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[TrnTargetTotals] ([TargetId], [TotalTarget], [TotalCumulative], [TotalAbsolute], [TotalAvgGrowth]) VALUES (11, CAST(110.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[TrnTargetTotals] ([TargetId], [TotalTarget], [TotalCumulative], [TotalAbsolute], [TotalAvgGrowth]) VALUES (12, CAST(14.00 AS Decimal(18, 2)), CAST(14.00 AS Decimal(18, 2)), CAST(14.00 AS Decimal(18, 2)), CAST(14.00 AS Decimal(18, 2)))
GO
SET IDENTITY_INSERT [dbo].[TrnTargetTotals] OFF
GO
/****** Object:  StoredProcedure [dbo].[GetItemsByCategory]    Script Date: 13-Nov-24 12:20:45 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_GetItemDetails]    Script Date: 13-Nov-24 12:20:45 PM ******/
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
/****** Object:  StoredProcedure [dbo].[usp_AddDemand]    Script Date: 13-Nov-24 12:20:45 PM ******/
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
/****** Object:  StoredProcedure [dbo].[usp_AddInFlow]    Script Date: 13-Nov-24 12:20:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--------------------------
CREATE proc  [dbo].[usp_AddInFlow]
     @Date				date
	,@UnitID     		int
	,@Milkqty			int
	,@lysdqty			decimal(18,2)
	,@Milkfat			decimal(18,2)
	,@MilkSNF			decimal(18,2)
	,@Milkfatperc		decimal(18,2)
	,@MilkSNFperc		decimal(18,2)
,@WBOBal [decimal](18, 2)
,@WBManuf [decimal](18, 2)
	,@Butterqty  		int
	,@Butterstock  		int
,@SMPBal [decimal](18, 2)
,@SMPManuf [decimal](18, 2)
	,@MilkPowderqty  	int
	,@MilkPowderstock  	int
,@WMPBal [decimal](18, 2)
,@WMPManuf [decimal](18, 2)
	,@WholeMilkPowderqty	int
	,@WholeMilkPowderstock	int
,@GheeBal [decimal](18, 2)
,@GheeManuf [decimal](18, 2)
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
,WBOBal
,WBManuf
				,[Butterqty]
				,[Butterstock]
,SMPBal
,SMPManuf
				,[MilkPowderqty]
				,[MilkPowderstock]
,WMPBal
,WMPManuf
				,WholeMilkPowderqty
				,WholeMilkPowderstock	
,GheeBal
,GheeManuf
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
,@WBOBal
,@WBManuf
				,@Butterqty  	
				,@Butterstock  	
,@SMPBal
,@SMPManuf
	
				,@MilkPowderqty
				,@MilkPowderstock
,@WMPBal
,@WMPManuf
				,@WholeMilkPowderqty
				,@WholeMilkPowderstock	
,@GheeBal
,@GheeManuf
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
GO
/****** Object:  StoredProcedure [dbo].[usp_AddManufItem]    Script Date: 13-Nov-24 12:20:45 PM ******/
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
/****** Object:  StoredProcedure [dbo].[usp_AddSales]    Script Date: 13-Nov-24 12:20:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Alter table trn_Sale
--add 
--LYSDQty int
--go
-------
CREATE proc  [dbo].[usp_AddSales]
		@Date date
		,@NameOfUnit		VARCHAR(100)
		,@LYSDQty		int
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
					   ,LYSDQty
					   ,[ItemCategory]
					  )
				 VALUES
					   (@date
					   ,@NameOfUnit
					   ,@LYSDQty
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
/****** Object:  StoredProcedure [dbo].[usp_AddTarget]    Script Date: 13-Nov-24 12:20:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_AddTarget]
    @Targetmonth DATE,
    @ItemCategory VARCHAR(50),
    @TargetItems [typ_SoldItems] READONLY,
     @TotalTarget			DECIMAL(18, 2) = 0,          -- New parameter for total TargetData
     @TotalCumulative		DECIMAL(18, 2) = 0,      -- New parameter for total Cumulative
     @TotalAbsolute			DECIMAL(18, 2) = 0,        -- New parameter for total TargetAbsolute
     @TotalAvgGrowth		 DECIMAL(18, 2) = 0        -- New parameter for total AvgGrowthPerc
AS
BEGIN
    DECLARE @status BIT = 0, @msg VARCHAR(100) = NULL, @TargetId INT = NULL;
    
    BEGIN TRY
        BEGIN TRANSACTION;

        -- Insert into TrnTarget
        INSERT INTO TrnTarget (Targetmonth, ItemCategory)
        VALUES (@Targetmonth, @ItemCategory);

        SELECT @TargetId = SCOPE_IDENTITY();

        -- Insert into trnTargetChild
        INSERT INTO trnTargetChild (TargetId, ItemID, ItemName, TargetData, Cumulative, TargetAbsolute, AvggrowthPerc)
        SELECT @TargetId, ItemID, ItemName, TargetData, [SaleCumulative], [SaleAbsolute], [AvgGrowthPer]
        FROM @TargetItems;


		SET IDENTITY_INSERT [dbo].TrnTargetTotals ON 
       
        INSERT INTO TrnTargetTotals (TargetId, TotalTarget, TotalCumulative, TotalAbsolute, TotalAvgGrowth)
        VALUES (@TargetId, @TotalTarget, @TotalCumulative, @TotalAbsolute, @TotalAvgGrowth);
		SET IDENTITY_INSERT [dbo].TrnTargetTotals OFF
      

        SELECT @status = 1, @msg = 'Demand added Successfully';

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH   
        ROLLBACK TRANSACTION;
        SELECT @status = 0, @msg = ERROR_MESSAGE();	
    END CATCH;

    SELECT @status AS [status], @msg AS [msg];
END
GO
/****** Object:  StoredProcedure [dbo].[Usp_AproveInflow]    Script Date: 13-Nov-24 12:20:45 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Usp_GetInflowToAprove]    Script Date: 13-Nov-24 12:20:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  proc  [dbo].[Usp_GetInflowToAprove]
     @IsApproved bit =null,
	 @FromDate date=null,
     @ToDate date= null
as
  begin 
	declare	 @status bit=0 ,
	 @msg varchar(100)=null  
	BEGIN TRY
		BEGIN TRANSACTION 
		
		if (@FromDate='')
			BEGIN
			 select @FromDate=null;
			END
		if (@ToDate='')
			BEGIN
			 select @ToDate=null;
			END
		
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
				where  IsVerifed =1 and( IsApproved= @IsApproved or @IsApproved is NULL) and (Date>= @FromDate or @FromDate is null)and (Date<=@ToDate or @ToDate is null)	

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
/****** Object:  StoredProcedure [dbo].[Usp_GetinflowUnit]    Script Date: 13-Nov-24 12:20:45 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Usp_GetUnit]    Script Date: 13-Nov-24 12:20:45 PM ******/
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
/****** Object:  StoredProcedure [dbo].[uspTransReport]    Script Date: 13-Nov-24 12:20:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc  [dbo].[uspTransReport]
@FromDate date null,
@ToDate date null
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
							join trn_Demand d on d.DemandId=dc.DemandId
							where d.Date>@FromDate and d.Date<@ToDate
							GROUP BY item.ItemName,item.ItemID					
						) as DC
					full join trn_SaleChild sc on dc.ItemID = sc.ItemID
					join trn_Sale s on s.SalesID= sc.SalesID
					where s.Date>@FromDate and s.Date<@ToDate
					group by DC.ItemName , dc.Demand ,DC.ItemID
					) as SC
				full join PlantManufacturingData m on m.ItemID = sc.ItemID
			  Where m.Date>@FromDate and m.Date<@ToDate
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
/****** Object:  StoredProcedure [dbo].[uspVerifierDetails]    Script Date: 13-Nov-24 12:20:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[uspVerifierDetails]
@IsVerifed bit =null,
@FromDate date=null,
@ToDate date= null
AS
BEGIN

	
		if (@FromDate='')
			BEGIN
			 select @FromDate=null;
			END
		if (@ToDate='')
			BEGIN
			 select @ToDate=null;
			END
		

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
		where IsApproved =0 and( IsVerifed= @IsVerifed or @IsVerifed is NULL) and (Date>= @FromDate or @FromDate is null)and (Date<=@ToDate or @ToDate is null)	
	order by IsVerifed
END


GO
/****** Object:  StoredProcedure [dbo].[uspVerifierUpdate]    Script Date: 13-Nov-24 12:20:45 PM ******/
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
USE [master]
GO
ALTER DATABASE [DbSanchi] SET  READ_WRITE 
GO
