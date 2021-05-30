CREATE DATABASE  IF NOT EXISTS `susalud` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_bin */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `susalud`;
-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: susalud
-- ------------------------------------------------------
-- Server version	8.0.22

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `autoevaluaciones`
--

DROP TABLE IF EXISTS `autoevaluaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `autoevaluaciones` (
  `idAutoev` int NOT NULL AUTO_INCREMENT,
  `año` year DEFAULT NULL,
  `etapaAño` date DEFAULT NULL,
  `avance` varchar(80) COLLATE utf8_bin DEFAULT NULL,
  `estado` varchar(80) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`idAutoev`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fuentes_referenciales`
--

DROP TABLE IF EXISTS `fuentes_referenciales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fuentes_referenciales` (
  `idFuente` int NOT NULL AUTO_INCREMENT,
  `codigo` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `descripcion` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `estado` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`idFuente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `macroprocesos`
--

DROP TABLE IF EXISTS `macroprocesos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `macroprocesos` (
  `idMacro` int NOT NULL AUTO_INCREMENT,
  `codigo` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `descripcion` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `grupo` varchar(80) COLLATE utf8_bin DEFAULT NULL,
  `estado` varchar(80) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`idMacro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `parametros`
--

DROP TABLE IF EXISTS `parametros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `parametros` (
  `idParametro` int NOT NULL AUTO_INCREMENT,
  `periodo` date DEFAULT NULL,
  `evaluacionesAño` varchar(80) COLLATE utf8_bin DEFAULT NULL,
  `puntuacion` varchar(80) COLLATE utf8_bin DEFAULT NULL,
  `rango_valoracion` varchar(80) COLLATE utf8_bin DEFAULT NULL,
  `tipo_sistema` varchar(80) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`idParametro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `personas`
--

DROP TABLE IF EXISTS `personas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personas` (
  `idPersona` int NOT NULL AUTO_INCREMENT,
  `primerNombre` varchar(80) COLLATE utf8_bin DEFAULT NULL,
  `segundoNombre` varchar(80) COLLATE utf8_bin DEFAULT NULL,
  `primerApellido` varchar(80) COLLATE utf8_bin DEFAULT NULL,
  `segundoApellido` varchar(80) COLLATE utf8_bin DEFAULT NULL,
  `perfil` varchar(80) COLLATE utf8_bin DEFAULT NULL,
  `categoria` varchar(80) COLLATE utf8_bin DEFAULT NULL,
  `codigo` varchar(80) COLLATE utf8_bin DEFAULT NULL,
  `descripcion` varchar(80) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`idPersona`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `procesos`
--

DROP TABLE IF EXISTS `procesos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `procesos` (
  `idProceso` int NOT NULL AUTO_INCREMENT,
  `idMacro` int NOT NULL,
  `codigo` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `descripcion` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `estado` varchar(80) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`idProceso`,`idMacro`),
  KEY `FkidMacro_idx` (`idMacro`),
  CONSTRAINT `FkidMacro` FOREIGN KEY (`idMacro`) REFERENCES `macroprocesos` (`idMacro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `registros_autoevaluaciones`
--

DROP TABLE IF EXISTS `registros_autoevaluaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registros_autoevaluaciones` (
  `idAutoev` int NOT NULL AUTO_INCREMENT,
  `idUsuario` int NOT NULL,
  `idParametro` int NOT NULL,
  `idVerificador` int NOT NULL,
  `idSub` int NOT NULL,
  `idTecnica` int NOT NULL,
  `idFuente` int NOT NULL,
  `observacion` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`idAutoev`,`idUsuario`,`idParametro`,`idVerificador`,`idSub`,`idTecnica`,`idFuente`),
  KEY `Fk-idUsuarioo_idx` (`idUsuario`),
  KEY `Fk-idparaam_idx` (`idParametro`),
  KEY `Fk-verificadooor_idx` (`idVerificador`),
  KEY `Fk-subproceso_idx` (`idSub`),
  KEY `Fk-tecnicas_idx` (`idTecnica`),
  KEY `Fk-idfuentee_idx` (`idFuente`),
  CONSTRAINT `Fk-idautoev` FOREIGN KEY (`idAutoev`) REFERENCES `autoevaluaciones` (`idAutoev`),
  CONSTRAINT `Fk-idfuentee` FOREIGN KEY (`idFuente`) REFERENCES `fuentes_referenciales` (`idFuente`),
  CONSTRAINT `Fk-idparaam` FOREIGN KEY (`idParametro`) REFERENCES `parametros` (`idParametro`),
  CONSTRAINT `Fk-idUsuarioo` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`idUsuario`),
  CONSTRAINT `Fk-subproceso` FOREIGN KEY (`idSub`) REFERENCES `subprocesos` (`idSub`),
  CONSTRAINT `Fk-tecnicas` FOREIGN KEY (`idTecnica`) REFERENCES `tecnicas_evaluativas` (`idTecnica`),
  CONSTRAINT `Fk-verificadooor` FOREIGN KEY (`idVerificador`) REFERENCES `verificadores` (`idVerificador`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `registros_superviciones`
--

DROP TABLE IF EXISTS `registros_superviciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registros_superviciones` (
  `idSuperv` int NOT NULL,
  `idUsuario` int NOT NULL,
  `idParametro` int NOT NULL,
  `idVerificador` int NOT NULL,
  `idSub` int NOT NULL,
  `idTecnica` int NOT NULL,
  `idFuente` int NOT NULL,
  `observacion` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`idSuperv`,`idUsuario`,`idParametro`,`idVerificador`,`idSub`,`idTecnica`,`idFuente`),
  KEY `Fk-idUser_idx` (`idUsuario`),
  KEY `Fk-idparam_idx` (`idParametro`),
  KEY `Fk-verificad_idx` (`idVerificador`),
  KEY `Fk-idsubb_idx` (`idSub`),
  KEY `Fk-tecnica_idx` (`idTecnica`),
  KEY `Fk-fuentes_idx` (`idFuente`),
  CONSTRAINT `Fk-fuentes` FOREIGN KEY (`idFuente`) REFERENCES `fuentes_referenciales` (`idFuente`),
  CONSTRAINT `Fk-idparam` FOREIGN KEY (`idParametro`) REFERENCES `parametros` (`idParametro`),
  CONSTRAINT `Fk-idsubb` FOREIGN KEY (`idSub`) REFERENCES `subprocesos` (`idSub`),
  CONSTRAINT `Fk-idSuperv` FOREIGN KEY (`idSuperv`) REFERENCES `superviciones` (`idSuperv`),
  CONSTRAINT `Fk-idUser` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`idUsuario`),
  CONSTRAINT `Fk-tecnica` FOREIGN KEY (`idTecnica`) REFERENCES `tecnicas_evaluativas` (`idTecnica`),
  CONSTRAINT `Fk-verificad` FOREIGN KEY (`idVerificador`) REFERENCES `verificadores` (`idVerificador`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `idRol` int NOT NULL AUTO_INCREMENT,
  `nombreRol` varchar(80) COLLATE utf8_bin DEFAULT NULL,
  `acceso` varchar(80) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`idRol`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `roles_usuarios`
--

DROP TABLE IF EXISTS `roles_usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles_usuarios` (
  `idUsuario` int NOT NULL,
  `idRol` int NOT NULL,
  `origen` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`idUsuario`,`idRol`),
  KEY `Fk_idRol_idx` (`idRol`),
  CONSTRAINT `Fk_idRol` FOREIGN KEY (`idRol`) REFERENCES `roles` (`idRol`),
  CONSTRAINT `Fk_idUsuario` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`idUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `subprocesos`
--

DROP TABLE IF EXISTS `subprocesos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subprocesos` (
  `idSub` int NOT NULL AUTO_INCREMENT,
  `idProceso` int NOT NULL,
  `idMacro` int NOT NULL,
  `codigo` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `descripcion` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `estado` varchar(80) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`idSub`,`idProceso`,`idMacro`),
  KEY `FkidProceso_idx` (`idProceso`),
  KEY `Fkid_macro_idx` (`idMacro`),
  CONSTRAINT `Fkid_macro` FOREIGN KEY (`idMacro`) REFERENCES `macroprocesos` (`idMacro`),
  CONSTRAINT `FkidProceso` FOREIGN KEY (`idProceso`) REFERENCES `procesos` (`idProceso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `superviciones`
--

DROP TABLE IF EXISTS `superviciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `superviciones` (
  `idSuperv` int NOT NULL AUTO_INCREMENT,
  `año` year DEFAULT NULL,
  `periodo` date DEFAULT NULL,
  `entidad` varchar(80) COLLATE utf8_bin DEFAULT NULL,
  `tipo_entidad` varchar(80) COLLATE utf8_bin DEFAULT NULL,
  `autodeclaracion` varchar(80) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`idSuperv`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tecnicas_evaluativas`
--

DROP TABLE IF EXISTS `tecnicas_evaluativas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tecnicas_evaluativas` (
  `idTecnica` int NOT NULL AUTO_INCREMENT,
  `codigo` varchar(80) COLLATE utf8_bin DEFAULT NULL,
  `descripcion` varchar(80) COLLATE utf8_bin DEFAULT NULL,
  `estado` varchar(80) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`idTecnica`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `idUsuario` int NOT NULL AUTO_INCREMENT,
  `nombreUs` varchar(80) COLLATE utf8_bin NOT NULL,
  `contraseña` varchar(255) COLLATE utf8_bin NOT NULL,
  `email` varchar(100) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`idUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usuarios_personas`
--

DROP TABLE IF EXISTS `usuarios_personas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios_personas` (
  `idPersona` int NOT NULL,
  `idUsuario` int NOT NULL,
  PRIMARY KEY (`idPersona`,`idUsuario`),
  KEY `FkidUsuario_idx` (`idUsuario`),
  CONSTRAINT `FkidPersonas` FOREIGN KEY (`idPersona`) REFERENCES `personas` (`idPersona`),
  CONSTRAINT `FkidUsuario` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`idUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `verificadores`
--

DROP TABLE IF EXISTS `verificadores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `verificadores` (
  `idVerificador` int NOT NULL AUTO_INCREMENT,
  `idMacro` int NOT NULL,
  `idProceso` int NOT NULL,
  `idSub` int NOT NULL,
  `codigo` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `descripcion` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `estado` varchar(80) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`idVerificador`,`idMacro`,`idProceso`,`idSub`),
  KEY `Fk-idmacro_idx` (`idMacro`),
  KEY `Fk-idproceso_idx` (`idProceso`),
  KEY `Fk-idsub_idx` (`idSub`),
  CONSTRAINT `Fk-idmacro` FOREIGN KEY (`idMacro`) REFERENCES `macroprocesos` (`idMacro`),
  CONSTRAINT `Fk-idproceso` FOREIGN KEY (`idProceso`) REFERENCES `procesos` (`idProceso`),
  CONSTRAINT `Fk-idsub` FOREIGN KEY (`idSub`) REFERENCES `subprocesos` (`idSub`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping events for database 'susalud'
--

--
-- Dumping routines for database 'susalud'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-27 20:29:56
