USE [master]
GO
/****** Object:  Database [DataWarehouseTest]    Script Date: 11/21/2024 6:17:50 PM ******/
CREATE DATABASE [DataWarehouseTest]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DataWarehouseTest', FILENAME = N'D:\descargas\MSSQL16.SQLEXPRESS\MSSQL\DATA\DataWarehouseTest.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DataWarehouseTest_log', FILENAME = N'D:\descargas\MSSQL16.SQLEXPRESS\MSSQL\DATA\DataWarehouseTest_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [DataWarehouseTest] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DataWarehouseTest].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DataWarehouseTest] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DataWarehouseTest] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DataWarehouseTest] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DataWarehouseTest] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DataWarehouseTest] SET ARITHABORT OFF 
GO
ALTER DATABASE [DataWarehouseTest] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [DataWarehouseTest] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DataWarehouseTest] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DataWarehouseTest] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DataWarehouseTest] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DataWarehouseTest] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DataWarehouseTest] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DataWarehouseTest] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DataWarehouseTest] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DataWarehouseTest] SET  ENABLE_BROKER 
GO
ALTER DATABASE [DataWarehouseTest] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DataWarehouseTest] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DataWarehouseTest] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DataWarehouseTest] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DataWarehouseTest] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DataWarehouseTest] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DataWarehouseTest] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DataWarehouseTest] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DataWarehouseTest] SET  MULTI_USER 
GO
ALTER DATABASE [DataWarehouseTest] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DataWarehouseTest] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DataWarehouseTest] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DataWarehouseTest] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DataWarehouseTest] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DataWarehouseTest] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [DataWarehouseTest] SET QUERY_STORE = ON
GO
ALTER DATABASE [DataWarehouseTest] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [DataWarehouseTest]
GO
/****** Object:  Table [dbo].[DimCategory]    Script Date: 11/21/2024 6:17:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimCategory](
	[CategoryID] [int] NOT NULL,
	[CategoryName] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimCustomer]    Script Date: 11/21/2024 6:17:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimCustomer](
	[CustomerID] [int] NOT NULL,
	[CustomerName] [varchar](100) NULL,
	[ContactName] [varchar](100) NULL,
	[Country] [varchar](50) NULL,
	[City] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimCustomers]    Script Date: 11/21/2024 6:17:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimCustomers](
	[CustomerID] [int] NOT NULL,
	[CustomerName] [varchar](100) NULL,
	[ContactName] [varchar](100) NULL,
	[Country] [varchar](50) NULL,
	[City] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimEmploye]    Script Date: 11/21/2024 6:17:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimEmploye](
	[EmployeeID] [int] NOT NULL,
	[EmployeeName] [nvarchar](255) NULL,
	[Title] [nvarchar](255) NULL,
	[TitleOfCourtesy] [nvarchar](255) NULL,
	[BirthDate] [date] NULL,
	[HireDate] [date] NULL,
	[Address] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[Region] [nvarchar](255) NULL,
	[PostalCode] [nvarchar](20) NULL,
	[Country] [nvarchar](255) NULL,
	[HomePhone] [nvarchar](25) NULL,
	[Extension] [nvarchar](10) NULL,
	[Photo] [varbinary](max) NULL,
	[Notes] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimEmployee]    Script Date: 11/21/2024 6:17:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimEmployee](
	[EmployeeID] [int] NOT NULL,
	[EmployeeName] [varchar](100) NULL,
	[Title] [varchar](50) NULL,
	[Department] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimProduct]    Script Date: 11/21/2024 6:17:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimProduct](
	[ProductID] [int] NOT NULL,
	[ProductName] [varchar](100) NULL,
	[CategoryID] [int] NULL,
	[Price] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimShippers]    Script Date: 11/21/2024 6:17:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimShippers](
	[ShipperID] [int] NOT NULL,
	[ShipperName] [varchar](100) NULL,
	[Phone] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ShipperID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 11/21/2024 6:17:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[EmployeeID] [int] NOT NULL,
	[EmployeeName] [nvarchar](255) NULL,
	[Title] [nvarchar](255) NULL,
	[TitleOfCourtesy] [nvarchar](255) NULL,
	[BirthDate] [date] NULL,
	[HireDate] [date] NULL,
	[Address] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[Region] [nvarchar](255) NULL,
	[PostalCode] [nvarchar](20) NULL,
	[Country] [nvarchar](255) NULL,
	[HomePhone] [nvarchar](25) NULL,
	[Extension] [nvarchar](10) NULL,
	[Photo] [varbinary](max) NULL,
	[Notes] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FactClientesAtendidos]    Script Date: 11/21/2024 6:17:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FactClientesAtendidos](
	[ClienteID] [int] NULL,
	[ClienteNombre] [varchar](100) NULL,
	[Fecha] [date] NULL,
	[TotalVentas] [decimal](10, 2) NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DimProduct]  WITH CHECK ADD FOREIGN KEY([CategoryID])
REFERENCES [dbo].[DimCategory] ([CategoryID])
GO
USE [master]
GO
ALTER DATABASE [DataWarehouseTest] SET  READ_WRITE 
GO
