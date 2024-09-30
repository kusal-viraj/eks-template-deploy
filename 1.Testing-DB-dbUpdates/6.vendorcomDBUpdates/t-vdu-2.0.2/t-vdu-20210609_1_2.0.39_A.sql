-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.12-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             11.2.0.6213
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Dumping structure for table v2_prep_vendor_db.vendor_notification_message
DROP TABLE IF EXISTS `vendor_notification_message`;
CREATE TABLE IF NOT EXISTS `vendor_notification_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `notification_type_name` varchar(50) NOT NULL,
  `notification_type_id` int(11) NOT NULL,
  `notification_message` varchar(100) NOT NULL,
  `clickable` tinyint(4) NOT NULL,
  `event_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_common_message_notification_subscription_type` (`notification_type_id`),
  KEY `FK_common_notification_message_common_event` (`event_id`),
  CONSTRAINT `FK_vendor_message_notification_subscription_type` FOREIGN KEY (`notification_type_id`) REFERENCES `vendor_notification_subscription_type` (`id`),
  CONSTRAINT `FK_vendor_notification_message_common_event` FOREIGN KEY (`event_id`) REFERENCES `vendor_notification_subscription_event` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Dumping data for table v2_prep_vendor_db.vendor_notification_message: ~3 rows (approximately)
/*!40000 ALTER TABLE `vendor_notification_message` DISABLE KEYS */;
INSERT INTO `vendor_notification_message` (`id`, `notification_type_name`, `notification_type_id`, `notification_message`, `clickable`, `event_id`) VALUES
	(1, 'INVOICE', 1, 'Invoice has approved ', 1, 3),
	(2, 'INVOICE', 1, 'Invoice has rejected', 1, 4),
	(3, 'Purchase Order', 2, 'Purchase Order has submitted for your approval', 1, 1);
/*!40000 ALTER TABLE `vendor_notification_message` ENABLE KEYS */;

-- Dumping structure for table v2_prep_vendor_db.vendor_notification_mst
DROP TABLE IF EXISTS `vendor_notification_mst`;
CREATE TABLE IF NOT EXISTS `vendor_notification_mst` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `description` varchar(100) NOT NULL,
  `reference_no` varchar(50) NOT NULL,
  `reference_id` int(11) NOT NULL,
  `reference_status` char(1) NOT NULL DEFAULT '',
  `clickable` tinyint(4) NOT NULL,
  `to_user` varchar(50) NOT NULL,
  `notification_type_id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `tenant_id` varchar(50) NOT NULL,
  `status` char(1) NOT NULL,
  `created_by` varchar(50) NOT NULL,
  `created_on` date NOT NULL,
  `update_by` varchar(50) DEFAULT NULL,
  `update_on` date DEFAULT NULL,
  `delete_by` varchar(50) DEFAULT NULL,
  `delete_on` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=latin1;

