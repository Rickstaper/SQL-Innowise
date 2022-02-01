CREATE TABLE [dbo].[Banks] (
    [Id]        INT          IDENTITY (1, 1) NOT NULL,
    [Bank_Name] VARCHAR (40) NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [UQ_Bank_Name] UNIQUE NONCLUSTERED ([Bank_Name] ASC)
);





