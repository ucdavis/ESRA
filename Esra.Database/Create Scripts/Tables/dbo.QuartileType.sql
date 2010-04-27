﻿USE [ESRA]
GO

/****** Object:  Table [dbo].[QuartileType]    Script Date: 07/01/2009 13:40:47 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[QuartileType](
	[QuartileTypeID] [int] IDENTITY(101,1) NOT NULL,
	[Type] [varchar](64) NULL,
	[ShortType] [varchar](20) NULL,
	[Description] [varchar](1028) NULL,
 CONSTRAINT [PK_QuartileType] PRIMARY KEY CLUSTERED 
(
	[QuartileTypeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


