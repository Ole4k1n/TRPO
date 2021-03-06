USE [master]
GO
/****** Object:  Database [SocialStudy]    Script Date: 24.10.2020 11:31:52 ******/
CREATE DATABASE [SocialStudy]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SocialStudy', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLSERVER\MSSQL\DATA\SocialStudy.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SocialStudy_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLSERVER\MSSQL\DATA\SocialStudy_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [SocialStudy] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SocialStudy].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SocialStudy] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SocialStudy] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SocialStudy] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SocialStudy] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SocialStudy] SET ARITHABORT OFF 
GO
ALTER DATABASE [SocialStudy] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SocialStudy] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SocialStudy] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SocialStudy] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SocialStudy] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SocialStudy] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SocialStudy] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SocialStudy] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SocialStudy] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SocialStudy] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SocialStudy] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SocialStudy] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SocialStudy] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SocialStudy] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SocialStudy] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SocialStudy] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SocialStudy] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SocialStudy] SET RECOVERY FULL 
GO
ALTER DATABASE [SocialStudy] SET  MULTI_USER 
GO
ALTER DATABASE [SocialStudy] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SocialStudy] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SocialStudy] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SocialStudy] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SocialStudy] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'SocialStudy', N'ON'
GO
ALTER DATABASE [SocialStudy] SET QUERY_STORE = OFF
GO
USE [SocialStudy]
GO
/****** Object:  Table [dbo].[Agents]    Script Date: 24.10.2020 11:31:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Agents](
	[id_agent] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Agents] PRIMARY KEY CLUSTERED 
(
	[id_agent] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Answers]    Script Date: 24.10.2020 11:31:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Answers](
	[id_answer] [int] IDENTITY(1,1) NOT NULL,
	[Text] [nvarchar](max) NOT NULL,
	[id_question] [int] NOT NULL,
 CONSTRAINT [PK_Answers] PRIMARY KEY CLUSTERED 
(
	[id_answer] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OneResearch]    Script Date: 24.10.2020 11:31:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OneResearch](
	[id_OR] [int] IDENTITY(1,1) NOT NULL,
	[id_research] [int] NOT NULL,
	[Form] [nvarchar](max) NOT NULL,
	[Start_date] [date] NOT NULL,
	[Finish_date] [date] NOT NULL,
 CONSTRAINT [PK_OneResearch] PRIMARY KEY CLUSTERED 
(
	[id_OR] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ParticipantResearch]    Script Date: 24.10.2020 11:31:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ParticipantResearch](
	[id_PR] [int] IDENTITY(1,1) NOT NULL,
	[id_respondent] [int] NOT NULL,
	[id_OR] [int] NOT NULL,
	[id_agent] [int] NOT NULL,
	[SocialPosition] [nvarchar](max) NOT NULL,
	[Agreement] [nvarchar](50) NULL,
	[Refusal] [nvarchar](50) NULL,
	[NextAgreement] [nvarchar](50) NULL,
 CONSTRAINT [PK_ParticipantResearch] PRIMARY KEY CLUSTERED 
(
	[id_PR] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Questions]    Script Date: 24.10.2020 11:31:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Questions](
	[id_question] [int] IDENTITY(1,1) NOT NULL,
	[Text] [nvarchar](100) NOT NULL,
	[id_research] [int] NOT NULL,
 CONSTRAINT [PK_Questions] PRIMARY KEY CLUSTERED 
(
	[id_question] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Researchs]    Script Date: 24.10.2020 11:31:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Researchs](
	[id_research] [int] IDENTITY(1,1) NOT NULL,
	[Topic] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Researchs] PRIMARY KEY CLUSTERED 
(
	[id_research] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Respondents]    Script Date: 24.10.2020 11:31:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Respondents](
	[id_respondent] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](100) NOT NULL,
	[Born] [nvarchar](100) NOT NULL,
	[Address] [nvarchar](100) NOT NULL,
	[Number] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Respondents] PRIMARY KEY CLUSTERED 
(
	[id_respondent] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Answers]  WITH CHECK ADD  CONSTRAINT [FK_Answers_Questions] FOREIGN KEY([id_question])
REFERENCES [dbo].[Questions] ([id_question])
GO
ALTER TABLE [dbo].[Answers] CHECK CONSTRAINT [FK_Answers_Questions]
GO
ALTER TABLE [dbo].[OneResearch]  WITH CHECK ADD  CONSTRAINT [FK_OneResearch_Researchs] FOREIGN KEY([id_research])
REFERENCES [dbo].[Researchs] ([id_research])
GO
ALTER TABLE [dbo].[OneResearch] CHECK CONSTRAINT [FK_OneResearch_Researchs]
GO
ALTER TABLE [dbo].[ParticipantResearch]  WITH CHECK ADD  CONSTRAINT [FK_ParticipantResearch_Agents] FOREIGN KEY([id_agent])
REFERENCES [dbo].[Agents] ([id_agent])
GO
ALTER TABLE [dbo].[ParticipantResearch] CHECK CONSTRAINT [FK_ParticipantResearch_Agents]
GO
ALTER TABLE [dbo].[ParticipantResearch]  WITH CHECK ADD  CONSTRAINT [FK_ParticipantResearch_OneResearch] FOREIGN KEY([id_OR])
REFERENCES [dbo].[OneResearch] ([id_OR])
GO
ALTER TABLE [dbo].[ParticipantResearch] CHECK CONSTRAINT [FK_ParticipantResearch_OneResearch]
GO
ALTER TABLE [dbo].[ParticipantResearch]  WITH CHECK ADD  CONSTRAINT [FK_ParticipantResearch_Respondents] FOREIGN KEY([id_respondent])
REFERENCES [dbo].[Respondents] ([id_respondent])
GO
ALTER TABLE [dbo].[ParticipantResearch] CHECK CONSTRAINT [FK_ParticipantResearch_Respondents]
GO
ALTER TABLE [dbo].[Questions]  WITH CHECK ADD  CONSTRAINT [FK_Questions_Researchs] FOREIGN KEY([id_research])
REFERENCES [dbo].[Researchs] ([id_research])
GO
ALTER TABLE [dbo].[Questions] CHECK CONSTRAINT [FK_Questions_Researchs]
GO
USE [master]
GO
ALTER DATABASE [SocialStudy] SET  READ_WRITE 
GO
