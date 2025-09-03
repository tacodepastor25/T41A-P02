    SELECT g.periodo, g.seccion, g.nombre_grupo,
           COUNT(*) FILTER (WHERE a.presente = FALSE) AS total_faltas
    FROM asistencia a
    JOIN grupos g ON a.periodo = g.periodo AND a.seccion = g.seccion
    GROUP BY g.periodo, g.seccion, g.nombre_grupo
    ORDER BY g.seccion;
