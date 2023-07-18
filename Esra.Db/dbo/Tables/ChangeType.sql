CREATE TABLE [dbo].[ChangeType] (
    [ChangeTypeID] INT            IDENTITY (101, 1) NOT NULL,
    [Type]         VARCHAR (64)   NULL,
    [ShortType]    VARCHAR (20)   NULL,
    [Description]  VARCHAR (1028) NULL,
    CONSTRAINT [PK_ChangeType] PRIMARY KEY CLUSTERED ([ChangeTypeID] ASC)
);

