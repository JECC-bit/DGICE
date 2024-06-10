CREATE DATABASE IF NOT EXISTS Dgice;

USE Dgice;

CREATE TABLE Nombre (
Id_nombre INT PRIMARY KEY not null,
Nombres VARCHAR(30) not null,
Apellido_paterno VARCHAR(30) not null,
Apellido_materno VARCHAR(30) null
);

CREATE TABLE Usuario( 
Id_usuario INT PRIMARY KEY not null,
Id_nombre_completo INT not null,
Campus VARCHAR(30) null,
Facultad VARCHAR(30) null,
Carrera VARCHAR (30) null,
Semestre INT null,
CONSTRAINT fk_Nombre FOREIGN KEY (Id_nombre_completo) REFERENCES Nombre (Id_nombre)
);

CREATE TABLE Cuenta(
Id_cuenta INT PRIMARY KEY not null IDENTITY(1,1),
Id_usuario INT not null,
No_cuenta INT not null,
Contrasena VARCHAR (20) not null,
Correo VARCHAR (30) UNIQUE not null,
Rol INT not null,
Created_at TIMESTAMP not null DEFAULT CURRENT_TIMESTAMP,
CONSTRAINT fk_Usuario FOREIGN KEY (Id_usuario) REFERENCES Usuario (Id_usuario)
);

CREATE TABLE Bootcamp (
Id_bootcamp INT PRIMARY KEY not null IDENTITY(1,1),
Nombre_bootcamp VARCHAR (30) not null,
Fecha_inicio DATE not null,
Fecha_cierre DATE not null,
Descripcion VARCHAR (255) not null,
Estado BIT not null,
Created_at TIMESTAMP not null DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Reto (
Id_reto INT PRIMARY KEY not null IDENTITY (1,1),
Reto VARCHAR (30) not null,
Descripcion VARCHAR (255) not null
);

CREATE TABLE Equipo (
Id_equipo INT PRIMARY KEY not null IDENTITY (1,1),
No_equipo INT not null,
Id_Cuenta INT not null,
Created_at TIMESTAMP not null DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Bootcamp_reto(
Id_reto INT not null,
Id_bootcamp INT not null,
Id_equipo INT not null,
CONSTRAINT fk_Reto FOREIGN KEY (Id_reto) REFERENCES Reto (Id_reto),
CONSTRAINT fk_Bootcamp FOREIGN KEY (Id_bootcamp) REFERENCES Bootcamp (Id_bootcamp),
CONSTRAINT fk_Equipo FOREIGN KEY (Id_equipo) REFERENCES Equipo (Id_equio)
);

CREATE TABLE Encargado_bootcamp (
Id_bootcamp INT not null, 
Id_cuenta INT not null,
Created_at TIMESTAMP not null DEFAULT CURRENT_TIMESTAMP,
CONSTRAINT fk_Bootcamp FOREIGN KEY (Id_bootcamp) REFERENCES Bootcamp (Id_bootcamp),
CONSTRAINT fk_Cuenta FOREIGN KEY (Id_cuenta) REFERENCES Cuenta (Id_cuenta)
);

CREATE TABLE Actividad (
Id_actividad INT PRIMARY KEY not null, IDENTITY (1,1),
Titulo VARCHAR (30) not null,
Descripcion VARCHAR (250) not null,
Instrucciones VARCHAR (255) not null,
Fecha_publicacion TIMESTAMP not null, 
Fecha_entrega TIMESTAMP not null,
Estatus INT not null,
Crated_at TIMESTAMP not null DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Bootcamp_actividad(
Id_bootcamp INT not null,
Id_actividad INT not null,
CONSTRAINT fk_Bootcamp FOREIGN KEY (Id_bootcamp) REFERENCES Bootcamp (Id_bootcamp),
CONSTRAINT fk_Actividad FOREIGN KEY (Id_actividad) REFERENCES Actividad (Id_actividad)
);

CREATE TABLE Entrega_Actividad (
Id_actividad INT not null,
Id_equipo INT not null,
Estatus BIT not null,
CONSTRAINT fk_Actividad FOREIGN KEY (Id_actividad) REFERENCES Actividad (Id_actividad),
CONSTRAINT fk_Equipo FOREIGN KEY (Id_equipo) REFERENCES Equipo (Id_equipo)
);

CREATE TABLE Mensaje (
Id_mensaje INT PRIMARY KEY not null IDENTITY (1,1),
Id_Cuenta INT not null,
Duda VARCHAR (255) not null,
Created_at TIMESTAMP not null DEFAULT CURRENT_TIMESTAMP,
CONSTRAINT fk_Cuenta FOREIGN KEY (Id_cuenta) REFERENCES Cuenta (Id_cuenta)
);

CREATE TABLE Mensaje_actividad (
Id_mensaje INT not null, 
Id_actividad INT not null,
CONSTRAINT fk_Mensaje FOREIGN KEY (Id_mensaje) REFERENCES Mensaje (Id_mensaje),
CONSTRAINT fk_Actividad FOREIGN KEY (Id_actividad) REFERENCES Actividad (actividad)
);

