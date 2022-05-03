/*
Created: 13.04.2022
Modified: 14.04.2022
Model: Microsoft SQL Server 2017
Database: MS SQL Server 2017
*/


-- Create tables section -------------------------------------------------

-- Table dbo.DimPodmiotWykonującySt

CREATE TABLE [dbo].[DimPodmiotWykonującySt]
(
 [IdPodmiotuT] Int NOT NULL,
 [Nazwa] Varchar(30) NOT NULL,
 [NumerTelefonu] Varchar(14) NULL,
 [Mail] Varchar(40) NULL,
 [DataUtworzenia] Datetime DEFAULT CURRENT_TIMESTAMP NOT NULL,
 [DataModyfikacji] Datetime NULL
)
ON [PRIMARY]
go

-- Add keys for table dbo.DimPodmiotWykonującySt

ALTER TABLE [dbo].[DimPodmiotWykonującySt] ADD CONSTRAINT [PK_DimPodmiotWykonującySt] PRIMARY KEY ([IdPodmiotuT])
go

-- Table dbo.DimZawodnikSt

CREATE TABLE [dbo].[DimZawodnikSt]
(
 [IdZawodnikaT] Int NOT NULL,
 [Imie] Varchar(30) NOT NULL,
 [Nazwisko] Varchar(30) NOT NULL,
 [NumerKoszulki] Int NOT NULL,
 [Waga] Int NOT NULL,
 [Wzrost] Int NOT NULL,
 [Pozycja] Varchar(30) NULL
        CHECK (Pozycja in ('bramkarz', 'obronca', 'pomocnik', 'napastnik')),
 [DataUtworzenia] Datetime DEFAULT CURRENT_TIMESTAMP NOT NULL,
 [DataModyfikacji] Datetime NULL,
 [Narodowosc] Varchar(30) NULL,
 [Wiek] Int NOT NULL
)
ON [PRIMARY]
go
EXEC sp_addextendedproperty 'MS_Description', 'Waga zawodnika w kg.', 'SCHEMA', 'dbo', 'TABLE', 'DimZawodnikSt', 'COLUMN', 'Waga'
go
EXEC sp_addextendedproperty 'MS_Description', 'Wzrost zawodnika w centymetrach.', 'SCHEMA', 'dbo', 'TABLE', 'DimZawodnikSt', 'COLUMN', 'Wzrost'
go

-- Add keys for table dbo.DimZawodnikSt

ALTER TABLE [dbo].[DimZawodnikSt] ADD CONSTRAINT [PK_DimZawodnikSt] PRIMARY KEY ([IdZawodnikaT])
go

-- Table dbo.FactTestySt

CREATE TABLE [dbo].[FactTestySt]
(
 [IdWyniku] Int IDENTITY NOT NULL,
 [DataWykonania] Date NOT NULL,
 [Ocena] Int NOT NULL
        CHECK (Ocena BETWEEN 1 and 10),
 [Opis] Varchar(400) NULL,
 [IdTestu] Int NOT NULL,
 [IdZawodnika] Int NOT NULL
)
ON [PRIMARY]
go

-- Add keys for table dbo.FactTestySt

ALTER TABLE [dbo].[FactTestySt] ADD CONSTRAINT [PK_FactTestySt] PRIMARY KEY ([IdWyniku])
go

-- Table dbo.DimMeczSt

CREATE TABLE [dbo].[DimMeczSt]
(
 [IdMeczuT] Int NOT NULL,
 [Przeciwnik] Varchar(30) NOT NULL,
 [DataUtworzenia] Datetime NOT NULL,
 [DataModyfikacji] Datetime NULL
)
ON [PRIMARY]
go

-- Add keys for table dbo.DimMeczSt

ALTER TABLE [dbo].[DimMeczSt] ADD CONSTRAINT [PK_DimMeczSt] PRIMARY KEY ([IdMeczuT])
go

-- Table dbo.DimStadionSt

CREATE TABLE [dbo].[DimStadionSt]
(
 [IdStadionuT] Int NOT NULL,
 [Nazwa] Varchar(30) NOT NULL,
 [Miasto] Varchar(30) NOT NULL,
 [Ulica] Varchar(30) NOT NULL,
 [NrLokalu] Varchar(30) NOT NULL,
 [KodPocztowy] Char(6) NOT NULL,
 [DataUtworzenia] Datetime NOT NULL,
 [DataModyfikacji] Datetime NULL
)
ON [PRIMARY]
go

-- Add keys for table dbo.DimStadionSt

ALTER TABLE [dbo].[DimStadionSt] ADD CONSTRAINT [PK_DimStadionSt] PRIMARY KEY ([IdStadionuT])
go

-- Table dbo.DimCzasSt

CREATE TABLE [dbo].[DimCzasSt]
(
 [IdCzasu] Int NOT NULL,
 [Data] Date NOT NULL,
 [Miesiac] Smallint NOT NULL,
 [Kwartal] Smallint NOT NULL,
 [Rok] Int NOT NULL,
 [DzienTygodnia] Smallint NOT NULL,
 [DzienMiesiaca] Smallint NOT NULL,
 [NazwaDniaTygodniaPol] Varchar(15) NOT NULL,
 [NazwaMiesiacaPol] Varchar(15) NOT NULL,
 [NazwaTygodniaAng] Varchar(15) NOT NULL,
 [NazwaMiesiacaAng] Varchar(15) NOT NULL,
 [DataUtworzenia] Datetime DEFAULT CURRENT_TIMESTAMP NOT NULL,
 [DataModyfikacji] Datetime NULL
)
ON [PRIMARY]
go

-- Add keys for table dbo.DimCzasSt

ALTER TABLE [dbo].[DimCzasSt] ADD CONSTRAINT [PK_DimCzasSt] PRIMARY KEY NONCLUSTERED ([IdCzasu])
go

ALTER TABLE [dbo].[DimCzasSt] ADD CONSTRAINT [Data] UNIQUE CLUSTERED ([Data])
go

-- Table dbo.DimRodzajTestuSt

CREATE TABLE [dbo].[DimRodzajTestuSt]
(
 [IdTestuT] Int NOT NULL,
 [Rodzaj] Varchar(10) NOT NULL
        CHECK (Rodzaj in ('motoryczny','badanie')),
 [CzyObowiazkowy] Bit NOT NULL,
 [Nazwa] Varchar(30) NOT NULL,
 [DataUtworzenia] Datetime DEFAULT CURRENT_TIMESTAMP NOT NULL,
 [DataModyfikacji] Datetime NULL
)
ON [PRIMARY]
go

-- Add keys for table dbo.DimRodzajTestuSt

ALTER TABLE [dbo].[DimRodzajTestuSt] ADD CONSTRAINT [PK_DimRodzajTestuSt] PRIMARY KEY ([IdTestuT])
go

-- Table dbo.FactStatystykiSt

CREATE TABLE [dbo].[FactStatystykiSt]
(
 [IdWyniku] Int IDENTITY NOT NULL,
 [StrzeloneBramki] Int NOT NULL,
 [OcenaWystepu] Int NULL
        CHECK (OcenaWystepu BETWEEN 1 and 10),
 [CzasGry] Int NOT NULL,
 [CzyWyjsciowySklad] Bit NOT NULL,
 [Kartki] Varchar(30) NOT NULL
        CHECK (Kartki in ('brak','zolta','czerwona')),
 [ID_zawodnika] Int NOT NULL,
 [IdMeczu] Int NOT NULL
)
ON [PRIMARY]
go
EXEC sp_addextendedproperty 'MS_Description', 'Czas gry zawodnika w minutach', 'SCHEMA', 'dbo', 'TABLE', 'FactStatystykiSt', 'COLUMN', 'CzasGry'
go
EXEC sp_addextendedproperty 'MS_Description', '1 - skład podstawowy, 0 - skład rezerwowy', 'SCHEMA', 'dbo', 'TABLE', 'FactStatystykiSt', 'COLUMN', 'CzyWyjsciowySklad'
go

-- Add keys for table dbo.FactStatystykiSt

ALTER TABLE [dbo].[FactStatystykiSt] ADD CONSTRAINT [PK_FactStatystykiSt] PRIMARY KEY ([IdWyniku])
go




