CREATE TABLE [dbo].[ApptType] (
    [ApptTypeID]  INT            NOT NULL,
    [Type]        VARCHAR (64)   NULL,
    [ShortType]   VARCHAR (20)   NULL,
    [Description] VARCHAR (1028) NULL,
    CONSTRAINT [PK_ApptType] PRIMARY KEY CLUSTERED ([ApptTypeID] ASC)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Appt Type ID: Surrogate identity key of ApptType table.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ApptType', @level2type = N'COLUMN', @level2name = N'ApptTypeID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Appointment Type References: Contains translation of Appointment Type Codes to Appointment Types.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ApptType';

