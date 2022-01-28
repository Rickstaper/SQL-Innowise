CREATE TABLE [dbo].[Banks] (
    [Id]        INT          IDENTITY (1, 1) NOT NULL,
    [Bank_Name_Bank] VARCHAR (40) NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [UQ_Name] UNIQUE NONCLUSTERED ([Bank_Name_Bank] ASC)
);

