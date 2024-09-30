-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.12-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Dumping structure for table v2_prep_tenant_db.common_document_drawer_name
DROP TABLE IF EXISTS `common_document_drawer_name`;
CREATE TABLE IF NOT EXISTS `common_document_drawer_name` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `drawer_name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Dumping data for table v2_prep_tenant_db.common_document_drawer_name: ~0 rows (approximately)
/*!40000 ALTER TABLE `common_document_drawer_name` DISABLE KEYS */;
INSERT INTO `common_document_drawer_name` (`id`, `drawer_name`) VALUES
	(1, 'BILL_PO_LIST_MODAL');
/*!40000 ALTER TABLE `common_document_drawer_name` ENABLE KEYS */;

-- Dumping structure for table v2_prep_tenant_db.common_document_drawer_visibility_user_wise
DROP TABLE IF EXISTS `common_document_drawer_visibility_user_wise`;
CREATE TABLE IF NOT EXISTS `common_document_drawer_visibility_user_wise` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(100) NOT NULL,
  `visibility` tinyint(1) NOT NULL,
  `drawer_id` int(15) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK__modal_visibility_user_wise_modal_template` (`drawer_id`) USING BTREE,
  CONSTRAINT `FK__drawer_visibility_user_wise_drawer_name` FOREIGN KEY (`drawer_id`) REFERENCES `common_document_drawer_name` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table v2_prep_tenant_db.common_document_drawer_visibility_user_wise: ~0 rows (approximately)
/*!40000 ALTER TABLE `common_document_drawer_visibility_user_wise` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_document_drawer_visibility_user_wise` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
