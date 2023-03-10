USE [formularios]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 27/12/2022 21:39:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 27/12/2022 21:39:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 27/12/2022 21:39:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 27/12/2022 21:39:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 27/12/2022 21:39:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Campos]    Script Date: 27/12/2022 21:39:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Campos](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FormularioId] [int] NOT NULL,
	[Campo] [varchar](50) NOT NULL,
	[Titulo] [varchar](50) NULL,
	[TipoId] [int] NOT NULL,
	[Requerido] [bit] NOT NULL,
 CONSTRAINT [PK_Campos] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Formularios]    Script Date: 27/12/2022 21:39:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Formularios](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Url] [varchar](50) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Descripcion] [varchar](500) NULL,
	[UsuarioId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_Formularios] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Recolecciones]    Script Date: 27/12/2022 21:39:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Recolecciones](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FormularioId] [int] NOT NULL,
	[FechaRegistro] [datetime] NOT NULL,
 CONSTRAINT [PK_Recolecciones] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RecoleccionesDetalles]    Script Date: 27/12/2022 21:39:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RecoleccionesDetalles](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[RecoleccionId] [int] NOT NULL,
	[CampoId] [int] NOT NULL,
	[TipoId] [int] NOT NULL,
	[ValorTexto] [varchar](500) NULL,
	[ValorNumero] [int] NULL,
	[ValorFecha] [date] NULL,
 CONSTRAINT [PK_RecoleccionesDetalles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Tipos]    Script Date: 27/12/2022 21:39:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tipos](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[TipoHtml] [varchar](50) NOT NULL,
	[NombreHtml] [varchar](50) NULL,
 CONSTRAINT [PK_Tipos] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET IDENTITY_INSERT [dbo].[Tipos] ON 

INSERT [dbo].[Tipos] ([Id], [Nombre], [TipoHtml], [NombreHtml]) VALUES (1, N'Texto', N'text', N'ValorTexto')
INSERT [dbo].[Tipos] ([Id], [Nombre], [TipoHtml], [NombreHtml]) VALUES (2, N'Número', N'number', N'ValorNumero')
INSERT [dbo].[Tipos] ([Id], [Nombre], [TipoHtml], [NombreHtml]) VALUES (3, N'Fecha', N'date', N'ValorFecha')
SET IDENTITY_INSERT [dbo].[Tipos] OFF
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[Campos]  WITH CHECK ADD  CONSTRAINT [FK_Campos_Formularios] FOREIGN KEY([FormularioId])
REFERENCES [dbo].[Formularios] ([Id])
GO
ALTER TABLE [dbo].[Campos] CHECK CONSTRAINT [FK_Campos_Formularios]
GO
ALTER TABLE [dbo].[Campos]  WITH CHECK ADD  CONSTRAINT [FK_Campos_Tipos] FOREIGN KEY([TipoId])
REFERENCES [dbo].[Tipos] ([Id])
GO
ALTER TABLE [dbo].[Campos] CHECK CONSTRAINT [FK_Campos_Tipos]
GO
ALTER TABLE [dbo].[Formularios]  WITH CHECK ADD  CONSTRAINT [FK_Formularios_AspNetUsers] FOREIGN KEY([UsuarioId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Formularios] CHECK CONSTRAINT [FK_Formularios_AspNetUsers]
GO
ALTER TABLE [dbo].[Recolecciones]  WITH CHECK ADD  CONSTRAINT [FK_Recolecciones_Formularios] FOREIGN KEY([FormularioId])
REFERENCES [dbo].[Formularios] ([Id])
GO
ALTER TABLE [dbo].[Recolecciones] CHECK CONSTRAINT [FK_Recolecciones_Formularios]
GO
ALTER TABLE [dbo].[RecoleccionesDetalles]  WITH CHECK ADD  CONSTRAINT [FK_RecoleccionesDetalles_Campos] FOREIGN KEY([CampoId])
REFERENCES [dbo].[Campos] ([Id])
GO
ALTER TABLE [dbo].[RecoleccionesDetalles] CHECK CONSTRAINT [FK_RecoleccionesDetalles_Campos]
GO
ALTER TABLE [dbo].[RecoleccionesDetalles]  WITH CHECK ADD  CONSTRAINT [FK_RecoleccionesDetalles_Recolecciones] FOREIGN KEY([RecoleccionId])
REFERENCES [dbo].[Recolecciones] ([Id])
GO
ALTER TABLE [dbo].[RecoleccionesDetalles] CHECK CONSTRAINT [FK_RecoleccionesDetalles_Recolecciones]
GO
ALTER TABLE [dbo].[RecoleccionesDetalles]  WITH CHECK ADD  CONSTRAINT [FK_RecoleccionesDetalles_Tipos] FOREIGN KEY([TipoId])
REFERENCES [dbo].[Tipos] ([Id])
GO
ALTER TABLE [dbo].[RecoleccionesDetalles] CHECK CONSTRAINT [FK_RecoleccionesDetalles_Tipos]
GO
