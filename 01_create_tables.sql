-- Tabla de Profesores
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
    ON DELETE RESTRICT 
    ON UPDATE CASCADE

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
