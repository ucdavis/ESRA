CREATE TABLE [dbo].[SelectionType] (
    [SelectionTypeID] INT           IDENTITY (101, 1) NOT NULL,
    [Type]            VARCHAR (64)  NULL,
    [ShortType]       VARCHAR (20)  NULL,
    [Description]     VARCHAR (128) NULL,
    [SortOrder]       CHAR (2)      NULL,
    CONSTRAINT [PK_SelectionType] PRIMARY KEY CLUSTERED ([SelectionTypeID] ASC)
);

