
    CREATE TABLE alumnos (
        matricula VARCHAR(20) PRIMARY KEY,
        nombre VARCHAR(100) NOT NULL
    );

    CREATE TABLE maestros (
        id_maestro SERIAL PRIMARY KEY,
        nombre VARCHAR(100) NOT NULL
    );

    CREATE TABLE grupos (
        periodo VARCHAR(10) NOT NULL,
        seccion VARCHAR(10) NOT NULL,
        nombre_grupo VARCHAR(50) NOT NULL,
        id_maestro INTEGER NOT NULL,
        PRIMARY KEY (periodo, seccion),
        FOREIGN KEY (id_maestro) REFERENCES maestros(id_maestro)
            ON DELETE RESTRICT
            ON UPDATE CASCADE
    );

    CREATE TABLE inscripciones (
        matricula VARCHAR(20) NOT NULL,
        periodo VARCHAR(10) NOT NULL,
        seccion VARCHAR(10) NOT NULL,
        fecha_inscripcion DATE NOT NULL,
        FOREIGN KEY (matricula) REFERENCES alumnos(matricula)
            ON DELETE CASCADE
            ON UPDATE CASCADE,
        FOREIGN KEY (periodo, seccion) REFERENCES grupos(periodo, seccion)
            ON DELETE CASCADE
            ON UPDATE CASCADE,
        PRIMARY KEY (matricula, periodo, seccion)
    );

    CREATE TABLE asistencia (
        matricula VARCHAR(20) NOT NULL,
        periodo VARCHAR(10) NOT NULL,
        seccion VARCHAR(10) NOT NULL,
        fecha_hora TIMESTAMP NOT NULL,
        presente BOOLEAN NOT NULL,
        FOREIGN KEY (matricula) REFERENCES alumnos(matricula)
            ON DELETE CASCADE
            ON UPDATE CASCADE,
        FOREIGN KEY (periodo, seccion) REFERENCES grupos(periodo, seccion)
            ON DELETE CASCADE
            ON UPDATE CASCADE,
        PRIMARY KEY (matricula, periodo, seccion, fecha_hora)
    );
    
