USE [master]
GO
/****** Object:  Database [Polyclinic]    Script Date: 28.03.2022 13:37:53 ******/
CREATE DATABASE [Polyclinic]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Polyclinic', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS1\MSSQL\DATA\Polyclinic.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Polyclinic_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS1\MSSQL\DATA\Polyclinic_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Polyclinic] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Polyclinic].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Polyclinic] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Polyclinic] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Polyclinic] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Polyclinic] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Polyclinic] SET ARITHABORT OFF 
GO
ALTER DATABASE [Polyclinic] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Polyclinic] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Polyclinic] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Polyclinic] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Polyclinic] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Polyclinic] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Polyclinic] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Polyclinic] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Polyclinic] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Polyclinic] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Polyclinic] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Polyclinic] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Polyclinic] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Polyclinic] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Polyclinic] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Polyclinic] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Polyclinic] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Polyclinic] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Polyclinic] SET  MULTI_USER 
GO
ALTER DATABASE [Polyclinic] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Polyclinic] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Polyclinic] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Polyclinic] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Polyclinic] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Polyclinic] SET QUERY_STORE = OFF
GO
USE [Polyclinic]
GO
/****** Object:  Table [dbo].[Cabinet]    Script Date: 28.03.2022 13:37:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cabinet](
	[CabID] [int] NOT NULL,
	[CabNum] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Cabinet] PRIMARY KEY CLUSTERED 
(
	[CabID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Doctor]    Script Date: 28.03.2022 13:37:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Doctor](
	[DoctorID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Surname] [nvarchar](50) NOT NULL,
	[Patronymic] [nvarchar](50) NOT NULL,
	[SpecID] [int] NOT NULL,
	[TimeTableID] [int] NOT NULL,
	[CabID] [int] NOT NULL,
	[Photo] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Doctor] PRIMARY KEY CLUSTERED 
(
	[DoctorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Patient]    Script Date: 28.03.2022 13:37:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Patient](
	[PatientID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Surname] [nvarchar](50) NOT NULL,
	[Patronymic] [nvarchar](50) NOT NULL,
	[DateBirth] [date] NOT NULL,
	[PhoneNumber] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Patient] PRIMARY KEY CLUSTERED 
(
	[PatientID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Purchase]    Script Date: 28.03.2022 13:37:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Purchase](
	[PurchaseID] [int] NOT NULL,
	[PurchaseDate] [date] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[PurchaseCount] [int] NOT NULL,
 CONSTRAINT [PK_Purchase] PRIMARY KEY CLUSTERED 
(
	[PurchaseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Report]    Script Date: 28.03.2022 13:37:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Report](
	[ReportID] [int] NOT NULL,
	[VisitID] [int] NOT NULL,
	[SaleID] [int] NULL,
	[PurchaseID] [int] NULL,
	[WareHouseID] [int] NULL,
 CONSTRAINT [PK_Report] PRIMARY KEY CLUSTERED 
(
	[ReportID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sale]    Script Date: 28.03.2022 13:37:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sale](
	[SaleID] [int] NOT NULL,
	[PurchaseID] [int] NOT NULL,
	[SaleDate] [date] NOT NULL,
	[SaleTIme] [time](6) NOT NULL,
	[SaleName] [nvarchar](50) NOT NULL,
	[SaleCount] [int] NOT NULL,
 CONSTRAINT [PK_Sale] PRIMARY KEY CLUSTERED 
(
	[SaleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Specialization]    Script Date: 28.03.2022 13:37:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Specialization](
	[SpecID] [int] NOT NULL,
	[SpecName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Specialization] PRIMARY KEY CLUSTERED 
(
	[SpecID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TimeTable]    Script Date: 28.03.2022 13:37:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TimeTable](
	[TimeTableID] [int] NOT NULL,
	[WithTIme] [time](6) NOT NULL,
	[BeforeTime] [time](6) NOT NULL,
	[DateTable] [date] NOT NULL,
 CONSTRAINT [PK_TimeTable] PRIMARY KEY CLUSTERED 
(
	[TimeTableID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Visit]    Script Date: 28.03.2022 13:37:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Visit](
	[VisitID] [int] NOT NULL,
	[PatientID] [int] NOT NULL,
	[DoctorID] [int] NOT NULL,
	[Comment] [nvarchar](50) NOT NULL,
	[DateVisit] [date] NOT NULL,
	[TimeVisit] [time](6) NOT NULL,
 CONSTRAINT [PK_Visit] PRIMARY KEY CLUSTERED 
(
	[VisitID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Warehouse]    Script Date: 28.03.2022 13:37:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Warehouse](
	[WarehouseID] [int] NOT NULL,
	[Wname] [nvarchar](50) NOT NULL,
	[Wcount] [int] NOT NULL,
 CONSTRAINT [PK_Warehouse] PRIMARY KEY CLUSTERED 
(
	[WarehouseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Doctor]  WITH CHECK ADD  CONSTRAINT [FK_Doctor_Cabinet] FOREIGN KEY([CabID])
REFERENCES [dbo].[Cabinet] ([CabID])
GO
ALTER TABLE [dbo].[Doctor] CHECK CONSTRAINT [FK_Doctor_Cabinet]
GO
ALTER TABLE [dbo].[Doctor]  WITH CHECK ADD  CONSTRAINT [FK_Doctor_Specialization] FOREIGN KEY([SpecID])
REFERENCES [dbo].[Specialization] ([SpecID])
GO
ALTER TABLE [dbo].[Doctor] CHECK CONSTRAINT [FK_Doctor_Specialization]
GO
ALTER TABLE [dbo].[Doctor]  WITH CHECK ADD  CONSTRAINT [FK_Doctor_TimeTable] FOREIGN KEY([TimeTableID])
REFERENCES [dbo].[TimeTable] ([TimeTableID])
GO
ALTER TABLE [dbo].[Doctor] CHECK CONSTRAINT [FK_Doctor_TimeTable]
GO
ALTER TABLE [dbo].[Report]  WITH CHECK ADD  CONSTRAINT [FK_Report_Purchase] FOREIGN KEY([PurchaseID])
REFERENCES [dbo].[Purchase] ([PurchaseID])
GO
ALTER TABLE [dbo].[Report] CHECK CONSTRAINT [FK_Report_Purchase]
GO
ALTER TABLE [dbo].[Report]  WITH CHECK ADD  CONSTRAINT [FK_Report_Sale] FOREIGN KEY([SaleID])
REFERENCES [dbo].[Sale] ([SaleID])
GO
ALTER TABLE [dbo].[Report] CHECK CONSTRAINT [FK_Report_Sale]
GO
ALTER TABLE [dbo].[Report]  WITH CHECK ADD  CONSTRAINT [FK_Report_Visit] FOREIGN KEY([VisitID])
REFERENCES [dbo].[Visit] ([VisitID])
GO
ALTER TABLE [dbo].[Report] CHECK CONSTRAINT [FK_Report_Visit]
GO
ALTER TABLE [dbo].[Report]  WITH CHECK ADD  CONSTRAINT [FK_Report_Warehouse] FOREIGN KEY([WareHouseID])
REFERENCES [dbo].[Warehouse] ([WarehouseID])
GO
ALTER TABLE [dbo].[Report] CHECK CONSTRAINT [FK_Report_Warehouse]
GO
ALTER TABLE [dbo].[Sale]  WITH CHECK ADD  CONSTRAINT [FK_Sale_Purchase] FOREIGN KEY([PurchaseID])
REFERENCES [dbo].[Purchase] ([PurchaseID])
GO
ALTER TABLE [dbo].[Sale] CHECK CONSTRAINT [FK_Sale_Purchase]
GO
ALTER TABLE [dbo].[Visit]  WITH CHECK ADD  CONSTRAINT [FK_Visit_Doctor] FOREIGN KEY([DoctorID])
REFERENCES [dbo].[Doctor] ([DoctorID])
GO
ALTER TABLE [dbo].[Visit] CHECK CONSTRAINT [FK_Visit_Doctor]
GO
ALTER TABLE [dbo].[Visit]  WITH CHECK ADD  CONSTRAINT [FK_Visit_Patient] FOREIGN KEY([PatientID])
REFERENCES [dbo].[Patient] ([PatientID])
GO
ALTER TABLE [dbo].[Visit] CHECK CONSTRAINT [FK_Visit_Patient]
GO
USE [master]
GO
ALTER DATABASE [Polyclinic] SET  READ_WRITE 
GO
