/*
SQLyog Ultimate v9.63 
MySQL - 5.5.27 : Database - votalobotalo
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`votalobotalo` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci */;

USE `votalobotalo`;

/*Table structure for table `proyecto` */

DROP TABLE IF EXISTS `proyecto`;

CREATE TABLE `proyecto` (
  `idProyecto` int(255) NOT NULL AUTO_INCREMENT,
  `numeroExpediente` int(255) NOT NULL,
  `autor` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `coautores` text COLLATE utf8_spanish_ci NOT NULL,
  `descripcion` text COLLATE utf8_spanish_ci NOT NULL,
  `origen` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `tipo` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `bloque` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `entrada` date NOT NULL,
  PRIMARY KEY (`idProyecto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

/*Data for the table `proyecto` */

/*Table structure for table `usuario` */

DROP TABLE IF EXISTS `usuario`;

CREATE TABLE `usuario` (
  `idUsuario` int(255) NOT NULL AUTO_INCREMENT,
  `ip` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`idUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

/*Data for the table `usuario` */

/*Table structure for table `voto` */

DROP TABLE IF EXISTS `voto`;

CREATE TABLE `voto` (
  `idVoto` int(255) NOT NULL AUTO_INCREMENT,
  `voto` int(255) NOT NULL,
  `comentario` text COLLATE utf8_spanish_ci NOT NULL,
  `idProyecto_fk` int(255) NOT NULL,
  `idUsuario_fk` int(255) NOT NULL,
  PRIMARY KEY (`idVoto`),
  KEY `idProyecto_fk` (`idProyecto_fk`),
  KEY `idUsuario_fk` (`idUsuario_fk`),
  CONSTRAINT `voto_ibfk_1` FOREIGN KEY (`idProyecto_fk`) REFERENCES `proyecto` (`idProyecto`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `voto_ibfk_2` FOREIGN KEY (`idUsuario_fk`) REFERENCES `usuario` (`idUsuario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

/*Data for the table `voto` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
