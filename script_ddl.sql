-- ==============================================================
-- Script DDL: Creación de Base de Datos y Esquema Relacional
-- Gestor: MySQL 8.0 (InnoDB)
-- Base de Datos: empresa_db
-- ==============================================================

-- 1. Creación y selección de la base de datos
CREATE DATABASE IF NOT EXISTS empresa_db
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_0900_ai_ci;

USE empresa_db;

-- 2. Eliminación preventiva de tablas (respetando orden de dependencia)
DROP TABLE IF EXISTS Empleado;
DROP TABLE IF EXISTS Departamento;

-- 3. Creación de la tabla independiente (Padre): Departamento
CREATE TABLE Departamento (
  DeptID      INT          NOT NULL AUTO_INCREMENT,
  NombreDepto VARCHAR(100) NOT NULL,
  Ubicacion   VARCHAR(150) NOT NULL,
  PRIMARY KEY (DeptID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 4. Creación de la tabla dependiente (Hija): Empleado
CREATE TABLE Empleado (
  EmpID    INT           NOT NULL AUTO_INCREMENT,
  Nombre   VARCHAR(60)   NOT NULL,
  Apellido VARCHAR(60)   NOT NULL,
  Edad     INT           NOT NULL,
  Salario  DECIMAL(10,2) NOT NULL,
  DeptID   INT           NOT NULL,
  PRIMARY KEY (EmpID),
  INDEX idx_empleado_departamento (DeptID),
  CONSTRAINT fk_empleado_departamento
    FOREIGN KEY (DeptID)
    REFERENCES Departamento (DeptID)
    ON UPDATE CASCADE
    ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
