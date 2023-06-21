CREATE TABLE [dbo].[Imprumuturi] (
    [ID_Imprumut]    INT  IDENTITY (2, 2) NOT NULL,
    [Data_Imprumut]  DATE NULL,
    [Imprumut_Activ] BIT  NULL,
    [ID_Client]      INT  NOT NULL,
    [ID_Carte]       INT  NOT NULL,
    PRIMARY KEY CLUSTERED ([ID_Imprumut] ASC)
);

