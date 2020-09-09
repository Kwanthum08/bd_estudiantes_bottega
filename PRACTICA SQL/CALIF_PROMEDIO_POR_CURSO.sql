    SELECT CUR.NOMBRE_CURSO AS CURSO, AVG(CAL.CALIFICACION) AS CALIFICACION_PROMEDIO 
      FROM SYSTEM.CALIFICACIONES CAL
INNER JOIN SYSTEM.CURSOS CUR
        ON CAL.CLAVE_CURSO = CUR.CLAVE_CURSO
       AND CAL.ID_PROFESOR = CAL.ID_PROFESOR
  GROUP BY CUR.NOMBRE_CURSO
  ORDER BY CALIFICACION_PROMEDIO ASC;
  
/*
CURSO       CALIFICACION_PROMEDIO
------------------------------------
GEOGRAFIA	  55
HISTORIA	  63.1875
LECTURA	      71.375
FISICA	      73.5
MATEMATICAS	  75.7857143
BIOLOGIA	  76.5
INFORMATICA	  84
*/