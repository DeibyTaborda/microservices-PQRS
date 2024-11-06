CREATE DATABASE microservices_PQRS;

USE microservices_PQRS;

CREATE TABLE rol(
    id_rol INT AUTO_INCREMENT PRIMARY KEY,
    rol VARCHAR(20) NOT NULL,
    date_register_rol TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status_rol ENUM('ACTIVO', 'INACTIVO') DEFAULT 'ACTIVO'
);

CREATE TABLE usuario(
    id_user INT AUTO_INCREMENT PRIMARY KEY,
    name_user VARCHAR(60) NOT NULL,
    lastname_user VARCHAR(60) NOT NULL,
    email_user VARCHAR(60) NOT NULL,
    phone_number_user VARCHAR(10) NULL,
    rol_user INT NOT NULL,
    date_register_user TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status_user ENUM('ACTIVO', 'INACTIVO') DEFAULT 'ACTIVO',
    FOREIGN KEY (rol_user) REFERENCES rol(id_rol)
);

CREATE TABLE pqrs(
    id_pqrs INT AUTO_INCREMENT PRIMARY KEY,
    id_user INT NOT NULL,
    type_pqrs ENUM('PETICIÓN', 'QUEJA', 'RECLAMO', 'SUGERENCIA'),
    descripcion_pqrs TEXT NOT NULL,
    data_register_pqrs TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status_pqrs ENUM('PENDIENTE', 'EN PROCESO', 'FINALIZADO') DEFAULT 'PENDIENTE',
    FOREIGN KEY (id_user) REFERENCES usuario(id_user)
);