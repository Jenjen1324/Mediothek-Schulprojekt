DROP TABLE IF EXISTS `mediothek`;
CREATE DATABASE  IF NOT EXISTS `mediothek` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `mediothek`;

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
DROP TABLE IF EXISTS `addressen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `addressen` (
  `id_adressen` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `strasse` varchar(45) NOT NULL,
  `nummer` varchar(45) NOT NULL,
  `fk_orte` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id_adressen`),
  KEY `fk_addressen_orte_idx` (`fk_orte`),
  CONSTRAINT `fk_addressen_orte` FOREIGN KEY (`fk_orte`) REFERENCES `orte` (`id_orte`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=501 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ausleihen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ausleihen` (
  `id_ausleihen` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `fk_kunden` bigint(20) unsigned NOT NULL,
  `fk_mitarbeiter` bigint(20) unsigned NOT NULL,
  `fk_exemplare` bigint(20) unsigned NOT NULL,
  `ausleihedatum` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ruckgabedatum` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `erfolgtes_ruckgabedatum` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_ausleihen`),
  KEY `fk_ausleihen_exemplare_idx` (`fk_exemplare`),
  KEY `fk_ausleihen_kunden_idx` (`fk_kunden`),
  KEY `fk_ausleihen_mitarbeiter_idx` (`fk_mitarbeiter`),
  CONSTRAINT `fk_ausleihen_exemplare` FOREIGN KEY (`fk_exemplare`) REFERENCES `exemplare` (`id_exemplare`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ausleihen_kunden` FOREIGN KEY (`fk_kunden`) REFERENCES `kunden` (`id_kunde`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ausleihen_mitarbeiter` FOREIGN KEY (`fk_mitarbeiter`) REFERENCES `mitarbeiter` (`id_mitarbeiter`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=441 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `autoren`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `autoren` (
  `id_autoren` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `vorname` varchar(45) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `geburtsdatum` timestamp NULL DEFAULT NULL,
  `fk_orte` bigint(20) unsigned DEFAULT NULL,
  `fk_land` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id_autoren`),
  KEY `fk_autoren_land_idx` (`fk_land`),
  KEY `fk_autoren_orte_idx` (`fk_orte`),
  CONSTRAINT `fk_autoren_land` FOREIGN KEY (`fk_land`) REFERENCES `land` (`id_land`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_autoren_orte` FOREIGN KEY (`fk_orte`) REFERENCES `orte` (`id_orte`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `exemplare`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exemplare` (
  `id_exemplare` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `fk_verlag` bigint(20) unsigned NOT NULL,
  `fk_medien` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id_exemplare`),
  KEY `fk_exemplare_verlag_idx` (`fk_verlag`),
  KEY `fk_exemplare_medien_idx` (`fk_medien`),
  CONSTRAINT `fk_exemplare_medien` FOREIGN KEY (`fk_medien`) REFERENCES `medien` (`id_medien`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_exemplare_verlag` FOREIGN KEY (`fk_verlag`) REFERENCES `verlag` (`id_verlag`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=896 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `feedbacks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feedbacks` (
  `id_feedbacks` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `fk_kunden` bigint(20) unsigned NOT NULL,
  `datum` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `feedback` text NOT NULL,
  PRIMARY KEY (`id_feedbacks`),
  KEY `fk_feedbacks_kunden_idx` (`fk_kunden`),
  CONSTRAINT `fk_feedbacks_kunden` FOREIGN KEY (`fk_kunden`) REFERENCES `kunden` (`id_kunde`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `genres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `genres` (
  `id_genres` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `genre` varchar(45) NOT NULL,
  PRIMARY KEY (`id_genres`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `kunden`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kunden` (
  `id_kunde` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `mitglied_datum` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `name` varchar(45) NOT NULL,
  `vorname` varchar(45) NOT NULL,
  `geburtsdatum` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `email` varchar(255) NOT NULL,
  `fk_addressen` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id_kunde`),
  KEY `fk_kunden_addressen_idx` (`fk_addressen`),
  CONSTRAINT `fk_kunden_addressen` FOREIGN KEY (`fk_addressen`) REFERENCES `addressen` (`id_adressen`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=301 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `land`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `land` (
  `id_land` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `landsname` varchar(255) NOT NULL,
  PRIMARY KEY (`id_land`)
) ENGINE=InnoDB AUTO_INCREMENT=251 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `medien`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medien` (
  `id_medien` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `fk_medium_typ` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `album` varchar(45) DEFAULT NULL,
  `isbn` varchar(45) DEFAULT NULL,
  `seitenzahl` int(10) unsigned DEFAULT NULL,
  `publikations_datum` timestamp NULL DEFAULT NULL,
  `dauer` int(11) DEFAULT NULL,
  `altersbegrenzung` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_medien`),
  KEY `fk_medientyp_idx` (`fk_medium_typ`),
  CONSTRAINT `fk_medientyp` FOREIGN KEY (`fk_medium_typ`) REFERENCES `medium_typen` (`id_medium_typen`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=301 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `medien_autoren`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medien_autoren` (
  `id_medien_autoren` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `fk_medien` bigint(20) unsigned NOT NULL,
  `fk_autoren` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id_medien_autoren`),
  KEY `fk_medien_autoren_1_idx` (`fk_medien`),
  KEY `fk_medien_autoren_2_idx` (`fk_autoren`),
  CONSTRAINT `fk_medien_autoren_1` FOREIGN KEY (`fk_medien`) REFERENCES `medien` (`id_medien`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_medien_autoren_2` FOREIGN KEY (`fk_autoren`) REFERENCES `autoren` (`id_autoren`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=334 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `medien_genres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medien_genres` (
  `id_medien_genres` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `fk_medien` bigint(20) unsigned NOT NULL,
  `fk_genres` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id_medien_genres`),
  KEY `fk_medien_genres_1_idx` (`fk_medien`),
  KEY `fk_medien_genres_2_idx` (`fk_genres`),
  CONSTRAINT `fk_medien_genres_1` FOREIGN KEY (`fk_medien`) REFERENCES `medien` (`id_medien`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_medien_genres_2` FOREIGN KEY (`fk_genres`) REFERENCES `genres` (`id_genres`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=301 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `medium_typen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medium_typen` (
  `id_medium_typen` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `typ_name` varchar(45) NOT NULL,
  PRIMARY KEY (`id_medium_typen`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `mitarbeiter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mitarbeiter` (
  `id_mitarbeiter` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `vorname` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `fk_addressen` bigint(20) unsigned NOT NULL,
  `fk_mitarbeiter_typ` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id_mitarbeiter`),
  KEY `fk_mitarbeiter_addressen_idx` (`fk_addressen`),
  KEY `fk_mitarbeiter_typ_idx` (`fk_mitarbeiter_typ`),
  CONSTRAINT `fk_mitarbeiter_typ` FOREIGN KEY (`fk_mitarbeiter_typ`) REFERENCES `mitarbeiter_typ` (`id_mitarbeiter_typ`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_mitarbeiter_addressen` FOREIGN KEY (`fk_addressen`) REFERENCES `addressen` (`id_adressen`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `mitarbeiter_typ`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mitarbeiter_typ` (
  `id_mitarbeiter_typ` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `mitarbeiter_typ_name` varchar(45) NOT NULL,
  PRIMARY KEY (`id_mitarbeiter_typ`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `orte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orte` (
  `id_orte` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `ortsname` varchar(255) NOT NULL,
  `ortsname_k` varchar(5) NOT NULL,
  `plz` int(11) NOT NULL,
  `fk_land` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id_orte`),
  KEY `fk_orte_land_idx` (`fk_land`),
  CONSTRAINT `fk_orte_land` FOREIGN KEY (`fk_land`) REFERENCES `land` (`id_land`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4176 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `verlag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `verlag` (
  `id_verlag` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `verlagsname` varchar(45) NOT NULL,
  PRIMARY KEY (`id_verlag`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
