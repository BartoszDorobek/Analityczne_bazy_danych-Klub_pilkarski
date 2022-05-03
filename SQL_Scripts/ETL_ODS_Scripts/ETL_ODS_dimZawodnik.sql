/*
DimZawodnik; dbo.Zawodnicy & dbo.Pracownicy
*/
use ABD_GR04_SRC1
Select 
	  [IdZawodnika],
      [Imie],
      [Nazwisko],
      [NumerKoszulki],
      [Waga],
      [Wzrost],
      [Pozycja]
from Zawodnicy z inner join Pracownicy p on p.IdPracownika = z.IdPracownika
	where z.[DataModyfikacji] >= dateadd(day,-1,cast(CURRENT_TIMESTAMP as date))
union 
Select 
	  [IdZawodnika],
      [Imie],
      [Nazwisko],
      [NumerKoszulki],
      [Waga],
      [Wzrost],
      [Pozycja]
from Zawodnicy z inner join Pracownicy p on p.IdPracownika = z.IdPracownika
	where p.[DataModyfikacji] >= dateadd(day,-1,cast(CURRENT_TIMESTAMP as date))