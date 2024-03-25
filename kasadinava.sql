-- create database
CREATE DATABASE IF NOT EXISTS KASA_DINAVA;
USE KASA_DINAVA;

-- Table registro de usuarios
CREATE TABLE IF NOT EXISTS REGISTRAR (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_usuario VARCHAR(50) NOT NULL UNIQUE,
    correo_electronico VARCHAR(50) NOT NULL UNIQUE,
    rectificacion_correo_electronico VARCHAR(50) NOT NULL,
    contrasena VARCHAR(18) NOT NULL
);

-- Table inicio de sesión usuarios
CREATE TABLE IF NOT EXISTS INICIAR_SESION_USUARIO (
    correo_electronico VARCHAR(50) NOT NULL,
    contrasena VARCHAR(18) NOT NULL,
    FOREIGN KEY (correo_electronico) REFERENCES REGISTRAR(correo_electronico)
);

-- Table contactarnos
CREATE TABLE IF NOT EXISTS CONTACTAR (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    telefono VARCHAR(15) NOT NULL,
    solicitud TEXT NOT NULL,
    correo_electronico VARCHAR(50) NOT NULL,
    FOREIGN KEY (correo_electronico) REFERENCES INICIAR_SESION_USUARIO(correo_electronico)
);

-- Table agendamiento
CREATE TABLE IF NOT EXISTS AGENDAR (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    telefono VARCHAR(15) NOT NULL,
    numero_asistentes INT NOT NULL,
    dia_hora DATETIME NOT NULL,
    correo_electronico VARCHAR(50) NOT NULL,
    FOREIGN KEY (correo_electronico) REFERENCES INICIAR_SESION_USUARIO(correo_electronico)
);

-- Table registro trabajador
CREATE TABLE IF NOT EXISTS TRABAJADOR (
    cédula VARCHAR (15) NOT NULL UNIQUE,
    nombre VARCHAR (50) NOT NULL,
    telefono INT (15) NOT NULL
    correo_electronico VARCHAR(50) NOT NULL,
    contrasena VARCHAR(18) NOT NULL,
);

-- Table inicio de sesión trabajadores
CREATE TABLE IF NOT EXISTS INICIAR_SESION_TRABAJADOR (
    correo_electronico VARCHAR(50) NOT NULL,
    contrasena VARCHAR(18) NOT NULL,
    FOREIGN KEY (correo_electronico) REFERENCES TRABAJADOR(correo_electronico)
);