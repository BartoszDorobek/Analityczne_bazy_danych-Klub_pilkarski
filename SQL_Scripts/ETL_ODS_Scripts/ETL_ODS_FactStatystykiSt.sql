/*
FactStatystykiSt; dbo.WynikiZawodnika & dbo.Mecze
*/
USE [ABD_GR04_SRC1]
GO
SELECT [IdWyniku] 
      ,[StrzeloneBramki] 
      ,[OcenaWystepu] 
      ,[CzasGry] 
      ,[CzyWyjsciowySklad] 
      ,[Kartki] 
      ,[IdZawodnika] 
	  ,m.[IdMeczu]
      ,[BramkiStrzelone] 
      ,[BramkiStracone] 
FROM WynikiZawodnika w inner join Mecze m on m.IdMeczu = w.IdMeczu
	where m.[DataModyfikacji] >= dateadd(day,-1,cast(CURRENT_TIMESTAMP as date))
union 
SELECT [IdWyniku]
      ,[StrzeloneBramki] 
      ,[OcenaWystepu] 
      ,[CzasGry] 
      ,[CzyWyjsciowySklad] 
      ,[Kartki] 
      ,[IdZawodnika] 
	  ,m.[IdMeczu]
      ,[BramkiStrzelone] 
      ,[BramkiStracone] 
FROM WynikiZawodnika w inner join dbo.Mecze m on m.IdMeczu = w.IdMeczu
	where w.[DataModyfikacji] >= dateadd(day,-1,cast(CURRENT_TIMESTAMP as date))
GO