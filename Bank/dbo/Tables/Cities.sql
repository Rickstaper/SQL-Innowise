CREATE TABLE [dbo].[Cities] (
    [Id]         INT            IDENTITY (1, 1) NOT NULL,
    [City_Name] NVARCHAR (170) NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [UQ_City_Name] UNIQUE NONCLUSTERED ([City_Name] ASC)
);



