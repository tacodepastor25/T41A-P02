
    CREATE TABLE profesores (
    id_profesor INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL
);

-- Tabla de Grupos
CREATE TABLE grupos (
    id_grupo INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    materia VARCHAR(100) NOT NULL,
    horario VARCHAR(50),
    id_profesor INT NOT NULL,
    FOREIGN KEY (id_profesor) REFERENCES profesores(id_profesor)

);

-- Tabla de Alumnos
CREATE TABLE alumnos (
    id_alumno INT PRIMARY KEY AUTO_INCREMENT,
    matricula VARCHAR(20) UNIQUE NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    carrera VARCHAR(100) NOT NULL
);

-- Tabla de Inscripciones (Relación Alumnos-Grupos)
CREATE TABLE inscripciones (
    id_inscripcion INT PRIMARY KEY AUTO_INCREMENT,
    id_alumno INT NOT NULL,
    id_grupo INT NOT NULL,
    fecha_inscripcion TIMESTAMP NOT NULL,
    FOREIGN KEY (id_alumno) REFERENCES alumnos(id_alumno),
    FOREIGN KEY (id_grupo) REFERENCES grupos(id_grupo)
);

-- Tabla de Asistencias
CREATE TABLE asistencias (
    id_asistencia INT PRIMARY KEY AUTO_INCREMENT,
    id_inscripcion INT NOT NULL,
    fecha_hora DATEtime NOT NULL,
    FOREIGN KEY (id_inscripcion) REFERENCES inscripciones(id_inscripcion)
);


-- Insertar alumnos 
INSERT INTO alumnos (matricula, nombre, carrera) VALUES
('A001', 'Ana Torres', 'ITI'),
('A002', 'Luis Gómez', 'ITEM'),
('A003', 'María López', 'ITMA'),
('A004', 'Carlos Ruiz', 'ISTI'),
('A005', 'Laura Méndez', 'ITI'),
('A006', 'Pedro Sánchez', 'ITEM'),
('A007', 'Sofía Díaz', 'ITMA'),
('A008', 'Jorge Ramirez', 'ITMA'), 
('A009', 'Elena Castro', 'ISTI'),
('A010', 'Tomás Ortega', 'LAG');

-- Insertar profesores 
INSERT INTO profesores(nombre) VALUES
('Mtro. Juan Pérez'),
('Mtra. Carmen Silva'),
('Mtro. Diego Luna'),
('Mtra. Rosa Márquez'),
('Mtro. Andrés Bello'),
('Mtra. Julia Ríos'),
('Mtro. Sergio Peña'),
('Mtra. Alicia Torres'),
('Mtro. Iván Cordero'),
('Mtra. Teresa León');

-- Insertar grupos 
INSERT INTO grupos (nombre, materia, horario, id_profesor) VALUES
('T41A', 'Bases de Datos I', '20253S', 1),
('T41B', 'Bases de Datos I', '20253S', 2),
('T42A', 'Bases de Datos II', '20253S', 3),
('T42B', 'Bases de Datos II', '20253S', 4),
('T43A', 'Diseño de BD', '20253S', 5),
('T43B', 'Diseño de BD', '20253S', 6),
('T44A', 'SQL Avanzado', '20253S', 7),
('T44B', 'SQL Avanzado', '20253S', 8),
('T45A', 'PostgreSQL', '20253S', 9),
('T45B', 'PostgreSQL', '20253S', 10);

-- Inscripciones 
INSERT INTO inscripciones (id_alumno, id_grupo, fecha_inscripcion) VALUES
(1, 1, '2025-08-01'),  -- A001 en T41A
(2, 1, '2025-08-01'),  -- A002 en T41A
(3, 2, '2025-08-01'),  -- A003 en T41B
(4, 2, '2025-08-01'),  -- A004 en T41B
(5, 3, '2025-08-01'),  -- A005 en T42A
(6, 3, '2025-08-01'),  -- A006 en T42A
(7, 4, '2025-08-01'),  -- A007 en T42B
(8, 4, '2025-08-01'),  -- A008 en T42B
(9, 5, '2025-08-01'),  -- A009 en T43A
(10, 5, '2025-08-01'); -- A010 en T43A

-- Asistencias 
INSERT INTO asistencias (id_inscripcion, fecha_hora) VALUES
(1, '2025-09-01 08:00:00'),  -- A001 presente
-- A002 ausente (no se registra)
(3, '2025-09-01 10:00:00'),  -- A003 presente
-- A004 ausente (no se registra)
(5, '2025-09-01 12:00:00'),  -- A005 presente
-- A006 ausente (no se registra)
(7, '2025-09-01 14:00:00'),  -- A007 presente
-- A008 ausente (no se registra)
(9, '2025-09-01 16:00:00');  -- A009 presente
-- A010 ausente (no se registra)
