USE [master]
GO
/****** Object:  Database [DbSanchi]    Script Date: 04-Oct-24 5:43:02 PM ******/
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
/****** Object:  UserDefinedTableType [dbo].[DemandItems]    Script Date: 04-Oct-24 5:43:03 PM ******/
CREATE TYPE [dbo].[DemandItems] AS TABLE(
	[ItemName] [varchar](50) NULL,
	[Quantity] [int] NULL,
	[AdvancedCard] [int] NULL
)
GO
/****** Object:  Table [dbo].[mst_InflowUnits]    Script Date: 04-Oct-24 5:43:03 PM ******/
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
/****** Object:  Table [dbo].[mst_Item]    Script Date: 04-Oct-24 5:43:03 PM ******/
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
/****** Object:  Table [dbo].[mst_Unit]    Script Date: 04-Oct-24 5:43:03 PM ******/
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
/****** Object:  Table [dbo].[PlantManufacturingData]    Script Date: 04-Oct-24 5:43:03 PM ******/
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
/****** Object:  Table [dbo].[trn_Demand]    Script Date: 04-Oct-24 5:43:03 PM ******/
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
/****** Object:  Table [dbo].[trn_DemandsChild]    Script Date: 04-Oct-24 5:43:03 PM ******/
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
/****** Object:  Table [dbo].[Trn_InflowDetails]    Script Date: 04-Oct-24 5:43:03 PM ******/
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
/****** Object:  Table [dbo].[trn_Sale]    Script Date: 04-Oct-24 5:43:03 PM ******/
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
/****** Object:  Table [dbo].[trn_SaleChild]    Script Date: 04-Oct-24 5:43:03 PM ******/
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
/****** Object:  StoredProcedure [dbo].[GetItemsByCategory]    Script Date: 04-Oct-24 5:43:03 PM ******/
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
/****** Object:  StoredProcedure [dbo].[usp_AddDemand]    Script Date: 04-Oct-24 5:43:03 PM ******/
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
/****** Object:  StoredProcedure [dbo].[usp_AddInFlow]    Script Date: 04-Oct-24 5:43:03 PM ******/
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
/****** Object:  StoredProcedure [dbo].[usp_AddManufItem]    Script Date: 04-Oct-24 5:43:03 PM ******/
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
/****** Object:  StoredProcedure [dbo].[usp_AddSales]    Script Date: 04-Oct-24 5:43:03 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Usp_AproveInflow]    Script Date: 04-Oct-24 5:43:03 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Usp_GetInflowToAprove]    Script Date: 04-Oct-24 5:43:03 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Usp_GetinflowUnit]    Script Date: 04-Oct-24 5:43:03 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Usp_GetUnit]    Script Date: 04-Oct-24 5:43:03 PM ******/
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
/****** Object:  StoredProcedure [dbo].[uspTransReport]    Script Date: 04-Oct-24 5:43:03 PM ******/
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
/****** Object:  StoredProcedure [dbo].[uspVerifierDetails]    Script Date: 04-Oct-24 5:43:03 PM ******/
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
/****** Object:  StoredProcedure [dbo].[uspVerifierUpdate]    Script Date: 04-Oct-24 5:43:03 PM ******/
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
