SELECT 
    g.nombre AS nombre_grupo,
    g.materia,
    g.horario,
    COUNT(a.id_asistencia) AS total_asistencias
FROM grupos g
LEFT JOIN inscripciones i ON g.id_grupo = i.id_grupo
LEFT JOIN asistencias a ON i.id_inscripcion = a.id_inscripcion
GROUP BY g.id_grupo, g.nombre, g.materia, g.horario
ORDER BY g.nombre;
