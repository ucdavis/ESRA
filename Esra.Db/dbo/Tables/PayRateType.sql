CREATE TABLE [dbo].[PayRateType] (
    [PayRateTypeID] INT            IDENTITY (101, 1) NOT NULL,
    [Type]          VARCHAR (64)   NULL,
    [ShortType]     VARCHAR (20)   NULL,
    [Description]   VARCHAR (1028) NULL,
    CONSTRAINT [PK_PayRateType] PRIMARY KEY CLUSTERED ([PayRateTypeID] ASC)
);

