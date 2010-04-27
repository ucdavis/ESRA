USE [ESRA]
GO

/****** Object:  Table [dbo].[SelectionType]    Script Date: 07/01/2009 13:44:55 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[SelectionType](
	[SelectionTypeID] [int] IDENTITY(101,1) NOT NULL,
	[Type] [varchar](64) NULL,
	[ShortType] [varchar](20) NULL,
	[Description] [varchar](128) NULL,
	[SortOrder] [char](2) NULL,
 CONSTRAINT [PK_SelectionType] PRIMARY KEY CLUSTERED 
(
	[SelectionTypeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


