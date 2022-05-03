use [ABD_GR04_SRC1]

ALTER TABLE [dbo].[Adresy] ADD
  [DataUtworzenia] Datetime DEFAULT CURRENT_TIMESTAMP NOT NULL,
  [DataModyfikacji] Datetime DEFAULT CURRENT_TIMESTAMP NOT NULL
go
ALTER TABLE [dbo].[Mecze] ADD
  [DataUtworzenia] Datetime DEFAULT CURRENT_TIMESTAMP NOT NULL,
  [DataModyfikacji] Datetime DEFAULT CURRENT_TIMESTAMP NOT NULL
go
ALTER TABLE [dbo].[Pracownicy] ADD
  [DataUtworzenia] Datetime DEFAULT CURRENT_TIMESTAMP NOT NULL,
  [DataModyfikacji] Datetime DEFAULT CURRENT_TIMESTAMP NOT NULL
go
ALTER TABLE [dbo].[Stadiony] ADD
  [DataUtworzenia] Datetime DEFAULT CURRENT_TIMESTAMP NOT NULL,
  [DataModyfikacji] Datetime DEFAULT CURRENT_TIMESTAMP NOT NULL
go
ALTER TABLE [dbo].[Zawodnicy] ADD
  [DataUtworzenia] Datetime DEFAULT CURRENT_TIMESTAMP NOT NULL,
  [DataModyfikacji] Datetime DEFAULT CURRENT_TIMESTAMP NOT NULL
go


create TRIGGER Adresy_T1 ON Adresy AFTER UPDATE
AS
UPDATE Adresy SET DataModyfikacji = CURRENT_TIMESTAMP
	WHERE IdAdresu IN (SELECT IdAdresu FROM INSERTED)


create TRIGGER Mecze_T1 ON Mecze AFTER UPDATE
AS
UPDATE Mecze SET DataModyfikacji = CURRENT_TIMESTAMP
	WHERE IdMeczu IN (SELECT IdMeczu FROM INSERTED)

create TRIGGER Pracownicy_T1 ON Pracownicy AFTER UPDATE
AS
UPDATE Pracownicy SET DataModyfikacji = CURRENT_TIMESTAMP
	WHERE IdPracownika IN (SELECT IdPracownika FROM INSERTED)

create TRIGGER Stadiony_T1 ON Stadiony AFTER UPDATE
AS
UPDATE Stadiony SET DataModyfikacji = CURRENT_TIMESTAMP
	WHERE IdStadiony IN (SELECT IdStadiony FROM INSERTED)


create TRIGGER Zawodnicy_T1 ON Zawodnicy AFTER UPDATE
AS
UPDATE Zawodnicy SET DataModyfikacji = CURRENT_TIMESTAMP
	WHERE IdZawodnika IN (SELECT IdZawodnika FROM INSERTED)