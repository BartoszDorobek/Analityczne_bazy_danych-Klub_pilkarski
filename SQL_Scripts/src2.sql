use [ABD_GR04_SRC2]

ALTER TABLE [dbo].[PodmiotyWykonujace] ADD
  [DataModyfikacji] Datetime DEFAULT CURRENT_TIMESTAMP NOT NULL,
  [DataUtworzenia] Datetime DEFAULT CURRENT_TIMESTAMP NOT NULL
go
ALTER TABLE [dbo].[Testy] ADD
  [DataUtworzenia] Datetime DEFAULT CURRENT_TIMESTAMP NOT NULL,
  [DataModyfikacji] Datetime DEFAULT CURRENT_TIMESTAMP NOT NULL
go
ALTER TABLE [dbo].[Zawodnicy] ADD
  [DataUtworzenia] Datetime DEFAULT CURRENT_TIMESTAMP NOT NULL,
  [DataModyfikacji] Datetime DEFAULT CURRENT_TIMESTAMP NOT NULL
go

create TRIGGER PodmiotyWykonujace_T1 ON PodmiotyWykonujace AFTER UPDATE
AS
UPDATE PodmiotyWykonujace SET DataModyfikacji = CURRENT_TIMESTAMP
	WHERE IdPodmiotu IN (SELECT IdPodmiotu FROM INSERTED)

create TRIGGER Testy_T1 ON Testy AFTER UPDATE
AS
UPDATE Testy SET DataModyfikacji = CURRENT_TIMESTAMP
	WHERE IdTestu IN (SELECT IdTestu FROM INSERTED)

create TRIGGER Zawodnicy_T1 ON Zawodnicy AFTER UPDATE
AS
UPDATE Zawodnicy SET DataModyfikacji = CURRENT_TIMESTAMP
	WHERE IdZawodnika IN (SELECT IdZawodnika FROM INSERTED)