-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: localhost    Database: agrosmart
-- ------------------------------------------------------
-- Server version	8.0.45

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
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `id_cliente` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `creado_en` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_cliente`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (12,'Miguel Orellana','mi.orellanas@duocuc.cl','9 3760 2653','2026-05-18 15:40:39'),(14,'Carlos Villalobos','c.villalobos@gmail.com','9 1238 3482','2026-05-18 15:56:28'),(15,'Fernando Reyes','fer.reyes23@gmail.com','9 4736 3842','2026-05-18 16:05:01'),(16,'Lautaro Jimenes','lautaro.god994@gmail.com','9 7473 3462','2026-05-18 16:15:28'),(17,'Rodrigo Peña','rodrigo.p1990@gmail.com','9 4636 4883','2026-05-18 16:19:20'),(18,'Pablo Perez','pape2001@gmail.com','9 7474 4932','2026-05-18 16:21:50'),(19,'Antonia Jara','a.jaraz@gmail.com','9 9384 3484','2026-05-18 19:48:30'),(20,'Camilo Reyes','ca.reyes@gmail.com','9 6346 3522','2026-05-18 19:53:10'),(21,'Benjamin Pino','be.pino@gmail.com','9 3467 2345','2026-05-18 21:35:16'),(23,'Claudio Barrozo','cla.barrozo@gmail.com','9 6374 2347','2026-05-18 21:36:22'),(25,'Elias Figueroa','a@gmail.com','9 1234 5678','2026-05-18 21:37:44'),(26,'Alejandro Flores','b@gmail.com','9 8347327523','2026-05-18 21:42:11'),(27,'Elias Figueroa','co@gmail.com','9 3667 4577','2026-05-19 01:18:48'),(28,'Miguel Orellana','lar.miguel.o1@gmail.com','9 3760 2653','2026-05-19 01:22:31'),(29,'Carlos Baeza','c.beaza@gmail.com','9 5847 2478','2026-05-25 21:42:05'),(30,'Elias Figueroa','abc123@gmail.com','9 1234 6789','2026-05-28 20:51:42'),(32,'Alejandro Flores','abc444@gmail.com','9 4884 8348','2026-05-28 21:08:53'),(33,'Mauricio Pinilla','ma.pinilla@gmail.com','9 8548 3477','2026-05-28 22:00:53'),(34,'Francisco Toledo','fr.toledo@gmail.com','848348348','2026-05-28 22:03:15'),(35,'Lautaro Bustamante','la.busta@gmail.com','9 4848 2929','2026-05-28 22:05:16');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comuna`
--

DROP TABLE IF EXISTS `comuna`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comuna` (
  `id_comuna` int NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `id_region` int DEFAULT NULL,
  PRIMARY KEY (`id_comuna`),
  KEY `id_region` (`id_region`),
  CONSTRAINT `comuna_ibfk_1` FOREIGN KEY (`id_region`) REFERENCES `region` (`id_region`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comuna`
--

LOCK TABLES `comuna` WRITE;
/*!40000 ALTER TABLE `comuna` DISABLE KEYS */;
INSERT INTO `comuna` VALUES (101,'Santiago',1),(102,'Puente Alto',1),(103,'Maipú',1),(201,'Rancagua',2),(202,'Machalí',2),(301,'Talca',3),(302,'Curicó',3),(401,'Chillán',4),(501,'Los Ángeles',5),(502,'Concepción',5);
/*!40000 ALTER TABLE `comuna` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_pedido`
--

DROP TABLE IF EXISTS `detalle_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_pedido` (
  `id_detalle` int NOT NULL AUTO_INCREMENT,
  `id_pedido` int DEFAULT NULL,
  `id_producto` int DEFAULT NULL,
  `cantidad` int NOT NULL,
  `precio_unitario` decimal(10,2) NOT NULL,
  `id_sucursal` int DEFAULT NULL,
  PRIMARY KEY (`id_detalle`),
  KEY `id_pedido` (`id_pedido`),
  KEY `id_producto` (`id_producto`),
  KEY `fk_detalle_sucursal` (`id_sucursal`),
  CONSTRAINT `detalle_pedido_ibfk_1` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id_pedido`),
  CONSTRAINT `detalle_pedido_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`),
  CONSTRAINT `fk_detalle_sucursal` FOREIGN KEY (`id_sucursal`) REFERENCES `sucursal` (`id_sucursal`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_pedido`
--

LOCK TABLES `detalle_pedido` WRITE;
/*!40000 ALTER TABLE `detalle_pedido` DISABLE KEYS */;
INSERT INTO `detalle_pedido` VALUES (17,11,1003,8,45990.00,NULL),(18,12,1006,4,69990.00,NULL),(19,13,1003,9,45990.00,3),(20,14,1017,25,7990.00,1),(21,15,1002,5,249990.00,1),(22,16,1006,5,69990.00,2),(23,17,1002,3,249990.00,2),(24,18,1006,5,69990.00,2),(25,19,1005,10,79990.00,2),(26,20,1005,10,79990.00,2),(27,21,1003,2,45990.00,6),(28,22,1012,1,861346.00,7),(29,22,1010,2,725344.00,5),(30,23,1005,10,79990.00,2),(31,24,1001,1,100.00,1),(32,25,1005,5,79990.00,2),(33,25,1005,3,79990.00,5),(34,26,1003,3,45990.00,3),(35,27,1003,3,45990.00,3),(36,28,1030,100,313176.00,2),(37,29,1006,10,69990.00,8),(38,30,1003,3,45990.00,3);
/*!40000 ALTER TABLE `detalle_pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `direccion`
--

DROP TABLE IF EXISTS `direccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `direccion` (
  `id_direccion` int NOT NULL AUTO_INCREMENT,
  `id_cliente` int DEFAULT NULL,
  `calle` varchar(150) DEFAULT NULL,
  `numero` varchar(20) DEFAULT NULL,
  `id_comuna` int DEFAULT NULL,
  `referencia` text,
  PRIMARY KEY (`id_direccion`),
  KEY `id_cliente` (`id_cliente`),
  KEY `id_comuna` (`id_comuna`),
  CONSTRAINT `direccion_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`),
  CONSTRAINT `direccion_ibfk_2` FOREIGN KEY (`id_comuna`) REFERENCES `comuna` (`id_comuna`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `direccion`
--

LOCK TABLES `direccion` WRITE;
/*!40000 ALTER TABLE `direccion` DISABLE KEYS */;
INSERT INTO `direccion` VALUES (11,12,'Belisario Prats ','1450',101,'Depto 930'),(12,14,'Colina','23422',101,'Villa Patito'),(13,15,'Fernando Castillo','467',101,'Depto 12 Torre B'),(14,16,'Pajaritos','2345',401,'Casa Verde'),(15,17,'Brasil','2334',101,''),(16,18,'Calle Tres','3929',101,'Depto 402'),(17,19,'Argel','7473',101,''),(18,20,'ñuble','483',102,''),(19,21,'Toledo','3882',101,''),(20,23,'Belisario Prats ','3888',101,''),(21,25,'Las Margaritas','8348',101,''),(22,26,'Belisario Prats ','4477',101,'Depto 83'),(23,27,'Belisario Prats ','333',101,''),(24,28,'Las Margaritas','3882',101,''),(25,29,'Carahue','1452',101,''),(26,30,'Las Margaritas','3882',101,''),(27,32,'Los Alamos','9959',101,''),(28,33,'Calama','884',201,''),(29,34,'Pajaritos','85858',101,''),(30,35,'Puente Alto ','9990',101,'Depto 31A');
/*!40000 ALTER TABLE `direccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `envio`
--

DROP TABLE IF EXISTS `envio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `envio` (
  `id_envio` int NOT NULL AUTO_INCREMENT,
  `id_pedido` int DEFAULT NULL,
  `id_direccion` int DEFAULT NULL,
  `metodo_envio` varchar(50) DEFAULT NULL,
  `costo_envio` decimal(10,2) DEFAULT NULL,
  `estado_envio` varchar(50) DEFAULT NULL,
  `fecha_envio` timestamp NULL DEFAULT NULL,
  `fecha_entrega` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_envio`),
  KEY `id_pedido` (`id_pedido`),
  KEY `id_direccion` (`id_direccion`),
  CONSTRAINT `envio_ibfk_1` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id_pedido`),
  CONSTRAINT `envio_ibfk_2` FOREIGN KEY (`id_direccion`) REFERENCES `direccion` (`id_direccion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `envio`
--

LOCK TABLES `envio` WRITE;
/*!40000 ALTER TABLE `envio` DISABLE KEYS */;
/*!40000 ALTER TABLE `envio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `familia_producto`
--

DROP TABLE IF EXISTS `familia_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `familia_producto` (
  `id_familia` int NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text,
  PRIMARY KEY (`id_familia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `familia_producto`
--

LOCK TABLES `familia_producto` WRITE;
/*!40000 ALTER TABLE `familia_producto` DISABLE KEYS */;
INSERT INTO `familia_producto` VALUES (101,'Riego','Sistemas y accesorios de riego'),(102,'Sensores','Sensores de humedad, temperatura y clima'),(103,'Maquinaria','Equipos y maquinaria agrícola'),(104,'Herramientas','Herramientas manuales agrícolas'),(105,'Repuestos','Piezas de reemplazo para nustros productos'),(106,'Control de plagas','Productos para control de plagas y enfermedades'),(108,'Invernaderos','Estructuras y accesorios de invernadero'),(109,'Energía agrícola','Paneles solares y soluciones energéticas'),(110,'Dron','Drones de monitero de entorno y similares');
/*!40000 ALTER TABLE `familia_producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pago`
--

DROP TABLE IF EXISTS `pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pago` (
  `id_pago` int NOT NULL AUTO_INCREMENT,
  `id_pedido` int DEFAULT NULL,
  `metodo_pago` varchar(50) DEFAULT NULL,
  `estado_pago` varchar(50) DEFAULT NULL,
  `monto` decimal(10,2) DEFAULT NULL,
  `fecha_pago` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_pago`),
  KEY `id_pedido` (`id_pedido`),
  CONSTRAINT `pago_ibfk_1` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id_pedido`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pago`
--

LOCK TABLES `pago` WRITE;
/*!40000 ALTER TABLE `pago` DISABLE KEYS */;
/*!40000 ALTER TABLE `pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido`
--

DROP TABLE IF EXISTS `pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido` (
  `id_pedido` int NOT NULL AUTO_INCREMENT,
  `id_cliente` int DEFAULT NULL,
  `fecha` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `total` decimal(10,2) DEFAULT NULL,
  `estado` varchar(50) DEFAULT 'pendiente',
  `tipo_pedido` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_pedido`),
  KEY `id_cliente` (`id_cliente`),
  CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido`
--

LOCK TABLES `pedido` WRITE;
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
INSERT INTO `pedido` VALUES (11,12,'2026-05-18 15:40:39',367920.00,'pagado','cliente_web'),(12,14,'2026-05-18 15:56:28',279960.00,'pagado','cliente_web'),(13,15,'2026-05-18 16:05:01',413910.00,'pagado','cliente_web'),(14,16,'2026-05-18 16:15:28',199750.00,'pagado','cliente_web'),(15,17,'2026-05-18 16:19:20',1249950.00,'pagado','cliente_web'),(16,18,'2026-05-18 16:21:50',349950.00,'rechazado','cliente_web'),(17,19,'2026-05-18 19:48:30',749970.00,'pagado','cliente_web'),(18,20,'2026-05-18 19:53:10',349950.00,'pagado','cliente_web'),(19,21,'2026-05-18 21:35:16',799900.00,'pendiente_pago','cliente_web'),(20,23,'2026-05-18 21:36:22',799900.00,'pendiente_pago','cliente_web'),(21,25,'2026-05-18 21:37:44',91980.00,'pagado','cliente_web'),(22,26,'2026-05-18 21:42:11',2312034.00,'pagado','cliente_web'),(23,27,'2026-05-19 01:18:48',799900.00,'pendiente_pago','cliente_web'),(24,28,'2026-05-19 01:22:31',100.00,'pagado','cliente_web'),(25,29,'2026-05-25 21:42:05',639920.00,'pagado','cliente_web'),(26,30,'2026-05-28 20:51:42',137970.00,'pendiente_pago','cliente_web'),(27,32,'2026-05-28 21:08:53',137970.00,'pagado','venta_vendedor'),(28,33,'2026-05-28 22:00:53',31317600.00,'pagado','venta_vendedor'),(29,34,'2026-05-28 22:03:15',699900.00,'pagado','venta_vendedor'),(30,35,'2026-05-28 22:05:16',137970.00,'pagado','cliente_web');
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto` (
  `id_producto` int NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `descripcion` text,
  `precio` decimal(10,2) NOT NULL,
  `id_familia` int DEFAULT NULL,
  `moneda` varchar(3) NOT NULL DEFAULT 'CLP',
  PRIMARY KEY (`id_producto`),
  KEY `id_familia` (`id_familia`),
  CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`id_familia`) REFERENCES `familia_producto` (`id_familia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (1001,'Sistema de riego por goteo RG100W','Kit básico de riego',100.00,101,'CLP'),(1002,'Controlador de riego inteligente CR200B','Control automático de riego',249990.00,101,'CLP'),(1003,'Aspersor agrícola AP300S','Aspersor de cobertura media',45990.00,101,'CLP'),(1004,'Válvula de riego VR400W','Control de flujo de agua',32990.00,101,'CLP'),(1005,'Sensor de humedad SH500B','Medición de humedad de suelo',79990.00,102,'CLP'),(1006,'Sensor de temperatura ST600S','Medición ambiental',69990.00,102,'CLP'),(1007,'Sensor climático SC700W','Datos climáticos básicos',149990.00,102,'CLP'),(1008,'Sensor de pH SP800B','Medición de pH del suelo',119990.00,102,'CLP'),(1009,'Tractor agrícola TA900B','Maquinaria de trabajo pesado',15000.00,103,'USD'),(1010,'Pulverizador automático PA910S','Aplicación de líquidos',800.00,103,'USD'),(1011,'Cosechadora compacta CC920W','Cosecha eficiente',12000.00,103,'USD'),(1012,'Motocultivador MC930B','Preparación de suelo',950.00,103,'USD'),(1013,'Pala agrícola PA100W','Herramienta manual',12990.00,104,'CLP'),(1014,'Azadón AZ110B','Trabajo de suelo',15990.00,104,'CLP'),(1015,'Tijera de poda TP120S','Corte de ramas',18990.00,104,'CLP'),(1016,'Rastrillo RA130W','Limpieza de terreno',9990.00,104,'CLP'),(1017,'Filtro de riego FR140B','Repuesto sistema riego',7990.00,105,'CLP'),(1018,'Bomba de agua BA150S','Repuesto hidráulico',89990.00,105,'CLP'),(1019,'Manguera agrícola MA160W','Conducción de agua',24990.00,105,'CLP'),(1020,'Conector de válvula CV170B','Unión de sistemas',4990.00,105,'CLP'),(1021,'Insecticida agrícola IA180S','Control de insectos',14990.00,106,'CLP'),(1022,'Fungicida agrícola FA190W','Control de hongos',16990.00,106,'CLP'),(1023,'Trampa para insectos TI200B','Captura de plagas',7990.00,106,'CLP'),(1024,'Repelente natural RN210S','Protección básica',9990.00,106,'CLP'),(1025,'Estructura de invernadero EI220W','Base de invernadero',2000.00,108,'USD'),(1026,'Cubierta plástica CP230S','Protección de cultivos',89990.00,108,'CLP'),(1027,'Sistema de ventilación SV240B','Control de aire',300.00,108,'USD'),(1028,'Puerta de invernadero PI250W','Acceso estructural',119990.00,108,'CLP'),(1029,'Panel solar agrícola PS260S','Generación de energía',500.00,109,'USD'),(1030,'Batería solar BS270B','Almacenamiento energía',350.00,109,'USD'),(1031,'Inversor solar IS280W','Conversión eléctrica',400.00,109,'USD'),(1032,'Controlador solar CS290S','Gestión de carga',220.00,109,'USD'),(1033,'Dron agrícola DA300B','Monitoreo de cultivos',2500.00,110,'USD'),(1034,'Dron fumigador DF310S','Aplicación aérea',3200.00,110,'USD'),(1035,'Dron de inspección DI320W','Supervisión aérea',2100.00,110,'USD'),(1036,'Dron multiespectral DM330B','Análisis avanzado',4000.00,110,'USD');
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `region`
--

DROP TABLE IF EXISTS `region`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `region` (
  `id_region` int NOT NULL,
  `nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`id_region`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `region`
--

LOCK TABLES `region` WRITE;
/*!40000 ALTER TABLE `region` DISABLE KEYS */;
INSERT INTO `region` VALUES (1,'Metropolitana'),(2,'O Higgins'),(3,'Maule'),(4,'Ñuble'),(5,'Biobío');
/*!40000 ALTER TABLE `region` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock`
--

DROP TABLE IF EXISTS `stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock` (
  `id_producto` int NOT NULL,
  `id_sucursal` int NOT NULL,
  `cantidad` int NOT NULL,
  `stock_minimo` int NOT NULL,
  `ultima_actualizacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_producto`,`id_sucursal`),
  KEY `id_sucursal` (`id_sucursal`),
  CONSTRAINT `stock_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`),
  CONSTRAINT `stock_ibfk_2` FOREIGN KEY (`id_sucursal`) REFERENCES `sucursal` (`id_sucursal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock`
--

LOCK TABLES `stock` WRITE;
/*!40000 ALTER TABLE `stock` DISABLE KEYS */;
INSERT INTO `stock` VALUES (1001,1,9,5,'2026-05-19 01:24:03'),(1001,5,3,5,'2026-05-14 22:03:55'),(1001,6,5,5,'2026-05-18 15:38:47'),(1002,1,5,3,'2026-05-18 16:19:48'),(1002,2,3,3,'2026-05-18 19:49:00'),(1002,5,2,3,'2026-05-14 21:07:41'),(1003,3,8,8,'2026-05-28 22:05:48'),(1003,6,8,8,'2026-05-18 21:38:10'),(1004,1,25,10,'2026-05-14 21:07:41'),(1004,7,12,10,'2026-05-14 21:07:41'),(1005,2,9,4,'2026-05-25 21:42:40'),(1005,5,4,4,'2026-05-25 21:42:40'),(1005,9,3,4,'2026-05-14 21:07:41'),(1006,2,3,4,'2026-05-28 21:40:38'),(1006,8,55,4,'2026-05-28 22:02:19'),(1007,1,5,2,'2026-05-14 21:07:41'),(1007,6,2,2,'2026-05-14 21:07:41'),(1007,9,0,2,'2026-05-14 21:07:41'),(1008,3,2,2,'2026-05-14 22:06:17'),(1008,7,5,2,'2026-05-18 15:38:39'),(1009,5,1,1,'2026-05-14 21:07:41'),(1009,6,1,1,'2026-05-14 21:07:41'),(1010,5,1,1,'2026-05-18 21:42:39'),(1010,8,2,1,'2026-05-14 21:07:41'),(1011,6,1,1,'2026-05-14 21:07:41'),(1012,7,1,1,'2026-05-18 21:42:39'),(1012,9,1,1,'2026-05-14 21:07:41'),(1013,1,30,10,'2026-05-14 21:07:41'),(1013,5,12,10,'2026-05-14 21:07:41'),(1014,1,18,6,'2026-05-14 21:07:41'),(1014,6,9,6,'2026-05-14 21:07:41'),(1015,2,12,8,'2026-05-28 21:40:47'),(1015,8,5,8,'2026-05-14 21:07:41'),(1016,3,16,6,'2026-05-14 21:07:41'),(1016,7,0,6,'2026-05-14 21:07:41'),(1017,1,15,15,'2026-05-18 16:16:00'),(1017,5,18,15,'2026-05-14 21:07:41'),(1018,5,6,2,'2026-05-14 21:07:41'),(1018,6,4,2,'2026-05-14 21:07:41'),(1019,2,12,4,'2026-05-14 21:07:41'),(1019,9,3,4,'2026-05-14 21:07:41'),(1020,3,25,10,'2026-05-14 21:07:41'),(1021,5,10,4,'2026-05-14 21:07:41'),(1021,8,4,4,'2026-05-14 21:07:41'),(1022,6,8,3,'2026-05-14 21:07:41'),(1022,9,2,3,'2026-05-14 21:07:41'),(1023,1,14,5,'2026-05-14 21:07:41'),(1023,7,5,5,'2026-05-14 21:07:41'),(1024,2,11,4,'2026-05-14 21:07:41'),(1024,8,0,4,'2026-05-14 21:07:41'),(1025,5,2,1,'2026-05-14 21:07:41'),(1026,6,4,1,'2026-05-14 21:07:41'),(1027,7,3,1,'2026-05-14 21:07:41'),(1028,8,1,1,'2026-05-28 21:43:28'),(1029,1,5,2,'2026-05-14 21:07:41'),(1029,9,2,2,'2026-05-14 21:07:41'),(1030,2,103,2,'2026-05-28 21:59:44'),(1031,3,3,1,'2026-05-14 21:07:41'),(1032,5,6,2,'2026-05-14 21:07:41'),(1033,5,1,1,'2026-05-14 21:07:41'),(1034,6,1,1,'2026-05-14 21:07:41'),(1035,8,1,1,'2026-05-14 21:07:41'),(1036,9,10,1,'2026-05-28 21:48:49');
/*!40000 ALTER TABLE `stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sucursal`
--

DROP TABLE IF EXISTS `sucursal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sucursal` (
  `id_sucursal` int NOT NULL,
  `nombre_sucursal` varchar(100) DEFAULT NULL,
  `id_comuna` int DEFAULT NULL,
  PRIMARY KEY (`id_sucursal`),
  KEY `id_comuna` (`id_comuna`),
  CONSTRAINT `sucursal_ibfk_1` FOREIGN KEY (`id_comuna`) REFERENCES `comuna` (`id_comuna`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sucursal`
--

LOCK TABLES `sucursal` WRITE;
/*!40000 ALTER TABLE `sucursal` DISABLE KEYS */;
INSERT INTO `sucursal` VALUES (1,'Sucursal Santiago Centro',NULL),(2,'Sucursal Providencia',NULL),(3,'Sucursal Las Condes',NULL),(4,'Sucursal Maipú',NULL),(5,'Sucursal Rancagua',NULL),(6,'Sucursal Talca',NULL),(7,'Sucursal Chillán',NULL),(8,'Sucursal Los Ángeles',NULL),(9,'Sucursal Temuco',NULL);
/*!40000 ALTER TABLE `sucursal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `password` varchar(255) NOT NULL,
  `rol` varchar(50) NOT NULL,
  `id_sucursal` int DEFAULT NULL,
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `email` (`email`),
  KEY `fk_usuario_sucursal` (`id_sucursal`),
  CONSTRAINT `fk_usuario_sucursal` FOREIGN KEY (`id_sucursal`) REFERENCES `sucursal` (`id_sucursal`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'Administrador Logistica','logistica@agrosmart.cl','1234','logistica',NULL),(2,'Vendedor AGROSMART','vendedor@agrosmart.cl','1234','vendedor',NULL),(5,'Logistica Santiago Centro','logSantiagoCentro@agrosmart.cl','1234','logistica',1),(6,'Logistica Providencia','logProvidencia@agrosmart.cl','1234','logistica',2),(7,'Logistica Las Condes','logLasCondes@agrosmart.cl','1234','logistica',3),(8,'Logistica Maipu','logMaipu@agrosmart.cl','1234','logistica',4),(9,'Logistica Rancagua','logRancagua@agrosmart.cl','1234','logistica',5),(10,'Logistica Talca','logTalca@agrosmart.cl','1234','logistica',6),(11,'Logistica Chillan','logChillan@agrosmart.cl','1234','logistica',7),(12,'Logistica Los Angeles','logLosAngeles@agrosmart.cl','1234','logistica',8),(13,'Logistica Temuco','logTemuco@agrosmart.cl','1234','logistica',9),(14,'Cobranzas AGROSMART','cobranzas@agrosmart.cl','1234','cobranzas',NULL);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-06-09 18:10:41
