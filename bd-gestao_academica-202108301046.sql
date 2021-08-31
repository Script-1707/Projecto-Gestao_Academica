-- MySQL dump 10.13  Distrib 8.0.26, for Linux (x86_64)
--
-- Host: localhost    Database: gestao_academica
-- ------------------------------------------------------
-- Server version	8.0.26-0ubuntu0.20.04.2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tb_ano_curricular`
--

DROP TABLE IF EXISTS `tb_ano_curricular`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_ano_curricular` (
  `codigo` int unsigned NOT NULL AUTO_INCREMENT,
  `designacao` varchar(100) NOT NULL,
  `codigo_estado` int unsigned NOT NULL,
  PRIMARY KEY (`codigo`),
  UNIQUE KEY `tb_ano_curricular_UN` (`designacao`),
  KEY `tb_ano_curricular_FK` (`codigo_estado`),
  CONSTRAINT `tb_ano_curricular_FK` FOREIGN KEY (`codigo_estado`) REFERENCES `tb_estado` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_ano_curricular`
--

LOCK TABLES `tb_ano_curricular` WRITE;
/*!40000 ALTER TABLE `tb_ano_curricular` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_ano_curricular` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_ano_lectivo`
--

DROP TABLE IF EXISTS `tb_ano_lectivo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_ano_lectivo` (
  `codigo` int unsigned NOT NULL AUTO_INCREMENT,
  `designacao` varchar(100) NOT NULL,
  `codigo_estado` int unsigned NOT NULL,
  PRIMARY KEY (`codigo`),
  UNIQUE KEY `tb_ano_lectivo_UN` (`designacao`),
  KEY `tb_ano_lectivo_FK` (`codigo_estado`),
  CONSTRAINT `tb_ano_lectivo_FK` FOREIGN KEY (`codigo_estado`) REFERENCES `tb_estado` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_ano_lectivo`
--

LOCK TABLES `tb_ano_lectivo` WRITE;
/*!40000 ALTER TABLE `tb_ano_lectivo` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_ano_lectivo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_ano_lectivo_semestre`
--

DROP TABLE IF EXISTS `tb_ano_lectivo_semestre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_ano_lectivo_semestre` (
  `codigo` int unsigned NOT NULL AUTO_INCREMENT,
  `codigo_ano_lectivo` int unsigned NOT NULL,
  `codigo_semestre` int unsigned NOT NULL,
  `data_inicio` date NOT NULL,
  `data_termino` date NOT NULL,
  PRIMARY KEY (`codigo`),
  UNIQUE KEY `tb_ano_lectivo_semestre_UN` (`codigo_ano_lectivo`,`codigo_semestre`),
  KEY `tb_ano_lectivo_semestre_FK_1` (`codigo_semestre`),
  CONSTRAINT `tb_ano_lectivo_semestre_FK` FOREIGN KEY (`codigo_ano_lectivo`) REFERENCES `tb_ano_lectivo` (`codigo`),
  CONSTRAINT `tb_ano_lectivo_semestre_FK_1` FOREIGN KEY (`codigo_semestre`) REFERENCES `tb_semestre` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_ano_lectivo_semestre`
--

LOCK TABLES `tb_ano_lectivo_semestre` WRITE;
/*!40000 ALTER TABLE `tb_ano_lectivo_semestre` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_ano_lectivo_semestre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_area`
--

DROP TABLE IF EXISTS `tb_area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_area` (
  `codigo` int unsigned NOT NULL AUTO_INCREMENT,
  `designacao` varchar(100) NOT NULL,
  `codigo_estado` int unsigned NOT NULL,
  PRIMARY KEY (`codigo`),
  UNIQUE KEY `tb_area_UN` (`designacao`),
  KEY `tb_area_FK` (`codigo_estado`),
  CONSTRAINT `tb_area_FK` FOREIGN KEY (`codigo_estado`) REFERENCES `tb_estado` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_area`
--

LOCK TABLES `tb_area` WRITE;
/*!40000 ALTER TABLE `tb_area` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_area` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_candidatura`
--

DROP TABLE IF EXISTS `tb_candidatura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_candidatura` (
  `data` datetime NOT NULL,
  `observação` varchar(400) DEFAULT NULL,
  `codigo_pessoa` int unsigned NOT NULL,
  `codigo_vaga` int unsigned NOT NULL,
  `codigo` int unsigned NOT NULL AUTO_INCREMENT,
  `codigo_estado` int unsigned NOT NULL,
  PRIMARY KEY (`codigo`),
  UNIQUE KEY `tb_candidatura_UN` (`codigo_vaga`,`codigo_pessoa`),
  KEY `tb_candidatura_FK` (`codigo_estado`),
  KEY `tb_candidatura_FK_1` (`codigo_pessoa`),
  CONSTRAINT `tb_candidatura_FK` FOREIGN KEY (`codigo_estado`) REFERENCES `tb_estado` (`codigo`),
  CONSTRAINT `tb_candidatura_FK_1` FOREIGN KEY (`codigo_pessoa`) REFERENCES `tb_pessoa` (`codigo`),
  CONSTRAINT `tb_candidatura_FK_2` FOREIGN KEY (`codigo_vaga`) REFERENCES `tb_vaga` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_candidatura`
--

LOCK TABLES `tb_candidatura` WRITE;
/*!40000 ALTER TABLE `tb_candidatura` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_candidatura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_categoria`
--

DROP TABLE IF EXISTS `tb_categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_categoria` (
  `codigo` int unsigned NOT NULL AUTO_INCREMENT,
  `designacao` varchar(200) NOT NULL,
  `codigo_estado` int unsigned NOT NULL,
  PRIMARY KEY (`codigo`),
  UNIQUE KEY `tb_categoria_UN` (`designacao`),
  KEY `tb_categoria_FK` (`codigo_estado`),
  CONSTRAINT `tb_categoria_FK` FOREIGN KEY (`codigo_estado`) REFERENCES `tb_estado` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_categoria`
--

LOCK TABLES `tb_categoria` WRITE;
/*!40000 ALTER TABLE `tb_categoria` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_curso`
--

DROP TABLE IF EXISTS `tb_curso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_curso` (
  `codigo` int unsigned NOT NULL AUTO_INCREMENT,
  `designacao` varchar(150) NOT NULL,
  `codigo_faculdade` int unsigned NOT NULL,
  `director` varchar(150) NOT NULL,
  `codigo_estado` int unsigned NOT NULL,
  PRIMARY KEY (`codigo`),
  UNIQUE KEY `tb_curso_UN` (`designacao`,`director`),
  KEY `tb_curso_FK` (`codigo_estado`),
  CONSTRAINT `tb_curso_FK` FOREIGN KEY (`codigo_estado`) REFERENCES `tb_estado` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_curso`
--

LOCK TABLES `tb_curso` WRITE;
/*!40000 ALTER TABLE `tb_curso` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_curso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_duracao`
--

DROP TABLE IF EXISTS `tb_duracao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_duracao` (
  `codigo` int unsigned NOT NULL AUTO_INCREMENT,
  `designacao` varchar(100) NOT NULL,
  `codigo_estado` int unsigned NOT NULL,
  PRIMARY KEY (`codigo`),
  UNIQUE KEY `tb_duracao_UN` (`designacao`),
  KEY `tb_duracao_FK` (`codigo_estado`),
  CONSTRAINT `tb_duracao_FK` FOREIGN KEY (`codigo_estado`) REFERENCES `tb_estado` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_duracao`
--

LOCK TABLES `tb_duracao` WRITE;
/*!40000 ALTER TABLE `tb_duracao` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_duracao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_estado`
--

DROP TABLE IF EXISTS `tb_estado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_estado` (
  `codigo` int unsigned NOT NULL AUTO_INCREMENT,
  `designacao` varchar(100) NOT NULL,
  PRIMARY KEY (`codigo`),
  UNIQUE KEY `tb_estado_UN` (`designacao`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_estado`
--

LOCK TABLES `tb_estado` WRITE;
/*!40000 ALTER TABLE `tb_estado` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_estado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_estado_civil`
--

DROP TABLE IF EXISTS `tb_estado_civil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_estado_civil` (
  `codigo` int unsigned NOT NULL AUTO_INCREMENT,
  `designacao` varchar(100) NOT NULL,
  PRIMARY KEY (`codigo`),
  UNIQUE KEY `tb_estado_civil_UN` (`designacao`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_estado_civil`
--

LOCK TABLES `tb_estado_civil` WRITE;
/*!40000 ALTER TABLE `tb_estado_civil` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_estado_civil` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_experiencia_profissional`
--

DROP TABLE IF EXISTS `tb_experiencia_profissional`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_experiencia_profissional` (
  `codigo` int unsigned NOT NULL AUTO_INCREMENT,
  `codigo_funcao` int unsigned NOT NULL,
  `codigo_unidade_curricular` int unsigned NOT NULL,
  `codigo_curso` int unsigned NOT NULL,
  `codigo_tipo_experiencia` int unsigned NOT NULL,
  `data_inicio` date NOT NULL,
  `data_termino` date NOT NULL,
  `codigo_pessoa` int unsigned NOT NULL,
  `codigo_estado` int unsigned NOT NULL,
  PRIMARY KEY (`codigo`),
  UNIQUE KEY `tb_experiencia_profissional_UN` (`codigo_funcao`,`codigo_unidade_curricular`,`codigo_curso`,`codigo_tipo_experiencia`,`codigo_pessoa`),
  KEY `tb_experiencia_profissional_FK` (`codigo_curso`),
  KEY `tb_experiencia_profissional_FK_1` (`codigo_unidade_curricular`),
  KEY `tb_experiencia_profissional_FK_3` (`codigo_tipo_experiencia`),
  KEY `tb_experiencia_profissional_FK_4` (`codigo_pessoa`),
  KEY `tb_experiencia_profissional_FK_5` (`codigo_estado`),
  CONSTRAINT `tb_experiencia_profissional_FK` FOREIGN KEY (`codigo_curso`) REFERENCES `tb_curso` (`codigo`),
  CONSTRAINT `tb_experiencia_profissional_FK_1` FOREIGN KEY (`codigo_unidade_curricular`) REFERENCES `tb_unidade_curricular` (`codigo`),
  CONSTRAINT `tb_experiencia_profissional_FK_2` FOREIGN KEY (`codigo_funcao`) REFERENCES `tb_funcao` (`codigo`),
  CONSTRAINT `tb_experiencia_profissional_FK_3` FOREIGN KEY (`codigo_tipo_experiencia`) REFERENCES `tb_tipo_experiencia` (`codigo`),
  CONSTRAINT `tb_experiencia_profissional_FK_4` FOREIGN KEY (`codigo_pessoa`) REFERENCES `tb_pessoa` (`codigo`),
  CONSTRAINT `tb_experiencia_profissional_FK_5` FOREIGN KEY (`codigo_estado`) REFERENCES `tb_estado` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_experiencia_profissional`
--

LOCK TABLES `tb_experiencia_profissional` WRITE;
/*!40000 ALTER TABLE `tb_experiencia_profissional` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_experiencia_profissional` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_faculdade`
--

DROP TABLE IF EXISTS `tb_faculdade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_faculdade` (
  `codigo` int unsigned NOT NULL AUTO_INCREMENT,
  `designacao` varchar(150) NOT NULL,
  `sigla` varchar(50) NOT NULL,
  `decano` varchar(150) NOT NULL,
  `codigo_estado` int unsigned NOT NULL,
  `data` datetime NOT NULL,
  PRIMARY KEY (`codigo`),
  UNIQUE KEY `tb_faculdade_UN` (`designacao`,`decano`),
  KEY `tb_faculdade_FK` (`codigo_estado`),
  CONSTRAINT `tb_faculdade_FK` FOREIGN KEY (`codigo_estado`) REFERENCES `tb_estado` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_faculdade`
--

LOCK TABLES `tb_faculdade` WRITE;
/*!40000 ALTER TABLE `tb_faculdade` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_faculdade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_fase`
--

DROP TABLE IF EXISTS `tb_fase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_fase` (
  `codigo` int unsigned NOT NULL AUTO_INCREMENT,
  `codigo_estado` int unsigned NOT NULL,
  `designacao` varchar(100) NOT NULL,
  PRIMARY KEY (`codigo`),
  UNIQUE KEY `tb_fase_UN` (`designacao`),
  KEY `tb_fase_FK` (`codigo_estado`),
  CONSTRAINT `tb_fase_FK` FOREIGN KEY (`codigo_estado`) REFERENCES `tb_estado` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_fase`
--

LOCK TABLES `tb_fase` WRITE;
/*!40000 ALTER TABLE `tb_fase` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_fase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_formacao_academica`
--

DROP TABLE IF EXISTS `tb_formacao_academica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_formacao_academica` (
  `codigo` int unsigned NOT NULL AUTO_INCREMENT,
  `codigo_area` int unsigned NOT NULL,
  `codigo_nivel_academico` int unsigned NOT NULL,
  `codigo_instituto` int unsigned NOT NULL,
  `data` datetime NOT NULL,
  `codigo_pessoa` int unsigned NOT NULL,
  `codigo_estado` int unsigned NOT NULL,
  PRIMARY KEY (`codigo`),
  UNIQUE KEY `tb_formacao_academica_UN` (`codigo_pessoa`,`codigo_instituto`,`codigo_nivel_academico`,`codigo_area`),
  KEY `tb_formacao_academica_FK` (`codigo_instituto`),
  KEY `tb_formacao_academica_FK_1` (`codigo_area`),
  KEY `tb_formacao_academica_FK_2` (`codigo_nivel_academico`),
  KEY `tb_formacao_academica_FK_4` (`codigo_estado`),
  CONSTRAINT `tb_formacao_academica_FK` FOREIGN KEY (`codigo_instituto`) REFERENCES `tb_instituto` (`codigo`),
  CONSTRAINT `tb_formacao_academica_FK_1` FOREIGN KEY (`codigo_area`) REFERENCES `tb_area` (`codigo`),
  CONSTRAINT `tb_formacao_academica_FK_2` FOREIGN KEY (`codigo_nivel_academico`) REFERENCES `tb_nivel_academico` (`codigo`),
  CONSTRAINT `tb_formacao_academica_FK_3` FOREIGN KEY (`codigo_pessoa`) REFERENCES `tb_pessoa` (`codigo`),
  CONSTRAINT `tb_formacao_academica_FK_4` FOREIGN KEY (`codigo_estado`) REFERENCES `tb_estado` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_formacao_academica`
--

LOCK TABLES `tb_formacao_academica` WRITE;
/*!40000 ALTER TABLE `tb_formacao_academica` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_formacao_academica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_formacao_profissional`
--

DROP TABLE IF EXISTS `tb_formacao_profissional`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_formacao_profissional` (
  `codigo` int unsigned NOT NULL AUTO_INCREMENT,
  `codigo_instituto` int unsigned NOT NULL,
  `data_inicio` date NOT NULL,
  `designacao` varchar(200) NOT NULL,
  `data_conclusao` date NOT NULL,
  `data` datetime NOT NULL,
  `duracao_mes` int unsigned NOT NULL DEFAULT '1',
  `codigo_pessoa` int unsigned NOT NULL,
  `codigo_estado` int unsigned NOT NULL,
  PRIMARY KEY (`codigo`),
  KEY `tb_formacao_profissional_FK` (`codigo_instituto`),
  KEY `tb_formacao_profissional_FK_1` (`codigo_pessoa`),
  KEY `tb_formacao_profissional_FK_2` (`codigo_estado`),
  CONSTRAINT `tb_formacao_profissional_FK` FOREIGN KEY (`codigo_instituto`) REFERENCES `tb_instituto` (`codigo`),
  CONSTRAINT `tb_formacao_profissional_FK_1` FOREIGN KEY (`codigo_pessoa`) REFERENCES `tb_pessoa` (`codigo`),
  CONSTRAINT `tb_formacao_profissional_FK_2` FOREIGN KEY (`codigo_estado`) REFERENCES `tb_estado` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_formacao_profissional`
--

LOCK TABLES `tb_formacao_profissional` WRITE;
/*!40000 ALTER TABLE `tb_formacao_profissional` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_formacao_profissional` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_funcao`
--

DROP TABLE IF EXISTS `tb_funcao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_funcao` (
  `codigo` int unsigned NOT NULL AUTO_INCREMENT,
  `codigo_categoria` int unsigned NOT NULL,
  `designacao` varchar(200) NOT NULL,
  `codigo_estado` int unsigned NOT NULL,
  PRIMARY KEY (`codigo`),
  UNIQUE KEY `tb_funcao_UN` (`designacao`),
  KEY `tb_funcao_FK` (`codigo_estado`),
  KEY `tb_funcao_FK_1` (`codigo_categoria`),
  CONSTRAINT `tb_funcao_FK` FOREIGN KEY (`codigo_estado`) REFERENCES `tb_estado` (`codigo`),
  CONSTRAINT `tb_funcao_FK_1` FOREIGN KEY (`codigo_categoria`) REFERENCES `tb_categoria` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_funcao`
--

LOCK TABLES `tb_funcao` WRITE;
/*!40000 ALTER TABLE `tb_funcao` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_funcao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_grade_curricular`
--

DROP TABLE IF EXISTS `tb_grade_curricular`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_grade_curricular` (
  `codigo` int unsigned NOT NULL AUTO_INCREMENT,
  `codigo_unidade_curricular` int unsigned NOT NULL,
  `codigo_tipo_grade_curricular` int unsigned NOT NULL,
  `data` datetime NOT NULL,
  `codigo_estado` int unsigned NOT NULL,
  PRIMARY KEY (`codigo`),
  UNIQUE KEY `tb_grade_curricular_UN` (`codigo_unidade_curricular`,`codigo_tipo_grade_curricular`),
  KEY `tb_grade_curricular_FK` (`codigo_estado`),
  KEY `tb_grade_curricular_FK_2` (`codigo_tipo_grade_curricular`),
  CONSTRAINT `tb_grade_curricular_FK` FOREIGN KEY (`codigo_estado`) REFERENCES `tb_estado` (`codigo`),
  CONSTRAINT `tb_grade_curricular_FK_1` FOREIGN KEY (`codigo_unidade_curricular`) REFERENCES `tb_unidade_curricular` (`codigo`),
  CONSTRAINT `tb_grade_curricular_FK_2` FOREIGN KEY (`codigo_tipo_grade_curricular`) REFERENCES `tb_tipo_grade_curricular` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_grade_curricular`
--

LOCK TABLES `tb_grade_curricular` WRITE;
/*!40000 ALTER TABLE `tb_grade_curricular` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_grade_curricular` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_instituto`
--

DROP TABLE IF EXISTS `tb_instituto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_instituto` (
  `codigo` int unsigned NOT NULL AUTO_INCREMENT,
  `designacao` varchar(300) NOT NULL,
  `codigo_tipo_instituto` int unsigned NOT NULL,
  `codigo_estado` int unsigned NOT NULL,
  PRIMARY KEY (`codigo`),
  UNIQUE KEY `tb_instituto_UN` (`designacao`),
  KEY `tb_instituto_FK` (`codigo_estado`),
  KEY `tb_instituto_FK_1` (`codigo_tipo_instituto`),
  CONSTRAINT `tb_instituto_FK` FOREIGN KEY (`codigo_estado`) REFERENCES `tb_estado` (`codigo`),
  CONSTRAINT `tb_instituto_FK_1` FOREIGN KEY (`codigo_tipo_instituto`) REFERENCES `tb_tipo_instituto` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_instituto`
--

LOCK TABLES `tb_instituto` WRITE;
/*!40000 ALTER TABLE `tb_instituto` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_instituto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_municipio`
--

DROP TABLE IF EXISTS `tb_municipio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_municipio` (
  `codigo` int unsigned NOT NULL AUTO_INCREMENT,
  `designacao` varchar(100) NOT NULL,
  PRIMARY KEY (`codigo`),
  UNIQUE KEY `tb_municipio_UN` (`designacao`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_municipio`
--

LOCK TABLES `tb_municipio` WRITE;
/*!40000 ALTER TABLE `tb_municipio` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_municipio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_nivel_academico`
--

DROP TABLE IF EXISTS `tb_nivel_academico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_nivel_academico` (
  `codigo` int unsigned NOT NULL AUTO_INCREMENT,
  `designacao` varchar(100) NOT NULL,
  `codigo_estado` int unsigned NOT NULL,
  PRIMARY KEY (`codigo`),
  UNIQUE KEY `tb_nivel_academico_UN` (`designacao`),
  KEY `tb_nivel_academico_FK` (`codigo_estado`),
  CONSTRAINT `tb_nivel_academico_FK` FOREIGN KEY (`codigo_estado`) REFERENCES `tb_estado` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_nivel_academico`
--

LOCK TABLES `tb_nivel_academico` WRITE;
/*!40000 ALTER TABLE `tb_nivel_academico` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_nivel_academico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_pais`
--

DROP TABLE IF EXISTS `tb_pais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_pais` (
  `codigo` int unsigned NOT NULL AUTO_INCREMENT,
  `designacao` varchar(100) NOT NULL,
  `codigo_estado` int unsigned NOT NULL,
  PRIMARY KEY (`codigo`),
  UNIQUE KEY `tb_pais_UN` (`designacao`),
  KEY `tb_pais_FK` (`codigo_estado`),
  CONSTRAINT `tb_pais_FK` FOREIGN KEY (`codigo_estado`) REFERENCES `tb_estado` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_pais`
--

LOCK TABLES `tb_pais` WRITE;
/*!40000 ALTER TABLE `tb_pais` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_pais` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_pessoa`
--

DROP TABLE IF EXISTS `tb_pessoa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_pessoa` (
  `codigo` int unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(150) NOT NULL,
  `codigo_municipio` int unsigned NOT NULL,
  `residencia` varchar(255) NOT NULL,
  `codigo_sexo` int unsigned NOT NULL,
  `codigo_estado_civil` int unsigned NOT NULL,
  `codigo_nacionalidade` int unsigned NOT NULL,
  `data_nascimento` date NOT NULL,
  `codigo_estado` int unsigned NOT NULL,
  `num_bi` varchar(100) NOT NULL,
  `nome_pai` varchar(150) NOT NULL,
  `nome_mae` varchar(150) NOT NULL,
  PRIMARY KEY (`codigo`),
  UNIQUE KEY `tb_pessoa_UN` (`num_bi`),
  KEY `tb_pessoa_FK` (`codigo_sexo`),
  KEY `tb_pessoa_FK_1` (`codigo_municipio`),
  KEY `tb_pessoa_FK_2` (`codigo_estado_civil`),
  KEY `tb_pessoa_FK_3` (`codigo_nacionalidade`),
  CONSTRAINT `tb_pessoa_FK` FOREIGN KEY (`codigo_sexo`) REFERENCES `tb_sexo` (`codigo`),
  CONSTRAINT `tb_pessoa_FK_1` FOREIGN KEY (`codigo_municipio`) REFERENCES `tb_municipio` (`codigo`),
  CONSTRAINT `tb_pessoa_FK_2` FOREIGN KEY (`codigo_estado_civil`) REFERENCES `tb_estado_civil` (`codigo`),
  CONSTRAINT `tb_pessoa_FK_3` FOREIGN KEY (`codigo_nacionalidade`) REFERENCES `tb_pais` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_pessoa`
--

LOCK TABLES `tb_pessoa` WRITE;
/*!40000 ALTER TABLE `tb_pessoa` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_pessoa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_planeamento`
--

DROP TABLE IF EXISTS `tb_planeamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_planeamento` (
  `codigo` int unsigned NOT NULL AUTO_INCREMENT,
  `codigo_fase` int unsigned NOT NULL,
  `codigo_area` int unsigned NOT NULL,
  `codigo_tipo_vaga` int unsigned NOT NULL,
  `data` date NOT NULL,
  `codigo_estado` int unsigned NOT NULL,
  `proxima_fase` int unsigned DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  UNIQUE KEY `tb_planeamento_UN` (`codigo_fase`,`codigo_area`,`codigo_tipo_vaga`),
  KEY `tb_planeamento_FK` (`codigo_estado`),
  KEY `tb_planeamento_FK_1` (`codigo_area`),
  KEY `tb_planeamento_FK_2` (`codigo_tipo_vaga`),
  KEY `tb_planeamento_FK_4` (`proxima_fase`),
  CONSTRAINT `tb_planeamento_FK` FOREIGN KEY (`codigo_estado`) REFERENCES `tb_estado` (`codigo`),
  CONSTRAINT `tb_planeamento_FK_1` FOREIGN KEY (`codigo_area`) REFERENCES `tb_area` (`codigo`),
  CONSTRAINT `tb_planeamento_FK_2` FOREIGN KEY (`codigo_tipo_vaga`) REFERENCES `tb_tipo_vaga` (`codigo`),
  CONSTRAINT `tb_planeamento_FK_3` FOREIGN KEY (`codigo_fase`) REFERENCES `tb_fase` (`codigo`),
  CONSTRAINT `tb_planeamento_FK_4` FOREIGN KEY (`proxima_fase`) REFERENCES `tb_planeamento` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_planeamento`
--

LOCK TABLES `tb_planeamento` WRITE;
/*!40000 ALTER TABLE `tb_planeamento` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_planeamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_plano_curricular`
--

DROP TABLE IF EXISTS `tb_plano_curricular`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_plano_curricular` (
  `codigo` int unsigned NOT NULL AUTO_INCREMENT,
  `codigo_curso` int unsigned NOT NULL,
  `codigo_ano_lectivo` int unsigned NOT NULL,
  `data` datetime NOT NULL,
  `designacao` varchar(250) NOT NULL,
  `codigo_estado` int unsigned NOT NULL,
  PRIMARY KEY (`codigo`),
  UNIQUE KEY `tb_plano_curricular_UN` (`codigo_curso`,`codigo_ano_lectivo`),
  KEY `tb_plano_curricular_FK` (`codigo_estado`),
  CONSTRAINT `tb_plano_curricular_FK` FOREIGN KEY (`codigo_estado`) REFERENCES `tb_estado` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_plano_curricular`
--

LOCK TABLES `tb_plano_curricular` WRITE;
/*!40000 ALTER TABLE `tb_plano_curricular` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_plano_curricular` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_plano_curricular_grade`
--

DROP TABLE IF EXISTS `tb_plano_curricular_grade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_plano_curricular_grade` (
  `codigo` int unsigned NOT NULL AUTO_INCREMENT,
  `codigo_plano_curricular` int unsigned NOT NULL,
  `codigo_grade_curricular` int unsigned NOT NULL,
  `codigo_semestre` int unsigned NOT NULL,
  `codigo_ano_curricular` int unsigned NOT NULL,
  `codigo_duracao` int unsigned NOT NULL,
  `hora_teorica` int unsigned NOT NULL DEFAULT '0',
  `hora_pratica` int unsigned NOT NULL DEFAULT '0',
  `hora_teorica_pratica` int unsigned NOT NULL DEFAULT '0',
  `hora_total` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`codigo`),
  UNIQUE KEY `tb_plano_curricular_grade_UN` (`codigo_plano_curricular`,`codigo_grade_curricular`,`codigo_semestre`,`codigo_ano_curricular`),
  KEY `tb_plano_curricular_grade_FK_1` (`codigo_grade_curricular`),
  KEY `tb_plano_curricular_grade_FK_2` (`codigo_semestre`),
  KEY `tb_plano_curricular_grade_FK_3` (`codigo_ano_curricular`),
  KEY `tb_plano_curricular_grade_FK_4` (`codigo_duracao`),
  CONSTRAINT `tb_plano_curricular_grade_FK` FOREIGN KEY (`codigo_plano_curricular`) REFERENCES `tb_plano_curricular` (`codigo`),
  CONSTRAINT `tb_plano_curricular_grade_FK_1` FOREIGN KEY (`codigo_grade_curricular`) REFERENCES `tb_grade_curricular` (`codigo`),
  CONSTRAINT `tb_plano_curricular_grade_FK_2` FOREIGN KEY (`codigo_semestre`) REFERENCES `tb_semestre` (`codigo`),
  CONSTRAINT `tb_plano_curricular_grade_FK_3` FOREIGN KEY (`codigo_ano_curricular`) REFERENCES `tb_ano_curricular` (`codigo`),
  CONSTRAINT `tb_plano_curricular_grade_FK_4` FOREIGN KEY (`codigo_duracao`) REFERENCES `tb_duracao` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_plano_curricular_grade`
--

LOCK TABLES `tb_plano_curricular_grade` WRITE;
/*!40000 ALTER TABLE `tb_plano_curricular_grade` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_plano_curricular_grade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_processo_candidatura`
--

DROP TABLE IF EXISTS `tb_processo_candidatura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_processo_candidatura` (
  `codigo` int unsigned NOT NULL AUTO_INCREMENT,
  `codigo_candidatura` int unsigned NOT NULL,
  `codigo_planeamento` int unsigned NOT NULL,
  `data` datetime NOT NULL,
  PRIMARY KEY (`codigo`),
  KEY `tb_processo_candidatura_FK` (`codigo_planeamento`),
  KEY `tb_processo_candidatura_FK_1` (`codigo_candidatura`),
  CONSTRAINT `tb_processo_candidatura_FK` FOREIGN KEY (`codigo_planeamento`) REFERENCES `tb_planeamento` (`codigo`),
  CONSTRAINT `tb_processo_candidatura_FK_1` FOREIGN KEY (`codigo_candidatura`) REFERENCES `tb_candidatura` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_processo_candidatura`
--

LOCK TABLES `tb_processo_candidatura` WRITE;
/*!40000 ALTER TABLE `tb_processo_candidatura` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_processo_candidatura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_provincia`
--

DROP TABLE IF EXISTS `tb_provincia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_provincia` (
  `codigo` int unsigned NOT NULL AUTO_INCREMENT,
  `designacao` varchar(100) NOT NULL,
  `codigo_pais` int unsigned NOT NULL,
  `codigo_estado` int unsigned NOT NULL,
  PRIMARY KEY (`codigo`),
  UNIQUE KEY `tb_provincia_UN` (`designacao`),
  KEY `tb_provincia_FK` (`codigo_pais`),
  KEY `tb_provincia_FK_1` (`codigo_estado`),
  CONSTRAINT `tb_provincia_FK` FOREIGN KEY (`codigo_pais`) REFERENCES `tb_pais` (`codigo`),
  CONSTRAINT `tb_provincia_FK_1` FOREIGN KEY (`codigo_estado`) REFERENCES `tb_estado` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_provincia`
--

LOCK TABLES `tb_provincia` WRITE;
/*!40000 ALTER TABLE `tb_provincia` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_provincia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_role_utilizador`
--

DROP TABLE IF EXISTS `tb_role_utilizador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_role_utilizador` (
  `codigo` int unsigned NOT NULL AUTO_INCREMENT,
  `codigo_tipo_utilizador` int unsigned NOT NULL,
  `codigo_utilizador` int unsigned NOT NULL,
  `codigo_estado` int unsigned NOT NULL,
  `data` datetime NOT NULL,
  PRIMARY KEY (`codigo`),
  UNIQUE KEY `tb_role_utilizador_UN` (`codigo_tipo_utilizador`,`codigo_utilizador`),
  KEY `tb_role_utilizador_FK` (`codigo_estado`),
  KEY `tb_role_utilizador_FK_2` (`codigo_utilizador`),
  CONSTRAINT `tb_role_utilizador_FK` FOREIGN KEY (`codigo_estado`) REFERENCES `tb_estado` (`codigo`),
  CONSTRAINT `tb_role_utilizador_FK_1` FOREIGN KEY (`codigo_tipo_utilizador`) REFERENCES `tb_tipo_utilizador` (`codigo`),
  CONSTRAINT `tb_role_utilizador_FK_2` FOREIGN KEY (`codigo_utilizador`) REFERENCES `tb_utilizador` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_role_utilizador`
--

LOCK TABLES `tb_role_utilizador` WRITE;
/*!40000 ALTER TABLE `tb_role_utilizador` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_role_utilizador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_semestre`
--

DROP TABLE IF EXISTS `tb_semestre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_semestre` (
  `codigo` int unsigned NOT NULL AUTO_INCREMENT,
  `designacao` varchar(100) NOT NULL,
  `codigo_estado` int unsigned NOT NULL,
  PRIMARY KEY (`codigo`),
  UNIQUE KEY `tb_semestre_UN` (`designacao`),
  KEY `tb_semestre_FK` (`codigo_estado`),
  CONSTRAINT `tb_semestre_FK` FOREIGN KEY (`codigo_estado`) REFERENCES `tb_estado` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_semestre`
--

LOCK TABLES `tb_semestre` WRITE;
/*!40000 ALTER TABLE `tb_semestre` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_semestre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_sexo`
--

DROP TABLE IF EXISTS `tb_sexo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_sexo` (
  `codigo` int unsigned NOT NULL AUTO_INCREMENT,
  `designacao` varchar(100) NOT NULL,
  PRIMARY KEY (`codigo`),
  UNIQUE KEY `tb_sexo_UN` (`designacao`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_sexo`
--

LOCK TABLES `tb_sexo` WRITE;
/*!40000 ALTER TABLE `tb_sexo` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_sexo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_sistema`
--

DROP TABLE IF EXISTS `tb_sistema`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_sistema` (
  `codigo` int unsigned NOT NULL AUTO_INCREMENT,
  `designacao` varchar(200) NOT NULL,
  `versao` varchar(10) NOT NULL,
  `data_ultima_versao` datetime NOT NULL,
  `codigo_estado` int unsigned NOT NULL,
  PRIMARY KEY (`codigo`),
  UNIQUE KEY `tb_sistema_UN` (`designacao`),
  KEY `tb_sistema_FK` (`codigo_estado`),
  CONSTRAINT `tb_sistema_FK` FOREIGN KEY (`codigo_estado`) REFERENCES `tb_estado` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_sistema`
--

LOCK TABLES `tb_sistema` WRITE;
/*!40000 ALTER TABLE `tb_sistema` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_sistema` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_tipo_area`
--

DROP TABLE IF EXISTS `tb_tipo_area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_tipo_area` (
  `codigo` int unsigned NOT NULL AUTO_INCREMENT,
  `designacao` varchar(100) NOT NULL,
  `codigo_estado` int unsigned NOT NULL,
  PRIMARY KEY (`codigo`),
  UNIQUE KEY `tb_tipo_area_UN` (`designacao`),
  KEY `tb_tipo_area_FK` (`codigo_estado`),
  CONSTRAINT `tb_tipo_area_FK` FOREIGN KEY (`codigo_estado`) REFERENCES `tb_estado` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_tipo_area`
--

LOCK TABLES `tb_tipo_area` WRITE;
/*!40000 ALTER TABLE `tb_tipo_area` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_tipo_area` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_tipo_documento`
--

DROP TABLE IF EXISTS `tb_tipo_documento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_tipo_documento` (
  `codigo` int unsigned NOT NULL AUTO_INCREMENT,
  `designacao` varchar(100) NOT NULL,
  `expira` tinyint(1) NOT NULL DEFAULT '0',
  `codig_estado` int unsigned NOT NULL,
  PRIMARY KEY (`codigo`),
  UNIQUE KEY `tb_tipo_documento_UN` (`designacao`),
  KEY `tb_tipo_documento_FK` (`codig_estado`),
  CONSTRAINT `tb_tipo_documento_FK` FOREIGN KEY (`codig_estado`) REFERENCES `tb_estado` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_tipo_documento`
--

LOCK TABLES `tb_tipo_documento` WRITE;
/*!40000 ALTER TABLE `tb_tipo_documento` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_tipo_documento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_tipo_documento_pessoa`
--

DROP TABLE IF EXISTS `tb_tipo_documento_pessoa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_tipo_documento_pessoa` (
  `codigo` int unsigned NOT NULL AUTO_INCREMENT,
  `codigo_pessoa` int unsigned NOT NULL,
  `codigo_tipo_documento` int unsigned NOT NULL,
  `data_emissao` date NOT NULL,
  `data_validade` date DEFAULT NULL,
  `anexo` varchar(255) DEFAULT NULL,
  `data` date NOT NULL,
  `codigo_estado` int unsigned NOT NULL,
  `num_documento` varchar(100) NOT NULL,
  PRIMARY KEY (`codigo`),
  UNIQUE KEY `tb_tipo_documento_pessoa_UN` (`num_documento`),
  KEY `tb_tipo_documento_pessoa_FK` (`codigo_pessoa`),
  KEY `tb_tipo_documento_pessoa_FK_1` (`codigo_tipo_documento`),
  KEY `tb_tipo_documento_pessoa_FK_2` (`codigo_estado`),
  CONSTRAINT `tb_tipo_documento_pessoa_FK` FOREIGN KEY (`codigo_pessoa`) REFERENCES `tb_pessoa` (`codigo`),
  CONSTRAINT `tb_tipo_documento_pessoa_FK_1` FOREIGN KEY (`codigo_tipo_documento`) REFERENCES `tb_tipo_documento` (`codigo`),
  CONSTRAINT `tb_tipo_documento_pessoa_FK_2` FOREIGN KEY (`codigo_estado`) REFERENCES `tb_estado` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_tipo_documento_pessoa`
--

LOCK TABLES `tb_tipo_documento_pessoa` WRITE;
/*!40000 ALTER TABLE `tb_tipo_documento_pessoa` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_tipo_documento_pessoa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_tipo_experiencia`
--

DROP TABLE IF EXISTS `tb_tipo_experiencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_tipo_experiencia` (
  `codigo` int unsigned NOT NULL AUTO_INCREMENT,
  `designacao` varchar(200) NOT NULL,
  `codigo_estado` int unsigned NOT NULL,
  PRIMARY KEY (`codigo`),
  UNIQUE KEY `tb_tipo_experiencia_UN` (`designacao`),
  KEY `tb_tipo_experiencia_FK` (`codigo_estado`),
  CONSTRAINT `tb_tipo_experiencia_FK` FOREIGN KEY (`codigo_estado`) REFERENCES `tb_estado` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_tipo_experiencia`
--

LOCK TABLES `tb_tipo_experiencia` WRITE;
/*!40000 ALTER TABLE `tb_tipo_experiencia` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_tipo_experiencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_tipo_grade_curricular`
--

DROP TABLE IF EXISTS `tb_tipo_grade_curricular`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_tipo_grade_curricular` (
  `codigo` int unsigned NOT NULL AUTO_INCREMENT,
  `designacao` varchar(100) NOT NULL,
  `codigo_estado` int unsigned NOT NULL,
  PRIMARY KEY (`codigo`),
  UNIQUE KEY `tb_tipo_grade_curricular_UN` (`designacao`),
  KEY `tb_tipo_grade_curricular_FK` (`codigo_estado`),
  CONSTRAINT `tb_tipo_grade_curricular_FK` FOREIGN KEY (`codigo_estado`) REFERENCES `tb_estado` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_tipo_grade_curricular`
--

LOCK TABLES `tb_tipo_grade_curricular` WRITE;
/*!40000 ALTER TABLE `tb_tipo_grade_curricular` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_tipo_grade_curricular` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_tipo_instituto`
--

DROP TABLE IF EXISTS `tb_tipo_instituto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_tipo_instituto` (
  `codigo` int unsigned NOT NULL AUTO_INCREMENT,
  `designacao` varchar(100) NOT NULL,
  `codigo_estado` int unsigned NOT NULL,
  PRIMARY KEY (`codigo`),
  UNIQUE KEY `tb_tipo_instituto_UN` (`designacao`),
  KEY `tb_tipo_instituto_FK` (`codigo_estado`),
  CONSTRAINT `tb_tipo_instituto_FK` FOREIGN KEY (`codigo_estado`) REFERENCES `tb_estado` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_tipo_instituto`
--

LOCK TABLES `tb_tipo_instituto` WRITE;
/*!40000 ALTER TABLE `tb_tipo_instituto` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_tipo_instituto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_tipo_utilizador`
--

DROP TABLE IF EXISTS `tb_tipo_utilizador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_tipo_utilizador` (
  `codigo` int unsigned NOT NULL AUTO_INCREMENT,
  `designacao` varchar(100) NOT NULL,
  `codigo_sistema` int unsigned NOT NULL,
  `codigo_estado` int unsigned NOT NULL,
  PRIMARY KEY (`codigo`),
  UNIQUE KEY `tb_tipo_utilizador_UN` (`designacao`,`codigo_sistema`),
  KEY `tb_tipo_utilizador_FK` (`codigo_estado`),
  KEY `tb_tipo_utilizador_FK_1` (`codigo_sistema`),
  CONSTRAINT `tb_tipo_utilizador_FK` FOREIGN KEY (`codigo_estado`) REFERENCES `tb_estado` (`codigo`),
  CONSTRAINT `tb_tipo_utilizador_FK_1` FOREIGN KEY (`codigo_sistema`) REFERENCES `tb_sistema` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_tipo_utilizador`
--

LOCK TABLES `tb_tipo_utilizador` WRITE;
/*!40000 ALTER TABLE `tb_tipo_utilizador` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_tipo_utilizador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_tipo_vaga`
--

DROP TABLE IF EXISTS `tb_tipo_vaga`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_tipo_vaga` (
  `codigo` int unsigned NOT NULL AUTO_INCREMENT,
  `designacao` varchar(200) NOT NULL,
  `codigo_estado` int unsigned NOT NULL,
  PRIMARY KEY (`codigo`),
  UNIQUE KEY `tb_tipo_vaga_UN` (`designacao`),
  KEY `tb_tipo_vaga_FK` (`codigo_estado`),
  CONSTRAINT `tb_tipo_vaga_FK` FOREIGN KEY (`codigo_estado`) REFERENCES `tb_estado` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_tipo_vaga`
--

LOCK TABLES `tb_tipo_vaga` WRITE;
/*!40000 ALTER TABLE `tb_tipo_vaga` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_tipo_vaga` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_unidade_curricular`
--

DROP TABLE IF EXISTS `tb_unidade_curricular`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_unidade_curricular` (
  `codigo` int unsigned NOT NULL AUTO_INCREMENT,
  `designacao` varchar(255) NOT NULL,
  `data` datetime NOT NULL,
  `codigo_estado` int unsigned NOT NULL,
  `sigla` varchar(10) NOT NULL,
  PRIMARY KEY (`codigo`),
  UNIQUE KEY `tb_unidade_curricular_UN` (`designacao`),
  KEY `tb_unidade_curricular_FK` (`codigo_estado`),
  CONSTRAINT `tb_unidade_curricular_FK` FOREIGN KEY (`codigo_estado`) REFERENCES `tb_estado` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_unidade_curricular`
--

LOCK TABLES `tb_unidade_curricular` WRITE;
/*!40000 ALTER TABLE `tb_unidade_curricular` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_unidade_curricular` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_utilizador`
--

DROP TABLE IF EXISTS `tb_utilizador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_utilizador` (
  `codigo` int unsigned NOT NULL AUTO_INCREMENT,
  `user_name` varchar(100) NOT NULL,
  `password` varchar(200) NOT NULL,
  `data` datetime NOT NULL,
  `codigo_pessoa` int unsigned NOT NULL,
  `codigo_estado` int unsigned NOT NULL,
  PRIMARY KEY (`codigo`),
  UNIQUE KEY `tb_utilizador_UN` (`user_name`),
  KEY `tb_utilizador_FK` (`codigo_estado`),
  KEY `tb_utilizador_FK_1` (`codigo_pessoa`),
  CONSTRAINT `tb_utilizador_FK` FOREIGN KEY (`codigo_estado`) REFERENCES `tb_estado` (`codigo`),
  CONSTRAINT `tb_utilizador_FK_1` FOREIGN KEY (`codigo_pessoa`) REFERENCES `tb_pessoa` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_utilizador`
--

LOCK TABLES `tb_utilizador` WRITE;
/*!40000 ALTER TABLE `tb_utilizador` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_utilizador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_vaga`
--

DROP TABLE IF EXISTS `tb_vaga`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_vaga` (
  `codigo` int unsigned NOT NULL AUTO_INCREMENT,
  `codigo_tipo_vaga` int unsigned NOT NULL,
  `codigo_estado` int unsigned NOT NULL,
  `codigo_grade_curricular` int unsigned NOT NULL,
  `num_vaga` int unsigned NOT NULL DEFAULT '0',
  `data_inicio` date NOT NULL,
  `data_termino` date NOT NULL,
  PRIMARY KEY (`codigo`),
  KEY `tb_vaga_FK` (`codigo_estado`),
  KEY `tb_vaga_FK_1` (`codigo_tipo_vaga`),
  KEY `tb_vaga_FK_2` (`codigo_grade_curricular`),
  CONSTRAINT `tb_vaga_FK` FOREIGN KEY (`codigo_estado`) REFERENCES `tb_estado` (`codigo`),
  CONSTRAINT `tb_vaga_FK_1` FOREIGN KEY (`codigo_tipo_vaga`) REFERENCES `tb_tipo_vaga` (`codigo`),
  CONSTRAINT `tb_vaga_FK_2` FOREIGN KEY (`codigo_grade_curricular`) REFERENCES `tb_grade_curricular` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_vaga`
--

LOCK TABLES `tb_vaga` WRITE;
/*!40000 ALTER TABLE `tb_vaga` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_vaga` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'gestao_academica'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-08-30 10:46:44
