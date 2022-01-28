CREATE TABLE [dbo].[Branches] (
    [Id]          INT            IDENTITY (1, 1) NOT NULL,
    [Branch_Name] NVARCHAR (100) DEFAULT ('Nameless') NULL,
    [Bank_Id]     INT            NOT NULL,
    [City_Id]     INT            NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_Branches_To_Banks] FOREIGN KEY ([Bank_Id]) REFERENCES [dbo].[Banks] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_Branches_To_Cities] FOREIGN KEY ([City_Id]) REFERENCES [dbo].[Cities] ([Id]) ON DELETE CASCADE
);

