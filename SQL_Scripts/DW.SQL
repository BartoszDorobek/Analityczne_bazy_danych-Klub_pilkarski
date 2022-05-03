/*
Created: 13.04.2022
Modified: 13.04.2022
Model: Microsoft SQL Server 2017
Database: MS SQL Server 2017
*/


-- Create tables section -------------------------------------------------

-- Table dbo.DimPodmiotWykonujący

CREATE TABLE [dbo].[DimPodmiotWykonujący]
(
 [IdPodmiotu] Int IDENTITY NOT NULL,
 [IdPodmiotuT] Int NOT NULL,
 [Nazwa] Varchar(30) NOT NULL,
 [NumerTelefonu] Varchar(14) NULL,
 [Mail] Varchar(40) NULL,
 [DataUtworzenia] Datetime DEFAULT CURRENT_TIMESTAMP NOT NULL,
 [DataModyfikacji] Datetime NULL
)
ON [PRIMARY]
go

-- Add keys for table dbo.DimPodmiotWykonujący

ALTER TABLE [dbo].[DimPodmiotWykonujący] ADD CONSTRAINT [PK_DimPodmiotWykonujący] PRIMARY KEY ([IdPodmiotu])
go

ALTER TABLE [dbo].[DimPodmiotWykonujący] ADD CONSTRAINT [IdPodmiotuT] UNIQUE ([IdPodmiotuT])
go

-- Table dbo.DimZawodnik

CREATE TABLE [dbo].[DimZawodnik]
(
 [IdZawodnika] Int IDENTITY NOT NULL,
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
EXEC sp_addextendedproperty 'MS_Description', 'Waga zawodnika w kg.', 'SCHEMA', 'dbo', 'TABLE', 'DimZawodnik', 'COLUMN', 'Waga'
go
EXEC sp_addextendedproperty 'MS_Description', 'Wzrost zawodnika w centymetrach.', 'SCHEMA', 'dbo', 'TABLE', 'DimZawodnik', 'COLUMN', 'Wzrost'
go

-- Add keys for table dbo.DimZawodnik

ALTER TABLE [dbo].[DimZawodnik] ADD CONSTRAINT [PK_DimZawodnik] PRIMARY KEY ([IdZawodnika])
go

ALTER TABLE [dbo].[DimZawodnik] ADD CONSTRAINT [IdZawodnikaT] UNIQUE ([IdZawodnikaT])
go

-- Table dbo.DimMecz

CREATE TABLE [dbo].[DimMecz]
(
 [IdMeczu] Int IDENTITY NOT NULL,
 [IdMeczuT] Int NOT NULL,
 [Przeciwnik] Varchar(30) NOT NULL,
 [DataUtworzenia] Datetime NOT NULL,
 [DataModyfikacji] Datetime NULL
)
ON [PRIMARY]
go

-- Add keys for table dbo.DimMecz

ALTER TABLE [dbo].[DimMecz] ADD CONSTRAINT [PK_DimMecz] PRIMARY KEY ([IdMeczu])
go

ALTER TABLE [dbo].[DimMecz] ADD CONSTRAINT [IdMeczuT] UNIQUE ([IdMeczuT])
go

-- Table dbo.DimStadion

CREATE TABLE [dbo].[DimStadion]
(
 [IdStadionu] Int IDENTITY NOT NULL,
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

-- Add keys for table dbo.DimStadion

ALTER TABLE [dbo].[DimStadion] ADD CONSTRAINT [PK_DimStadion] PRIMARY KEY ([IdStadionu])
go

ALTER TABLE [dbo].[DimStadion] ADD CONSTRAINT [IdStadionuT] UNIQUE ([IdStadionuT])
go

-- Table dbo.FactStatystyki

CREATE TABLE [dbo].[FactStatystyki]
(
 [IdStadionu] Int NOT NULL,
 [IdMeczu] Int NOT NULL,
 [IdZawodnika] Int NOT NULL,
 [IdCzasu] Int NOT NULL,
 [BramkiStrzelone] Int NOT NULL,
 [BramkiStracone] Int NOT NULL,
 [CzasGry] Int NOT NULL,
 [CzyWyjsciowy] Bit NOT NULL,
 [LiczbaZoltych] Int NOT NULL,
 [LiczbaCzerwonych] Int NOT NULL,
 [Wynik] Int NULL
)
ON [PRIMARY]
go

-- Add keys for table dbo.FactStatystyki

ALTER TABLE [dbo].[FactStatystyki] ADD CONSTRAINT [PK_FactStatystyki] PRIMARY KEY ([IdStadionu],[IdMeczu],[IdCzasu],[IdZawodnika])
go

-- Table dbo.DimCzas

CREATE TABLE [dbo].[DimCzas]
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

-- Add keys for table dbo.DimCzas

ALTER TABLE [dbo].[DimCzas] ADD CONSTRAINT [PK_DimCzas] PRIMARY KEY NONCLUSTERED ([IdCzasu])
go

ALTER TABLE [dbo].[DimCzas] ADD CONSTRAINT [Data] UNIQUE CLUSTERED ([Data])
go

-- Table dbo.FactTesty

CREATE TABLE [dbo].[FactTesty]
(
 [IdCzasu] Int NOT NULL,
 [IdZawodnika] Int NOT NULL,
 [IdTestu] Int NOT NULL,
 [IdPodmiotu] Int NOT NULL,
 [CzyPozytywny] Bit NOT NULL,
 [Ocena] Int NOT NULL
)
ON [PRIMARY]
go

-- Add keys for table dbo.FactTesty

ALTER TABLE [dbo].[FactTesty] ADD CONSTRAINT [PK_FactTesty] PRIMARY KEY ([IdZawodnika],[IdCzasu],[IdTestu],[IdPodmiotu])
go

-- Table dbo.DimRodzajTestu

CREATE TABLE [dbo].[DimRodzajTestu]
(
 [IdTestu] Int IDENTITY NOT NULL,
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

-- Add keys for table dbo.DimRodzajTestu

ALTER TABLE [dbo].[DimRodzajTestu] ADD CONSTRAINT [PK_DimRodzajTestu] PRIMARY KEY ([IdTestu])
go

ALTER TABLE [dbo].[DimRodzajTestu] ADD CONSTRAINT [IdTestuT] UNIQUE ([IdTestuT])
go

-- Create foreign keys (relationships) section ------------------------------------------------- 


ALTER TABLE [dbo].[FactStatystyki] ADD CONSTRAINT [StatystykiNaStadionie] FOREIGN KEY ([IdStadionu]) REFERENCES [dbo].[DimStadion] ([IdStadionu]) ON UPDATE NO ACTION ON DELETE NO ACTION
go



ALTER TABLE [dbo].[FactStatystyki] ADD CONSTRAINT [StatystykiWMeczu] FOREIGN KEY ([IdMeczu]) REFERENCES [dbo].[DimMecz] ([IdMeczu]) ON UPDATE NO ACTION ON DELETE NO ACTION
go



ALTER TABLE [dbo].[FactStatystyki] ADD CONSTRAINT [StatystykiZawodnika] FOREIGN KEY ([IdZawodnika]) REFERENCES [dbo].[DimZawodnik] ([IdZawodnika]) ON UPDATE NO ACTION ON DELETE NO ACTION
go



ALTER TABLE [dbo].[FactStatystyki] ADD CONSTRAINT [StatystykiSaWCzasie] FOREIGN KEY ([IdCzasu]) REFERENCES [dbo].[DimCzas] ([IdCzasu]) ON UPDATE NO ACTION ON DELETE NO ACTION
go



ALTER TABLE [dbo].[FactTesty] ADD CONSTRAINT [TestySaWCzasie] FOREIGN KEY ([IdCzasu]) REFERENCES [dbo].[DimCzas] ([IdCzasu]) ON UPDATE NO ACTION ON DELETE NO ACTION
go



ALTER TABLE [dbo].[FactTesty] ADD CONSTRAINT [ZawodnikPrzechodziTesty] FOREIGN KEY ([IdZawodnika]) REFERENCES [dbo].[DimZawodnik] ([IdZawodnika]) ON UPDATE NO ACTION ON DELETE NO ACTION
go



ALTER TABLE [dbo].[FactTesty] ADD CONSTRAINT [TestyMajaRodzaje] FOREIGN KEY ([IdTestu]) REFERENCES [dbo].[DimRodzajTestu] ([IdTestu]) ON UPDATE NO ACTION ON DELETE NO ACTION
go



ALTER TABLE [dbo].[FactTesty] ADD CONSTRAINT [PodmiotyWykonujaTesty] FOREIGN KEY ([IdPodmiotu]) REFERENCES [dbo].[DimPodmiotWykonujący] ([IdPodmiotu]) ON UPDATE NO ACTION ON DELETE NO ACTION
go




