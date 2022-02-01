CREATE TABLE [dbo].[Clients] (
    [Id]               INT           IDENTITY (1, 1) NOT NULL,
    [FirstName]        NVARCHAR (30) NOT NULL,
    [SecondName]       NVARCHAR (30) NOT NULL,
    [Age]              INT           NOT NULL,
    [Phone]            NVARCHAR (12) NOT NULL,
    [Email]            NVARCHAR (30) NULL,
    [Bank_id]          INT           NOT NULL,
    [Social_status_id] INT           NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [CK_Age] CHECK ([Age]>(16) AND [Age]<(120)),
    CONSTRAINT [FK_Clients_To_Bank] FOREIGN KEY ([Bank_id]) REFERENCES [dbo].[Banks] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_Clients_To_Social_status] FOREIGN KEY ([Social_status_id]) REFERENCES [dbo].[Social_status] ([Id]) ON DELETE CASCADE
);



