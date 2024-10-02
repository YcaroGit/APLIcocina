DROP DATABASE  if exists COCINA;

CREATE DATABASE COCINA;

USE COCINA;

CREATE TABLE Recetas (
    id_receta INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(255) NOT NULL,
    descripcion TEXT,
    tiempo_preparacion INT, -- en minutos
    tiempo_coccion INT, -- en minutos
    porciones INT,
    metodo_coccion ENUM('Freidora de Aire', 'Horno', 'Olla Exprés') NOT NULL);

CREATE TABLE Ingredientes (
    id_ingrediente INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(255) NOT NULL,
    cantidad VARCHAR(50) NOT NULL, -- Ejemplo: "2 tazas", "300 g"
    id_receta INT,
    FOREIGN KEY (id_receta) REFERENCES Recetas(id_receta) ON DELETE CASCADE
);
CREATE TABLE Instrucciones (
    id_instruccion INT PRIMARY KEY AUTO_INCREMENT,
    id_receta INT,
    paso INT NOT NULL, -- Orden de los pasos
    descripcion TEXT NOT NULL,
    FOREIGN KEY (id_receta) REFERENCES Recetas(id_receta) ON DELETE CASCADE
);

INSERT INTO Recetas (nombre, descripcion, tiempo_preparacion, tiempo_coccion, porciones, metodo_coccion) 
VALUES ('Pollo a la Freidora de Aire', 'Receta fácil de pollo crujiente.', 10, 20, 4, 'Freidora de Aire');

INSERT INTO Recetas (nombre, descripcion, tiempo_preparacion, tiempo_coccion, porciones, metodo_coccion) 
VALUES ('Guiso de Lentejas en Olla Exprés', 'Delicioso guiso de lentejas.', 15, 30, 6, 'Olla Exprés');

INSERT INTO Ingredientes (nombre, cantidad, id_receta) 
VALUES ('Pollo', '1 kg', 1);

INSERT INTO Ingredientes (nombre, cantidad, id_receta) 
VALUES ('Lentejas', '250 g', 2);

INSERT INTO Instrucciones (id_receta, paso, descripcion) 
VALUES (1, 1, 'Sazona el pollo con tus especias favoritas.');

INSERT INTO Instrucciones (id_receta, paso, descripcion) 
VALUES (1, 2, 'Coloca el pollo en la freidora de aire y cocina a 200°C por 20 minutos.');

INSERT INTO Instrucciones (id_receta, paso, descripcion) 
VALUES (2, 1, 'Lava las lentejas y ponlas en la olla exprés.');

INSERT INTO Instrucciones (id_receta, paso, descripcion) 
VALUES (2, 2, 'Agrega agua y cocina a presión durante 30 minutos.');