use ABD_GR04_SRC2
Select 
	  [IdZawodnika],
	  [Narodowosc]
from Zawodnicy
	where [DataModyfikacji] >= dateadd(day,-1,cast(CURRENT_TIMESTAMP as date))