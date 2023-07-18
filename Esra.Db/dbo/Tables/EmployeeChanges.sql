CREATE TABLE [dbo].[EmployeeChanges] (
    [EmployeeChangesID] INT           IDENTITY (101, 1) NOT NULL,
    [FkEmployee]        CHAR (13)     NOT NULL,
    [TitleCode]         CHAR (4)      NOT NULL,
    [UserID]            INT           NOT NULL,
    [DateChanged]       DATETIME      NOT NULL,
    [ChangeTypeID]      INT           NOT NULL,
    [Comments]          VARCHAR (255) NULL,
    CONSTRAINT [PK_EmployeeChanges] PRIMARY KEY CLUSTERED ([EmployeeChangesID] ASC),
    CONSTRAINT [FK_EmployeeChanges_ChangeType] FOREIGN KEY ([ChangeTypeID]) REFERENCES [dbo].[ChangeType] ([ChangeTypeID]),
    CONSTRAINT [FK_EmployeeChanges_Employee] FOREIGN KEY ([FkEmployee]) REFERENCES [dbo].[Employee] ([PkEmployee])
);

