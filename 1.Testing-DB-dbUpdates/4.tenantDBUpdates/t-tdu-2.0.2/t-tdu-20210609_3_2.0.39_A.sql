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

-- Dumping structure for table v2_prep_tenant_db.common_notification_message
DROP TABLE IF EXISTS `common_notification_message`;
CREATE TABLE IF NOT EXISTS `common_notification_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `notification_type_name` varchar(50) NOT NULL,
  `notification_type_id` int(11) NOT NULL,
  `notification_message` varchar(100) NOT NULL,
  `clickable` tinyint(4) NOT NULL,
  `event_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_common_message_notification_subscription_type` (`notification_type_id`),
  KEY `FK_common_notification_message_common_event` (`event_id`),
  CONSTRAINT `FK_common_message_notification_subscription_type` FOREIGN KEY (`notification_type_id`) REFERENCES `common_notification_subscription_type` (`id`),
  CONSTRAINT `FK_common_notification_message_common_event` FOREIGN KEY (`event_id`) REFERENCES `common_notification_subscription_event` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

-- Dumping data for table v2_prep_tenant_db.common_notification_message: ~15 rows (approximately)
/*!40000 ALTER TABLE `common_notification_message` DISABLE KEYS */;
INSERT INTO `common_notification_message` (`id`, `notification_type_name`, `notification_type_id`, `notification_message`, `clickable`, `event_id`) VALUES
	(1, 'Bill', 1, 'A bill is submitted for your approval', 1, 1),
	(2, 'Bill', 1, 'A bill you submitted is approved', 1, 2),
	(3, 'Bill', 1, 'A bill you submitted is rejected', 1, 3),
	(4, 'Bill', 1, 'A bill is submitted for your approval group', 1, 13),
	(5, 'Bill', 1, 'There are no users in an assigned approval group', 0, 14),
	(6, 'Expense', 4, 'An expense report is submitted for your approval', 1, 7),
	(7, 'Expense', 4, 'An expense report you submitted is approved', 1, 8),
	(8, 'Expense', 4, 'An expense report you submitted is rejected', 1, 9),
	(9, 'Expense', 4, 'An expense report is submitted for your approval group', 1, 17),
	(10, 'Expense', 4, 'There are no users in an assigned approval group', 0, 18),
	(11, 'Purchase order', 2, 'A purchase order is submitted for your approval', 1, 4),
	(12, 'Purchase order', 2, 'A purchase order you submitted is approved', 1, 5),
	(13, 'Purchase order', 2, 'A purchase order you submitted is rejected', 1, 6),
	(14, 'Purchase order', 2, 'A purchase order is submitted for your approval group', 1, 15),
	(15, 'Purchase order', 2, 'There are no users in an assigned approval group', 0, 16);
/*!40000 ALTER TABLE `common_notification_message` ENABLE KEYS */;

-- Dumping structure for table v2_prep_tenant_db.common_notification_mst
DROP TABLE IF EXISTS `common_notification_mst`;
CREATE TABLE IF NOT EXISTS `common_notification_mst` (
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


ALTER TABLE `vp_vendor_mst`
MODIFY COLUMN `contact_number` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '' AFTER `cc_email`;