CREATE TABLE [dbo].[Social_status] (
    [Id]             INT           IDENTITY (1, 1) NOT NULL,
    [current_status] NVARCHAR (30) DEFAULT ('unemployed') NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);

