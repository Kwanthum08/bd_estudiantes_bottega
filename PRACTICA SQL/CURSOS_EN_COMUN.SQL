SELECT  CONSULTA1.ESTUDIANTE, CONSULTA1.PROFESOR 
  FROM (          SELECT EST.NOMBRE_ESTUDIANTE AS ESTUDIANTE, PRO.NOMBRE_PROFESOR AS PROFESOR, COUNT(PRO.NOMBRE_PROFESOR) AS CONTEO
                    FROM SYSTEM.ESTUDIANTES  EST
              INNER JOIN SYSTEM.CALIFICACIONES CAL
                      ON EST.ID_ESTUDIANTE = CAL.ID_ESTUDIANTE
              INNER JOIN SYSTEM.CURSOS CUR
                      ON CAL.CLAVE_CURSO = CUR.CLAVE_CURSO
                     AND CAL.ID_PROFESOR = CUR.ID_PROFESOR
              INNER JOIN SYSTEM.PROFESORES PRO
                      ON CUR.ID_PROFESOR = PRO.ID_PROFESOR
                GROUP BY EST.NOMBRE_ESTUDIANTE, PRO.NOMBRE_PROFESOR
               
        ) CONSULTA1
  WHERE CONSULTA1.CONTEO IN ( SELECT MAX(CONSULTA2.CONTEO)
                                FROM (      SELECT COUNT(PRO.NOMBRE_PROFESOR) AS CONTEO
                                              FROM SYSTEM.ESTUDIANTES  EST
                                        INNER JOIN SYSTEM.CALIFICACIONES CAL
                                                ON EST.ID_ESTUDIANTE = CAL.ID_ESTUDIANTE
                                        INNER JOIN SYSTEM.CURSOS CUR
                                                ON CAL.CLAVE_CURSO = CUR.CLAVE_CURSO
                                                AND CAL.ID_PROFESOR = CUR.ID_PROFESOR
                                         INNER JOIN SYSTEM.PROFESORES PRO
                                                 ON CUR.ID_PROFESOR = PRO.ID_PROFESOR
                                           GROUP BY EST.NOMBRE_ESTUDIANTE, PRO.NOMBRE_PROFESOR
                                       )CONSULTA2 
                              )

/*
ESTUDIANTE              PROFESOR
----------------------------------
JESUS HERNANDEZ	     DAMIAN ESTRADA
*/