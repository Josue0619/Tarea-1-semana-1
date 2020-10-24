USE [master]
GO
/****** Object:  Table [dbo].[dias_de_clases]    Script Date: 23/10/2020 22:45:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dias_de_clases](
	[Tipos_de_dia] [int] NOT NULL,
	[Clases_de_Dia] [char](25) NOT NULL,
 CONSTRAINT [pk_tipos_dia] PRIMARY KEY CLUSTERED 
(
	[Tipos_de_dia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[horarios_por_periodo]    Script Date: 23/10/2020 22:45:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[horarios_por_periodo](
	[Tipos_de_dia] [int] NOT NULL,
	[Tipos_de_periodos] [int] NOT NULL,
	[Horario] [char](10) NOT NULL,
 CONSTRAINT [pk_tipos_de_periodo] PRIMARY KEY CLUSTERED 
(
	[Tipos_de_dia] ASC,
	[Tipos_de_periodos] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[periodos]    Script Date: 23/10/2020 22:45:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[periodos](
	[periodos] [char](20) NULL,
	[Tipos] [int] NOT NULL,
 CONSTRAINT [pk_tipos_periodo] PRIMARY KEY CLUSTERED 
(
	[Tipos] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Total_horas_por_periodo]    Script Date: 23/10/2020 22:45:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Total_horas_por_periodo](
	[Tipos_de_dia] [int] NOT NULL,
	[Hrsp_punta] [int] NOT NULL,
	[Hrsp_intermedio] [int] NOT NULL,
	[Hrsp_valle] [int] NOT NULL,
 CONSTRAINT [pk_tipos_de_dia] PRIMARY KEY CLUSTERED 
(
	[Tipos_de_dia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[dias_de_clases] ([Tipos_de_dia], [Clases_de_Dia]) VALUES (1, N'Laborable                ')
INSERT [dbo].[dias_de_clases] ([Tipos_de_dia], [Clases_de_Dia]) VALUES (2, N'sabado                   ')
INSERT [dbo].[dias_de_clases] ([Tipos_de_dia], [Clases_de_Dia]) VALUES (3, N'Domingo o Feriados       ')
GO
INSERT [dbo].[horarios_por_periodo] ([Tipos_de_dia], [Tipos_de_periodos], [Horario]) VALUES (1, 1, N'10 a 16   ')
INSERT [dbo].[horarios_por_periodo] ([Tipos_de_dia], [Tipos_de_periodos], [Horario]) VALUES (1, 2, N'5 a 10    ')
INSERT [dbo].[horarios_por_periodo] ([Tipos_de_dia], [Tipos_de_periodos], [Horario]) VALUES (1, 3, N'0 a 5     ')
INSERT [dbo].[horarios_por_periodo] ([Tipos_de_dia], [Tipos_de_periodos], [Horario]) VALUES (2, 1, N'12 a 13   ')
INSERT [dbo].[horarios_por_periodo] ([Tipos_de_dia], [Tipos_de_periodos], [Horario]) VALUES (2, 2, N'6 a 18    ')
INSERT [dbo].[horarios_por_periodo] ([Tipos_de_dia], [Tipos_de_periodos], [Horario]) VALUES (2, 3, N'0 a 6     ')
INSERT [dbo].[horarios_por_periodo] ([Tipos_de_dia], [Tipos_de_periodos], [Horario]) VALUES (3, 2, N'11 a 13   ')
INSERT [dbo].[horarios_por_periodo] ([Tipos_de_dia], [Tipos_de_periodos], [Horario]) VALUES (3, 3, N'0 a 11    ')
GO
INSERT [dbo].[periodos] ([periodos], [Tipos]) VALUES (N'De Punta            ', 1)
INSERT [dbo].[periodos] ([periodos], [Tipos]) VALUES (N'Intermedio          ', 2)
INSERT [dbo].[periodos] ([periodos], [Tipos]) VALUES (N'De valle            ', 3)
GO
INSERT [dbo].[Total_horas_por_periodo] ([Tipos_de_dia], [Hrsp_punta], [Hrsp_intermedio], [Hrsp_valle]) VALUES (2, 2, 16, 6)
GO
ALTER TABLE [dbo].[horarios_por_periodo]  WITH CHECK ADD  CONSTRAINT [fk_tipos_de_periodos] FOREIGN KEY([Tipos_de_periodos])
REFERENCES [dbo].[periodos] ([Tipos])
GO
ALTER TABLE [dbo].[horarios_por_periodo] CHECK CONSTRAINT [fk_tipos_de_periodos]
GO
ALTER TABLE [dbo].[periodos]  WITH CHECK ADD  CONSTRAINT [fk_tipos] FOREIGN KEY([Tipos])
REFERENCES [dbo].[dias_de_clases] ([Tipos_de_dia])
GO
ALTER TABLE [dbo].[periodos] CHECK CONSTRAINT [fk_tipos]
GO
ALTER TABLE [dbo].[Total_horas_por_periodo]  WITH CHECK ADD  CONSTRAINT [fk_hperiodopunta] FOREIGN KEY([Hrsp_punta])
REFERENCES [dbo].[dias_de_clases] ([Tipos_de_dia])
GO
ALTER TABLE [dbo].[Total_horas_por_periodo] CHECK CONSTRAINT [fk_hperiodopunta]
GO
