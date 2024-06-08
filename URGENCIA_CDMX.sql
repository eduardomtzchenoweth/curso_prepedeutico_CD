CREATE DATABASE URGENCIAS_CDMX;

USE URGENCIAS_CDMX;

CREATE TABLE `urgencias` (
  `ID` int NOT NULL,
  `CLUES` char(11) DEFAULT NULL,
  `FECHAALTA` date DEFAULT NULL,
  `EDAD` int DEFAULT NULL,
  `CVEEDAD` char(1) DEFAULT NULL,
  `SEXO` char(1) DEFAULT NULL,
  `ENTRESIDENCIA` char(2) DEFAULT NULL,
  `MUNRESIDENCIA` char(3) DEFAULT NULL,
  `DERHAB` char(2) DEFAULT NULL,
  `TIPOURGENCIA` char(1) DEFAULT NULL,
  `MOTATE` char(1) DEFAULT NULL,
  `TIPOCAMA` char(1) DEFAULT NULL,
  `ENVIADOA` char(1) DEFAULT NULL,
  `MP` char(1) DEFAULT NULL,
  `AFECPRIN` char(4) DEFAULT NULL,
  `IRA` char(1) DEFAULT NULL,
  `PLANEDA` char(1) DEFAULT NULL,
  `SOBRESEDA` int DEFAULT NULL,
  `TIEMPO_ESTANCIA` int DEFAULT NULL,
  `hora_ingreso` char(5) DEFAULT NULL,
  `hora_alta` char(5) DEFAULT NULL,
  `Fecha_Corte` date DEFAULT NULL,
  `MES_ESTADISTICO` int DEFAULT NULL,
  `FECHAINGRESO` date DEFAULT NULL,
  `HORASESTANCIA` char(6) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

ALTER TABLE urgencias DISABLE KEYS;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.4/Uploads/URGENCIAS.txt'
INTO TABLE urgencias
FIELDS TERMINATED BY '|'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(
    ID, 
    CLUES, 
    @fechaalta, 
    EDAD, 
    CVEEDAD, 
    SEXO, 
    ENTRESIDENCIA, 
    MUNRESIDENCIA, 
    DERHAB, 
    TIPOURGENCIA, 
    MOTATE, 
    TIPOCAMA, 
    ENVIADOA, 
    MP, 
    AFECPRIN, 
    IRA, 
    PLANEDA, 
    @sobreseda, 
    @fechaingreso, 
    @horasestancia, 
    MES_ESTADISTICO, 
    hora_ingreso, 
    hora_alta
)
SET 
    FECHAALTA = NULLIF(@fechaalta, 'NULL'),
    SOBRESEDA = NULLIF(@sobreseda, 'NULL'),
    FECHAINGRESO = NULLIF(@fechaingreso, 'NULL'),
    HORASESTANCIA = NULLIF(@horasestancia, 'NULL');

ALTER TABLE urgencias ENABLE KEYS;
