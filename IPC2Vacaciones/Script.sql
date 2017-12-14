CREATE DATABASE WARLOCK_SOFT;

USE WARLOCK_SOFT;

CREATE TABLE Usuario
(
	ID_Usuario INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	Nombre nvarchar(50) NOT NULL,
	Apellido nvarchar(50) NOT NULL,
	Correo nvarchar(100) UNIQUE NOT NULL,
	Fecha_de_Nacimiento date NOT NULL,
	Nombre_de_Usuario nvarchar(50) UNIQUE NOT NULL,
	Contraseña nvarchar(50) NOT NULL,
	Rol nvarchar(50) NOT NULL
);

CREATE TABLE Contacto
(
	ID_Contacto INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	ID_Usuario INT FOREIGN KEY REFERENCES Usuario(ID_Usuario),
	
);


CREATE TABLE Mensaje_Directo
(
	ID_Mensaje INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	Mensaje nvarchar(1000) NOT NULL,
	ID_Contacto INT FOREIGN KEY REFERENCES Contacto(ID_Contacto) ,
	ID_Usuario INT FOREIGN KEY REFERENCES Usuario(ID_Usuario) ,
	
);

CREATE TABLE Asociacion
(
	ID_Asociacion INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	Nombre nvarchar(100) NOT NULL,
	Resumen nvarchar(1000) NOT NULL,
	Logo image,
	ID_Usuario_Creador INT FOREIGN KEY REFERENCES Usuario(ID_Usuario)
);

CREATE TABLE Detalle_Asociacion
(
	ID_Detalle_Asociacion INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	ID_Asociacion INT FOREIGN KEY REFERENCES Asociacion(ID_Asociacion),
	ID_Usuario INT FOREIGN KEY REFERENCES Usuario(ID_Usuario) 
);

CREATE TABLE Habilidad
(
	ID_Habilidad INT IDENTITY (1,1) PRIMARY KEY NOT NULL,
	Nombre_Habilidad nvarchar(100) NOT NULL,
);

CREATE TABLE Conocimiento
(
	ID_Conocimiento INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	Nombre_Conocimiento nvarchar(100) NOT NULL,
	ID_Habilidad INT FOREIGN KEY REFERENCES Habilidad(ID_Habilidad)
);

CREATE TABLE Detalle_Habilidad
(
	ID_Detalle_Habilidad INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	ID_Usuario INT FOREIGN KEY REFERENCES Usuario(ID_Usuario) ,
	ID_Conocimiento INT FOREIGN KEY REFERENCES Conocimiento(ID_Conocimiento)
);

CREATE TABLE Karma
(
	ID_Karma INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	ID_Usuario INT FOREIGN KEY REFERENCES Usuario(ID_Usuario),
	ID_Conocimiento INT FOREIGN KEY REFERENCES Conocimiento(ID_Conocimiento) ,
	Puntuacion INT NOT NULL
);