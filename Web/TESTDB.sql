USE [TESTDB]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 26.06.2020 00:23:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ApplicationRole]    Script Date: 26.06.2020 00:23:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApplicationRole](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_ApplicationRole] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ApplicationRoleClaims]    Script Date: 26.06.2020 00:23:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApplicationRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_ApplicationRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ApplicationUser]    Script Date: 26.06.2020 00:23:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApplicationUser](
	[Id] [nvarchar](450) NOT NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
 CONSTRAINT [PK_ApplicationUser] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ApplicationUserClaims]    Script Date: 26.06.2020 00:23:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApplicationUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_ApplicationUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ApplicationUserLogins]    Script Date: 26.06.2020 00:23:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApplicationUserLogins](
	[LoginProvider] [nvarchar](450) NOT NULL,
	[ProviderKey] [nvarchar](450) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_ApplicationUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ApplicationUserRoles]    Script Date: 26.06.2020 00:23:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApplicationUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_ApplicationUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ApplicationUserTokens]    Script Date: 26.06.2020 00:23:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApplicationUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_ApplicationUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LocalizationResources]    Script Date: 26.06.2020 00:23:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LocalizationResources](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Author] [nvarchar](100) NOT NULL,
	[FromCode] [bit] NOT NULL,
	[IsHidden] [bit] NOT NULL,
	[IsModified] [bit] NOT NULL,
	[ModificationDate] [datetime2](7) NOT NULL,
	[ResourceKey] [nvarchar](1000) NOT NULL,
	[Notes] [nvarchar](3000) NULL,
 CONSTRAINT [PK_LocalizationResources] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LocalizationResourceTranslations]    Script Date: 26.06.2020 00:23:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LocalizationResourceTranslations](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Language] [nvarchar](10) NOT NULL,
	[ResourceId] [int] NOT NULL,
	[Value] [nvarchar](max) NULL,
	[ModificationDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_LocalizationResourceTranslations] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200625211910_Initial', N'3.1.5')
GO
ALTER TABLE [dbo].[ApplicationRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_ApplicationRoleClaims_ApplicationRole_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[ApplicationRole] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ApplicationRoleClaims] CHECK CONSTRAINT [FK_ApplicationRoleClaims_ApplicationRole_RoleId]
GO
ALTER TABLE [dbo].[ApplicationUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_ApplicationUserClaims_ApplicationUser_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[ApplicationUser] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ApplicationUserClaims] CHECK CONSTRAINT [FK_ApplicationUserClaims_ApplicationUser_UserId]
GO
ALTER TABLE [dbo].[ApplicationUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_ApplicationUserLogins_ApplicationUser_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[ApplicationUser] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ApplicationUserLogins] CHECK CONSTRAINT [FK_ApplicationUserLogins_ApplicationUser_UserId]
GO
ALTER TABLE [dbo].[ApplicationUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_ApplicationUserRoles_ApplicationRole_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[ApplicationRole] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ApplicationUserRoles] CHECK CONSTRAINT [FK_ApplicationUserRoles_ApplicationRole_RoleId]
GO
ALTER TABLE [dbo].[ApplicationUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_ApplicationUserRoles_ApplicationUser_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[ApplicationUser] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ApplicationUserRoles] CHECK CONSTRAINT [FK_ApplicationUserRoles_ApplicationUser_UserId]
GO
ALTER TABLE [dbo].[ApplicationUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_ApplicationUserTokens_ApplicationUser_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[ApplicationUser] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ApplicationUserTokens] CHECK CONSTRAINT [FK_ApplicationUserTokens_ApplicationUser_UserId]
GO
ALTER TABLE [dbo].[LocalizationResourceTranslations]  WITH CHECK ADD  CONSTRAINT [FK_LocalizationResourceTranslations_LocalizationResources_ResourceId] FOREIGN KEY([ResourceId])
REFERENCES [dbo].[LocalizationResources] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[LocalizationResourceTranslations] CHECK CONSTRAINT [FK_LocalizationResourceTranslations_LocalizationResources_ResourceId]
GO
