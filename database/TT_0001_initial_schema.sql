USE [master]
GO
/****** Object:  Database [TimeTracker_db]    Script Date: 24/02/2022 09:50:33 ******/
CREATE DATABASE [TimeTracker_db]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TimeTracker_db', FILENAME = N'C:\Users\ogund\TimeTracker_db.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TimeTracker_db_log', FILENAME = N'C:\Users\ogund\TimeTracker_db_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [TimeTracker_db] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TimeTracker_db].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TimeTracker_db] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TimeTracker_db] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TimeTracker_db] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TimeTracker_db] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TimeTracker_db] SET ARITHABORT OFF 
GO
ALTER DATABASE [TimeTracker_db] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [TimeTracker_db] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TimeTracker_db] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TimeTracker_db] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TimeTracker_db] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TimeTracker_db] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TimeTracker_db] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TimeTracker_db] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TimeTracker_db] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TimeTracker_db] SET  ENABLE_BROKER 
GO
ALTER DATABASE [TimeTracker_db] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TimeTracker_db] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TimeTracker_db] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TimeTracker_db] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TimeTracker_db] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TimeTracker_db] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TimeTracker_db] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TimeTracker_db] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [TimeTracker_db] SET  MULTI_USER 
GO
ALTER DATABASE [TimeTracker_db] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TimeTracker_db] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TimeTracker_db] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TimeTracker_db] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TimeTracker_db] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TimeTracker_db] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [TimeTracker_db] SET QUERY_STORE = OFF
GO
USE [TimeTracker_db]
GO
/****** Object:  Table [dbo].[Company]    Script Date: 24/02/2022 09:50:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Company](
	[CompanyId] [int] IDENTITY(1,1) NOT NULL,
	[CompanyName] [nvarchar](100) NULL,
	[CompanyPhone] [nvarchar](20) NULL,
	[CompanyEmail] [nvarchar](50) NULL,
	[CompanyAddress] [nvarchar](100) NULL,
	[CompanyLink] [nvarchar](100) NULL,
	[CreatedAt] [timestamp] NOT NULL,
	[EmpId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[CompanyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[CompanyEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 24/02/2022 09:50:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[EmpId] [int] IDENTITY(1,1) NOT NULL,
	[EmpName] [nvarchar](50) NULL,
	[CreatedAt] [timestamp] NOT NULL,
	[UserId] [int] NULL,
	[CompanyId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[EmpId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Permission]    Script Date: 24/02/2022 09:50:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Permission](
	[PermissionId] [int] IDENTITY(1,1) NOT NULL,
	[PermissionType] [nvarchar](200) NULL,
	[PermissionLevel] [smallint] NULL,
	[CreatedAt] [timestamp] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PermissionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 24/02/2022 09:50:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](100) NULL,
	[ProductPrice] [float] NULL,
	[ProductDescription] [text] NULL,
	[ProductDesc] [nvarchar](100) NULL,
	[CreatedAt] [timestamp] NOT NULL,
	[TeamId] [int] NULL,
	[CompanyId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductTeam]    Script Date: 24/02/2022 09:50:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductTeam](
	[ProductTeamId] [int] IDENTITY(1,1) NOT NULL,
	[TeamId] [int] NULL,
	[ProductId] [int] NULL,
	[CreatedAt] [timestamp] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductTeamId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaskType]    Script Date: 24/02/2022 09:50:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaskType](
	[TaskId] [int] IDENTITY(1,1) NOT NULL,
	[TaskName] [nvarchar](100) NULL,
	[TaskDescription] [nvarchar](100) NULL,
	[CreatedAt] [timestamp] NOT NULL,
	[ProductId] [int] NULL,
	[Created_by] [nvarchar](100) NULL,
	[UserId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[TaskId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Team]    Script Date: 24/02/2022 09:50:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Team](
	[TeamId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Description] [nvarchar](100) NULL,
	[CreatedAt] [timestamp] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TeamId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TeamMembers]    Script Date: 24/02/2022 09:50:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TeamMembers](
	[MemberId] [int] IDENTITY(1,1) NOT NULL,
	[TeamId] [int] NULL,
	[CreatedAt] [timestamp] NOT NULL,
	[UserId] [int] NULL,
	[PermissionId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MemberId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TeamMembersPermission]    Script Date: 24/02/2022 09:50:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TeamMembersPermission](
	[TmPermissionId] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](200) NULL,
	[CreatedAt] [timestamp] NOT NULL,
	[MemberId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[TmPermissionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Timesheet]    Script Date: 24/02/2022 09:50:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Timesheet](
	[TimesheetId] [int] IDENTITY(1,1) NOT NULL,
	[Time_sheet_date] [datetime] NULL,
	[TaskId] [int] NULL,
	[EmpId] [int] NULL,
	[Created_at] [timestamp] NOT NULL,
	[ActivityDesc] [nvarchar](100) NULL,
	[Status] [tinyint] NULL,
	[HoursWorked] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[TimesheetId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 24/02/2022 09:50:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[EmailAddress] [nvarchar](50) NULL,
	[Gender] [nvarchar](50) NULL,
	[CreatedAt] [timestamp] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Company]  WITH CHECK ADD FOREIGN KEY([EmpId])
REFERENCES [dbo].[Employee] ([EmpId])
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Company] ([CompanyId])
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Company] ([CompanyId])
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD FOREIGN KEY([TeamId])
REFERENCES [dbo].[Team] ([TeamId])
GO
ALTER TABLE [dbo].[ProductTeam]  WITH CHECK ADD FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([ProductId])
GO
ALTER TABLE [dbo].[ProductTeam]  WITH CHECK ADD FOREIGN KEY([TeamId])
REFERENCES [dbo].[Team] ([TeamId])
GO
ALTER TABLE [dbo].[TaskType]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[TeamMembers]  WITH CHECK ADD FOREIGN KEY([PermissionId])
REFERENCES [dbo].[Permission] ([PermissionId])
GO
ALTER TABLE [dbo].[TeamMembers]  WITH CHECK ADD FOREIGN KEY([TeamId])
REFERENCES [dbo].[Team] ([TeamId])
GO
ALTER TABLE [dbo].[TeamMembers]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[TeamMembersPermission]  WITH CHECK ADD FOREIGN KEY([MemberId])
REFERENCES [dbo].[TeamMembers] ([MemberId])
GO
ALTER TABLE [dbo].[Timesheet]  WITH CHECK ADD FOREIGN KEY([EmpId])
REFERENCES [dbo].[Employee] ([EmpId])
GO
ALTER TABLE [dbo].[Timesheet]  WITH CHECK ADD FOREIGN KEY([TaskId])
REFERENCES [dbo].[TaskType] ([TaskId])
GO
USE [master]
GO
ALTER DATABASE [TimeTracker_db] SET  READ_WRITE 
GO
