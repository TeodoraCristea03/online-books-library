CREATE TABLE [dbo].[Carti] (
    [Id]           INT            IDENTITY (10, 10) NOT NULL,
    [Titlu]        NVARCHAR (MAX) NOT NULL,
    [ID_Autor]     INT            NOT NULL,
    [ID_Editura]   INT            NOT NULL,
    [Numar Pagini] INT            NOT NULL,
    [Data Lansare] DATE           NOT NULL,
    [Autor] NVARCHAR(MAX)		  NOT NULL, 
    [Editura] NVARCHAR(MAX)		  NOT NULL, 
    PRIMARY KEY CLUSTERED ([Id] ASC)
);

