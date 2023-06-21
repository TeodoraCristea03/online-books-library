CREATE TABLE [dbo].[Autori] (
    [ID_Autor]      INT            IDENTITY (5, 5) NOT NULL,
    [Nume]          NVARCHAR (MAX) NOT NULL,
    [Prenume]       NVARCHAR (MAX) NOT NULL,
    [Data_Nastere]  DATE           NOT NULL,
    [Nationalitate] NVARCHAR (MAX) NOT NULL,
    [Numar Carti Scrise] INT	   NOT NULL, 
    PRIMARY KEY CLUSTERED ([ID_Autor] ASC)
);

