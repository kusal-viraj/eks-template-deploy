-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.5.6-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping structure for table papertrl_default_script.ar_client_address
DROP TABLE IF EXISTS `ar_client_address`;
CREATE TABLE IF NOT EXISTS `ar_client_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address_line_1` varchar(75) DEFAULT NULL,
  `address_line_2` varchar(75) DEFAULT NULL,
  `client_mst_id` int(11) DEFAULT NULL,
  `city` varchar(200) DEFAULT '',
  `country` varchar(200) DEFAULT '',
  `address_state` varchar(200) DEFAULT '',
  `zipcode` varchar(30) DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `FK5539bpkljsmqi7ww9wq6w3v76` (`client_mst_id`) USING BTREE,
  CONSTRAINT `CLINET_ID_FK_1` FOREIGN KEY (`client_mst_id`) REFERENCES `ar_client_mst` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table papertrl_default_script.ar_client_address: ~0 rows (approximately)
/*!40000 ALTER TABLE `ar_client_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `ar_client_address` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.ar_client_category
DROP TABLE IF EXISTS `ar_client_category`;
CREATE TABLE IF NOT EXISTS `ar_client_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(70) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Dumping data for table papertrl_default_script.ar_client_category: ~4 rows (approximately)
/*!40000 ALTER TABLE `ar_client_category` DISABLE KEYS */;
INSERT INTO `ar_client_category` (`id`, `name`) VALUES
	(1, 'Commercial'),
	(2, 'Federal'),
	(3, 'J_Ventures'),
	(4, 'State');
/*!40000 ALTER TABLE `ar_client_category` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.ar_client_mst
DROP TABLE IF EXISTS `ar_client_mst`;
CREATE TABLE IF NOT EXISTS `ar_client_mst` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `contact_number` varchar(20) NOT NULL,
  `fax` varchar(20) DEFAULT NULL,
  `contact_person` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `status` char(1) NOT NULL,
  `created_by` varchar(100) NOT NULL,
  `created_on` datetime NOT NULL,
  `update_by` varchar(100) DEFAULT '',
  `update_on` datetime DEFAULT NULL,
  `delete_by` varchar(100) DEFAULT '',
  `delete_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_CATEG_ID` (`category`) USING BTREE,
  CONSTRAINT `FK_CATEG_ID` FOREIGN KEY (`category`) REFERENCES `ar_client_category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table papertrl_default_script.ar_client_mst: ~0 rows (approximately)
/*!40000 ALTER TABLE `ar_client_mst` DISABLE KEYS */;
/*!40000 ALTER TABLE `ar_client_mst` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.ar_contract_type
DROP TABLE IF EXISTS `ar_contract_type`;
CREATE TABLE IF NOT EXISTS `ar_contract_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

-- Dumping data for table papertrl_default_script.ar_contract_type: ~10 rows (approximately)
/*!40000 ALTER TABLE `ar_contract_type` DISABLE KEYS */;
INSERT INTO `ar_contract_type` (`id`, `name`, `status`) VALUES
	(1, 'Fixed Price', 'A'),
	(2, 'IDIQ', 'A'),
	(3, 'Cost Reimbursement', 'A'),
	(4, 'Incentive', 'A'),
	(5, 'Time and Materials', 'A'),
	(6, 'Labor-Hour', 'A'),
	(7, 'Sealed Bidding', 'A'),
	(8, 'Negotiation', 'A'),
	(9, 'Reverse Auction', 'A'),
	(10, 'Sole Source', 'A');
/*!40000 ALTER TABLE `ar_contract_type` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.ar_division
DROP TABLE IF EXISTS `ar_division`;
CREATE TABLE IF NOT EXISTS `ar_division` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `product_line_id` int(11) NOT NULL,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1_PRODUCT_LINE` (`product_line_id`),
  CONSTRAINT `FK1_PRODUCT_LINE` FOREIGN KEY (`product_line_id`) REFERENCES `ar_product_line` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- Dumping data for table papertrl_default_script.ar_division: ~6 rows (approximately)
/*!40000 ALTER TABLE `ar_division` DISABLE KEYS */;
INSERT INTO `ar_division` (`id`, `name`, `product_line_id`, `status`) VALUES
	(1, 'Construction', 1, 'A'),
	(2, 'Facilities', 1, 'A'),
	(3, 'Environmental', 2, 'A'),
	(4, 'Industrial Hygiene', 2, 'A'),
	(5, 'Radiological', 2, 'A'),
	(6, 'Drilling', 2, 'A');
/*!40000 ALTER TABLE `ar_division` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.ar_oppartunity_project_location_info
DROP TABLE IF EXISTS `ar_oppartunity_project_location_info`;
CREATE TABLE IF NOT EXISTS `ar_oppartunity_project_location_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `opportunity_id` int(11) NOT NULL,
  `location_type_id` int(11) NOT NULL,
  `address` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1_OPPORTUNITY_ID_2` (`opportunity_id`),
  KEY `FK2_LOCATION_TYPE_ID` (`location_type_id`),
  CONSTRAINT `FK1_OPPORTUNITY_ID_2` FOREIGN KEY (`opportunity_id`) REFERENCES `ar_opportunity` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FK2_LOCATION_TYPE_ID` FOREIGN KEY (`location_type_id`) REFERENCES `ar_type_of_location` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table papertrl_default_script.ar_oppartunity_project_location_info: ~0 rows (approximately)
/*!40000 ALTER TABLE `ar_oppartunity_project_location_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `ar_oppartunity_project_location_info` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.ar_opportunity
DROP TABLE IF EXISTS `ar_opportunity`;
CREATE TABLE IF NOT EXISTS `ar_opportunity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client` varchar(150) NOT NULL,
  `opportunity_name` varchar(150) NOT NULL,
  `solicitation_no` varchar(20) DEFAULT NULL,
  `opportunity_source_id` int(11) NOT NULL,
  `url` varchar(200) DEFAULT NULL,
  `naics_code` varchar(100) DEFAULT NULL,
  `opportunity_type_id` int(11) NOT NULL,
  `contract_type` int(11) DEFAULT NULL,
  `due_date` date NOT NULL,
  `contract_value` decimal(10,2) NOT NULL DEFAULT 0.00,
  `notes` varchar(300) DEFAULT NULL,
  `cc_list` varchar(1000) DEFAULT NULL,
  `created_by` varchar(100) NOT NULL,
  `created_on` date NOT NULL,
  `update_by` varchar(100) DEFAULT NULL,
  `update_on` date DEFAULT NULL,
  `delete_by` varchar(100) DEFAULT '',
  `delete_on` date DEFAULT NULL,
  `status` char(1) NOT NULL,
  `approved_by` varchar(100) DEFAULT '',
  `approved_date` date DEFAULT NULL,
  `first_level_approver` varchar(100) DEFAULT '',
  `workflow_id` int(11) DEFAULT NULL,
  `workflow_level` int(11) DEFAULT NULL,
  `no_of_levels` int(3) DEFAULT NULL,
  `approval_group_level` int(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1_OPPORTUNITY_SOURCE` (`opportunity_source_id`),
  KEY `FK2_OPPORTUNITY_TYPE` (`opportunity_type_id`),
  KEY `FK3_CONTRACT_TYPE_01` (`contract_type`),
  CONSTRAINT `FK1_OPPORTUNITY_SOURCE` FOREIGN KEY (`opportunity_source_id`) REFERENCES `ar_opportunity_source` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FK2_OPPORTUNITY_TYPE` FOREIGN KEY (`opportunity_type_id`) REFERENCES `ar_opportunity_type` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FK3_CONTRACT_TYPE_01` FOREIGN KEY (`contract_type`) REFERENCES `ar_contract_type` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table papertrl_default_script.ar_opportunity: ~0 rows (approximately)
/*!40000 ALTER TABLE `ar_opportunity` DISABLE KEYS */;
/*!40000 ALTER TABLE `ar_opportunity` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.ar_opportunity_additional_data
DROP TABLE IF EXISTS `ar_opportunity_additional_data`;
CREATE TABLE IF NOT EXISTS `ar_opportunity_additional_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field_value` varchar(200) DEFAULT NULL,
  `field_id` int(15) NOT NULL,
  `field_name` varchar(50) NOT NULL,
  `opportunity_mst_id` int(15) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK__ar_opportunity` (`opportunity_mst_id`),
  CONSTRAINT `FK__ar_opportunity` FOREIGN KEY (`opportunity_mst_id`) REFERENCES `ar_opportunity` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table papertrl_default_script.ar_opportunity_additional_data: ~0 rows (approximately)
/*!40000 ALTER TABLE `ar_opportunity_additional_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `ar_opportunity_additional_data` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.ar_opportunity_attachment
DROP TABLE IF EXISTS `ar_opportunity_attachment`;
CREATE TABLE IF NOT EXISTS `ar_opportunity_attachment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `oportunity_id` int(11) NOT NULL,
  `attachment_type_id` int(11) NOT NULL,
  `attachment_url` varchar(200) NOT NULL,
  `file_name` varchar(200) DEFAULT NULL,
  `file_type` varchar(30) DEFAULT NULL,
  `status` char(1) NOT NULL,
  `delete_by` varchar(100) DEFAULT '',
  `delete_on` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1_OPPOTUNITY_ID_6` (`oportunity_id`),
  KEY `FK2_ATTACHMENT_TYPE_1` (`attachment_type_id`),
  CONSTRAINT `FK1_OPPOTUNITY_ID_6` FOREIGN KEY (`oportunity_id`) REFERENCES `ar_opportunity` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FK2_ATTACHMENT_TYPE_1` FOREIGN KEY (`attachment_type_id`) REFERENCES `common_attachment_type` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table papertrl_default_script.ar_opportunity_attachment: ~0 rows (approximately)
/*!40000 ALTER TABLE `ar_opportunity_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `ar_opportunity_attachment` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.ar_opportunity_audit_trial
DROP TABLE IF EXISTS `ar_opportunity_audit_trial`;
CREATE TABLE IF NOT EXISTS `ar_opportunity_audit_trial` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_date` datetime NOT NULL,
  `status_id` int(11) NOT NULL,
  `user_id` varchar(50) NOT NULL,
  `user_name` varchar(200) NOT NULL,
  `comment` varchar(300) DEFAULT NULL,
  `opportunity_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK2_OPPORTUNITY_ID` (`opportunity_id`),
  KEY `FK1_OPPORTUNITY_STATUS_ID` (`status_id`),
  CONSTRAINT `FK1_OPPORTUNITY_STATUS_ID` FOREIGN KEY (`status_id`) REFERENCES `common_audit_trial_status` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FK2_OPPORTUNITY_ID` FOREIGN KEY (`opportunity_id`) REFERENCES `ar_opportunity` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table papertrl_default_script.ar_opportunity_audit_trial: ~0 rows (approximately)
/*!40000 ALTER TABLE `ar_opportunity_audit_trial` DISABLE KEYS */;
/*!40000 ALTER TABLE `ar_opportunity_audit_trial` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.ar_opportunity_internal_info
DROP TABLE IF EXISTS `ar_opportunity_internal_info`;
CREATE TABLE IF NOT EXISTS `ar_opportunity_internal_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `opportunity_id` int(11) NOT NULL,
  `product_line_id` int(11) NOT NULL,
  `divition_id` int(11) NOT NULL,
  `type_of_work_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1_OPPORTUNITY_ID_3` (`opportunity_id`),
  KEY `FK2_PRODUCT_LINE_2` (`product_line_id`),
  KEY `FK3_DIVITION` (`divition_id`),
  KEY `FK4_TYPE_OF_WORK` (`type_of_work_id`),
  CONSTRAINT `FK1_OPPORTUNITY_ID_3` FOREIGN KEY (`opportunity_id`) REFERENCES `ar_opportunity` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FK2_PRODUCT_LINE_2` FOREIGN KEY (`product_line_id`) REFERENCES `ar_product_line` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FK3_DIVITION` FOREIGN KEY (`divition_id`) REFERENCES `ar_division` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FK4_TYPE_OF_WORK` FOREIGN KEY (`type_of_work_id`) REFERENCES `ar_type_of_work` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table papertrl_default_script.ar_opportunity_internal_info: ~0 rows (approximately)
/*!40000 ALTER TABLE `ar_opportunity_internal_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `ar_opportunity_internal_info` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.ar_opportunity_size_standard_info
DROP TABLE IF EXISTS `ar_opportunity_size_standard_info`;
CREATE TABLE IF NOT EXISTS `ar_opportunity_size_standard_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `opportunity_id` int(11) NOT NULL,
  `set_aside_id` int(11) NOT NULL,
  `size_standard` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1_OPPORTUNITY_ID` (`opportunity_id`),
  KEY `FK2_SET_ASIDE` (`set_aside_id`),
  CONSTRAINT `FK1_OPPORTUNITY_ID` FOREIGN KEY (`opportunity_id`) REFERENCES `ar_opportunity` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FK2_SET_ASIDE` FOREIGN KEY (`set_aside_id`) REFERENCES `ar_set_aside` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table papertrl_default_script.ar_opportunity_size_standard_info: ~0 rows (approximately)
/*!40000 ALTER TABLE `ar_opportunity_size_standard_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `ar_opportunity_size_standard_info` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.ar_opportunity_source
DROP TABLE IF EXISTS `ar_opportunity_source`;
CREATE TABLE IF NOT EXISTS `ar_opportunity_source` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Dumping data for table papertrl_default_script.ar_opportunity_source: ~2 rows (approximately)
/*!40000 ALTER TABLE `ar_opportunity_source` DISABLE KEYS */;
INSERT INTO `ar_opportunity_source` (`id`, `name`, `status`) VALUES
	(1, 'FBO', 'A'),
	(2, 'GovWin', 'A');
/*!40000 ALTER TABLE `ar_opportunity_source` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.ar_opportunity_type
DROP TABLE IF EXISTS `ar_opportunity_type`;
CREATE TABLE IF NOT EXISTS `ar_opportunity_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Dumping data for table papertrl_default_script.ar_opportunity_type: ~3 rows (approximately)
/*!40000 ALTER TABLE `ar_opportunity_type` DISABLE KEYS */;
INSERT INTO `ar_opportunity_type` (`id`, `name`, `status`) VALUES
	(1, 'Solicitation', 'A'),
	(2, 'Sources Sought', 'A'),
	(3, 'Pre-solicitation', 'A');
/*!40000 ALTER TABLE `ar_opportunity_type` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.ar_partnership_type
DROP TABLE IF EXISTS `ar_partnership_type`;
CREATE TABLE IF NOT EXISTS `ar_partnership_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Dumping data for table papertrl_default_script.ar_partnership_type: ~3 rows (approximately)
/*!40000 ALTER TABLE `ar_partnership_type` DISABLE KEYS */;
INSERT INTO `ar_partnership_type` (`id`, `name`, `status`) VALUES
	(1, 'Tidewater', 'A'),
	(2, 'Joint Venture', 'A'),
	(3, 'Teaming ', 'A');
/*!40000 ALTER TABLE `ar_partnership_type` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.ar_product_line
DROP TABLE IF EXISTS `ar_product_line`;
CREATE TABLE IF NOT EXISTS `ar_product_line` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Dumping data for table papertrl_default_script.ar_product_line: ~2 rows (approximately)
/*!40000 ALTER TABLE `ar_product_line` DISABLE KEYS */;
INSERT INTO `ar_product_line` (`id`, `name`, `status`) VALUES
	(1, 'Infrastructure', 'A'),
	(2, 'Environmental', 'A');
/*!40000 ALTER TABLE `ar_product_line` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.ar_project
DROP TABLE IF EXISTS `ar_project`;
CREATE TABLE IF NOT EXISTS `ar_project` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `proposal_id` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `project_no` varchar(50) DEFAULT NULL,
  `project_name` varchar(200) NOT NULL,
  `contractor_type` char(1) NOT NULL,
  `direct_client_id` int(11) DEFAULT NULL,
  `end_client_id` int(11) DEFAULT NULL,
  `contract_value` decimal(10,2) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `partnership_type_id` int(11) DEFAULT NULL,
  `revenue_sharing` char(1) NOT NULL,
  `labour_revenue` decimal(6,2) DEFAULT NULL,
  `odc_revenue` decimal(6,2) DEFAULT NULL,
  `notes` varchar(300) DEFAULT NULL,
  `cc_list` varchar(1000) DEFAULT NULL,
  `include_employee` char(1) NOT NULL,
  `include_subcontractors` char(1) NOT NULL,
  `contract_type_id` int(11) DEFAULT NULL,
  `created_by` varchar(100) NOT NULL,
  `created_on` date NOT NULL,
  `update_by` varchar(100) DEFAULT '',
  `update_on` date DEFAULT NULL,
  `delete_by` varchar(100) DEFAULT '',
  `delete_on` date DEFAULT NULL,
  `status` char(1) NOT NULL,
  `approved_by` varchar(100) DEFAULT '',
  `approved_date` date DEFAULT NULL,
  `first_level_approver` varchar(100) DEFAULT '',
  `contact_name` varchar(150) DEFAULT NULL,
  `poc_email` varchar(200) DEFAULT NULL,
  `poc_phone` varchar(200) DEFAULT NULL,
  `poc_fax` varchar(200) DEFAULT NULL,
  `joint_venture_name` varchar(150) DEFAULT NULL,
  `workflow_id` int(11) DEFAULT NULL,
  `workflow_level` int(11) DEFAULT NULL,
  `no_of_levels` int(3) DEFAULT NULL,
  `code_entry_level` int(11) DEFAULT NULL,
  `approval_group_level` int(3) DEFAULT NULL,
  `code_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1_PROPOSAL_ID_3` (`proposal_id`),
  KEY `FK3_CONTRACT_TYPE` (`contract_type_id`),
  KEY `FK4_PARTNERSHIP_TYPE` (`partnership_type_id`),
  KEY `FK5_CLIENT` (`direct_client_id`),
  KEY `FK6_CLIENT` (`end_client_id`),
  KEY `FK7_CODE` (`code_id`),
  CONSTRAINT `FK1_PROPOSAL_ID_3` FOREIGN KEY (`proposal_id`) REFERENCES `ar_proposal` (`id`),
  CONSTRAINT `FK3_CONTRACT_TYPE` FOREIGN KEY (`contract_type_id`) REFERENCES `ar_contract_type` (`id`),
  CONSTRAINT `FK4_PARTNERSHIP_TYPE` FOREIGN KEY (`partnership_type_id`) REFERENCES `ar_partnership_type` (`id`),
  CONSTRAINT `FK5_CLIENT` FOREIGN KEY (`direct_client_id`) REFERENCES `ar_client_mst` (`id`),
  CONSTRAINT `FK6_CLIENT` FOREIGN KEY (`end_client_id`) REFERENCES `ar_client_mst` (`id`),
  CONSTRAINT `FK7_CODE` FOREIGN KEY (`code_id`) REFERENCES `common_approval_code` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table papertrl_default_script.ar_project: ~0 rows (approximately)
/*!40000 ALTER TABLE `ar_project` DISABLE KEYS */;
/*!40000 ALTER TABLE `ar_project` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.ar_project_additional_data
DROP TABLE IF EXISTS `ar_project_additional_data`;
CREATE TABLE IF NOT EXISTS `ar_project_additional_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field_value` varchar(200) DEFAULT NULL,
  `field_id` int(15) NOT NULL,
  `field_name` varchar(50) NOT NULL,
  `project_mst_id` int(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table papertrl_default_script.ar_project_additional_data: ~0 rows (approximately)
/*!40000 ALTER TABLE `ar_project_additional_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `ar_project_additional_data` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.ar_project_attachment
DROP TABLE IF EXISTS `ar_project_attachment`;
CREATE TABLE IF NOT EXISTS `ar_project_attachment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `attachment_type_id` int(11) NOT NULL,
  `attachment_url` varchar(200) NOT NULL,
  `file_name` varchar(200) DEFAULT NULL,
  `file_type` varchar(30) DEFAULT NULL,
  `status` char(1) NOT NULL,
  `delete_by` varchar(100) DEFAULT '',
  `delete_on` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1_PROJECT_ID_2` (`project_id`),
  KEY `FK2_ATTACHMENT_TYPE` (`attachment_type_id`),
  CONSTRAINT `FK1_PROJECT_ID_2` FOREIGN KEY (`project_id`) REFERENCES `ar_project` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FK2_ATTACHMENT_TYPE` FOREIGN KEY (`attachment_type_id`) REFERENCES `common_attachment_type` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table papertrl_default_script.ar_project_attachment: ~0 rows (approximately)
/*!40000 ALTER TABLE `ar_project_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `ar_project_attachment` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.ar_project_audit_trial
DROP TABLE IF EXISTS `ar_project_audit_trial`;
CREATE TABLE IF NOT EXISTS `ar_project_audit_trial` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_date` datetime NOT NULL,
  `status_id` int(11) NOT NULL,
  `user_id` varchar(100) NOT NULL,
  `user_name` varchar(200) NOT NULL,
  `comment` varchar(300) DEFAULT NULL,
  `project_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK2_PROJECT_ID` (`project_id`),
  KEY `FK1_PROJECT_STATUS_ID` (`status_id`),
  CONSTRAINT `FK1_PROJECT_STATUS_ID` FOREIGN KEY (`status_id`) REFERENCES `common_audit_trial_status` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FK2_PROJECT_ID` FOREIGN KEY (`project_id`) REFERENCES `ar_project` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table papertrl_default_script.ar_project_audit_trial: ~0 rows (approximately)
/*!40000 ALTER TABLE `ar_project_audit_trial` DISABLE KEYS */;
/*!40000 ALTER TABLE `ar_project_audit_trial` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.ar_project_employee_information
DROP TABLE IF EXISTS `ar_project_employee_information`;
CREATE TABLE IF NOT EXISTS `ar_project_employee_information` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `employee_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1_PROJECT_ID_4` (`project_id`),
  KEY `FK2_EMPLOYEE` (`employee_id`),
  CONSTRAINT `FK1_PROJECT_ID_4` FOREIGN KEY (`project_id`) REFERENCES `ar_project` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FK2_EMPLOYEE` FOREIGN KEY (`employee_id`) REFERENCES `common_employee` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table papertrl_default_script.ar_project_employee_information: ~0 rows (approximately)
/*!40000 ALTER TABLE `ar_project_employee_information` DISABLE KEYS */;
/*!40000 ALTER TABLE `ar_project_employee_information` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.ar_project_partnership_detail
DROP TABLE IF EXISTS `ar_project_partnership_detail`;
CREATE TABLE IF NOT EXISTS `ar_project_partnership_detail` (
  `id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `partnership_type_id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `contract_file_name` varchar(200) DEFAULT NULL,
  `signed_contract_url` varchar(200) DEFAULT NULL,
  `contact_name` varchar(150) DEFAULT NULL,
  `poc_email` varchar(200) DEFAULT NULL,
  `poc_phone` varchar(200) DEFAULT NULL,
  `poc_fax` varchar(200) DEFAULT NULL,
  `revenue_share_type` char(1) DEFAULT NULL,
  `revenue_labor_percentage` int(3) DEFAULT NULL,
  `revenue_odc_percentage` int(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1_PROJECT_ID_5` (`project_id`),
  KEY `FK2_PARTNERSHIP_TYPE` (`partnership_type_id`),
  CONSTRAINT `FK1_PROJECT_ID_5` FOREIGN KEY (`project_id`) REFERENCES `ar_project` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FK2_PARTNERSHIP_TYPE` FOREIGN KEY (`partnership_type_id`) REFERENCES `ar_partnership_type` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table papertrl_default_script.ar_project_partnership_detail: ~0 rows (approximately)
/*!40000 ALTER TABLE `ar_project_partnership_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `ar_project_partnership_detail` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.ar_project_subcontractor_info
DROP TABLE IF EXISTS `ar_project_subcontractor_info`;
CREATE TABLE IF NOT EXISTS `ar_project_subcontractor_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `sub_contractor` int(11) NOT NULL,
  `sub_contractor_name` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1_PROJECT_ID_6` (`project_id`),
  KEY `FK1_VENDOR_PROJECT` (`sub_contractor`),
  CONSTRAINT `FK1_PROJECT_ID_6` FOREIGN KEY (`project_id`) REFERENCES `ar_project` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table papertrl_default_script.ar_project_subcontractor_info: ~0 rows (approximately)
/*!40000 ALTER TABLE `ar_project_subcontractor_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `ar_project_subcontractor_info` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.ar_proposal
DROP TABLE IF EXISTS `ar_proposal`;
CREATE TABLE IF NOT EXISTS `ar_proposal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `opportunity_id` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `proposal_no` varchar(20) DEFAULT NULL,
  `proposal_name` varchar(255) NOT NULL,
  `contractor_type` char(11) NOT NULL,
  `proposal_status` char(1) NOT NULL,
  `contract_value` decimal(10,2) NOT NULL,
  `solicition_no` varchar(20) NOT NULL,
  `proposal_date` date DEFAULT NULL,
  `proposal_due_date` date NOT NULL,
  `partnership_type_id` int(11) NOT NULL,
  `direct_client_id` int(11) NOT NULL,
  `end_client_id` int(11) DEFAULT NULL,
  `notes` varchar(300) DEFAULT NULL,
  `cc_list` varchar(1000) DEFAULT NULL,
  `created_by` varchar(100) NOT NULL,
  `created_on` date NOT NULL,
  `update_by` varchar(100) DEFAULT NULL,
  `update_on` date DEFAULT NULL,
  `delete_by` varchar(100) DEFAULT '',
  `delete_on` date DEFAULT NULL,
  `status` char(1) NOT NULL,
  `approved_by` varchar(100) DEFAULT '',
  `approved_date` date DEFAULT NULL,
  `first_level_approver` varchar(100) DEFAULT '',
  `workflow_id` int(11) DEFAULT NULL,
  `workflow_level` int(11) DEFAULT NULL,
  `no_of_levels` int(3) DEFAULT NULL,
  `code_entry_level` int(11) DEFAULT NULL,
  `approval_group_level` int(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1_OPPORTUNITY_ID_5` (`opportunity_id`),
  KEY `FK2_PROPOSAL_STATUS` (`proposal_status`),
  KEY `FK3_PARTNERSHIP_TYPE` (`partnership_type_id`),
  KEY `FK4_CLIENT_1` (`direct_client_id`),
  KEY `FK5_CLIENT_2` (`end_client_id`),
  CONSTRAINT `FK1_OPPORTUNITY_ID_5` FOREIGN KEY (`opportunity_id`) REFERENCES `ar_opportunity` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FK3_PARTNERSHIP_TYPE` FOREIGN KEY (`partnership_type_id`) REFERENCES `ar_partnership_type` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FK4_CLIENT_1` FOREIGN KEY (`direct_client_id`) REFERENCES `ar_client_mst` (`id`),
  CONSTRAINT `FK5_CLIENT_2` FOREIGN KEY (`end_client_id`) REFERENCES `ar_client_mst` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table papertrl_default_script.ar_proposal: ~0 rows (approximately)
/*!40000 ALTER TABLE `ar_proposal` DISABLE KEYS */;
/*!40000 ALTER TABLE `ar_proposal` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.ar_proposal_additional_data
DROP TABLE IF EXISTS `ar_proposal_additional_data`;
CREATE TABLE IF NOT EXISTS `ar_proposal_additional_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field_value` varchar(200) DEFAULT NULL,
  `field_id` int(15) NOT NULL,
  `field_name` varchar(50) NOT NULL,
  `proposal_mst_id` int(15) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK__ar_proposal` (`proposal_mst_id`),
  CONSTRAINT `FK__ar_proposal` FOREIGN KEY (`proposal_mst_id`) REFERENCES `ar_proposal` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table papertrl_default_script.ar_proposal_additional_data: ~0 rows (approximately)
/*!40000 ALTER TABLE `ar_proposal_additional_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `ar_proposal_additional_data` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.ar_proposal_attachment
DROP TABLE IF EXISTS `ar_proposal_attachment`;
CREATE TABLE IF NOT EXISTS `ar_proposal_attachment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `proposal_id` int(11) NOT NULL,
  `attachment_type_id` int(11) NOT NULL,
  `attachment_url` varchar(200) NOT NULL,
  `file_name` varchar(200) DEFAULT NULL,
  `file_type` varchar(30) DEFAULT NULL,
  `status` char(1) NOT NULL,
  `delete_by` varchar(100) DEFAULT '',
  `delete_on` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1_PROPOSAL_ID_2` (`proposal_id`),
  KEY `FK2_ATTACHMENT_TYPE_2` (`attachment_type_id`),
  CONSTRAINT `FK1_PROPOSAL_ID_2` FOREIGN KEY (`proposal_id`) REFERENCES `ar_proposal` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FK2_ATTACHMENT_TYPE_2` FOREIGN KEY (`attachment_type_id`) REFERENCES `common_attachment_type` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table papertrl_default_script.ar_proposal_attachment: ~0 rows (approximately)
/*!40000 ALTER TABLE `ar_proposal_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `ar_proposal_attachment` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.ar_proposal_audit_trial
DROP TABLE IF EXISTS `ar_proposal_audit_trial`;
CREATE TABLE IF NOT EXISTS `ar_proposal_audit_trial` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_date` datetime NOT NULL,
  `status_id` int(11) NOT NULL,
  `user_id` varchar(100) NOT NULL,
  `user_name` varchar(200) NOT NULL,
  `comment` varchar(300) DEFAULT NULL,
  `proposal_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK2_PROPOSAL_ID` (`proposal_id`),
  KEY `FK1_PROPOSAL_STATUS_ID` (`status_id`),
  CONSTRAINT `FK1_PROPOSAL_STATUS_ID` FOREIGN KEY (`status_id`) REFERENCES `common_audit_trial_status` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FK2_PROPOSAL_ID` FOREIGN KEY (`proposal_id`) REFERENCES `ar_proposal` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table papertrl_default_script.ar_proposal_audit_trial: ~0 rows (approximately)
/*!40000 ALTER TABLE `ar_proposal_audit_trial` DISABLE KEYS */;
/*!40000 ALTER TABLE `ar_proposal_audit_trial` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.ar_proposal_employee_information
DROP TABLE IF EXISTS `ar_proposal_employee_information`;
CREATE TABLE IF NOT EXISTS `ar_proposal_employee_information` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `proposal_id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `employee_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1_PROPOSAL_ID_1` (`proposal_id`),
  KEY `FK2_EMPLOYEE_ID_2` (`employee_id`),
  CONSTRAINT `FK1_PROPOSAL_ID_1` FOREIGN KEY (`proposal_id`) REFERENCES `ar_proposal` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FK2_EMPLOYEE_ID_2` FOREIGN KEY (`employee_id`) REFERENCES `common_employee` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table papertrl_default_script.ar_proposal_employee_information: ~0 rows (approximately)
/*!40000 ALTER TABLE `ar_proposal_employee_information` DISABLE KEYS */;
/*!40000 ALTER TABLE `ar_proposal_employee_information` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.ar_set_aside
DROP TABLE IF EXISTS `ar_set_aside`;
CREATE TABLE IF NOT EXISTS `ar_set_aside` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

-- Dumping data for table papertrl_default_script.ar_set_aside: ~9 rows (approximately)
/*!40000 ALTER TABLE `ar_set_aside` DISABLE KEYS */;
INSERT INTO `ar_set_aside` (`id`, `name`, `status`) VALUES
	(1, 'Competitive 8(a)', 'A'),
	(2, 'Small Business', 'A'),
	(3, 'Total Small Business', 'A'),
	(4, 'Veteran Owned Small Business', 'A'),
	(5, 'Service Disabled Veteran Owned Small Business', 'A'),
	(6, 'Woman Owned Small Business', 'A'),
	(7, 'Partial HBCU', 'A'),
	(8, 'Total HBCU', 'A'),
	(9, 'HUBZone', 'A');
/*!40000 ALTER TABLE `ar_set_aside` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.ar_type_of_location
DROP TABLE IF EXISTS `ar_type_of_location`;
CREATE TABLE IF NOT EXISTS `ar_type_of_location` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;

-- Dumping data for table papertrl_default_script.ar_type_of_location: ~32 rows (approximately)
/*!40000 ALTER TABLE `ar_type_of_location` DISABLE KEYS */;
INSERT INTO `ar_type_of_location` (`id`, `name`, `status`) VALUES
	(1, 'Civilian', 'A'),
	(2, 'Military', 'A'),
	(3, 'Medical', 'A'),
	(4, 'National Park', 'A'),
	(5, 'Commercial', 'A'),
	(6, 'Residential', 'A'),
	(7, 'Religious', 'A'),
	(8, 'Agricultural', 'A'),
	(9, 'School', 'A'),
	(10, 'University', 'A'),
	(11, 'Government', 'A'),
	(12, 'Industrial', 'A'),
	(13, 'Parking and Storage', 'A'),
	(14, 'Transportation', 'A'),
	(15, 'Infrastructure', 'A'),
	(16, 'Power', 'A'),
	(17, 'Information Technology', 'A'),
	(18, 'Sports', 'A'),
	(19, 'Parks', 'A'),
	(20, 'Fuel', 'A'),
	(21, 'Historic', 'A'),
	(22, 'Monument', 'A'),
	(23, 'Secure Facility', 'A'),
	(24, 'Water Body', 'A'),
	(25, 'Forest', 'A'),
	(26, 'Dessert', 'A'),
	(27, 'Extreme Weather', 'A'),
	(28, 'Wetlands', 'A'),
	(29, 'High Elevation', 'A'),
	(30, 'Coastal', 'A'),
	(31, 'Inland', 'A'),
	(32, 'Laboratory', 'A');
/*!40000 ALTER TABLE `ar_type_of_location` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.ar_type_of_work
DROP TABLE IF EXISTS `ar_type_of_work`;
CREATE TABLE IF NOT EXISTS `ar_type_of_work` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `status` char(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Dumping data for table papertrl_default_script.ar_type_of_work: ~3 rows (approximately)
/*!40000 ALTER TABLE `ar_type_of_work` DISABLE KEYS */;
INSERT INTO `ar_type_of_work` (`id`, `name`, `status`) VALUES
	(1, 'Elevator Installers and Repairers', 'A'),
	(2, 'Boilermakers', 'A'),
	(3, 'Construction Equipment Operators', 'A');
/*!40000 ALTER TABLE `ar_type_of_work` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.common_account_number
DROP TABLE IF EXISTS `common_account_number`;
CREATE TABLE IF NOT EXISTS `common_account_number` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_type` int(11) NOT NULL,
  `account_detail_type` int(11) DEFAULT NULL,
  `number` varchar(100) NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `parent_account` int(11) DEFAULT NULL,
  `as_at_date` date DEFAULT NULL,
  `as_at_date_balance` decimal(20,2) DEFAULT NULL,
  `current_balance` decimal(20,2) DEFAULT NULL,
  `current_balance_with_sub_accounts` decimal(20,2) DEFAULT NULL,
  `status` char(1) NOT NULL,
  `classification` varchar(100) DEFAULT NULL,
  `created_on` datetime NOT NULL,
  `update_by` varchar(100) DEFAULT '',
  `update_on` datetime DEFAULT NULL,
  `delete_by` varchar(100) DEFAULT NULL,
  `delete_on` datetime DEFAULT NULL,
  `sub_level` int(11) DEFAULT NULL,
  `created_by` varchar(100) NOT NULL,
  `is_purchase_account` char(2) DEFAULT 'Q',
  PRIMARY KEY (`id`),
  KEY `FK_ACCOUNT_TYPE_1` (`account_type`),
  CONSTRAINT `FK_ACCOUNT_TYPE_1` FOREIGN KEY (`account_type`) REFERENCES `common_account_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table papertrl_default_script.common_account_number: ~0 rows (approximately)
/*!40000 ALTER TABLE `common_account_number` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_account_number` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.common_account_number_import
DROP TABLE IF EXISTS `common_account_number_import`;
CREATE TABLE IF NOT EXISTS `common_account_number_import` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(100) NOT NULL,
  `total_records` int(11) DEFAULT NULL,
  `succeeded` int(11) DEFAULT NULL,
  `failed` int(11) DEFAULT NULL,
  `created_by` varchar(100) NOT NULL,
  `created_on` datetime NOT NULL,
  `update_by` varchar(100) DEFAULT NULL,
  `update_on` datetime DEFAULT NULL,
  `delete_by` varchar(100) DEFAULT NULL,
  `delete_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table papertrl_default_script.common_account_number_import: ~0 rows (approximately)
/*!40000 ALTER TABLE `common_account_number_import` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_account_number_import` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.common_account_number_import_issue
DROP TABLE IF EXISTS `common_account_number_import_issue`;
CREATE TABLE IF NOT EXISTS `common_account_number_import_issue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `import_mst_id` int(11) NOT NULL,
  `record` text DEFAULT NULL,
  `description` varchar(256) DEFAULT NULL,
  `line_no` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK__common_chart_of_account_import_mst` (`import_mst_id`),
  CONSTRAINT `FK__common_chart_of_account_import_mst` FOREIGN KEY (`import_mst_id`) REFERENCES `common_account_number_import` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table papertrl_default_script.common_account_number_import_issue: ~0 rows (approximately)
/*!40000 ALTER TABLE `common_account_number_import_issue` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_account_number_import_issue` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.common_account_sub_type
DROP TABLE IF EXISTS `common_account_sub_type`;
CREATE TABLE IF NOT EXISTS `common_account_sub_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_type` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `short_code` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_ACCOUNT_TYPE` (`account_type`),
  CONSTRAINT `FK_ACCOUNT_TYPE` FOREIGN KEY (`account_type`) REFERENCES `common_account_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=149 DEFAULT CHARSET=latin1;

-- Dumping data for table papertrl_default_script.common_account_sub_type: ~148 rows (approximately)
/*!40000 ALTER TABLE `common_account_sub_type` DISABLE KEYS */;
INSERT INTO `common_account_sub_type` (`id`, `account_type`, `name`, `short_code`) VALUES
	(1, 1, 'Accounts Receivable (A/R)', 'AccountsReceivable'),
	(2, 2, 'Allowance for Bad Debts', 'AllowanceForBadDebts'),
	(3, 2, 'Development Costs', 'DevelopmentCosts'),
	(4, 2, 'Employee Cash Advances', 'EmployeeCashAdvances'),
	(5, 2, 'Inventory', 'Inventory'),
	(6, 2, 'Investment - Mortgage/Real Estate Loans', 'Investment_MortgageRealEstateLoans'),
	(7, 2, 'Investment - Tax-Exempt Securities', 'Investment_TaxExemptSecurities'),
	(8, 2, 'Investment - U.S. Government Obligations', 'Investment_USGovernmentObligations'),
	(9, 2, 'Investments - Other', 'Investments_Other'),
	(10, 2, 'Loans To Officers', 'LoansToOfficers'),
	(11, 2, 'Loans to Others', 'LoansToOthers'),
	(12, 2, 'Loans to Stockholders', 'LoansToStockholders'),
	(13, 2, 'Other Current Assets', 'OtherCurrentAssets'),
	(14, 2, 'Prepaid Expenses', 'PrepaidExpenses'),
	(15, 2, 'Retainage', 'Retainage'),
	(16, 2, 'Undeposited Funds', 'UndepositedFunds'),
	(17, 3, 'Cash on hand', 'CashOnHand'),
	(18, 3, 'Checking', 'Checking'),
	(19, 3, 'Money Market', 'MoneyMarket'),
	(20, 3, 'Rents Held in Trust', 'RentsHeldInTrust'),
	(21, 3, 'Savings', 'Savings'),
	(22, 3, 'Trust account', 'TrustAccount'),
	(23, 4, 'Accumulated Amortization', 'AccumulatedAmortization'),
	(24, 4, 'Accumulated Depletion', 'AccumulatedDepletion'),
	(25, 4, 'Accumulated Depreciation', 'AccumulatedDepreciation'),
	(26, 4, 'Buildings', 'Buildings'),
	(27, 4, 'Depletable Assets', 'DepletableAssets'),
	(28, 4, 'Fixed Asset Computers', 'FixedAssetComputers'),
	(29, 4, 'Fixed Asset Copiers', 'FixedAssetCopiers'),
	(30, 4, 'Fixed Asset Furniture', 'FixedAssetFurniture'),
	(31, 4, 'Fixed Asset Other Tools Equipment', 'FixedAssetOtherToolsEquipment'),
	(32, 4, 'Fixed Asset Phone', 'FixedAssetPhone'),
	(33, 4, 'Fixed Asset Photo Video', 'FixedAssetPhotoVideo'),
	(34, 4, 'Fixed Asset Software', 'FixedAssetSoftware'),
	(35, 4, 'Furniture & Fixtures', 'FurnitureAndFixtures'),
	(36, 4, 'Intangible Assets', 'IntangibleAssets'),
	(37, 4, 'Land', 'Land'),
	(38, 4, 'Leasehold Improvements', 'LeaseholdImprovements'),
	(39, 4, 'Machinery & Equipment', 'MachineryAndEquipment'),
	(40, 4, 'Other fixed assets', 'OtherFixedAssets'),
	(41, 4, 'Vehicles', 'Vehicles'),
	(42, 5, 'Accumulated Amortization of Other Assets', 'AccumulatedAmortizationOfOtherAssets'),
	(43, 5, 'Goodwill', 'Goodwill'),
	(44, 5, 'Lease Buyout', 'LeaseBuyout'),
	(45, 5, 'Licenses', 'Licenses'),
	(46, 5, 'Organizational Costs', 'OrganizationalCosts'),
	(47, 5, 'Other Long-term Assets', 'OtherLong_termAssets'),
	(48, 5, 'Security Deposits', 'SecurityDeposits'),
	(49, 6, 'Accounts Payable (A/P)', 'AccountsPayable'),
	(50, 7, 'Credit Card', 'CreditCard'),
	(51, 8, 'Federal Income Tax Payable', 'FederalIncomeTaxPayable'),
	(52, 8, 'Insurance Payable', 'InsurancePayable'),
	(53, 8, 'Line of Credit', 'LineOfCredit'),
	(54, 8, 'Loan Payable', 'LoanPayable'),
	(55, 8, 'Other Current Liabilities', 'OtherCurrentLiabilities'),
	(56, 8, 'Payroll Clearing', 'PayrollClearing'),
	(57, 8, 'Payroll Tax Payable', 'PayrollTaxPayable'),
	(58, 8, 'Prepaid Expenses Payable', 'PrepaidExpensesPayable'),
	(59, 8, 'Rents in trust - Liability', 'RentsInTrustLiability'),
	(60, 8, 'Sales Tax Payable', 'SalesTaxPayable'),
	(61, 8, 'State/Local Income Tax Payable', 'StateLocalIncomeTaxPayable'),
	(62, 8, 'Trust Accounts - Liabilities', 'Trust Accounts _Liabilities'),
	(63, 8, 'Undistributed Tips', 'UndistributedTips'),
	(64, 9, 'Notes Payable', 'NotesPayable'),
	(65, 9, 'Other Long Term Liabilities', 'OtherLongTermLiabilities'),
	(66, 9, 'Shareholder Notes Payable', 'ShareholderNotesPayable'),
	(67, 10, 'Accumulated Adjustment', 'AccumulatedAdjustment'),
	(68, 10, 'Common Stock', 'CommonStock'),
	(69, 10, 'Estimated Taxes', 'EstimatedTaxes'),
	(70, 10, 'Healthcare', 'Healthcare'),
	(71, 10, 'Opening Balance Equity', 'OpeningBalanceEquity'),
	(72, 10, 'Owner\'s Equity', 'OwnersEquity'),
	(73, 10, 'Paid-In Capital or Surplus', 'PaidInCapitalOrSurplus'),
	(74, 10, 'Partner Contributions', 'PartnerContributions'),
	(75, 10, 'Partner\'s Equity', 'PartnersEquity'),
	(76, 10, 'Personal Expense', 'PersonalExpense'),
	(77, 10, 'Personal Income', 'PersonalIncome'),
	(78, 10, 'Preferred Stock', 'PreferredStock'),
	(79, 10, 'Retained Earnings', 'RetainedEarnings'),
	(80, 10, 'Treasury Stock', 'TreasuryStock'),
	(81, 11, 'Discounts/Refunds Given', 'DiscountsRefundsGiven'),
	(82, 11, 'Non-Profit Income', 'NonProfitIncome'),
	(83, 11, 'Other Primary Income', 'OtherPrimaryIncome'),
	(84, 11, 'Sales of Product Income', 'SalesOfProductIncome'),
	(85, 11, 'Service/Fee Income', 'ServiceFeeIncome'),
	(86, 11, 'Unapplied Cash Payment Income', 'UnappliedCashPaymentIncome'),
	(87, 12, 'Dividend Income', 'DividendIncome'),
	(88, 12, 'Interest Earned', 'InterestEarned'),
	(89, 12, 'Other Investment Income', 'OtherInvestmentIncome'),
	(90, 12, 'Other Miscellaneous Income', 'OtherMiscellaneousIncome'),
	(91, 12, 'Tax-Exempt Interest', 'TaxExemptInterest'),
	(92, 13, 'Cost of labor - COS', 'CostOfLaborCos'),
	(93, 13, 'Equipment Rental - COS', 'EquipmentRentalCos'),
	(94, 13, 'Other Costs of Services - COS', 'OtherCostsOfServiceCos'),
	(95, 13, 'Shipping, Freight & Delivery - COS', 'ShippingFreightDeliveryCos'),
	(96, 13, 'Supplies & Materials - COGS', 'SuppliesMaterialsCogs'),
	(97, 14, 'Advertising/Promotional', 'AdvertisingPromotional'),
	(98, 14, 'Auto', 'Auto'),
	(99, 14, 'Bad Debts', 'BadDebts'),
	(100, 14, 'Bank Charges', 'BankCharges'),
	(101, 14, 'Charitable Contributions', 'CharitableContributions'),
	(102, 14, 'Cost of Labor', 'CostOfLabor'),
	(103, 14, 'Dues & subscriptions', 'DuesSubscriptions'),
	(104, 14, 'Entertainment', 'Entertainment'),
	(105, 14, 'Entertainment Meals', 'EntertainmentMeals'),
	(106, 14, 'Equipment Rental', 'EquipmentRental'),
	(107, 14, 'Finance costs', 'FinanceCosts'),
	(108, 14, 'Insurance', 'Insurance'),
	(109, 14, 'Interest Paid', 'InterestPaid'),
	(110, 14, 'Legal & Professional Fees', 'LegalProfessionalFees'),
	(111, 14, 'Office/General Administrative Expenses', 'OfficeGeneralAdministrativeExpenses'),
	(112, 14, 'Other Business Expenses', 'OtherBusinessExpenses'),
	(113, 14, 'Other Miscellaneous Service Cost', 'OtherMiscellaneousServiceCost'),
	(114, 14, 'Payroll Expenses', 'PayrollExpenses'),
	(115, 14, 'Promotional Meals', 'PromotionalMeals'),
	(116, 14, 'Rent or Lease of Buildings', 'RentOrLeaseOfBuildings'),
	(117, 14, 'Repair & Maintenance', 'RepairMaintenance'),
	(118, 14, 'Shipping, Freight & Delivery', 'ShippingFreightAndDelivery'),
	(119, 14, 'Supplies & Materials', 'SuppliesMaterials'),
	(120, 14, 'Taxes Paid', 'TaxesPaid'),
	(121, 14, 'Travel', 'Travel'),
	(122, 14, 'Travel Meals', 'TravelMeals'),
	(123, 14, 'Unapplied Cash Bill Payment Expense', 'UnappliedCashBillPaymentExpense'),
	(124, 14, 'Utilities', 'Utilities'),
	(125, 15, 'Amortization', 'Amortization'),
	(126, 15, 'Depreciation', 'Depreciation'),
	(127, 15, 'Exchange Gain or Loss', 'ExchangeGainOrLoss'),
	(128, 15, 'Gas And Fuel', 'GasAndFuel'),
	(129, 15, 'Home Office', 'HomeOffice'),
	(130, 15, 'Homeowner Rental Insurance', 'HomeownerRentalInsurance'),
	(131, 15, 'Mortgage Interest Home Office', 'MortgageInterestHomeOffice'),
	(132, 15, 'Other Home Office Expenses', 'OtherHomeOfficeExpenses'),
	(133, 15, 'Other Miscellaneous Expense', 'OtherMiscellaneousExpense'),
	(134, 15, 'Other Vehicle Expenses', 'OtherVehicleExpenses'),
	(135, 15, 'Parking and Tolls', 'ParkingAndTolls'),
	(136, 15, 'Penalties & Settlements', 'PenaltiesSettlements'),
	(137, 15, 'Rent and Lease Home Office', 'RentAndLeaseHomeOffice'),
	(138, 15, 'Repairs and Maintenance Home Office', 'RepairsAndMaintenanceHomeOffice'),
	(139, 15, 'Utilities Home Office', 'UtilitiesHomeOffice'),
	(140, 15, 'Vehicle', 'Vehicle'),
	(141, 15, 'Vehicle Insurance', 'VehicleInsurance'),
	(142, 15, 'Vehicle Lease', 'VehicleLease'),
	(143, 15, 'Vehicle Loan', 'VehicleLoan'),
	(144, 15, 'Vehicle Loan Interest', 'VehicleLoan Interest'),
	(145, 15, 'Vehicle Registration', 'VehicleRegistration'),
	(146, 15, 'Vehicle Repairs', 'VehicleRepairs'),
	(147, 15, 'Wash and Road Services', 'WashAndRoadServices'),
	(148, 8, 'Global Tax Payable', 'GlobalTaxPayable');
/*!40000 ALTER TABLE `common_account_sub_type` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.common_account_type
DROP TABLE IF EXISTS `common_account_type`;
CREATE TABLE IF NOT EXISTS `common_account_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL DEFAULT '',
  `short_name` varchar(200) NOT NULL,
  `short_name_no_space` varchar(200) NOT NULL,
  `short_name_underscore` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

-- Dumping data for table papertrl_default_script.common_account_type: ~18 rows (approximately)
/*!40000 ALTER TABLE `common_account_type` DISABLE KEYS */;
INSERT INTO `common_account_type` (`id`, `name`, `short_name`, `short_name_no_space`, `short_name_underscore`) VALUES
	(1, 'Accounts receivable (A/R)', 'Accounts Receivable', 'AccountsReceivable', 'ACCOUNTS_RECEIVABLE'),
	(2, 'Other Current Assets', 'Other Current Asset', 'OtherCurrentAsset', 'OTHER_CURRENT_ASSET'),
	(3, 'Bank', 'Bank', 'Bank', 'BANK'),
	(4, 'Fixed Assets', 'Fixed Asset', 'FixedAsset', 'FIXED_ASSET'),
	(5, 'Other Assets', 'Other Asset', 'OtherAsset', 'OTHER_ASSET'),
	(6, 'Accounts payable (A/P)', 'Accounts Payable', 'AccountsPayable', 'ACCOUNTS_PAYABLE'),
	(7, 'Credit Card', 'Credit Card', 'CreditCard', 'CREDIT_CARD'),
	(8, 'Other Current Liabilities', 'Other Current Liability', 'OtherCurrentLiability', 'OTHER_CURRENT_LIABILITY'),
	(9, 'Long Term Liabilities', 'Long Term Liability', 'LongTermLiability', 'LONG_TERM_LIABILITY'),
	(10, 'Equity', 'Equity', 'Equity', 'EQUITY'),
	(11, 'Income', 'Income', 'Income', 'INCOME'),
	(12, 'Other Income', 'Other Income', 'OtherIncome', 'OTHER_INCOME'),
	(13, 'Cost of Goods Sold', 'Cost of Goods Sold', 'CostOfGoodsSold', 'COST_OF_GOODS_SOLD'),
	(14, 'Expenses', 'Expense', 'Expense', 'EXPENSE'),
	(15, 'Other Expense', 'Other Expense', 'OtherExpense', 'OTHER_EXPENSE'),
	(16, 'Non Posting', 'Non Posting', 'NonPosting', 'NON_POSTING'),
	(17, 'Assets', 'Assets', 'Assets', 'ASSETS'),
	(18, 'Liabilities', 'Liabilities', 'Liabilities', 'LIABILITIES');
/*!40000 ALTER TABLE `common_account_type` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.common_additional_field
DROP TABLE IF EXISTS `common_additional_field`;
CREATE TABLE IF NOT EXISTS `common_additional_field` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `module_id` int(11) NOT NULL,
  `field_name` varchar(80) NOT NULL,
  `max_length` int(5) DEFAULT NULL,
  `display_order` int(5) NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT 0,
  `field_type_id` int(11) NOT NULL,
  `section_id` int(11) DEFAULT NULL,
  `field_type_name` varchar(150) DEFAULT '',
  `data_type` varchar(150) DEFAULT NULL,
  `create_new` char(1) DEFAULT NULL,
  `multiple` char(1) DEFAULT NULL,
  `file_types` varchar(300) DEFAULT '',
  `status` char(1) NOT NULL DEFAULT 'A',
  `row_count` int(50) DEFAULT NULL,
  `value` varchar(250) DEFAULT NULL,
  `data_source_id` int(11) DEFAULT NULL,
  `created_by` varchar(100) NOT NULL,
  `created_on` datetime NOT NULL,
  `update_by` varchar(100) DEFAULT NULL,
  `update_on` datetime DEFAULT NULL,
  `delete_by` varchar(100) DEFAULT NULL,
  `delete_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table papertrl_default_script.common_additional_field: ~0 rows (approximately)
/*!40000 ALTER TABLE `common_additional_field` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_additional_field` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.common_additional_field_option
DROP TABLE IF EXISTS `common_additional_field_option`;
CREATE TABLE IF NOT EXISTS `common_additional_field_option` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field_id` int(11) DEFAULT NULL,
  `option_value` varchar(100) NOT NULL,
  `data_source_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_FIELD_ID` (`field_id`),
  CONSTRAINT `FK_FIELD_ID` FOREIGN KEY (`field_id`) REFERENCES `common_additional_field` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table papertrl_default_script.common_additional_field_option: ~0 rows (approximately)
/*!40000 ALTER TABLE `common_additional_field_option` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_additional_field_option` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.common_additional_field_type
DROP TABLE IF EXISTS `common_additional_field_type`;
CREATE TABLE IF NOT EXISTS `common_additional_field_type` (
  `id` int(11) NOT NULL,
  `name` varchar(150) DEFAULT NULL,
  `status` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- Dumping data for table papertrl_default_script.common_additional_field_type: ~8 rows (approximately)
/*!40000 ALTER TABLE `common_additional_field_type` DISABLE KEYS */;
INSERT INTO `common_additional_field_type` (`id`, `name`, `status`) VALUES
	(1, 'Textbox', 'A'),
	(2, 'Date Field', 'A'),
	(3, 'Drop Down Field', 'A'),
	(4, 'Text Area', 'A'),
	(5, 'Label', 'A'),
	(6, 'File Input', 'A'),
	(7, 'Radio Button', 'A'),
	(8, 'Check Box', 'A');
/*!40000 ALTER TABLE `common_additional_field_type` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.common_additional_field_validation
DROP TABLE IF EXISTS `common_additional_field_validation`;
CREATE TABLE IF NOT EXISTS `common_additional_field_validation` (
  `id` int(11) NOT NULL,
  `name` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- Dumping data for table papertrl_default_script.common_additional_field_validation: ~11 rows (approximately)
/*!40000 ALTER TABLE `common_additional_field_validation` DISABLE KEYS */;
INSERT INTO `common_additional_field_validation` (`id`, `name`) VALUES
	(1, 'Name'),
	(2, 'Display Order'),
	(3, 'Required'),
	(4, 'Max Length'),
	(5, 'Data Type'),
	(6, 'Drop Down Properties'),
	(7, 'Data Source'),
	(8, 'Accept'),
	(9, 'Rows'),
	(10, 'Value'),
	(11, 'Options');
/*!40000 ALTER TABLE `common_additional_field_validation` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.common_additional_field_validation_relation
DROP TABLE IF EXISTS `common_additional_field_validation_relation`;
CREATE TABLE IF NOT EXISTS `common_additional_field_validation_relation` (
  `id` int(11) NOT NULL,
  `field_id` int(11) DEFAULT NULL,
  `validation_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `field_id` (`field_id`) USING BTREE,
  KEY `validation_id` (`validation_id`) USING BTREE,
  CONSTRAINT `field_id` FOREIGN KEY (`field_id`) REFERENCES `common_additional_field_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `validation_id` FOREIGN KEY (`validation_id`) REFERENCES `common_additional_field_validation` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- Dumping data for table papertrl_default_script.common_additional_field_validation_relation: ~33 rows (approximately)
/*!40000 ALTER TABLE `common_additional_field_validation_relation` DISABLE KEYS */;
INSERT INTO `common_additional_field_validation_relation` (`id`, `field_id`, `validation_id`) VALUES
	(1, 1, 1),
	(2, 1, 2),
	(3, 1, 3),
	(4, 1, 4),
	(5, 1, 5),
	(6, 2, 1),
	(7, 2, 2),
	(8, 2, 3),
	(9, 3, 1),
	(10, 3, 2),
	(11, 3, 3),
	(12, 4, 1),
	(13, 4, 2),
	(14, 4, 3),
	(15, 4, 4),
	(16, 4, 9),
	(17, 5, 1),
	(18, 5, 2),
	(19, 6, 1),
	(20, 6, 2),
	(21, 6, 3),
	(22, 6, 8),
	(23, 7, 1),
	(24, 7, 2),
	(25, 7, 3),
	(26, 3, 6),
	(27, 3, 7),
	(28, 5, 10),
	(29, 3, 11),
	(30, 7, 11),
	(31, 8, 2),
	(32, 8, 3),
	(33, 8, 1);
/*!40000 ALTER TABLE `common_additional_field_validation_relation` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.common_approval_code
DROP TABLE IF EXISTS `common_approval_code`;
CREATE TABLE IF NOT EXISTS `common_approval_code` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `long_name` varchar(300) DEFAULT NULL,
  `description` varchar(300) DEFAULT NULL,
  `expense_category_id` int(11) NOT NULL,
  `project_budget` decimal(20,2) DEFAULT 0.00,
  `amount_invoiced` decimal(20,2) DEFAULT 0.00,
  `remaining_amount` decimal(20,2) DEFAULT 0.00,
  `status` char(1) NOT NULL,
  `contract_value` decimal(20,2) DEFAULT 0.00,
  `created_by` varchar(100) NOT NULL,
  `created_username` varchar(100) NOT NULL,
  `created_on` datetime NOT NULL,
  `update_by` varchar(100) DEFAULT '',
  `update_on` datetime DEFAULT NULL,
  `delete_by` varchar(100) DEFAULT NULL,
  `delete_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_EXP_CAT` (`expense_category_id`),
  KEY `PARENT_ID_INDEX` (`parent_id`) USING BTREE,
  KEY `CREATED_USER_INDEX` (`created_by`) USING BTREE,
  CONSTRAINT `FK_EXP_CAT` FOREIGN KEY (`expense_category_id`) REFERENCES `common_approval_code_category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table papertrl_default_script.common_approval_code: ~0 rows (approximately)
/*!40000 ALTER TABLE `common_approval_code` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_approval_code` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.common_approval_code_category
DROP TABLE IF EXISTS `common_approval_code_category`;
CREATE TABLE IF NOT EXISTS `common_approval_code_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(70) NOT NULL,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- Dumping data for table papertrl_default_script.common_approval_code_category: ~2 rows (approximately)
/*!40000 ALTER TABLE `common_approval_code_category` DISABLE KEYS */;
INSERT INTO `common_approval_code_category` (`id`, `name`, `status`) VALUES
	(1, 'Expense', 'I'),
	(2, 'Project', 'A');
/*!40000 ALTER TABLE `common_approval_code_category` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.common_approval_code_import_issue
DROP TABLE IF EXISTS `common_approval_code_import_issue`;
CREATE TABLE IF NOT EXISTS `common_approval_code_import_issue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `import_mst_id` int(11) NOT NULL,
  `record` text DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL,
  `line_no` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_IMPORT_MST4` (`import_mst_id`),
  CONSTRAINT `FK_IMPORT_MST4` FOREIGN KEY (`import_mst_id`) REFERENCES `common_approval_code_import_mst` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table papertrl_default_script.common_approval_code_import_issue: ~0 rows (approximately)
/*!40000 ALTER TABLE `common_approval_code_import_issue` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_approval_code_import_issue` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.common_approval_code_import_mst
DROP TABLE IF EXISTS `common_approval_code_import_mst`;
CREATE TABLE IF NOT EXISTS `common_approval_code_import_mst` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(100) NOT NULL,
  `total_records` int(11) DEFAULT NULL,
  `succeeded` int(11) DEFAULT NULL,
  `failed` int(11) DEFAULT NULL,
  `created_by` varchar(100) NOT NULL DEFAULT '',
  `created_on` datetime NOT NULL,
  `update_by` varchar(100) DEFAULT NULL,
  `update_on` datetime DEFAULT NULL,
  `delete_by` varchar(100) DEFAULT NULL,
  `delete_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table papertrl_default_script.common_approval_code_import_mst: ~0 rows (approximately)
/*!40000 ALTER TABLE `common_approval_code_import_mst` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_approval_code_import_mst` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.common_approval_group
DROP TABLE IF EXISTS `common_approval_group`;
CREATE TABLE IF NOT EXISTS `common_approval_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(75) NOT NULL,
  `status` char(1) NOT NULL,
  `created_by` varchar(100) NOT NULL DEFAULT '',
  `created_on` datetime NOT NULL,
  `update_by` varchar(100) DEFAULT '',
  `update_on` datetime DEFAULT NULL,
  `delete_by` varchar(100) DEFAULT NULL,
  `delete_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

-- Dumping data for table papertrl_default_script.common_approval_group: ~2 rows (approximately)
/*!40000 ALTER TABLE `common_approval_group` DISABLE KEYS */;
INSERT INTO `common_approval_group` (`id`, `name`, `status`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES
	(1, 'Administrator', 'A', 'admin', '2019-11-19 22:58:33', NULL, NULL, NULL, NULL),
	(3, 'No Approval Group', 'A', 'admin', '2020-03-31 09:31:43', NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `common_approval_group` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.common_approval_group_import_issue
DROP TABLE IF EXISTS `common_approval_group_import_issue`;
CREATE TABLE IF NOT EXISTS `common_approval_group_import_issue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `import_mst_id` int(11) NOT NULL,
  `record` text DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL,
  `line_no` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table papertrl_default_script.common_approval_group_import_issue: ~0 rows (approximately)
/*!40000 ALTER TABLE `common_approval_group_import_issue` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_approval_group_import_issue` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.common_approval_group_import_mst
DROP TABLE IF EXISTS `common_approval_group_import_mst`;
CREATE TABLE IF NOT EXISTS `common_approval_group_import_mst` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(100) NOT NULL,
  `total_records` int(11) DEFAULT NULL,
  `succeeded` int(11) DEFAULT NULL,
  `failed` int(11) DEFAULT NULL,
  `created_by` varchar(100) NOT NULL,
  `created_on` datetime NOT NULL,
  `update_by` varchar(100) DEFAULT NULL,
  `update_on` datetime DEFAULT NULL,
  `delete_by` varchar(100) DEFAULT NULL,
  `delete_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table papertrl_default_script.common_approval_group_import_mst: ~0 rows (approximately)
/*!40000 ALTER TABLE `common_approval_group_import_mst` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_approval_group_import_mst` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.common_attachment_type
DROP TABLE IF EXISTS `common_attachment_type`;
CREATE TABLE IF NOT EXISTS `common_attachment_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table papertrl_default_script.common_attachment_type: ~0 rows (approximately)
/*!40000 ALTER TABLE `common_attachment_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_attachment_type` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.common_audit_trial_status
DROP TABLE IF EXISTS `common_audit_trial_status`;
CREATE TABLE IF NOT EXISTS `common_audit_trial_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(75) NOT NULL,
  `sort_order` int(2) NOT NULL,
  `icon` varchar(50) NOT NULL,
  `color` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;

-- Dumping data for table papertrl_default_script.common_audit_trial_status: ~27 rows (approximately)
/*!40000 ALTER TABLE `common_audit_trial_status` DISABLE KEYS */;
INSERT INTO `common_audit_trial_status` (`id`, `name`, `sort_order`, `icon`, `color`) VALUES
	(1, 'Uploaded by ', 1, 'fa fa-upload', 'bg-blue'),
	(2, 'Reviewed and submitted by ', 2, 'fa fa-location-arrow', 'bg-blue'),
	(3, 'Approved by ', 3, 'fa fa-check', 'bg-blue'),
	(4, 'Rejected by ', 4, 'fa fa-close', 'bg-red'),
	(5, 'Reassigned by ', 5, 'fa fa-share', 'bg-blue'),
	(6, 'Deleted by ', 6, 'fa fa-trash', 'bg-red'),
	(7, 'Re submitted by ', 7, 'fa fa-angle-double-right', 'bg-blue'),
	(8, 'Approved and re-assigned by ', 7, 'fa fa-angle-double-right', 'bg-blue'),
	(9, 'Revert back to', 8, 'fa fa-undo', 'bg-blue'),
	(10, 'Created by ', 1, 'fa fa-upload', 'bg-blue'),
	(11, 'Payment issued by ', 10, 'fa fa-credit-card', 'bg-blue'),
	(12, 'Check mailed by ', 11, 'fa fa-envelope-open', ' bg-blue'),
	(13, 'Payment revoked by ', 12, 'fa fa-undo', ' bg-red'),
	(14, 'Payment Invoice changed by', 13, 'fa fa-undo', ' bg-red'),
	(15, 'Submitted by', 1, 'fa fa-upload', 'bg-blue'),
	(16, 'Skipped by', 2, 'fa fa-step-forward', 'bg-blue'),
	(17, 'Updated by', 3, 'fa fa-pencil', 'bg-blue'),
	(18, 'Sent to vendor by', 4, 'fa fa-paper-plane-o', 'bg-blue'),
	(19, 'Mark as under discussion by', 5, 'fa fa-thumb-tack', 'bg-blue'),
	(20, 'Taged by', 6, 'fa fa-tag', 'bg-blue'),
	(21, 'Un tagged by', 7, 'fa fa-tag', 'bg-red'),
	(22, 'Imported by', 14, 'fafa-thumb-tack', 'bg-blue'),
	(23, 'Save as approved by', 15, 'fa fa-check', 'bg-blue'),
	(24, 'Approved By ', 3, 'fa fa-check', 'bg-blue'),
	(25, 'Rejected By', 4, 'fa fa-close', 'bg-red'),
	(26, 'Deleted By', 6, 'fa fa-trash', 'bg-red'),
	(27, 'Cancelled By', 14, 'fa fa-close', 'bg-red');
/*!40000 ALTER TABLE `common_audit_trial_status` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.common_automation_action
DROP TABLE IF EXISTS `common_automation_action`;
CREATE TABLE IF NOT EXISTS `common_automation_action` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `short_code` varchar(100) NOT NULL,
  `action_name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- Dumping data for table papertrl_default_script.common_automation_action: ~6 rows (approximately)
/*!40000 ALTER TABLE `common_automation_action` DISABLE KEYS */;
INSERT INTO `common_automation_action` (`id`, `short_code`, `action_name`) VALUES
	(1, 'CREATE_APPROVAL_WORKFLOW', 'Create Approval Workflow'),
	(2, 'SEND_EMAIL_NOTIFICATION', 'Send Email Notification'),
	(3, 'SEND_USER_NOTIFICATION', 'Send User Notification'),
	(4, 'SET_FIELD_VALUE', 'Set Field Value'),
	(5, 'EXECUTE_AUTOMATION', 'Execute Automation'),
	(6, 'SYNC_WITH_THIRD_PART_APPLICATION', 'Sync With Third-Part Application');
/*!40000 ALTER TABLE `common_automation_action` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.common_automation_action_config
DROP TABLE IF EXISTS `common_automation_action_config`;
CREATE TABLE IF NOT EXISTS `common_automation_action_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `automation_id` int(11) NOT NULL,
  `action_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `AUTOMATIO_ID_FK1` (`automation_id`),
  KEY `ACTION_ID_FK1` (`action_id`),
  CONSTRAINT `ACTION_ID_FK1` FOREIGN KEY (`action_id`) REFERENCES `common_automation_action` (`id`),
  CONSTRAINT `AUTOMATIO_ID_FK1` FOREIGN KEY (`automation_id`) REFERENCES `common_automation_mst` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table papertrl_default_script.common_automation_action_config: ~0 rows (approximately)
/*!40000 ALTER TABLE `common_automation_action_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_automation_action_config` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.common_automation_chain_config
DROP TABLE IF EXISTS `common_automation_chain_config`;
CREATE TABLE IF NOT EXISTS `common_automation_chain_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `automation_id` int(11) NOT NULL,
  `action_id` int(11) NOT NULL,
  `chain_to` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `AUTOMATION_ID_FK6` (`automation_id`),
  KEY `CHAIN_ID_FK1` (`chain_to`),
  KEY `ACTION_FK9` (`action_id`),
  CONSTRAINT `ACTION_FK9` FOREIGN KEY (`action_id`) REFERENCES `common_automation_action` (`id`),
  CONSTRAINT `AUTOMATION_ID_FK6` FOREIGN KEY (`automation_id`) REFERENCES `common_automation_mst` (`id`),
  CONSTRAINT `CHAIN_ID_FK1` FOREIGN KEY (`chain_to`) REFERENCES `common_automation_mst` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table papertrl_default_script.common_automation_chain_config: ~0 rows (approximately)
/*!40000 ALTER TABLE `common_automation_chain_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_automation_chain_config` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.common_automation_condition
DROP TABLE IF EXISTS `common_automation_condition`;
CREATE TABLE IF NOT EXISTS `common_automation_condition` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `condition_name` varchar(100) NOT NULL,
  `second_value` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- Dumping data for table papertrl_default_script.common_automation_condition: ~10 rows (approximately)
/*!40000 ALTER TABLE `common_automation_condition` DISABLE KEYS */;
INSERT INTO `common_automation_condition` (`id`, `condition_name`, `second_value`) VALUES
	(1, 'Equals', 0),
	(2, 'Not Equals', 0),
	(3, 'Greater Than', 0),
	(4, 'Greater Than or Equal', 0),
	(5, 'Less Than', 0),
	(6, 'Less Than or Equal', 0),
	(7, 'Contains', 0),
	(8, 'Between', 1),
	(9, 'Is Empty', 0),
	(10, 'Is Not Empty', 0);
/*!40000 ALTER TABLE `common_automation_condition` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.common_automation_condition_config
DROP TABLE IF EXISTS `common_automation_condition_config`;
CREATE TABLE IF NOT EXISTS `common_automation_condition_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `automation_id` int(11) NOT NULL,
  `field_id` int(11) NOT NULL,
  `condition_id` int(11) NOT NULL,
  `adjoint_condition` varchar(50) NOT NULL,
  `condition_order` int(11) NOT NULL,
  `first_value` varchar(200) DEFAULT NULL,
  `second_value` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FIELD_ID_FK1` (`field_id`),
  KEY `FIELD_CONDITION_FK1` (`condition_id`),
  KEY `AUTOMATION_ID_FK1` (`automation_id`),
  CONSTRAINT `AUTOMATION_ID_FK1` FOREIGN KEY (`automation_id`) REFERENCES `common_automation_mst` (`id`),
  CONSTRAINT `FIELD_CONDITION_FK1` FOREIGN KEY (`condition_id`) REFERENCES `common_automation_condition` (`id`),
  CONSTRAINT `FIELD_ID_FK1` FOREIGN KEY (`field_id`) REFERENCES `common_automation_field` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table papertrl_default_script.common_automation_condition_config: ~0 rows (approximately)
/*!40000 ALTER TABLE `common_automation_condition_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_automation_condition_config` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.common_automation_document_action_config
DROP TABLE IF EXISTS `common_automation_document_action_config`;
CREATE TABLE IF NOT EXISTS `common_automation_document_action_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `document_type_id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `action_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK__common_automation_event` (`event_id`),
  KEY `FK__common_automation_action` (`action_id`),
  KEY `FK_common_automation_event_action_config_common__document_type` (`document_type_id`),
  CONSTRAINT `FK__common_automation_action` FOREIGN KEY (`action_id`) REFERENCES `common_automation_action` (`id`),
  CONSTRAINT `FK__common_automation_event` FOREIGN KEY (`event_id`) REFERENCES `common_automation_event` (`id`),
  CONSTRAINT `FK_common_automation_event_action_config_common__document_type` FOREIGN KEY (`document_type_id`) REFERENCES `common_automation_document_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=latin1;

-- Dumping data for table papertrl_default_script.common_automation_document_action_config: ~93 rows (approximately)
/*!40000 ALTER TABLE `common_automation_document_action_config` DISABLE KEYS */;
INSERT INTO `common_automation_document_action_config` (`id`, `document_type_id`, `event_id`, `action_id`) VALUES
	(1, 1, 1, 1),
	(2, 1, 1, 2),
	(3, 1, 1, 3),
	(4, 1, 1, 4),
	(5, 1, 2, 2),
	(6, 1, 2, 3),
	(7, 1, 2, 4),
	(8, 1, 3, 2),
	(9, 1, 3, 3),
	(10, 1, 3, 4),
	(11, 1, 3, 6),
	(12, 1, 4, 2),
	(13, 1, 4, 3),
	(14, 1, 5, 2),
	(15, 1, 5, 3),
	(16, 1, 6, 2),
	(17, 1, 6, 3),
	(18, 1, 6, 6),
	(19, 1, 10, 2),
	(20, 1, 10, 3),
	(21, 2, 1, 1),
	(22, 2, 1, 2),
	(23, 2, 1, 3),
	(24, 2, 1, 4),
	(25, 2, 2, 2),
	(26, 2, 2, 3),
	(27, 2, 2, 4),
	(28, 2, 3, 2),
	(29, 2, 3, 3),
	(30, 2, 3, 4),
	(31, 2, 3, 6),
	(32, 2, 4, 2),
	(33, 2, 4, 3),
	(34, 2, 5, 2),
	(35, 2, 5, 3),
	(36, 2, 6, 2),
	(37, 2, 6, 3),
	(38, 2, 6, 6),
	(39, 2, 10, 2),
	(40, 2, 10, 3),
	(41, 4, 1, 1),
	(42, 4, 1, 2),
	(43, 4, 1, 3),
	(44, 4, 1, 4),
	(45, 4, 2, 2),
	(46, 4, 2, 3),
	(47, 4, 2, 4),
	(48, 4, 3, 2),
	(49, 4, 3, 3),
	(50, 4, 3, 4),
	(51, 4, 3, 6),
	(52, 4, 4, 2),
	(53, 4, 4, 3),
	(54, 4, 5, 2),
	(55, 4, 5, 3),
	(56, 4, 6, 2),
	(57, 4, 6, 3),
	(58, 4, 6, 6),
	(59, 4, 10, 2),
	(60, 4, 10, 3),
	(61, 2, 7, 2),
	(62, 2, 7, 3),
	(63, 3, 8, 2),
	(64, 3, 8, 3),
	(65, 3, 8, 6),
	(66, 3, 6, 2),
	(67, 3, 6, 3),
	(68, 3, 6, 6),
	(69, 5, 8, 2),
	(70, 5, 8, 3),
	(71, 5, 8, 6),
	(72, 5, 9, 2),
	(73, 5, 9, 3),
	(74, 5, 9, 6),
	(75, 5, 11, 2),
	(76, 5, 11, 3),
	(77, 5, 11, 6),
	(78, 5, 12, 2),
	(79, 5, 12, 3),
	(80, 5, 13, 2),
	(81, 5, 13, 3),
	(82, 5, 13, 6),
	(83, 1, 14, 2),
	(84, 1, 14, 3),
	(85, 2, 14, 2),
	(86, 2, 14, 3),
	(87, 4, 14, 2),
	(88, 4, 14, 3),
	(89, 1, 9, 2),
	(90, 1, 9, 3),
	(91, 3, 2, 2),
	(92, 3, 2, 3),
	(93, 3, 2, 6);
/*!40000 ALTER TABLE `common_automation_document_action_config` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.common_automation_document_section
DROP TABLE IF EXISTS `common_automation_document_section`;
CREATE TABLE IF NOT EXISTS `common_automation_document_section` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- Dumping data for table papertrl_default_script.common_automation_document_section: ~10 rows (approximately)
/*!40000 ALTER TABLE `common_automation_document_section` DISABLE KEYS */;
INSERT INTO `common_automation_document_section` (`id`, `name`, `status`) VALUES
	(1, 'Header Section', 'A'),
	(2, 'Line Item Section', 'A'),
	(3, 'Item Cost Distribution Section', 'A'),
	(4, 'Expense Cost Distribution Section', 'A'),
	(5, 'Basic Information', 'A'),
	(6, 'Postal Address', 'A'),
	(7, 'Remit Address', 'A'),
	(8, 'W9 Form Information', 'A'),
	(9, 'Account Details Section', 'A'),
	(10, 'Payment Information', 'A');
/*!40000 ALTER TABLE `common_automation_document_section` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.common_automation_document_section_relation
DROP TABLE IF EXISTS `common_automation_document_section_relation`;
CREATE TABLE IF NOT EXISTS `common_automation_document_section_relation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `document_id` int(11) DEFAULT NULL,
  `section_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- Dumping data for table papertrl_default_script.common_automation_document_section_relation: ~18 rows (approximately)
/*!40000 ALTER TABLE `common_automation_document_section_relation` DISABLE KEYS */;
INSERT INTO `common_automation_document_section_relation` (`id`, `document_id`, `section_id`) VALUES
	(1, 1, 1),
	(2, 1, 2),
	(3, 1, 3),
	(4, 1, 4),
	(5, 2, 1),
	(6, 2, 2),
	(7, 3, 1),
	(8, 3, 2),
	(9, 4, 1),
	(10, 4, 2),
	(11, 5, 1),
	(12, 6, 5),
	(13, 6, 6),
	(14, 6, 7),
	(15, 6, 8),
	(16, 2, 9),
	(17, 3, 9),
	(18, 6, 10);
/*!40000 ALTER TABLE `common_automation_document_section_relation` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.common_automation_document_type
DROP TABLE IF EXISTS `common_automation_document_type`;
CREATE TABLE IF NOT EXISTS `common_automation_document_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `document_type` varchar(100) NOT NULL,
  `short_code` varchar(100) NOT NULL,
  `status` char(1) NOT NULL,
  `show_hide_enable` tinyint(1) DEFAULT NULL,
  `automation_enable` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- Dumping data for table papertrl_default_script.common_automation_document_type: ~6 rows (approximately)
/*!40000 ALTER TABLE `common_automation_document_type` DISABLE KEYS */;
INSERT INTO `common_automation_document_type` (`id`, `document_type`, `short_code`, `status`, `show_hide_enable`, `automation_enable`) VALUES
	(1, 'Bill', 'BILL', 'A', 0, 1),
	(2, 'Purchase Order', 'PO', 'A', 1, 1),
	(3, 'Purchase Order Receipt', 'PO_RECEIPT', 'A', 0, 1),
	(4, 'Expense Report', 'EXPENSE', 'A', 0, 1),
	(5, 'Payment', 'BILL_PAYMENT', 'A', 0, 1),
	(6, 'Vendor', 'VENDOR', 'A', 0, 0);
/*!40000 ALTER TABLE `common_automation_document_type` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.common_automation_document_type_config
DROP TABLE IF EXISTS `common_automation_document_type_config`;
CREATE TABLE IF NOT EXISTS `common_automation_document_type_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `automation_id` int(11) NOT NULL,
  `document_type_id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_AUTOMATION_ID1` (`automation_id`),
  KEY `FK_DOCUMENT_TYPE1` (`document_type_id`),
  KEY `FK_EVENT1` (`event_id`),
  CONSTRAINT `FK_AUTOMATION_ID1` FOREIGN KEY (`automation_id`) REFERENCES `common_automation_mst` (`id`),
  CONSTRAINT `FK_DOCUMENT_TYPE1` FOREIGN KEY (`document_type_id`) REFERENCES `common_automation_document_type` (`id`),
  CONSTRAINT `FK_EVENT1` FOREIGN KEY (`event_id`) REFERENCES `common_automation_event` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table papertrl_default_script.common_automation_document_type_config: ~0 rows (approximately)
/*!40000 ALTER TABLE `common_automation_document_type_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_automation_document_type_config` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.common_automation_document_type_event
DROP TABLE IF EXISTS `common_automation_document_type_event`;
CREATE TABLE IF NOT EXISTS `common_automation_document_type_event` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `document_type_id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `DOC_TYPE_FK` (`document_type_id`),
  KEY `EVENT_FK` (`event_id`),
  CONSTRAINT `DOC_TYPE_FK` FOREIGN KEY (`document_type_id`) REFERENCES `common_automation_document_type` (`id`),
  CONSTRAINT `EVENT_FK` FOREIGN KEY (`event_id`) REFERENCES `common_automation_event` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

-- Dumping data for table papertrl_default_script.common_automation_document_type_event: ~34 rows (approximately)
/*!40000 ALTER TABLE `common_automation_document_type_event` DISABLE KEYS */;
INSERT INTO `common_automation_document_type_event` (`id`, `document_type_id`, `event_id`, `sort_order`) VALUES
	(1, 1, 1, 0),
	(2, 1, 2, 0),
	(3, 1, 3, 0),
	(4, 1, 5, 0),
	(5, 1, 4, 0),
	(6, 1, 6, 0),
	(7, 1, 9, 0),
	(8, 1, 10, 0),
	(9, 2, 1, 0),
	(10, 2, 2, 0),
	(11, 2, 3, 0),
	(12, 2, 5, 0),
	(13, 2, 4, 0),
	(14, 2, 6, 0),
	(16, 2, 10, 0),
	(17, 4, 1, 0),
	(18, 4, 2, 0),
	(19, 4, 3, 0),
	(20, 4, 5, 0),
	(21, 4, 4, 0),
	(22, 4, 6, 0),
	(24, 4, 10, 0),
	(25, 2, 7, 0),
	(26, 3, 8, 0),
	(27, 3, 6, 0),
	(28, 3, 2, 0),
	(29, 5, 8, 0),
	(31, 5, 9, 0),
	(32, 5, 11, 0),
	(33, 5, 12, 0),
	(34, 5, 13, 0),
	(35, 1, 14, 0),
	(36, 2, 14, 0),
	(37, 4, 14, 0);
/*!40000 ALTER TABLE `common_automation_document_type_event` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.common_automation_email_config
DROP TABLE IF EXISTS `common_automation_email_config`;
CREATE TABLE IF NOT EXISTS `common_automation_email_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `automation_id` int(11) NOT NULL,
  `action_id` int(11) NOT NULL,
  `email_address` varchar(500) NOT NULL,
  `email_subject` varchar(100) NOT NULL,
  `email_content` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `AUTOMATION_ID_FK3` (`automation_id`),
  KEY `ACTION_FK5` (`action_id`),
  CONSTRAINT `ACTION_FK5` FOREIGN KEY (`action_id`) REFERENCES `common_automation_action` (`id`),
  CONSTRAINT `AUTOMATION_ID_FK3` FOREIGN KEY (`automation_id`) REFERENCES `common_automation_mst` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table papertrl_default_script.common_automation_email_config: ~0 rows (approximately)
/*!40000 ALTER TABLE `common_automation_email_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_automation_email_config` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.common_automation_event
DROP TABLE IF EXISTS `common_automation_event`;
CREATE TABLE IF NOT EXISTS `common_automation_event` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event_name` varchar(100) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- Dumping data for table papertrl_default_script.common_automation_event: ~14 rows (approximately)
/*!40000 ALTER TABLE `common_automation_event` DISABLE KEYS */;
INSERT INTO `common_automation_event` (`id`, `event_name`, `sort_order`) VALUES
	(1, 'Submit', 0),
	(2, 'Edit & Resubmit', 0),
	(3, 'Approve', 0),
	(4, 'Reject', 0),
	(5, 'Skip Approval', 0),
	(6, 'Delete', 0),
	(7, 'Send to Vendor', 0),
	(8, 'Create', 0),
	(9, 'Upload', 0),
	(10, 'Reassign', 0),
	(11, 'Void', 0),
	(12, 'Mark as Mail', 0),
	(13, 'Apply to Different Bill', 0),
	(14, 'Save as Approve', 0);
/*!40000 ALTER TABLE `common_automation_event` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.common_automation_expense_cost_config
DROP TABLE IF EXISTS `common_automation_expense_cost_config`;
CREATE TABLE IF NOT EXISTS `common_automation_expense_cost_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `automation_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `account_name` varchar(200) NOT NULL,
  `description` varchar(500) NOT NULL DEFAULT '',
  `project_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_vp_vendor_item_cost_distribution_common_chart_of_account` (`account_id`),
  KEY `PROJECT_ID_FK_3` (`project_id`),
  KEY `AUTOMATION_ID_FK_12` (`automation_id`),
  CONSTRAINT `AUTOMATION_ID_FK_12` FOREIGN KEY (`automation_id`) REFERENCES `common_automation_mst` (`id`),
  CONSTRAINT `common_automation_expense_cost_config_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `common_account_number` (`id`),
  CONSTRAINT `common_automation_expense_cost_config_ibfk_3` FOREIGN KEY (`project_id`) REFERENCES `common_approval_code` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Dumping data for table papertrl_default_script.common_automation_expense_cost_config: ~0 rows (approximately)
/*!40000 ALTER TABLE `common_automation_expense_cost_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_automation_expense_cost_config` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.common_automation_field
DROP TABLE IF EXISTS `common_automation_field`;
CREATE TABLE IF NOT EXISTS `common_automation_field` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `document_type` int(11) NOT NULL,
  `short_code` varchar(100) DEFAULT NULL,
  `field_name` varchar(200) NOT NULL,
  `condition_enable` tinyint(1) NOT NULL,
  `action_enable` tinyint(1) NOT NULL,
  `show_hide_enable` tinyint(1) NOT NULL,
  `show_hide_enable_default` tinyint(1) DEFAULT 0,
  `data_type` varchar(50) NOT NULL,
  `drop_down_id` int(11) DEFAULT NULL,
  `drop_down_url` varchar(200) DEFAULT NULL,
  `second_value` tinyint(1) NOT NULL,
  `max_length` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `DOCUMENT_TYPE_FK` (`document_type`),
  KEY `FK_common_automation_field_common_drop_down` (`drop_down_id`),
  CONSTRAINT `DOCUMENT_TYPE_FK` FOREIGN KEY (`document_type`) REFERENCES `common_automation_document_type` (`id`),
  CONSTRAINT `FK_common_automation_field_common_drop_down` FOREIGN KEY (`drop_down_id`) REFERENCES `common_drop_down` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8;

-- Dumping data for table papertrl_default_script.common_automation_field: ~89 rows (approximately)
/*!40000 ALTER TABLE `common_automation_field` DISABLE KEYS */;
INSERT INTO `common_automation_field` (`id`, `document_type`, `short_code`, `field_name`, `condition_enable`, `action_enable`, `show_hide_enable`, `show_hide_enable_default`, `data_type`, `drop_down_id`, `drop_down_url`, `second_value`, `max_length`) VALUES
	(1, 1, 'billNo', 'Bill Number', 1, 1, 0, 0, 'text', NULL, NULL, 0, 50),
	(2, 1, 'billAmount', 'Bill Amount', 1, 1, 0, 0, 'decimal', NULL, NULL, 1, 19),
	(3, 1, 'vendorId', 'Vendor', 1, 1, 0, 0, 'int', NULL, '/vendor_portal/sec_local_vendor_dropdown_list_v2', 0, 0),
	(4, 1, 'templateId', 'Bill Template', 1, 1, 0, 0, 'int', NULL, '/vendor_portal/sec_get_all_bill_templates_v2', 0, 0),
	(5, 1, 'poId', 'PO Number', 1, 1, 1, 1, 'int', NULL, '/vendor_portal/sec_get_approved_po_list_v2', 0, 0),
	(6, 1, 'receiptId', 'PO Receipt Number', 1, 1, 1, 1, 'int', NULL, '/vendor_portal/sec_get_all_receipt_drop_down_v2', 0, 0),
	(7, 1, 'billDateFormat', 'Date Format', 0, 0, 0, 0, 'int', NULL, '/common_service/sec_view_dateformats_v2', 0, 0),
	(8, 1, 'billDate', 'Bill Date', 1, 1, 0, 0, 'date', NULL, NULL, 1, 0),
	(9, 1, 'term', 'Payment Term', 1, 1, 0, 0, 'int', NULL, '/vendor_portal/sec_get_bill_terms_list_v2', 0, 0),
	(10, 1, 'dueDate', 'Due Date', 1, 1, 0, 0, 'date', NULL, NULL, 1, 0),
	(11, 1, 'additionalNotes', 'Comment', 0, 0, 1, 1, 'text', NULL, NULL, 0, 50),
	(12, 1, 'itemId', 'Item Code', 0, 0, 0, 0, 'int', NULL, '/common_service/sec_get_item_dropdown_list_v2', 0, 0),
	(13, 1, 'description', 'Item Name', 0, 0, 0, 0, 'text', NULL, NULL, 0, 50),
	(14, 1, 'qty', 'Units', 0, 0, 0, 0, 'int', NULL, NULL, 1, 50),
	(15, 1, 'rate', 'Unit Price', 0, 0, 0, 0, 'decimal', NULL, NULL, 1, 19),
	(16, 1, 'tax', 'Tax Amount', 0, 0, 1, 1, 'decimal', NULL, NULL, 1, 19),
	(17, 3, 'receiptNumber', 'PO Receipt Number', 1, 1, 0, 0, 'text', NULL, NULL, 0, 50),
	(18, 3, 'receiptDate', 'PO Receipt Date', 1, 1, 0, 0, 'date', NULL, NULL, 1, 0),
	(19, 3, 'vendorId', 'Vendor', 1, 1, 0, 0, 'int', NULL, '/vendor_portal/sec_local_vendor_dropdown_list_v2', 0, 0),
	(20, 3, 'poId', 'PO Number', 1, 1, 0, 0, 'text', NULL, NULL, 0, 50),
	(21, 3, 'poDate', 'PO Date', 1, 1, 0, 0, 'date', NULL, NULL, 1, 0),
	(22, 3, 'receivedBy', 'Received By', 0, 0, 0, 0, 'int', NULL, NULL, 0, 0),
	(23, 3, 'itemNumber', 'Item Number', 0, 0, 1, 1, 'text', NULL, NULL, 0, 50),
	(24, 3, 'description', 'Item Name', 0, 0, 1, 1, 'text', NULL, NULL, 0, 50),
	(25, 3, 'uom', 'UOM', 0, 0, 1, 1, 'int', NULL, '/common_service/sec_get_uom_dropdown_list', 0, 0),
	(26, 3, 'remainingQty', 'Remaining Qty', 0, 0, 1, 1, 'int', NULL, NULL, 1, 50),
	(27, 3, 'receivedQty', 'Received Qty', 0, 0, 1, 1, 'int', NULL, NULL, 1, 50),
	(28, 3, 'unitPrice', 'Unit Price', 0, 0, 1, 1, 'decimal', NULL, NULL, 1, 19),
	(29, 3, 'amount', 'Amount', 0, 0, 1, 1, 'decimal', NULL, NULL, 1, 19),
	(30, 3, 'totalAmount', 'Total Amount', 1, 1, 0, 0, 'decimal', NULL, NULL, 1, 19),
	(31, 3, 'notes', 'Notes', 0, 0, 0, 0, 'text', NULL, NULL, 0, 50),
	(32, 2, 'poNumber', 'PO Number', 1, 1, 1, 1, 'text', NULL, NULL, 0, 50),
	(33, 2, 'createdOn', 'Submit Date', 1, 1, 1, 1, 'date', NULL, NULL, 1, 0),
	(34, 2, 'vendorId', 'Vendor', 1, 1, 0, 0, 'int', NULL, '/vendor_portal/sec_local_vendor_dropdown_list_v2', 0, 0),
	(35, 2, 'projectCodeId', 'Project / Task', 1, 1, 1, 1, 'int', NULL, '/common_service/sec_get_detailed_approval_codes_by_category?categoryId=2', 0, 0),
	(36, 2, 'deliveryDate', 'Date of Delivery ', 1, 1, 1, 1, 'date', NULL, NULL, 1, 0),
	(37, 2, 'pocPhone', 'Contact Number', 0, 1, 1, 1, 'text', NULL, NULL, 0, 50),
	(38, 2, 'pocName', 'Contact Person', 1, 1, 1, 1, 'text', NULL, NULL, 0, 50),
	(39, 2, 'notes', 'Notes', 0, 0, 1, 1, 'text', NULL, NULL, 0, 50),
	(40, 2, 'shippingAddress', 'Shipping Address', 0, 0, 1, 1, 'text', NULL, NULL, 0, 50),
	(41, 2, 'billingAddress', 'Billing Address', 0, 0, 1, 1, 'text', NULL, NULL, 0, 0),
	(42, 2, 'purchaseOrderDetails.itemNumber', 'Item Number', 0, 0, 1, 1, 'int', NULL, '/common_service/sec_get_item_dropdown_list_v2', 0, 0),
	(43, 2, 'purchaseOrderDetails.itemName', 'Item Name', 0, 0, 1, 1, 'text', NULL, NULL, 0, 50),
	(44, 2, 'purchaseOrderDetails.uomId', 'UOM', 0, 0, 1, 1, 'int', NULL, '/common_service/sec_get_uom_dropdown_list', 0, 0),
	(45, 2, 'purchaseOrderDetails.qty', 'QTY', 0, 0, 1, 1, 'int', NULL, NULL, 1, 50),
	(46, 2, 'purchaseOrderDetails.unitPrice', 'Price', 0, 0, 1, 1, 'decimal', NULL, NULL, 1, 19),
	(47, 2, 'purchaseOrderDetails.discountAmount', 'Discount', 0, 0, 1, 1, 'decimal', NULL, NULL, 1, 19),
	(48, 2, 'purchaseOrderDetails.amount', 'Item Line Amount', 0, 0, 1, 1, 'decimal', NULL, NULL, 1, 19),
	(49, 2, 'taxAmount', 'Tax amount', 1, 1, 1, 1, 'decimal', NULL, NULL, 1, 19),
	(50, 2, 'discountAmount', 'Discount Amount', 1, 1, 1, 1, 'decimal', NULL, NULL, 1, 19),
	(51, 2, 'netAmount', 'Net Amount', 1, 1, 1, 1, 'decimal', NULL, NULL, 1, 19),
	(52, 4, 'reportName', 'Report Name', 1, 0, 1, 1, 'text', NULL, NULL, 0, 50),
	(53, 4, 'businessPurpose', 'Business Purpose', 1, 0, 1, 1, 'text', NULL, NULL, 0, 50),
	(55, 4, 'startFrom', 'Date From', 0, 0, 0, 0, 'date', NULL, NULL, 1, 0),
	(56, 4, 'merchant', 'Merchant', 0, 0, 0, 0, 'text', NULL, NULL, 0, 50),
	(57, 4, 'projectAccountCode', 'Project / Task', 0, 0, 0, 0, 'int', NULL, '/common_service/sec_get_detailed_approval_codes_by_category', 0, 0),
	(58, 4, 'expenseType', 'Expense Type', 0, 0, 0, 0, 'int', NULL, '/vendor_portal/sec_get_account_dropdown_list', 0, 0),
	(59, 4, 'amount', 'Line Amount', 0, 0, 0, 0, 'decimal', NULL, NULL, 1, 19),
	(60, 4, 'totalAmount', 'Total Amount', 1, 1, 0, 0, 'decimal', NULL, NULL, 1, 19),
	(61, 4, 'notes', 'Notes', 0, 0, 1, 1, 'text', NULL, NULL, 0, 50),
	(64, 5, 'billId', 'Bill Number', 1, 1, 0, 0, 'int', NULL, '/vendor_portal/sec_get_all_bills_dropdown_v2', 0, 0),
	(65, 5, 'paymentType', 'Payment Method', 1, 1, 0, 0, 'int', NULL, '/common_service/sec_view_payment_types', 0, 0),
	(66, 5, 'paymentReferanceNo', 'Payment Reference', 1, 1, 0, 0, 'text', NULL, NULL, 0, 50),
	(67, 5, 'billDate', 'Invoice Date', 0, 1, 0, 0, 'date', NULL, NULL, 1, 0),
	(68, 5, 'paymentDate', 'Payment Date', 1, 1, 0, 0, 'date', NULL, NULL, 1, 0),
	(69, 5, 'balanceToBePaid', 'Balance to be Paid', 0, 1, 0, 0, 'decimal', NULL, NULL, 1, 19),
	(70, 5, 'amount', 'Payment Amount', 1, 1, 0, 0, 'decimal', NULL, NULL, 1, 19),
	(71, 5, 'discountAmount', 'Discount Amount', 1, 1, 0, 0, 'decimal', NULL, NULL, 1, 19),
	(73, 2, 'status', 'Status', 1, 1, 0, 1, 'int', 12, NULL, 0, 0),
	(74, 1, 'status', 'Status', 1, 1, 0, 0, 'int', 12, NULL, 0, 0),
	(75, 1, 'submittedBy', 'Submit User', 1, 0, 0, 0, 'int', NULL, '/user_management/sec_get_userlist_dropdown', 0, 0),
	(76, 2, 'createdBy', 'Submit User', 1, 0, 0, 0, 'int', NULL, '/user_management/sec_get_userlist_dropdown', 0, 0),
	(77, 3, 'createdBy', 'Created User', 1, 0, 0, 0, 'int', NULL, '/user_management/sec_get_userlist_dropdown', 0, 0),
	(78, 4, 'createdBy', 'Created User', 1, 0, 0, 0, 'int', NULL, '/user_management/sec_get_userlist_dropdown', 0, 0),
	(79, 5, 'createdBy', 'Created User', 1, 0, 0, 0, 'int', NULL, '/user_management/sec_get_userlist_dropdown', 0, 0),
	(80, 4, 'endDate', 'Date To', 0, 0, 0, 0, 'date', NULL, NULL, 1, 0),
	(81, 2, 'ItemGrossAmount', 'Item Gross Amount', 0, 0, 1, 1, 'decimal', NULL, NULL, 1, 19),
	(82, 2, 'poDate', 'PO Date', 0, 0, 1, 1, 'date', NULL, NULL, 1, 50),
	(83, 2, 'purchaseOrderDetails.description', 'Description', 0, 0, 1, 1, 'text', NULL, NULL, 0, 50),
	(86, 2, 'departmentName', 'Department', 0, 0, 1, 1, 'text', NULL, NULL, 1, 100),
	(87, 2, 'purchaseOrderDetails.departmentName', 'Item Line Department', 0, 0, 1, 1, 'text', NULL, NULL, 1, 100),
	(88, 2, 'purchaseOrderAccountDetails.departmentName', 'Account Line Department', 0, 0, 1, 1, 'text', NULL, NULL, 1, 100),
	(89, 2, 'accountGrossAmount', 'Account Gross Amount', 0, 0, 1, 1, 'decimal', NULL, NULL, 1, 19),
	(90, 2, 'purchaseOrderAccountDetails.accountNumber', 'Account Number', 0, 0, 1, 0, 'text', NULL, NULL, 1, 50),
	(91, 2, 'purchaseOrderAccountDetails.accountName', 'Account Name', 0, 0, 1, 1, 'text', NULL, NULL, 1, 300),
	(92, 2, 'purchaseOrderAccountDetails.amount', 'Account Line Amount', 0, 0, 1, 1, 'decimal', NULL, NULL, 1, 19),
	(93, 1, 'departmentId', 'Department', 1, 1, 0, 0, 'int', 23, '/common_service/sec_get_department', 0, 0),
	(94, 2, 'departmentId', 'Department', 1, 1, 0, 0, 'int', 23, '/common_service/sec_get_department', 0, 0),
	(95, 4, 'departmentId', 'Department', 1, 1, 0, 0, 'int', 23, '/common_service/sec_get_department', 0, 0);
/*!40000 ALTER TABLE `common_automation_field` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.common_automation_field_condition
DROP TABLE IF EXISTS `common_automation_field_condition`;
CREATE TABLE IF NOT EXISTS `common_automation_field_condition` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field_id` int(11) NOT NULL,
  `condition_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FIELD_ID_FK4` (`field_id`),
  KEY `FILED_CONDITION_FK3` (`condition_id`),
  CONSTRAINT `FIELD_ID_FK4` FOREIGN KEY (`field_id`) REFERENCES `common_automation_field` (`id`),
  CONSTRAINT `FILED_CONDITION_FK3` FOREIGN KEY (`condition_id`) REFERENCES `common_automation_condition` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=403 DEFAULT CHARSET=utf8;

-- Dumping data for table papertrl_default_script.common_automation_field_condition: ~353 rows (approximately)
/*!40000 ALTER TABLE `common_automation_field_condition` DISABLE KEYS */;
INSERT INTO `common_automation_field_condition` (`id`, `field_id`, `condition_id`) VALUES
	(1, 1, 1),
	(2, 1, 2),
	(3, 1, 7),
	(4, 2, 1),
	(5, 2, 2),
	(6, 2, 3),
	(7, 2, 4),
	(8, 2, 5),
	(9, 2, 6),
	(11, 2, 8),
	(12, 3, 1),
	(13, 3, 2),
	(15, 4, 1),
	(16, 4, 2),
	(18, 5, 1),
	(19, 5, 2),
	(21, 6, 1),
	(22, 6, 2),
	(24, 7, 1),
	(25, 7, 1),
	(26, 7, 7),
	(27, 8, 1),
	(28, 8, 2),
	(29, 8, 3),
	(30, 8, 4),
	(31, 8, 5),
	(32, 8, 6),
	(34, 8, 8),
	(35, 9, 1),
	(36, 9, 2),
	(38, 10, 1),
	(39, 10, 2),
	(40, 10, 3),
	(41, 10, 4),
	(42, 10, 5),
	(43, 10, 6),
	(45, 10, 8),
	(46, 11, 1),
	(47, 11, 2),
	(48, 11, 7),
	(49, 12, 1),
	(50, 12, 2),
	(51, 12, 7),
	(52, 13, 1),
	(53, 13, 2),
	(54, 13, 7),
	(55, 14, 1),
	(56, 14, 2),
	(57, 14, 3),
	(58, 14, 4),
	(59, 14, 5),
	(60, 14, 6),
	(61, 14, 7),
	(62, 14, 8),
	(63, 15, 1),
	(64, 15, 2),
	(65, 15, 3),
	(66, 15, 4),
	(67, 15, 5),
	(68, 15, 6),
	(69, 15, 7),
	(70, 15, 8),
	(71, 16, 1),
	(72, 16, 2),
	(73, 16, 3),
	(74, 16, 4),
	(75, 16, 5),
	(76, 16, 6),
	(77, 16, 7),
	(78, 16, 8),
	(79, 17, 1),
	(80, 17, 2),
	(82, 18, 1),
	(83, 18, 2),
	(84, 18, 3),
	(85, 18, 4),
	(86, 18, 5),
	(87, 18, 6),
	(89, 18, 8),
	(90, 19, 1),
	(91, 19, 2),
	(93, 20, 1),
	(94, 20, 2),
	(96, 21, 1),
	(97, 21, 2),
	(98, 21, 3),
	(99, 21, 4),
	(100, 21, 5),
	(101, 21, 6),
	(103, 21, 8),
	(104, 22, 1),
	(105, 22, 2),
	(106, 22, 7),
	(107, 23, 1),
	(108, 23, 2),
	(109, 23, 7),
	(110, 24, 1),
	(111, 24, 2),
	(112, 24, 7),
	(113, 25, 1),
	(114, 25, 2),
	(115, 25, 7),
	(116, 26, 1),
	(117, 26, 2),
	(118, 26, 3),
	(119, 26, 4),
	(120, 26, 5),
	(121, 26, 6),
	(122, 26, 7),
	(123, 26, 8),
	(124, 27, 1),
	(125, 27, 2),
	(126, 27, 3),
	(127, 27, 4),
	(128, 27, 5),
	(129, 27, 6),
	(130, 27, 7),
	(131, 27, 8),
	(132, 28, 1),
	(133, 28, 2),
	(134, 28, 3),
	(135, 28, 4),
	(136, 28, 5),
	(137, 28, 6),
	(138, 28, 7),
	(139, 28, 8),
	(140, 29, 1),
	(141, 29, 2),
	(142, 29, 3),
	(143, 29, 4),
	(144, 29, 5),
	(145, 29, 6),
	(146, 29, 7),
	(147, 29, 8),
	(148, 30, 1),
	(149, 30, 2),
	(150, 30, 3),
	(151, 30, 4),
	(152, 30, 5),
	(153, 30, 6),
	(155, 30, 8),
	(156, 31, 1),
	(157, 31, 2),
	(158, 31, 7),
	(159, 32, 1),
	(160, 32, 2),
	(162, 33, 1),
	(163, 33, 2),
	(164, 33, 3),
	(165, 33, 4),
	(166, 33, 5),
	(167, 33, 6),
	(169, 33, 8),
	(170, 34, 1),
	(171, 34, 2),
	(173, 35, 1),
	(174, 35, 2),
	(176, 36, 1),
	(177, 36, 2),
	(178, 36, 3),
	(179, 36, 4),
	(180, 36, 5),
	(181, 36, 6),
	(183, 36, 8),
	(184, 37, 1),
	(185, 37, 2),
	(186, 37, 7),
	(187, 38, 1),
	(188, 38, 2),
	(189, 38, 7),
	(190, 39, 1),
	(191, 39, 2),
	(192, 39, 7),
	(193, 40, 1),
	(194, 40, 2),
	(195, 40, 7),
	(196, 41, 1),
	(197, 41, 2),
	(198, 41, 7),
	(199, 42, 1),
	(200, 42, 2),
	(201, 42, 7),
	(202, 43, 1),
	(203, 43, 2),
	(204, 43, 7),
	(205, 44, 1),
	(206, 44, 2),
	(207, 44, 7),
	(208, 45, 1),
	(209, 45, 2),
	(210, 45, 3),
	(211, 45, 4),
	(212, 45, 5),
	(213, 45, 6),
	(214, 45, 7),
	(215, 45, 8),
	(216, 46, 1),
	(217, 46, 2),
	(218, 46, 3),
	(219, 46, 4),
	(220, 46, 5),
	(221, 46, 6),
	(222, 46, 7),
	(223, 46, 8),
	(224, 47, 1),
	(225, 47, 2),
	(226, 47, 3),
	(227, 47, 4),
	(228, 47, 5),
	(229, 47, 6),
	(231, 47, 8),
	(232, 48, 1),
	(233, 48, 2),
	(234, 48, 3),
	(235, 48, 4),
	(236, 48, 5),
	(237, 48, 6),
	(238, 48, 7),
	(239, 48, 8),
	(240, 49, 1),
	(241, 49, 2),
	(242, 49, 3),
	(243, 49, 4),
	(244, 49, 5),
	(245, 49, 6),
	(247, 49, 8),
	(248, 50, 1),
	(249, 50, 2),
	(250, 50, 3),
	(251, 50, 4),
	(252, 50, 5),
	(253, 50, 6),
	(254, 50, 7),
	(255, 50, 8),
	(256, 51, 1),
	(257, 51, 2),
	(258, 51, 3),
	(259, 51, 4),
	(260, 51, 5),
	(261, 51, 6),
	(263, 51, 8),
	(264, 52, 1),
	(265, 52, 2),
	(266, 52, 7),
	(267, 53, 1),
	(268, 53, 2),
	(269, 53, 7),
	(273, 55, 1),
	(274, 55, 2),
	(275, 55, 3),
	(276, 55, 4),
	(277, 55, 5),
	(278, 55, 6),
	(280, 55, 8),
	(281, 56, 1),
	(282, 56, 2),
	(283, 56, 7),
	(284, 57, 1),
	(285, 57, 2),
	(286, 57, 7),
	(287, 58, 1),
	(288, 58, 2),
	(289, 58, 7),
	(290, 59, 1),
	(291, 59, 2),
	(292, 59, 3),
	(293, 59, 4),
	(294, 59, 5),
	(295, 59, 6),
	(296, 59, 7),
	(297, 59, 8),
	(298, 60, 1),
	(299, 60, 2),
	(300, 60, 3),
	(301, 60, 4),
	(302, 60, 5),
	(303, 60, 6),
	(305, 60, 8),
	(306, 61, 1),
	(307, 61, 2),
	(308, 61, 7),
	(315, 64, 1),
	(316, 64, 2),
	(318, 65, 1),
	(319, 65, 2),
	(321, 66, 1),
	(322, 66, 2),
	(323, 66, 7),
	(324, 67, 1),
	(325, 67, 2),
	(326, 67, 3),
	(327, 67, 4),
	(328, 67, 5),
	(329, 67, 6),
	(331, 67, 8),
	(332, 68, 1),
	(333, 68, 2),
	(334, 68, 3),
	(335, 68, 4),
	(336, 68, 5),
	(337, 68, 6),
	(339, 68, 8),
	(340, 69, 1),
	(341, 69, 2),
	(342, 69, 3),
	(343, 69, 4),
	(344, 69, 5),
	(345, 69, 6),
	(347, 69, 8),
	(348, 70, 1),
	(349, 70, 2),
	(350, 70, 3),
	(351, 70, 4),
	(352, 70, 5),
	(353, 70, 6),
	(355, 70, 8),
	(356, 71, 1),
	(357, 71, 2),
	(358, 71, 3),
	(359, 71, 4),
	(360, 71, 5),
	(361, 71, 6),
	(363, 71, 8),
	(367, 73, 1),
	(368, 73, 2),
	(370, 74, 1),
	(371, 74, 2),
	(373, 5, 9),
	(374, 6, 9),
	(375, 75, 1),
	(376, 75, 2),
	(378, 76, 1),
	(379, 76, 2),
	(381, 77, 1),
	(382, 77, 2),
	(384, 78, 1),
	(385, 78, 2),
	(387, 79, 1),
	(388, 79, 2),
	(389, 80, 1),
	(390, 80, 2),
	(391, 80, 3),
	(392, 80, 4),
	(393, 80, 5),
	(394, 80, 6),
	(395, 80, 8),
	(396, 93, 1),
	(397, 93, 2),
	(398, 94, 1),
	(399, 94, 2),
	(400, 95, 1),
	(401, 95, 2),
	(402, 5, 10);
/*!40000 ALTER TABLE `common_automation_field_condition` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.common_automation_field_config
DROP TABLE IF EXISTS `common_automation_field_config`;
CREATE TABLE IF NOT EXISTS `common_automation_field_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `automation_id` int(11) NOT NULL,
  `action_id` int(11) NOT NULL,
  `field_id` int(11) NOT NULL,
  `field_value` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `AUTOMATION_ID_FK5` (`automation_id`),
  KEY `FIELD_ID_FK2` (`field_id`),
  KEY `ACTION_FK8` (`action_id`),
  CONSTRAINT `ACTION_FK8` FOREIGN KEY (`action_id`) REFERENCES `common_automation_action` (`id`),
  CONSTRAINT `AUTOMATION_ID_FK5` FOREIGN KEY (`automation_id`) REFERENCES `common_automation_mst` (`id`),
  CONSTRAINT `FIELD_ID_FK2` FOREIGN KEY (`field_id`) REFERENCES `common_automation_field` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table papertrl_default_script.common_automation_field_config: ~0 rows (approximately)
/*!40000 ALTER TABLE `common_automation_field_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_automation_field_config` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.common_automation_item_cost_config
DROP TABLE IF EXISTS `common_automation_item_cost_config`;
CREATE TABLE IF NOT EXISTS `common_automation_item_cost_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `automation_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `description` varchar(500) NOT NULL DEFAULT '',
  `project_id` int(11) DEFAULT NULL,
  `item_number` varchar(50) DEFAULT '',
  `item_name` varchar(300) DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `FK_vp_invoice_item_cost_distribution_common_product_mst` (`item_id`),
  KEY `AUTOMATION_FK_10` (`automation_id`),
  KEY `PROJECT_ID_FK_2` (`project_id`),
  CONSTRAINT `AUTOMATION_FK_10` FOREIGN KEY (`automation_id`) REFERENCES `common_automation_mst` (`id`),
  CONSTRAINT `PROJECT_ID_FK_2` FOREIGN KEY (`project_id`) REFERENCES `common_approval_code` (`id`),
  CONSTRAINT `common_automation_item_cost_config_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `common_item_mst` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- Dumping data for table papertrl_default_script.common_automation_item_cost_config: ~0 rows (approximately)
/*!40000 ALTER TABLE `common_automation_item_cost_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_automation_item_cost_config` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.common_automation_mst
DROP TABLE IF EXISTS `common_automation_mst`;
CREATE TABLE IF NOT EXISTS `common_automation_mst` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(100) CHARACTER SET latin1 NOT NULL,
  `automation_name` varchar(100) NOT NULL,
  `document_type` int(11) DEFAULT NULL,
  `document_event` int(11) DEFAULT NULL,
  `created_on` datetime NOT NULL,
  `update_by` varchar(100) DEFAULT NULL,
  `update_on` datetime DEFAULT NULL,
  `delete_by` varchar(100) DEFAULT NULL,
  `delete_on` datetime DEFAULT NULL,
  `status` char(1) NOT NULL DEFAULT '',
  `created_by` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_common_automation_mst_common_automation_document_type` (`document_type`),
  KEY `FK_common_automation_mst_common_automation_event` (`document_event`),
  CONSTRAINT `FK_common_automation_mst_common_automation_document_type` FOREIGN KEY (`document_type`) REFERENCES `common_automation_document_type` (`id`),
  CONSTRAINT `FK_common_automation_mst_common_automation_event` FOREIGN KEY (`document_event`) REFERENCES `common_automation_event` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table papertrl_default_script.common_automation_mst: ~0 rows (approximately)
/*!40000 ALTER TABLE `common_automation_mst` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_automation_mst` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.common_automation_notification
DROP TABLE IF EXISTS `common_automation_notification`;
CREATE TABLE IF NOT EXISTS `common_automation_notification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `notification_config_id` int(11) DEFAULT NULL,
  `document_type` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `notifiled_user` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `NOTIFICATION_CONFIG_FK1` (`notification_config_id`),
  KEY `DOCUMENT_TYPE_FK7` (`document_type`),
  KEY `EVENT_ID_FK_1` (`event_id`),
  CONSTRAINT `DOCUMENT_TYPE_FK7` FOREIGN KEY (`document_type`) REFERENCES `common_automation_document_type` (`id`),
  CONSTRAINT `EVENT_ID_FK_1` FOREIGN KEY (`event_id`) REFERENCES `common_automation_event` (`id`),
  CONSTRAINT `NOTIFICATION_CONFIG_FK1` FOREIGN KEY (`notification_config_id`) REFERENCES `common_automation_notification_config` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table papertrl_default_script.common_automation_notification: ~0 rows (approximately)
/*!40000 ALTER TABLE `common_automation_notification` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_automation_notification` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.common_automation_notification_config
DROP TABLE IF EXISTS `common_automation_notification_config`;
CREATE TABLE IF NOT EXISTS `common_automation_notification_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `automation_id` int(11) NOT NULL,
  `action_id` int(11) NOT NULL,
  `notification_user` varchar(200) NOT NULL,
  `notification_type` varchar(100) DEFAULT NULL,
  `notification_content` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `AUTOMATION_ID_FK4` (`automation_id`),
  KEY `ACTION_FK4` (`action_id`),
  CONSTRAINT `ACTION_FK4` FOREIGN KEY (`action_id`) REFERENCES `common_automation_action` (`id`),
  CONSTRAINT `AUTOMATION_ID_FK4` FOREIGN KEY (`automation_id`) REFERENCES `common_automation_mst` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table papertrl_default_script.common_automation_notification_config: ~0 rows (approximately)
/*!40000 ALTER TABLE `common_automation_notification_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_automation_notification_config` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.common_automation_system_sync_config
DROP TABLE IF EXISTS `common_automation_system_sync_config`;
CREATE TABLE IF NOT EXISTS `common_automation_system_sync_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `automation_id` int(11) NOT NULL,
  `system_id` int(11) NOT NULL,
  `action_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `AUTOMATION_ID_FK7` (`automation_id`),
  KEY `ACTION_FK10` (`action_id`),
  CONSTRAINT `ACTION_FK10` FOREIGN KEY (`action_id`) REFERENCES `common_automation_action` (`id`),
  CONSTRAINT `AUTOMATION_ID_FK7` FOREIGN KEY (`automation_id`) REFERENCES `common_automation_mst` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table papertrl_default_script.common_automation_system_sync_config: ~0 rows (approximately)
/*!40000 ALTER TABLE `common_automation_system_sync_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_automation_system_sync_config` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.common_automation_workflow_config
DROP TABLE IF EXISTS `common_automation_workflow_config`;
CREATE TABLE IF NOT EXISTS `common_automation_workflow_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `automation_id` int(11) NOT NULL,
  `action_id` int(11) NOT NULL,
  `approval_group` int(1) DEFAULT NULL,
  `approval_user` varchar(100) DEFAULT '',
  `approval_order` int(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `AUTOMATION_ID_FK2` (`automation_id`),
  KEY `ACTION_FK1` (`action_id`),
  CONSTRAINT `ACTION_FK1` FOREIGN KEY (`action_id`) REFERENCES `common_automation_action` (`id`),
  CONSTRAINT `AUTOMATION_ID_FK2` FOREIGN KEY (`automation_id`) REFERENCES `common_automation_mst` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table papertrl_default_script.common_automation_workflow_config: ~0 rows (approximately)
/*!40000 ALTER TABLE `common_automation_workflow_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_automation_workflow_config` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.common_data_source
DROP TABLE IF EXISTS `common_data_source`;
CREATE TABLE IF NOT EXISTS `common_data_source` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `type` int(11) NOT NULL,
  `config_id` int(11) DEFAULT NULL,
  `status` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- Dumping data for table papertrl_default_script.common_data_source: ~0 rows (approximately)
/*!40000 ALTER TABLE `common_data_source` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_data_source` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.common_data_source_config
DROP TABLE IF EXISTS `common_data_source_config`;
CREATE TABLE IF NOT EXISTS `common_data_source_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entity` varchar(100) NOT NULL,
  `alias` varchar(50) NOT NULL,
  `field` varchar(100) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- Dumping data for table papertrl_default_script.common_data_source_config: ~0 rows (approximately)
/*!40000 ALTER TABLE `common_data_source_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_data_source_config` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.common_date_format
DROP TABLE IF EXISTS `common_date_format`;
CREATE TABLE IF NOT EXISTS `common_date_format` (
  `id` varchar(30) NOT NULL,
  `name` varchar(30) NOT NULL,
  `sort_order` int(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table papertrl_default_script.common_date_format: ~57 rows (approximately)
/*!40000 ALTER TABLE `common_date_format` DISABLE KEYS */;
INSERT INTO `common_date_format` (`id`, `name`, `sort_order`) VALUES
	('dd-MM-yyyy', '30-12-2018', 1),
	('dd-MMM-yyyy', '30-Dec-2018', 2),
	('dd-MMMM-yyyy', '30-December-2018', 6),
	('dd.MM.yy', '30.12.18', 7),
	('dd.MM.yyyy', '30.12.2018', 8),
	('dd.MMM.yy', '30.Dec.18', 9),
	('dd.MMM.yyyy', '30.Dec.2018', 10),
	('dd.MMMM.yy', '30.December.18', 11),
	('dd.MMMM.yyyy', '30.December.2018', 12),
	('dd/MM/yyyy', '30/12/2018', 4),
	('dd/MMM/yyyy', '30/Dec/2018', 13),
	('dd/MMMM/yyyy', '30/December/2018', 14),
	('MM-dd-yyyy', '12-30-2018', 15),
	('MM.dd.yy', '12.30.18', 16),
	('MM.dd.yyyy', '12.30.2018', 17),
	('MM/dd/yy', '12/30/18', 57),
	('MM/dd/yyyy', '12/30/2018', 5),
	('MMM dd, yyyy', 'Dec 30, 2018', 18),
	('MMM-dd-yyyy', 'Dec-30-2018', 19),
	('MMM.dd.yy', 'Dec.30.18', 20),
	('MMM.dd.yyyy', 'Dec.30.2018', 21),
	('MMM/dd/yyyy', 'Dec/30/2018', 22),
	('MMMM dd, yyyy', 'December 30, 2018', 57),
	('MMMM-dd-yyyy', 'December-30-2018', 23),
	('MMMM/dd/yyyy', 'December/30/2018', 24),
	('yy MMM ,dd', '18 Dec ,30', 25),
	('yy-dd-MMM', '18-30-Dec', 26),
	('yy-dd-MMMM', '18-30-December', 27),
	('yy-MM/dd', '18-12-30', 28),
	('yy-MMM-dd', '18-Dec-30', 29),
	('yy-MMMM-dd', '18-December-30', 30),
	('yy.dd.MMM', '18.30.Dec', 31),
	('yy.dd.MMMM', '18.30.December', 32),
	('yy.MM.dd', '18.12.30', 33),
	('yy.MMM.dd', '18.Dec.30', 34),
	('yy.MMMM.dd', '18.December.30', 35),
	('yy/dd/MMM', '18/30/Dec', 36),
	('yy/dd/MMMM', '18/30/December', 37),
	('yy/MM/dd', '18/12/30', 38),
	('yy/MMM/dd', '18/Dec/30', 39),
	('yy/MMMM/dd', '18/December/30', 40),
	('yyyy MMM ,dd', '2018 Dec ,30', 41),
	('yyyy-dd-MMM', '2018-30-Dec', 42),
	('yyyy-dd-MMMM', '2018-30-December', 43),
	('yyyy-MM-dd', '2018-12-30', 44),
	('yyyy-MMM-dd', '2018-Dec-30', 45),
	('yyyy-MMMM-dd', '2018-December-30', 46),
	('yyyy.dd.MMM', '2018.30.Dec', 47),
	('yyyy.dd.MMMM', '2018.30.December', 48),
	('yyyy.MM.dd', '2018.12.30', 49),
	('yyyy.MMM.dd', '2018.Dec.30', 50),
	('yyyy.MMMM.dd', '2018.December.30', 51),
	('yyyy/dd/MMM', '2018/30/Dec', 52),
	('yyyy/dd/MMMM', '2018/30/December', 53),
	('yyyy/MM/dd', '2018/12/30', 54),
	('yyyy/MMM/dd', '2018/Dec/30', 55),
	('yyyy/MMMM/dd', '2018/December/30', 56);
/*!40000 ALTER TABLE `common_date_format` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.common_department
DROP TABLE IF EXISTS `common_department`;
CREATE TABLE IF NOT EXISTS `common_department` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(100) NOT NULL,
  `department_code` varchar(100) DEFAULT NULL,
  `department_name` varchar(100) NOT NULL,
  `status` char(1) NOT NULL,
  `created_by` varchar(100) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `update_by` varchar(100) DEFAULT NULL,
  `update_on` datetime DEFAULT NULL,
  `delete_by` varchar(100) DEFAULT NULL,
  `delete_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table papertrl_default_script.common_department: ~0 rows (approximately)
/*!40000 ALTER TABLE `common_department` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_department` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.common_document_ad_hoc_workflow_config
DROP TABLE IF EXISTS `common_document_ad_hoc_workflow_config`;
CREATE TABLE IF NOT EXISTS `common_document_ad_hoc_workflow_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reference_no` varchar(100) DEFAULT NULL,
  `created_by` varchar(100) NOT NULL,
  `created_on` datetime NOT NULL,
  `update_by` varchar(100) DEFAULT NULL,
  `update_on` datetime DEFAULT NULL,
  `delete_by` varchar(100) DEFAULT NULL,
  `delete_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table papertrl_default_script.common_document_ad_hoc_workflow_config: ~0 rows (approximately)
/*!40000 ALTER TABLE `common_document_ad_hoc_workflow_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_document_ad_hoc_workflow_config` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.common_document_ad_hoc_workflow_detail_config
DROP TABLE IF EXISTS `common_document_ad_hoc_workflow_detail_config`;
CREATE TABLE IF NOT EXISTS `common_document_ad_hoc_workflow_detail_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `workflow_id` int(11) NOT NULL,
  `approval_group` int(11) DEFAULT NULL,
  `approval_user` varchar(100) DEFAULT '',
  `approval_order` int(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `AUTOMATION_ID_FK2` (`workflow_id`),
  CONSTRAINT `AD_HOC_WORKFLOW_FK_1` FOREIGN KEY (`workflow_id`) REFERENCES `common_document_ad_hoc_workflow_config` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table papertrl_default_script.common_document_ad_hoc_workflow_detail_config: ~0 rows (approximately)
/*!40000 ALTER TABLE `common_document_ad_hoc_workflow_detail_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_document_ad_hoc_workflow_detail_config` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.common_document_drawer_name
DROP TABLE IF EXISTS `common_document_drawer_name`;
CREATE TABLE IF NOT EXISTS `common_document_drawer_name` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `drawer_name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Dumping data for table papertrl_default_script.common_document_drawer_name: ~0 rows (approximately)
/*!40000 ALTER TABLE `common_document_drawer_name` DISABLE KEYS */;
INSERT INTO `common_document_drawer_name` (`id`, `drawer_name`) VALUES
	(1, 'BILL_PO_LIST_MODAL');
/*!40000 ALTER TABLE `common_document_drawer_name` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.common_document_drawer_visibility_user_wise
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

-- Dumping data for table papertrl_default_script.common_document_drawer_visibility_user_wise: ~0 rows (approximately)
/*!40000 ALTER TABLE `common_document_drawer_visibility_user_wise` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_document_drawer_visibility_user_wise` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.common_document_workflow_config
DROP TABLE IF EXISTS `common_document_workflow_config`;
CREATE TABLE IF NOT EXISTS `common_document_workflow_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `document_id` int(11) NOT NULL,
  `document_type` int(11) NOT NULL,
  `automation_id` int(11) DEFAULT NULL,
  `ah_hoc_workflow_id` int(11) DEFAULT NULL,
  `event_id` int(11) NOT NULL,
  `workflow_level` int(3) NOT NULL,
  `no_of_level` int(3) NOT NULL,
  `status` char(1) NOT NULL,
  `created_by` varchar(100) NOT NULL,
  `created_on` datetime NOT NULL,
  `update_by` varchar(100) DEFAULT NULL,
  `update_on` datetime DEFAULT NULL,
  `delete_by` varchar(100) DEFAULT NULL,
  `delete_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `DOCUMENT_TYPE_FK_1` (`document_type`),
  KEY `AUTOMATION_ID_FK_1` (`automation_id`),
  KEY `EVENT_FK_1` (`event_id`),
  KEY `AD_HOC_FK_7` (`ah_hoc_workflow_id`),
  CONSTRAINT `AD_HOC_FK_7` FOREIGN KEY (`ah_hoc_workflow_id`) REFERENCES `common_document_ad_hoc_workflow_config` (`id`),
  CONSTRAINT `AUTOMATION_ID_FK_1` FOREIGN KEY (`automation_id`) REFERENCES `common_automation_mst` (`id`),
  CONSTRAINT `DOCUMENT_TYPE_FK_1` FOREIGN KEY (`document_type`) REFERENCES `common_automation_document_type` (`id`),
  CONSTRAINT `EVENT_FK_1` FOREIGN KEY (`event_id`) REFERENCES `common_automation_event` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table papertrl_default_script.common_document_workflow_config: ~0 rows (approximately)
/*!40000 ALTER TABLE `common_document_workflow_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_document_workflow_config` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.common_drop_down
DROP TABLE IF EXISTS `common_drop_down`;
CREATE TABLE IF NOT EXISTS `common_drop_down` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `drop_down_name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- Dumping data for table papertrl_default_script.common_drop_down: ~19 rows (approximately)
/*!40000 ALTER TABLE `common_drop_down` DISABLE KEYS */;
INSERT INTO `common_drop_down` (`id`, `drop_down_name`) VALUES
	(1, 'Active Inactive Status Drop Down'),
	(3, 'User Status'),
	(6, 'Item Taxability'),
	(8, 'Bill Payment Status'),
	(10, 'Additional Field Required Status'),
	(11, 'Additional Field Active Status'),
	(12, 'Internal Approval Status'),
	(13, 'Vendor Approval Status'),
	(14, 'Export Status'),
	(15, 'Approval Status'),
	(16, 'Payment Status'),
	(17, 'PO Receipt Status'),
	(18, 'Vendor Invitation Status'),
	(19, 'Object Type'),
	(20, 'Availability Status'),
	(21, 'Approval Status'),
	(22, 'Is PO Account Status'),
	(23, 'OCR Bill Template Active Status'),
	(24, 'Department');
/*!40000 ALTER TABLE `common_drop_down` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.common_drop_down_connection
DROP TABLE IF EXISTS `common_drop_down_connection`;
CREATE TABLE IF NOT EXISTS `common_drop_down_connection` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `drop_down_id` int(11) NOT NULL,
  `drop_down_value_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_DROP_DOWN_ID` (`drop_down_id`),
  KEY `FK_DROP_DOWN_VALUE_ID` (`drop_down_value_id`),
  CONSTRAINT `FK_DROP_DOWN_ID` FOREIGN KEY (`drop_down_id`) REFERENCES `common_drop_down` (`id`),
  CONSTRAINT `FK_DROP_DOWN_VALUE_ID` FOREIGN KEY (`drop_down_value_id`) REFERENCES `common_drop_down_value` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8;

-- Dumping data for table papertrl_default_script.common_drop_down_connection: ~51 rows (approximately)
/*!40000 ALTER TABLE `common_drop_down_connection` DISABLE KEYS */;
INSERT INTO `common_drop_down_connection` (`id`, `drop_down_id`, `drop_down_value_id`) VALUES
	(1, 1, 1),
	(2, 1, 2),
	(5, 3, 3),
	(10, 6, 4),
	(11, 6, 5),
	(15, 8, 6),
	(16, 8, 7),
	(17, 8, 8),
	(21, 10, 9),
	(22, 10, 10),
	(23, 11, 1),
	(24, 11, 2),
	(25, 13, 14),
	(26, 13, 20),
	(27, 13, 11),
	(28, 12, 13),
	(29, 12, 12),
	(30, 12, 11),
	(32, 3, 1),
	(33, 3, 2),
	(34, 14, 15),
	(35, 14, 16),
	(38, 15, 11),
	(39, 15, 12),
	(40, 16, 34),
	(41, 16, 17),
	(42, 16, 18),
	(44, 17, 1),
	(45, 17, 21),
	(46, 18, 11),
	(47, 18, 13),
	(48, 19, 22),
	(49, 19, 23),
	(50, 19, 24),
	(51, 19, 25),
	(52, 19, 26),
	(53, 19, 27),
	(54, 19, 28),
	(55, 19, 29),
	(56, 19, 30),
	(57, 13, 12),
	(58, 15, 13),
	(59, 20, 35),
	(60, 20, 36),
	(61, 21, 11),
	(63, 21, 13),
	(64, 13, 13),
	(65, 22, 37),
	(66, 22, 38),
	(67, 23, 1),
	(68, 23, 2);
/*!40000 ALTER TABLE `common_drop_down_connection` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.common_drop_down_value
DROP TABLE IF EXISTS `common_drop_down_value`;
CREATE TABLE IF NOT EXISTS `common_drop_down_value` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value` varchar(50) NOT NULL,
  `label` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

-- Dumping data for table papertrl_default_script.common_drop_down_value: ~35 rows (approximately)
/*!40000 ALTER TABLE `common_drop_down_value` DISABLE KEYS */;
INSERT INTO `common_drop_down_value` (`id`, `value`, `label`) VALUES
	(1, 'A', 'Active'),
	(2, 'I', 'Inactive'),
	(3, 'L', 'Locked'),
	(4, 'TRUE', 'Taxable'),
	(5, 'FALSE', 'Non Taxable'),
	(6, 'V', 'Void'),
	(7, 'A', 'Paid'),
	(8, 'M', 'Mailed'),
	(9, 'TRUE', 'Required'),
	(10, 'FALSE', 'Optional'),
	(11, 'A', 'Approved'),
	(12, 'R', 'Rejected'),
	(13, 'P', 'Pending'),
	(14, 'NA', 'Not-Assigned'),
	(15, 'Y', 'Exported'),
	(16, 'N', 'Not Exported'),
	(17, 'N', 'Not Paid'),
	(18, 'H', 'Partially Paid'),
	(19, 'DP', 'Deletion Pending'),
	(20, 'U', 'Under Discussion'),
	(21, 'C', 'Closed'),
	(22, 'OBJECT_TYPE_ACCOUNT', 'Accounts'),
	(23, 'OBJECT_TYPE_ITEM', 'Items'),
	(24, 'OBJECT_TYPE_PROJECT', 'Project Codes'),
	(25, 'OBJECT_TYPE_BILL_PAYMENT', 'Bill Payment'),
	(26, 'OBJECT_TYPE_VENDOR', 'Vendor'),
	(27, 'OBJECT_TYPE_PO', 'Purchase Order'),
	(28, 'OBJECT_TYPE_PO_RECEIPT', 'Purchase Order Receipt'),
	(29, 'OBJECT_TYPE_BILL', 'Bill'),
	(30, 'OBJECT_TYPE_EXPENSE', 'Expense'),
	(34, 'Y', 'Paid'),
	(35, 'Y', 'YES'),
	(36, 'N', 'NO'),
	(37, 'Z', 'YES'),
	(38, 'Q', 'NO');
/*!40000 ALTER TABLE `common_drop_down_value` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.common_email_attachment
DROP TABLE IF EXISTS `common_email_attachment`;
CREATE TABLE IF NOT EXISTS `common_email_attachment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `attachment_url` text NOT NULL,
  `attachment_name` varchar(100) NOT NULL,
  `email_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `EMAIL_ID_FK1` (`email_id`) USING BTREE,
  CONSTRAINT `common_email_attachment_ibfk_1` FOREIGN KEY (`email_id`) REFERENCES `common_email_mst` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table papertrl_default_script.common_email_attachment: ~0 rows (approximately)
/*!40000 ALTER TABLE `common_email_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_email_attachment` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.common_email_mst
DROP TABLE IF EXISTS `common_email_mst`;
CREATE TABLE IF NOT EXISTS `common_email_mst` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subject` varchar(100) NOT NULL,
  `message` text NOT NULL,
  `to_address` varchar(100) NOT NULL,
  `cc_address` varchar(100) DEFAULT NULL,
  `status` char(1) NOT NULL,
  `attempts` int(2) DEFAULT 0,
  `created_by` varchar(100) NOT NULL DEFAULT '',
  `created_on` datetime NOT NULL,
  `update_by` varchar(100) DEFAULT NULL,
  `update_on` datetime DEFAULT NULL,
  `delete_by` varchar(100) DEFAULT NULL,
  `delete_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table papertrl_default_script.common_email_mst: ~0 rows (approximately)
/*!40000 ALTER TABLE `common_email_mst` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_email_mst` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.common_email_privilege
DROP TABLE IF EXISTS `common_email_privilege`;
CREATE TABLE IF NOT EXISTS `common_email_privilege` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_privilage_id` int(11) DEFAULT NULL,
  `email_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

-- Dumping data for table papertrl_default_script.common_email_privilege: ~17 rows (approximately)
/*!40000 ALTER TABLE `common_email_privilege` DISABLE KEYS */;
INSERT INTO `common_email_privilege` (`id`, `menu_privilage_id`, `email_id`) VALUES
	(1, 151, 4),
	(2, 151, 5),
	(3, 160, 6),
	(4, 161, 6),
	(5, 170, 6),
	(6, 119, 7),
	(7, 119, 8),
	(8, 139, 9),
	(9, 140, 9),
	(10, 150, 9),
	(11, 26, 1),
	(12, 26, 2),
	(13, 55, 1),
	(14, 55, 2),
	(15, 29, 3),
	(16, 30, 3),
	(18, 172, 3);
/*!40000 ALTER TABLE `common_email_privilege` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.common_email_tmp
DROP TABLE IF EXISTS `common_email_tmp`;
CREATE TABLE IF NOT EXISTS `common_email_tmp` (
  `temp_id` int(11) NOT NULL AUTO_INCREMENT,
  `subject` varchar(100) NOT NULL,
  `message` text NOT NULL,
  `to_address` varchar(100) NOT NULL,
  `cc_address` varchar(100) DEFAULT NULL,
  `status` char(1) NOT NULL,
  `attempts` int(2) DEFAULT 0,
  `invoice_id` int(11) DEFAULT NULL,
  `created_by` varchar(100) NOT NULL DEFAULT '',
  `created_on` datetime NOT NULL,
  `update_by` varchar(100) DEFAULT NULL,
  `update_on` datetime DEFAULT NULL,
  `delete_by` varchar(100) DEFAULT NULL,
  `delete_on` datetime DEFAULT NULL,
  PRIMARY KEY (`temp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table papertrl_default_script.common_email_tmp: ~0 rows (approximately)
/*!40000 ALTER TABLE `common_email_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_email_tmp` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.common_email_type
DROP TABLE IF EXISTS `common_email_type`;
CREATE TABLE IF NOT EXISTS `common_email_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email_service` varchar(255) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

-- Dumping data for table papertrl_default_script.common_email_type: ~9 rows (approximately)
/*!40000 ALTER TABLE `common_email_type` DISABLE KEYS */;
INSERT INTO `common_email_type` (`id`, `email_service`) VALUES
	(1, 'Invoice has approved'),
	(2, 'Invoice has rejected'),
	(3, 'Invoice submitted for approval'),
	(4, 'Purchase Order has approved'),
	(5, 'Purchase Order has rejected'),
	(6, 'Purchase Order submitted for approval'),
	(7, 'Expense has approved'),
	(8, 'Expense has rejected'),
	(9, 'Expense submitted for approval');
/*!40000 ALTER TABLE `common_email_type` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.common_employee
DROP TABLE IF EXISTS `common_employee`;
CREATE TABLE IF NOT EXISTS `common_employee` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_number` varchar(20) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `status` char(1) NOT NULL,
  `created_by` varchar(100) CHARACTER SET utf8 NOT NULL,
  `created_on` datetime NOT NULL,
  `update_by` varchar(100) CHARACTER SET utf8 DEFAULT '',
  `update_on` datetime DEFAULT NULL,
  `delete_by` varchar(100) DEFAULT NULL,
  `delete_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table papertrl_default_script.common_employee: ~0 rows (approximately)
/*!40000 ALTER TABLE `common_employee` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_employee` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.common_employee_import_issue
DROP TABLE IF EXISTS `common_employee_import_issue`;
CREATE TABLE IF NOT EXISTS `common_employee_import_issue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `import_mst_id` int(11) NOT NULL,
  `record` text DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL,
  `line_no` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_IMPORT_MST5` (`import_mst_id`),
  CONSTRAINT `FK_IMPORT_MST5` FOREIGN KEY (`import_mst_id`) REFERENCES `common_employee_import_mst` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=latin1;

-- Dumping data for table papertrl_default_script.common_employee_import_issue: ~0 rows (approximately)
/*!40000 ALTER TABLE `common_employee_import_issue` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_employee_import_issue` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.common_employee_import_mst
DROP TABLE IF EXISTS `common_employee_import_mst`;
CREATE TABLE IF NOT EXISTS `common_employee_import_mst` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `total_records` int(11) DEFAULT NULL,
  `succeeded` int(11) DEFAULT NULL,
  `failed` int(11) DEFAULT NULL,
  `created_by` varchar(100) NOT NULL DEFAULT '',
  `created_on` datetime NOT NULL,
  `update_by` varchar(100) DEFAULT NULL,
  `update_on` datetime DEFAULT NULL,
  `delete_by` varchar(100) DEFAULT NULL,
  `delete_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=latin1;

-- Dumping data for table papertrl_default_script.common_employee_import_mst: ~0 rows (approximately)
/*!40000 ALTER TABLE `common_employee_import_mst` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_employee_import_mst` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.common_grid_column_template
DROP TABLE IF EXISTS `common_grid_column_template`;
CREATE TABLE IF NOT EXISTS `common_grid_column_template` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `grid_id` int(11) NOT NULL,
  `field` varchar(50) NOT NULL,
  `header` varchar(50) DEFAULT NULL,
  `column_show` tinyint(1) DEFAULT NULL,
  `is_sortable` tinyint(1) DEFAULT NULL,
  `is_re_orderable` tinyint(1) DEFAULT NULL,
  `is_re_sizable` tinyint(1) DEFAULT NULL,
  `can_hide` tinyint(1) DEFAULT NULL,
  `align` varchar(50) NOT NULL,
  `search_type` varchar(50) NOT NULL,
  `placeholder` varchar(100) DEFAULT '',
  `column_order` int(3) NOT NULL,
  `drop_down_id` int(11) DEFAULT NULL,
  `drop_down_url` varchar(200) DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `TABLE_FK_2` (`grid_id`),
  KEY `DROP_DOWN_ID_FK_1` (`drop_down_id`),
  CONSTRAINT `DROP_DOWN_ID_FK_1` FOREIGN KEY (`drop_down_id`) REFERENCES `common_drop_down` (`id`),
  CONSTRAINT `TABLE_FK_2` FOREIGN KEY (`grid_id`) REFERENCES `common_grid_template` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=430 DEFAULT CHARSET=utf8;

-- Dumping data for table papertrl_default_script.common_grid_column_template: ~406 rows (approximately)
/*!40000 ALTER TABLE `common_grid_column_template` DISABLE KEYS */;
INSERT INTO `common_grid_column_template` (`id`, `grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES
	(8, 3, 'checkbox', NULL, 1, 0, 0, 0, 0, 'center', 'checkbox', '', 1, NULL, ''),
	(9, 3, 'action', 'Action', 1, 0, 0, 0, 0, 'center', 'actionButton', '', 2, NULL, ''),
	(10, 3, 'apgr.id', 'Approval Group ID', 1, 1, 1, 1, 1, 'left', 'input', 'Approval Group ID', 3, NULL, ''),
	(11, 3, 'apgr.name', 'Approval Group Name', 1, 1, 1, 1, 1, 'left', 'input', 'Approval Group Name', 4, NULL, ''),
	(12, 3, 'usm.name', 'Created By', 1, 1, 1, 1, 1, 'left', 'input', 'Created By', 5, NULL, ''),
	(13, 3, 'apgr.createdOn', 'Created Date', 1, 1, 1, 1, 1, 'center', 'date', 'Create Date', 6, NULL, ''),
	(14, 3, 'apgr.status', 'Status', 1, 1, 1, 1, 1, 'center', 'dropdown', 'All', 7, 1, ''),
	(15, 2, 'checkbox', NULL, 1, 0, 0, 0, 0, 'center', 'checkbox', '', 1, NULL, ''),
	(16, 2, 'action', 'Action', 1, 0, 0, 0, 0, 'center', 'actionButton', '', 2, NULL, ''),
	(17, 2, 'usm.email', 'Email Address', 1, 1, 1, 1, 1, 'left', 'input', 'Email Address', 3, NULL, ''),
	(18, 2, 'usm.name', 'Name', 1, 1, 1, 1, 1, 'left', 'input', 'Name', 4, NULL, ''),
	(19, 2, 'usm.nicPassportNo', 'Employee No', 1, 1, 1, 1, 1, 'left', 'input', 'Employee No', 5, NULL, ''),
	(20, 2, 'approvalGroup.approvalGroupId', 'Approval Groups', 1, 1, 1, 1, 1, 'left', 'dropdown', 'Approval Groups', 6, NULL, ''),
	(21, 2, 'rolem.id', 'Role', 1, 1, 1, 1, 1, 'left', 'dropdown', 'Role', 7, NULL, ''),
	(22, 2, 'usm.status', 'Status', 1, 1, 1, 1, 1, 'center', 'dropdown', 'All', 8, 3, ''),
	(23, 4, 'checkbox', NULL, 1, 0, 0, 0, 0, 'center', 'checkbox', '', 1, NULL, ''),
	(24, 4, 'action', 'Action', 1, 0, 0, 0, 0, 'center', 'actionButton', '', 2, NULL, ''),
	(25, 4, 'acct.id', 'Account Type', 1, 1, 1, 1, 1, 'left', 'dropdown', 'Account Type', 3, NULL, ''),
	(26, 4, 'accdt.id', 'Account Detail Type', 1, 1, 1, 1, 1, 'left', 'dropdown', 'Account Detail Type', 4, NULL, ''),
	(27, 4, 'acc.number', 'Account No', 1, 1, 1, 1, 1, 'left', 'input', 'Account No', 5, NULL, ''),
	(28, 4, 'acc.name', 'Account Name', 1, 1, 1, 1, 1, 'left', 'input', 'Account Name', 6, NULL, ''),
	(29, 4, 'accParent.id', 'Parent Account', 1, 1, 1, 1, 1, 'left', 'dropdown', 'Parent Account', 7, NULL, ''),
	(30, 4, 'acc.status', 'Status', 1, 1, 1, 1, 1, 'center', 'dropdown', 'All', 9, 1, ''),
	(31, 5, 'checkbox', NULL, 1, 0, 0, 0, 0, 'center', 'checkbox', '', 1, NULL, ''),
	(32, 5, 'action', 'Action', 1, 0, 0, 0, 0, 'center', 'actionButton', '', 2, NULL, ''),
	(33, 5, 'type.id', 'Item Type', 1, 1, 1, 1, 1, 'left', 'dropdown', 'Item Type', 5, NULL, ''),
	(34, 5, 'cat.id', 'Category', 1, 1, 1, 1, 1, 'left', 'dropdown', 'Category', 6, NULL, ''),
	(35, 5, 'item.itemNumber', 'Item No', 1, 1, 1, 1, 1, 'left', 'input', 'Item No', 3, NULL, ''),
	(36, 5, 'item.name', 'Item Name', 1, 1, 1, 1, 1, 'left', 'input', 'Item Name', 4, NULL, ''),
	(37, 5, 'item.taxable', 'Taxability', 1, 1, 1, 1, 1, 'center', 'dropdown', 'Taxability', 7, 6, ''),
	(38, 5, 'item.salesPrice', 'Selling Price', 1, 1, 1, 1, 1, 'right', 'numeric', 'Selling Price', 8, NULL, ''),
	(39, 5, 'item.status', 'Status', 1, 1, 1, 1, 1, 'center', 'dropdown', 'All', 9, 1, ''),
	(41, 6, 'action', 'Action', 1, 0, 0, 0, 0, 'center', 'actionButton', '', 2, NULL, ''),
	(42, 6, 'tenant.tenantId', 'Tenant ID', 1, 1, 1, 1, 1, 'left', 'input', 'Tenant ID', 3, NULL, ''),
	(43, 6, 'tenant.ownerName', 'Company Name', 1, 1, 1, 1, 1, 'left', 'input', 'Company Name', 4, NULL, ''),
	(44, 6, 'tenant.ownerEmail', 'Email Address', 1, 1, 1, 1, 1, 'left', 'input', 'Email Address', 5, NULL, ''),
	(45, 6, 'tenant.status', 'Status', 1, 1, 1, 1, 1, 'center', 'dropdown', 'All', 6, 1, ''),
	(46, 7, 'checkbox', NULL, 1, 0, 0, 0, 0, 'center', 'checkbox', '', 1, NULL, ''),
	(47, 7, 'action', 'Action', 1, 0, 0, 0, 0, 'center', 'actionButton', '', 2, NULL, ''),
	(48, 7, 'chk.paymentReferanceNo', 'Payment Ref.', 1, 1, 1, 1, 1, 'left', 'input', 'Payment Ref.', 3, NULL, ''),
	(49, 7, 'chk.amount', 'Amount', 1, 1, 1, 1, 1, 'right', 'numeric', 'Amount', 4, NULL, ''),
	(50, 7, 'chk.discountAmount', 'Discount Amount', 1, 1, 1, 1, 1, 'right', 'numeric', 'Discount Amount', 5, NULL, ''),
	(51, 7, 'chk.paymentDate', 'Date', 1, 1, 1, 1, 1, 'center', 'date', 'Date', 6, NULL, ''),
	(52, 7, 'vi.billNo', 'Bill No', 1, 1, 1, 1, 1, 'left', 'input', 'Bill No.', 7, NULL, ''),
	(53, 7, 'vi.billAmount', 'Bill Amount', 1, 1, 1, 1, 1, 'right', 'numeric', 'Bill Amount', 8, NULL, ''),
	(54, 7, 'vi.vendorId', 'Vendor', 1, 1, 1, 1, 1, 'left', 'dropdown', 'All', 9, NULL, ''),
	(55, 7, 'vi.billDate', 'Bill Date', 1, 1, 1, 1, 1, 'center', 'date', 'Bill Date', 10, NULL, ''),
	(56, 7, 'vi.dueDate', 'Due Date', 1, 1, 1, 1, 1, 'center', 'date', 'Due Date', 11, NULL, ''),
	(57, 7, 'chk.status', 'Status', 1, 1, 1, 1, 1, 'center', 'dropdown', 'All', 13, 8, ''),
	(58, 8, 'checkbox', '', 1, 0, 0, 0, 0, 'center', 'checkbox', '', 1, NULL, ''),
	(59, 8, 'action', 'Action', 1, 0, 0, 0, 0, 'center', 'actionButton', '', 2, NULL, ''),
	(60, 8, 'vendor.name', 'Vendor Name', 1, 1, 1, 1, 1, 'left', 'input', 'Vendor Name', 3, NULL, ''),
	(61, 8, 'vendor.email', 'Contact Email', 1, 1, 1, 1, 1, 'left', 'input', 'Contact Email', 4, NULL, ''),
	(62, 8, 'vendor.contactPerson', 'Contact Name', 1, 1, 1, 1, 1, 'left', 'input', 'Contact Name', 5, NULL, ''),
	(63, 8, 'vendor.contactNumber', 'Contact Phone', 1, 1, 1, 1, 1, 'left', 'input', 'Contact Phone', 6, NULL, ''),
	(64, 8, 'address.country', 'Country', 1, 1, 1, 1, 1, 'left', 'dropdown', 'All', 7, NULL, ''),
	(65, 8, 'vendor.socialSecNo', 'Social Security No', 1, 1, 1, 1, 1, 'left', 'input', 'Social Security No', 8, NULL, ''),
	(66, 8, 'sic.code', 'SIC Code', 1, 1, 1, 1, 1, 'left', 'input', 'SIC Code', 9, NULL, ''),
	(67, 8, 'naic.code', 'NAIC Code', 1, 1, 1, 1, 1, 'left', 'input', 'NAIC Code', 10, NULL, ''),
	(68, 9, 'checkbox', '', 1, 0, 0, 0, 0, 'center', 'checkbox', '', 1, NULL, ''),
	(69, 9, 'action', 'Action', 1, 0, 0, 0, 0, 'center', 'actionButton', '', 2, NULL, ''),
	(70, 9, 'req.vendorName', 'Vendor Name', 1, 1, 1, 1, 1, 'left', 'input', 'Vendor Name', 3, NULL, ''),
	(71, 9, 'req.contactPerson', 'Contact Name', 1, 1, 1, 1, 1, 'left', 'input', 'Contact Name', 4, NULL, ''),
	(72, 9, 'req.contactNumber', 'Contact Number', 1, 1, 1, 1, 1, 'left', 'input', 'Contact Number', 5, NULL, ''),
	(73, 9, 'req.vendorEmail', 'Email Address', 1, 1, 1, 1, 1, 'left', 'input', 'Email Address', 6, NULL, ''),
	(74, 9, 'req.requestOn', 'Request Date', 1, 1, 1, 1, 1, 'center', 'date', 'Request Date', 7, NULL, ''),
	(75, 9, 'req.status', 'Status', 1, 1, 1, 1, 1, 'center', 'dropdown', 'Status', 8, 15, ''),
	(76, 10, 'checkbox', NULL, 0, 0, 0, 0, 0, 'center', 'checkbox', '', 1, NULL, ''),
	(77, 10, 'action', 'Action', 1, 0, 0, 0, 0, 'center', 'actionButton', '', 2, NULL, ''),
	(78, 10, 'appCode.name', 'Project Code', 1, 1, 1, 1, 1, 'left', 'input', 'Project Code', 3, NULL, ''),
	(80, 10, 'appCode.createdOn', 'Created Date', 1, 1, 1, 1, 1, 'center', 'date', 'Create Date', 9, NULL, ''),
	(81, 10, 'appCode.createdUsername', 'Created By', 1, 1, 1, 1, 1, 'left', 'input', 'Created By', 10, NULL, ''),
	(82, 10, 'appCode.status', 'Status', 1, 1, 1, 1, 1, 'center', 'dropdown', 'All', 11, 1, ''),
	(83, 7, 'vi.poId', 'PO No', 1, 1, 1, 1, 1, 'left', 'dropdown', 'PO No', 12, NULL, ''),
	(84, 11, 'action', 'Action', 1, 0, 0, 0, 0, 'center', 'actionButton', '', 1, NULL, ''),
	(85, 11, 'field.moduleId', 'Document Type', 1, 1, 1, 1, 1, 'left', 'dropdown', 'Document Type', 2, NULL, ''),
	(86, 11, 'field.fieldName', 'Field Name', 1, 1, 1, 1, 1, 'left', 'input', 'Field Name', 4, NULL, ''),
	(87, 11, 'field.fieldTypeId', 'Field Type', 1, 1, 1, 1, 1, 'left', 'dropdown', 'Field Type', 5, NULL, ''),
	(88, 11, 'field.required', 'Required Status', 1, 1, 1, 1, 1, 'center', 'dropdown', 'All', 6, 10, ''),
	(89, 11, 'field.status', 'Active Status', 1, 1, 1, 1, 1, 'center', 'dropdown', 'All', 7, 1, ''),
	(90, 1, 'checkbox', NULL, 1, 0, 0, 0, 0, 'center', 'checkbox', '', 1, NULL, ''),
	(91, 1, 'action', 'Action', 1, 0, 0, 0, 0, 'center', 'actionButton', '', 2, NULL, ''),
	(92, 1, 'rolem.id', 'Role ID', 1, 1, 1, 1, 1, 'left', 'number', 'Role ID', 3, NULL, ''),
	(93, 1, 'rolem.name', 'Role Name', 1, 1, 1, 1, 1, 'left', 'input', 'Role Name', 4, NULL, ''),
	(94, 1, 'rolem.createdBy', 'Created By', 1, 1, 1, 1, 1, 'left', 'input', 'Created By', 5, NULL, ''),
	(95, 1, 'rolem.createdOn', 'Created Date', 1, 1, 1, 1, 1, 'left', 'date', 'Create Date', 6, NULL, ''),
	(96, 1, 'rolem.status', 'Status', 1, 1, 1, 1, 1, 'center', 'dropdown', 'All', 7, 1, ''),
	(97, 12, 'checkbox', '', 1, 0, 0, 0, 0, 'center', 'checkbox', '', 1, NULL, ''),
	(98, 12, 'action', 'Action', 1, 0, 0, 0, 0, 'center', 'actionButton', '', 2, NULL, ''),
	(99, 12, 'automation.automationName', 'Name', 1, 1, 1, 1, 1, 'left', 'input', 'Name', 3, NULL, ''),
	(100, 12, 'automation.documentType', 'Document Type', 1, 1, 1, 1, 1, 'left', 'dropdown', 'Document Type', 4, NULL, ''),
	(101, 12, 'automation.documentEvent', 'Event', 1, 1, 1, 1, 1, 'left', 'dropdown', 'Event', 5, NULL, ''),
	(102, 12, 'automation.createdBy', 'Created By', 1, 1, 1, 1, 1, 'left', 'input', 'Created By', 6, NULL, ''),
	(103, 12, 'automation.createdOn', 'Created Date', 1, 1, 1, 1, 1, 'center', 'date', 'Create Date', 7, NULL, ''),
	(104, 12, 'automation.status', 'Status', 1, 1, 1, 1, 1, 'center', 'dropdown', 'All', 8, 1, ''),
	(105, 13, 'checkbox', NULL, 1, 0, 0, 0, 0, 'center', 'checkbox', '', 1, NULL, ''),
	(106, 13, 'action', 'Action', 1, 0, 0, 0, 0, 'center', 'actionButton', '', 2, NULL, ''),
	(107, 13, 'po.vendorId', 'Vendor', 1, 1, 1, 1, 1, 'left', 'dropdown', 'Vendor', 3, NULL, ''),
	(108, 13, 'po.poNumber', 'PO Number', 1, 1, 1, 1, 1, 'left', 'input', 'PO Number', 4, NULL, ''),
	(109, 13, 'po.projectCodeId', 'Project / Task', 1, 1, 1, 1, 1, 'left', 'dropdown', 'Project / Task', 5, NULL, ''),
	(110, 13, 'po.netAmount', 'Amount', 1, 1, 1, 1, 1, 'right', 'numeric', 'Amount', 6, NULL, ''),
	(111, 13, 'po.poDate', 'PO Date', 1, 1, 1, 1, 1, 'center', 'date', 'PO Date', 7, NULL, ''),
	(112, 13, 'po.deliveryDate', 'Delivery Date', 1, 1, 1, 1, 1, 'center', 'date', 'Delivery Date', 8, NULL, ''),
	(113, 13, 'po.createdByName', 'Submitted By', 1, 1, 1, 1, 1, 'left', 'input', 'Submited By', 9, NULL, ''),
	(114, 13, 'po.createdOn', 'Submitted Date', 1, 1, 1, 1, 1, 'center', 'date', 'Submited Date', 10, NULL, ''),
	(115, 13, 'po.status', 'Internal Approval Status', 1, 1, 1, 1, 1, 'center', 'dropdown', 'Internal Approval Status', 11, 12, ''),
	(116, 13, 'po.vendorApprovalStatus', 'Vendor Approval Status', 1, 1, 1, 1, 1, 'center', 'dropdown', 'Vendor Approval Status', 12, 13, ''),
	(117, 14, 'checkbox', '', 1, 0, 0, 0, 0, 'center', 'checkbox', '', 1, NULL, ''),
	(118, 14, 'action', 'Action', 1, 0, 0, 0, 0, 'center', 'actionButton', '', 2, NULL, ''),
	(119, 14, 'vendor.id', 'Vendor', 1, 1, 1, 1, 1, 'left', 'multiSelect', 'Vendor', 3, NULL, ''),
	(120, 14, 'bill.billNo', 'Bill Number', 1, 1, 1, 1, 1, 'left', 'input', 'Bill Number', 4, NULL, ''),
	(122, 14, 'bill.billDate', 'Bill Date', 1, 1, 1, 1, 1, 'center', 'date', 'Bill Date', 5, NULL, ''),
	(123, 14, 'bill.billAmount', 'Amount', 1, 1, 1, 1, 1, 'right', 'numeric', 'Amount', 6, NULL, ''),
	(124, 14, 'term.id', 'Term', 1, 1, 1, 1, 1, 'left', 'dropdown', 'Term', 7, NULL, ''),
	(125, 14, 'bill.dueDate', 'Due Date', 1, 1, 1, 1, 1, 'center', 'date', 'Due Date', 8, NULL, ''),
	(126, 14, 'po.id', 'Purchase Order', 1, 1, 1, 1, 1, 'left', 'dropdown', 'Purchase Order', 9, NULL, ''),
	(127, 14, 'receipt.id', 'Purchase Order Receipt', 1, 1, 1, 1, 1, 'left', 'dropdown', 'Purchase Order Receipt', 10, NULL, ''),
	(128, 14, 'bill.submittedByName', 'Submitted By', 1, 1, 1, 1, 1, 'left', 'input', 'Submit By', 11, NULL, ''),
	(129, 14, 'bill.submittedOn', 'Submitted Date', 1, 1, 1, 1, 1, 'center', 'date', 'Submit Date', 12, NULL, ''),
	(130, 14, 'bill.balanceAmount', 'Remaining Balance', 1, 1, 1, 1, 1, 'right', 'numeric', 'Remaining Balance', 13, NULL, ''),
	(131, 14, 'bill.discountAmount', 'Applied Discount', 1, 1, 1, 1, 1, 'right', 'numeric', 'Discount Amount', 14, NULL, ''),
	(132, 14, 'bill.approvalUserName', 'Approval User', 1, 1, 1, 1, 1, 'left', 'input', 'Approval User', 15, NULL, ''),
	(133, 14, 'bill.approvedDate', 'Approve Date', 1, 1, 1, 1, 1, 'center', 'date', 'Approve Date', 16, NULL, ''),
	(134, 14, 'bill.status', 'Approval Status', 1, 1, 1, 1, 1, 'center', 'dropdown', 'Approval Status', 17, 15, ''),
	(135, 14, 'bill.paymentStatus', 'Payment Status', 1, 1, 1, 1, 1, 'center', 'dropdown', 'Payment Status', 18, 16, ''),
	(136, 14, 'bill.applicableDiscountAmount', 'Applicable Discount', 1, 1, 1, 1, 1, 'right', 'numeric', 'Applicable Discount', 19, NULL, ''),
	(137, 14, 'bill.discountApplicableDate', 'Discount Applicable Date', 1, 1, 1, 1, 1, 'center', 'date', 'Discount Applicable Date', 20, NULL, ''),
	(138, 14, 'bill.exportStatus', 'Export Status', 1, 1, 1, 1, 1, 'center', 'dropdown', 'Export Status', 21, 14, ''),
	(139, 15, 'checkbox', '', 1, 0, 0, 0, 0, 'center', 'checkbox', '', 1, NULL, ''),
	(140, 15, 'action', 'Action', 1, 0, 0, 0, 0, 'center', 'actionButton', '', 2, NULL, ''),
	(141, 15, 'expense.id', 'Report Number', 1, 1, 1, 1, 1, 'left', 'number', 'Report Number', 3, NULL, ''),
	(142, 15, 'expense.reportName', 'Report Name', 1, 1, 1, 1, 1, 'left', 'input', 'Report Name', 4, NULL, ''),
	(143, 15, 'expense.createdOn', 'Submitted Date', 1, 1, 1, 1, 1, 'center', 'date', 'Submit Date', 6, NULL, ''),
	(144, 15, 'expense.approvalUserName', 'Approval User', 1, 1, 1, 1, 1, 'left', 'input', 'Approval User', 7, NULL, ''),
	(145, 15, 'appGroup.id', 'Approval Group', 1, 1, 1, 1, 1, 'left', 'dropdown', 'Approval Group', 8, NULL, ''),
	(146, 15, 'automation.id', 'Automation Name', 1, 1, 1, 1, 1, 'left', 'dropdown', 'Automation Name', 9, NULL, ''),
	(147, 15, 'expense.totalAmount', 'Amount', 1, 1, 1, 1, 1, 'right', 'numeric', 'Amount', 10, NULL, ''),
	(148, 15, 'expense.status', 'Approval Status', 1, 1, 1, 1, 1, 'center', 'dropdown', 'Approval Status', 11, 15, ''),
	(149, 15, 'expense.startFrom', 'From Date', 1, 1, 1, 1, 1, 'center', 'date', 'From Date', 12, NULL, ''),
	(150, 15, 'expense.endDate', 'To Date', 1, 1, 1, 1, 1, 'center', 'date', 'To Date', 13, NULL, ''),
	(151, 15, 'expense.exportStatus', 'Export Status', 1, 1, 1, 1, 1, 'center', 'dropdown', 'Export Status', 14, 14, ''),
	(152, 16, 'checkbox', '', 1, 0, 0, 0, 0, 'center', 'checkbox', '', 1, NULL, ''),
	(153, 16, 'action', 'Action', 1, 0, 0, 0, 0, 'center', 'actionButton', '', 2, NULL, ''),
	(154, 16, 'receipt.receiptNumber', 'Receipt Number', 1, 1, 1, 1, 1, 'left', 'input', 'Receipt Number', 3, NULL, ''),
	(155, 16, 'receipt.vendorId', 'Vendor Name', 1, 1, 1, 1, 1, 'left', 'multiSelect', 'Vendor Name', 4, NULL, ''),
	(156, 16, 'receipt.poId', 'PO Number', 1, 1, 1, 1, 1, 'left', 'dropdown', 'PO Number', 5, NULL, ''),
	(157, 16, 'receipt.receiptDate', 'Receipt Date', 1, 1, 1, 1, 1, 'center', 'date', 'Receipt Date', 6, NULL, ''),
	(158, 16, 'usm.name', 'Created User', 1, 1, 1, 1, 1, 'left', 'input', 'Create User', 7, NULL, ''),
	(159, 16, 'receipt.createdOn', 'Created Date', 1, 1, 1, 1, 1, 'center', 'date', 'Create Date', 8, NULL, ''),
	(160, 16, 'receipt.totalAmount', 'Amount', 1, 1, 1, 1, 1, 'right', 'numeric', 'Amount', 9, NULL, ''),
	(161, 16, 'receipt.status', 'Status', 1, 1, 1, 1, 1, 'center', 'dropdown', 'Status', 10, 17, ''),
	(162, 17, 'checkbox', NULL, 1, 0, 0, 0, 0, 'center', 'checkbox', '', 1, NULL, ''),
	(163, 17, 'action', 'Action', 1, 0, 0, 0, 0, 'center', 'actionButton', '', 2, NULL, ''),
	(164, 17, 'vpInv.emailAddress', 'Email Address', 1, 1, 1, 1, 1, 'left', 'input', 'Email Address', 3, NULL, ''),
	(165, 17, 'vpInv.vendorName', 'Vendor Name', 1, 1, 1, 1, 1, 'left', 'input', 'Vendor Name', 4, NULL, ''),
	(166, 17, 'vpInv.contactName', 'Contact Name', 1, 1, 1, 1, 1, 'left', 'input', 'Contact Name', 5, NULL, ''),
	(167, 17, 'vpInv.createdBy', 'Invited By', 1, 1, 1, 1, 1, 'left', 'input', 'Invited By', 6, NULL, ''),
	(168, 17, 'vpInv.createdOn', 'Invited On', 1, 1, 1, 1, 1, 'center', 'date', 'Invited On', 7, NULL, ''),
	(169, 17, 'vpInv.status', 'Status', 1, 1, 1, 1, 1, 'center', 'dropdown', 'Status', 8, 18, ''),
	(170, 18, 'reference', 'Reference No', 1, 0, 0, 1, 1, 'left', 'input', 'Reference No', 3, NULL, NULL),
	(172, 18, 'amount', 'Amount', 1, 0, 1, 1, 1, 'right', 'numeric', 'Amount', 4, NULL, NULL),
	(173, 18, 'syncDetail.createdOn', 'Date', 1, 0, 1, 1, 1, 'center', 'date', 'Date', 1, NULL, NULL),
	(174, 18, 'syncDetail.objectType', 'Data Type', 1, 0, 1, 1, 1, 'left', 'dropdown', 'Data Type', 2, 19, NULL),
	(177, 19, 'checkbox', NULL, 1, 0, 0, 0, 0, 'center', 'checkbox', '', 1, NULL, NULL),
	(178, 19, 'action', 'Action', 1, 0, 0, 0, 0, 'center', 'actionButton', '', 2, NULL, NULL),
	(179, 19, 'reference', 'Reference No', 1, 0, 0, 1, 1, 'left', 'input', 'Reference No', 5, NULL, NULL),
	(181, 19, 'amount', 'Amount', 1, 0, 1, 1, 1, 'right', 'numeric', 'Amount', 6, NULL, NULL),
	(182, 19, 'syncDetail.createdOn', 'Date', 1, 0, 1, 1, 1, 'center', 'date', 'Date', 3, NULL, NULL),
	(183, 19, 'syncDetail.objectType', 'Data Type', 1, 0, 1, 1, 1, 'left', 'dropdown', 'Data Type', 4, 19, NULL),
	(186, 20, 'reference', 'Reference No', 1, 0, 0, 1, 1, 'left', 'input', 'Reference No', 3, NULL, NULL),
	(188, 20, 'amount', 'Amount', 1, 0, 1, 1, 1, 'right', 'numeric', 'Amount', 3, NULL, NULL),
	(189, 20, 'syncDetail.syncDateTime', 'Date', 1, 0, 1, 1, 1, 'center', 'date', 'Date', 1, NULL, NULL),
	(190, 20, 'syncDetail.objectType', 'Data Type', 1, 0, 1, 1, 1, 'left', 'dropdown', 'Data Type', 2, 19, NULL),
	(193, 21, 'fail.referenceNumber', 'Reference No', 1, 1, 1, 1, 1, 'left', 'input', 'Name', 1, NULL, NULL),
	(194, 21, 'fail.objectType', 'Data Type', 1, 1, 1, 1, 1, 'left', 'dropdown', 'Object Type', 2, 19, NULL),
	(195, 21, 'fail.failedDateTime', 'Date', 1, 1, 1, 1, 1, 'center', 'date', 'Date', 3, NULL, NULL),
	(196, 21, 'fail.failedReason', 'Message', 1, 1, 1, 1, 1, 'left', 'input', 'Message', 4, NULL, NULL),
	(197, 16, 'receipt.exportStatus', 'Export Status', 1, 1, 1, 1, 1, 'center', 'dropdown', 'Export Status', 11, 14, ''),
	(198, 15, 'expense.createdByName', 'Submitted User', 1, 1, 1, 1, 1, 'left', 'input', 'Submit User', 5, NULL, ''),
	(199, 7, 'chk.exportStatus', 'Export Status', 1, 1, 1, 1, 1, 'center', 'dropdown', 'Export Status', 14, 14, ''),
	(200, 14, 'bill.approvalGroup', 'Approval Group', 1, 1, 1, 1, 1, 'left', 'dropdown', 'Approval Group', 22, NULL, ''),
	(201, 13, 'po.approvalUserName', 'Approval User', 1, 1, 1, 1, 1, 'left', 'input', 'Approval User', 13, NULL, ''),
	(202, 13, 'po.approvalGroup', 'Approval Group', 1, 1, 1, 1, 1, 'left', 'dropdown', 'Approval Group', 14, NULL, ''),
	(204, 22, 'checkbox', '', 1, 0, 0, 0, 0, 'center', 'checkbox', '', 1, NULL, ''),
	(205, 22, 'action', 'Action', 1, 0, 0, 0, 0, 'center', 'actionButton', '', 2, NULL, ''),
	(206, 22, 'bill.billNo', 'Bill Number', 1, 1, 1, 1, 1, 'left', 'input', 'Bill Number', 4, NULL, ''),
	(207, 22, 'bill.billDate', 'Bill Date', 1, 1, 1, 1, 1, 'center', 'date', 'Bill Date', 5, NULL, ''),
	(208, 22, 'bill.billAmount', 'Amount', 1, 1, 1, 1, 1, 'right', 'numeric', 'Amount', 6, NULL, ''),
	(209, 22, 'term.id', 'Term', 1, 1, 1, 1, 1, 'left', 'dropdown', 'Term', 7, NULL, ''),
	(210, 22, 'bill.dueDate', 'Due Date', 1, 1, 1, 1, 1, 'center', 'date', 'Due Date', 8, NULL, ''),
	(211, 22, 'po.id', 'Purchase Order', 1, 1, 1, 1, 1, 'left', 'dropdown', 'Purchase Order', 9, NULL, ''),
	(212, 22, 'receipt.id', 'Purchase Order Receipt', 1, 1, 1, 1, 1, 'left', 'dropdown', 'Purchase Order Receipt', 10, NULL, ''),
	(213, 22, 'bill.submittedByName', 'Submitted By', 1, 1, 1, 1, 1, 'left', 'input', 'Submit By', 11, NULL, ''),
	(214, 22, 'bill.submittedOn', 'Submitted Date', 1, 1, 1, 1, 1, 'center', 'date', 'Submit Date', 12, NULL, ''),
	(215, 22, 'bill.balanceAmount', 'Remaining Balance', 1, 1, 1, 1, 1, 'right', 'numeric', 'Remaining Balance', 13, NULL, ''),
	(216, 22, 'bill.discountAmount', 'Applied Discount', 1, 1, 1, 1, 1, 'right', 'numeric', 'Discount Amount', 14, NULL, ''),
	(217, 22, 'bill.approvalUserName', 'Approval User', 1, 1, 1, 1, 1, 'left', 'input', 'Approval User', 15, NULL, ''),
	(218, 22, 'bill.approvedDate', 'Approve Date', 1, 1, 1, 1, 1, 'center', 'date', 'Approve Date', 16, NULL, ''),
	(219, 22, 'bill.status', 'Approval Status', 1, 1, 1, 1, 1, 'center', 'dropdown', 'Approval Status', 17, 15, ''),
	(220, 22, 'bill.paymentStatus', 'Payment Status', 1, 1, 1, 1, 1, 'center', 'dropdown', 'Payment Status', 18, 16, ''),
	(221, 22, 'bill.applicableDiscountAmount', 'Applicable Discount', 1, 1, 1, 1, 1, 'right', 'numeric', 'Applicable Discount', 19, NULL, ''),
	(222, 22, 'bill.discountApplicableDate', 'Discount Applicable Date', 1, 1, 1, 1, 1, 'center', 'date', 'Discount Applicable Date', 20, NULL, ''),
	(223, 22, 'bill.exportStatus', 'Export Status', 1, 1, 1, 1, 1, 'center', 'dropdown', 'Export Status', 21, 14, ''),
	(224, 22, 'bill.approvalGroup', 'Approval Group', 1, 1, 1, 1, 1, 'left', 'dropdown', 'Approval Group', 22, NULL, ''),
	(225, 23, 'checkbox', NULL, 1, 0, 0, 0, 0, 'center', 'checkbox', '', 1, NULL, ''),
	(226, 23, 'action', 'Action', 1, 0, 0, 0, 0, 'center', 'actionButton', '', 2, NULL, ''),
	(227, 23, 'chk.paymentReferanceNo', 'Payment Ref.', 1, 1, 1, 1, 1, 'left', 'input', 'Payment Ref.', 3, NULL, ''),
	(228, 23, 'chk.amount', 'Amount', 1, 1, 1, 1, 1, 'right', 'numeric', 'Amount', 4, NULL, ''),
	(229, 23, 'chk.discountAmount', 'Discount Amount', 1, 1, 1, 1, 1, 'right', 'numeric', 'Discount Amount', 5, NULL, ''),
	(230, 23, 'chk.paymentDate', 'Date', 1, 1, 1, 1, 1, 'center', 'date', 'Date', 6, NULL, ''),
	(231, 23, 'vi.billNo', 'Bill No', 1, 1, 1, 1, 1, 'left', 'input', 'Bill No.', 7, NULL, ''),
	(232, 23, 'vi.billAmount', 'Bill Amount', 1, 1, 1, 1, 1, 'right', 'numeric', 'Bill Amount', 8, NULL, ''),
	(233, 23, 'vi.billDate', 'Bill Date', 1, 1, 1, 1, 1, 'center', 'date', 'Bill Date', 10, NULL, ''),
	(234, 23, 'vi.dueDate', 'Due Date', 1, 1, 1, 1, 1, 'center', 'date', 'Due Date', 11, NULL, ''),
	(235, 23, 'chk.status', 'Status', 1, 1, 1, 1, 1, 'center', 'dropdown', 'All', 13, 8, ''),
	(236, 23, 'vi.poId', 'PO No', 1, 1, 1, 1, 1, 'left', 'dropdown', 'PO No', 12, NULL, ''),
	(237, 23, 'chk.exportStatus', 'Export Status', 1, 1, 1, 1, 1, 'center', 'dropdown', 'Export Status', 14, 14, ''),
	(238, 24, 'checkbox', NULL, 1, 0, 0, 0, 0, 'center', 'checkbox', '', 1, NULL, ''),
	(239, 24, 'action', 'Action', 1, 0, 0, 0, 0, 'center', 'actionButton', '', 2, NULL, ''),
	(240, 24, 'po.poNumber', 'PO Number', 1, 1, 1, 1, 1, 'left', 'input', 'PO Number', 4, NULL, ''),
	(241, 24, 'po.projectCodeId', 'Project / Task', 1, 1, 1, 1, 1, 'left', 'dropdown', 'Project / Task', 5, NULL, ''),
	(242, 24, 'po.netAmount', 'Amount', 1, 1, 1, 1, 1, 'right', 'numeric', 'Amount', 6, NULL, ''),
	(243, 24, 'po.poDate', 'PO Date', 1, 1, 1, 1, 1, 'center', 'date', 'PO Date', 7, NULL, ''),
	(244, 24, 'po.deliveryDate', 'Delivery Date', 1, 1, 1, 1, 1, 'center', 'date', 'Delivery Date', 8, NULL, ''),
	(245, 24, 'po.createdByName', 'Submitted By', 1, 1, 1, 1, 1, 'left', 'input', 'Submited By', 9, NULL, ''),
	(246, 24, 'po.createdOn', 'Submitted Date', 1, 1, 1, 1, 1, 'center', 'date', 'Submited Date', 10, NULL, ''),
	(247, 24, 'po.status', 'Internal Approval Status', 1, 1, 1, 1, 1, 'center', 'dropdown', 'Internal Approval Status', 11, 12, ''),
	(248, 24, 'po.vendorApprovalStatus', 'Vendor Approval Status', 1, 1, 1, 1, 1, 'center', 'dropdown', 'Vendor Approval Status', 12, 13, ''),
	(249, 24, 'po.approvalUserName', 'Approval User', 1, 1, 1, 1, 1, 'left', 'input', 'Approval User', 13, NULL, ''),
	(250, 24, 'po.approvalGroup', 'Approval Group', 1, 1, 1, 1, 1, 'left', 'dropdown', 'Approval Group', 14, NULL, ''),
	(251, 25, 'checkbox', '', 1, 0, 0, 0, 0, 'center', 'checkbox', '', 1, NULL, ''),
	(252, 25, 'action', 'Action', 1, 0, 0, 0, 0, 'center', 'actionButton', '', 2, NULL, ''),
	(253, 25, 'receipt.receiptNumber', 'Receipt Number', 1, 1, 1, 1, 1, 'left', 'input', 'Receipt Number', 3, NULL, ''),
	(254, 25, 'receipt.poId', 'PO Number', 1, 1, 1, 1, 1, 'left', 'dropdown', 'PO Number', 5, NULL, ''),
	(255, 25, 'receipt.receiptDate', 'Receipt Date', 1, 1, 1, 1, 1, 'center', 'date', 'Receipt Date', 6, NULL, ''),
	(256, 25, 'receipt.createdBy', 'Create User', 1, 1, 1, 1, 1, 'left', 'input', 'Create User', 7, NULL, ''),
	(257, 25, 'receipt.createdOn', 'Create Date', 1, 1, 1, 1, 1, 'center', 'date', 'Create Date', 8, NULL, ''),
	(258, 25, 'receipt.totalAmount', 'Amount', 1, 1, 1, 1, 1, 'right', 'numeric', 'Amount', 9, NULL, ''),
	(259, 25, 'receipt.status', 'Status', 1, 1, 1, 1, 1, 'center', 'dropdown', 'Status', 10, 17, ''),
	(260, 25, 'receipt.exportStatus', 'Export Status', 1, 1, 1, 1, 1, 'center', 'dropdown', 'Export Status', 11, 14, ''),
	(261, 13, 'po.exportStatus', 'Export Status', 1, 1, 1, 1, 1, 'center', 'dropdown', 'Export Status', 15, 14, ''),
	(262, 24, 'po.exportStatus', 'Export Status', 1, 1, 1, 1, 1, 'center', 'dropdown', 'Export Status', 15, 14, ''),
	(263, 26, 'action', 'Action', 1, 0, 0, 0, 0, 'center', 'actionButton', '', 2, NULL, ''),
	(264, 26, 'vendor.id', 'Vendor', 1, 1, 1, 1, 1, 'left', 'multiSelect', 'Vendor', 3, NULL, ''),
	(265, 26, 'discount.billNo', 'Bill Number', 1, 1, 1, 1, 1, 'left', 'input', 'Bill Number', 7, NULL, ''),
	(266, 26, 'discount.billDate', 'Bill Date', 1, 1, 1, 1, 1, 'center', 'date', 'Bill Date', 10, NULL, ''),
	(267, 26, 'discount.status', 'Approval Status', 1, 1, 1, 1, 1, 'center', 'dropdown', 'Approval Status', 17, 21, ''),
	(268, 26, 'discount.billAmount', 'Bill Amount', 1, 1, 1, 1, 1, 'right', 'numeric', 'Bill Amount', 8, NULL, ''),
	(269, 26, 'discount.term', 'Term', 1, 1, 1, 1, 1, 'left', 'dropdown', 'Term', 7, NULL, ''),
	(270, 26, 'discount.applicableDiscountAmount', 'Applicable Discount Amount', 1, 1, 1, 1, 1, 'right', 'numeric', 'Applicable Discount Amount', 5, NULL, ''),
	(271, 26, 'discount.discountApplicableDate', 'Discount Applicable Date', 1, 1, 1, 1, 1, 'center', 'date', 'Discount Applicable Date', 10, NULL, ''),
	(272, 27, 'action', 'Action', 1, 0, 0, 0, 0, 'center', 'actionButton', '', 1, NULL, ''),
	(273, 27, 'poc.departmentId', 'Department Name', 1, 1, 1, 1, 1, 'left', 'dropdown', 'Department Name', 2, NULL, ''),
	(274, 27, 'poc.poNoPattern', 'PO Number Pattern', 1, 1, 1, 1, 1, 'left', 'input', 'PO Number Pattern', 3, NULL, ''),
	(275, 27, 'poc.createdUserName', 'Created By', 1, 1, 1, 1, 1, 'left', 'input', 'Created By', 4, NULL, ''),
	(276, 27, 'poc.createdOn', 'Created Date', 1, 1, 1, 1, 1, 'center', 'date', 'Created Date', 5, NULL, ''),
	(277, 27, 'poc.override', 'Override', 1, 1, 1, 0, 1, 'center', 'dropdown', 'Override', 6, 20, ''),
	(278, 28, 'action', 'Action', 1, 0, 0, 0, 0, 'center', 'actionButton', '', 2, NULL, ''),
	(279, 28, 'vendor.id', 'Vendor', 1, 1, 1, 1, 1, 'left', 'multiSelect', 'Vendor', 3, NULL, ''),
	(280, 28, 'bill.billNo', 'Bill Number', 1, 1, 1, 1, 1, 'left', 'input', 'Bill Number', 4, NULL, ''),
	(281, 28, 'bill.billDate', 'Bill Date', 1, 1, 1, 1, 1, 'center', 'date', 'Bill Date', 5, NULL, ''),
	(282, 28, 'bill.billAmount', 'Amount', 1, 1, 1, 1, 1, 'right', 'numeric', 'Amount', 6, NULL, ''),
	(283, 28, 'term.id', 'Term', 1, 1, 1, 1, 1, 'left', 'dropdown', 'Term', 7, NULL, ''),
	(284, 28, 'bill.dueDate', 'Due Date', 1, 1, 1, 1, 1, 'center', 'date', 'Due Date', 8, NULL, ''),
	(285, 29, 'action', 'Action', 1, 0, 0, 0, 0, 'center', 'actionButton', '', 2, NULL, ''),
	(286, 29, 'po.vendorId', 'Vendor', 1, 1, 1, 1, 1, 'left', 'dropdown', 'Vendor', 3, NULL, ''),
	(287, 29, 'po.poNumber', 'PO Number', 1, 1, 1, 1, 1, 'left', 'input', 'PO Number', 4, NULL, ''),
	(288, 29, 'po.projectCodeId', 'Project / Task', 1, 1, 1, 1, 1, 'left', 'dropdown', 'Project / Task', 5, NULL, ''),
	(289, 29, 'po.netAmount', 'Amount', 1, 1, 1, 1, 1, 'right', 'numeric', 'Amount', 6, NULL, ''),
	(290, 29, 'po.poDate', 'PO Date', 1, 1, 1, 1, 1, 'center', 'date', 'PO Date', 7, NULL, ''),
	(291, 30, 'action', 'Action', 1, 0, 0, 0, 0, 'center', 'actionButton', '', 2, NULL, ''),
	(292, 30, 'expense.id', 'Report Number', 1, 1, 1, 1, 1, 'left', 'input', 'Report Number', 3, NULL, ''),
	(293, 30, 'expense.reportName', 'Report Name', 1, 1, 1, 1, 1, 'left', 'input', 'Report Name', 4, NULL, ''),
	(294, 30, 'expense.createdOn', 'Submitted Date', 1, 1, 1, 1, 1, 'center', 'date', 'Submit Date', 6, NULL, ''),
	(295, 30, 'expense.createdByName', 'Submitted User', 1, 1, 1, 1, 1, 'left', 'input', 'Submit User', 5, NULL, ''),
	(296, 10, 'appCode.description', 'Description', 1, 1, 1, 1, 1, 'left', 'input', 'Description', 8, NULL, ''),
	(297, 11, 'field.sectionId', 'Section', 1, 1, 0, 0, 1, 'left', 'dropdown', 'Section', 3, NULL, ''),
	(298, 4, 'acc.isPurchaseAccount', 'Purchasing Account', 1, 1, 1, 1, 1, 'center', 'dropdown', 'Purchasing Account', 8, 22, ''),
	(299, 10, 'appCode.contractValue', 'Contract Value', 1, 1, 1, 1, 1, 'right', 'numeric', 'Contract Value', 4, NULL, ''),
	(300, 13, 'dept.id', 'Department', 1, 1, 1, 1, 1, 'left', 'dropdown', 'Department', 16, NULL, ''),
	(301, 14, 'dept.id', 'Department', 1, 1, 1, 1, 1, 'left', 'dropdown', 'Department', 23, NULL, ''),
	(302, 10, 'appCode.projectBudget', 'Budget', 1, 1, 1, 1, 1, 'right', 'numeric', 'Budget', 5, NULL, ''),
	(303, 10, 'appCode.amountInvoiced', 'Amount Invoiced', 1, 1, 1, 1, 1, 'right', 'numeric', 'Amount Invoiced', 6, NULL, ''),
	(304, 10, 'appCode.remainingAmount', 'Remaining Amount', 1, 1, 1, 1, 1, 'right', 'numeric', 'Remaining Amount', 7, NULL, ''),
	(305, 31, 'action', 'Action', 1, 0, 0, 0, 0, 'center', 'actionButton', '', 2, NULL, ''),
	(306, 31, 'vendor.id', 'Vendor', 1, 1, 1, 1, 1, 'left', 'dropdown', 'Vendor', 3, NULL, ''),
	(307, 31, 'temp.templateName', 'Template Name', 1, 1, 1, 1, 1, 'left', 'input', 'Template Name', 4, NULL, ''),
	(308, 31, 'temp.status', 'Status', 1, 1, 1, 1, 1, 'center', 'dropdown', 'Status', 5, 23, ''),
	(309, 31, 'temp.createdBy', 'Created By', 1, 1, 1, 1, 1, 'left', 'input', 'Created By', 6, NULL, ''),
	(310, 31, 'temp.createdOn', 'Created Date', 1, 1, 1, 1, 1, 'center', 'date', 'Created On', 7, NULL, ''),
	(311, 31, 'checkbox', NULL, 1, 0, 0, 0, 0, 'center', 'checkbox', '', 1, NULL, ''),
	(312, 32, 'checkbox', NULL, 1, 0, 0, 0, 0, 'center', 'checkbox', '', 1, NULL, ''),
	(313, 32, 'action', 'Action', 1, 0, 0, 0, 0, 'center', 'actionButton', '', 3, NULL, ''),
	(314, 32, 'vendor.vendorName', 'Vendor', 1, 1, 1, 1, 1, 'left', 'multiSelect', 'Vendor', 4, NULL, ''),
	(315, 32, 'bill.billNo', 'Bill Number', 1, 1, 1, 1, 1, 'left', 'input', 'Bill Number', 5, NULL, ''),
	(316, 32, 'bill.billDate', 'Bill Date', 1, 1, 1, 1, 1, 'center', 'date', 'Bill Date', 6, NULL, ''),
	(317, 32, 'bill.billAmount', 'Amount', 1, 1, 1, 1, 1, 'right', 'numeric', 'Amount', 8, NULL, ''),
	(318, 32, 'bill.paidAmount', 'Paid Amount', 1, 1, 1, 1, 1, 'right', 'numeric', 'Paid Amount', 9, NULL, ''),
	(319, 32, 'bill.balanceAmount', 'Balance Amount', 1, 0, 1, 1, 1, 'right', 'numeric', 'Balance Amount', 10, NULL, ''),
	(320, 32, 'bill.paymentType', 'Payment Type', 1, 0, 1, 1, 1, 'left', 'input', 'Payment Type', 12, NULL, ''),
	(321, 32, 'bill.paymentAmount', 'Payment Amount', 1, 0, 1, 1, 1, 'right', 'numeric', 'Payment Amount', 13, NULL, ''),
	(322, 32, 'bill.applicableDiscount', 'Applied Discount', 1, 0, 1, 1, 1, 'right', 'numeric', 'Applied Discount', 14, NULL, ''),
	(323, 32, 'bill.paymentStatus', 'Payment Status', 1, 1, 1, 1, 1, 'center', 'dropdown', 'Payment Status', 15, 16, ''),
	(324, 32, 'bill.dueDate', 'Due Date', 1, 1, 1, 1, 1, 'center', 'date', 'Due Date', 7, NULL, ''),
	(325, 32, 'comment', 'Comment', 1, 0, 1, 1, 1, 'left', 'input', 'Comment', 13, NULL, ''),
	(326, 32, 'expand', '', 1, 0, 0, 0, 0, 'center', 'expand', '', 2, NULL, ''),
	(327, 32, 'bill.referenceNo', 'Reference No', 1, 0, 1, 1, 1, 'left', 'input', 'Reference No', 11, NULL, ''),
	(328, 33, 'txn.batchId', 'Batch ID', 1, 0, 0, 0, 0, 'left', 'input', 'Batch ID', 1, NULL, ''),
	(329, 33, 'txn.txnRef', 'Reference Number', 1, 0, 0, 0, 0, 'left', 'input', 'Transaction Id', 2, NULL, ''),
	(331, 33, 'txn.paidAmount', 'Paid Amount', 1, 0, 0, 0, 0, 'right', 'numeric', 'Paid Amount', 5, NULL, ''),
	(332, 33, 'txn.txnDate', 'Transaction Date', 1, 0, 0, 0, 0, 'center', 'date', 'Transaction Date', 3, NULL, ''),
	(333, 33, 'txn.paymentDate', 'Payment Date', 1, 0, 0, 0, 0, 'center', 'date', 'Payment Date', 7, NULL, ''),
	(335, 34, 'pay.vendor', 'Vendor', 1, 1, 1, 1, 1, 'left', 'input', 'Vendor', 2, NULL, ''),
	(336, 34, 'pay.noOfBills', 'No. of Bills', 1, 1, 1, 1, 1, 'right', 'numeric', 'No. of Bills', 3, NULL, ''),
	(337, 34, 'pay.paymentAmount', 'Payment Amount', 1, 1, 1, 1, 1, 'right', 'numeric', 'Payment Amount', 4, NULL, ''),
	(338, 34, 'pay.balanceToBePaid', 'Balance to be Paid', 1, 1, 1, 1, 1, 'right', 'numeric', 'Balance to be Paid', 5, NULL, ''),
	(339, 34, 'expand', NULL, 1, 0, 0, 0, 0, 'center', 'expand', '', 1, NULL, ''),
	(340, 34, 'delete', NULL, 1, 0, 0, 0, 0, 'center', 'deleteButton', '', 6, NULL, ''),
	(341, 35, 'txn.billNo', 'Bill No', 1, 0, 0, 0, 0, 'left', 'input', 'Bill No', 1, NULL, ''),
	(342, 35, 'txn.billDate', 'Bill Date', 1, 0, 0, 0, 0, 'center', 'date', 'Bill Date', 2, NULL, ''),
	(343, 35, 'txn.billAmount', 'Bill Amount', 1, 0, 0, 0, 0, 'right', 'numeric', 'Bill Amount', 4, NULL, ''),
	(344, 35, 'txn.dueDate', 'Due Date', 1, 0, 0, 0, 0, 'center', 'date', 'Due Date', 3, NULL, ''),
	(346, 35, 'txn.paymentType', 'Payment Type', 1, 0, 0, 0, 0, 'left', 'input', 'Payment Type', 6, NULL, ''),
	(347, 36, 'expand', '', 1, 0, 0, 0, 0, 'center', 'expand', '', 1, NULL, ''),
	(348, 36, 'action', 'Action', 1, 0, 0, 0, 0, 'center', 'actionButton', '', 2, NULL, ''),
	(349, 36, 'batch.batchId', 'Batch ID', 1, 1, 1, 1, 1, 'left', 'input', 'Batch Id', 3, NULL, ''),
	(350, 36, 'batch.createdDate', 'Created Date', 1, 1, 1, 1, 1, 'center', 'date', 'Created Date', 4, NULL, ''),
	(351, 36, 'batch.amount', 'Amount', 1, 1, 1, 1, 1, 'right', 'numeric', 'Amount', 5, NULL, ''),
	(352, 36, 'batch.noOfVendor', 'No of Vendors', 1, 1, 1, 1, 1, 'right', 'numeric', 'No of Vendors', 6, NULL, ''),
	(353, 36, 'batch.noOfBills', 'No of Bills', 1, 1, 1, 1, 1, 'right', 'numeric', 'No of Bills', 7, NULL, ''),
	(354, 36, 'batch.timeToCancel', 'Time Remaining to Cancel', 1, 1, 1, 1, 1, 'center', 'time', 'Time Remaining to Cancel', 8, NULL, ''),
	(355, 36, 'batch.approvalStatus', 'Approval Status', 1, 1, 1, 1, 1, 'center', 'dropdown', 'Approval Status', 9, 21, ''),
	(356, 36, 'batch.paymentStatus', 'Payment Status', 1, 1, 1, 1, 1, 'center', 'dropdown', 'Payment Status', 10, 16, ''),
	(357, 36, 'batch.paymentProvider', 'Payment Provider', 1, 1, 1, 1, 1, 'center', 'input', 'Payment Provider', 11, NULL, ''),
	(358, 36, 'batch.createdBy', 'Created By', 1, 1, 1, 1, 1, 'left', 'input', 'Created By', 12, NULL, ''),
	(359, 36, 'batch.approvedBy', 'Approved By', 1, 1, 1, 1, 1, 'left', 'input', 'Approved By', 13, NULL, ''),
	(360, 36, 'batch.approvedDate', 'Approved Date', 1, 1, 1, 1, 1, 'center', 'date', 'Approved Date', 14, NULL, ''),
	(361, 36, 'batch.processedDate', 'Processed Date', 1, 1, 1, 1, 1, 'center', 'date', 'Processed Date', 15, NULL, ''),
	(362, 37, 'txn.txnRef', 'Reference Number', 1, 0, 0, 0, 0, 'left', 'input', 'Transaction Id', 3, NULL, ''),
	(363, 37, 'txn.billNo', 'Bill No', 1, 0, 0, 0, 0, 'left', 'input', 'Bill No', 2, NULL, ''),
	(364, 37, 'txn.vendor', 'Vendor', 1, 0, 0, 0, 0, 'left', 'input', 'Vendor', 1, NULL, ''),
	(365, 37, 'txn.paidAmount', 'Paid Amount', 1, 0, 0, 0, 0, 'right', 'numeric', 'Paid Amount', 5, NULL, ''),
	(366, 37, 'txn.txnDate', 'Transaction Date', 1, 0, 0, 0, 0, 'center', 'date', 'Transaction Date', 9, NULL, ''),
	(367, 37, 'txn.paymentDate', 'Payment Date', 1, 0, 0, 0, 0, 'center', 'date', 'Payment Date', 7, NULL, ''),
	(368, 37, 'txn.status', 'Status', 1, 0, 0, 0, 0, 'center', 'input', 'Status', 8, NULL, ''),
	(369, 37, 'txn.paymentType', 'Transaction Type', 1, 0, 0, 0, 0, 'center', 'input', 'Transaction Type', 3, NULL, ''),
	(370, 37, 'txn.reason', 'Reason (If failed)', 1, 0, 0, 0, 0, 'left', 'input', 'Reason (If Faild)', 10, NULL, ''),
	(371, 38, 'action', 'Action', 1, 0, 0, 0, 0, 'center', 'actionButton', '', 2, NULL, ''),
	(372, 38, 'vendor.id', 'Vendor', 1, 1, 1, 1, 1, 'left', 'multiSelect', 'Vendor', 3, NULL, ''),
	(373, 38, 'venpay.noOfBills', 'No Of Bills', 1, 1, 1, 1, 1, 'right', 'numeric', 'No Of Bills', 4, NULL, ''),
	(374, 38, 'venpay.paidAmount', 'Paid Amount', 1, 1, 1, 1, 1, 'right', 'numeric', 'Paid Amount', 5, NULL, ''),
	(375, 38, 'venpay.dueAmount', 'Due Amount', 1, 1, 1, 1, 1, 'right', 'numeric', 'Due Amount', 6, NULL, ''),
	(376, 38, 'venpay.totalDiscount', 'Total Discount', 1, 1, 1, 1, 1, 'right', 'numeric', 'Total Discount', 7, NULL, ''),
	(377, 38, 'venpay.latestPaymentAmount', 'Latest Payment Amount', 1, 1, 1, 1, 1, 'right', 'numeric', 'Latest Payment Amount', 8, NULL, ''),
	(378, 38, 'venpay.latestPaymentDate', 'Latest Payment Date', 1, 1, 1, 1, 1, 'center', 'date', 'Latest Payment Date', 9, NULL, ''),
	(379, 38, 'expand', NULL, 1, 0, 0, 0, 0, 'center', 'expand', '', 1, NULL, ''),
	(380, 39, 'txn.batchId', 'Batch ID', 1, 0, 0, 0, 0, 'left', 'numeric', 'Batch ID', 1, NULL, ''),
	(381, 39, 'txn.paymentReferenceNo', 'Payment Reference No', 1, 0, 0, 0, 0, 'left', 'numeric', 'Payment Reference No', 2, NULL, ''),
	(382, 39, 'txn.paymentDate', 'Payment Date', 1, 0, 0, 0, 0, 'left', 'date', 'Payment Date', 3, NULL, ''),
	(383, 39, 'txn.paymentAmount', 'Payment Amount', 1, 0, 0, 0, 0, 'left', 'numeric', 'Payment Amount', 4, NULL, ''),
	(384, 39, 'txn.paymentType', 'Payment Type', 1, 0, 0, 0, 0, 'right', 'input', 'Payment Type', 5, NULL, ''),
	(385, 39, 'txn.status', 'Status', 1, 0, 0, 0, 0, 'center', 'input', 'Status', 6, NULL, ''),
	(386, 40, 'checkbox', '', 1, 0, 0, 0, 0, 'center', 'checkbox', '', 1, NULL, ''),
	(387, 40, 'action', 'Action', 1, 0, 0, 0, 0, 'center', 'actionButton', '', 2, NULL, ''),
	(388, 40, 'recBill.scheduleName', 'Schedule Name', 1, 1, 1, 1, 1, 'left', 'input', 'Schedule Name', 3, NULL, ''),
	(389, 40, 'recBill.intervalValue', 'Interval', 1, 1, 1, 1, 1, 'left', 'dropdown', 'Interval', 4, NULL, ''),
	(390, 40, 'vend.id', 'Vendor', 1, 1, 1, 1, 1, 'left', 'multiSelect', 'Vendor', 5, NULL, ''),
	(391, 40, 'term.id', 'Term', 1, 1, 1, 1, 1, 'left', 'dropdown', 'Term', 6, NULL, ''),
	(392, 40, 'recBill.billAmount', 'Amount', 1, 1, 1, 1, 1, 'right', 'numeric', 'Amount', 7, NULL, ''),
	(393, 40, 'recBill.lastGenerationDate', 'Last Generation Date', 1, 1, 1, 1, 1, 'right', 'date', 'Last Generation Date', 8, NULL, ''),
	(394, 33, 'txn.status', 'Status', 1, 0, 0, 0, 0, 'center', 'dropdown', 'Status', 8, NULL, ''),
	(395, 33, 'txn.paymentType', 'Transaction Type', 1, 0, 0, 0, 0, 'center', 'dropdown', 'Transaction Type', 9, NULL, ''),
	(396, 33, 'txn.reason', 'Reason (If failed)', 1, 0, 0, 0, 0, 'left', 'input', 'Reason (If Faild)', 10, NULL, ''),
	(397, 40, 'recBill.createdOn', 'Created Date', 1, 1, 1, 1, 1, 'center', 'date', 'Created Date', 12, NULL, ''),
	(398, 40, 'recBill.status', 'Status', 1, 1, 1, 1, 1, 'center', 'dropdown', 'Status', 13, 1, ''),
	(399, 35, 'txn.txnRef', 'Reference No', 1, 0, 0, 0, 0, 'left', 'input', 'Reference No', 7, NULL, ''),
	(400, 35, 'txn.paymentAmount', 'Payment Amount', 1, 0, 0, 0, 0, 'right', 'input', 'Payment Amount', 9, NULL, ''),
	(401, 35, 'txn.appliedDiscount', 'Applied Discount', 1, 0, 0, 0, 0, 'right', 'input', 'Applied Discount', 10, NULL, ''),
	(402, 35, 'txn.comment', 'Comment', 1, 0, 0, 0, 0, 'left', 'input', 'Comment', 11, NULL, ''),
	(403, 35, 'delete', NULL, 1, 0, 0, 0, 0, 'center', 'deleteButton', '', 12, NULL, ''),
	(404, 33, 'txn.status', 'Status', 1, 0, 0, 0, 0, 'center', 'dropdown', 'Status', 7, NULL, ''),
	(405, 33, 'txn.paymentType', 'Transaction Type', 1, 0, 0, 0, 0, 'center', 'dropdown', 'Transaction Type', 8, NULL, ''),
	(406, 33, 'txn.reason', 'Reason (If Faild)', 1, 0, 0, 0, 0, 'left', 'input', 'Reason (If Faild)', 9, NULL, ''),
	(407, 34, 'emptyColumn', NULL, 1, 0, 0, 0, 0, 'left', 'input', '', 16, NULL, ''),
	(408, 34, 'emptyColumn', NULL, 1, 0, 0, 0, 0, 'left', 'input', '', 17, NULL, ''),
	(409, 34, 'emptyColumn', NULL, 1, 0, 0, 0, 0, 'left', 'input', '', 18, NULL, ''),
	(410, 34, 'emptyColumn', NULL, 1, 0, 0, 0, 0, 'left', 'input', '', 19, NULL, ''),
	(411, 41, 'pay.vendor', 'Vendor', 1, 0, 0, 0, 0, 'left', 'input', 'Vendor', 2, NULL, ''),
	(412, 41, 'pay.noOfBills', 'No. of Bills', 1, 0, 0, 0, 0, 'center', 'number', 'No. of Bills', 3, NULL, ''),
	(413, 41, 'pay.paidAmount', 'Paid Amount', 1, 0, 0, 0, 0, 'right', 'number', 'Paid Amount', 4, NULL, ''),
	(414, 41, 'pay.appliedDiscount', 'Applied Discount', 1, 0, 0, 0, 0, 'right', 'number', 'Applied Discount', 5, NULL, ''),
	(415, 41, 'expand', NULL, 1, 0, 0, 0, 0, 'center', 'expand', '', 1, NULL, ''),
	(416, 42, 'txn.billNo', 'Bill No', 1, 0, 0, 0, 0, 'left', 'input', 'Bill No', 1, NULL, ''),
	(417, 42, 'txn.billDate', 'Bill Date', 1, 0, 0, 0, 0, 'center', 'date', 'Bill Date', 2, NULL, ''),
	(418, 42, 'txn.billAmount', 'Bill Amount', 1, 0, 0, 0, 0, 'right', 'numeric', 'Bill Amount', 4, NULL, ''),
	(419, 42, 'txn.dueDate', 'Due Date', 1, 0, 0, 0, 0, 'center', 'date', 'Due Date', 3, NULL, ''),
	(420, 42, 'txn.paymentType', 'Payment Type', 1, 0, 0, 0, 0, 'left', 'input', 'Payment Type', 6, NULL, ''),
	(421, 42, 'txn.txnRef', 'Reference No', 1, 0, 0, 0, 0, 'left', 'input', 'Reference No', 7, NULL, ''),
	(422, 42, 'txn.paymentAmount', 'Payment Amount', 1, 0, 0, 0, 0, 'right', 'input', 'Payment Amount', 9, NULL, ''),
	(423, 42, 'txn.appliedDiscount', 'Applied Discount', 1, 0, 0, 0, 0, 'right', 'input', 'Applied Discount', 10, NULL, ''),
	(424, 42, 'txn.comment', 'Comment', 1, 0, 0, 0, 0, 'left', 'input', 'Comment', 11, NULL, ''),
	(425, 42, 'delete', NULL, 1, 0, 0, 0, 0, 'center', 'deleteButton', '', 12, NULL, ''),
	(426, 41, 'emptyColumn', NULL, 1, 0, 0, 0, 0, 'center', 'input', '', 13, NULL, ''),
	(427, 41, 'emptyColumn', NULL, 1, 0, 0, 0, 0, 'center', 'input', '', 14, NULL, ''),
	(428, 41, 'emptyColumn', NULL, 1, 0, 0, 0, 0, 'center', 'input', '', 15, NULL, ''),
	(429, 41, 'emptyColumn', NULL, 1, 0, 0, 0, 0, 'center', 'input', '', 16, NULL, '');
/*!40000 ALTER TABLE `common_grid_column_template` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.common_grid_column_user_wice
DROP TABLE IF EXISTS `common_grid_column_user_wice`;
CREATE TABLE IF NOT EXISTS `common_grid_column_user_wice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(100) NOT NULL,
  `grid_id` int(11) NOT NULL,
  `field` varchar(50) NOT NULL,
  `header` varchar(50) DEFAULT NULL,
  `column_show` tinyint(1) DEFAULT NULL,
  `is_sortable` tinyint(1) DEFAULT NULL,
  `is_re_orderable` tinyint(1) DEFAULT NULL,
  `is_re_sizable` tinyint(1) DEFAULT NULL,
  `can_hide` tinyint(1) DEFAULT NULL,
  `align` varchar(50) NOT NULL,
  `search_type` varchar(50) NOT NULL,
  `placeholder` varchar(100) DEFAULT NULL,
  `column_order` int(3) NOT NULL,
  `drop_down_id` int(11) DEFAULT NULL,
  `drop_down_url` varchar(200) DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `TABLE_FK_2` (`grid_id`),
  KEY `DROP_DOWN_ID_FK_2` (`drop_down_id`),
  CONSTRAINT `DROP_DOWN_ID_FK_2` FOREIGN KEY (`drop_down_id`) REFERENCES `common_drop_down` (`id`),
  CONSTRAINT `common_grid_column_user_wice_ibfk_1` FOREIGN KEY (`grid_id`) REFERENCES `common_grid_template` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table papertrl_default_script.common_grid_column_user_wice: ~0 rows (approximately)
/*!40000 ALTER TABLE `common_grid_column_user_wice` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_grid_column_user_wice` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.common_grid_filter_template
DROP TABLE IF EXISTS `common_grid_filter_template`;
CREATE TABLE IF NOT EXISTS `common_grid_filter_template` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `grid_id` int(11) NOT NULL,
  `drop_down_id` int(11) DEFAULT NULL,
  `field` varchar(50) NOT NULL,
  `header` varchar(50) NOT NULL,
  `search_type` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `TABLE_FK_1` (`grid_id`),
  KEY `TABLE_FK_DROPD_DOWN` (`drop_down_id`),
  CONSTRAINT `TABLE_FK_1` FOREIGN KEY (`grid_id`) REFERENCES `common_grid_template` (`id`),
  CONSTRAINT `TABLE_FK_DROPD_DOWN` FOREIGN KEY (`drop_down_id`) REFERENCES `common_drop_down` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8;

-- Dumping data for table papertrl_default_script.common_grid_filter_template: ~78 rows (approximately)
/*!40000 ALTER TABLE `common_grid_filter_template` DISABLE KEYS */;
INSERT INTO `common_grid_filter_template` (`id`, `grid_id`, `drop_down_id`, `field`, `header`, `search_type`) VALUES
	(1, 1, NULL, 'roleId', 'Role ID', 'input'),
	(2, 1, NULL, 'roleName', 'Role Name', 'input'),
	(3, 1, NULL, 'createdBy', 'Created By', 'input'),
	(4, 1, NULL, 'createDate', 'Create Date', 'date'),
	(5, 1, 1, 'status', 'Status', 'dropdown'),
	(6, 3, NULL, 'apgr.id', 'Approval Group ID', 'input'),
	(7, 3, NULL, 'apgr.name', 'Approval Group Name', 'input'),
	(8, 3, NULL, 'usm.name', 'Created By', 'input'),
	(9, 3, NULL, 'apgr.dateCreated', 'Create Date', 'date'),
	(10, 3, 1, 'apgr.status', 'Status', 'dropdown'),
	(11, 2, NULL, 'usm.email', 'Email Address', 'input'),
	(12, 2, NULL, 'usm.name', 'Name', 'input'),
	(13, 2, NULL, 'usm.nicPassportNo', 'Employee No', 'input'),
	(14, 2, NULL, 'approvalGroups', 'Approval Groups', 'dropdown'),
	(15, 2, NULL, 'rolem.name', 'Role', 'dropdown'),
	(16, 2, 1, 'usm.status', 'Status', 'dropdown'),
	(17, 4, NULL, 'acct.name', 'Account Type', 'dropdown'),
	(18, 4, NULL, 'accdt.name', 'Account Detail Type', 'dropdown'),
	(19, 4, NULL, 'acc.number', 'Account No', 'input'),
	(20, 4, NULL, 'acc.name', 'Account Name', 'input'),
	(21, 4, NULL, 'acc2.name', 'Parent Account', 'dropdown'),
	(22, 4, 1, 'acc.status', 'Status', 'dropdown'),
	(23, 5, NULL, 'type.name', 'Item Type', 'dropdown'),
	(24, 5, NULL, 'cat.name', 'Category', 'input'),
	(25, 5, NULL, 'item.itemNumber', 'Item No', 'input'),
	(26, 5, NULL, 'item.name', 'Item Name', 'input'),
	(27, 5, 6, 'item.taxable', 'Taxability', 'dropdown'),
	(28, 5, NULL, 'item.salesPrice', 'Selling Price', 'input'),
	(29, 5, 1, 'item.status', 'Status', 'dropdown'),
	(30, 6, NULL, 'tenantId', 'Tenant ID', 'input'),
	(31, 6, NULL, 'companyName', 'Company Name', 'input'),
	(32, 6, NULL, 'emailAddress', 'Email Address', 'input'),
	(33, 6, 1, 'status', 'Status', 'dropdown'),
	(34, 7, NULL, 'chk.paymentReferanceNo', 'Payment Ref', 'input'),
	(35, 7, NULL, 'chk.amount', 'Amount', 'input'),
	(36, 7, NULL, 'chk.discountAmount', 'Bill Amount', 'input'),
	(37, 7, NULL, 'chk.paymentDate', 'Date', 'date'),
	(38, 7, NULL, 'vi.invoiceNo', 'Bill No', 'input'),
	(39, 7, NULL, 'vi.invoiceAmount', 'Bill Amount', 'input'),
	(40, 7, NULL, 'vn.name', 'Vendor', 'input'),
	(41, 7, NULL, 'vi.invoiceDate', 'Bill Date', 'date'),
	(42, 7, NULL, 'vi.dueDate', 'Due Date', 'date'),
	(43, 7, 8, 'chk.status', 'Status', 'dropdown'),
	(44, 8, NULL, 'vendor.name', 'Vendor Name', 'input'),
	(45, 8, NULL, 'vendor.contactPerson', 'Contact Name', 'input'),
	(46, 8, NULL, 'vendor.contactNumber', 'Contact No', 'input'),
	(47, 8, NULL, 'vendor.email', 'Contact Email', 'input'),
	(48, 9, NULL, 'req.vendorName', 'Vendor Name', 'input'),
	(49, 9, NULL, 'req.contactPerson', 'Contact Name', 'input'),
	(50, 9, NULL, 'req.contactNumber', 'Contact Number', 'input'),
	(51, 9, NULL, 'req.vendorEmail', 'Email Address', 'input'),
	(52, 9, NULL, 'req.status', 'Status', 'dropdown'),
	(53, 7, NULL, 'po.poNumber', 'PO No', 'input'),
	(54, 10, NULL, 'appCode.name', 'Project Code', 'input'),
	(56, 10, NULL, 'appCode.createdOn', 'Create Date', 'date'),
	(57, 10, NULL, 'usm.name', 'Created By', 'input'),
	(59, 10, 1, 'appCode.status', 'Status', 'dropdown'),
	(60, 11, NULL, 'field.moduleId', 'Document Type', 'dropdown'),
	(61, 11, NULL, 'field.fieldName', 'Field Name', 'dropdown'),
	(62, 11, NULL, 'field.fieldId', 'Field Type', 'dropdown'),
	(63, 11, 10, 'field.required', 'Required Status', 'dropdown'),
	(64, 11, 11, 'field.status', 'Active Status', 'dropdown'),
	(65, 12, NULL, 'aut.name', 'Name', 'input'),
	(66, 12, NULL, 'configDoc.documentTypeId', 'Document Type', 'dropdown'),
	(67, 12, NULL, 'configDoc.eventId', 'Event', 'dropdown'),
	(68, 12, NULL, 'aut.createdBy', 'Created By', 'input'),
	(69, 12, NULL, 'aut.createdDate', 'Created Date', 'date'),
	(71, 12, 1, 'aut.staus', 'Status', 'dropdown'),
	(72, 13, NULL, 'vendorId', 'Vendor', 'dropdown'),
	(73, 13, NULL, 'poNumber', 'PO Number', 'input'),
	(74, 13, NULL, 'projectCodeId', 'Project / Task', 'dropdown'),
	(75, 13, NULL, 'netAmount', 'Amount', 'numeric'),
	(76, 13, NULL, 'poDate', 'PO Date', 'date'),
	(77, 13, NULL, 'deliveryDate', 'Delivery Date', 'date'),
	(78, 13, NULL, 'createdBy', 'Submited By', 'input'),
	(79, 13, NULL, 'createdOn', 'Submited Date', 'input'),
	(80, 13, 12, 'status', 'Internal Approval Status', 'dropdown'),
	(81, 13, 13, 'vendorApprovalStatus', 'Vendor Approval Status', 'dropdown');
/*!40000 ALTER TABLE `common_grid_filter_template` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.common_grid_state_template
DROP TABLE IF EXISTS `common_grid_state_template`;
CREATE TABLE IF NOT EXISTS `common_grid_state_template` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `grid_id` int(11) NOT NULL,
  `start_from` int(8) DEFAULT 0,
  `total_rows` int(8) DEFAULT 10,
  `column_widths` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1_TABLE_ID` (`grid_id`),
  CONSTRAINT `FK1_TABLE_ID` FOREIGN KEY (`grid_id`) REFERENCES `common_grid_template` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;

-- Dumping data for table papertrl_default_script.common_grid_state_template: ~42 rows (approximately)
/*!40000 ALTER TABLE `common_grid_state_template` DISABLE KEYS */;
INSERT INTO `common_grid_state_template` (`id`, `grid_id`, `start_from`, `total_rows`, `column_widths`) VALUES
	(1, 1, 0, 15, '50,100,307,307,307,307,307'),
	(2, 3, 0, 15, '50,100,306,306,306,307,307'),
	(3, 2, 0, 15, '50,100,255,268,246,256,256,256'),
	(4, 4, 0, 15, '50,102,257,257,257,257,257,257,257'),
	(5, 5, 0, 15, '50,100,220,218,214,218,218,219,219'),
	(6, 6, 0, 15, '50,100,100,100,100'),
	(7, 7, 0, 15, '50,100,155,155,155,155,155,155,155,155,155,155,155,155'),
	(8, 8, 0, 15, '50,100,210,210,210,200,200,200,200,200'),
	(9, 9, 0, 15, '50,100,180,180,180,181,181,181'),
	(10, 10, 0, 15, '50,100,305,305,305,305,305,305'),
	(11, 11, 0, 15, '100,220,218,214,218,218,218'),
	(12, 12, 0, 15, '58,147,147,147,147,147,147,147'),
	(13, 13, 0, 15, '50,100,220,218,214,218,218,219,219,219,219,219,219,219,219,219'),
	(14, 14, 0, 15, '51,126,200,200,200,200,200,200,200,200,200,200,200,200,200,200,200,200,200,200,200,200,200'),
	(15, 15, 0, 15, '50,100,220,215,215,215,215,215,215,215,215,215,215,215'),
	(16, 16, 0, 15, '50,100,220,218,214,218,218,219,219,219,219'),
	(17, 18, 0, 10, '210,210,210,210'),
	(18, 19, 0, 10, '50,210,210,210,210,210'),
	(19, 20, 0, 10, '210,210,210,210'),
	(20, 21, 0, 10, '210,210,210,210'),
	(21, 17, 0, 10, '50,100,218,218,218,218,218,218'),
	(22, 23, 0, 10, '50,100,154,155,155,155,155,155,155,155,155'),
	(23, 24, 0, 10, '50,100,218,214,218,218,219,219,219,219,219,219,219,219'),
	(24, 22, 0, 10, '51,126,200,200,200,200,200,200,200,200,200,200,200,200,200,200,200,200,200,200'),
	(25, 25, 0, 10, '50,100,218,214,218,218,219,219,219'),
	(26, 26, 0, 10, '100,210,210,210,210,210,210,210'),
	(27, 27, 0, 15, '100,210,210,210,210,210'),
	(28, 28, 0, 10, '100,210,210,210,210,210,210'),
	(29, 29, 0, 10, '100,210,210,210,210,210'),
	(30, 30, 0, 10, '100,210,210,210,210'),
	(31, 31, 0, 10, '50,100,210,210,210,210,210'),
	(32, 32, 0, 10, '50,50,100,210,210,210,210,210,210,210,210,210,210,210,210,210,210'),
	(33, 33, 0, 10, '210,210,210,210,210'),
	(34, 34, 0, 10, '50,200,200,200,200,200,210,210,210,210'),
	(35, 35, 0, 10, '0210,210,210,210,210,210,210,210,210,210,50'),
	(36, 36, 0, 10, '50,100,210,210,210,210,210,210,210,210,210,210,210,210,210'),
	(37, 37, 0, 10, '100,150,100,100,75,75,210'),
	(38, 38, 0, 10, '50,100,210,210,210,210,210,210'),
	(39, 39, 0, 10, '210,210,210,210,210,210,210'),
	(40, 40, 0, 15, '50,100,210,210,210,210,210,210,210,210,210,210,210'),
	(41, 41, 0, 10, '50,200,200,200,200,200,200,200,200'),
	(42, 42, 0, 10, '0210,210,210,210,210,50,210,210,210,210');
/*!40000 ALTER TABLE `common_grid_state_template` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.common_grid_state_user_wice
DROP TABLE IF EXISTS `common_grid_state_user_wice`;
CREATE TABLE IF NOT EXISTS `common_grid_state_user_wice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(100) NOT NULL,
  `grid_id` int(11) NOT NULL,
  `start_from` int(8) DEFAULT 0,
  `total_rows` int(8) DEFAULT 10,
  `column_widths` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1_TABLE_ID` (`grid_id`),
  CONSTRAINT `common_grid_state_user_wice_ibfk_1` FOREIGN KEY (`grid_id`) REFERENCES `common_grid_template` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=279 DEFAULT CHARSET=utf8;

-- Dumping data for table papertrl_default_script.common_grid_state_user_wice: ~0 rows (approximately)
/*!40000 ALTER TABLE `common_grid_state_user_wice` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_grid_state_user_wice` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.common_grid_template
DROP TABLE IF EXISTS `common_grid_template`;
CREATE TABLE IF NOT EXISTS `common_grid_template` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `grid_name` varchar(100) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;

-- Dumping data for table papertrl_default_script.common_grid_template: ~42 rows (approximately)
/*!40000 ALTER TABLE `common_grid_template` DISABLE KEYS */;
INSERT INTO `common_grid_template` (`id`, `grid_name`) VALUES
	(1, 'ROLE_LIST'),
	(2, 'USER_LIST'),
	(3, 'APPROVAL_GROUP_LIST'),
	(4, 'ACCOUNT_LIST'),
	(5, 'ITEM_LIST'),
	(6, 'SUB_ACCOUNT_LIST'),
	(7, 'BILL_PAYMENT_LIST'),
	(8, 'COMMUNITY_VENDOR_LIST'),
	(9, 'VENDOR_REQUEST_LIST'),
	(10, 'PROJECT_CODE_LIST'),
	(11, 'ADDITIONAL_FIELD_LIST'),
	(12, 'AUTOMATION_LIST'),
	(13, 'PO_LIST'),
	(14, 'BILL_LIST'),
	(15, 'EXPENSE_LIST'),
	(16, 'PO_RECEIPT_LIST'),
	(17, 'VENDOR_INVITATION_LIST'),
	(18, 'SYNC_ACCOUNT_PROCESSING_LIST'),
	(19, 'SYNC_ACCOUNT_PENDING_LIST'),
	(20, 'SYNC_ACCOUNT_COMPLETED'),
	(21, 'SYNC_ACCOUNT_FAILED_LIST'),
	(22, 'VENDOR_BILL_LIST'),
	(23, 'VENDOR_BILL_PAYMENT_LIST'),
	(24, 'VENDOR_PURCHASE_ORDER_LIST'),
	(25, 'VENDOR_PO_RECEIPTS'),
	(26, 'DISCOUNT_APPLICABLE_LIST'),
	(27, 'PO_NUMBER_CONFIGURATION_LIST'),
	(28, 'TGRID_BILL_LIST'),
	(29, 'TGRID_PO_LIST'),
	(30, 'TGRID_EXP_LIST'),
	(31, 'OCR_BILL_TEMPLATE'),
	(32, 'PAYMENT_APPROVED_BILL'),
	(33, 'PAYMENT_UNDER_APPROVED_BILL'),
	(34, 'PAYMENT_REVIEW'),
	(35, 'PAYMENT_UNDER_REVIEW'),
	(36, 'PAYMENT_BATCH_WISE'),
	(37, 'PAYMENT_UNDER_BATCH_WISE'),
	(38, 'PAYMENT_VENDOR_WISE'),
	(39, 'PAYMENT_UNDER_VENDOR_WISE'),
	(40, 'RECURRING_BILL_TEMPLATE_LIST'),
	(41, 'BATCH_DETAIL_VIEW'),
	(42, 'BATCH_UNDER_DETAIL_VIEW');
/*!40000 ALTER TABLE `common_grid_template` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.common_integration_error
DROP TABLE IF EXISTS `common_integration_error`;
CREATE TABLE IF NOT EXISTS `common_integration_error` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `error_code` varchar(200) DEFAULT NULL,
  `error_message` text DEFAULT NULL,
  `error_detail` varchar(255) DEFAULT NULL,
  `date_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table papertrl_default_script.common_integration_error: ~0 rows (approximately)
/*!40000 ALTER TABLE `common_integration_error` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_integration_error` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.common_integration_failed_record
DROP TABLE IF EXISTS `common_integration_failed_record`;
CREATE TABLE IF NOT EXISTS `common_integration_failed_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tp_id` varchar(100) DEFAULT NULL,
  `papertrl_id` int(11) DEFAULT NULL,
  `system_short_code` varchar(30) NOT NULL,
  `failed_reason` varchar(500) DEFAULT NULL,
  `reference_number` varchar(255) NOT NULL,
  `object_type` varchar(100) NOT NULL,
  `failed_date_time` datetime NOT NULL,
  `system_id` int(11) NOT NULL,
  `system_name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Dumping data for table papertrl_default_script.common_integration_failed_record: ~0 rows (approximately)
/*!40000 ALTER TABLE `common_integration_failed_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_integration_failed_record` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.common_integration_id_connection
DROP TABLE IF EXISTS `common_integration_id_connection`;
CREATE TABLE IF NOT EXISTS `common_integration_id_connection` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `papertrl_id` int(11) NOT NULL,
  `tp_id` varchar(100) NOT NULL,
  `papertrl_parent_id` int(11) DEFAULT NULL,
  `tp_parent_id` varchar(100) DEFAULT NULL,
  `system_short_code` varchar(30) NOT NULL,
  `object_type` varchar(100) NOT NULL,
  `edit_sequence` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=386 DEFAULT CHARSET=utf8;

-- Dumping data for table papertrl_default_script.common_integration_id_connection: ~0 rows (approximately)
/*!40000 ALTER TABLE `common_integration_id_connection` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_integration_id_connection` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.common_integration_incomplete_record
DROP TABLE IF EXISTS `common_integration_incomplete_record`;
CREATE TABLE IF NOT EXISTS `common_integration_incomplete_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tp_id` varchar(100) NOT NULL,
  `object_type` varchar(150) NOT NULL,
  `string_data` text DEFAULT NULL,
  `byte_data` mediumblob DEFAULT NULL,
  `system_short_code` varchar(30) NOT NULL,
  `status` char(1) NOT NULL,
  `attempt` int(11) NOT NULL,
  `created_by` varchar(100) NOT NULL,
  `created_on` datetime NOT NULL,
  `update_by` varchar(100) DEFAULT NULL,
  `update_on` datetime DEFAULT NULL,
  `delete_by` varchar(100) DEFAULT NULL,
  `delete_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- Dumping data for table papertrl_default_script.common_integration_incomplete_record: ~0 rows (approximately)
/*!40000 ALTER TABLE `common_integration_incomplete_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_integration_incomplete_record` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.common_integration_service
DROP TABLE IF EXISTS `common_integration_service`;
CREATE TABLE IF NOT EXISTS `common_integration_service` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `status` char(1) DEFAULT NULL,
  `service_type` int(5) NOT NULL,
  `service_group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- Dumping data for table papertrl_default_script.common_integration_service: ~27 rows (approximately)
/*!40000 ALTER TABLE `common_integration_service` DISABLE KEYS */;
INSERT INTO `common_integration_service` (`id`, `name`, `status`, `service_type`, `service_group_id`) VALUES
	(1, 'Push accounts to', 'A', 1, 1),
	(2, 'Pull accounts from', 'A', 2, 1),
	(3, 'Pull unit of measurements from', 'A', 2, 2),
	(4, 'Push unit of measurements to', 'A', 1, 2),
	(5, 'Push items to', 'A', 1, 3),
	(6, 'Pull items from', 'A', 2, 3),
	(7, 'Push project codes to', 'A', 1, 5),
	(8, 'Pull project codes from', 'A', 2, 5),
	(9, 'Push payment terms to', 'A', 1, 6),
	(10, 'Pull payment terms from', 'A', 2, 6),
	(11, 'Push vendors to', 'A', 1, 7),
	(12, 'Pull vendors from', 'A', 2, 7),
	(13, 'Push purchase orders to', 'A', 1, 8),
	(14, 'Pull purchase orders from', 'A', 2, 8),
	(15, 'Push bills to', 'A', 1, 9),
	(16, 'Pull bills from', 'A', 2, 9),
	(17, 'Push purchase order receipts to', 'A', 1, 10),
	(18, 'Pull purchase order receipts from', 'A', 2, 10),
	(19, 'Push payments to', 'A', 1, 11),
	(20, 'Pull payments from', 'A', 2, 11),
	(21, 'Push deleted records to', 'A', 1, 13),
	(22, 'Pull deleted records from', 'A', 2, 13),
	(23, 'Push expenses to', 'A', 1, 12),
	(24, 'Pull item categories from', 'A', 2, 4),
	(25, 'Push item categories to', 'A', 1, 4),
	(26, 'Push departments to', 'A', 1, 14),
	(27, 'Pull departments from', 'A', 2, 14);
/*!40000 ALTER TABLE `common_integration_service` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.common_integration_service_dependency
DROP TABLE IF EXISTS `common_integration_service_dependency`;
CREATE TABLE IF NOT EXISTS `common_integration_service_dependency` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `service_id` int(11) NOT NULL,
  `dependant_service_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- Dumping data for table papertrl_default_script.common_integration_service_dependency: ~53 rows (approximately)
/*!40000 ALTER TABLE `common_integration_service_dependency` DISABLE KEYS */;
INSERT INTO `common_integration_service_dependency` (`id`, `service_id`, `dependant_service_id`) VALUES
	(1, 5, 1),
	(2, 5, 4),
	(3, 5, 11),
	(4, 6, 2),
	(5, 6, 3),
	(6, 6, 12),
	(24, 13, 5),
	(25, 13, 11),
	(26, 13, 7),
	(27, 14, 6),
	(28, 14, 12),
	(29, 14, 8),
	(30, 17, 13),
	(31, 18, 14),
	(32, 15, 1),
	(33, 15, 11),
	(34, 15, 5),
	(35, 15, 7),
	(36, 15, 13),
	(37, 16, 2),
	(38, 16, 6),
	(39, 16, 8),
	(40, 16, 12),
	(41, 16, 14),
	(42, 19, 11),
	(43, 19, 15),
	(44, 20, 12),
	(45, 20, 16),
	(46, 23, 1),
	(47, 23, 11),
	(48, 23, 5),
	(49, 23, 7),
	(51, 15, 9),
	(52, 16, 10),
	(53, 21, 1),
	(54, 21, 5),
	(55, 21, 7),
	(56, 21, 11),
	(57, 21, 13),
	(58, 21, 15),
	(59, 21, 17),
	(60, 21, 19),
	(61, 21, 23),
	(62, 22, 2),
	(63, 22, 6),
	(64, 22, 8),
	(65, 22, 12),
	(66, 22, 14),
	(67, 22, 16),
	(68, 22, 18),
	(69, 22, 20),
	(70, 5, 25),
	(71, 6, 24);
/*!40000 ALTER TABLE `common_integration_service_dependency` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.common_integration_service_group
DROP TABLE IF EXISTS `common_integration_service_group`;
CREATE TABLE IF NOT EXISTS `common_integration_service_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `visibility` tinyint(1) NOT NULL,
  `sort_order` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- Dumping data for table papertrl_default_script.common_integration_service_group: ~14 rows (approximately)
/*!40000 ALTER TABLE `common_integration_service_group` DISABLE KEYS */;
INSERT INTO `common_integration_service_group` (`id`, `name`, `visibility`, `sort_order`) VALUES
	(1, 'Chart of Accounts', 1, 1),
	(2, 'UOMs', 0, 11),
	(3, 'Items', 1, 8),
	(4, 'Item Categories', 0, 12),
	(5, 'Project Codes', 1, 9),
	(6, 'Terms', 0, 13),
	(7, 'Vendors', 1, 2),
	(8, 'Purchase Orders', 1, 5),
	(9, 'Bills', 1, 3),
	(10, 'Purchase Order Receipts', 1, 6),
	(11, 'Payments', 1, 4),
	(12, 'Expenses', 1, 7),
	(13, 'Deleted Records', 1, 10),
	(14, 'Departments', 0, 14);
/*!40000 ALTER TABLE `common_integration_service_group` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.common_integration_service_status
DROP TABLE IF EXISTS `common_integration_service_status`;
CREATE TABLE IF NOT EXISTS `common_integration_service_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `system_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `syncable` tinyint(1) NOT NULL DEFAULT 0,
  `created_by` varchar(100) NOT NULL,
  `created_on` datetime NOT NULL,
  `update_by` varchar(100) DEFAULT NULL,
  `update_on` datetime DEFAULT NULL,
  `delete_by` varchar(100) DEFAULT NULL,
  `delete_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- Dumping data for table papertrl_default_script.common_integration_service_status: ~0 rows (approximately)
/*!40000 ALTER TABLE `common_integration_service_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_integration_service_status` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.common_integration_system_service
DROP TABLE IF EXISTS `common_integration_system_service`;
CREATE TABLE IF NOT EXISTS `common_integration_system_service` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `system_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK_SERVICE` (`service_id`) USING BTREE,
  CONSTRAINT `FK_SERVICE` FOREIGN KEY (`service_id`) REFERENCES `common_integration_service` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- Dumping data for table papertrl_default_script.common_integration_system_service: ~98 rows (approximately)
/*!40000 ALTER TABLE `common_integration_system_service` DISABLE KEYS */;
INSERT INTO `common_integration_system_service` (`id`, `system_id`, `service_id`) VALUES
	(1, 1, 1),
	(2, 1, 2),
	(3, 1, 3),
	(4, 1, 4),
	(5, 1, 5),
	(6, 1, 6),
	(7, 1, 7),
	(8, 1, 8),
	(9, 1, 9),
	(10, 1, 10),
	(11, 1, 11),
	(12, 1, 12),
	(13, 1, 13),
	(14, 1, 14),
	(15, 1, 15),
	(16, 1, 16),
	(17, 1, 17),
	(18, 1, 18),
	(19, 1, 19),
	(20, 1, 20),
	(21, 1, 21),
	(22, 1, 22),
	(23, 1, 23),
	(24, 1, 24),
	(25, 1, 25),
	(26, 2, 1),
	(27, 2, 2),
	(28, 2, 5),
	(29, 2, 6),
	(30, 2, 7),
	(31, 2, 8),
	(32, 2, 9),
	(33, 2, 10),
	(34, 2, 11),
	(35, 2, 12),
	(36, 2, 13),
	(37, 2, 14),
	(38, 2, 15),
	(39, 2, 16),
	(41, 2, 20),
	(42, 2, 23),
	(43, 2, 24),
	(44, 2, 25),
	(45, 3, 1),
	(46, 3, 2),
	(47, 3, 3),
	(48, 3, 4),
	(49, 3, 5),
	(50, 3, 6),
	(51, 3, 7),
	(52, 3, 8),
	(53, 3, 9),
	(54, 3, 10),
	(55, 3, 11),
	(56, 3, 12),
	(57, 3, 13),
	(58, 3, 14),
	(59, 3, 15),
	(60, 3, 16),
	(61, 3, 17),
	(62, 3, 18),
	(64, 3, 20),
	(65, 3, 21),
	(66, 3, 22),
	(67, 3, 23),
	(68, 3, 24),
	(69, 3, 25),
	(70, 4, 2),
	(71, 4, 3),
	(72, 4, 4),
	(73, 4, 5),
	(74, 4, 6),
	(75, 4, 7),
	(76, 4, 8),
	(77, 4, 9),
	(78, 4, 10),
	(79, 4, 11),
	(80, 4, 12),
	(81, 4, 13),
	(82, 4, 14),
	(83, 4, 15),
	(84, 4, 16),
	(86, 4, 20),
	(87, 4, 21),
	(88, 4, 23),
	(89, 4, 24),
	(90, 4, 25),
	(91, 2, 21),
	(92, 1, 26),
	(93, 1, 27),
	(94, 2, 26),
	(95, 2, 27),
	(96, 3, 26),
	(97, 3, 27),
	(98, 4, 26),
	(99, 4, 27),
	(100, 2, 22),
	(101, 4, 22);
/*!40000 ALTER TABLE `common_integration_system_service` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.common_item_attachment
DROP TABLE IF EXISTS `common_item_attachment`;
CREATE TABLE IF NOT EXISTS `common_item_attachment` (
  `id` int(15) NOT NULL AUTO_INCREMENT,
  `image_data` mediumblob NOT NULL DEFAULT '',
  `file_name` varchar(200) NOT NULL,
  `file_type` varchar(50) NOT NULL,
  `product_mst_id` int(15) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_common_product_attachment_common_product_mst` (`product_mst_id`),
  CONSTRAINT `FK_common_product_attachment_common_product_mst` FOREIGN KEY (`product_mst_id`) REFERENCES `common_item_mst` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table papertrl_default_script.common_item_attachment: ~0 rows (approximately)
/*!40000 ALTER TABLE `common_item_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_item_attachment` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.common_item_category
DROP TABLE IF EXISTS `common_item_category`;
CREATE TABLE IF NOT EXISTS `common_item_category` (
  `id` int(15) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `status` char(1) NOT NULL,
  `created_by` varchar(100) NOT NULL,
  `created_on` datetime NOT NULL,
  `update_by` varchar(100) DEFAULT NULL,
  `update_on` datetime DEFAULT NULL,
  `delete_by` varchar(100) DEFAULT NULL,
  `delete_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

-- Dumping data for table papertrl_default_script.common_item_category: ~0 rows (approximately)
/*!40000 ALTER TABLE `common_item_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_item_category` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.common_item_import_issue
DROP TABLE IF EXISTS `common_item_import_issue`;
CREATE TABLE IF NOT EXISTS `common_item_import_issue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `import_mst_id` int(11) NOT NULL,
  `record` text DEFAULT NULL,
  `description` varchar(256) DEFAULT NULL,
  `line_no` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_common_product_import_issue_common_product_import_mst` (`import_mst_id`),
  CONSTRAINT `FK_common_product_import_issue_common_product_import_mst` FOREIGN KEY (`import_mst_id`) REFERENCES `common_item_import_mst` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table papertrl_default_script.common_item_import_issue: ~0 rows (approximately)
/*!40000 ALTER TABLE `common_item_import_issue` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_item_import_issue` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.common_item_import_mst
DROP TABLE IF EXISTS `common_item_import_mst`;
CREATE TABLE IF NOT EXISTS `common_item_import_mst` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(100) NOT NULL,
  `total_records` int(11) DEFAULT NULL,
  `succeeded` int(11) DEFAULT NULL,
  `failed` int(11) DEFAULT NULL,
  `created_by` varchar(100) NOT NULL,
  `created_on` datetime NOT NULL,
  `update_by` varchar(100) DEFAULT NULL,
  `update_on` datetime DEFAULT NULL,
  `delete_by` varchar(100) DEFAULT NULL,
  `delete_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table papertrl_default_script.common_item_import_mst: ~0 rows (approximately)
/*!40000 ALTER TABLE `common_item_import_mst` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_item_import_mst` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.common_item_mst
DROP TABLE IF EXISTS `common_item_mst`;
CREATE TABLE IF NOT EXISTS `common_item_mst` (
  `id` int(15) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `item_number` varchar(50) NOT NULL,
  `partner_service` tinyint(1) DEFAULT NULL,
  `taxable` tinyint(1) DEFAULT NULL,
  `buying_price` decimal(19,2) DEFAULT NULL,
  `sales_price` decimal(19,2) DEFAULT NULL,
  `status` char(1) NOT NULL,
  `purchase_description` varchar(255) DEFAULT NULL,
  `sales_description` varchar(255) DEFAULT NULL,
  `inventory_asset_account` int(11) DEFAULT NULL,
  `income_account` int(11) DEFAULT NULL,
  `expense_account` int(11) DEFAULT NULL,
  `update_by` varchar(100) DEFAULT '',
  `update_on` datetime DEFAULT NULL,
  `delete_by` varchar(100) DEFAULT NULL,
  `delete_on` datetime DEFAULT NULL,
  `uom_id` int(11) DEFAULT NULL,
  `product_type_id` int(11) NOT NULL,
  `product_category_id` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `sub_level` int(5) DEFAULT NULL,
  `vendor_id` int(11) DEFAULT NULL,
  `created_by` varchar(100) NOT NULL,
  `created_on` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK__common_product_type` (`product_type_id`),
  CONSTRAINT `FK__common_product_type` FOREIGN KEY (`product_type_id`) REFERENCES `common_item_type` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table papertrl_default_script.common_item_mst: ~0 rows (approximately)
/*!40000 ALTER TABLE `common_item_mst` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_item_mst` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.common_item_type
DROP TABLE IF EXISTS `common_item_type`;
CREATE TABLE IF NOT EXISTS `common_item_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `description` varchar(200) NOT NULL,
  `status` char(1) NOT NULL,
  `icon` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Dumping data for table papertrl_default_script.common_item_type: ~4 rows (approximately)
/*!40000 ALTER TABLE `common_item_type` DISABLE KEYS */;
INSERT INTO `common_item_type` (`id`, `name`, `description`, `status`, `icon`) VALUES
	(1, 'Inventory', 'Product you buy and/or sell and that you track quantities of.', 'A', 'fa fa-shopping-basket'),
	(2, 'Non-Inventory', 'Product you buy and/or sell but don\'t need to (or can\'t) track quantities of, for example, nuts and bolts used in an installation.', 'A', 'fa fa-archive'),
	(3, 'Service', 'Service that you provide to customers, for example, landscaping or tax preparation service.', 'A', 'fa fa-taxi'),
	(4, 'Other', 'Use for miscellaneous labor, material, or part charges, such as delivery charges, setup fees, and service charges.', 'A', 'fa fa-ellipsis-h');
/*!40000 ALTER TABLE `common_item_type` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.common_message
DROP TABLE IF EXISTS `common_message`;
CREATE TABLE IF NOT EXISTS `common_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text NOT NULL,
  `from_user_name` varchar(100) NOT NULL,
  `from_name` varchar(200) NOT NULL,
  `to_user_name` varchar(100) NOT NULL,
  `to_name` varchar(200) NOT NULL,
  `date_time` datetime NOT NULL,
  `status` char(1) NOT NULL,
  `device_name` varchar(300) DEFAULT NULL,
  `mac_address` varchar(100) DEFAULT NULL,
  `ip_address` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table papertrl_default_script.common_message: ~0 rows (approximately)
/*!40000 ALTER TABLE `common_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_message` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.common_notification_email_template
DROP TABLE IF EXISTS `common_notification_email_template`;
CREATE TABLE IF NOT EXISTS `common_notification_email_template` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `template_name` varchar(150) NOT NULL,
  `subject` varchar(100) NOT NULL,
  `template_data` text NOT NULL,
  `event_id` int(15) DEFAULT NULL,
  `status` char(1) NOT NULL,
  `created_by` varchar(50) NOT NULL,
  `created_on` date NOT NULL,
  `update_by` varchar(50) DEFAULT NULL,
  `update_on` date DEFAULT NULL,
  `delete_by` varchar(50) DEFAULT NULL,
  `delete_on` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_notification_subscription_event` (`event_id`),
  CONSTRAINT `FK_notification_subscription_event` FOREIGN KEY (`event_id`) REFERENCES `common_notification_subscription_event` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

-- Dumping data for table papertrl_default_script.common_notification_email_template: ~22 rows (approximately)
/*!40000 ALTER TABLE `common_notification_email_template` DISABLE KEYS */;
INSERT INTO `common_notification_email_template` (`id`, `template_name`, `subject`, `template_data`, `event_id`, `status`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES
	(1, 'BILL_SUBMITTED_TO_DIRECT_APPROVER', 'Bill (BILL-NO) has submitted for your approval', '<html>\r\n    <head>\r\n        <meta charset="UTF-8">\r\n        <meta name="viewport" content="width=device-width, initial-scale=1.0">\r\n    </head>\r\n    <body>\r\n        <table style="color: #207580;">\r\n            <tr>\r\n                <td style="font-weight: bold">Dear <span id="EMAIL_SEND_TO">name of assigned approver</span>,</td>\r\n            </tr>\r\n            <tr> <td></td> </tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr style="margin-left: 250px">\r\n                <td><ul></ul><ul></ul>Bill Number <span id="BILL_NUMBER" > Bill Number </span> has been submitted for <span id="VENDOR_NAME" > Vendor Name </span> by <span id="SUBMITTED_BY" > Name of Submitted Person </span> for your approval. </td>\r\n            </tr>\r\n			<tr><td></td></tr>\r\n			<tr><td></td></tr>\r\n			<td>Please log in to <a id="URL" href="">PaperTrl</a> <span id="ACCOUNT_NAME"></span> to Approve or Reject the Bill.</td>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr>\r\n                <td>If you have any comments or questions, please do not hesitate to contact us at <span style="font-weight: bold"><a href="mailto:support@papertrl.com">support@papertrl.com.</a></span></td>\r\n            </tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr style="margin-top: 65px">\r\n                <td>\r\n                    <span style="font-weight: bold"><ul></ul><ul></ul><ul></ul><ul></ul>Thank You!</span>\r\n                </td>\r\n            </tr>\r\n            <tr>\r\n                <td>\r\n                    <img style="width: 170px;height: 45px;" src="https://papertrl.com/wp-content/uploads/2019/09/logo.png"/>\r\n                </td>\r\n            </tr>\r\n            <tr>\r\n                <td>This email is an automated notification, Replies to this message will not be read or responded to. We\'re happy to help you with any questions or concerns you may have. Please contact us directly 24/7 via <span style="font-weight: bold">support@papertrl.com</span>\r\n                    <p class="MsoNormal"><span style="font-size:8.0pt;color:#207580">CONFIDENTIALITY NOTICE: This e-mail transmission, and any attachments, is intended only for the use of PaperTrl Inc. or recipient named above and may contain information that\r\n                            is confidential, privileged and exempt from disclosure under applicable law. If you are not the intended recipient or authorized to receive this message for the recipient, you must not use, copy, disclose or take any action based on this message or any information\r\n                            herein. If you have received this message in error, please advise the sender immediately.</span><span style="font-size:8.0pt;color:#014708"></span></p>\r\n                    <p><span style="font-size:18.0pt;font-family:Webdings;color:green">P</span><span style="color:black">\r\n                        </span><span style="font-size:10.0pt;font-family:&quot;Helvetica&quot;,sans-serif;color:green">Be Environmentally Responsible. Please don\'t print this e-mail unless you really need to.</span><u></u><u></u></p>\r\n                </td>\r\n            </tr>\r\n        </table>\r\n    </body>\r\n</html>', 1, 'A', 'admin', '2021-05-25', NULL, NULL, NULL, NULL),
	(2, 'BILL_APPROVED', 'Bill (BILL-NO) has approved ', '<html>\r\n    <head>\r\n        <meta charset="UTF-8">\r\n        <meta name="viewport" content="width=device-width, initial-scale=1.0">\r\n    </head>\r\n    <body>\r\n        <table style="color: #207580;">\r\n            <tr>\r\n                <td style="font-weight: bold">Dear <span id="EMAIL_SEND_TO">name of uploader</span>,</td>\r\n            </tr>\r\n            <tr> <td></td> </tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr style="margin-left: 250px">\r\n                <td><ul></ul><ul></ul>Bill <span id="BILL_NUMBER" > Bill Number </span> has been approved by <span id="APPROVER_NAME" > Assigned approver </span>. </td>\r\n            </tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr>\r\n                <td>If you have any comments or questions, please do not hesitate to contact us at <span style="font-weight: bold"><a href="mailto:support@papertrl.com">support@papertrl.com.</a></span></td>\r\n            </tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr style="margin-top: 65px">\r\n                <td>\r\n                    <span style="font-weight: bold"><ul></ul><ul></ul><ul></ul><ul></ul>Thank You!</span>\r\n                </td>\r\n            </tr>\r\n            <tr>\r\n                <td>\r\n                    <img style="width: 170px;height: 45px;" src="https://papertrl.com/wp-content/uploads/2019/09/logo.png"/>\r\n                </td>\r\n            </tr>\r\n            <tr>\r\n                <td>This email is an automated notification, Replies to this message will not be read or responded to. We\'re happy to help you with any questions or concerns you may have. Please contact us directly 24/7 via <span style="font-weight: bold">support@papertrl.com</span>\r\n                    <p class="MsoNormal"><span style="font-size:8.0pt;color:#207580">CONFIDENTIALITY NOTICE: This e-mail transmission, and any attachments, is intended only for the use of PaperTrl Inc. or recipient named above and may contain information that\r\n                            is confidential, privileged and exempt from disclosure under applicable law. If you are not the intended recipient or authorized to receive this message for the recipient, you must not use, copy, disclose or take any action based on this message or any information\r\n                            herein. If you have received this message in error, please advise the sender immediately.</span><span style="font-size:8.0pt;color:#014708"></span></p>\r\n                    <p><span style="font-size:18.0pt;font-family:Webdings;color:green">P</span><span style="color:black">\r\n                        </span><span style="font-size:10.0pt;font-family:&quot;Helvetica&quot;,sans-serif;color:green">Be Environmentally Responsible. Please don\'t print this e-mail unless you really need to.</span><u></u><u></u></p>\r\n                </td>\r\n            </tr>\r\n        </table>\r\n    </body>\r\n</html>', 2, 'A', 'admin', '2021-05-25', NULL, NULL, NULL, NULL),
	(3, 'BILL_REJECTED', 'Bill (BILL-NO) has rejected', '<html>\r\n    <head>\r\n        <meta charset="UTF-8">\r\n        <meta name="viewport" content="width=device-width, initial-scale=1.0">\r\n    </head>\r\n    <body>\r\n        <table style="color: #207580;">\r\n            <tr>\r\n                <td style="font-weight: bold">Dear <span id="EMAIL_SEND_TO">name of uploader</span>,</td>\r\n            </tr>\r\n            <tr> <td></td> </tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr style="margin-left: 250px">\r\n                <td><ul></ul><ul></ul>Bill <span id="BILL_NUMBER" > Bill Number </span> has been rejected by <span id="APPROVER_NAME" > Assigned approver </span> due to <span style="color:red" id="REASON"> Reject Reason </span>. </td>\r\n            </tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr>\r\n                <td>If you have any comments or questions, please do not hesitate to contact us at <span style="font-weight: bold"><a href="mailto:support@papertrl.com">support@papertrl.com.</a></span></td>\r\n            </tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr style="margin-top: 65px">\r\n                <td>\r\n                    <span style="font-weight: bold"><ul></ul><ul></ul><ul></ul><ul></ul>Thank You!</span>\r\n                </td>\r\n            </tr>\r\n            <tr>\r\n                <td>\r\n                    <img style="width: 170px;height: 45px;" src="https://papertrl.com/wp-content/uploads/2019/09/logo.png"/>\r\n                </td>\r\n            </tr>\r\n            <tr>\r\n                <td>This email is an automated notification, Replies to this message will not be read or responded to. We\'re happy to help you with any questions or concerns you may have. Please contact us directly 24/7 via <span style="font-weight: bold">support@papertrl.com</span>\r\n                    <p class="MsoNormal"><span style="font-size:8.0pt;color:#207580">CONFIDENTIALITY NOTICE: This e-mail transmission, and any attachments, is intended only for the use of PaperTrl Inc. or recipient named above and may contain information that\r\n                            is confidential, privileged and exempt from disclosure under applicable law. If you are not the intended recipient or authorized to receive this message for the recipient, you must not use, copy, disclose or take any action based on this message or any information\r\n                            herein. If you have received this message in error, please advise the sender immediately.</span><span style="font-size:8.0pt;color:#014708"></span></p>\r\n                    <p><span style="font-size:18.0pt;font-family:Webdings;color:green">P</span><span style="color:black">\r\n                        </span><span style="font-size:10.0pt;font-family:&quot;Helvetica&quot;,sans-serif;color:green">Be Environmentally Responsible. Please don\'t print this e-mail unless you really need to.</span><u></u><u></u></p>\r\n                </td>\r\n            </tr>\r\n        </table>\r\n    </body>\r\n</html>', 3, 'A', 'admin', '2021-05-25', NULL, NULL, NULL, NULL),
	(4, 'EXPENSE_SUBMITTED_TO_DIRECT_APPROVER', 'Expense report (EXPENSE-NAME) has submitted for your approval ', '<html>\r\n    <head>\r\n        <meta charset="UTF-8">\r\n        <meta name="viewport" content="width=device-width, initial-scale=1.0">\r\n    </head>\r\n    <body>\r\n        <table style="color: #207580;">\r\n            <tr>\r\n                <td style="font-weight: bold">Dear <span id="EMAIL_SEND_TO">name of assigned approver</span>,</td>\r\n            </tr>\r\n            <tr> <td></td> </tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr style="margin-left: 250px">\r\n				<td><ul></ul><ul></ul>Expense Report <span id="REPORT_NAME" > Report Name </span> has been submitted by <span id="SUBMITTED_BY" > Name of Submitted Person </span> for your approval. </td>\r\n            </tr>\r\n			<tr><td></td></tr>\r\n			<tr><td></td></tr>\r\n			<td>Please log in to <a id="URL" href="">PaperTrl</a> <span id="ACCOUNT_NAME"></span> to Approve or Reject the expense report.</td>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr>\r\n                <td>If you have any comments or questions, please do not hesitate to contact us at <span style="font-weight: bold"><a href="mailto:support@papertrl.com">support@papertrl.com.</a></span></td>\r\n            </tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr style="margin-top: 65px">\r\n                <td>\r\n                    <span style="font-weight: bold"><ul></ul><ul></ul><ul></ul><ul></ul>Thank You!</span>\r\n                </td>\r\n            </tr>\r\n            <tr>\r\n                <td>\r\n                    <img style="width: 170px;height: 45px;" src="https://papertrl.com/wp-content/uploads/2019/09/logo.png"/>\r\n                </td>\r\n            </tr>\r\n            <tr>\r\n                <td>This email is an automated notification, Replies to this message will not be read or responded to. We\'re happy to help you with any questions or concerns you may have. Please contact us directly 24/7 via <span style="font-weight: bold">support@papertrl.com</span>\r\n                    <p class="MsoNormal"><span style="font-size:8.0pt;color:#207580">CONFIDENTIALITY NOTICE: This e-mail transmission, and any attachments, is intended only for the use of PaperTrl Inc. or recipient named above and may contain information that\r\n                            is confidential, privileged and exempt from disclosure under applicable law. If you are not the intended recipient or authorized to receive this message for the recipient, you must not use, copy, disclose or take any action based on this message or any information\r\n                            herein. If you have received this message in error, please advise the sender immediately.</span><span style="font-size:8.0pt;color:#014708"></span></p>\r\n                    <p><span style="font-size:18.0pt;font-family:Webdings;color:green">P</span><span style="color:black">\r\n                        </span><span style="font-size:10.0pt;font-family:&quot;Helvetica&quot;,sans-serif;color:green">Be Environmentally Responsible. Please don\'t print this e-mail unless you really need to.</span><u></u><u></u></p>\r\n                </td>\r\n            </tr>\r\n        </table>\r\n    </body>\r\n</html>', 7, 'A', 'admin', '2021-05-25', NULL, NULL, NULL, NULL),
	(5, 'EXPENSE_APPROVED', 'Expense Report (EXPENSE-NAME) has approved ', '<html>\r\n    <head>\r\n        <meta charset="UTF-8">\r\n        <meta name="viewport" content="width=device-width, initial-scale=1.0">\r\n    </head>\r\n    <body>\r\n        <table style="color: #207580;">\r\n            <tr>\r\n                <td style="font-weight: bold">Dear <span id="EMAIL_SEND_TO">name of  submitted person</span>,</td>\r\n            </tr>\r\n            <tr> <td></td> </tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr style="margin-left: 250px">\r\n                <td><ul></ul><ul></ul> Your submitted expense report <span id="REPORT_NAME" > Expense Report Name </span>  has been approved by <span id="APPROVER_NAME" > Assigned approver </span>.</td>\r\n            </tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr>\r\n                <td>If you have any comments or questions, please do not hesitate to contact us at <span style="font-weight: bold"><a href="mailto:support@papertrl.com">support@papertrl.com.</a></span></td>\r\n            </tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr style="margin-top: 65px">\r\n                <td>\r\n                    <span style="font-weight: bold"><ul></ul><ul></ul><ul></ul><ul></ul>Thank You!</span>\r\n                </td>\r\n            </tr>\r\n            <tr>\r\n                <td>\r\n                    <img style="width: 170px;height: 45px;" src="https://papertrl.com/wp-content/uploads/2019/09/logo.png"/>\r\n                </td>\r\n            </tr>\r\n            <tr>\r\n                <td>This email is an automated notification, Replies to this message will not be read or responded to. We\'re happy to help you with any questions or concerns you may have. Please contact us directly 24/7 via <span style="font-weight: bold">support@papertrl.com</span>\r\n                    <p class="MsoNormal"><span style="font-size:8.0pt;color:#207580">CONFIDENTIALITY NOTICE: This e-mail transmission, and any attachments, is intended only for the use of PaperTrl Inc. or recipient named above and may contain information that\r\n                            is confidential, privileged and exempt from disclosure under applicable law. If you are not the intended recipient or authorized to receive this message for the recipient, you must not use, copy, disclose or take any action based on this message or any information\r\n                            herein. If you have received this message in error, please advise the sender immediately.</span><span style="font-size:8.0pt;color:#014708"></span></p>\r\n                    <p><span style="font-size:18.0pt;font-family:Webdings;color:green">P</span><span style="color:black">\r\n                        </span><span style="font-size:10.0pt;font-family:&quot;Helvetica&quot;,sans-serif;color:green">Be Environmentally Responsible. Please don\'t print this e-mail unless you really need to.</span><u></u><u></u></p>\r\n                </td>\r\n            </tr>\r\n        </table>\r\n    </body>\r\n</html>', 8, 'A', 'admin', '2021-05-25', NULL, NULL, NULL, NULL),
	(6, 'EXPENSE_REJECTED', 'Expense Report  (EXPENSE-NAME) has rejected', '<html>\r\n    <head>\r\n        <meta charset="UTF-8">\r\n        <meta name="viewport" content="width=device-width, initial-scale=1.0">\r\n    </head>\r\n    <body>\r\n        <table style="color: #207580;">\r\n            <tr>\r\n                <td style="font-weight: bold">Dear <span id="EMAIL_SEND_TO">name of  submitted person</span>,</td>\r\n            </tr>\r\n            <tr> <td></td> </tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr style="margin-left: 250px">\r\n				<td><ul></ul><ul></ul>Expense Report <span id="REPORT_NAME" > Report Name </span> has been rejected by <span id="APPROVER_NAME" > Assigned approver </span> due to <span style="color:red" id="REASON"> Reject Reason </span>. </td>\r\n            </tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr>\r\n                <td>If you have any comments or questions, please do not hesitate to contact us at <span style="font-weight: bold"><a href="mailto:support@papertrl.com">support@papertrl.com.</a></span></td>\r\n            </tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr style="margin-top: 65px">\r\n                <td>\r\n                    <span style="font-weight: bold"><ul></ul><ul></ul><ul></ul><ul></ul>Thank You!</span>\r\n                </td>\r\n            </tr>\r\n            <tr>\r\n                <td>\r\n                    <img style="width: 170px;height: 45px;" src="https://papertrl.com/wp-content/uploads/2019/09/logo.png"/>\r\n                </td>\r\n            </tr>\r\n            <tr>\r\n                <td>This email is an automated notification, Replies to this message will not be read or responded to. We\'re happy to help you with any questions or concerns you may have. Please contact us directly 24/7 via <span style="font-weight: bold">support@papertrl.com</span>\r\n                    <p class="MsoNormal"><span style="font-size:8.0pt;color:#207580">CONFIDENTIALITY NOTICE: This e-mail transmission, and any attachments, is intended only for the use of PaperTrl Inc. or recipient named above and may contain information that\r\n                            is confidential, privileged and exempt from disclosure under applicable law. If you are not the intended recipient or authorized to receive this message for the recipient, you must not use, copy, disclose or take any action based on this message or any information\r\n                            herein. If you have received this message in error, please advise the sender immediately.</span><span style="font-size:8.0pt;color:#014708"></span></p>\r\n                    <p><span style="font-size:18.0pt;font-family:Webdings;color:green">P</span><span style="color:black">\r\n                        </span><span style="font-size:10.0pt;font-family:&quot;Helvetica&quot;,sans-serif;color:green">Be Environmentally Responsible. Please don\'t print this e-mail unless you really need to.</span><u></u><u></u></p>\r\n                </td>\r\n            </tr>\r\n        </table>\r\n    </body>\r\n</html>', 9, 'A', 'admin', '2021-05-25', NULL, NULL, NULL, NULL),
	(7, 'PO_SUBMITTED_TO_DIRECT_APPROVER', 'Purchase order (PO-NO) has  submitted for your approval', '<html>\r\n    <head>\r\n        <meta charset="UTF-8">\r\n        <meta name="viewport" content="width=device-width, initial-scale=1.0">\r\n    </head>\r\n    <body>\r\n        <table style="color: #207580;">\r\n            <tr>\r\n                <td style="font-weight: bold">Dear <span id="EMAIL_SEND_TO">name of assigned approver</span>,</td>\r\n            </tr>\r\n            <tr> <td></td> </tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr style="margin-left: 250px">\r\n                <td><ul></ul><ul></ul>Purchase Order <span id="PO_NUMBER" > Purchase Order Number </span> has been submitted by <span id="SUBMITTED_BY" > Name of Submitted Person </span> for your approval. </td>\r\n            </tr>\r\n			<tr><td></td></tr>\r\n			<tr><td></td></tr>\r\n			<td>Please log in to <a id="URL" href="">PaperTrl</a> <span id="ACCOUNT_NAME"></span> to Approve or Reject the Purchase Order.</td>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr>\r\n                <td>If you have any comments or questions, please do not hesitate to contact us at <span style="font-weight: bold"><a href="mailto:support@papertrl.com">support@papertrl.com.</a></span></td>\r\n            </tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr style="margin-top: 65px">\r\n                <td>\r\n                    <span style="font-weight: bold"><ul></ul><ul></ul><ul></ul><ul></ul>Thank You!</span>\r\n                </td>\r\n            </tr>\r\n            <tr>\r\n                <td>\r\n                    <img style="width: 170px;height: 45px;" src="https://papertrl.com/wp-content/uploads/2019/09/logo.png"/>\r\n                </td>\r\n            </tr>\r\n            <tr>\r\n                <td>This email is an automated notification, Replies to this message will not be read or responded to. We\'re happy to help you with any questions or concerns you may have. Please contact us directly 24/7 via <span style="font-weight: bold">support@papertrl.com</span>\r\n                    <p class="MsoNormal"><span style="font-size:8.0pt;color:#207580">CONFIDENTIALITY NOTICE: This e-mail transmission, and any attachments, is intended only for the use of PaperTrl Inc. or recipient named above and may contain information that\r\n                            is confidential, privileged and exempt from disclosure under applicable law. If you are not the intended recipient or authorized to receive this message for the recipient, you must not use, copy, disclose or take any action based on this message or any information\r\n                            herein. If you have received this message in error, please advise the sender immediately.</span><span style="font-size:8.0pt;color:#014708"></span></p>\r\n                    <p><span style="font-size:18.0pt;font-family:Webdings;color:green">P</span><span style="color:black">\r\n                        </span><span style="font-size:10.0pt;font-family:&quot;Helvetica&quot;,sans-serif;color:green">Be Environmentally Responsible. Please don\'t print this e-mail unless you really need to.</span><u></u><u></u></p>\r\n                </td>\r\n            </tr>\r\n        </table>\r\n    </body>\r\n</html>', 4, 'A', 'admin', '2021-05-25', NULL, NULL, NULL, NULL),
	(8, 'PO_APPROVED', 'Purchase Order (PO-NO) has approved ', '<html>\r\n    <head>\r\n        <meta charset="UTF-8">\r\n        <meta name="viewport" content="width=device-width, initial-scale=1.0">\r\n    </head>\r\n    <body>\r\n        <table style="color: #207580;">\r\n            <tr>\r\n                <td style="font-weight: bold">Dear <span id="EMAIL_SEND_TO">name of submitted person</span>,</td>\r\n            </tr>\r\n            <tr> <td></td> </tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr style="margin-left: 250px">\r\n                <td><ul></ul><ul></ul>Purchase Order <span id="PO_NUMBER" > Purchase Order Number </span> has been approved by <span id="APPROVER_NAME" > Assigned approver</span>. </td>\r\n            </tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr>\r\n                <td>If you have any comments or questions, please do not hesitate to contact us at <span style="font-weight: bold"><a href="mailto:support@papertrl.com">support@papertrl.com.</a></span></td>\r\n            </tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr style="margin-top: 65px">\r\n                <td>\r\n                    <span style="font-weight: bold"><ul></ul><ul></ul><ul></ul><ul></ul>Thank You!</span>\r\n                </td>\r\n            </tr>\r\n            <tr>\r\n                <td>\r\n                    <img style="width: 170px;height: 45px;" src="https://papertrl.com/wp-content/uploads/2019/09/logo.png"/>\r\n                </td>\r\n            </tr>\r\n            <tr>\r\n                <td>This email is an automated notification, Replies to this message will not be read or responded to. We\'re happy to help you with any questions or concerns you may have. Please contact us directly 24/7 via <span style="font-weight: bold">support@papertrl.com</span>\r\n                    <p class="MsoNormal"><span style="font-size:8.0pt;color:#207580">CONFIDENTIALITY NOTICE: This e-mail transmission, and any attachments, is intended only for the use of PaperTrl Inc. or recipient named above and may contain information that\r\n                            is confidential, privileged and exempt from disclosure under applicable law. If you are not the intended recipient or authorized to receive this message for the recipient, you must not use, copy, disclose or take any action based on this message or any information\r\n                            herein. If you have received this message in error, please advise the sender immediately.</span><span style="font-size:8.0pt;color:#014708"></span></p>\r\n                    <p><span style="font-size:18.0pt;font-family:Webdings;color:green">P</span><span style="color:black">\r\n                        </span><span style="font-size:10.0pt;font-family:&quot;Helvetica&quot;,sans-serif;color:green">Be Environmentally Responsible. Please don\'t print this e-mail unless you really need to.</span><u></u><u></u></p>\r\n                </td>\r\n            </tr>\r\n        </table>\r\n    </body>\r\n</html>', 5, 'A', 'admin', '2021-05-25', NULL, NULL, NULL, NULL),
	(9, 'PO_REJECTED', 'Purchase Order (PO-NO) has rejected', '<html>\r\n    <head>\r\n        <meta charset="UTF-8">\r\n        <meta name="viewport" content="width=device-width, initial-scale=1.0">\r\n    </head>\r\n    <body>\r\n        <table style="color: #207580;">\r\n            <tr>\r\n                <td style="font-weight: bold">Dear <span id="EMAIL_SEND_TO">name of submitted person</span>,</td>\r\n            </tr>\r\n            <tr> <td></td> </tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr style="margin-left: 250px">\r\n                <td><ul></ul><ul></ul>Purchase Order <span id="PO_NUMBER" > Purchase Order Number </span> has been rejected by <span id="APPROVER_NAME" > Assigned approver </span> due to <span style="color:red" id="REASON"> Reject Reason</span>. </td>\r\n            </tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr>\r\n                <td>If you have any comments or questions, please do not hesitate to contact us at <span style="font-weight: bold"><a href="mailto:support@papertrl.com">support@papertrl.com.</a></span></td>\r\n            </tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr style="margin-top: 65px">\r\n                <td>\r\n                    <span style="font-weight: bold"><ul></ul><ul></ul><ul></ul><ul></ul>Thank You!</span>\r\n                </td>\r\n            </tr>\r\n            <tr>\r\n                <td>\r\n                    <img style="width: 170px;height: 45px;" src="https://papertrl.com/wp-content/uploads/2019/09/logo.png"/>\r\n                </td>\r\n            </tr>\r\n            <tr>\r\n                <td>This email is an automated notification, Replies to this message will not be read or responded to. We\'re happy to help you with any questions or concerns you may have. Please contact us directly 24/7 via <span style="font-weight: bold">support@papertrl.com</span>\r\n                    <p class="MsoNormal"><span style="font-size:8.0pt;color:#207580">CONFIDENTIALITY NOTICE: This e-mail transmission, and any attachments, is intended only for the use of PaperTrl Inc. or recipient named above and may contain information that\r\n                            is confidential, privileged and exempt from disclosure under applicable law. If you are not the intended recipient or authorized to receive this message for the recipient, you must not use, copy, disclose or take any action based on this message or any information\r\n                            herein. If you have received this message in error, please advise the sender immediately.</span><span style="font-size:8.0pt;color:#014708"></span></p>\r\n                    <p><span style="font-size:18.0pt;font-family:Webdings;color:green">P</span><span style="color:black">\r\n                        </span><span style="font-size:10.0pt;font-family:&quot;Helvetica&quot;,sans-serif;color:green">Be Environmentally Responsible. Please don\'t print this e-mail unless you really need to.</span><u></u><u></u></p>\r\n                </td>\r\n            </tr>\r\n        </table>\r\n    </body>\r\n</html>', 6, 'A', 'admin', '2021-05-25', NULL, NULL, NULL, NULL),
	(10, 'RECEIVED_PAYMENT', 'Payment Recived For (BILL-NO)', '<html>\r\n    <head>\r\n        <meta charset="UTF-8">\r\n        <meta name="viewport" content="width=device-width, initial-scale=1.0">\r\n    </head>\r\n    <body>\r\n        <table style="color: #207580;">\r\n            <tr>\r\n                <td style="font-weight: bold">Dear <span id="EMAIL_SEND_TO">name of Vendor</span>,</td>\r\n            </tr>\r\n            <tr> <td></td> </tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr style="margin-left: 250px">\r\n                <td><ul></ul><ul></ul>You have received <span id="RECEIVED_AMOUNT"> Received Amount</span> for <span id="BILL_NUMBER" > Bill Number</span> from <span id="CUSTOMER_NAME"> Customer Name </span>. </td>\r\n            </tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr>\r\n                <td>If you have any comments or questions, please do not hesitate to contact us at <span style="font-weight: bold"><a href="mailto:support@papertrl.com">support@papertrl.com.</a></span></td>\r\n            </tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr style="margin-top: 65px">\r\n                <td>\r\n                    <span style="font-weight: bold"><ul></ul><ul></ul><ul></ul><ul></ul>Thank You!</span>\r\n                </td>\r\n            </tr>\r\n            <tr>\r\n                <td>\r\n                    <img style="width: 170px;height: 45px;" src="https://papertrl.com/wp-content/uploads/2019/09/logo.png"/>\r\n                </td>\r\n            </tr>\r\n            <tr>\r\n                <td>This email is an automated notification, Replies to this message will not be read or responded to. We\'re happy to help you with any questions or concerns you may have. Please contact us directly 24/7 via <span style="font-weight: bold">support@papertrl.com</span>\r\n                    <p class="MsoNormal"><span style="font-size:8.0pt;color:#207580">CONFIDENTIALITY NOTICE: This e-mail transmission, and any attachments, is intended only for the use of PaperTrl Inc. or recipient named above and may contain information that\r\n                            is confidential, privileged and exempt from disclosure under applicable law. If you are not the intended recipient or authorized to receive this message for the recipient, you must not use, copy, disclose or take any action based on this message or any information\r\n                            herein. If you have received this message in error, please advise the sender immediately.</span><span style="font-size:8.0pt;color:#014708"></span></p>\r\n                    <p><span style="font-size:18.0pt;font-family:Webdings;color:green">P</span><span style="color:black">\r\n                        </span><span style="font-size:10.0pt;font-family:&quot;Helvetica&quot;,sans-serif;color:green">Be Environmentally Responsible. Please don\'t print this e-mail unless you really need to.</span><u></u><u></u></p>\r\n                </td>\r\n            </tr>\r\n        </table>\r\n    </body>\r\n</html>', 10, 'A', 'admin', '2021-05-25', NULL, NULL, NULL, NULL),
	(11, 'BILL_SUBMITTED_TO_APPROVAL_GROUP', 'Bill (BILL-NO) has submitted for your approval', '<html>\r\n    <head>\r\n        <meta charset="UTF-8">\r\n        <meta name="viewport" content="width=device-width, initial-scale=1.0">\r\n    </head>\r\n    <body>\r\n        <table style="color: #207580;">\r\n            <tr>\r\n                <td style="font-weight: bold">Dear <span id="EMAIL_SEND_TO">name of assigned approver</span>,</td>\r\n            </tr>\r\n            <tr> <td></td> </tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr style="margin-left: 250px">\r\n                <td><ul></ul><ul></ul>Invoice Number <span id="BILL_NUMBER" > Invoice Number </span> has been submitted by <span id="VENDOR_NAME" > Vendor Name </span> for the approval of <span id="APPROVAL_GROUP">Project Manager</span> Approval Group. </td>\r\n            </tr>\r\n			<tr><td></td></tr>\r\n			<tr><td></td></tr>\r\n			<td>Please log in to <a id="URL" href="">PaperTrl</a> <span id="ACCOUNT_NAME"></span> to Approve or Reject the invoice.</td>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr>\r\n                <td>If you have any comments or questions, please do not hesitate to contact us at <span style="font-weight: bold"><a href="mailto:support@papertrl.com">support@papertrl.com.</a></span></td>\r\n            </tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr style="margin-top: 65px">\r\n                <td>\r\n                    <span style="font-weight: bold"><ul></ul><ul></ul><ul></ul><ul></ul>Thank You!</span>\r\n                </td>\r\n            </tr>\r\n            <tr>\r\n                <td>\r\n                    <img style="width: 170px;height: 45px;" src="https://papertrl.com/wp-content/uploads/2019/09/logo.png"/>\r\n                </td>\r\n            </tr>\r\n            <tr>\r\n                <td>This email is an automated notification, Replies to this message will not be read or responded to. We\'re happy to help you with any questions or concerns you may have. Please contact us directly 24/7 via <span style="font-weight: bold">support@papertrl.com</span>\r\n                    <p class="MsoNormal"><span style="font-size:8.0pt;color:#207580">CONFIDENTIALITY NOTICE: This e-mail transmission, and any attachments, is intended only for the use of PaperTrl Inc. or recipient named above and may contain information that\r\n                            is confidential, privileged and exempt from disclosure under applicable law. If you are not the intended recipient or authorized to receive this message for the recipient, you must not use, copy, disclose or take any action based on this message or any information\r\n                            herein. If you have received this message in error, please advise the sender immediately.</span><span style="font-size:8.0pt;color:#014708"></span></p>\r\n                    <p><span style="font-size:18.0pt;font-family:Webdings;color:green">P</span><span style="color:black">\r\n                        </span><span style="font-size:10.0pt;font-family:&quot;Helvetica&quot;,sans-serif;color:green">Be Environmentally Responsible. Please don\'t print this e-mail unless you really need to.</span><u></u><u></u></p>\r\n                </td>\r\n            </tr>\r\n        </table>\r\n    </body>\r\n</html>', 13, 'A', 'admin', '2021-05-26', NULL, NULL, NULL, NULL),
	(12, 'BILL_ASSIGNEE_LIST_EMPTY', 'No users found in the approval group to approve', '<html>\r\n    <head>\r\n        <meta charset="UTF-8">\r\n        <meta name="viewport" content="width=device-width, initial-scale=1.0">\r\n    </head>\r\n    <body>\r\n        <table style="color: #207580;">\r\n            <tr>\r\n                <td style="font-weight: bold">Dear <span id="EMAIL_SEND_TO">User\'s Name</span>,</td>\r\n            </tr>\r\n            <tr> <td></td> </tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr style="margin-left: 250px">\r\n                <td><ul></ul><ul></ul>Bill number <span id="BILL_NUMBER">001255</span> has been submitted by <span id="CREATED_BY">created by</span> for the approval of <span id="APPROVAL_GROUP">Project Manager</span> approval group, But there is no user found in this approval group. </td>\r\n            </tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr>\r\n                <td>If you have any comments or questions, please do not hesitate to contact us at <span style="font-weight: bold"><a href="mailto:support@papertrl.com">support@papertrl.com</a></span></td>\r\n            </tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr style="margin-top: 65px">\r\n                <td>\r\n                    <span style="font-weight: bold"><ul></ul><ul></ul><ul></ul><ul></ul>Thank You!</span>\r\n                </td>\r\n            </tr>\r\n            <tr>\r\n                <td>\r\n                    <img style="width: 170px;height: 45px;" src="https://papertrl.com/wp-content/uploads/2019/09/logo.png"/>\r\n                </td>\r\n            </tr>\r\n            <tr>\r\n                <td>This email is an automated notification, Replies to this message will not be read or responded to. We\'re happy to help you with any questions or concerns you may have. Please contact us directly 24/7 via <span style="font-weight: bold">support@papertrl.com</span>\r\n                    <p class="MsoNormal"><span style="font-size:8.0pt;color:#207580">CONFIDENTIALITY NOTICE: This e-mail transmission, and any attachments, is intended only for the use of PaperTrl Inc. or recipient named above and may contain information that\r\n                            is confidential, privileged and exempt from disclosure under applicable law. If you are not the intended recipient or authorized to receive this message for the recipient, you must not use, copy, disclose or take any action based on this message or any information\r\n                            herein. If you have received this message in error, please advise the sender immediately.</span><span style="font-size:8.0pt;color:#014708"></span></p>\r\n                    <p><span style="font-size:18.0pt;font-family:Webdings;color:green">P</span><span style="color:black">\r\n                        </span><span style="font-size:10.0pt;font-family:&quot;Helvetica&quot;,sans-serif;color:green">Be Environmentally Responsible. Please don\'t print this e-mail unless you really need to.</span><u></u><u></u></p>\r\n                </td>\r\n            </tr>\r\n        </table>\r\n    </body>\r\n</html>', 14, 'A', 'admin', '2021-05-26', NULL, NULL, NULL, NULL),
	(13, 'PO_SUBMITTED_TO_APPROVAL_GROUP', 'Purchase Order (PO-NO) has submitted for your approval', '<html>\r\n    <head>\r\n        <meta charset="UTF-8">\r\n        <meta name="viewport" content="width=device-width, initial-scale=1.0">\r\n    </head>\r\n    <body>\r\n        <table style="color: #207580;">\r\n            <tr>\r\n                <td style="font-weight: bold">Dear <span id="EMAIL_SEND_TO">name of assigned approver</span>,</td>\r\n            </tr>\r\n            <tr> <td></td> </tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr style="margin-left: 250px">\r\n                <td><ul></ul><ul></ul>Purchase Order <span id="PO_NUMBER" > Purchase Order Number </span> has been submitted by <span id="SUBMITTED_BY"> Name of Submitted Person </span> for the approval of <span id="APPROVAL_GROUP">Project Manager</span> Approval Group. </td>\r\n            </tr>\r\n			<tr><td></td></tr>\r\n			<tr><td></td></tr>\r\n			<td>Please log in to <a id="URL" href="">PaperTrl</a> <span id="ACCOUNT_NAME"></span> to Approve or Reject the Purchase Order.</td>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr>\r\n                <td>If you have any comments or questions, please do not hesitate to contact us at <span style="font-weight: bold"><a href="mailto:support@papertrl.com">support@papertrl.com.</a></span></td>\r\n            </tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr style="margin-top: 65px">\r\n                <td>\r\n                    <span style="font-weight: bold"><ul></ul><ul></ul><ul></ul><ul></ul>Thank You!</span>\r\n                </td>\r\n            </tr>\r\n            <tr>\r\n                <td>\r\n                    <img style="width: 170px;height: 45px;" src="https://papertrl.com/wp-content/uploads/2019/09/logo.png"/>\r\n                </td>\r\n            </tr>\r\n            <tr>\r\n                <td>This email is an automated notification, Replies to this message will not be read or responded to. We\'re happy to help you with any questions or concerns you may have. Please contact us directly 24/7 via <span style="font-weight: bold">support@papertrl.com</span>\r\n                    <p class="MsoNormal"><span style="font-size:8.0pt;color:#207580">CONFIDENTIALITY NOTICE: This e-mail transmission, and any attachments, is intended only for the use of PaperTrl Inc. or recipient named above and may contain information that\r\n                            is confidential, privileged and exempt from disclosure under applicable law. If you are not the intended recipient or authorized to receive this message for the recipient, you must not use, copy, disclose or take any action based on this message or any information\r\n                            herein. If you have received this message in error, please advise the sender immediately.</span><span style="font-size:8.0pt;color:#014708"></span></p>\r\n                    <p><span style="font-size:18.0pt;font-family:Webdings;color:green">P</span><span style="color:black">\r\n                        </span><span style="font-size:10.0pt;font-family:&quot;Helvetica&quot;,sans-serif;color:green">Be Environmentally Responsible. Please don\'t print this e-mail unless you really need to.</span><u></u><u></u></p>\r\n                </td>\r\n            </tr>\r\n        </table>\r\n    </body>\r\n</html>', 15, 'A', 'admin', '2021-05-28', NULL, NULL, NULL, NULL),
	(14, 'PO_ASSIGNEE_LIST_EMPTY', 'No user found in the approval group to approve', '<html>\r\n    <head>\r\n        <meta charset="UTF-8">\r\n        <meta name="viewport" content="width=device-width, initial-scale=1.0">\r\n    </head>\r\n    <body>\r\n        <table style="color: #207580;">\r\n            <tr>\r\n                <td style="font-weight: bold">Dear <span id="EMAIL_SEND_TO">User\'s Name</span>,</td>\r\n            </tr>\r\n            <tr> <td></td> </tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr style="margin-left: 250px">\r\n                <td><ul></ul><ul></ul>Purchase Order <span id="PO_NUMBER">001255</span> has been submitted by <span id="CREATED_BY">created by</span> for the approval of <span id="APPROVAL_GROUP">Project Manager</span> approval group, But there is no user found in this approval group. </td>\r\n            </tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr>\r\n                <td>If you have any comments or questions, please do not hesitate to contact us at <span style="font-weight: bold"><a href="mailto:support@papertrl.com">support@papertrl.com</a></span></td>\r\n            </tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr style="margin-top: 65px">\r\n                <td>\r\n                    <span style="font-weight: bold"><ul></ul><ul></ul><ul></ul><ul></ul>Thank You!</span>\r\n                </td>\r\n            </tr>\r\n            <tr>\r\n                <td>\r\n                    <img style="width: 170px;height: 45px;" src="https://papertrl.com/wp-content/uploads/2019/09/logo.png"/>\r\n                </td>\r\n            </tr>\r\n            <tr>\r\n                <td>This email is an automated notification, Replies to this message will not be read or responded to. We\'re happy to help you with any questions or concerns you may have. Please contact us directly 24/7 via <span style="font-weight: bold">support@papertrl.com</span>\r\n                    <p class="MsoNormal"><span style="font-size:8.0pt;color:#207580">CONFIDENTIALITY NOTICE: This e-mail transmission, and any attachments, is intended only for the use of PaperTrl Inc. or recipient named above and may contain information that\r\n                            is confidential, privileged and exempt from disclosure under applicable law. If you are not the intended recipient or authorized to receive this message for the recipient, you must not use, copy, disclose or take any action based on this message or any information\r\n                            herein. If you have received this message in error, please advise the sender immediately.</span><span style="font-size:8.0pt;color:#014708"></span></p>\r\n                    <p><span style="font-size:18.0pt;font-family:Webdings;color:green">P</span><span style="color:black">\r\n                        </span><span style="font-size:10.0pt;font-family:&quot;Helvetica&quot;,sans-serif;color:green">Be Environmentally Responsible. Please don\'t print this e-mail unless you really need to.</span><u></u><u></u></p>\r\n                </td>\r\n            </tr>\r\n        </table>\r\n    </body>\r\n</html>', 16, 'A', 'admin', '2021-05-28', NULL, NULL, NULL, NULL),
	(15, 'PO_SUBMITTED_TO_VENDOR_APPROVAL', 'Purchase Order (PO-NO) has submitted for your approval', '<html>\r\n    <head>\r\n        <meta charset="UTF-8">\r\n        <meta name="viewport" content="width=device-width, initial-scale=1.0">\r\n    </head>\r\n    <body>\r\n        <table style="color: #207580;">\r\n            <tr>\r\n                <td style="font-weight: bold">Dear <span id="EMAIL_SEND_TO">name of the vendor</span>,</td>\r\n            </tr>\r\n            <tr> <td></td> </tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr style="margin-left: 250px">\r\n                <td><ul></ul><ul></ul>Purchase Order <span id="PO_NUMBER" > Purchase Order Number </span> has been submitted by <span id="SUBMITTED_BY" > Name of Submitted Person </span> for your approval. </td>\r\n            </tr>\r\n			<tr><td></td></tr>\r\n			<tr><td></td></tr>\r\n			<td>Please log in to <a id="URL" href="">PaperTrl</a> <span id="ACCOUNT_NAME"></span> to Approve or Reject the Purchase Order.</td>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr>\r\n                <td>If you have any comments or questions, please do not hesitate to contact us at <span style="font-weight: bold"><a href="mailto:support@papertrl.com">support@papertrl.com.</a></span></td>\r\n            </tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr style="margin-top: 65px">\r\n                <td>\r\n                    <span style="font-weight: bold"><ul></ul><ul></ul><ul></ul><ul></ul>Thank You!</span>\r\n                </td>\r\n            </tr>\r\n            <tr>\r\n                <td>\r\n                    <img style="width: 170px;height: 45px;" src="https://papertrl.com/wp-content/uploads/2019/09/logo.png"/>\r\n                </td>\r\n            </tr>\r\n            <tr>\r\n                <td>This email is an automated notification, Replies to this message will not be read or responded to. We\'re happy to help you with any questions or concerns you may have. Please contact us directly 24/7 via <span style="font-weight: bold">support@papertrl.com</span>\r\n                    <p class="MsoNormal"><span style="font-size:8.0pt;color:#207580">CONFIDENTIALITY NOTICE: This e-mail transmission, and any attachments, is intended only for the use of PaperTrl Inc. or recipient named above and may contain information that\r\n                            is confidential, privileged and exempt from disclosure under applicable law. If you are not the intended recipient or authorized to receive this message for the recipient, you must not use, copy, disclose or take any action based on this message or any information\r\n                            herein. If you have received this message in error, please advise the sender immediately.</span><span style="font-size:8.0pt;color:#014708"></span></p>\r\n                    <p><span style="font-size:18.0pt;font-family:Webdings;color:green">P</span><span style="color:black">\r\n                        </span><span style="font-size:10.0pt;font-family:&quot;Helvetica&quot;,sans-serif;color:green">Be Environmentally Responsible. Please don\'t print this e-mail unless you really need to.</span><u></u><u></u></p>\r\n                </td>\r\n            </tr>\r\n        </table>\r\n    </body>\r\n</html>', 16, 'A', 'admin', '2021-05-28', NULL, NULL, NULL, NULL),
	(16, 'EXPENSE_SUBMITTED_TO_APPROVAL_GROUP', 'Expense (EXPENSE-NAME) has submitted for your approval', '<html>\r\n    <head>\r\n        <meta charset="UTF-8">\r\n        <meta name="viewport" content="width=device-width, initial-scale=1.0">\r\n    </head>\r\n    <body>\r\n        <table style="color: #207580;">\r\n            <tr>\r\n                <td style="font-weight: bold">Dear <span id="EMAIL_SEND_TO">name of assigned approver</span>,</td>\r\n            </tr>\r\n            <tr> <td></td> </tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr style="margin-left: 250px">\r\n                <td><ul></ul><ul></ul>Expense Report <span id="REPORT_NAME" > Expense Report Name </span> has been submitted by <span id="SUBMITTED_BY" > Name of the submitted person </span> for the approval of <span id="APPROVAL_GROUP">Project Manager</span> Approval Group. </td>\r\n            </tr>\r\n			<tr><td></td></tr>\r\n			<tr><td></td></tr>\r\n			<td>Please log in to <a id="URL" href="">PaperTrl</a> <span id="ACCOUNT_NAME"></span> to Approve or Reject the expense report.</td>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr>\r\n                <td>If you have any comments or questions, please do not hesitate to contact us at <span style="font-weight: bold"><a href="mailto:support@papertrl.com">support@papertrl.com.</a></span></td>\r\n            </tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr style="margin-top: 65px">\r\n                <td>\r\n                    <span style="font-weight: bold"><ul></ul><ul></ul><ul></ul><ul></ul>Thank You!</span>\r\n                </td>\r\n            </tr>\r\n            <tr>\r\n                <td>\r\n                    <img style="width: 170px;height: 45px;" src="https://papertrl.com/wp-content/uploads/2019/09/logo.png"/>\r\n                </td>\r\n            </tr>\r\n            <tr>\r\n                <td>This email is an automated notification, Replies to this message will not be read or responded to. We\'re happy to help you with any questions or concerns you may have. Please contact us directly 24/7 via <span style="font-weight: bold">support@papertrl.com</span>\r\n                    <p class="MsoNormal"><span style="font-size:8.0pt;color:#207580">CONFIDENTIALITY NOTICE: This e-mail transmission, and any attachments, is intended only for the use of PaperTrl Inc. or recipient named above and may contain information that\r\n                            is confidential, privileged and exempt from disclosure under applicable law. If you are not the intended recipient or authorized to receive this message for the recipient, you must not use, copy, disclose or take any action based on this message or any information\r\n                            herein. If you have received this message in error, please advise the sender immediately.</span><span style="font-size:8.0pt;color:#014708"></span></p>\r\n                    <p><span style="font-size:18.0pt;font-family:Webdings;color:green">P</span><span style="color:black">\r\n                        </span><span style="font-size:10.0pt;font-family:&quot;Helvetica&quot;,sans-serif;color:green">Be Environmentally Responsible. Please don\'t print this e-mail unless you really need to.</span><u></u><u></u></p>\r\n                </td>\r\n            </tr>\r\n        </table>\r\n    </body>\r\n</html>', 17, 'A', 'admin', '2021-05-29', NULL, NULL, NULL, NULL),
	(17, 'EXPENSE_ASSIGNEE_LIST_EMPTY', 'No users found in the approval group to approve', '<html>\r\n    <head>\r\n        <meta charset="UTF-8">\r\n        <meta name="viewport" content="width=device-width, initial-scale=1.0">\r\n    </head>\r\n    <body>\r\n        <table style="color: #207580;">\r\n            <tr>\r\n                <td style="font-weight: bold">Dear <span id="EMAIL_SEND_TO">User\'s Name</span>,</td>\r\n            </tr>\r\n            <tr> <td></td> </tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr style="margin-left: 250px">\r\n                <td><ul></ul><ul></ul>Expense report  <span id="REPORT_NAME" > Expense Report Name </span> has been submitted by <span id="CREATED_BY">created by</span> for the approval of <span id="APPROVAL_GROUP">Project Manager</span> approval group, But there is no user found in this approval group. </td>\r\n            </tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr>\r\n                <td>If you have any comments or questions, please do not hesitate to contact us at <span style="font-weight: bold"><a id="URL" href="">support@papertrl.com</a></span></td>\r\n            </tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr style="margin-top: 65px">\r\n                <td>\r\n                    <span style="font-weight: bold"><ul></ul><ul></ul><ul></ul><ul></ul>Thank You!</span>\r\n                </td>\r\n            </tr>\r\n            <tr>\r\n                <td>\r\n                    <img style="width: 170px;height: 45px;" src="https://papertrl.com/wp-content/uploads/2019/09/logo.png"/>\r\n                </td>\r\n            </tr>\r\n            <tr>\r\n                <td>This email is an automated notification, Replies to this message will not be read or responded to. We\'re happy to help you with any questions or concerns you may have. Please contact us directly 24/7 via <span style="font-weight: bold">support@papertrl.com</span>\r\n                    <p class="MsoNormal"><span style="font-size:8.0pt;color:#207580">CONFIDENTIALITY NOTICE: This e-mail transmission, and any attachments, is intended only for the use of PaperTrl Inc. or recipient named above and may contain information that\r\n                            is confidential, privileged and exempt from disclosure under applicable law. If you are not the intended recipient or authorized to receive this message for the recipient, you must not use, copy, disclose or take any action based on this message or any information\r\n                            herein. If you have received this message in error, please advise the sender immediately.</span><span style="font-size:8.0pt;color:#014708"></span></p>\r\n                    <p><span style="font-size:18.0pt;font-family:Webdings;color:green">P</span><span style="color:black">\r\n                        </span><span style="font-size:10.0pt;font-family:&quot;Helvetica&quot;,sans-serif;color:green">Be Environmentally Responsible. Please don\'t print this e-mail unless you really need to.</span><u></u><u></u></p>\r\n                </td>\r\n            </tr>\r\n        </table>\r\n    </body>\r\n</html>', 18, 'A', 'admin', '2021-05-29', NULL, NULL, NULL, NULL),
	(18, 'BULCK_BILL_REJECTED', 'Bill (BILL-NO) has rejected', '<html>     <head>         <meta charset="UTF-8">         <meta name="viewport" content="width=device-width, initial-scale=1.0">     </head>     <body>         <table style="color: #207580;">             <tr>                 <td style="font-weight: bold">Dear <span id="EMAIL_SEND_TO">name of uploader</span>,</td>             </tr>             <tr> <td></td> </tr>             <tr><td></td></tr>             <tr><td></td></tr>             <tr><td></td></tr>             <tr><td></td></tr>             <tr style="margin-left: 250px">                 <td><ul></ul><ul></ul>Bill <span id="BILL_NUMBER" > Bill Number </span> has been rejected by <span id="APPROVER_NAME" > Assigned approver </span>. </td>             </tr>             <tr><td></td></tr>             <tr><td></td></tr>             <tr><td></td></tr>             <tr>                 <td>If you have any comments or questions, please do not hesitate to contact us at <span style="font-weight: bold"><a href="mailto:support@papertrl.com">support@papertrl.com.</a></span></td>             </tr>             <tr><td></td></tr>             <tr><td></td></tr>             <tr><td></td></tr>             <tr><td></td></tr>             <tr><td></td></tr>             <tr><td></td></tr>             <tr style="margin-top: 65px">                 <td>                     <span style="font-weight: bold"><ul></ul><ul></ul><ul></ul><ul></ul>Thank You!</span>                 </td>             </tr>             <tr>                 <td>                     <img style="width: 170px;height: 45px;" src="https://papertrl.com/wp-content/uploads/2019/09/logo.png"/>                 </td>             </tr>             <tr>                 <td>This email is an automated notification, Replies to this message will not be read or responded to. We\'re happy to help you with any questions or concerns you may have. Please contact us directly 24/7 via <span style="font-weight: bold">support@papertrl.com</span>                     <p class="MsoNormal"><span style="font-size:8.0pt;color:#207580">CONFIDENTIALITY NOTICE: This e-mail transmission, and any attachments, is intended only for the use of PaperTrl Inc. or recipient named above and may contain information that                             is confidential, privileged and exempt from disclosure under applicable law. If you are not the intended recipient or authorized to receive this message for the recipient, you must not use, copy, disclose or take any action based on this message or any information                             herein. If you have received this message in error, please advise the sender immediately.</span><span style="font-size:8.0pt;color:#014708"></span></p>                     <p><span style="font-size:18.0pt;font-family:Webdings;color:green">P</span><span style="color:black">                         </span><span style="font-size:10.0pt;font-family:&quot;Helvetica&quot;,sans-serif;color:green">Be Environmentally Responsible. Please don\'t print this e-mail unless you really need to.</span><u></u><u></u></p>                 </td>             </tr>         </table>     </body> </html>', 3, 'A', 'admin', '2021-05-25', NULL, NULL, NULL, NULL),
	(19, 'BULCK_EXPENSE_REJECTED', 'Expense Report  (EXPENSE-NAME) has rejected', '<html>     <head>         <meta charset="UTF-8">         <meta name="viewport" content="width=device-width, initial-scale=1.0">     </head>     <body>         <table style="color: #207580;">             <tr>                 <td style="font-weight: bold">Dear <span id="EMAIL_SEND_TO">name of  submitted person</span>,</td>             </tr>             <tr> <td></td> </tr>             <tr><td></td></tr>             <tr><td></td></tr>             <tr><td></td></tr>             <tr><td></td></tr>             <tr style="margin-left: 250px"> 				<td><ul></ul><ul></ul>Expense Report <span id="REPORT_NAME" > Report Name </span> has been rejected by <span id="APPROVER_NAME" > Assigned approver </span>. </td>             </tr>             <tr><td></td></tr>             <tr><td></td></tr>             <tr><td></td></tr>             <tr>                 <td>If you have any comments or questions, please do not hesitate to contact us at <span style="font-weight: bold"><a href="mailto:support@papertrl.com">support@papertrl.com.</a></span></td>             </tr>             <tr><td></td></tr>             <tr><td></td></tr>             <tr><td></td></tr>             <tr><td></td></tr>             <tr><td></td></tr>             <tr><td></td></tr>             <tr style="margin-top: 65px">                 <td>                     <span style="font-weight: bold"><ul></ul><ul></ul><ul></ul><ul></ul>Thank You!</span>                 </td>             </tr>             <tr>                 <td>                     <img style="width: 170px;height: 45px;" src="https://papertrl.com/wp-content/uploads/2019/09/logo.png"/>                 </td>             </tr>             <tr>                 <td>This email is an automated notification, Replies to this message will not be read or responded to. We\'re happy to help you with any questions or concerns you may have. Please contact us directly 24/7 via <span style="font-weight: bold">support@papertrl.com</span>                     <p class="MsoNormal"><span style="font-size:8.0pt;color:#207580">CONFIDENTIALITY NOTICE: This e-mail transmission, and any attachments, is intended only for the use of PaperTrl Inc. or recipient named above and may contain information that                             is confidential, privileged and exempt from disclosure under applicable law. If you are not the intended recipient or authorized to receive this message for the recipient, you must not use, copy, disclose or take any action based on this message or any information                             herein. If you have received this message in error, please advise the sender immediately.</span><span style="font-size:8.0pt;color:#014708"></span></p>                     <p><span style="font-size:18.0pt;font-family:Webdings;color:green">P</span><span style="color:black">                         </span><span style="font-size:10.0pt;font-family:&quot;Helvetica&quot;,sans-serif;color:green">Be Environmentally Responsible. Please don\'t print this e-mail unless you really need to.</span><u></u><u></u></p>                 </td>             </tr>         </table>     </body> </html>', 9, 'A', 'admin', '2021-05-25', NULL, NULL, NULL, NULL),
	(20, 'BULCK_PO_REJECTED', 'Purchase Order (PO-NO) has rejected', '<html>     <head>         <meta charset="UTF-8">         <meta name="viewport" content="width=device-width, initial-scale=1.0">     </head>     <body>         <table style="color: #207580;">             <tr>                 <td style="font-weight: bold">Dear <span id="EMAIL_SEND_TO">name of submitted person</span>,</td>             </tr>             <tr> <td></td> </tr>             <tr><td></td></tr>             <tr><td></td></tr>             <tr><td></td></tr>             <tr><td></td></tr>             <tr style="margin-left: 250px">                 <td><ul></ul><ul></ul>Purchase Order <span id="PO_NUMBER" > Purchase Order Number </span> has been rejected by <span id="APPROVER_NAME" > Assigned approver </span>. </td>             </tr>             <tr><td></td></tr>             <tr><td></td></tr>             <tr><td></td></tr>             <tr>                 <td>If you have any comments or questions, please do not hesitate to contact us at <span style="font-weight: bold"><a href="mailto:support@papertrl.com">support@papertrl.com.</a></span></td>             </tr>             <tr><td></td></tr>             <tr><td></td></tr>             <tr><td></td></tr>             <tr><td></td></tr>             <tr><td></td></tr>             <tr><td></td></tr>             <tr style="margin-top: 65px">                 <td>                     <span style="font-weight: bold"><ul></ul><ul></ul><ul></ul><ul></ul>Thank You!</span>                 </td>             </tr>             <tr>                 <td>                     <img style="width: 170px;height: 45px;" src="https://papertrl.com/wp-content/uploads/2019/09/logo.png"/>                 </td>             </tr>             <tr>                 <td>This email is an automated notification, Replies to this message will not be read or responded to. We\'re happy to help you with any questions or concerns you may have. Please contact us directly 24/7 via <span style="font-weight: bold">support@papertrl.com</span>                     <p class="MsoNormal"><span style="font-size:8.0pt;color:#207580">CONFIDENTIALITY NOTICE: This e-mail transmission, and any attachments, is intended only for the use of PaperTrl Inc. or recipient named above and may contain information that                             is confidential, privileged and exempt from disclosure under applicable law. If you are not the intended recipient or authorized to receive this message for the recipient, you must not use, copy, disclose or take any action based on this message or any information                             herein. If you have received this message in error, please advise the sender immediately.</span><span style="font-size:8.0pt;color:#014708"></span></p>                     <p><span style="font-size:18.0pt;font-family:Webdings;color:green">P</span><span style="color:black">                         </span><span style="font-size:10.0pt;font-family:&quot;Helvetica&quot;,sans-serif;color:green">Be Environmentally Responsible. Please don\'t print this e-mail unless you really need to.</span><u></u><u></u></p>                 </td>             </tr>         </table>     </body> </html>', 6, 'A', 'admin', '2021-05-25', NULL, NULL, NULL, NULL),
	(21, 'VENDOR_REQUEST_FOR_APPROVAL', 'A vendor request received for your approval', '<html>\r\n    <head>\r\n        <meta charset="UTF-8">\r\n        <meta name="viewport" content="width=device-width, initial-scale=1.0">\r\n    </head>\r\n    <body>\r\n        <table style="color: #207580;">\r\n            <tr>\r\n                <td style="font-weight: bold;">Dear <span id="APPROVER_NAME">Approver Name</span>,</td>\r\n            </tr>\r\n            <tr>\r\n                <td></td>\r\n            </tr>\r\n            <tr>\r\n                <td></td>\r\n            </tr>\r\n            <tr>\r\n                <td></td>\r\n            </tr>\r\n            <tr>\r\n                <td></td>\r\n            </tr>\r\n            <tr>\r\n                <td></td>\r\n            </tr>\r\n            <tr>\r\n                <td></td>\r\n            </tr>\r\n            <tr>\r\n                <td></td>\r\n            </tr>\r\n            <tr>\r\n                <td></td>\r\n            </tr>\r\n            <tr>\r\n                <td><span id="INVITED_BY" style="font-weight: bold;"> Vendor Business Name </span> vendor likes to add you as their customer in PaperTrl.</td>\r\n            </tr>\r\n            <tr>\r\n                <td>To view this request and for further actions please visit <a id="URL" href="">PaperTrl.com</a> <span id="ACCOUNT_NAME"></span> ( <b>Vendor Requests</b> tab under <b>Vendors</b> )</td>\r\n            </tr>\r\n            <tr>\r\n                <td></td>\r\n            </tr>\r\n            <tr>\r\n                <td></td>\r\n            </tr>\r\n            <tr>\r\n                <td></td>\r\n            </tr>\r\n            <tr>\r\n                <td></td>\r\n            </tr>\r\n            <tr>\r\n                <td></td>\r\n            </tr>\r\n            <tr>\r\n                <td>\r\n                    For any further clarifications, please do not hesitate to contact us at <span style="font-weight: bold;"><a href="mailto:support@papertrl.com">support@papertrl.com</a></span>\r\n                </td>\r\n            </tr>\r\n            <tr>\r\n                <td></td>\r\n            </tr>\r\n            <tr>\r\n                <td></td>\r\n            </tr>\r\n            <tr>\r\n                <td></td>\r\n            </tr>\r\n            <tr>\r\n                <td></td>\r\n            </tr>\r\n            <tr>\r\n                <td></td>\r\n            </tr>\r\n            <tr>\r\n                <td></td>\r\n            </tr>\r\n            <tr style="margin-top: 65px;">\r\n                <td>\r\n                    <span style="font-weight: bold;">\r\n                        <ul></ul>\r\n                        <ul></ul>\r\n                        <ul></ul>\r\n                        <ul></ul>\r\n                        Thank You,\r\n                    </span>\r\n                </td>\r\n            </tr>\r\n            <tr>\r\n                <td><img style="width: 170px; height: 45px;" src="https://papertrl.com/wp-content/uploads/2019/09/logo.png" /></td>\r\n            </tr>\r\n            <tr>\r\n                <td>\r\n                    This email is an automated notification, Replies to this message will not be read or responded to. We\'re happy to help you with any questions or concerns you may have. Please contact us directly 24/7 via\r\n                    <span style="font-weight: bold;">support@papertrl.com</span>\r\n                    <p class="MsoNormal">\r\n                        <span style="font-size: 8pt; color: #207580;">\r\n                            CONFIDENTIALITY NOTICE: This e-mail transmission, and any attachments, is intended only for the use of PaperTrl Inc. or recipient named above and may contain information that is confidential, privileged and\r\n                            exempt from disclosure under applicable law. If you are not the intended recipient or authorized to receive this message for the recipient, you must not use, copy, disclose or take any action based on this\r\n                            message or any information herein. If you have received this message in error, please advise the sender immediately.\r\n                        </span>\r\n                        <span style="font-size: 8pt; color: #014708;"></span>\r\n                    </p>\r\n                    <p>\r\n                        <span style="font-size: 18pt; font-family: Webdings; color: green;">P</span><span style="color: black;"> </span>\r\n                        <span style="font-size: 10pt; font-family: \'Helvetica\', sans-serif; color: green;">Be Environmentally Responsible. Please don\'t print this e-mail unless you really need to.</span><u></u><u></u>\r\n                    </p>\r\n                </td>\r\n            </tr>\r\n            <tr>\r\n                <td></td>\r\n            </tr>\r\n            <tr>\r\n                <td></td>\r\n            </tr>\r\n        </table>\r\n    </body>\r\n</html>\r\n', 19, 'A', 'admin', '2021-06-23', NULL, NULL, NULL, NULL),
	(22, 'AUTOMATION_EMAIL_TEMPLATE', 'Automation email', '<html> <head>     <meta charset="UTF-8">     <meta name="viewport" content="width=device-width, initial-scale=1.0"> </head>  <body> 	<table style="color: #207580;"> 	 	<tr>        <td style="font-weight: bold">Dear <span id="EMAIL_ADDRESS">Email address</span>,</td>     </tr> 	<tr style="height:20px"><tr> 	<tr>      <td>  	 <span id="EMAIL_CONTENT" >Email Content here</span> 	 </td>     </tr> 	<tr style="height:10px"><tr> 	<tr>                 <td>If you have any comments or questions, please do not hesitate to contact us at <span style="font-weight: bold"><a href="mailto:support@papertrl.com">support@papertrl.com.</a></span></td>     </tr> 	 	<tr style="line-height: 70px;">                 <td>                     <span style="font-weight: bold">Thank You!</span>                 </td>             </tr>             <tr>                 <td>                     <img style="width: 170px;height: 45px;" src="https://papertrl.com/wp-content/uploads/2019/09/logo.png"/>                 </td>             </tr>             <tr>                 <td>This email is an automated notification, Replies to this message will not be read or responded to. We\'re happy to help you with any questions or concerns you may have. Please contact us directly 24/7 via <span style="font-weight: bold">support@papertrl.com</span>                     <p class="MsoNormal"><span style="font-size:8.0pt;color:#207580">CONFIDENTIALITY NOTICE: This e-mail transmission, and any attachments, is intended only for the use of PaperTrl Inc. or recipient named above and may contain information that                             is confidential, privileged and exempt from disclosure under applicable law. If you are not the intended recipient or authorized to receive this message for the recipient, you must not use, copy, disclose or take any action based on this message or any information                             herein. If you have received this message in error, please advise the sender immediately.</span><span style="font-size:8.0pt;color:#014708"></span></p>                     <p><span style="font-size:18.0pt;font-family:Webdings;color:green">P</span><span style="color:black">                         </span><span style="font-size:10.0pt;font-family:&quot;Helvetica&quot;,sans-serif;color:green">Be Environmentally Responsible. Please don\'t print this e-mail unless you really need to.</span><u></u><u></u></p>                 </td>             </tr> 	 	 	<table>  </body> </html>', NULL, 'A', 'admin', '2021-08-04', NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `common_notification_email_template` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.common_notification_message
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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

-- Dumping data for table papertrl_default_script.common_notification_message: ~16 rows (approximately)
/*!40000 ALTER TABLE `common_notification_message` DISABLE KEYS */;
INSERT INTO `common_notification_message` (`id`, `notification_type_name`, `notification_type_id`, `notification_message`, `clickable`, `event_id`) VALUES
	(1, 'Bill', 1, 'has submitted for your approval', 1, 1),
	(2, 'Bill', 1, 'has approved', 1, 2),
	(3, 'Bill', 1, 'has rejected', 1, 3),
	(4, 'Bill', 1, 'has submitted for your approval group', 1, 13),
	(5, 'Bill', 1, 'no users in an assigned approval group', 0, 14),
	(6, 'Expense', 4, 'has submitted for your approval', 1, 7),
	(7, 'Expense', 4, 'has approved', 1, 8),
	(8, 'Expense', 4, 'has rejected', 1, 9),
	(9, 'Expense', 4, 'has submitted for your approval group', 1, 17),
	(10, 'Expense', 4, 'no users in an assigned approval group', 0, 18),
	(11, 'Purchase order', 2, 'has submitted for your approval', 1, 4),
	(12, 'Purchase order', 2, 'has approved', 1, 5),
	(13, 'Purchase order', 2, 'has rejected', 1, 6),
	(14, 'Purchase order', 2, 'has submitted for your approval group', 1, 15),
	(15, 'Purchase order', 2, 'no users in an assigned approval group', 0, 16),
	(16, 'Vendor request ', 6, 'has requested your approval', 1, 19);
/*!40000 ALTER TABLE `common_notification_message` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.common_notification_mst
DROP TABLE IF EXISTS `common_notification_mst`;
CREATE TABLE IF NOT EXISTS `common_notification_mst` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `description` varchar(100) NOT NULL,
  `reference_no` varchar(50) DEFAULT NULL,
  `reference_id` int(11) DEFAULT NULL,
  `reference_status` char(1) DEFAULT '',
  `clickable` tinyint(4) NOT NULL,
  `to_user` varchar(50) NOT NULL,
  `notification_type_id` int(11) DEFAULT NULL,
  `event_id` int(11) DEFAULT NULL,
  `tenant_id` varchar(50) NOT NULL,
  `status` char(1) NOT NULL,
  `created_by` varchar(50) NOT NULL,
  `created_on` date NOT NULL,
  `update_by` varchar(50) DEFAULT NULL,
  `update_on` date DEFAULT NULL,
  `delete_by` varchar(50) DEFAULT NULL,
  `delete_on` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table papertrl_default_script.common_notification_mst: ~0 rows (approximately)
/*!40000 ALTER TABLE `common_notification_mst` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_notification_mst` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.common_notification_subscription_event
DROP TABLE IF EXISTS `common_notification_subscription_event`;
CREATE TABLE IF NOT EXISTS `common_notification_subscription_event` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event` varchar(150) NOT NULL,
  `enable_notification` tinyint(1) NOT NULL DEFAULT 0,
  `enable_email` tinyint(1) NOT NULL DEFAULT 0,
  `status` char(1) NOT NULL,
  `subscription_type_id` int(15) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_common_notification_subscription_type` (`subscription_type_id`),
  CONSTRAINT `FK_common_notification_subscription_type` FOREIGN KEY (`subscription_type_id`) REFERENCES `common_notification_subscription_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

-- Dumping data for table papertrl_default_script.common_notification_subscription_event: ~19 rows (approximately)
/*!40000 ALTER TABLE `common_notification_subscription_event` DISABLE KEYS */;
INSERT INTO `common_notification_subscription_event` (`id`, `event`, `enable_notification`, `enable_email`, `status`, `subscription_type_id`) VALUES
	(1, 'A bill is submitted for your approval', 1, 1, 'A', 1),
	(2, 'A bill you submitted is approved', 1, 1, 'A', 1),
	(3, 'A bill you submitted is rejected', 1, 1, 'A', 1),
	(4, 'A purchase order is submitted for your approval', 1, 1, 'A', 2),
	(5, 'A purchase order you submitted is approved', 1, 1, 'A', 2),
	(6, 'A purchase order you submitted is rejected', 1, 1, 'A', 2),
	(7, 'An expense report is submitted for your approval', 1, 1, 'A', 4),
	(8, 'An expense report you submitted is approved', 1, 1, 'A', 4),
	(9, 'An expense report you submitted is rejected', 1, 1, 'A', 4),
	(10, 'When you\'ve received a payment', 1, 1, 'A', 5),
	(11, 'When your received payment void', 1, 1, 'A', 5),
	(12, 'When System creates new vendor', 1, 0, 'A', 6),
	(13, 'A bill is submitted for your approval group', 1, 1, 'A', 1),
	(14, 'There are no users in an assigned approval group', 1, 1, 'A', 1),
	(15, 'A purchase order is submitted for your approval group', 1, 1, 'A', 2),
	(16, 'There are no users in an assigned approval group', 1, 1, 'A', 2),
	(17, 'An expense report is submitted for your approval group', 1, 1, 'A', 4),
	(18, 'There are no users in an assigned approval group', 1, 1, 'A', 4),
	(19, 'A vendor request your approval', 1, 1, 'A', 6);
/*!40000 ALTER TABLE `common_notification_subscription_event` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.common_notification_subscription_privilege
DROP TABLE IF EXISTS `common_notification_subscription_privilege`;
CREATE TABLE IF NOT EXISTS `common_notification_subscription_privilege` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subscription_event_id` int(15) NOT NULL,
  `menu_privilege` int(15) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_privilege_common_notification_subscription_event` (`subscription_event_id`),
  KEY `FK_privilege_umm_menu_privilage` (`menu_privilege`),
  CONSTRAINT `FK_privilege_common_notification_subscription_event` FOREIGN KEY (`subscription_event_id`) REFERENCES `common_notification_subscription_event` (`id`),
  CONSTRAINT `FK_privilege_umm_menu_privilage` FOREIGN KEY (`menu_privilege`) REFERENCES `umm_menu_privilage` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;

-- Dumping data for table papertrl_default_script.common_notification_subscription_privilege: ~30 rows (approximately)
/*!40000 ALTER TABLE `common_notification_subscription_privilege` DISABLE KEYS */;
INSERT INTO `common_notification_subscription_privilege` (`id`, `subscription_event_id`, `menu_privilege`) VALUES
	(1, 1, 64),
	(2, 1, 66),
	(3, 1, 119),
	(4, 2, 61),
	(5, 2, 62),
	(6, 3, 61),
	(7, 3, 62),
	(8, 13, 64),
	(9, 13, 66),
	(10, 13, 119),
	(11, 14, 119),
	(12, 4, 88),
	(13, 4, 89),
	(14, 4, 120),
	(15, 5, 84),
	(16, 6, 84),
	(17, 15, 88),
	(18, 15, 89),
	(19, 15, 120),
	(20, 16, 120),
	(21, 7, 105),
	(22, 7, 106),
	(23, 7, 111),
	(24, 8, 102),
	(25, 9, 102),
	(26, 17, 105),
	(27, 17, 106),
	(28, 17, 111),
	(29, 18, 111),
	(30, 19, 58);
/*!40000 ALTER TABLE `common_notification_subscription_privilege` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.common_notification_subscription_type
DROP TABLE IF EXISTS `common_notification_subscription_type`;
CREATE TABLE IF NOT EXISTS `common_notification_subscription_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- Dumping data for table papertrl_default_script.common_notification_subscription_type: ~6 rows (approximately)
/*!40000 ALTER TABLE `common_notification_subscription_type` DISABLE KEYS */;
INSERT INTO `common_notification_subscription_type` (`id`, `name`, `status`) VALUES
	(1, 'Bill', 'A'),
	(2, 'Purchase Order', 'A'),
	(3, 'Purchase Order Receipt', 'A'),
	(4, 'Expense', 'A'),
	(5, 'Payment', 'A'),
	(6, 'Vendor', 'A');
/*!40000 ALTER TABLE `common_notification_subscription_type` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.common_notification_subscription_user_wise
DROP TABLE IF EXISTS `common_notification_subscription_user_wise`;
CREATE TABLE IF NOT EXISTS `common_notification_subscription_user_wise` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event_id` int(11) NOT NULL,
  `user_id` varchar(50) NOT NULL,
  `enable_notification` tinyint(4) NOT NULL DEFAULT 0,
  `enable_email` tinyint(4) NOT NULL DEFAULT 0,
  `created_by` varchar(100) NOT NULL,
  `created_on` date NOT NULL,
  `update_by` varchar(100) DEFAULT NULL,
  `update_on` date DEFAULT NULL,
  `delete_by` varchar(100) DEFAULT NULL,
  `delete_on` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table papertrl_default_script.common_notification_subscription_user_wise: ~0 rows (approximately)
/*!40000 ALTER TABLE `common_notification_subscription_user_wise` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_notification_subscription_user_wise` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.common_object_sync_date_time
DROP TABLE IF EXISTS `common_object_sync_date_time`;
CREATE TABLE IF NOT EXISTS `common_object_sync_date_time` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `object_type` varchar(50) NOT NULL,
  `system_id` int(11) NOT NULL,
  `sync_date_time` datetime NOT NULL,
  `tp_integration_mst_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- Dumping data for table papertrl_default_script.common_object_sync_date_time: ~0 rows (approximately)
/*!40000 ALTER TABLE `common_object_sync_date_time` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_object_sync_date_time` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.common_object_sync_mst
DROP TABLE IF EXISTS `common_object_sync_mst`;
CREATE TABLE IF NOT EXISTS `common_object_sync_mst` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `object_mst_id` int(11) NOT NULL,
  `object_type` varchar(50) NOT NULL,
  `system_id` int(11) NOT NULL,
  `system_name` varchar(50) NOT NULL,
  `recode_status` char(1) NOT NULL,
  `sync_date_time` datetime DEFAULT NULL,
  `sync_status` char(1) NOT NULL,
  `attempts` int(2) DEFAULT 0,
  `created_by` varchar(100) NOT NULL,
  `created_on` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table papertrl_default_script.common_object_sync_mst: ~0 rows (approximately)
/*!40000 ALTER TABLE `common_object_sync_mst` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_object_sync_mst` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.common_payment_type
DROP TABLE IF EXISTS `common_payment_type`;
CREATE TABLE IF NOT EXISTS `common_payment_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` char(1) NOT NULL,
  `Description` varchar(100) NOT NULL,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

-- Dumping data for table papertrl_default_script.common_payment_type: ~8 rows (approximately)
/*!40000 ALTER TABLE `common_payment_type` DISABLE KEYS */;
INSERT INTO `common_payment_type` (`id`, `type`, `Description`, `status`) VALUES
	(1, 'S', 'Cash', 'A'),
	(2, 'C', 'Check', 'A'),
	(3, 'D', 'Credit Card', 'A'),
	(4, 'A', 'ACH', 'A'),
	(5, 'E', 'EFT', 'A'),
	(6, 'W', 'Wire', 'A'),
	(7, 'M', 'Credit Memo', 'A'),
	(8, 'O', 'Other', 'A');
/*!40000 ALTER TABLE `common_payment_type` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.common_recurring_custom_interval
DROP TABLE IF EXISTS `common_recurring_custom_interval`;
CREATE TABLE IF NOT EXISTS `common_recurring_custom_interval` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `custom_interval_name` varchar(50) NOT NULL,
  `custom_interval_value` varchar(50) NOT NULL,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Dumping data for table papertrl_default_script.common_recurring_custom_interval: ~4 rows (approximately)
/*!40000 ALTER TABLE `common_recurring_custom_interval` DISABLE KEYS */;
INSERT INTO `common_recurring_custom_interval` (`id`, `custom_interval_name`, `custom_interval_value`, `status`) VALUES
	(1, 'Day(s)', 'DAYS', 'A'),
	(2, 'Week(s)', 'WEEKS', 'A'),
	(3, 'Month(s)', 'MONTHS', 'A'),
	(4, 'Years(s)', 'YEARS', 'A');
/*!40000 ALTER TABLE `common_recurring_custom_interval` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.common_recurring_day
DROP TABLE IF EXISTS `common_recurring_day`;
CREATE TABLE IF NOT EXISTS `common_recurring_day` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `day_name` varchar(50) NOT NULL,
  `day_value` varchar(50) NOT NULL,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;

-- Dumping data for table papertrl_default_script.common_recurring_day: ~28 rows (approximately)
/*!40000 ALTER TABLE `common_recurring_day` DISABLE KEYS */;
INSERT INTO `common_recurring_day` (`id`, `day_name`, `day_value`, `status`) VALUES
	(1, '1st', '1', 'A'),
	(2, '2nd', '2', 'A'),
	(3, '3rd', '3', 'A'),
	(4, '4th', '4', 'A'),
	(5, '5th', '5', 'A'),
	(6, '6th', '6', 'A'),
	(7, '7th', '7', 'A'),
	(8, '8th', '8', 'A'),
	(9, '9th', '9', 'A'),
	(10, '10th', '10', 'A'),
	(11, '11th', '11', 'A'),
	(12, '12th', '12', 'A'),
	(13, '13th', '13', 'A'),
	(14, '14th', '14', 'A'),
	(15, '15th', '15', 'A'),
	(16, '16th', '16', 'A'),
	(17, '17th', '17', 'A'),
	(18, '18th', '18', 'A'),
	(19, '19th', '19', 'A'),
	(20, '20th', '20', 'A'),
	(21, '21st', '21', 'A'),
	(22, '22nd', '22', 'A'),
	(23, '23rd', '23', 'A'),
	(24, '24th', '24', 'A'),
	(25, '25th', '25', 'A'),
	(26, '26th', '26', 'A'),
	(27, '27th', '27', 'A'),
	(28, '28th', '28', 'A');
/*!40000 ALTER TABLE `common_recurring_day` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.common_recurring_day_of_week
DROP TABLE IF EXISTS `common_recurring_day_of_week`;
CREATE TABLE IF NOT EXISTS `common_recurring_day_of_week` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `day_of_week_name` varchar(50) NOT NULL,
  `day_of_week_value` varchar(50) NOT NULL,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- Dumping data for table papertrl_default_script.common_recurring_day_of_week: ~7 rows (approximately)
/*!40000 ALTER TABLE `common_recurring_day_of_week` DISABLE KEYS */;
INSERT INTO `common_recurring_day_of_week` (`id`, `day_of_week_name`, `day_of_week_value`, `status`) VALUES
	(1, 'Monday', 'MON', 'A'),
	(2, 'Tuesday', 'TUE', 'A'),
	(3, 'Wednesday', 'WED', 'A'),
	(4, 'Thursday', 'THU', 'A'),
	(5, 'Friday', 'FRI', 'A'),
	(6, 'Saturday', 'SAT', 'A'),
	(7, 'Sunday', 'SUN', 'A');
/*!40000 ALTER TABLE `common_recurring_day_of_week` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.common_recurring_generation_frequent
DROP TABLE IF EXISTS `common_recurring_generation_frequent`;
CREATE TABLE IF NOT EXISTS `common_recurring_generation_frequent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `generation_frequent` varchar(50) NOT NULL,
  `generation_frequent_value` varchar(50) NOT NULL,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- Dumping data for table papertrl_default_script.common_recurring_generation_frequent: ~6 rows (approximately)
/*!40000 ALTER TABLE `common_recurring_generation_frequent` DISABLE KEYS */;
INSERT INTO `common_recurring_generation_frequent` (`id`, `generation_frequent`, `generation_frequent_value`, `status`) VALUES
	(1, 'Day', 'DAY', 'A'),
	(2, 'First', 'FIRST', 'A'),
	(3, 'Second', 'SECOND', 'A'),
	(4, 'Third', 'THIRD', 'A'),
	(5, 'Fourth', 'FOURTH', 'A'),
	(6, 'Last', 'LAST', 'A');
/*!40000 ALTER TABLE `common_recurring_generation_frequent` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.common_recurring_interval
DROP TABLE IF EXISTS `common_recurring_interval`;
CREATE TABLE IF NOT EXISTS `common_recurring_interval` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `interval_name` varchar(50) NOT NULL,
  `interval_value` varchar(50) NOT NULL,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- Dumping data for table papertrl_default_script.common_recurring_interval: ~5 rows (approximately)
/*!40000 ALTER TABLE `common_recurring_interval` DISABLE KEYS */;
INSERT INTO `common_recurring_interval` (`id`, `interval_name`, `interval_value`, `status`) VALUES
	(1, 'Daily', 'DAILY', 'A'),
	(2, 'Weekly', 'WEEKLY', 'A'),
	(3, 'Monthly', 'MONTHLY', 'A'),
	(4, 'Yearly', 'YEARLY', 'A'),
	(5, 'Custom', 'CUSTOM', 'A');
/*!40000 ALTER TABLE `common_recurring_interval` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.common_recurring_month
DROP TABLE IF EXISTS `common_recurring_month`;
CREATE TABLE IF NOT EXISTS `common_recurring_month` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `month_name` varchar(50) NOT NULL,
  `month_value` varchar(50) NOT NULL,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

-- Dumping data for table papertrl_default_script.common_recurring_month: ~12 rows (approximately)
/*!40000 ALTER TABLE `common_recurring_month` DISABLE KEYS */;
INSERT INTO `common_recurring_month` (`id`, `month_name`, `month_value`, `status`) VALUES
	(1, 'January ', 'JAN ', 'A'),
	(2, 'February', 'FEB', 'A'),
	(3, 'March', 'MAR', 'A'),
	(4, 'April', 'APR', 'A'),
	(5, 'May', 'MAY', 'A'),
	(6, 'June', 'JUN', 'A'),
	(7, 'July', 'JUL', 'A'),
	(8, 'August', 'AUG', 'A'),
	(9, 'September', 'SEP', 'A'),
	(10, 'October', 'OCT', 'A'),
	(11, 'November', 'NOV', 'A'),
	(12, 'December', 'DEC', 'A');
/*!40000 ALTER TABLE `common_recurring_month` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.common_recurring_occurrence_frequent
DROP TABLE IF EXISTS `common_recurring_occurrence_frequent`;
CREATE TABLE IF NOT EXISTS `common_recurring_occurrence_frequent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `occurrence_frequent` varchar(50) NOT NULL,
  `occurrence_frequent_value` varchar(50) NOT NULL,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Dumping data for table papertrl_default_script.common_recurring_occurrence_frequent: ~2 rows (approximately)
/*!40000 ALTER TABLE `common_recurring_occurrence_frequent` DISABLE KEYS */;
INSERT INTO `common_recurring_occurrence_frequent` (`id`, `occurrence_frequent`, `occurrence_frequent_value`, `status`) VALUES
	(1, 'Specific Date', 'SPEC_DATE', 'A'),
	(2, 'No. of occurences', 'NO_OF_OCC', 'A');
/*!40000 ALTER TABLE `common_recurring_occurrence_frequent` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.common_report_category
DROP TABLE IF EXISTS `common_report_category`;
CREATE TABLE IF NOT EXISTS `common_report_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(50) NOT NULL,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Dumping data for table papertrl_default_script.common_report_category: ~0 rows (approximately)
/*!40000 ALTER TABLE `common_report_category` DISABLE KEYS */;
INSERT INTO `common_report_category` (`id`, `category_name`, `status`) VALUES
	(1, 'AP Reports', 'A');
/*!40000 ALTER TABLE `common_report_category` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.common_report_filter
DROP TABLE IF EXISTS `common_report_filter`;
CREATE TABLE IF NOT EXISTS `common_report_filter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `report_type` int(11) NOT NULL,
  `filter_field` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK__common_report_type` (`report_type`),
  KEY `FK_common_report_filter_common_report_filter_field` (`filter_field`),
  CONSTRAINT `FK__common_report_type` FOREIGN KEY (`report_type`) REFERENCES `common_report_type` (`id`),
  CONSTRAINT `FK_common_report_filter_common_report_filter_field` FOREIGN KEY (`filter_field`) REFERENCES `common_report_filter_field` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=latin1;

-- Dumping data for table papertrl_default_script.common_report_filter: ~34 rows (approximately)
/*!40000 ALTER TABLE `common_report_filter` DISABLE KEYS */;
INSERT INTO `common_report_filter` (`id`, `report_type`, `filter_field`) VALUES
	(1, 1, 1),
	(2, 1, 2),
	(3, 1, 11),
	(4, 2, 2),
	(5, 2, 3),
	(6, 2, 5),
	(7, 2, 6),
	(8, 2, 7),
	(9, 2, 4),
	(10, 2, 8),
	(11, 3, 1),
	(12, 4, 2),
	(13, 4, 9),
	(14, 4, 10),
	(15, 5, 2),
	(16, 6, 2),
	(17, 6, 1),
	(18, 7, 2),
	(19, 7, 12),
	(20, 7, 1),
	(21, 7, 13),
	(22, 7, 14),
	(23, 8, 2),
	(24, 8, 12),
	(25, 8, 1),
	(26, 8, 13),
	(27, 8, 14),
	(28, 9, 15),
	(29, 10, 12),
	(30, 10, 16),
	(31, 10, 1),
	(32, 11, 12),
	(33, 11, 16),
	(34, 11, 1);
/*!40000 ALTER TABLE `common_report_filter` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.common_report_filter_field
DROP TABLE IF EXISTS `common_report_filter_field`;
CREATE TABLE IF NOT EXISTS `common_report_filter_field` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field_name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

-- Dumping data for table papertrl_default_script.common_report_filter_field: ~16 rows (approximately)
/*!40000 ALTER TABLE `common_report_filter_field` DISABLE KEYS */;
INSERT INTO `common_report_filter_field` (`id`, `field_name`) VALUES
	(1, 'APPROVER'),
	(2, 'VENDOR'),
	(3, 'VENDOR_EMAIL'),
	(4, 'VENDOR_CODE'),
	(5, 'COUNTRY'),
	(6, 'STATE'),
	(7, 'CITY'),
	(8, 'CONTACT_NO'),
	(9, 'BILL_DATE'),
	(10, 'DUE_DATE'),
	(11, 'DATE_AGING'),
	(12, 'CREATED_DATE'),
	(13, 'REQUESTOR'),
	(14, 'DEPARTMENT'),
	(15, 'CUSTOM_FIELD'),
	(16, 'ACCOUNT');
/*!40000 ALTER TABLE `common_report_filter_field` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.common_report_type
DROP TABLE IF EXISTS `common_report_type`;
CREATE TABLE IF NOT EXISTS `common_report_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `short_name` varchar(50) DEFAULT NULL,
  `status` char(1) NOT NULL,
  `report_category_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_common_report_type_common_report_category` (`report_category_id`),
  CONSTRAINT `FK_common_report_type_common_report_category` FOREIGN KEY (`report_category_id`) REFERENCES `common_report_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

-- Dumping data for table papertrl_default_script.common_report_type: ~11 rows (approximately)
/*!40000 ALTER TABLE `common_report_type` DISABLE KEYS */;
INSERT INTO `common_report_type` (`id`, `name`, `short_name`, `status`, `report_category_id`) VALUES
	(1, 'Cash Requirement Report', NULL, 'A', 1),
	(2, 'Vendor Detail Report', NULL, 'A', 1),
	(3, 'User Overview Report', NULL, 'A', 1),
	(4, 'AP Detail Report', NULL, 'A', 1),
	(5, 'AP Aging Summary Report - Vendor wise', NULL, 'A', 1),
	(6, 'AP Aging Summary Report - User wise', NULL, 'A', 1),
	(7, 'Purchase Orders By Department Report', NULL, 'A', 1),
	(8, 'Purchase Order Outstanding Report', NULL, 'A', 1),
	(9, 'Expenses by Custom Field', NULL, 'A', 1),
	(10, 'Expenses by Acccount Summary', NULL, 'A', 1),
	(11, 'Expenses by Account Detail', NULL, 'A', 1);
/*!40000 ALTER TABLE `common_report_type` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.common_separator
DROP TABLE IF EXISTS `common_separator`;
CREATE TABLE IF NOT EXISTS `common_separator` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `separator` varchar(10) DEFAULT NULL,
  `status` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- Dumping data for table papertrl_default_script.common_separator: ~5 rows (approximately)
/*!40000 ALTER TABLE `common_separator` DISABLE KEYS */;
INSERT INTO `common_separator` (`id`, `separator`, `status`) VALUES
	(1, '|', 'A'),
	(2, '#', 'A'),
	(3, '-', 'A'),
	(4, '/', 'A'),
	(5, '\\', 'A');
/*!40000 ALTER TABLE `common_separator` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.common_state_mst
DROP TABLE IF EXISTS `common_state_mst`;
CREATE TABLE IF NOT EXISTS `common_state_mst` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `short_code` varchar(50) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- Dumping data for table papertrl_default_script.common_state_mst: ~60 rows (approximately)
/*!40000 ALTER TABLE `common_state_mst` DISABLE KEYS */;
INSERT INTO `common_state_mst` (`id`, `name`, `short_code`) VALUES
	(1, 'Albama', 'AL'),
	(2, 'Alaska', 'AK'),
	(3, 'Arizona', 'AZ'),
	(4, 'Arkansas', 'AR'),
	(5, 'California', 'CA'),
	(6, 'Colorado', 'CO'),
	(7, 'Conneticut', 'CT'),
	(8, 'Deleware', 'DE'),
	(9, 'District of Columbia', 'DC'),
	(10, 'Florida', 'FL'),
	(11, 'Georgia', 'GA'),
	(12, 'Hawaii', 'HI'),
	(13, 'Idaho', 'ID'),
	(14, 'Illinois', 'IL'),
	(15, 'Indiana', 'IN'),
	(16, 'Iowa', 'IA'),
	(17, 'Kansas', 'KS'),
	(18, 'Kentucky', 'KY'),
	(19, 'Lousiana', 'LA'),
	(20, 'Maine', 'ME'),
	(21, 'Maryland', 'MD'),
	(22, 'Massachusetts', 'MA'),
	(23, 'Michigan', 'MI'),
	(24, 'Minnesota', 'MN'),
	(25, 'Mississippo', 'MS'),
	(26, 'Missouri', 'MO'),
	(27, 'Montana', 'MT'),
	(28, 'Nebraska', 'NE'),
	(29, 'Nevada', 'NV'),
	(30, 'New Hampshire', 'NH'),
	(31, 'New Jersey', 'NJ'),
	(32, 'New Mexico', 'NM'),
	(33, 'New York', 'NY'),
	(34, 'North California', 'NC'),
	(35, 'North Dakota', 'ND'),
	(36, 'Ohio', 'OH'),
	(37, 'Oklahoma', 'OK'),
	(38, 'Oregon', 'OR'),
	(39, 'Pennsylvania', 'PA'),
	(40, 'Rhode Island', 'RI'),
	(41, 'South California', 'SC'),
	(42, 'South Dakota', 'SD'),
	(43, 'Tennessee', 'TN'),
	(44, 'Texas ', 'TX'),
	(45, 'Utah', 'UT'),
	(46, 'Vermont', 'VT'),
	(47, 'Virginia', 'VA'),
	(48, 'Washington', 'WA'),
	(49, 'West Virginia', 'WV'),
	(50, 'Wisconsin', 'WI'),
	(51, 'Wyoming', 'WY'),
	(52, 'American Samoa', 'AS'),
	(53, 'Guam', 'GU'),
	(54, 'Northern Mariana Islands', 'MP'),
	(55, 'Puerto Rico', 'PR'),
	(56, 'United States Minor Outlying Islands', 'UM'),
	(57, 'Virgin Islands', 'VI'),
	(58, 'Armed Forces Americas', 'AA'),
	(59, 'Armed Forces Pacific', 'AP'),
	(60, 'Armed Forces Others', 'AE');
/*!40000 ALTER TABLE `common_state_mst` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.common_system_endpoint
DROP TABLE IF EXISTS `common_system_endpoint`;
CREATE TABLE IF NOT EXISTS `common_system_endpoint` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `url_index` (`url`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=278 DEFAULT CHARSET=latin1;

-- Dumping data for table papertrl_default_script.common_system_endpoint: ~277 rows (approximately)
/*!40000 ALTER TABLE `common_system_endpoint` DISABLE KEYS */;
INSERT INTO `common_system_endpoint` (`id`, `url`) VALUES
	(240, '/approval_level_management/sec_activate_approval_group_bulk_v2'),
	(182, '/approval_level_management/sec_check_approval_level_availability'),
	(183, '/approval_level_management/sec_create_approval_level'),
	(202, '/approval_level_management/sec_delete_approval_group_bulk_v2'),
	(239, '/approval_level_management/sec_inactivate_approval_group_bulk_v2'),
	(238, '/approval_level_management/sec_inactivate_approval_group_v2'),
	(168, '/approval_level_management/sec_search_approval_group_v2'),
	(237, '/approval_level_management/sec_update_approval_level'),
	(236, '/approval_level_management/sec_view_approval_level'),
	(32, '/common_service/load_data_grid'),
	(33, '/common_service/save_data_grid_state'),
	(144, '/common_service/sec_account_payable_details_report_v2'),
	(211, '/common_service/sec_activate_project_code_bulk_v2'),
	(110, '/common_service/sec_automation_search_grid_v2'),
	(147, '/common_service/sec_cash_requirement_detail_report_v2'),
	(257, '/common_service/sec_check_automation_name_availability_v2'),
	(90, '/common_service/sec_check_code_available'),
	(96, '/common_service/sec_check_item_no_availability'),
	(220, '/common_service/sec_create_additional_field_v2'),
	(91, '/common_service/sec_create_approval_code_v2'),
	(258, '/common_service/sec_create_automation_v2'),
	(97, '/common_service/sec_create_item'),
	(201, '/common_service/sec_create_uom'),
	(222, '/common_service/sec_delete_item'),
	(208, '/common_service/sec_delete_project_code_bulk_v2'),
	(209, '/common_service/sec_delete_project_code_v2'),
	(145, '/common_service/sec_export_account_payable_details_report_v2'),
	(219, '/common_service/sec_field_name_availability_v2'),
	(41, '/common_service/sec_field_types'),
	(218, '/common_service/sec_field_validations'),
	(157, '/common_service/sec_get_action_list_v2'),
	(249, '/common_service/sec_get_additional_field'),
	(93, '/common_service/sec_get_additional_fields_v2'),
	(111, '/common_service/sec_get_all_document_types_v2'),
	(16, '/common_service/sec_get_approval_codes'),
	(152, '/common_service/sec_get_approval_user_summary_report_v2'),
	(241, '/common_service/sec_get_automation_field_spec_v2'),
	(136, '/common_service/sec_get_automation_list_by_document_type'),
	(199, '/common_service/sec_get_category_availability'),
	(64, '/common_service/sec_get_category_dropdown_list'),
	(242, '/common_service/sec_get_condition_list_field_v2'),
	(149, '/common_service/sec_get_data_source_list_v2'),
	(42, '/common_service/sec_get_detailed_approval_codes_by_category'),
	(150, '/common_service/sec_get_events_document_type_v2'),
	(112, '/common_service/sec_get_event_list_v2'),
	(151, '/common_service/sec_get_field_list_by_document_v2'),
	(77, '/common_service/sec_get_item_dropdown_list_v2'),
	(98, '/common_service/sec_get_item_name_by_id'),
	(65, '/common_service/sec_get_item_type_dropdown_list'),
	(9, '/common_service/sec_get_outstanding_task_list'),
	(95, '/common_service/sec_get_parent_item_dropdown_list_create'),
	(89, '/common_service/sec_get_parent_list_by_category'),
	(243, '/common_service/sec_get_second_value_entry_availability'),
	(216, '/common_service/sec_get_section_name_list'),
	(217, '/common_service/sec_get_sorted_additional_fields_v2'),
	(40, '/common_service/sec_get_system_module_name_list'),
	(126, '/common_service/sec_get_system_task_list'),
	(200, '/common_service/sec_get_uom_availability'),
	(66, '/common_service/sec_get_uom_dropdown_list'),
	(205, '/common_service/sec_inactivate_item_bulk_v2'),
	(210, '/common_service/sec_inactivate_project_code_bulk_v2'),
	(212, '/common_service/sec_inactivate_project_code_v2'),
	(148, '/common_service/sec_search_additional_fields_v2'),
	(67, '/common_service/sec_search_item_v2'),
	(92, '/common_service/sec_search_project_code_v2'),
	(146, '/common_service/sec_vendor_details_report_v2'),
	(244, '/common_service/sec_view_access_levels_except'),
	(6, '/common_service/sec_view_approval_statuses'),
	(141, '/common_service/sec_view_cities'),
	(68, '/common_service/sec_view_city_names'),
	(207, '/common_service/sec_view_code_level'),
	(49, '/common_service/sec_view_countries'),
	(13, '/common_service/sec_view_dateformats'),
	(56, '/common_service/sec_view_dateformats_v2'),
	(228, '/common_service/sec_view_item'),
	(14, '/common_service/sec_view_payment_statuses'),
	(48, '/common_service/sec_view_payment_types'),
	(143, '/common_service/sec_view_report_filters'),
	(142, '/common_service/sec_view_report_types'),
	(69, '/common_service/sec_view_state_names'),
	(27, '/error'),
	(10, '/message_service/get_user_list'),
	(7, '/message_service/sec_get_user_notification'),
	(5, '/report_service/sec_get_bar_chart_data'),
	(11, '/report_service/sec_get_pie_chart_data'),
	(181, '/role_management/create_role_v2'),
	(191, '/role_management/sec_activate_role_bulk_v2'),
	(189, '/role_management/sec_activate_role_v2'),
	(23, '/role_management/sec_check_role_name_availability'),
	(180, '/role_management/sec_check_role_name_availability_v2'),
	(24, '/role_management/sec_create_role'),
	(214, '/role_management/sec_delete_role'),
	(204, '/role_management/sec_delete_role_bulk_v2'),
	(94, '/role_management/sec_get_displayable_optional_fields_v2'),
	(119, '/role_management/sec_get_show_hide_fields_as_selected_v2'),
	(190, '/role_management/sec_inactivate_role_bulk_v2'),
	(188, '/role_management/sec_inactivate_role_v2'),
	(20, '/role_management/sec_search_roles'),
	(113, '/role_management/sec_search_role_v2'),
	(22, '/role_management/sec_update_role'),
	(21, '/role_management/sec_view_role'),
	(79, '/role_management/sec_view_role_dropdown'),
	(138, '/role_management/sec_view_role_dropdown_v2'),
	(19, '/role_management/sec_view_role_menu_list'),
	(39, '/role_management/sec_view_user_nav_list'),
	(120, '/role_management/update_role_v2'),
	(36, '/role_management/view_role_field_list_v2'),
	(35, '/role_management/view_role_menu_list_v2'),
	(38, '/role_management/view_role_selected_field_list_v2'),
	(37, '/role_management/view_role_selected_menu_list_v2'),
	(140, '/tenant_management/sec_get_tenant_details'),
	(29, '/tenant_management/sec_get_trial_verify_percentage'),
	(30, '/tenant_management/sec_is_email_available'),
	(26, '/tenant_management/sec_trial_request'),
	(203, '/tenant_management/sec_update_tenant'),
	(28, '/tenant_management/sec_verify_trial'),
	(233, '/user_management/sec_activate_user_bulk_v2'),
	(231, '/user_management/sec_admin_password_reset_v2'),
	(81, '/user_management/sec_check_user_email_availability'),
	(82, '/user_management/sec_create_user_v2'),
	(4, '/user_management/sec_download_profile_pic'),
	(232, '/user_management/sec_download_userlist_template_v2'),
	(57, '/user_management/sec_get_all_approvers_v2'),
	(17, '/user_management/sec_get_userlist_dropdown'),
	(186, '/user_management/sec_get_user_upload_issues'),
	(185, '/user_management/sec_get_user_upload_percentage'),
	(234, '/user_management/sec_inactivate_user_bulk_v2'),
	(80, '/user_management/sec_search_users_v2'),
	(1, '/user_management/sec_temporary_password_reset'),
	(177, '/user_management/sec_toggle_user_status'),
	(206, '/user_management/sec_update_profile'),
	(84, '/user_management/sec_update_user'),
	(139, '/user_management/sec_update_user_v2'),
	(184, '/user_management/sec_upload_user_list_v2'),
	(58, '/user_management/sec_view_approval_group_list_v2'),
	(34, '/user_management/sec_view_authenticated_user'),
	(83, '/user_management/sec_view_user'),
	(2, '/user_management/sec_view_user_byuserid'),
	(31, '/user_management/sec_view_user_nav_list'),
	(226, '/vendor_portal/sec_activate_account_v2'),
	(165, '/vendor_portal/sec_activate_vendor_v2'),
	(101, '/vendor_portal/sec_approve_and_finalize_bill_v2'),
	(133, '/vendor_portal/sec_approve_and_finzlize_v2'),
	(176, '/vendor_portal/sec_approve_and_reassigned_expense_report_v2'),
	(106, '/vendor_portal/sec_approve_and_reassign_bill_v2'),
	(247, '/vendor_portal/sec_approve_and_reassign_v2'),
	(117, '/vendor_portal/sec_approve_bulk_bill_v2'),
	(178, '/vendor_portal/sec_approve_expense_report_v2'),
	(114, '/vendor_portal/sec_attach_bill_template_v2'),
	(71, '/vendor_portal/sec_bill_due_date_v2'),
	(179, '/vendor_portal/sec_bulk_approve_expense_report_v2'),
	(173, '/vendor_portal/sec_bulk_delete_expense_report_v2'),
	(229, '/vendor_portal/sec_bulk_download_selected_expense_report_v2'),
	(154, '/vendor_portal/sec_bulk_export_all_expense_report_v2'),
	(215, '/vendor_portal/sec_bulk_export_selected_expense_report_v2'),
	(175, '/vendor_portal/sec_bulk_reject_expense_report_v2'),
	(268, '/vendor_portal/sec_change_invoice'),
	(51, '/vendor_portal/sec_check_email_availability_v2'),
	(50, '/vendor_portal/sec_check_vendor_code_availability_v2'),
	(88, '/vendor_portal/sec_create_account'),
	(73, '/vendor_portal/sec_create_bill_template_v2'),
	(123, '/vendor_portal/sec_create_bill_v2'),
	(255, '/vendor_portal/sec_create_payment'),
	(252, '/vendor_portal/sec_create_po_receipt_v2'),
	(187, '/vendor_portal/sec_create_purchase_order_as_approved_v2'),
	(129, '/vendor_portal/sec_create_purchase_order_v2'),
	(52, '/vendor_portal/sec_create_vendor_v2'),
	(224, '/vendor_portal/sec_delete_account_bulk_v2'),
	(74, '/vendor_portal/sec_delete_bill_v2'),
	(263, '/vendor_portal/sec_delete_bulk_bill_v2'),
	(259, '/vendor_portal/sec_delete_expense_attachment_v2'),
	(174, '/vendor_portal/sec_delete_expense_report_v2'),
	(264, '/vendor_portal/sec_delete_payment'),
	(166, '/vendor_portal/sec_delete_vendor_v2'),
	(273, '/vendor_portal/sec_download_account_import_template'),
	(60, '/vendor_portal/sec_download_bill_attachment_v2'),
	(160, '/vendor_portal/sec_download_bulk_all_bill_payment_v2'),
	(122, '/vendor_portal/sec_download_bulk_all_bill_v2'),
	(118, '/vendor_portal/sec_download_bulk_bill_v2'),
	(121, '/vendor_portal/sec_download_bulk_selected_bill_v2'),
	(171, '/vendor_portal/sec_download_expense_attachment_v2'),
	(161, '/vendor_portal/sec_download_payment_import_template'),
	(153, '/vendor_portal/sec_download_vendor_list_template_v2'),
	(245, '/vendor_portal/sec_edit_and_resubmit_purchase_order_v2'),
	(213, '/vendor_portal/sec_edit_resubmit_expense_report_v2'),
	(158, '/vendor_portal/sec_export_bulk_all_bill_v2'),
	(265, '/vendor_portal/sec_export_bulk_all_payment_v2'),
	(261, '/vendor_portal/sec_export_bulk_selected_bill_v2'),
	(269, '/vendor_portal/sec_export_bulk_selected_payment_v2'),
	(105, '/vendor_portal/sec_generate_extended_inv_report'),
	(262, '/vendor_portal/sec_generate_invoice_export_csv'),
	(85, '/vendor_portal/sec_get_account_detail_types'),
	(107, '/vendor_portal/sec_get_account_detail_types_v2'),
	(63, '/vendor_portal/sec_get_account_dropdown_list'),
	(87, '/vendor_portal/sec_get_account_is_available'),
	(78, '/vendor_portal/sec_get_account_types'),
	(276, '/vendor_portal/sec_get_account_upload_issues_v2'),
	(275, '/vendor_portal/sec_get_account_upload_percentage_v2'),
	(131, '/vendor_portal/sec_get_all_pending_po_id_v2'),
	(62, '/vendor_portal/sec_get_approved_po_list_v2'),
	(253, '/vendor_portal/sec_get_billlist_dropdown_by_vendor_v2'),
	(267, '/vendor_portal/sec_get_bills_dropdown_by_vendor_except_selected_bill'),
	(47, '/vendor_portal/sec_get_bill_search_grid_v2'),
	(53, '/vendor_portal/sec_get_bill_template_list_v2'),
	(55, '/vendor_portal/sec_get_bill_terms_list_v2'),
	(61, '/vendor_portal/sec_get_bill_v2'),
	(155, '/vendor_portal/sec_get_community_vendor_grid_list_v2'),
	(167, '/vendor_portal/sec_get_community_vendor_list_v2'),
	(12, '/vendor_portal/sec_get_discounted_invoices'),
	(254, '/vendor_portal/sec_get_discount_amount_by_payment'),
	(156, '/vendor_portal/sec_get_invitation_list_v2'),
	(25, '/vendor_portal/sec_get_marketplace_vendors_dropdown'),
	(86, '/vendor_portal/sec_get_parents'),
	(108, '/vendor_portal/sec_get_parents_v2'),
	(272, '/vendor_portal/sec_get_payment_upload_issues_v2'),
	(271, '/vendor_portal/sec_get_payment_upload_percentage_v2'),
	(115, '/vendor_portal/sec_get_pending_bill_id_list_v2'),
	(170, '/vendor_portal/sec_get_pending_expense_id_list_v2'),
	(75, '/vendor_portal/sec_get_po_celing'),
	(230, '/vendor_portal/sec_get_receipt_drop_down_v2'),
	(135, '/vendor_portal/sec_get_receipt_enabled_po_list_v2'),
	(116, '/vendor_portal/sec_get_remaining_ceiling_v2'),
	(250, '/vendor_portal/sec_get_remaining_item_list_v2'),
	(15, '/vendor_portal/sec_get_term_list_dropdown'),
	(59, '/vendor_portal/sec_get_unsubmit_bills_execlude_v2'),
	(46, '/vendor_portal/sec_get_unsubmit_bills_v2'),
	(3, '/vendor_portal/sec_get_uptodate_total_discount'),
	(8, '/vendor_portal/sec_get_vendors_dropdown'),
	(162, '/vendor_portal/sec_get_vendor_v2'),
	(223, '/vendor_portal/sec_inactivate_account_bulk_v2'),
	(225, '/vendor_portal/sec_inactivate_account_v2'),
	(164, '/vendor_portal/sec_inactivate_vendor_v2'),
	(45, '/vendor_portal/sec_is_first_bill_v2'),
	(127, '/vendor_portal/sec_load_small_card_v2'),
	(43, '/vendor_portal/sec_local_vendor_dropdown_list_v2'),
	(277, '/vendor_portal/sec_mark_as_mailed'),
	(194, '/vendor_portal/sec_po_approve_bulk_v2'),
	(193, '/vendor_portal/sec_po_delete_bulk_v2'),
	(132, '/vendor_portal/sec_po_download_attachment_v2'),
	(197, '/vendor_portal/sec_po_export_bulk_selected_v2'),
	(192, '/vendor_portal/sec_po_reject_bulk_v2'),
	(198, '/vendor_portal/sec_purchase_order_audit_trial_v2'),
	(196, '/vendor_portal/sec_receipt_download_bulk_all_v2'),
	(195, '/vendor_portal/sec_receipt_download_bulk_selected_v2'),
	(251, '/vendor_portal/sec_receipt_get_line_total_discount_v2'),
	(99, '/vendor_portal/sec_reject_bill_approval_v2'),
	(248, '/vendor_portal/sec_reject_purchase_order_v2'),
	(172, '/vendor_portal/sec_save_expense_report_as_approved_v2'),
	(109, '/vendor_portal/sec_search_account_v2'),
	(159, '/vendor_portal/sec_search_bill_payments_v2'),
	(137, '/vendor_portal/sec_search_expense_report_v2'),
	(18, '/vendor_portal/sec_search_invoice'),
	(44, '/vendor_portal/sec_search_purchase_orders_v2'),
	(134, '/vendor_portal/sec_search_receipt_grid_v2'),
	(70, '/vendor_portal/sec_search_vendor_v2'),
	(235, '/vendor_portal/sec_send_to_vendor_approval_v2'),
	(260, '/vendor_portal/sec_skip_approval_expense_report_v2'),
	(104, '/vendor_portal/sec_skip_bill_approval_v2'),
	(246, '/vendor_portal/sec_skip_po_approval_v2'),
	(76, '/vendor_portal/sec_submit_bill_v2'),
	(125, '/vendor_portal/sec_submit_expense_report_v2'),
	(256, '/vendor_portal/sec_undo_invoice_action'),
	(221, '/vendor_portal/sec_update_account'),
	(163, '/vendor_portal/sec_update_vendor_v2'),
	(274, '/vendor_portal/sec_upload_account_list_v2'),
	(54, '/vendor_portal/sec_upload_bill_v2'),
	(270, '/vendor_portal/sec_upload_payment_list_v2'),
	(72, '/vendor_portal/sec_validate_bill_date_format_v2'),
	(128, '/vendor_portal/sec_vendor_info'),
	(100, '/vendor_portal/sec_view_account'),
	(124, '/vendor_portal/sec_view_all_expense_types_v2'),
	(102, '/vendor_portal/sec_view_bill_audit_trail_v2'),
	(103, '/vendor_portal/sec_view_bill_detail_report_v2'),
	(227, '/vendor_portal/sec_view_expense_audit_trail_v2'),
	(169, '/vendor_portal/sec_view_expense_report_v2'),
	(266, '/vendor_portal/sec_view_payment'),
	(130, '/vendor_portal/sec_view_po_v2');
/*!40000 ALTER TABLE `common_system_endpoint` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.common_system_task
DROP TABLE IF EXISTS `common_system_task`;
CREATE TABLE IF NOT EXISTS `common_system_task` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `status` char(1) NOT NULL,
  `route` varchar(255) DEFAULT NULL,
  `created_by` varchar(100) DEFAULT '',
  `created_on` date DEFAULT NULL,
  `update_by` varchar(100) DEFAULT '',
  `update_on` date DEFAULT NULL,
  `delete_by` varchar(100) DEFAULT NULL,
  `delete_on` date DEFAULT NULL,
  `tab` tinyint(2) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- Dumping data for table papertrl_default_script.common_system_task: ~0 rows (approximately)
/*!40000 ALTER TABLE `common_system_task` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_system_task` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.common_uom
DROP TABLE IF EXISTS `common_uom`;
CREATE TABLE IF NOT EXISTS `common_uom` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `unit` varchar(10) DEFAULT '',
  `description` varchar(100) DEFAULT NULL,
  `status` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Dumping data for table papertrl_default_script.common_uom: ~2 rows (approximately)
/*!40000 ALTER TABLE `common_uom` DISABLE KEYS */;
INSERT INTO `common_uom` (`id`, `unit`, `description`, `status`) VALUES
	(1, 'HR', 'Human Resource', 'A'),
	(2, 'EA', 'Each', 'A');
/*!40000 ALTER TABLE `common_uom` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.common_user_email_subscription
DROP TABLE IF EXISTS `common_user_email_subscription`;
CREATE TABLE IF NOT EXISTS `common_user_email_subscription` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email_id` int(11) DEFAULT NULL,
  `user_id` varchar(30) DEFAULT NULL,
  `subscribe` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

-- Dumping data for table papertrl_default_script.common_user_email_subscription: ~0 rows (approximately)
/*!40000 ALTER TABLE `common_user_email_subscription` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_user_email_subscription` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.common_user_log
DROP TABLE IF EXISTS `common_user_log`;
CREATE TABLE IF NOT EXISTS `common_user_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `endpoint_id` int(11) NOT NULL,
  `ip_address` varchar(30) NOT NULL,
  `user_name` varchar(100) NOT NULL,
  `status_code` varchar(15) NOT NULL,
  `additional_message` varchar(256) DEFAULT NULL,
  `created_on` datetime NOT NULL,
  `tenant_id` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table papertrl_default_script.common_user_log: ~0 rows (approximately)
/*!40000 ALTER TABLE `common_user_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_user_log` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.common_user_notification
DROP TABLE IF EXISTS `common_user_notification`;
CREATE TABLE IF NOT EXISTS `common_user_notification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `to_user_name` varchar(100) NOT NULL,
  `refno` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `url` varchar(100) NOT NULL,
  `status` char(5) NOT NULL,
  `message` varchar(100) NOT NULL,
  `style` varchar(100) NOT NULL,
  `delete_on` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`to_user_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table papertrl_default_script.common_user_notification: ~0 rows (approximately)
/*!40000 ALTER TABLE `common_user_notification` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_user_notification` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.hst_vp_bill
DROP TABLE IF EXISTS `hst_vp_bill`;
CREATE TABLE IF NOT EXISTS `hst_vp_bill` (
  `recode_id` int(11) NOT NULL AUTO_INCREMENT,
  `id` int(11) NOT NULL,
  `automation_id` int(11) DEFAULT NULL,
  `vendor_id` int(11) DEFAULT NULL,
  `uuid` varchar(100) NOT NULL,
  `po_id` int(11) DEFAULT NULL,
  `receipt_id` int(11) DEFAULT NULL,
  `bill_attachment_id` int(11) DEFAULT NULL,
  `term` int(11) DEFAULT NULL,
  `balance_amount` decimal(19,2) DEFAULT NULL,
  `bill_amount` decimal(19,2) DEFAULT NULL,
  `discount_amount` decimal(19,2) DEFAULT NULL,
  `discount_percentage` decimal(5,2) DEFAULT NULL,
  `discount_days_due` int(3) DEFAULT NULL,
  `net_days_due` int(3) DEFAULT NULL,
  `due_date` datetime DEFAULT NULL,
  `bill_date_str` varchar(40) DEFAULT NULL,
  `bill_date_format` varchar(40) DEFAULT NULL,
  `bill_date` date DEFAULT NULL,
  `bill_no` varchar(50) DEFAULT NULL,
  `content_extractable` char(1) DEFAULT NULL,
  `remark` longtext DEFAULT NULL,
  `template_id` int(11) DEFAULT NULL,
  `submitted_on` datetime DEFAULT NULL,
  `submitted_by` varchar(100) DEFAULT NULL,
  `submitted_by_name` varchar(200) DEFAULT NULL,
  `deletection_level` char(1) DEFAULT NULL,
  `tax` decimal(19,2) DEFAULT NULL,
  `additional_notes` varchar(500) DEFAULT NULL,
  `discount_applicable_date` datetime DEFAULT NULL,
  `bill_type` char(1) DEFAULT NULL,
  `applicable_discount_amount` decimal(19,2) DEFAULT NULL,
  `workflow_id` int(11) DEFAULT NULL,
  `workflow_level` int(11) DEFAULT NULL,
  `no_of_levels` int(3) DEFAULT NULL,
  `remaining_celing` decimal(19,2) DEFAULT NULL,
  `approval_user` varchar(100) DEFAULT NULL,
  `approval_group_name` varchar(75) DEFAULT NULL,
  `approval_group` int(11) DEFAULT NULL,
  `approval_user_name` varchar(200) DEFAULT NULL,
  `export_status` char(1) DEFAULT NULL,
  `payment_status` char(2) DEFAULT NULL,
  `status` char(1) NOT NULL,
  `approved_date` datetime DEFAULT NULL,
  `submitted_by_vendor` tinyint(1) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `created_by` varchar(100) NOT NULL,
  `created_on` datetime NOT NULL,
  `update_by` varchar(100) DEFAULT NULL,
  `update_on` datetime DEFAULT NULL,
  `delete_by` varchar(100) DEFAULT NULL,
  `delete_on` datetime DEFAULT NULL,
  `undo_status` char(1) DEFAULT NULL,
  PRIMARY KEY (`recode_id`),
  KEY `HST_VP_BILL_VENDOR_ID_FK_8` (`vendor_id`) USING BTREE,
  KEY `HST_VP_BILL_PO_KEY_FK_1` (`po_id`),
  KEY `HST_VP_BILL_AUTOMATION_ID_FK_6` (`automation_id`),
  KEY `HST_VP_BILL_WORKFLOW_ID_FK_9` (`workflow_id`),
  KEY `HST_VP_BILL_BILL_ATTACHMENT_ID_FK_1` (`bill_attachment_id`),
  KEY `HST_VP_BILL_PO_RECEIPT_FK_1` (`receipt_id`),
  CONSTRAINT `HST_VP_BILL_AUTOMATION_ID_FK_6` FOREIGN KEY (`automation_id`) REFERENCES `common_automation_mst` (`id`),
  CONSTRAINT `HST_VP_BILL_BILL_ATTACHMENT_ID_FK_1` FOREIGN KEY (`bill_attachment_id`) REFERENCES `vp_bill_attachment` (`id`),
  CONSTRAINT `HST_VP_BILL_PO_KEY_FK_1` FOREIGN KEY (`po_id`) REFERENCES `vp_po_mst` (`id`),
  CONSTRAINT `HST_VP_BILL_PO_RECEIPT_FK_1` FOREIGN KEY (`receipt_id`) REFERENCES `vp_po_receipt_mst` (`id`),
  CONSTRAINT `HST_VP_BILL_VENDOR_ID_FK_8` FOREIGN KEY (`vendor_id`) REFERENCES `vp_vendor_mst` (`id`),
  CONSTRAINT `HST_VP_BILL_WORKFLOW_ID_FK_9` FOREIGN KEY (`workflow_id`) REFERENCES `common_document_workflow_config` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=latin1;

-- Dumping data for table papertrl_default_script.hst_vp_bill: ~0 rows (approximately)
/*!40000 ALTER TABLE `hst_vp_bill` DISABLE KEYS */;
/*!40000 ALTER TABLE `hst_vp_bill` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.hst_vp_bill_additional_data
DROP TABLE IF EXISTS `hst_vp_bill_additional_data`;
CREATE TABLE IF NOT EXISTS `hst_vp_bill_additional_data` (
  `recode_id` int(11) NOT NULL AUTO_INCREMENT,
  `id` int(11) NOT NULL,
  `field_value` varchar(200) DEFAULT NULL,
  `field_id` int(15) NOT NULL,
  `field_name` varchar(50) DEFAULT NULL,
  `bill_mst_id` int(15) NOT NULL,
  `field_type_id` int(11) DEFAULT NULL,
  `section_id` int(11) NOT NULL,
  `detail_id` int(11) DEFAULT NULL,
  `display_order` int(11) NOT NULL,
  `multiple_status` char(1) DEFAULT NULL,
  `hst_recode_id` int(11) NOT NULL,
  PRIMARY KEY (`recode_id`),
  KEY `FK_hst_vp_bill_additional_data_vp_invoice_mst` (`bill_mst_id`),
  KEY `FK_hst_vp_bill_additional_data_hst_vp_bill` (`hst_recode_id`),
  CONSTRAINT `FK_hst_vp_bill_additional_data_hst_vp_bill` FOREIGN KEY (`hst_recode_id`) REFERENCES `hst_vp_bill` (`recode_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_hst_vp_bill_additional_data_vp_invoice_mst` FOREIGN KEY (`bill_mst_id`) REFERENCES `vp_bill` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- Dumping data for table papertrl_default_script.hst_vp_bill_additional_data: ~0 rows (approximately)
/*!40000 ALTER TABLE `hst_vp_bill_additional_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `hst_vp_bill_additional_data` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.hst_vp_bill_additional_field_attachment
DROP TABLE IF EXISTS `hst_vp_bill_additional_field_attachment`;
CREATE TABLE IF NOT EXISTS `hst_vp_bill_additional_field_attachment` (
  `recode_id` int(11) NOT NULL AUTO_INCREMENT,
  `id` int(11) NOT NULL,
  `field_id` int(11) NOT NULL,
  `bill_mst_id` int(11) NOT NULL,
  `attachment_url` varchar(200) NOT NULL,
  `file_name` varchar(200) DEFAULT NULL,
  `file_type` varchar(100) DEFAULT NULL,
  `status` char(1) NOT NULL,
  `delete_by` varchar(100) DEFAULT '',
  `delete_on` datetime DEFAULT NULL,
  `field_name` varchar(50) NOT NULL,
  `section_id` int(11) NOT NULL,
  `detail_id` int(11) DEFAULT NULL,
  `display_order` int(11) NOT NULL,
  `hst_recode_id` int(11) NOT NULL,
  PRIMARY KEY (`recode_id`),
  KEY `FK_hst_vp_bill_additional_field_attachment_inv_mst` (`bill_mst_id`),
  KEY `FK_hst_vp_bill_additional_field_attachment_hst_vp_bill` (`hst_recode_id`),
  CONSTRAINT `FK_hst_vp_bill_additional_field_attachment_hst_vp_bill` FOREIGN KEY (`hst_recode_id`) REFERENCES `hst_vp_bill` (`recode_id`),
  CONSTRAINT `FK_hst_vp_bill_additional_field_attachment_inv_mst` FOREIGN KEY (`bill_mst_id`) REFERENCES `vp_bill` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table papertrl_default_script.hst_vp_bill_additional_field_attachment: ~0 rows (approximately)
/*!40000 ALTER TABLE `hst_vp_bill_additional_field_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `hst_vp_bill_additional_field_attachment` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.hst_vp_bill_expense_cost_distribution
DROP TABLE IF EXISTS `hst_vp_bill_expense_cost_distribution`;
CREATE TABLE IF NOT EXISTS `hst_vp_bill_expense_cost_distribution` (
  `recode_id` int(11) NOT NULL AUTO_INCREMENT,
  `id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `description` varchar(500) DEFAULT '',
  `amount` decimal(19,2) NOT NULL,
  `billable` tinyint(1) DEFAULT NULL,
  `tax` tinyint(1) DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  `bill_id` int(11) NOT NULL,
  `hst_recode_id` int(11) NOT NULL,
  `department_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`recode_id`),
  KEY `FK_hst_vp_vendor_item_cost_distribution_vp_vendor_mst` (`bill_id`),
  KEY `FK_hst_vp_vendor_item_cost_distribution_common_chart_of_account` (`account_id`),
  KEY `FK_hst_vp_vendor_item_cost_distribution_project_id` (`project_id`),
  KEY `FK_hst_vp_bill_expense_cost_distribution_hst_vp_bill` (`hst_recode_id`),
  CONSTRAINT `FK_hst_vp_bill_expense_cost_distribution_hst_vp_bill` FOREIGN KEY (`hst_recode_id`) REFERENCES `hst_vp_bill` (`recode_id`),
  CONSTRAINT `FK_hst_vp_vendor_item_cost_distribution_common_chart_of_account` FOREIGN KEY (`account_id`) REFERENCES `common_account_number` (`id`),
  CONSTRAINT `FK_hst_vp_vendor_item_cost_distribution_project_id` FOREIGN KEY (`project_id`) REFERENCES `common_approval_code` (`id`),
  CONSTRAINT `FK_hst_vp_vendor_item_cost_distribution_vp_vendor_mst` FOREIGN KEY (`bill_id`) REFERENCES `vp_bill` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

-- Dumping data for table papertrl_default_script.hst_vp_bill_expense_cost_distribution: ~0 rows (approximately)
/*!40000 ALTER TABLE `hst_vp_bill_expense_cost_distribution` DISABLE KEYS */;
/*!40000 ALTER TABLE `hst_vp_bill_expense_cost_distribution` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.hst_vp_bill_item_cost_distribution
DROP TABLE IF EXISTS `hst_vp_bill_item_cost_distribution`;
CREATE TABLE IF NOT EXISTS `hst_vp_bill_item_cost_distribution` (
  `recode_id` int(11) NOT NULL AUTO_INCREMENT,
  `id` int(11) NOT NULL,
  `item_id` int(11) DEFAULT NULL,
  `description` varchar(500) DEFAULT '',
  `qty` decimal(12,2) NOT NULL DEFAULT 0.00,
  `rate` decimal(19,2) NOT NULL,
  `amount` decimal(19,2) NOT NULL,
  `billable` tinyint(1) DEFAULT NULL,
  `tax` tinyint(1) DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  `po_id` int(11) DEFAULT NULL,
  `bill_id` int(11) NOT NULL,
  `item_number` varchar(50) DEFAULT '',
  `item_name` varchar(300) DEFAULT '',
  `hst_recode_id` int(11) NOT NULL,
  `department_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`recode_id`),
  KEY `FK_hst_vp_invoice_item_cost_distribution_common_product_mst` (`item_id`),
  KEY `FK_hst_vp_invoice_item_cost_distribution_vp_vendor_invoice` (`bill_id`),
  KEY `FK_hst_vp_invoice_item_cost_distribution_project_id` (`project_id`),
  KEY `FK_hst_vp_invoice_item_cost_distribution_po_id` (`po_id`),
  KEY `FK_hst_vp_bill_item_cost_distribution_hst_vp_bill` (`hst_recode_id`),
  CONSTRAINT `FK_hst_vp_bill_item_cost_distribution_hst_vp_bill` FOREIGN KEY (`hst_recode_id`) REFERENCES `hst_vp_bill` (`recode_id`),
  CONSTRAINT `FK_hst_vp_invoice_item_cost_distribution_common_product_mst` FOREIGN KEY (`item_id`) REFERENCES `common_item_mst` (`id`),
  CONSTRAINT `FK_hst_vp_invoice_item_cost_distribution_po_id` FOREIGN KEY (`po_id`) REFERENCES `vp_po_mst` (`id`),
  CONSTRAINT `FK_hst_vp_invoice_item_cost_distribution_project_id` FOREIGN KEY (`project_id`) REFERENCES `common_approval_code` (`id`),
  CONSTRAINT `FK_hst_vp_invoice_item_cost_distribution_vp_vendor_invoice` FOREIGN KEY (`bill_id`) REFERENCES `vp_bill` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;

-- Dumping data for table papertrl_default_script.hst_vp_bill_item_cost_distribution: ~0 rows (approximately)
/*!40000 ALTER TABLE `hst_vp_bill_item_cost_distribution` DISABLE KEYS */;
/*!40000 ALTER TABLE `hst_vp_bill_item_cost_distribution` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.umm_menu
DROP TABLE IF EXISTS `umm_menu`;
CREATE TABLE IF NOT EXISTS `umm_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `display_text` varchar(600) NOT NULL DEFAULT '',
  `menu_style` varchar(100) DEFAULT NULL,
  `url` varchar(255) NOT NULL DEFAULT '',
  `tab` varchar(100) DEFAULT '',
  `type` char(1) NOT NULL DEFAULT '',
  `super_type` int(11) DEFAULT NULL,
  `super_type_2` int(11) DEFAULT NULL,
  `department` varchar(50) NOT NULL DEFAULT '',
  `menu_order` int(3) DEFAULT NULL,
  `display_icon` varchar(100) DEFAULT NULL,
  `short_name` varchar(50) NOT NULL,
  `detail_text` varchar(600) NOT NULL,
  `status` char(1) NOT NULL,
  `portal_menu` tinyint(4) NOT NULL DEFAULT 0,
  `individual_tenant_menu` tinyint(1) NOT NULL,
  `vendor_community_menu` tinyint(1) NOT NULL,
  `version` varchar(10) NOT NULL,
  `auth_code` varchar(50) NOT NULL,
  `slim_menu` tinyint(1) NOT NULL,
  `hierachy` varchar(20) DEFAULT NULL,
  `created_by` varchar(100) NOT NULL DEFAULT '',
  `created_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `update_by` varchar(100) DEFAULT NULL,
  `update_on` datetime DEFAULT NULL,
  `delete_by` varchar(100) DEFAULT NULL,
  `delete_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1030 DEFAULT CHARSET=latin1;

-- Dumping data for table papertrl_default_script.umm_menu: ~28 rows (approximately)
/*!40000 ALTER TABLE `umm_menu` DISABLE KEYS */;
INSERT INTO `umm_menu` (`id`, `name`, `display_text`, `menu_style`, `url`, `tab`, `type`, `super_type`, `super_type_2`, `department`, `menu_order`, `display_icon`, `short_name`, `detail_text`, `status`, `portal_menu`, `individual_tenant_menu`, `vendor_community_menu`, `version`, `auth_code`, `slim_menu`, `hierachy`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES
	(1000, 'Dashboard', 'Dashboard', 'fa fa-th-large', '/home/dashboard', NULL, 'S', 1014, NULL, 'Admin', 1, 'fa fa-th-large', 'Dashboard', 'Dashboard', 'A', 1, 1, 1, 'V2', 'DASHBOARD', 1, '1014', 'System', '2021-04-13 14:04:42', NULL, NULL, NULL, NULL),
	(1001, 'Admin', 'Admin', 'fa fa-key', '/home/admin', NULL, 'S', 1014, NULL, 'Admin', 11, 'fa fa-key', 'Admin', 'Admin', 'A', 1, 1, 1, 'V2', 'ADMIN', 1, '1014', 'System', '2021-04-13 14:04:58', NULL, NULL, NULL, NULL),
	(1002, 'Settings', 'Settings', 'fa fa-cog', '/home/settings', NULL, 'S', 1014, NULL, 'Admin', 12, 'fa fa-cog', 'Settings', 'Settings', 'A', 1, 1, 0, 'V2', 'SETTINGS', 1, '1014', 'System', '2021-04-13 14:05:02', NULL, NULL, NULL, NULL),
	(1003, 'Automation', 'Automation', 'fa fa-tasks', '/home/automation', NULL, 'S', 1014, NULL, 'Admin', 10, 'fa fa-tasks', 'Automations', 'Automations', 'A', 1, 1, 0, 'V2', 'AUTOMATION', 1, '1014', 'System', '2021-04-13 14:05:07', NULL, NULL, NULL, NULL),
	(1004, 'Vendors', 'Vendors', 'pi pi-users', '/home/vendor', NULL, 'S', 1015, NULL, 'Admin', 8, 'pi pi-users', 'Vendors', 'Vendors', 'A', 0, 1, 0, 'V2', 'VENDORS', 1, '1015', 'System', '2021-05-14 15:45:10', NULL, NULL, NULL, NULL),
	(1005, 'Bills', 'Bills', 'fa fa-file-text', '/home/bills', NULL, 'S', 1015, NULL, 'Admin', 3, 'fa fa-file-text', 'Bills', 'Bills', 'A', 0, 1, 0, 'V2', 'BILL_MANAGEMENT', 0, '1015', 'System', '2021-07-13 23:12:05', NULL, NULL, NULL, NULL),
	(1006, 'Purchase Orders', 'Purchase Orders', 'fa fa-cart-arrow-down', '/home/purchase-order', NULL, 'S', 1015, NULL, 'Admin', 2, 'fa fa-cart-arrow-down', 'PO', 'PO', 'A', 0, 1, 1, 'V2', 'PO', 0, '1015', 'System', '2021-07-13 23:12:05', NULL, NULL, NULL, NULL),
	(1007, 'Expenses', 'Expenses', 'fa fa-usd', '/home/expense', NULL, 'S', 1015, NULL, 'Admin', 4, 'fa fa-usd', 'Expenses', 'Expenses', 'A', 0, 1, 0, 'V2', 'EXPENSES', 1, '1015', 'System', '2021-07-13 23:12:05', NULL, NULL, NULL, NULL),
	(1008, 'Items', 'Items', 'fa fa-cube', '/home/item', NULL, 'S', 1014, NULL, 'Admin', 6, 'fa fa-cube', 'Items', 'Items', 'A', 0, 1, 1, 'V2', 'ITEMS', 1, '1014', 'System', '2021-04-13 14:16:55', NULL, NULL, NULL, NULL),
	(1009, 'Accounts', 'Accounts', 'fa fa-industry', '/home/account', NULL, 'S', 1014, NULL, 'Admin', 5, 'fa fa-industry', 'Accounts', 'Accounts', 'A', 0, 1, 0, 'V2', 'ACCOUNTS', 1, '1014', 'System', '2021-04-13 14:17:06', NULL, NULL, NULL, NULL),
	(1010, 'Project', 'Project', 'fa fa-code', '/home/project-code', NULL, 'S', 1016, NULL, 'Admin', 7, 'fa fa-code', 'Project Codes', 'Project Codes', 'A', 0, 1, 0, 'V2', 'PROJECT_CODES', 1, '1016', 'System', '2021-04-13 14:17:30', NULL, NULL, NULL, NULL),
	(1011, 'Users', 'Users', 'fa fa-user', '/home/admin', '0', 'S', 1001, NULL, 'Admin', 11, 'fa fa-user', 'Users', 'Users', 'A', 1, 1, 1, 'V2', 'USERS', 0, '1001,1014', 'System', '2021-04-13 15:10:26', NULL, NULL, NULL, NULL),
	(1012, 'Roles', 'Roles', 'fa fa-lock', '/home/admin', '1', 'S', 1001, NULL, 'Admin', 11, 'fa fa-lock', 'Roles', 'Roles', 'A', 1, 1, 1, 'V2', 'ROLES', 0, '1001,1014', 'System', '2021-04-13 15:10:32', NULL, NULL, NULL, NULL),
	(1013, 'Approval Groups', 'Approval Groups', 'fa fa-users', '/home/admin', '2', 'S', 1001, NULL, 'Admin', 11, 'fa fa-users', 'Approval Groups', 'Approval Groups', 'A', 1, 1, 1, 'V2', 'APPROVAL_GROUPS', 0, '1001,1014', 'System', '2021-04-13 15:10:36', NULL, NULL, NULL, NULL),
	(1014, 'Common', 'Common', 'fa fa-home', '', NULL, 'M', NULL, NULL, 'Admin', 13, 'fa fa-home', 'Company', 'Company', 'A', 1, 1, 0, 'V2', 'CPMPANY', 0, NULL, 'System', '2021-04-13 14:18:58', NULL, NULL, NULL, NULL),
	(1015, 'Payable', 'Payable', 'fa fa-industry', '', NULL, 'M', NULL, NULL, 'Admin', 13, 'fa fa-industry', 'Payable', 'Payable', 'A', 1, 1, 0, 'V2', 'PAYABLE', 0, NULL, 'System', '2021-04-13 14:18:38', NULL, NULL, NULL, NULL),
	(1016, 'Receivable', 'Receivable', 'fa fa-cube', '', NULL, 'M', NULL, NULL, 'Admin', 13, 'fa fa-industry', 'Receivable', 'Receivable', 'A', 1, 1, 0, 'V2', 'RECEIVABLE', 0, NULL, 'System', '2021-04-13 14:18:42', NULL, NULL, NULL, NULL),
	(1017, 'Company Profile', 'Company Profile', 'fa fa-building', '/home/settings', '0', 'S', 1002, NULL, 'Admin', 12, 'fa fa-building', 'Company Profile', 'Company Profile', 'A', 1, 1, 1, 'V2', 'COMPANY_PROFILE', 0, '1002,1014', 'System', '2021-04-13 15:11:03', NULL, NULL, NULL, NULL),
	(1018, 'Additional Fields', 'Additional Fields', 'fa fa-pencil-square-o', '/home/settings', '1', 'S', 1002, NULL, 'Admin', 12, 'fa fa-pencil-square-o', 'Additional Fields', 'Additional Fields', 'A', 1, 1, 1, 'V2', 'ADDITIONAL_FIELDS', 0, '1002,1014', 'System', '2021-04-13 15:11:03', NULL, NULL, NULL, NULL),
	(1019, 'Bills', 'Bills', 'fa fa-file-text', '/home/bills', '0', 'S', 1005, NULL, 'Admin', 3, 'fa fa-file-text', 'Bills', 'Bills', 'A', 1, 1, 1, 'V2', 'BILL', 1, '1005,1015', 'System', '2021-07-13 23:12:05', NULL, NULL, NULL, NULL),
	(1020, 'Bill Payments', 'Bill Payments', 'fa fa-list-alt', '/home/bills', '1', 'S', 1005, NULL, 'Admin', 3, 'fa fa-list-alt', 'Bill Payments', 'Bill Payments', 'A', 1, 1, 1, 'V2', 'BILL_PAYMENT', 0, '1005,1015', 'System', '2021-04-13 15:11:14', NULL, NULL, NULL, NULL),
	(1021, 'Purchase Orders', 'Purchase Orders', 'fa fa-cart-arrow-down', '/home/purchase-order', '0', 'S', 1006, NULL, 'Admin', 2, 'fa fa-cart-arrow-down', 'Purchase Orders', 'Purchase Orders', 'A', 1, 1, 1, 'V2', 'PURCHASE_ORDER', 1, '1006,1015', 'System', '2021-07-13 23:12:05', NULL, NULL, NULL, NULL),
	(1022, 'PO Receipts', 'PO Receipts', 'fa fa-usd', '/home/purchase-order', '1', 'S', 1006, NULL, 'Admin', 2, 'fa fa-usd', 'PO Receipts', 'PO Receipts', 'A', 1, 1, 1, 'V2', 'PO_RECEIPT', 0, '1006,1015', 'System', '2021-04-13 15:11:19', NULL, NULL, NULL, NULL),
	(1024, 'Sync Dashboard', 'Sync Dashboard', 'fa fa-exchange', '/home/sync-dashboard', NULL, 'S', 1014, NULL, 'Admin', 9, 'fa fa-exchange', 'Sync Dashboard', 'Sync Dashboard', 'A', 1, 1, 1, 'V2', 'SYNC_DASHBORD', 1, '1014', 'System', '2021-04-13 14:20:39', NULL, NULL, NULL, NULL),
	(1025, 'Reports', 'Reports', 'fa fa-pie-chart', '/home/report', '0', 'S', 1014, NULL, 'Admin', 14, 'fa fa-pie-chart', 'Reports', 'Reports', 'A', 0, 1, 1, 'V2', 'REPORTS', 1, '1014', 'System', '2021-07-14 18:50:24', NULL, NULL, NULL, NULL),
	(1027, 'PO Number Configuration', 'PO Number Configuration', 'fa fa-building', '/home/settings', '0', 'S', 1002, NULL, 'Admin', 13, 'fa fa-pencil-square-o', 'PO Number Configuration', 'PO Number Configuration', 'A', 0, 1, 0, 'V2', 'PO_NUMBER_CONFIGURATION', 0, '1002,1014', 'System', '2021-06-14 21:38:28', NULL, NULL, NULL, NULL),
	(1028, 'Payment Configuration', 'Payment Configuration', 'fa fa-money', '/home/settings', '2', 'S', 1002, NULL, 'Admin', 12, 'fa fa-money', 'Payment Configuration', 'Payment Configuration', 'A', 0, 1, 0, 'V2', 'PAYMENT_CONFIGURATION', 0, '1002,1014', 'System', '2021-08-23 19:28:40', NULL, NULL, NULL, NULL),
	(1029, 'Payments', 'Payments', 'fa fa-credit-card', '/home/payments', '0', 'S', 1015, NULL, 'Admin', 13, 'fa fa-credit-card', 'Payments', 'Payments', 'A', 0, 1, 0, 'V2', 'PAYMENTS', 1, '1005,1015', 'System', '2021-09-06 11:17:09', NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `umm_menu` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.umm_menu_privilage
DROP TABLE IF EXISTS `umm_menu_privilage`;
CREATE TABLE IF NOT EXISTS `umm_menu_privilage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_id` int(11) NOT NULL,
  `privilage_id` int(11) NOT NULL,
  `auth_code` varchar(75) NOT NULL,
  `created_by` varchar(100) NOT NULL,
  `created_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `update_by` varchar(100) DEFAULT NULL,
  `update_on` datetime DEFAULT NULL,
  `delete_by` varchar(100) DEFAULT NULL,
  `delete_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `menu_id` (`menu_id`) USING BTREE,
  KEY `privilage_id` (`privilage_id`) USING BTREE,
  CONSTRAINT `umm_menu_privilage_ibfk_1` FOREIGN KEY (`menu_id`) REFERENCES `umm_menu` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `umm_menu_privilage_ibfk_2` FOREIGN KEY (`privilage_id`) REFERENCES `umm_privilages` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=410 DEFAULT CHARSET=latin1;

-- Dumping data for table papertrl_default_script.umm_menu_privilage: ~163 rows (approximately)
/*!40000 ALTER TABLE `umm_menu_privilage` DISABLE KEYS */;
INSERT INTO `umm_menu_privilage` (`id`, `menu_id`, `privilage_id`, `auth_code`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES
	(1, 1011, 1, 'USERS_CREATE', 'System', '2021-03-14 16:37:55', NULL, NULL, NULL, NULL),
	(3, 1011, 13, 'USERS_INACTIVATE', 'System', '2021-03-14 16:37:55', NULL, NULL, NULL, NULL),
	(4, 1011, 14, 'USERS_ACTIVATE', 'System', '2021-03-14 16:37:55', NULL, NULL, NULL, NULL),
	(5, 1011, 4, 'USERS_EDIT', 'System', '2021-03-14 16:37:55', NULL, NULL, NULL, NULL),
	(6, 1011, 3, 'USERS_DETAIL_VIEW', 'System', '2021-03-14 16:37:55', NULL, NULL, NULL, NULL),
	(7, 1011, 55, 'USERS_UNLOCK', 'System', '2021-03-14 16:37:55', NULL, NULL, NULL, NULL),
	(8, 1011, 8, 'USERS_UPLOAD', 'System', '2021-03-14 16:37:55', NULL, NULL, NULL, NULL),
	(9, 1012, 1, 'ROLES_CREATE', 'System', '2021-03-14 16:37:55', NULL, NULL, NULL, NULL),
	(10, 1012, 5, 'ROLES_DELETE', 'System', '2021-03-14 16:37:55', NULL, NULL, NULL, NULL),
	(11, 1012, 13, 'ROLES_INACTIVATE', 'System', '2021-03-14 16:37:55', NULL, NULL, NULL, NULL),
	(12, 1012, 14, 'ROLES_ACTIVATE', 'System', '2021-03-14 16:37:55', NULL, NULL, NULL, NULL),
	(13, 1012, 3, 'ROLES_DETAIL_VIEW', 'System', '2021-03-14 16:37:55', NULL, NULL, NULL, NULL),
	(14, 1012, 4, 'ROLES_EDIT', 'System', '2021-03-14 16:37:55', NULL, NULL, NULL, NULL),
	(15, 1013, 1, 'APPROVAL_GROUPS_CREATE', 'System', '2021-03-14 16:37:55', NULL, NULL, NULL, NULL),
	(16, 1013, 4, 'APPROVAL_GROUPS_EDIT', 'System', '2021-03-14 16:37:55', NULL, NULL, NULL, NULL),
	(17, 1013, 5, 'APPROVAL_GROUPS_DELETE', 'System', '2021-03-14 16:37:55', NULL, NULL, NULL, NULL),
	(18, 1013, 13, 'APPROVAL_GROUPS_INACTIVATE', 'System', '2021-03-14 16:37:55', NULL, NULL, NULL, NULL),
	(19, 1013, 14, 'APPROVAL_GROUPS_ACTIVATE', 'System', '2021-03-14 16:37:55', NULL, NULL, NULL, NULL),
	(20, 1013, 8, 'APPROVAL_GROUPS_UPLOAD', 'System', '2021-03-14 16:37:55', NULL, NULL, NULL, NULL),
	(21, 1017, 4, 'COMPANY_PROFILE_EDIT', 'System', '2021-03-14 16:37:55', NULL, NULL, NULL, NULL),
	(23, 1017, 56, 'COMPANY_PROFILE_CONVERT_TO_PORTAL', 'System', '2021-03-14 16:37:55', NULL, NULL, NULL, NULL),
	(24, 1018, 1, 'ADDITIONAL_FIELDS_CREATE', 'System', '2021-03-14 16:37:55', NULL, NULL, NULL, NULL),
	(25, 1018, 4, 'ADDITIONAL_FIELDS_EDIT', 'System', '2021-03-14 16:37:55', NULL, NULL, NULL, NULL),
	(26, 1018, 5, 'ADDITIONAL_FIELDS_DELETE', 'System', '2021-03-14 16:37:55', NULL, NULL, NULL, NULL),
	(27, 1018, 13, 'ADDITIONAL_FIELDS_INACTIVATE', 'System', '2021-03-14 16:37:55', NULL, NULL, NULL, NULL),
	(28, 1018, 14, 'ADDITIONAL_FIELDS_ACTIVATE', 'System', '2021-03-14 16:37:55', NULL, NULL, NULL, NULL),
	(29, 1003, 1, 'AUTOMATION_CREATE', 'System', '2021-03-14 16:37:55', NULL, NULL, NULL, NULL),
	(30, 1003, 4, 'AUTOMATION_EDIT', 'System', '2021-03-14 16:37:55', NULL, NULL, NULL, NULL),
	(31, 1003, 5, 'AUTOMATION_DELETE', 'System', '2021-03-14 16:37:55', NULL, NULL, NULL, NULL),
	(32, 1003, 13, 'AUTOMATION_INACTIVATE', 'System', '2021-03-14 16:37:55', NULL, NULL, NULL, NULL),
	(33, 1003, 14, 'AUTOMATION_ACTIVATE', 'System', '2021-03-14 16:37:55', NULL, NULL, NULL, NULL),
	(34, 1003, 3, 'AUTOMATION_DETAIL_VIEW', 'System', '2021-03-14 16:37:55', NULL, NULL, NULL, NULL),
	(35, 1008, 1, 'ITEMS_CREATE', 'System', '2021-03-14 16:37:55', NULL, NULL, NULL, NULL),
	(36, 1008, 8, 'ITEMS_UPLOAD', 'System', '2021-03-14 16:37:55', NULL, NULL, NULL, NULL),
	(37, 1008, 4, 'ITEMS_EDIT', 'System', '2021-03-14 16:37:55', NULL, NULL, NULL, NULL),
	(38, 1008, 5, 'ITEMS_DELETE', 'System', '2021-03-14 16:37:55', NULL, NULL, NULL, NULL),
	(39, 1008, 13, 'ITEMS_INACTIVATE', 'System', '2021-03-14 16:37:55', NULL, NULL, NULL, NULL),
	(40, 1008, 14, 'ITEMS_ACTIVATE', 'System', '2021-03-14 16:37:55', NULL, NULL, NULL, NULL),
	(41, 1008, 3, 'ITEMS_DETAIL_VIEW', 'System', '2021-03-14 16:37:55', NULL, NULL, NULL, NULL),
	(42, 1009, 1, 'ACCOUNTS_CREATE', 'System', '2021-03-14 16:37:55', NULL, NULL, NULL, NULL),
	(43, 1009, 8, 'ACCOUNTS_UPLOAD', 'System', '2021-03-14 16:37:55', NULL, NULL, NULL, NULL),
	(44, 1009, 4, 'ACCOUNTS_EDIT', 'System', '2021-03-14 16:37:55', NULL, NULL, NULL, NULL),
	(45, 1009, 5, 'ACCOUNTS_DELETE', 'System', '2021-03-14 16:37:55', NULL, NULL, NULL, NULL),
	(46, 1009, 13, 'ACCOUNTS_INACTIVATE', 'System', '2021-03-14 16:37:55', NULL, NULL, NULL, NULL),
	(47, 1009, 14, 'ACCOUNTS_ACTIVATE', 'System', '2021-03-14 16:37:55', NULL, NULL, NULL, NULL),
	(48, 1009, 3, 'ACCOUNTS_DETAIL_VIEW', 'System', '2021-03-14 16:37:55', NULL, NULL, NULL, NULL),
	(55, 1004, 1, 'VENDORS_CREATE', 'System', '2021-03-14 16:37:55', NULL, NULL, NULL, NULL),
	(56, 1004, 57, 'VENDORS_SEND_VENDOR_INVITATION', 'System', '2021-03-14 16:37:55', NULL, NULL, NULL, NULL),
	(57, 1004, 8, 'VENDORS_UPLOAD', 'System', '2021-03-14 16:37:55', NULL, NULL, NULL, NULL),
	(58, 1004, 58, 'VENDORS_APPROVE_VENDOR_REQUEST', 'System', '2021-06-25 13:10:21', NULL, NULL, NULL, NULL),
	(59, 1004, 4, 'VENDORS_EDIT', 'System', '2021-03-14 16:37:55', NULL, NULL, NULL, NULL),
	(60, 1004, 3, 'VENDORS_DETAIL_VIEW', 'System', '2021-03-14 16:37:55', NULL, NULL, NULL, NULL),
	(61, 1019, 1, 'BILL_CREATE', 'System', '2021-03-14 16:37:55', NULL, NULL, NULL, NULL),
	(62, 1019, 59, 'BILL_PROCESS', 'System', '2021-03-14 16:37:55', NULL, NULL, NULL, NULL),
	(63, 1019, 4, 'BILL_EDIT', 'System', '2021-03-14 16:37:55', NULL, NULL, NULL, NULL),
	(64, 1019, 6, 'BILL_APPROVE', 'System', '2021-03-14 16:37:55', NULL, NULL, NULL, NULL),
	(65, 1019, 7, 'BILL_REJECT', 'System', '2021-03-14 16:37:55', NULL, NULL, NULL, NULL),
	(66, 1019, 60, 'BILL_QUICK_APPROVE', 'System', '2021-03-14 16:37:55', NULL, NULL, NULL, NULL),
	(67, 1019, 38, 'BILL_SKIP_APPROVAL', 'System', '2021-03-14 16:37:55', NULL, NULL, NULL, NULL),
	(68, 1019, 3, 'BILL_DETAIL_VIEW', 'System', '2021-03-14 16:37:55', NULL, NULL, NULL, NULL),
	(69, 1019, 10, 'BILL_VIEW_AUDIT_TRAIL', 'System', '2021-03-14 16:37:55', NULL, NULL, NULL, NULL),
	(70, 1019, 61, 'BILL_DOWNLOAD_BILL', 'System', '2021-03-14 16:37:55', NULL, NULL, NULL, NULL),
	(71, 1019, 62, 'BILL_APPLY_PAYMENT', 'System', '2021-03-14 16:37:55', NULL, NULL, NULL, NULL),
	(72, 1019, 63, 'BILL_VIEW_PAYMENTS', 'System', '2021-03-14 16:37:55', NULL, NULL, NULL, NULL),
	(73, 1019, 5, 'BILL_DELETE', 'System', '2021-03-14 16:37:55', NULL, NULL, NULL, NULL),
	(74, 1019, 47, 'BILL_CSV_EXPORT', 'System', '2021-03-14 16:37:55', NULL, NULL, NULL, NULL),
	(75, 1020, 1, 'BILL_PAYMENT_CREATE', 'System', '2021-03-14 16:37:55', NULL, NULL, NULL, NULL),
	(76, 1020, 8, 'BILL_PAYMENT_UPLOAD', 'System', '2021-03-14 16:37:55', NULL, NULL, NULL, NULL),
	(77, 1020, 64, 'BILL_PAYMENT_CHANGE_BILL', 'System', '2021-03-14 16:37:55', NULL, NULL, NULL, NULL),
	(78, 1020, 27, 'BILL_PAYMENT_MARK_AS_MAILED', 'System', '2021-03-14 16:37:55', NULL, NULL, NULL, NULL),
	(79, 1020, 28, 'BILL_PAYMENT_REVOKE_PAYMENT', 'System', '2021-03-14 16:37:55', NULL, NULL, NULL, NULL),
	(80, 1020, 3, 'BILL_PAYMENT_DETAIL_VIEW', 'System', '2021-03-14 16:37:55', NULL, NULL, NULL, NULL),
	(81, 1020, 65, 'BILL_PAYMENT_VIEW_BILLS', 'System', '2021-03-14 16:37:55', NULL, NULL, NULL, NULL),
	(82, 1020, 47, 'BILL_PAYMENT_CSV_EXPORT', 'System', '2021-03-14 16:37:55', NULL, NULL, NULL, NULL),
	(83, 1020, 39, 'BILL_PAYMENT_DOWNLOAD_RECEIPT', 'System', '2021-03-14 16:37:55', NULL, NULL, NULL, NULL),
	(84, 1021, 1, 'PURCHASE_ORDER_CREATE', 'System', '2021-03-14 16:37:55', NULL, NULL, NULL, NULL),
	(85, 1021, 4, 'PURCHASE_ORDER_EDIT', 'System', '2021-03-14 16:37:55', NULL, NULL, NULL, NULL),
	(86, 1021, 3, 'PURCHASE_ORDER_DETAIL_VIEW', 'System', '2021-03-14 16:37:55', NULL, NULL, NULL, NULL),
	(87, 1021, 5, 'PURCHASE_ORDER_DELETE', 'System', '2021-03-14 16:37:55', NULL, NULL, NULL, NULL),
	(88, 1021, 6, 'PURCHASE_ORDER_APPROVE', 'System', '2021-03-14 16:37:55', NULL, NULL, NULL, NULL),
	(89, 1021, 7, 'PURCHASE_ORDER_REJECT', 'System', '2021-03-14 16:37:55', NULL, NULL, NULL, NULL),
	(90, 1021, 10, 'PURCHASE_ORDER_VIEW_AUDIT_TRAIL', 'System', '2021-03-14 16:37:55', NULL, NULL, NULL, NULL),
	(91, 1021, 47, 'PURCHASE_ORDER_CSV_EXPORT', 'System', '2021-03-14 16:37:55', NULL, NULL, NULL, NULL),
	(92, 1021, 66, 'PURCHASE_ORDER_DOWNLOAD_REPORT', 'System', '2021-03-14 16:37:55', NULL, NULL, NULL, NULL),
	(93, 1021, 60, 'PURCHASE_ORDER_QUICK_APPROVE', 'System', '2021-03-14 16:37:55', NULL, NULL, NULL, NULL),
	(94, 1022, 1, 'PO_RECEIPT_CREATE', 'System', '2021-03-14 16:37:55', NULL, NULL, NULL, NULL),
	(95, 1022, 4, 'PO_RECEIPT_EDIT', 'System', '2021-03-14 16:37:55', NULL, NULL, NULL, NULL),
	(96, 1022, 3, 'PO_RECEIPT_DETAIL_VIEW', 'System', '2021-03-14 16:37:55', NULL, NULL, NULL, NULL),
	(97, 1022, 5, 'PO_RECEIPT_DELETE', 'System', '2021-03-14 16:37:55', NULL, NULL, NULL, NULL),
	(98, 1022, 67, 'PO_RECEIPT_ATTACH_TO_A_BILL', 'System', '2021-03-14 16:37:55', NULL, NULL, NULL, NULL),
	(99, 1022, 41, 'PO_RECEIPT_CLOSE_PO_RECEIPT', 'System', '2021-03-14 16:37:55', NULL, NULL, NULL, NULL),
	(100, 1022, 47, 'PO_RECEIPT_CSV_EXPORT', 'System', '2021-03-14 16:37:55', NULL, NULL, NULL, NULL),
	(101, 1022, 66, 'PO_RECEIPT_DOWNLOAD_REPORT', 'System', '2021-03-14 16:37:55', NULL, NULL, NULL, NULL),
	(102, 1007, 1, 'EXPENSES_CREATE', 'System', '2021-03-14 16:37:55', NULL, NULL, NULL, NULL),
	(103, 1007, 4, 'EXPENSES_EDIT', 'System', '2021-03-14 16:37:55', NULL, NULL, NULL, NULL),
	(104, 1007, 5, 'EXPENSES_DELETE', 'System', '2021-03-14 16:37:55', NULL, NULL, NULL, NULL),
	(105, 1007, 6, 'EXPENSES_APPROVE', 'System', '2021-03-14 16:37:55', NULL, NULL, NULL, NULL),
	(106, 1007, 7, 'EXPENSES_REJECT', 'System', '2021-03-14 16:37:55', NULL, NULL, NULL, NULL),
	(107, 1007, 10, 'EXPENSES_VIEW_AUDIT_TRAIL', 'System', '2021-03-14 16:37:55', NULL, NULL, NULL, NULL),
	(108, 1007, 66, 'EXPENSES_DOWNLOAD_REPORT', 'System', '2021-03-14 16:37:55', NULL, NULL, NULL, NULL),
	(109, 1007, 68, 'EXPENSES_VIEW_REPORT', 'System', '2021-03-14 16:37:55', NULL, NULL, NULL, NULL),
	(110, 1007, 47, 'EXPENSES_CSV_EXPORT', 'System', '2021-03-14 16:37:55', NULL, NULL, NULL, NULL),
	(111, 1007, 60, 'EXPENSES_QUICK_APPROVE', 'System', '2021-03-14 16:37:55', NULL, NULL, NULL, NULL),
	(112, 1010, 1, 'PROJECT_CODES_CREATE', 'System', '2021-03-14 16:37:55', NULL, NULL, NULL, NULL),
	(113, 1010, 4, 'PROJECT_CODES_EDIT', 'System', '2021-03-14 16:37:55', NULL, NULL, NULL, NULL),
	(114, 1010, 5, 'PROJECT_CODES_DELETE', 'System', '2021-03-14 16:37:55', NULL, NULL, NULL, NULL),
	(115, 1010, 13, 'PROJECT_CODES_INACTIVATE', 'System', '2021-03-14 16:37:55', NULL, NULL, NULL, NULL),
	(116, 1010, 14, 'PROJECT_CODES_ACTIVATE', 'System', '2021-03-14 16:37:55', NULL, NULL, NULL, NULL),
	(117, 1010, 8, 'PROJECT_CODES_UPLOAD', 'System', '2021-03-14 16:37:55', NULL, NULL, NULL, NULL),
	(118, 1010, 47, 'PROJECT_CODES_CSV_EXPORT', 'System', '2021-03-14 16:37:55', NULL, NULL, NULL, NULL),
	(119, 1019, 40, 'BILL_OVERRIDE_APPROVAL', 'System', '2021-03-16 17:16:59', NULL, NULL, NULL, NULL),
	(120, 1021, 40, 'PURCHASE_ORDER_OVERRIDE_APPROVAL', 'System', '2021-03-16 17:17:02', NULL, NULL, NULL, NULL),
	(121, 1007, 40, 'EXPENSES_OVERRIDE_APPROVAL', 'System', '2021-03-16 17:17:05', NULL, NULL, NULL, NULL),
	(339, 1019, 17, 'BILL_UNDO_ACTION', 'System', '2021-03-31 16:11:30', NULL, NULL, NULL, NULL),
	(340, 1021, 16, 'PURCHASE_ORDER_CHANGE_ASSIGNEE', 'System', '2021-03-31 16:14:05', NULL, NULL, NULL, NULL),
	(341, 1021, 17, 'PURCHASE_ORDER_UNDO_ACTION', 'System', '2021-03-31 16:14:46', NULL, NULL, NULL, NULL),
	(342, 1007, 16, 'EXPENSES_CHANGE_ASSIGNEE', 'System', '2021-03-31 16:18:31', NULL, NULL, NULL, NULL),
	(343, 1007, 17, 'EXPENSES_UNDO_ACTION', 'System', '2021-03-31 16:19:06', NULL, NULL, NULL, NULL),
	(344, 1007, 38, 'EXPENSES_SKIP_APPROVAL', 'System', '2021-04-01 13:42:36', NULL, NULL, NULL, NULL),
	(350, 1022, 42, 'PO_RECEIPT_GENERATE_AN_INVOICE', 'System', '2021-04-01 13:56:41', NULL, NULL, NULL, NULL),
	(351, 1021, 42, 'PURCHASE_ORDER_CREATE_BILL', 'System', '2021-04-01 14:01:35', NULL, NULL, NULL, NULL),
	(353, 1024, 3, 'SYNC_DASHBORD_DETAIL_VIEW', 'System', '2021-04-06 07:01:01', NULL, NULL, NULL, NULL),
	(354, 1000, 71, 'DASHBOARD_SHOW_VENDOR_REQUEST_CARD', 'System', '2021-04-13 15:22:51', NULL, NULL, NULL, NULL),
	(355, 1000, 72, 'DASHBOARD_SHOW_PENDING_AND_REJECTED_BILLS_CARD', 'System', '2021-04-13 15:22:51', NULL, NULL, NULL, NULL),
	(356, 1000, 73, 'DASHBOARD_SHOW_PENDING_AND_REJECTED_PO_CARD', 'System', '2021-04-13 15:22:51', NULL, NULL, NULL, NULL),
	(357, 1000, 74, 'DASHBOARD_SHOW_PENDING_AND_REJECTED_EXPENSE_CARD', 'System', '2021-04-13 15:22:51', NULL, NULL, NULL, NULL),
	(358, 1000, 75, 'DASHBOARD_SHOW_MONTHLY_TRANSACTION_SUMMARY_CHART', 'System', '2021-04-13 15:22:51', NULL, NULL, NULL, NULL),
	(359, 1000, 76, 'DASHBOARD_SHOW_MONTHLY_BILLS_AND_PAYMENT_SUMMARY_CHART', 'System', '2021-04-13 15:22:51', NULL, NULL, NULL, NULL),
	(360, 1019, 77, 'BILL_SAVE_AS_APPROVED', 'System', '2021-04-20 12:26:34', NULL, NULL, NULL, NULL),
	(361, 1021, 77, 'PURCHASE_ORDER_SAVE_AS_APPROVED', 'System', '2021-04-20 12:27:19', NULL, NULL, NULL, NULL),
	(362, 1007, 77, 'EXPENSE_SAVE_AS_APPROVED', 'System', '2021-04-20 12:28:02', NULL, NULL, NULL, NULL),
	(363, 1025, 68, 'VIEW_REPORT_SHOW_REPORTS', 'System', '2021-05-11 14:14:23', NULL, NULL, NULL, NULL),
	(374, 1000, 78, 'DASHBOARD_SHOW_DISCOUNT_APPLICABLE_BILL_TABLE', 'System', '2021-05-21 02:17:33', NULL, NULL, NULL, NULL),
	(375, 1004, 79, 'VENDORS_ADD_TO_LOCAL_VENDOR_LIST', 'System', '2021-06-25 13:10:21', NULL, NULL, NULL, NULL),
	(376, 1011, 5, 'USERS_DELETE', 'System', '2021-06-11 13:30:32', NULL, NULL, NULL, NULL),
	(377, 1021, 70, 'PURCHASE_ORDER_SEND_VENDOR_APPROVAL', 'System', '2021-05-21 21:32:36', NULL, NULL, NULL, NULL),
	(378, 1027, 1, 'PO_NUMBER_CONFIGURATION_CREATE', 'System', '2021-06-14 21:41:05', NULL, NULL, NULL, NULL),
	(379, 1027, 2, 'PO_NUMBER_CONFIGURATION_SEARCH', 'System', '2021-06-14 21:41:57', NULL, NULL, NULL, NULL),
	(380, 1027, 4, 'PO_NUMBER_CONFIGURATION_EDIT', 'System', '2021-06-14 21:42:42', NULL, NULL, NULL, NULL),
	(381, 1027, 5, 'PO_NUMBER_CONFIGURATION_DELETE', 'System', '2021-06-14 21:43:22', NULL, NULL, NULL, NULL),
	(382, 1019, 16, 'BILL_CHANGE_ASSIGNEE', 'System', '2021-06-15 13:48:00', NULL, NULL, NULL, NULL),
	(383, 1007, 3, 'EXPENSES_DETAIL_VIEW', 'System', '2021-06-15 13:48:00', NULL, NULL, NULL, NULL),
	(384, 1004, 5, 'VENDORS_DELETE', 'System', '2021-06-23 14:42:54', NULL, NULL, NULL, NULL),
	(385, 1004, 80, 'VENDORS_RESEND_VENDOR_INVITATION', 'System', '2021-06-23 14:55:32', NULL, NULL, NULL, NULL),
	(386, 1004, 81, 'VENDORS_DELETE_VENDOR_INVITATION', 'System', '2021-06-23 14:56:06', NULL, NULL, NULL, NULL),
	(387, 1004, 82, 'VENDORS_REJECT_VENDOR_REQUEST', 'System', '2021-06-23 01:40:30', NULL, NULL, NULL, NULL),
	(388, 1004, 83, 'VENDORS_DELETE_VENDOR_REQUEST', 'System', '2021-06-23 15:08:00', NULL, NULL, NULL, NULL),
	(391, 1022, 45, 'PO_RECEIPT_RE_OPEN_PO_RECEIPT', 'System', '2021-07-07 19:59:00', NULL, NULL, NULL, NULL),
	(392, 1000, 84, 'SHOW_BILLS_AWAITING_YOUR_APPROVAL_TABLE', 'System', '2021-08-06 17:06:25', NULL, NULL, NULL, NULL),
	(393, 1000, 85, 'SHOW_PO_AWAITING_YOUR_APPROVAL_TABLE', 'System', '2021-08-06 17:07:33', NULL, NULL, NULL, NULL),
	(394, 1000, 86, 'SHOW_EXPENSES_AWAITING_YOUR_APPROVAL_TABLE', 'System', '2021-08-06 17:08:06', NULL, NULL, NULL, NULL),
	(396, 1029, 1, 'PAYMENT_CREATE', 'System', '2021-08-18 15:05:52', NULL, NULL, NULL, NULL),
	(399, 1028, 91, 'CONTACT_SUPPORT_TEAM', 'System', '2021-08-23 10:26:16', NULL, NULL, NULL, NULL),
	(400, 1028, 92, 'CONFIGURE_PAYMENT_ACTION', 'System', '2021-08-23 10:31:55', NULL, NULL, NULL, NULL),
	(401, 1029, 3, 'PAYMENT_DETAIL_VIEW', 'System', '2021-09-02 10:53:27', NULL, NULL, NULL, NULL),
	(402, 1029, 6, 'PAYMENT_APPROVE', 'System', '2021-09-02 10:53:52', NULL, NULL, NULL, NULL),
	(403, 1029, 7, 'PAYMENT_REJECT', 'System', '2021-09-02 10:54:15', NULL, NULL, NULL, NULL),
	(404, 1029, 11, 'PAYMENT_SUBMIT', 'System', '2021-09-02 10:54:48', NULL, NULL, NULL, NULL),
	(405, 1029, 93, 'PAYMENT_PAY_NOW', 'System', '2021-09-02 10:55:40', NULL, NULL, NULL, NULL),
	(406, 1029, 94, 'PAYMENT_MAKE_AN_OFFLINE_PAYMENT', 'System', '2021-09-02 11:00:33', NULL, NULL, NULL, NULL),
	(407, 1029, 95, 'PAYMENT_SCHEDULE_PAYMENT', 'System', '2021-09-02 11:00:58', NULL, NULL, NULL, NULL),
	(408, 1029, 96, 'PAYMENT_CANCEL_BATCH_PAYMENT', 'System', '2021-09-02 11:01:31', NULL, NULL, NULL, NULL),
	(409, 1029, 40, 'PAYMENT_OVERRIDE_APPROVAL', 'System', '2021-09-02 11:27:38', NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `umm_menu_privilage` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.umm_privilages
DROP TABLE IF EXISTS `umm_privilages`;
CREATE TABLE IF NOT EXISTS `umm_privilages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(250) NOT NULL DEFAULT '',
  `text` varchar(250) NOT NULL DEFAULT '',
  `auth_code` varchar(50) NOT NULL,
  `created_by` varchar(100) NOT NULL DEFAULT '',
  `created_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `update_by` varchar(100) DEFAULT NULL,
  `update_on` datetime DEFAULT NULL,
  `delete_by` varchar(100) DEFAULT NULL,
  `delete_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=latin1;

-- Dumping data for table papertrl_default_script.umm_privilages: ~82 rows (approximately)
/*!40000 ALTER TABLE `umm_privilages` DISABLE KEYS */;
INSERT INTO `umm_privilages` (`id`, `url`, `text`, `auth_code`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES
	(1, 'Create', 'Create', 'CREATE', 'System', '2021-02-03 22:33:35', NULL, NULL, NULL, NULL),
	(2, 'Search', 'Search', 'SEARCH', 'System', '2021-02-03 22:33:35', NULL, NULL, NULL, NULL),
	(3, 'Detail View', 'Detail View', 'DETAIL_VIEW', 'System', '2021-02-03 22:33:35', NULL, NULL, NULL, NULL),
	(4, 'Edit', 'Edit', 'EDIT', 'System', '2021-02-03 22:33:35', NULL, NULL, NULL, NULL),
	(5, 'Delete', 'Delete', 'DELETE', 'System', '2021-02-03 22:33:35', NULL, NULL, NULL, NULL),
	(6, 'Approve', 'Approve', 'APPROVE', 'System', '2021-02-03 22:33:35', NULL, NULL, NULL, NULL),
	(7, 'Reject', 'Reject', 'REJECT', 'System', '2021-02-03 22:33:35', NULL, NULL, NULL, NULL),
	(8, 'Upload', 'Upload', 'UPLOAD', 'System', '2021-02-03 22:33:35', NULL, NULL, NULL, NULL),
	(10, 'View Audit Trail', 'View Audit Trail', 'VIEW_AUDIT_TRAIL', 'System', '2021-02-03 22:33:35', NULL, NULL, NULL, NULL),
	(11, 'Submit', 'Submit', 'SUBMIT', 'System', '2021-02-03 22:33:35', NULL, NULL, NULL, NULL),
	(12, 'Re-Submit', 'Re-Submit', 'RE_SUBMIT', 'System', '2021-02-03 22:33:35', NULL, NULL, NULL, NULL),
	(13, 'Inactivate', 'Inactivate', 'INACTIVATE', 'System', '2021-02-03 22:33:35', NULL, NULL, NULL, NULL),
	(14, 'Activate', 'Activate', 'ACTIVATE', 'System', '2021-02-03 22:33:35', NULL, NULL, NULL, NULL),
	(15, 'Reset Password', 'Reset Password', 'RESET_PASSWORD', 'System', '2021-02-03 22:33:35', NULL, NULL, NULL, NULL),
	(16, 'Change Assignee', 'Change Assignee', 'CHANGE_ASSIGNEE', 'System', '2021-03-31 18:25:29', NULL, NULL, NULL, NULL),
	(17, 'Undo Last Action', 'Undo Last Action', 'UNDO_ACTION', 'System', '2021-03-31 18:25:29', NULL, NULL, NULL, NULL),
	(22, 'System Shortcuts', 'System Shortcuts', 'SYSTEM_SHORTCUTS', 'System', '2021-02-03 22:33:35', NULL, NULL, NULL, NULL),
	(23, 'Invoice Summary ', 'Invoice Summary ', 'INVOICE_SUMMARY ', 'System', '2021-02-03 22:33:35', NULL, NULL, NULL, NULL),
	(24, 'Accumulated Invoice Summary ', 'Accumulated Invoice Summary ', 'ACCUMULATED_INVOICE_SUMMARY ', 'System', '2021-02-03 22:33:35', NULL, NULL, NULL, NULL),
	(25, 'Invoice Approval', 'Invoice Approval', 'INVOICE_APPROVAL', 'System', '2021-02-03 22:33:35', NULL, NULL, NULL, NULL),
	(26, 'Change Invoice', 'Change Invoice', 'CHANGE_INVOICE', 'System', '2021-02-03 22:33:35', NULL, NULL, NULL, NULL),
	(27, 'Mark As Mailed', 'Mark As Mailed', 'MARK_AS_MAILED', 'System', '2021-02-03 22:33:35', NULL, NULL, NULL, NULL),
	(28, 'Void Payment', 'Void Payment', 'REVOKE_PAYMENT', 'System', '2021-02-12 00:08:43', NULL, NULL, NULL, NULL),
	(29, 'Check Sync', 'Check Sync', 'CHECK_SYNC', 'System', '2021-02-03 22:33:35', NULL, NULL, NULL, NULL),
	(30, 'Vendor Sync', 'Vendor Sync', 'VENDOR_SYNC', 'System', '2021-02-03 22:33:35', NULL, NULL, NULL, NULL),
	(31, 'Change Auto Sync Status', 'Change Auto Sync Status', 'CHANGE_AUTO_SYNC_STATUS', 'System', '2021-02-03 22:33:35', NULL, NULL, NULL, NULL),
	(32, 'View Check Sync History', 'View Check Sync History', 'VIEW_CHECK_SYNC_HISTORY', 'System', '2021-02-03 22:33:35', NULL, NULL, NULL, NULL),
	(33, 'View Vendor Sync History', 'View Vendor Sync History', 'VIEW_VENDOR_SYNC_HISTORY', 'System', '2021-02-03 22:33:35', NULL, NULL, NULL, NULL),
	(34, 'View Discount Applicable Invoices', 'View Discount Applicable Invoices', 'VIEW_DISCOUNT_APPLICABLE_INVOICES', 'System', '2021-02-03 22:33:35', NULL, NULL, NULL, NULL),
	(35, 'View Invoice', 'View Invoice', 'VIEW_INVOICE', 'System', '2021-02-03 22:33:35', NULL, NULL, NULL, NULL),
	(37, 'Change Package', 'Change Package', 'CHANGE_PACKAGE', 'System', '2021-02-03 22:33:35', NULL, NULL, NULL, NULL),
	(38, 'Skip Approval', 'Skip Approval', 'SKIP_APPROVAL', 'System', '2021-02-03 22:33:35', NULL, NULL, NULL, NULL),
	(39, 'Download Receipt', 'Download Receipt', 'DOWNLOAD_RECEIPT', 'System', '2021-02-03 22:33:35', NULL, NULL, NULL, NULL),
	(40, 'Override Approval', 'Override Approval', 'OVERRIDE_APPROVAL', 'System', '2021-02-03 22:33:35', NULL, NULL, NULL, NULL),
	(41, 'Close PO Receipt', 'Close PO Receipt', 'CLOSE_PO_RECEIPT', 'System', '2021-02-03 22:33:35', NULL, NULL, NULL, NULL),
	(42, 'Create Bill', 'Create Bill', 'CREATE_BILL', 'System', '2021-04-01 08:54:21', NULL, NULL, NULL, NULL),
	(43, 'Edit Description', 'Edit Description', 'EDIT_DESCRIPTION', 'System', '2021-02-03 22:33:35', NULL, NULL, NULL, NULL),
	(44, 'Generate Detailed Report', 'Generate Detailed Report', 'GENERATE_DETAILED_REPORT', 'System', '2021-02-03 22:33:35', NULL, NULL, NULL, NULL),
	(45, 'Re-open PO Receipt', 'Re-open PO Receipt', 'RE_OPEN_PO_RECEIPT', 'System', '2021-04-01 08:54:21', NULL, NULL, NULL, NULL),
	(46, 'Download Invoice', 'Download Invoice', 'DOWNLOAD_INVOICE', 'System', '2021-02-03 22:33:35', NULL, NULL, NULL, NULL),
	(47, 'CSV Export', 'CSV Export', 'CSV_EXPORT', 'System', '2021-02-03 22:33:35', NULL, NULL, NULL, NULL),
	(48, 'CSV Import', 'CSV Import', 'CSV_IMPORT', 'System', '2021-02-03 22:33:35', NULL, NULL, NULL, NULL),
	(50, 'Approve Permission Request', 'Approve Permission Request', 'APPROVE_PERMISSION_REQUEST', 'System', '2021-02-03 22:33:35', NULL, NULL, NULL, NULL),
	(51, 'Reject Permission Request', 'RejectPermission Request', 'REJECTPERMISSION_REQUEST', 'System', '2021-02-03 22:33:35', NULL, NULL, NULL, NULL),
	(54, 'Add Vendor', 'Add Vendor', 'ADD_VENDOR', 'System', '2021-02-03 22:33:35', NULL, NULL, NULL, NULL),
	(55, 'Unlock', 'Unlock', 'UNLOCK', 'System', '2021-02-11 22:23:37', NULL, NULL, NULL, NULL),
	(56, 'Convert To Agency Portal', 'Convert To Agency Portal', 'CONVERT_TO_PORTAL', 'System', '2021-02-11 22:41:46', NULL, NULL, NULL, NULL),
	(57, 'Send An Invitation', 'Send An Invitation', 'SEND_VENDOR_INVITATION', 'System', '2021-06-25 13:10:21', NULL, NULL, NULL, NULL),
	(58, 'Approve Vendor Request', 'Approve Vendor Request', 'APPROVE_VENDOR_REQUEST', 'System', '2021-06-25 13:10:21', NULL, NULL, NULL, NULL),
	(59, 'Process', 'Process', 'PROCESS', 'System', '2021-02-11 23:51:24', NULL, NULL, NULL, NULL),
	(60, 'Quick Approve', 'Quick Approve', 'QUICK_APPROVE', 'System', '2021-02-11 23:53:21', NULL, NULL, NULL, NULL),
	(61, 'Download Bill', 'Download Bill', 'DOWNLOAD_BILL', 'System', '2021-02-11 23:59:44', NULL, NULL, NULL, NULL),
	(62, 'Apply Payments', 'Apply Payments', 'APPLY_PAYMENT', 'System', '2021-02-12 00:01:00', NULL, NULL, NULL, NULL),
	(63, 'View Payments', 'View Payments', 'VIEW_PAYMENTS', 'System', '2021-02-12 00:01:26', NULL, NULL, NULL, NULL),
	(64, 'Change Bill', 'Change Bill', 'CHANGE_BILL', 'System', '2021-02-12 00:06:22', NULL, NULL, NULL, NULL),
	(65, 'View Bills', 'View Bills', 'VIEW_BILLS', 'System', '2021-02-12 00:09:06', NULL, NULL, NULL, NULL),
	(66, 'Download Report', 'Download Report', 'DOWNLOAD_REPORT', 'System', '2021-02-12 00:18:06', NULL, NULL, NULL, NULL),
	(67, 'Attach To a Bill', 'Attach To a Bill', 'ATTACH_TO_A_BILL', 'System', '2021-02-12 00:23:04', NULL, NULL, NULL, NULL),
	(68, 'View Report', 'View Report', 'VIEW_REPORT', 'System', '2021-02-12 00:32:30', NULL, NULL, NULL, NULL),
	(70, 'Send to Vendor Approval', 'Send to Vendor Approval', 'SEND_VENDOR_APPROVAL', 'System', '2021-04-01 13:51:25', NULL, NULL, NULL, NULL),
	(71, 'Show Vendor Request Card', 'Show Vendor Request Card', 'SHOW_VENDOR_REQUEST_CARD', 'System', '2021-04-13 15:16:13', NULL, NULL, NULL, NULL),
	(72, 'Show Pending and Rejected Bills Card', 'Show Pending and Rejected Bills Card', 'SHOW_PENDING_AND_REJECTED_BILLS_CARD', 'System', '2021-04-13 15:17:02', NULL, NULL, NULL, NULL),
	(73, 'Show Pending and Rejected PO Card', 'Show Pending and Rejected PO Card', 'SHOW_PENDING_AND_REJECTED_PO_CARD', 'System', '2021-04-13 15:18:58', NULL, NULL, NULL, NULL),
	(74, 'Show Pending and Rejected Expense Card', 'Show Pending and Rejected Expense Card', 'SHOW_PENDING_AND_REJECTED_EXPENSE_CARD', 'System', '2021-04-13 15:19:38', NULL, NULL, NULL, NULL),
	(75, 'Show Monthly Transaction Summary Chart', 'Show Monthly Transaction Summary Chart', 'SHOW_MONTHLY_TRANSACTION_SUMMARY_CHART', 'System', '2021-04-13 15:20:43', NULL, NULL, NULL, NULL),
	(76, 'Show Monthly Bills and Payment Summary Chart', 'Show Monthly Bills and Payment Summary Chart', 'SHOW_MONTHLY_BILLS_AND_PAYMENT_SUMMARY_CHART', 'System', '2021-04-13 15:21:36', NULL, NULL, NULL, NULL),
	(77, 'Save as Approved', 'Save as Approved', 'SAVE_AS_APPROVED', 'System', '2021-04-20 12:23:27', NULL, NULL, NULL, NULL),
	(78, 'Show Discount Applicable Bill Table', 'Show Discount Applicable Bill Table', 'SHOW_DISCOUNT_APPLICABLE_BILL_TABLE', 'System', '2021-04-20 12:23:27', NULL, NULL, NULL, NULL),
	(79, 'Add To Local Vendor List', 'Add To Local Vendor List', 'ADD_TO_LOCAL_VENDOR_LIST', 'System', '2021-06-25 13:10:21', NULL, NULL, NULL, NULL),
	(80, 'Resend An Invitation', 'Resend An Invitation', 'RESEND_VENDOR_INVITATION', 'System', '2021-06-23 01:44:07', NULL, NULL, NULL, NULL),
	(81, 'Delete An Invitation', 'Delete An Invitation', 'DELETE_VENDOR_INVITATION', 'System', '2021-06-23 01:44:09', NULL, NULL, NULL, NULL),
	(82, 'Reject Vendor Request', 'Reject Vendor Request', 'REJECT_VENDOR_REQUEST', 'System', '2021-06-23 01:44:12', NULL, NULL, NULL, NULL),
	(83, 'Delete Vendor Request', 'Delete Vendor Request', 'DELETE_VENDOR_REQUEST', 'System', '2021-06-23 01:44:17', NULL, NULL, NULL, NULL),
	(84, 'Show Bills Awaiting Your Approval Table', 'Show Bills Awaiting Your Approval Table', 'SHOW_BILLS_AWAITING_YOUR_APPROVAL_TABLE', 'System', '2021-08-06 17:02:24', NULL, NULL, NULL, NULL),
	(85, 'Show POS Awaiting Your Approval Table', 'Show POs Awaiting Your Approval Table', 'SHOW_PO_AWAITING_YOUR_APPROVAL_TABLE', 'System', '2021-08-06 17:03:15', NULL, NULL, NULL, NULL),
	(86, 'Show Expense Reports Awaiting Your Approval Table', 'Show Expense Reports Awaiting Your Approval Table', 'SHOW_EXPENSES_AWAITING_YOUR_APPROVAL_TABLE', 'System', '2021-08-06 17:04:39', NULL, NULL, NULL, NULL),
	(91, 'Contact Support Team', 'Contact Support Team', 'CONTACT_SUPPORT_TEAM', 'System', '2021-08-23 09:55:07', NULL, NULL, NULL, NULL),
	(92, 'Configure Payment', 'Configure Payment', 'CONFIGURE_PAYMENT_ACTION', 'System', '2021-08-23 10:31:10', NULL, NULL, NULL, NULL),
	(93, 'Pay Now', 'Pay Now', 'PAY_NOW', 'System', '2021-09-02 09:43:40', NULL, NULL, NULL, NULL),
	(94, 'Make an Offline Payment', 'Make an Offline Payment', 'MAKE_AN_OFFLINE_PAYMENT', 'System', '2021-09-02 09:44:21', NULL, NULL, NULL, NULL),
	(95, 'Schedule Payment', 'Schedule Payment', 'SCHEDULE_PAYMENT', 'System', '2021-09-02 09:45:47', NULL, NULL, NULL, NULL),
	(96, 'Cancel Batch Payment', 'Cancel Batch Payment', 'CANCEL_BATCH_PAYMENT', 'System', '2021-09-02 09:46:42', NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `umm_privilages` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.umm_role_field_config
DROP TABLE IF EXISTS `umm_role_field_config`;
CREATE TABLE IF NOT EXISTS `umm_role_field_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `field_id` int(11) NOT NULL,
  `sub_account_id` int(11) DEFAULT NULL,
  `created_by` varchar(100) NOT NULL,
  `created_on` datetime NOT NULL,
  `update_by` varchar(100) DEFAULT NULL,
  `update_on` datetime DEFAULT NULL,
  `delete_by` varchar(100) DEFAULT NULL,
  `delete_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ROLE_ID_FK_7` (`role_id`),
  KEY `FIELD_ID_FK_7` (`field_id`),
  CONSTRAINT `FIELD_ID_FK_7` FOREIGN KEY (`field_id`) REFERENCES `common_automation_field` (`id`),
  CONSTRAINT `ROLE_ID_FK_7` FOREIGN KEY (`role_id`) REFERENCES `umm_role_mst` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table papertrl_default_script.umm_role_field_config: ~0 rows (approximately)
/*!40000 ALTER TABLE `umm_role_field_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `umm_role_field_config` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.umm_role_mst
DROP TABLE IF EXISTS `umm_role_mst`;
CREATE TABLE IF NOT EXISTS `umm_role_mst` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `status` varchar(5) NOT NULL DEFAULT '',
  `vendor_id` int(11) DEFAULT NULL,
  `created_by` varchar(100) NOT NULL DEFAULT '',
  `created_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `update_by` varchar(100) DEFAULT '',
  `update_on` datetime DEFAULT '0000-00-00 00:00:00',
  `delete_by` varchar(100) DEFAULT NULL,
  `delete_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

-- Dumping data for table papertrl_default_script.umm_role_mst: ~0 rows (approximately)
/*!40000 ALTER TABLE `umm_role_mst` DISABLE KEYS */;
INSERT INTO `umm_role_mst` (`id`, `name`, `status`, `vendor_id`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES
	(1, 'System Admin Role', 'A', NULL, 'admin', '2021-03-29 22:43:59', NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `umm_role_mst` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.umm_role_previlege
DROP TABLE IF EXISTS `umm_role_previlege`;
CREATE TABLE IF NOT EXISTS `umm_role_previlege` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `privilege_id` int(11) NOT NULL,
  `sub_account_id` int(11) DEFAULT NULL,
  `created_by` varchar(100) NOT NULL,
  `created_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `update_by` varchar(100) DEFAULT NULL,
  `update_on` datetime DEFAULT NULL,
  `delete_by` varchar(100) DEFAULT NULL,
  `delete_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `menu_id_for_role` (`privilege_id`) USING BTREE,
  KEY `menu_role_id` (`role_id`) USING BTREE,
  CONSTRAINT `umm_role_previlege_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `umm_role_mst` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2471 DEFAULT CHARSET=latin1;

-- Dumping data for table papertrl_default_script.umm_role_previlege: ~179 rows (approximately)
/*!40000 ALTER TABLE `umm_role_previlege` DISABLE KEYS */;
INSERT INTO `umm_role_previlege` (`id`, `role_id`, `privilege_id`, `sub_account_id`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES
	(2292, 1, 1014, NULL, 'admin', '2021-08-10 12:13:23', NULL, NULL, NULL, NULL),
	(2293, 1, 1000, NULL, 'admin', '2021-08-10 12:13:23', NULL, NULL, NULL, NULL),
	(2294, 1, 354, NULL, 'admin', '2021-08-10 12:13:23', NULL, NULL, NULL, NULL),
	(2295, 1, 355, NULL, 'admin', '2021-08-10 12:13:23', NULL, NULL, NULL, NULL),
	(2296, 1, 356, NULL, 'admin', '2021-08-10 12:13:23', NULL, NULL, NULL, NULL),
	(2297, 1, 357, NULL, 'admin', '2021-08-10 12:13:23', NULL, NULL, NULL, NULL),
	(2298, 1, 358, NULL, 'admin', '2021-08-10 12:13:23', NULL, NULL, NULL, NULL),
	(2299, 1, 359, NULL, 'admin', '2021-08-10 12:13:23', NULL, NULL, NULL, NULL),
	(2300, 1, 374, NULL, 'admin', '2021-08-10 12:13:23', NULL, NULL, NULL, NULL),
	(2301, 1, 392, NULL, 'admin', '2021-08-10 12:13:23', NULL, NULL, NULL, NULL),
	(2302, 1, 393, NULL, 'admin', '2021-08-10 12:13:23', NULL, NULL, NULL, NULL),
	(2303, 1, 394, NULL, 'admin', '2021-08-10 12:13:23', NULL, NULL, NULL, NULL),
	(2304, 1, 1009, NULL, 'admin', '2021-08-10 12:13:23', NULL, NULL, NULL, NULL),
	(2305, 1, 42, NULL, 'admin', '2021-08-10 12:13:23', NULL, NULL, NULL, NULL),
	(2306, 1, 43, NULL, 'admin', '2021-08-10 12:13:23', NULL, NULL, NULL, NULL),
	(2307, 1, 44, NULL, 'admin', '2021-08-10 12:13:23', NULL, NULL, NULL, NULL),
	(2308, 1, 45, NULL, 'admin', '2021-08-10 12:13:23', NULL, NULL, NULL, NULL),
	(2309, 1, 46, NULL, 'admin', '2021-08-10 12:13:23', NULL, NULL, NULL, NULL),
	(2310, 1, 47, NULL, 'admin', '2021-08-10 12:13:23', NULL, NULL, NULL, NULL),
	(2311, 1, 48, NULL, 'admin', '2021-08-10 12:13:23', NULL, NULL, NULL, NULL),
	(2312, 1, 1008, NULL, 'admin', '2021-08-10 12:13:23', NULL, NULL, NULL, NULL),
	(2313, 1, 35, NULL, 'admin', '2021-08-10 12:13:23', NULL, NULL, NULL, NULL),
	(2314, 1, 36, NULL, 'admin', '2021-08-10 12:13:23', NULL, NULL, NULL, NULL),
	(2315, 1, 37, NULL, 'admin', '2021-08-10 12:13:23', NULL, NULL, NULL, NULL),
	(2316, 1, 38, NULL, 'admin', '2021-08-10 12:13:23', NULL, NULL, NULL, NULL),
	(2317, 1, 39, NULL, 'admin', '2021-08-10 12:13:23', NULL, NULL, NULL, NULL),
	(2318, 1, 40, NULL, 'admin', '2021-08-10 12:13:23', NULL, NULL, NULL, NULL),
	(2319, 1, 41, NULL, 'admin', '2021-08-10 12:13:23', NULL, NULL, NULL, NULL),
	(2320, 1, 1024, NULL, 'admin', '2021-08-10 12:13:23', NULL, NULL, NULL, NULL),
	(2321, 1, 353, NULL, 'admin', '2021-08-10 12:13:23', NULL, NULL, NULL, NULL),
	(2322, 1, 1003, NULL, 'admin', '2021-08-10 12:13:23', NULL, NULL, NULL, NULL),
	(2323, 1, 29, NULL, 'admin', '2021-08-10 12:13:23', NULL, NULL, NULL, NULL),
	(2324, 1, 30, NULL, 'admin', '2021-08-10 12:13:23', NULL, NULL, NULL, NULL),
	(2325, 1, 31, NULL, 'admin', '2021-08-10 12:13:23', NULL, NULL, NULL, NULL),
	(2326, 1, 32, NULL, 'admin', '2021-08-10 12:13:23', NULL, NULL, NULL, NULL),
	(2327, 1, 33, NULL, 'admin', '2021-08-10 12:13:23', NULL, NULL, NULL, NULL),
	(2328, 1, 34, NULL, 'admin', '2021-08-10 12:13:23', NULL, NULL, NULL, NULL),
	(2329, 1, 1001, NULL, 'admin', '2021-08-10 12:13:23', NULL, NULL, NULL, NULL),
	(2330, 1, 1011, NULL, 'admin', '2021-08-10 12:13:23', NULL, NULL, NULL, NULL),
	(2331, 1, 1, NULL, 'admin', '2021-08-10 12:13:23', NULL, NULL, NULL, NULL),
	(2332, 1, 3, NULL, 'admin', '2021-08-10 12:13:23', NULL, NULL, NULL, NULL),
	(2333, 1, 4, NULL, 'admin', '2021-08-10 12:13:23', NULL, NULL, NULL, NULL),
	(2334, 1, 5, NULL, 'admin', '2021-08-10 12:13:23', NULL, NULL, NULL, NULL),
	(2335, 1, 6, NULL, 'admin', '2021-08-10 12:13:23', NULL, NULL, NULL, NULL),
	(2336, 1, 7, NULL, 'admin', '2021-08-10 12:13:23', NULL, NULL, NULL, NULL),
	(2337, 1, 8, NULL, 'admin', '2021-08-10 12:13:23', NULL, NULL, NULL, NULL),
	(2338, 1, 376, NULL, 'admin', '2021-08-10 12:13:23', NULL, NULL, NULL, NULL),
	(2339, 1, 1012, NULL, 'admin', '2021-08-10 12:13:23', NULL, NULL, NULL, NULL),
	(2340, 1, 9, NULL, 'admin', '2021-08-10 12:13:23', NULL, NULL, NULL, NULL),
	(2341, 1, 10, NULL, 'admin', '2021-08-10 12:13:23', NULL, NULL, NULL, NULL),
	(2342, 1, 11, NULL, 'admin', '2021-08-10 12:13:23', NULL, NULL, NULL, NULL),
	(2343, 1, 12, NULL, 'admin', '2021-08-10 12:13:23', NULL, NULL, NULL, NULL),
	(2344, 1, 13, NULL, 'admin', '2021-08-10 12:13:23', NULL, NULL, NULL, NULL),
	(2345, 1, 14, NULL, 'admin', '2021-08-10 12:13:23', NULL, NULL, NULL, NULL),
	(2346, 1, 1013, NULL, 'admin', '2021-08-10 12:13:23', NULL, NULL, NULL, NULL),
	(2347, 1, 15, NULL, 'admin', '2021-08-10 12:13:23', NULL, NULL, NULL, NULL),
	(2348, 1, 16, NULL, 'admin', '2021-08-10 12:13:23', NULL, NULL, NULL, NULL),
	(2349, 1, 17, NULL, 'admin', '2021-08-10 12:13:23', NULL, NULL, NULL, NULL),
	(2350, 1, 18, NULL, 'admin', '2021-08-10 12:13:23', NULL, NULL, NULL, NULL),
	(2351, 1, 19, NULL, 'admin', '2021-08-10 12:13:23', NULL, NULL, NULL, NULL),
	(2352, 1, 20, NULL, 'admin', '2021-08-10 12:13:23', NULL, NULL, NULL, NULL),
	(2353, 1, 1002, NULL, 'admin', '2021-08-10 12:13:23', NULL, NULL, NULL, NULL),
	(2354, 1, 1017, NULL, 'admin', '2021-08-10 12:13:23', NULL, NULL, NULL, NULL),
	(2355, 1, 21, NULL, 'admin', '2021-08-10 12:13:23', NULL, NULL, NULL, NULL),
	(2356, 1, 23, NULL, 'admin', '2021-08-10 12:13:23', NULL, NULL, NULL, NULL),
	(2357, 1, 1018, NULL, 'admin', '2021-08-10 12:13:23', NULL, NULL, NULL, NULL),
	(2358, 1, 24, NULL, 'admin', '2021-08-10 12:13:23', NULL, NULL, NULL, NULL),
	(2359, 1, 25, NULL, 'admin', '2021-08-10 12:13:23', NULL, NULL, NULL, NULL),
	(2360, 1, 26, NULL, 'admin', '2021-08-10 12:13:23', NULL, NULL, NULL, NULL),
	(2361, 1, 27, NULL, 'admin', '2021-08-10 12:13:23', NULL, NULL, NULL, NULL),
	(2362, 1, 28, NULL, 'admin', '2021-08-10 12:13:23', NULL, NULL, NULL, NULL),
	(2363, 1, 1027, NULL, 'admin', '2021-08-10 12:13:23', NULL, NULL, NULL, NULL),
	(2364, 1, 378, NULL, 'admin', '2021-08-10 12:13:23', NULL, NULL, NULL, NULL),
	(2365, 1, 379, NULL, 'admin', '2021-08-10 12:13:23', NULL, NULL, NULL, NULL),
	(2366, 1, 380, NULL, 'admin', '2021-08-10 12:13:23', NULL, NULL, NULL, NULL),
	(2367, 1, 381, NULL, 'admin', '2021-08-10 12:13:23', NULL, NULL, NULL, NULL),
	(2368, 1, 1025, NULL, 'admin', '2021-08-10 12:13:23', NULL, NULL, NULL, NULL),
	(2369, 1, 363, NULL, 'admin', '2021-08-10 12:13:23', NULL, NULL, NULL, NULL),
	(2370, 1, 1015, NULL, 'admin', '2021-08-10 12:13:23', NULL, NULL, NULL, NULL),
	(2371, 1, 1006, NULL, 'admin', '2021-08-10 12:13:23', NULL, NULL, NULL, NULL),
	(2372, 1, 1021, NULL, 'admin', '2021-08-10 12:13:23', NULL, NULL, NULL, NULL),
	(2373, 1, 84, NULL, 'admin', '2021-08-10 12:13:23', NULL, NULL, NULL, NULL),
	(2374, 1, 85, NULL, 'admin', '2021-08-10 12:13:23', NULL, NULL, NULL, NULL),
	(2375, 1, 86, NULL, 'admin', '2021-08-10 12:13:23', NULL, NULL, NULL, NULL),
	(2376, 1, 87, NULL, 'admin', '2021-08-10 12:13:23', NULL, NULL, NULL, NULL),
	(2377, 1, 88, NULL, 'admin', '2021-08-10 12:13:23', NULL, NULL, NULL, NULL),
	(2378, 1, 89, NULL, 'admin', '2021-08-10 12:13:23', NULL, NULL, NULL, NULL),
	(2379, 1, 90, NULL, 'admin', '2021-08-10 12:13:23', NULL, NULL, NULL, NULL),
	(2380, 1, 91, NULL, 'admin', '2021-08-10 12:13:23', NULL, NULL, NULL, NULL),
	(2381, 1, 92, NULL, 'admin', '2021-08-10 12:13:23', NULL, NULL, NULL, NULL),
	(2382, 1, 93, NULL, 'admin', '2021-08-10 12:13:23', NULL, NULL, NULL, NULL),
	(2383, 1, 120, NULL, 'admin', '2021-08-10 12:13:23', NULL, NULL, NULL, NULL),
	(2384, 1, 340, NULL, 'admin', '2021-08-10 12:13:23', NULL, NULL, NULL, NULL),
	(2385, 1, 341, NULL, 'admin', '2021-08-10 12:13:23', NULL, NULL, NULL, NULL),
	(2386, 1, 351, NULL, 'admin', '2021-08-10 12:13:23', NULL, NULL, NULL, NULL),
	(2387, 1, 361, NULL, 'admin', '2021-08-10 12:13:23', NULL, NULL, NULL, NULL),
	(2388, 1, 377, NULL, 'admin', '2021-08-10 12:13:23', NULL, NULL, NULL, NULL),
	(2389, 1, 1022, NULL, 'admin', '2021-08-10 12:13:23', NULL, NULL, NULL, NULL),
	(2390, 1, 94, NULL, 'admin', '2021-08-10 12:13:23', NULL, NULL, NULL, NULL),
	(2391, 1, 95, NULL, 'admin', '2021-08-10 12:13:23', NULL, NULL, NULL, NULL),
	(2392, 1, 96, NULL, 'admin', '2021-08-10 12:13:23', NULL, NULL, NULL, NULL),
	(2393, 1, 97, NULL, 'admin', '2021-08-10 12:13:23', NULL, NULL, NULL, NULL),
	(2394, 1, 98, NULL, 'admin', '2021-08-10 12:13:23', NULL, NULL, NULL, NULL),
	(2395, 1, 99, NULL, 'admin', '2021-08-10 12:13:23', NULL, NULL, NULL, NULL),
	(2396, 1, 100, NULL, 'admin', '2021-08-10 12:13:23', NULL, NULL, NULL, NULL),
	(2397, 1, 101, NULL, 'admin', '2021-08-10 12:13:23', NULL, NULL, NULL, NULL),
	(2398, 1, 350, NULL, 'admin', '2021-08-10 12:13:23', NULL, NULL, NULL, NULL),
	(2399, 1, 391, NULL, 'admin', '2021-08-10 12:13:23', NULL, NULL, NULL, NULL),
	(2400, 1, 1005, NULL, 'admin', '2021-08-10 12:13:23', NULL, NULL, NULL, NULL),
	(2401, 1, 1019, NULL, 'admin', '2021-08-10 12:13:23', NULL, NULL, NULL, NULL),
	(2402, 1, 61, NULL, 'admin', '2021-08-10 12:13:23', NULL, NULL, NULL, NULL),
	(2403, 1, 62, NULL, 'admin', '2021-08-10 12:13:23', NULL, NULL, NULL, NULL),
	(2404, 1, 63, NULL, 'admin', '2021-08-10 12:13:23', NULL, NULL, NULL, NULL),
	(2405, 1, 64, NULL, 'admin', '2021-08-10 12:13:23', NULL, NULL, NULL, NULL),
	(2406, 1, 65, NULL, 'admin', '2021-08-10 12:13:23', NULL, NULL, NULL, NULL),
	(2407, 1, 66, NULL, 'admin', '2021-08-10 12:13:23', NULL, NULL, NULL, NULL),
	(2408, 1, 67, NULL, 'admin', '2021-08-10 12:13:23', NULL, NULL, NULL, NULL),
	(2409, 1, 68, NULL, 'admin', '2021-08-10 12:13:23', NULL, NULL, NULL, NULL),
	(2410, 1, 69, NULL, 'admin', '2021-08-10 12:13:23', NULL, NULL, NULL, NULL),
	(2411, 1, 70, NULL, 'admin', '2021-08-10 12:13:23', NULL, NULL, NULL, NULL),
	(2412, 1, 71, NULL, 'admin', '2021-08-10 12:13:23', NULL, NULL, NULL, NULL),
	(2413, 1, 72, NULL, 'admin', '2021-08-10 12:13:23', NULL, NULL, NULL, NULL),
	(2414, 1, 73, NULL, 'admin', '2021-08-10 12:13:23', NULL, NULL, NULL, NULL),
	(2415, 1, 74, NULL, 'admin', '2021-08-10 12:13:23', NULL, NULL, NULL, NULL),
	(2416, 1, 119, NULL, 'admin', '2021-08-10 12:13:23', NULL, NULL, NULL, NULL),
	(2417, 1, 339, NULL, 'admin', '2021-08-10 12:13:23', NULL, NULL, NULL, NULL),
	(2418, 1, 360, NULL, 'admin', '2021-08-10 12:13:23', NULL, NULL, NULL, NULL),
	(2419, 1, 382, NULL, 'admin', '2021-08-10 12:13:23', NULL, NULL, NULL, NULL),
	(2420, 1, 1020, NULL, 'admin', '2021-08-10 12:13:23', NULL, NULL, NULL, NULL),
	(2421, 1, 75, NULL, 'admin', '2021-08-10 12:13:23', NULL, NULL, NULL, NULL),
	(2422, 1, 76, NULL, 'admin', '2021-08-10 12:13:23', NULL, NULL, NULL, NULL),
	(2423, 1, 77, NULL, 'admin', '2021-08-10 12:13:23', NULL, NULL, NULL, NULL),
	(2424, 1, 78, NULL, 'admin', '2021-08-10 12:13:23', NULL, NULL, NULL, NULL),
	(2425, 1, 79, NULL, 'admin', '2021-08-10 12:13:23', NULL, NULL, NULL, NULL),
	(2426, 1, 80, NULL, 'admin', '2021-08-10 12:13:23', NULL, NULL, NULL, NULL),
	(2427, 1, 81, NULL, 'admin', '2021-08-10 12:13:23', NULL, NULL, NULL, NULL),
	(2428, 1, 82, NULL, 'admin', '2021-08-10 12:13:23', NULL, NULL, NULL, NULL),
	(2429, 1, 83, NULL, 'admin', '2021-08-10 12:13:23', NULL, NULL, NULL, NULL),
	(2430, 1, 1007, NULL, 'admin', '2021-08-10 12:13:23', NULL, NULL, NULL, NULL),
	(2431, 1, 102, NULL, 'admin', '2021-08-10 12:13:23', NULL, NULL, NULL, NULL),
	(2432, 1, 103, NULL, 'admin', '2021-08-10 12:13:23', NULL, NULL, NULL, NULL),
	(2433, 1, 104, NULL, 'admin', '2021-08-10 12:13:23', NULL, NULL, NULL, NULL),
	(2434, 1, 105, NULL, 'admin', '2021-08-10 12:13:23', NULL, NULL, NULL, NULL),
	(2435, 1, 106, NULL, 'admin', '2021-08-10 12:13:23', NULL, NULL, NULL, NULL),
	(2436, 1, 107, NULL, 'admin', '2021-08-10 12:13:23', NULL, NULL, NULL, NULL),
	(2437, 1, 108, NULL, 'admin', '2021-08-10 12:13:23', NULL, NULL, NULL, NULL),
	(2438, 1, 109, NULL, 'admin', '2021-08-10 12:13:23', NULL, NULL, NULL, NULL),
	(2439, 1, 110, NULL, 'admin', '2021-08-10 12:13:23', NULL, NULL, NULL, NULL),
	(2440, 1, 111, NULL, 'admin', '2021-08-10 12:13:23', NULL, NULL, NULL, NULL),
	(2441, 1, 121, NULL, 'admin', '2021-08-10 12:13:23', NULL, NULL, NULL, NULL),
	(2442, 1, 342, NULL, 'admin', '2021-08-10 12:13:23', NULL, NULL, NULL, NULL),
	(2443, 1, 343, NULL, 'admin', '2021-08-10 12:13:23', NULL, NULL, NULL, NULL),
	(2444, 1, 344, NULL, 'admin', '2021-08-10 12:13:23', NULL, NULL, NULL, NULL),
	(2445, 1, 362, NULL, 'admin', '2021-08-10 12:13:23', NULL, NULL, NULL, NULL),
	(2446, 1, 383, NULL, 'admin', '2021-08-10 12:13:23', NULL, NULL, NULL, NULL),
	(2447, 1, 1004, NULL, 'admin', '2021-08-10 12:13:23', NULL, NULL, NULL, NULL),
	(2448, 1, 55, NULL, 'admin', '2021-08-10 12:13:23', NULL, NULL, NULL, NULL),
	(2449, 1, 56, NULL, 'admin', '2021-08-10 12:13:23', NULL, NULL, NULL, NULL),
	(2450, 1, 57, NULL, 'admin', '2021-08-10 12:13:23', NULL, NULL, NULL, NULL),
	(2451, 1, 58, NULL, 'admin', '2021-08-10 12:13:23', NULL, NULL, NULL, NULL),
	(2452, 1, 59, NULL, 'admin', '2021-08-10 12:13:23', NULL, NULL, NULL, NULL),
	(2453, 1, 60, NULL, 'admin', '2021-08-10 12:13:23', NULL, NULL, NULL, NULL),
	(2454, 1, 375, NULL, 'admin', '2021-08-10 12:13:23', NULL, NULL, NULL, NULL),
	(2455, 1, 384, NULL, 'admin', '2021-08-10 12:13:23', NULL, NULL, NULL, NULL),
	(2456, 1, 385, NULL, 'admin', '2021-08-10 12:13:23', NULL, NULL, NULL, NULL),
	(2457, 1, 386, NULL, 'admin', '2021-08-10 12:13:23', NULL, NULL, NULL, NULL),
	(2458, 1, 387, NULL, 'admin', '2021-08-10 12:13:23', NULL, NULL, NULL, NULL),
	(2459, 1, 388, NULL, 'admin', '2021-08-10 12:13:23', NULL, NULL, NULL, NULL),
	(2460, 1, 1016, NULL, 'admin', '2021-08-10 12:13:23', NULL, NULL, NULL, NULL),
	(2461, 1, 1010, NULL, 'admin', '2021-08-10 12:13:23', NULL, NULL, NULL, NULL),
	(2462, 1, 112, NULL, 'admin', '2021-08-10 12:13:23', NULL, NULL, NULL, NULL),
	(2463, 1, 113, NULL, 'admin', '2021-08-10 12:13:23', NULL, NULL, NULL, NULL),
	(2464, 1, 114, NULL, 'admin', '2021-08-10 12:13:23', NULL, NULL, NULL, NULL),
	(2465, 1, 115, NULL, 'admin', '2021-08-10 12:13:23', NULL, NULL, NULL, NULL),
	(2466, 1, 116, NULL, 'admin', '2021-08-10 12:13:23', NULL, NULL, NULL, NULL),
	(2467, 1, 117, NULL, 'admin', '2021-08-10 12:13:23', NULL, NULL, NULL, NULL),
	(2468, 1, 118, NULL, 'admin', '2021-08-10 12:13:23', NULL, NULL, NULL, NULL),
	(2469, 1, 399, NULL, 'admin', '2021-08-23 00:00:00', NULL, NULL, NULL, NULL),
	(2470, 1, 400, NULL, 'admin', '2021-08-23 00:00:00', NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `umm_role_previlege` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.umm_user_approval_group
DROP TABLE IF EXISTS `umm_user_approval_group`;
CREATE TABLE IF NOT EXISTS `umm_user_approval_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `approval_group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `USER_ID_FK_1` (`user_id`),
  KEY `AP_GROUP_FK1` (`approval_group_id`),
  CONSTRAINT `AP_GROUP_FK1` FOREIGN KEY (`approval_group_id`) REFERENCES `common_approval_group` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `USER_ID_FK_1` FOREIGN KEY (`user_id`) REFERENCES `umm_user_mst` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table papertrl_default_script.umm_user_approval_group: ~0 rows (approximately)
/*!40000 ALTER TABLE `umm_user_approval_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `umm_user_approval_group` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.umm_user_department
DROP TABLE IF EXISTS `umm_user_department`;
CREATE TABLE IF NOT EXISTS `umm_user_department` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `department_id` int(11) NOT NULL,
  `department_name` varchar(100) NOT NULL,
  `sub_account_id` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table papertrl_default_script.umm_user_department: ~0 rows (approximately)
/*!40000 ALTER TABLE `umm_user_department` DISABLE KEYS */;
/*!40000 ALTER TABLE `umm_user_department` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.umm_user_import_issue
DROP TABLE IF EXISTS `umm_user_import_issue`;
CREATE TABLE IF NOT EXISTS `umm_user_import_issue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `import_mst_id` int(11) NOT NULL,
  `record` text DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL,
  `line_no` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_IMPORT_MST6` (`import_mst_id`),
  CONSTRAINT `FK_IMPORT_MST6` FOREIGN KEY (`import_mst_id`) REFERENCES `umm_user_import_mst` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table papertrl_default_script.umm_user_import_issue: ~0 rows (approximately)
/*!40000 ALTER TABLE `umm_user_import_issue` DISABLE KEYS */;
/*!40000 ALTER TABLE `umm_user_import_issue` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.umm_user_import_mst
DROP TABLE IF EXISTS `umm_user_import_mst`;
CREATE TABLE IF NOT EXISTS `umm_user_import_mst` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(100) NOT NULL,
  `total_records` int(11) DEFAULT NULL,
  `succeeded` int(11) DEFAULT NULL,
  `failed` int(11) DEFAULT NULL,
  `created_by` varchar(100) DEFAULT '',
  `created_on` datetime DEFAULT NULL,
  `update_by` varchar(100) DEFAULT NULL,
  `update_on` datetime DEFAULT NULL,
  `delete_by` varchar(100) DEFAULT NULL,
  `delete_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table papertrl_default_script.umm_user_import_mst: ~0 rows (approximately)
/*!40000 ALTER TABLE `umm_user_import_mst` DISABLE KEYS */;
/*!40000 ALTER TABLE `umm_user_import_mst` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.umm_user_mst
DROP TABLE IF EXISTS `umm_user_mst`;
CREATE TABLE IF NOT EXISTS `umm_user_mst` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(100) NOT NULL,
  `role_id` int(11) NOT NULL,
  `user_name` varchar(100) NOT NULL DEFAULT '',
  `name` varchar(150) NOT NULL DEFAULT '',
  `address` varchar(255) DEFAULT '',
  `email` varchar(100) NOT NULL DEFAULT '',
  `telephone_no` varchar(20) DEFAULT NULL,
  `status` char(1) NOT NULL DEFAULT '',
  `login_attempt` int(1) NOT NULL,
  `password` varchar(200) NOT NULL DEFAULT '',
  `created_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `created_by` varchar(100) NOT NULL DEFAULT '',
  `nic_passport_no` varchar(50) DEFAULT NULL,
  `image_attached` char(1) NOT NULL DEFAULT '',
  `first_login` char(1) NOT NULL,
  `account_locked_date` datetime DEFAULT NULL,
  `pro_pic_content_type` varchar(100) DEFAULT NULL,
  `pro_pic_name` varchar(150) DEFAULT NULL,
  `update_on` datetime DEFAULT NULL,
  `update_by` varchar(100) DEFAULT '',
  `last_login_date` datetime DEFAULT NULL,
  `last_login_date_time` datetime DEFAULT NULL,
  `user_type` varchar(3) NOT NULL,
  `temporary_password` varchar(200) DEFAULT '',
  `temporary_password_status` char(1) DEFAULT NULL,
  `temporary_password_issue_date` datetime DEFAULT NULL,
  `temporary_password_expired_date` datetime DEFAULT NULL,
  `workflow_id` int(11) DEFAULT NULL,
  `propic_id` int(11) DEFAULT NULL,
  `delete_by` varchar(100) DEFAULT NULL,
  `delete_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_name` (`user_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table papertrl_default_script.umm_user_mst: ~0 rows (approximately)
/*!40000 ALTER TABLE `umm_user_mst` DISABLE KEYS */;
/*!40000 ALTER TABLE `umm_user_mst` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.umm_user_propic
DROP TABLE IF EXISTS `umm_user_propic`;
CREATE TABLE IF NOT EXISTS `umm_user_propic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `file_name` varchar(100) NOT NULL,
  `file_type` varchar(50) NOT NULL,
  `image_data` mediumblob NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Dumping data for table papertrl_default_script.umm_user_propic: ~0 rows (approximately)
/*!40000 ALTER TABLE `umm_user_propic` DISABLE KEYS */;
INSERT INTO `umm_user_propic` (`id`, `file_name`, `file_type`, `image_data`) VALUES
	(1, 'default_propic.png', 'image/png', _binary 0x89504E470D0A1A0A0000000D494844520000017500000175080600000017FD7AC80000200049444154789CEDDD799464595D2FFAEF6F9F73E2EC93911991630D599535F754595D08A220C3BD884F975779BED7030AE2803E19E4C9C5FBF0C17B08175AB9BA70C1BBEA0551E4B2BC3C1CD06E5B9FA0AE25A2A2225EF402D555DD40CF5D5D43565566E57CF68973F6FEBD3FEA6475767565560E1171224EFC3E8B5A5D1919C38FCA38DFDCB147FADA0327B11526365B7A9C10DBA523DD076010C050FEDF1A8020FF7B00A03FBF2BE5B75D6B1600E77F5F0490E6B7A500E6F3BF5F06306B62B3DC9AFF17426CDD5FFCF967D6FC9EDFC63A8458978EF40880FD0026F23F0799795FFEF751221AC295000733370064CCECF27826067B0008FCCCFB9AC1E1B5AF43A064D5171900269005C020808814009F882A3AD200B0C0CC33002E01384D444F01781CC0E9FCCF932636D3CDFDD710626B24D4455BE948F703781E80DB004C32F324816E02619C991D80841D83994366D6CC0C06030C303398571AD8DB7AEF866BFCFDBA886888888640384CA017111188C81051428A0020D49156609C65F0C344740AC029000F01F89A89CDE2366A15625324D445CBE848DF06E076002F64E61711D16D00069D734BCC1CB0E3EA4A503BE7AE3EACB082D770CD2F93151AD7D4AA943A40440788E8BB49D11211A54AA9AA8EF42C333F4444FF0CE05F003C6062F3509BCA173D46425D34451EE0DF01C62B18FC12223AC0CC4BCE393073BF734EE52D70E0FAFDDC5D6FD52F2600A8AEFC8588C648D19852EA6544B4A894828E7495999F20D01741F85B00FF24412F9A41425D6C898EF4CB017C1F33BF92888E3373C339E739E7AAECAEB6BC6B0597D91198196C19CE3A8555FF264AA9C3A4E8B052EA4EA594D591AE30F30922FA3C803F37B1F9FBE2AA16DD4A425D6C888EF48B00DCC5CCDF4D44CF73CECD39E7AACEB9206F81775CB749A773CE010EB0B05500202290A26F574A3D5F29F5661DE93A337F8D88FE0AC07D2636FF5C70C9A20B48A88BEBD2911EC79596F80F11D1CB9C738973AECF5917E4ADF05276A11469558B7E657A269452DFA23C35A9947AA38E74C8CCFF40449FC69596FCD9622B169D48425D5CA523FD6D007E9899FF6766DEED9C63675DD53A0B70E70D60F602E71C9C7301803A08F094F73F294F7D8752EAD7421D9E23A23F03F07B26365F2EBA56D11924D47B9C8EF4CBC0783D08773133596BABCE3AFF9A413FD10918B0D6C2DA2BDD354AA9C3CA533FE379DE4FE8483318F781F049139B2F145DAA288E847A0FD291FE0E30DE08C29DEE8ABACD2C5D67DA9EE860792BDECFD2AC4E44F07CEF27955277E9487B60FC3108BF6562F34F45D729DA4B42BD47E848DF02E0AD007ED039174890970B33234B3302309807FC8F29A5FE171DE90CC0A7017C44A64CF60609F592D391BE8799EF64E6FDD6DAC866D697202FB7EB04FC9B3CCFFBD15087A789E83E139BF7165DA3681D09F512D2917E3E186F07E135D6DA659BD901E923EF4D79C0FB599AD59452939EEFEDD391FE7930FE00840F99D87CA5E81A457349A897848EB402F00BCCFC6A66DE69AD1DC8D24C011828BA36D1199C73700D379022851FF8AFF53CEF55A10EA788E88F00FC47131BF9CD5F02AAE802C4F6E8481FD65A7F1280B5D6FE6CDA486F4E4C52CF035D88EBCAD24C2526A9A78DF4666BEDCF02B05AEBFF5747FA70D1B589ED910BBF4BE948BF32D4E11798F9AB99CD7ED8C4066923AD4A378BD80CE71CD2465A35B14166B3D732F357431D7E4147FABB8AAE4D6C8D74BF74997CE0F375CEB9912CCB069D951017CD91A59997A559BFF2D4CB7DDFBF37D4E13411FDAE0CAC761769A977091DE95FD691BE9077B11C6E240D0974D112CE3A3492C660DA480F5B6B7F5647FAA28EF42F175D97D81809F50EA723FD2B3AD20BD6DAB72626194B1B694DBA58443BE45D33B5C424A3D6DAB7EA482FE848FF4AD17589F549A877281DE90FEA482FD9CCBE2531497FDA48AB32BF5C1481999136D26A62927E9BD9B7E8482FE9487FB0E8BAC4F549A877181DE90FE848CFDBCCBE3931495F9A4A988BCEC0CC48D3B49A98A4CF66F6A7F396FB078AAE4B3C9B847A87D091FE451DE9296BED5B12930C48988B4E95877B5F62927E6BED5B74A4A774A47FB1E8BAC41512EA05D3917E61A8C3AF5B6BFF7D62921D6923ED973017DD20EF96E94F4CB2C35AFBEF431D7E3DDFBE59144842BD203AD283A10EFF94993F9736D25BD2465A933017DD280FF75ADA486F61E6BF0A75F8A73AD272884A4124D4DB4C475AE9487F14C0056BEDF72726A9CB6C165106CE392426A95B6BBF1FC0051DE98FE6DB578836927FF036CAFB1D2FDBCCBEDEC426C8D2CC2BBA26219A2D4B33CFC426B0997D3D80CBD2DFDE5E12EA6DA0237D20D4E1579D756F4D4C524BD3548E8613A597A6A94E4C5273D6BD35D4E15775A40F145D532F90506F311DE98F31F303D6DAE7351A8DBAF49B8B5EC2CC68341A756BEDF398F9011DE98F155D53D949A8B7888EF40B75A4CFD8CCFE486292FE2CCD8A2E4988C26469867CF1D28FE8489FD1917E61D1359595847A93E948EB5087BFCFCC9F4B4C329EA66954744D42748A344DA3C424E3CCFCB95087BFAF232D5D914D26A1DE44F980D0456BED9D8949A4AB4588EB60E69559327702B82803A9CD255BEF36818E743F33FF8173EEA5B27848888DC9D2AC62335B092AC1CF843A7C3E11BDC6C466B1E8BABA9DB4D4B74947FA0500CE586BBFA791340625D085D838664623690C5A6BBF07C099FC7A12DB20A1BE0D5AEB4F30F3E71393D4B2340B8AAE47886E95A5599098A4C6CC9FD75A7FA2E87ABA9984FA16E8488F853A7CD05AFB43D2772E4473ACEA6BFFA150870FEA488F155D53379250DF241DE90F8271DA5A7B5B9AA67D45D72344D9A469DA67ADBD0D8CD3B26FFBE6C940E906E583A1F7596B5F9C36D2B0E87A8428B32CCD90A55918548237843A3C4E4477CA20EAC6484B7D0374A4770078D85AFB9D6923AD155D8F10BD226DA4356BED2B003C9C5F87E20624D46F4047FA9799F9A9C424BB64305488F6CB07517731F3537200F68D49A8AF436BFD49E7DC9B1B492394C150218A934F7D0C9D736FD65A7FB2E87A3A9984FA75E8480F853AFCB2B5F62E997B2E44675835A7FDAE50875FD6911E2ABAA64E24A17E0D1DE943009EB2D6BE4066B708D179F2D9312F00F0747EBD8A5524D457D191FE1566FE5ABEABA2FCDB08D1A1B234538949FA98F96B3AD2BF52743D9D44822BA7B5FEB873EE0D4992C8DE2D42740166469224FDCEB93768AD3F5E743D9DA2E7E7A9EB485798F94FADB32F4D1BE940D1F5082136818146D2180C2AC10F863ADC4B443F6062D328BAAC22F5744B5D477A9099BFECACFB4E097421BA57DA48079C75AF60E62FEB480F165D4F917A36D4F37D254E596B27D35456880AD1EDD2340DADB593007A7ADF989E0CF57C65DAD359968D6769E6155D8F10A239B234F3B22CDB8D2BDBF8F6E40AD49E0B751DE97B009C4E4C5291734385289FFC3CD400C0E9FC7AEF293D15EA3AD2EF67E6B72726A9C80C1721CA2BDFC6B7C2CCFF878EF4FB8BAEA79D7A26D4F339E83FD3481A55097421CA2F5F81DACFCC3FD34B73D97B22D475A4FF733E075D0EB410A287E473D9EBCEB937E848FFE7A2EB6987D287BA8EF4AF3AE75EDF481A83903C17A2F7E473D99D73AFD791FED5A2CB69B55287BA8EF4879D733FDE481A3D3D6F55087135D87F5C47FAC345D7D24AA50DF53CD05F27812E84589107FBEB74A47FA3E85A5AA594A19E77B948A00B219E230FF6D796B52BA674A19E0F8A4A978B10624DABBA624A37785AAA50D791FEC0D54151218458C7AAC1D30F145D4B339526D4F385456F4A1BA904BA106243D2463AC8CC6F2AD302A55284BA8EF43DCCFCB646D29079E842880DCB1728D599F96D65D952A0EB433DDFB4E7FFCA578E155D8E10A2CBACAC3C05E39D65D804ACAB433DDF5EF38CECE52284D88E7CE569882BBB3B76F5B6BD5D1BEAF946F80F6459E64BA00B21B68B999165990FE0816E3E68A32B435D473A64E62F6459362ADBE70A219A254B33645936CACC5FD091EECAC373BA32D499F9FFB3D6DE2C075C08219A2D4B33CF5A7B3333FF59D1B56C45D785BAD6FA13CEB9EFC8D2AC2B7F8B0A213A5F9666A173EEC55AEB4F145DCB667555A8EB487FC0B1BB430E891642B45ADA48071CBB3BBA6D7152D784BA8EF461667E8B2C2E1242B44BBE38E92D3AD2878BAE65A3BA22D475A447009C94B9E8428876BA3A871D3895E750C7EBF850D79156CCFC7759968512E8428876CBA73A5698F9EF74A43B7E7246C7873A33DFEBAC3B9CA519155D8B10A237656946CEBAC3CCFC4745D772231D1DEA3AD21F64C7AF4CD354175D8B10A2B7A569AAD9F12B75A43F54742DEBE9D850D791DECBCC6F6E341AF5A26B1142080068341AF57C57C7BD45D7B2968E0C751DE97E005F69248D6AD1B50821C46A792E7D25CFA98ED391A1CECCF7655926DBE80A213A4E3E705A67E6FB8BAEE57A3A2ED4F3E3E85E9CA55950742D4208713D599A05CEB96FEFC4E3F03A2AD475A47733F31BD3465A2BBA162184584FDA486BCCFC461DE9DD45D7B29A5F74012B74A40330FEB9D168F4155D8BE83E44844A10200C4354C20A02DF879FFFF1BC2B538B95BAD28671CE0100ACB3C8328B2C4D9165191A698A244990240D48D79FD88846A3D11756C27FD6913E6C6293165D0FD041A10EC67FB3D6EE60271793589F520AFDD52AAAFD55F44511A228421469103567290333C39804711C63398EB1B8B884A5A525586B9BF2FCA23CD831ACB53B94A73E09E0B545D7037448A8EB48DFE39CFB77699ACACE8BE2398808FDFD55D4EB75D46A03A8F6F5352DC0D77ABD28D288228D610C01B812F4711C636E7E0173737358585894D6BC0000A4691A5654E57B75A4EF31B1796FD1F5D0D71E38B9A5079AD834A5001DE90100E71393F4C94522561011EAB51A86878730343478B50BA55358E730373B87E99919CCCDCD5FEDD211BD898810EA7019C02E139B8556BFDE5FFCF967D6FC5EE12D7566FEB4B556CE18150080BE28C2D8D828464686E1FB85BF3DD7E42985E1E1210C0F0FC15A8B9999CBB870F1129696968A2E4D1460657F18CFF3FE08C0F716594BA1578D8EF4FBF3032F3AF7EA152D4744181A1AC4AE9D3BD0DFDF91EB39D6E5791EC6C6463136368AE5E518E7A7A6303D3D23DD333D264B335F29F5221DE9F79BD8BCBBA83A0AEB7EC9BB5D2E262691DD177B141161C7D81876EDDA81302CD7704A9AA6989ABA80A90B176580B587E4DD300980B15676C37464F70B33FFAEB5D69340EF3D4484B1D1518C8FEF42A55229BA9C960882007BF7EEC1AE5D3B71EEFC14A6A62E48BF7B0FC8BB613CCFF37E17C00F145143218B8F74A4EF61E6974BB74BEFA9D76BB8FDD8240E1CD857DA405FCDF77D4CECDD83E3B74F626478B8E872441B6469E633F3CB75A4EF29E2F5DBDEFDA223ED03B8909864485AE9BD230C431CD8BF0FF57A6F2F165E5C5CC2134F3E89E5E5B8E852440BE5DD30B3B8D20D9335FBF9D7EB7E697F4B9DF1319BD94802BD37101176EFDA89DB8F1DEDF9400780FEFE2A268FDE86BD7BF75C5DE12ACA87996133ABC1F8ED76BF765BDF553AD247187CB71C7AD11BB40E71F4B65B3031B157026C1522C2F8EE5D983C7A1BFAFA64578CB24AD35433F82E1DE923ED7CDDB65E69CC7C9FB576A09DAF298A3136368AC9C9A3A856654BFCB54491C6E4D15BB17BD7CEA24B112D9236D20166BEAF9DAFD9B650D791FE25E7DC812C6D7AF792E8204A291C3A7800070FEC8727ADF31B22224C4CECC5CD371DE9B855B362FB9C7370CE1DD091FEA576BD665BAE3A1DE90A80B76569269DAA251686151CBDED168C8E8E145D4AD7191CAC63F2E86D88A2A8E8524493E5B9F7361DE9B6743BB7A729C5F8B8CD644E7A9955AB551CBDED56E923DE8695310819502E977CEEBA0FC6C7DAF17A2D0F751DE90906DF293B3096D7D0E0206EBBF56604811C56B55D9EE7E1E69B8E606C6CB4E852441365695661F09D3AD213AD7EAD96873A337FC25A2BCDB7921A1D19C191238764764B1311110E1ED88F5D32805A2AD6DA3E66FE9D56BF4E4BAF441DE99732F30BB3346BDDE6D7A2303B768CE1D0A1032DDDDBBC97ED9BD88BF1F18E3A294D6C439666C4CC2FD0917E592B5FA7A5A1CECCFF354BB3C156BE8628C6D8D8280EECDF577419A5B777CFB8047B89646936C8CC1F6FE56BB42CD475A47FD139B75B36312A9F91E16109F436DABB671CBB76EE28BA0CD104F914C75D3AD2BFD8AAD768654BFD8D3285B17C6AB501E97229C0BE7D131819910DC1CA204BB33A809F6CD5F3B724D475A47F391F1468C5D38B82F445116E3A725802BD20870E1E40AD260BB2BB1D33C35ADBAF23FDFE563C7FAB5AEAFF7B9666DD77848D5893EFFBB8F96659F5582422C291C3874A77A0482FCA7B31DED08AE76E7AA8EB487F50161A950B11E1C891433DB1FF79A7F37D1F371D392C5348BB5CDE5A8F5AB17D402BDE193F9D6599CC4B2F91BD7BF7A036201FFB3B455F5F848307F6175D86D8A62CCD0600FC74B39FB7A9A19EB7D2595AE9E551AFD76417C10E3432322C7BEC74B9BCB5EEEB487FA099CFDBEC96FA9BB22C93BD564BC2F77D1C3A78A0E832C41AF6EF9B90FEF52E978F3DBEA599CFD9B450CF67BC90B4D2CBE3E081FDB29F4B07F33C0F870E1D28BA0CB10D796B9D9AD95A6F664BFD7FCB5269A597C5D0D0208686643170A71BE8EFC78E1D63459721B621CFCDA6CD5B6F4AA8EB48DF63AD0DA5955E0E9EE761BFAC18ED1A137BF7C8CCA42E96B7D62B3AD2F734E3F99A12EACCFCA336B3B27AB424F6ECD98D8A74BB740DCFF33031B1A7E832C436D8CCD698F9479BF15CDB0E751DE95730F390ECF1520E5A6BECDC21FB8C749B91E161F4F7CB7ABF6EE59C03330FE9487FD7769F6BDBA1CECCEFCB32D989B12C2626F6C836005D6AFFBEBD459720B621CBB241667ECF769F675BA1AE237D08C0B73A2BADF432E8EFAF6268507E3F77AB6A557E7EDD2CCFD16FCD7375CBB6D75267DC63AD9593724B62CF9EF1A24B10DB243FC3EE66AD8DC0D8D680E996435D475A81F023599AC90E4F25D0DF5F45BD2663DDDDAEAF2F92D67A17CBD2CC03E1753AD25BCED5EDB4D4DF6F33BBBC8DC78B0E22E76196C7EEDDBB8A2E416C83CD6C0C60CB87686C3DD419AFCBAC6CDC55063A0C313C34547419A249FAFBABE8EF977580DD2AB3591F18AFDBEAE3B71AEA2F73EC6AEC64B15119C88AC4F29169A9DD8B1DC3B1AB6DF580EA2D853A33FF9FCE39E9B82B012292DDFE4A68686810BEEF175D86D822E7DC2033BF632B8FDD4AA85788E855599A6DE5F54487918BBF9C94521895334DBB56966620A2EFD791DEF4FE0F5B09F5F7586BE32D3C4E74A0D11169A597951C54DDDDF29CDDF462A44D873A33DF6D332BA33025E0791EEA7599C65856D56A55F65BEF6236B355667EF5661FB7D9503F0A605CF6792987A1A141D912A0E48687655653B7CA7376B78EF4D1CD3C6EB3A1FE166BAD4C632C89C1C17AD1258816939F7177CBF3765327236D36D45F63332BA36A254044B282B407F457AB3210DEC5F2BC7DCD661EB399507FA973CE938330CAA1BFBF0ACF931D1ECA8E8850AB0D145D86D822668673CED3917EE9461FB3F15067BCC939279FE54AA226ADF49E511B9050EF66CEB93A186FDAE8FD371EEA843B6C666554AD2406E440859E21876774379B5902E18E8DDE7FA3A1FE72E75C265D2FE54044A8CADE203DA3AF2F92AEB62E9677C1643AD22FDFC8FD3716EA8C1F97AE97F208C3109E6ACAF1B4A24BF4F5C9A4B56E9677C1FCF846EEBBB12B9B70A774BD94475F24E79AF41AF99977B7BC0BE6CE8DDC7723A1FE6DCCACA4EBA53CA23EB9C07B8DFCCCBB1B338399958EF4B7DDE8BE1B09F5D7582BDB029449A475D1258836939F79F7CB73F88673D66F1CEA8C3B9D75B27AA144C270D31BBF892E273FF3EEE7ACF399F986B3606E14EA7B193C267BBD948B6CF2D47B8220907D7EBA5C9EC33B74A4F7AE77BF1B85FA1B9C75F24E2811A5942C1BEF4144844A2528BA0CB14D791EBF61BDFBAC1BEACCFC12E79CCC852A115FE62BF72CF965DEFD9C737DCCFC92F5EEB36EA813D1CBADB5CDAD4A14CA0FE4C2EE5512EADDCF5A0B225A7711D27AA1FE62E79C9C7054329E92967AAFF23D09F53270CEC577DC75F78BD7FAFE7AA17EA7734E368D2819CF9750EF59323A560ACEB92AB0F642A435439D99BF47A6320A511EB2FF4B3938EB0266FEEEB5BEBF66A813D17199CA583E4AF67C11A2AB39E74044CF5BEBFB6B5DE12F77CECDB5A8265120F9452D44F773CECDDD71D7DDD71D305D2BD45F95F7DB08214A427EA197479ECFAFBADEF7AE1BEACCFC0AE79CAC542821B9B07B976CCA571ECEB980995F71BDEF5D37D489E879CECAC55F46567EAE3D4BAEE9F27076ED7EF5EB85FA2433272DAE491424CBB2A24B100549B3B4E8124413317372C75D771FBBF6F6EB85FAB739E7648A444949A8F7AE2C93D5E165E29CF3007CFBB5B73F37BC19AF944547E565AD957EF51E95A6D2522F13E75C158C575C7BFB73429DC12F6527032A659624D2BBD66BB22C83ECE3542EEC180C7ED9B5B73F27D489E890B4E4CA2D491A459720DA4C7EE6E5932F423A78EDEDD786FAB730B32C3A2A39232DF59E6312537409A2059879EE8EBBEE7EFEEADBAE0DF5E7E79DEFA2C4E25836DFEC35712CA15E46CE391FC0BAA1FE1D32485A7ECBCB12EABD26969F7929E52B4B9FB50DEFB3429D99BF550649CB2F8E63595DD8639697978B2E41B4003B0633BF70F56DCF0A75223A22177BF939E7E4E3780F693452240D19282D236606111D597DDBEA501F65E68A847A6F585C5C2CBA04D126F2B32E2F6606330777DC75F7E8CA6DAB43FD28334BF3AD47CCCF2F145D826893850509F532CB73FBE8CAD7AB43FD16762C3B33F688F98505E957EF1173F3F34597205A881D5700DCBAF2F5B52D75D943BD47645986C5A5A5A2CB102D9624098C910FE065C6CC7DB85E4B9D998F4BCBADB7CCCDCA3AB3B29B9D939F71D9E5FDEAB7AF7C7D35D40974D8B16C0FD04B662E5F2EBA04D1623333F2332E3BC70E043ABCF2F533DD2F847199A3DE5B8C49B024F3974BAB91A63248DA03D83140185FF97A25D4C79859B670EB41D2922BAF999999A24B106DC2CCD91D77DDBD037826D42700C82E4F3DE8D2A56999055352172F4E175D82689F0680BDC033A1BE4FBA5E7A539AA6989501D3D2595C5C948DDB7A489EDFFB80552D75660E0BAB4814EAC2C58B4597209AECC2C54B459720DA28CFEF09E099503FC0CCBAB8924491E6E6E6A5555722699A627A5AFAD37B499EDF07803CD499F980F4ABF6B673E7A78A2E4134C9F9A90B324ED263F2B9EA0780675AEAE30C7913F4B2E9E91939F2AC04B2CCE2C205E94EEB35797EEF02F25027D02EC9F4DEC6CC387BEE5CD165886D3A3F3525074CF7220608340EACB4D40983F2714D5CBA342DE79776B12CCB303575A1E83244019819200C02CF74BF0C48A80B66C6E9D34F175D86D8A2A7CF9C95567A8FCAF37B00B812EA5500B2E98B00005CBE3C2B7BAD77A1388E7151A631F63A77C75D7757158041664E8BAE46748EA74E9F96D9135DE6C9A7E467D6EBF21C1F540006016405D7233AC8F2728CF332C5B16B5CBA342D9FAE047025C707575AEAD2FD229EE5CCD9733046064D3B5D9A66784AC64104803CC7071580FEA28B119DC73987C71F7F423ED277B8279E7C1259261FB4C555030A403F33AB1BDE55F49C85C5459C3B77BEE832C41A2E5EBC84CB97678B2E4374883CC7AB0A400DCF3EAB5488ABCE9C3D87C54539CBB4D31863F0E453A78B2E43741605A0A600F86050D1D588CEC4CC78E4D1C790A6F211BF5358E7F0F0238FC239190A13AB5CC971FF4AF70BD82FBA1ED1B91A8D061E79F431E95FEF108F3FF604E2D8145D86E830798EF74BB78BD890858505F9B8DF01CE9C3D2707868B7549A88B0DBB70E1A20C9C16687A7A0667CE9C2DBA0CD1E156A634568A2E447487D34F9F9103180A3037378FC71E7FA2E8324467AB209FD2E80132502A36EEB1C79F90A9746DB4B0B080871F7954C634C48D100025DD2F62D35666C4CCCEC981D5ADB6B8B8886F3E2C335DC4C649A88B2D61663CFCF0A33268D742F3F30BF8C6371E96ED74C5A628001690738FC4E631331E7DF4715CBA345D7429A5333B3B876F3EFC08ACB4D0C5C63100AB002C0290C329C59630331E7BFC099C392B47E135CB850B17657191D88A0680455974249AE2CC99B3484C820307F641C950CD96AC9C3C755E8EA413DB20A12E9AE6D2F4346213E3A6238751A9C82CD9CDC8B20C8F3CFA98EC8B2EB64D01982722D9D84334C5D2D2324E9E7A087373F34597D23516171771F2D44312E8625BF21C9F53000CE48C52D1445996E11BDF7C184F3E755AFA85D7C1CC3873E62C1EFAFA37D168C8B096D8360720F17125D465F68B68BAA9A90B989F9FC7C10307D0DF5F2DBA9C8EB21CC778E2F127B1B824DB1A8BA66100C6C795EE17694E8996886383071FFA3A76EEDC81BD7BC6E1795ED12515CA3987B3E7CEE3DCB9F3B2425434559EE3F33E80E5A28B11E537357501333397B177EF38C646478B2EA710972FCFE2F4E9A7611239FB55B4CCB20F609688640E9A68B9344DF1F8E34FE2C2D4454C4CEC41AD562BBAA4B6585A5AC2E9D36730BF2003A1A275F21C9FF501CC42A6368A365A5A5EC6D7BFF1300606FAB177CF380606068A2EA92596969671F6EC395C9E95CDCF445BF8580975220A8AAE46F49E8585453CF4F56FA25AAD62F7AE9D181A1A0451F76F183A3B3B87F35353324551B4559EE3B33E8025C8C65EA2404B4B4B78E4D1C750A9543036368AB1D191AE5BBC94A6192E5DBA848B97A6618C1C35270AA1EEBFEFDEA5956E9779221A92D17851A446A3813367CEE2ECD973A8D50630323C8CA1A1C18E9D3163ADC5ECEC1C66662E63766E4E66B388C2E49F701780BC2F9D992F4BA88B4EC1CC989B9BC7DCDC3CE80942AD36807ABD86C17A1D5AEB426B4B9206E6E6E6AED4373F2F8BAB4447202230F365E09901D2F3201C2AB02621AE6B75C03F85A751A95430D0DF8FFEFE2AFAFBAB88A2A8651B883133E238C6E2D232161716B1B0B88844A6238A4E746528EA1CB02AD4494EB4135DA0D168607A6606D33357CE49252284618828D208C3106158415809E1073E7CDF87EFF9F0FDEB77DF586B916516599622CD32A48D144992C02409E2D8C018235D2AA22BE4F97D1EC8439D889E28C3AC03D17B9819C6980D0D4EAEBCC725A845D9101188E809E099592F8F13910CD98B5263660974514A797E3F093C13EA4F139174160A2144372224009E069E09F5A74849F78B104274A37CB2C069E099503F0D202CAA20218410DB5201F014F04CA85F24A2CE5CE1218410625D44E4DF7FDFBD53C0EAED011867A50B460821BA0B2902186757BEBE1AEA0C7E58C90EBC4208D155142930F8D1AB5FAFFC85884ECA5C752184E82EF91CF5132B5FAF6E9A3F48447260A2104274913CB71F5CF97A75A87F9D145289998C00001CFB49444154A5ED2F490821C456E5B9FD8D95AFAF6DA917BB059E1042884DC973FBD4CAD7AB437D9A881AD2AF2E8410DD21EF4F6FDC7FDFBDD32BB73D6BBA0B333F2CA12E8410DD21DF47FD91D5B7A96BEEF03F64AEBA10427407520422FAD7D5B7F9D7DCE78B4AA9D75AD8FE36D62544531111822040A51220080228A5E02905520A4A29100006C08EE19C856386B30E699A224D5334D2544E34125D4129B508E09F56DF766DA87F552965DB5792105B178615445174E58FD688A208954A054170EDDB7AF3ACB568341A3026416C0CE2E518CB712C0767888E92E7F55756DF465F7BE0E4B5F7732636D207233A0A11A1BF5AC5406D00FDD52B47D9F9FEF6C37BB39C73585C5AC2D2E212E61716B0B8B0082BAD7A51101D69DC7FDFBDCFCAEBE75C15CCFC9852EAB07CFC14450B021F83F5410C0ED651AFD75A7616E96628A5501B18406D6000BB77EF023363616111B3B3B3B83C3B2767988AB6514A81991FBBF6F6E7843A81BE488A0E43325D14A01204181919C6D0D020FAFB3B7F68878850AB0DA0561BC0BE7D1388E318972FCFE2D2F4CC868ED81362AB481108F48FD7DEFEDCCFAF84CF2BA5EE90C152D12E4484A1A1418C8E8EA05EABA19BA7D5AEF4F18F8FEFC6E2E2122E5DBA84E999CBB05686AA447329A51641F8FCB5B75FAF53F24B4A291909122D57A954B073C718C6C6460BE91F6FB5FEFE2B7DFFFBF64D607AE632A6CE4F61398E8B2E4B94449ED35FBAF6F6EB0D9402C07262924846F9452B54AB7DD8B57327868787BABA55BE157373F3383F3585B9B9F9A24B115D4E473AB9FFBE7B9FB3B5CB759B47CC7C8214BD88AD84BA689EFE6A157BF78EA356AB155D4A61EAF51AEAF51A9697639C3973169767678B2E497421E52930F3D7AEF7BDEB863A11FD8D52EA05CEBAA0B5A5895ED0D71761CF9E710C0D0E165D4AC7E8EB8B70D34D87B1B4B484D34F9FC5FCBCB4DCC5C629A552227A4E7F3AB046A803F8AC52EACD00E42A145B56A95430B1770F4646868B2EA56355AB55DC7ACB4D989F5FC053A79FC6F2F272D125892EA0945A02F0D9EB7D6FAD3E7500B02636C54F0C165D8788B06BD74E8C8FEF86D70173CBBB0533E3E2C54B38FDF419992D23D6A523EDEEBFEF5EEF7ADF5B73CA01339F504A7D8B2C42129B51AFD7B07FDF04B496ADF9378B88B063C71886878770FAE933B878F152D125890E942F3ABA6E7F3AB04EA813D15F294F4D3A27FDEAE2C67CDFC3FE7DFBA4ABA5097CDFC7C103FB313A328CC71E7F5256A98A67519E4A89E8736B7E7F9DC7DEA794920E3E7143F57A0DC7262725D09B6C606000C7266FC38EB1B1A24B111D24CFE5FBD6FAFE7A7DEA00101B63346466A3B80E4F294CEC9BC08EB1D1A24B29BDB9F9793CFEF8136834E418E19E4680D6DADC7FDFBDD15A775977148B99FFDE53D7ED8B173D2E8A224C4EDE2681DE26F55A0DC7268FA25EEFDD39FE02F0940766FEFBF5EEB36EA813D1BDD20523AE353A3A82C9A3B7CA60689BF9BE8F5B6EBE097BF78CF7DC4A5C7185526A9988EE5DF73E37788ECF284FA6A4892B94523878603F0E1D3CD011DBE0F6AAF1F1DDB8E5E69B10043287A1D7E4797CDDF9E957EF7383E7380BE08C5CC0A21204B8EDD69B3126DD2D1DA1561BC0E4D15BD117ADD9B52A4A26CFE133263667D6BDDF8D9E8888FE4C792A6B5661A2FB54AB7D383A791BAAD56AD1A588552A950A6EBBED16D4EBF5A24B116DA03C9511D19FDDF07E1B78AE3FF03C6FA90935892E343858C7ADB7DE828A7CD4EF489EE7E1E69B0E63E78E1D4597225A2CCFE1DFBFD1FD3612EA5F26222B0333BD676C6C14371D392C4BFD3B1C1161FFFE09ECDBB7B7E852448B101188C89AD8FCCB8DEEBBB1AB9571BFE77BB25F400FD9BD7B170E1ED82FB32CBAC8AE9D3B71E8D001F99995509EBF7FBC91FB6E2CD409BFA39492BD417BC4DEBD7B30B1774FD165882D181D19C191C38724D84B26CFDF4F6EE8BE1B7CCE7F504A2979A394DFBE7D7B31BE7B57D165886D181A1AC4CD371D9169A7254144504A792636EB2E3A5AB1F19F3AE38FA50BA6DC26F6EEC1AE9D3B8B2E433441BD5E93167B4978BEE7C06BEFF572AD8D873AE1B7A40BA6BCF68CEFC66E69A197CAE0601D870F1F9460EF724AA979107E6BC3F7DFC4737F4929D5903748F9ECDEB5137BF68C175D866881E1A1211C3C2803DEDD2AEF7A6998D87C69A38FD96CA7DB1F7ABE27DBC495C88E1D63989890A97065363A3282FDFB268A2E436C419EB77FB899C76C36D43FE2799ED9E46344871A1A1C948BBD47ECD831863DE3BB8B2E436C529EB71FD9CC63361BEA5F87EC05530AFDFD55E96FED317BF68CCBDE3D5D64D55E2F5FDFD4E336FB424474AFE7CBB601DD4C87A14C79EB5107F6EF43AD3650741962033CDF5BBAD136BBD7B395ABFA1ECFF3FAB6F038D1013CCFC3CD371F81EFAF793CAD283122C24D470ECB5EF85D20CFD97B36FBB8AD847AC6CC7FE207120ADDE8D0A1037241F738CFF3AEECE9E3C9A9669DCA0F7C30F39F98D86C7A87DC2D7DFE26A20F2AA566B7F258519C3DE3BB313438587419A2034491C6C183FB8B2E43AC4129354B441FDAD263B7F89A5F54A4E648C9205BB7181CACCB5C74F12CC34343B2254407224550A4E64C6CFE712B8FDFFA4819E1F77CCF9701D32EA0C310870F1D2CBA0CD181F6EC1947BD2687597712DFF39740F8BDAD3E7E3BD31F7EDEF33D390AA7C311110E1F3924FDA7E2BA8808870E1D90F34E3B489EAB3FBFD5C76F39D44D6C188C4FF9816FB7FA1CA2F52626F6A2DA279395C4DA822090FEF50EE107BE05E3532636BCD5E7D8DE4465C27B3DCF8BB7F51CA265EAF51A76ED9463CEC48D0DD6EBF25EE9009EE7C520BC773BCFB1AD5037B1790CC0BF2A4F16B1741ADFF771E8E081A2CB105D6462622FFAE4535D61F21CFDD73C57B7FE3CDB2D8488DEE7FBBE4C6FEC30070EEC937E52B1292BFDEBB27544317CDF9F25A2F76DF779B61DEA26367F4B449764C979E7181E1EC2F0D050D165882ED4174518978DBFDA4E2905229A36B1F9DB6D3F5713EA0111FD9EE77B72804607F07D1F07F6EF2BBA0CD1C5C677EF425F14155D464FF17C6F9E887EB719CFD5945037B179AFE779463EB6156FFFBE09D9D7456C0B11E1E041E98669172282E7798989CDB606485734B3CFE4BFFA812C462A52BD5EC3C8C870D1658812A856FB64364C9BE4B9F9F1663D5FD342DDC4E65D9EE739F9ED5E0C22C2FE7DD2ED229A67CF9E7184954AD165945ADE4AB72636EF6AD673367B74F337A5B55E8C5DBB7642EBB0E832448928A5B06FBF9C8CD54A7EE02F02F8CD663E675343DDC4E61D9EE7B1B4D6DBAB52A9C85165A22586060751AFCBDE30ADB0AA2FFD9DCD7CDE56CC43FCA8EF4B6BBD9DF64DEC95538C44CBECDF372183A62DE007FE02808F35FB799B9E042636EFF07CE95B6F97DAC0008687654EBA681DAD3576EE182BBA8C52C95BE9CBCDEC4B5FD1AAE6DD47F2DF42A2C52626F6165D82E801E3E3BB65A7CF26F2037F1EC06FB7E2B95B12EA2636FFB7E7794BD25A6FAD91916154ABB25787683DDFF7B17BD7CEA2CB28055204CFF3E64D6CDED38AE76F6547ECC7FDC09F6BE1F3F73422C25E39C948B4D1AE5D3B653FA12608FC600EC0275AF5FC2D0B75139BF728A5CEC9005E6BEC181B4318CA1446D13E4A299965B54D4A2990A273CD5A3D7ADDD768D513030011FD841FC80E8ECDA694C2EE71395B52B4DFD8D8A83426B6C10FFC5922FAC956BE464B43DDC4E64B44F4653FF0B77C8A8778AEB1D11154E463B0280011C961D55BE4073E13D1974D6CFEA995AFD3F2BE11227ABD9C8ED43C4484DD725189028D8E8EA022DB076C9AE7793111FD44AB5FA7E5A16E627396409F0E822069F56BF502B9A044D1A461B17941102404FAB489CD9956BF567B4631096FF67CCFCA14C7ED918FBEA2538C8D8EC84C980D222278BE674178733B5EAF2DA16E62D300F06BF9847BB145C3C3433248253A82520ABB64DEFA86E4B9F76B790EB65CDBE61B9AD8BC4B29F5B81FC8010E5B258B3F4427D931360A4FA62CAFCB0F7C28A59E68C576006B69EB4F8488EEF43C6FB19DAF5916FDFD5539E95D7414CFF3303A365A74191DCDF3BC4522BAA39DAFD9D65037B1792C1F3435ED7CDD32D8B5535AE9A2F3C8465F6B0B82C010E88F4C6C1E6BE7EBB6FFB313E14D9E2FFBC26C46A552C1D0D060D16508F11C5A6BD96FFD3AF2C1D12510DED0EED76E7BA89BD858001F092A81AC34DDA09D3B77C87ED6A263C9A7C8E7CAF3ED2379DEB55521A31C2636EF25A2BFF3033F2DE2F5BB0911616C74A4E832845853BD5E935959ABF8819F12D1DFB5727F97F51436744D44AFF37D3F9316E8FA868786E0FB32634874B61D32600AE04A23CCF77D4B44AF2BAA86C242DDC46609C087A41B667D6372B1882E303A3A225D84B8DAEDF2A13CDF0A51E82453139BF710D13F4837CCF5856105B5DA40D165087143411060B05E2FBA8C42E5DD2EFF6862F3EE22EB287CE50011BDD6F7FD447ECB3FD7E888F4A58BEE31DAC3633F79B74B83885E53742D8587BA89CD2280FF47BA619EAB972F12D17D0607EB3D3BFEB3AADBA5F0C59585873A7065368C22F5595994F48C6AB52A330A445721A29E5C4F11048151A4FEA2A8D92ED7EA88500700105EEF79DE1429E986018091E1A1A24B1062D37AED7D9B1F223D05C28F155DCB8A8E0975139B0C846FAF542A72A006AEECC82844B7191818E8A92D792B954A0CC28B4C6CB2A26B59D131A10E0026361788E8A34125E8E92D7A07FAFBE5200CD1958808C33DD2051354827922FAA889CD54D1B5ACD651A10E0026366F574A7DB197A7390E8F482B5D74AFE1E1E1A24B68393FF053A5D4174D6CDE5E742DD7EAB8500700227AB5EFFB977B759AE3D0A084BAE85E0303FD084A7C6E423E7DF13211BDBAE85AAEA723433D9F16F4BC4A5889D163B95EEDEB43A5D23B7D92A29CEA655D88444025AC2C03F8964E98BE783D1D19EA006062739E883E5C092A7345D7D24EF5C1925E0CA2A79475756925A8CC11D1474C6CCE155DCB5A3A36D401C0C4E61DA4E8AF8220E89919318312EAA204EAF55AE9F68209822026459F33B17947D1B5ACA7A3431D0088E80795A71EF603DF155D4BAB05818FFE6AB5E83284D836CFF34AB56F911FF8AC3CF570A7F6A3AFD6F1A16E62C344F49DBDB03F4C593FB28ADE5496F7733E306A88E89526365C743D37D2F1A10E00263633008E56C2CA629983BD26C782891229434B9D8850092B8B00264D6CA68BAE6723BA22D401C0C4E60922FA8D326FFC55AF49A88BF288A2A8EB579706956096887EC3C4E6F1A26BD9A8AE09750030B179A722757F5009168AAEA5D9FAFAA29EDDE14E94576DA07B5BEB41255850A4EE37B17967D1B56C4657853A0018637E5229F5377EE02745D7D24C035DFCE617622D03B5FEA24BD8123FF013A5D4178C313F59742D9BD575A10E5C9911E379DE37FDC06FFB49DDADD2CD2D1A21D652EBC22E453FF0ADE779DF24A2BB8AAE652BBA32D44D6C1222FA37BEEF5FF24BB21C7960A03B5B3442AC47876157AD90F6031FBEEF5F22A27F6362D395BD015D19EA006062330BE0F67CAA51D1E56C8BD65AFAD34569F557BBA3C1924F5DCC00DC9EE74B57EADA500700139B8B00F6873AB4DD1CECFDFDB2E0489457B50BDEDF4484508716C09E3C57BA5657873A70650F7600FFA9125696BA35D825D4459975FA2AE97C2EFA1280FF94E74957EBFA5007AE9C714A44BF5A092BF3DD18ECD50E7FD30BB11DD56A5FC7EE039307FA3C11FD6AA79C31BA5DA508750030B1793711FD66B72D4E524AA12F8A8A2E438896514A218A74D1655C57BEB8E8374D6CDE5D742DCD529A5007F2C5494AFD4E25AC744DB04751D4B1AD18219AA5133F8D56C2CAAC52EA77BA6D71D18D942AD401C0C4E63F7453B0F7F5492B5D945FA7BDCF5705FA7F28BA96662B5DA8035783FD93DD10EC9174BD881ED0495D8C79A07FB28C810E9434D401C0C4E66DDD10EC9DF46617A2553AA5F1B22AD0DF56742DAD52DA5007AE067B4777C574DAC752215AC1F7FDC25796AEEA72296DA003250F75E06A57CC272A6165AED3062483209095A4A26714D55ACFA72DCE2AA53E51D62E97D54A1FEA006062F376A5D46F75DA3CF64EF9482A443B14F17E5F9987AE94FA9889CDDBDB5E40017A22D4812BD31D89E8BF54C2CA72A704BBD661D12508D1363A6CEFFB7D65A52811FD97B24D5B5C4FCF843A707581D207431DA69D10EC619BDFE44214A99DEFF77C2F9794883E54A685451BD153A10E5CD95200C0DE5087C60FFC420F916D77CB458822B5EB93A91FF81CEAD000D85B96A5FF9BD173A10E5CDD046CC2F7FD33451EB4212D75D14B2A954ACB574FFB816F7DDF3F0B60A20C9B736D454F863A0098D85C0270CCF3BC13411014B2197E18568A7859210A4144A8545AF79E0F8220F13CEF010093F9F5DD937A36D401C0C4668E885EA43CF5F9761F661D043E3CCF6BE74B0A51B8567D3A0D2AC182F2D4E789E8DB4D6CE65AF2225DA2A7431D004C6CD2C424DFE779DE1F54C2CA6CBB06505BD96211A253854D7EDFAFCC41F73CEFD38949BECFC4266DEA0B74A19E0FF51526366F544A7DAC5D876D48A88B5ED4CC55A52B5316F339E86F68DA13773909F555F2B9EC47431D2EFB81EF5AF95A41D03D87F10AD12C41931A337EE0BB5087CB4434D94B73D0374242FD1A26364F0198C80750E356BD4E45425DF4A020D8FEB6184110C4F980E88489CD93DBAFAA5C24D4AFC3C46686885EA03CF5D94AA5328716F4C6484B5DF4A26D356608A8542A73CA539F25A2E79BD8CC34AFB2F290505F83890D272679B5F2D4C7C2308C9BDDCF2E1B79895EB4D5F73D11210CC35879EA6389495E6D6253E8C2C14E26A17E032636EF20A283A10EA7FCC06FDAC8BADF848FA142749BAD84BA1FF869A8C329223A6862F38E1694552A12EA1B60623305E090E7799F0B2AC17C339E53E6A88B5EB4D9F77D5009E63DCFFB6B0087F2EB50DC8084FA0699D82CE7F3D97F3BD461ACD4F6FEE97C0975D1A37CFFC6EF7DA514421DC69EE7FD7662927F6762B3DC86D24A41427D934C6C7E8E880E542A95278220305B7D1E69A98B5EE5A9F5DFFB4110984AA5F204111D30B1F9B93695551A12EA5B6062730184239EE7DDBBD555A812EAA257796BB4D457AD0EBD178423BDBA21D77649A86F91898D35C6FCA852EAD7431D2E6C661055025DF4B2EBBDFFF3C1D005A5D4AF1B637ED4C4A6B0DD53BB9D84FA36E5FB358F7B9EF7971B6DB54BA88B5EB6FAFDBFAA75FE9700C67B71FFF36693506F02139BC5C4243FA094FA70BEC5C0BAADF6E2CF5C12A2388AAEC44EDE3A5F564A7D3831C90F98D82C165C5A2948A8379189CD7B00ECF03CEF33EBB5DAA5A52E7A1A61A575FE19003BF2EB463489847A9399D82C2526B933EF6BBFB89D19324294CDD367CE9AE538BEA494FAF5C424779AD82C155D53D948A8B748DE37B8CBF3BD4F853A5C9215A4A2974D5DB880071FFAFAE2ECDCDCEF02D8297DE7AD23A1DE422636CEC4E60D4434E979DE572A95CA1C1149F78BE8195996E1B1279E989B9E9EF94A66EDEDC78EDEF653B58181966E6BDDEBA4F9D806F9F6A02FD091FEA5D00BDF6A9D0B00C8A9D3A2D4CE9C3D975C9E9D4D99F9376E9F3CFAAEA2EBE915D2526F23139B77011871EC3E75F2C187E2F35317A4C5224AE7FCD40577F2C187E2CBB3B39F72CE8D48A0B797B4D4DBCCC4A631D0DFFF53A9CDDE353D33F3C9F9F9F917EDDD333ED8D7D7577469426CCBF2F2329E3E737636CDB27F76CEFDD8F16393B222B40012EA0570CCC8DFF0DF7BE2E4A9173FFEE4539F88B41EDF33BEBBDEAAD3D6856895244970E6ECB9B9D89873D6DA9F387E6CF24B45D7D4CB24D40BC0EE995E97FC02387AE2E4A97B1E79ECF19FAA56AB037B76EF1A90939144A74BB30C67CE9E5B585A5A5AB0D67EFCF8B1C90DCD68B1567600682509F50E915F10EF7DE0D483BFF48DC5C59FAED76AC1EE5D3BAB724292E8345996E1DCF9A9A5B9F9F94C06413B8F2446011CAF7D12577E81BCEB81530F7E606E7EFEA76BB501B57BD7AE6A20E12E0A966619CE9D3FBF343FBFE098F9A3B74F1E7D67D13589E792A4288073379EF4925F30EF7CE0D4831F989F5F78F3C0C080DAB963AC5F4B9FBB6833932498BA7071716161C131F36F6E37CCA5FBA5B524D40BB091505F7135DC4F9E7AFFE2E2E28F6B1D0EEC1CDB51EFEFAFB6AE4021002C2E2E61EAE2853963920567ED7FBBFDD8E4BB9BF1BCCEC999D1AD24A15E80ADB454F20BEADD274E9EFABEA7CCE95FF43CEFF0E060BDB673C70ED9F45134D5D4850B3C3B3B376FAD7D34B3F63DC78F4DFE79339F5F5AEAAD25A15E006686730E5B39E734BFC0FEFCC4C9532FB8343DF30B972E4D7FE7F0F07065D7CE1DFE564E601202B8F29E3C7FE14236333DD300D1DF586BFFE3F16393FFA315AF25A1DE5A12EA05B1D66E29D457E417DCAB4E9C3C353E3D33F30B172F5DFA89A1C1C1787474A41A69DDBC4245A9C5C6E0D2A5E9A5CBB3B391A7D4A7AC733F7FFCD8E4D956BEA6847A6B49A817C45A87664C45CF2FC09F02F0530F9C3CF5FEF985851F0E7C7FA85EAFD5A56B46AC65EAC2059E9B9B9F4BB3ECB2B3F6F78E37A9BF7C2324D45B4B42BD20AD7863AFEA777F713A3DF38EA90B17FFD7C1C1FAF2C8F070B52ADB10F4BCA5E5654CCFCC2CCDCECEF5799EF727D6DA5F69F7EACF95AE47D13A12EA05B1366BD973E717EA9D274E9EF26667E7DEB7B8B0780788F60D0D0EEAE1A1A1200C2B2D7B6DD15992A48199CB97D3CBB3B306CC4F65D6DE0FE07D93B7DD5A487339CBA495DE6A12EA0549D3D685FA8AE3C7262D80F70078CF8993A76E9A9E99F9999999991FF48320AAD76A0323C3434AB623289F34CB303D3DE3E6E6E717B2348D19F843E7DC878F1F9B7CB8E8DAB26CDDE37B451348A817246DF39B3BBFA0DF06E06D274E9EFAB64BD3D36FBC343D7D77A552416D60A0363C34A82A1569C177AB46A38199CBB36E7E6161BED16810803F72CE7DECF8B1C92F175DDB6AED68CCF43A09F58214F9E6CE2FF42F0378C38993A75ED268347EECD2F4F45DBEEF07F55AADAF5EAF057D5154587D626396E3187373F3E9DCFCFC7276A5097C9F73EE93C78F4D7EB1E8DAD692A6D2526F3509F582A48DCE7873E701F045006F3E71F2D4B75C9A9EFE9199CB975FC5CCFB6AB501571B18A80EF4F7CB117C1DC05A8B85C545CC2F2C2CCDCF2F28227ACA39F71966FED4F163935F2DBABE8D90506F3D09F58234D246D1253C471E0C5F05F073274E9EDA393B3BF7FD8B0B8B775BE7FE6DA5524907FAAB7D03030341B5AF6F5B73ECC5C638E7B0B4BC8C85858574617169B9D168049E527F97597B2F80CF1E3F363955748D9BD56874DEFBBE6C24D40BD2E89096FA5AF2C0F844FE07274E9E7A61A3D1B8EBF2ECDC7739E78E5782C054ABD54A7FB51AF5F54590FEF8ED6B341A585E8EB1B8B4142F2D2D351A69AA9552279C737FCDCCF71D3F36F92F45D7B85D0D69A9B79C847A41922429BA844DC903E56AA89C3879EAF949A3F192B9F9F9EF65E617135154EDEBB351A46B03FDFDD05A4B6B7E1DCE391863B0B0B8883836F34BCBCB1E33C744F4256BED5F02F8A7562DD32F5262BAEB7DDF8D24D40BC2CC68341A5DDBC23D7E6CF22B00BE02E0230070E2E4A989F98585972C2E2D7DD7A5E999973BE70E7B9E97681DDABE28EA8FA2C8D361885E3CAE2F49129824411CC776398E178D4994B5562BA51E65E6BF77CEFD35AE84F85345D7DA6A494342BDD524D40B6492A46B43FD5AC78F4D9E06F0E9FC0F00E0C4C953871717B3DB9796965FE429F5AD0C3EE61CEF082B95451D692FAC54AA611852A5524158A974F560ACB51649A38146A3812449386934964C6C6CD268F42B45170874D23AF7AFCCFCDF013C70FCD8E42345D7DC6E596665F1511B48A81728310930305074192D73FCD8E4A3001E05F0272BB79D38794A9B24396E926492886EF3943AC6C011E7DC041191EFFB4910F85CA954824A10F4054100DFF7AFFCF13CF8BEDFD66E1DE71CB22C4366ED95FF6619D23445234D971B8D469AA61965591632332BA54E13F08875EE24333F04E014801393B71D356D2BB883755B9763B792502F502FBEC98F1F9B3400FE7BFEE7594E9C3C35D46834261A8DC6DEA5A5E509223AA4949A20600F03BB987998996B007C224A3CA532CFF39C528A9552448A48294F794A79447435F93D4FF944E431B3B5D65D5D20C0CCCEBA2BFF63C7EC9C63E71C596B9575CE67E610404644F3443443C07906CE38E74E33F363004E03781AC0E9E3C7262FB7FC1FAFCBF5E2FBBD0812EA054A1299DEB55A1E8C97019C58EF7E274E9EAA30F3A0736E30CDB24100FD00AA0022001AC0009EFDDEEE03100248002CAFBA3D03B000C00088012C01580430BBF2E7F8B149F921358991506F8BFF1F6FBBECED14E42EE70000000049454E44AE426082);
/*!40000 ALTER TABLE `umm_user_propic` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.vp_app_expense_wkflw_det
DROP TABLE IF EXISTS `vp_app_expense_wkflw_det`;
CREATE TABLE IF NOT EXISTS `vp_app_expense_wkflw_det` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sort_order` int(11) NOT NULL,
  `level_id` int(11) NOT NULL,
  `workflow_id` int(11) NOT NULL,
  `data_entry` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `vp_app_expense_wkflw_det_ibfk_1` (`level_id`),
  KEY `vp_app_expense_wkflw_det_ibfk_2` (`workflow_id`),
  CONSTRAINT `vp_app_expense_wkflw_det_ibfk_1` FOREIGN KEY (`level_id`) REFERENCES `common_approval_group` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `vp_app_expense_wkflw_det_ibfk_2` FOREIGN KEY (`workflow_id`) REFERENCES `vp_app_wkflw_mst` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table papertrl_default_script.vp_app_expense_wkflw_det: ~0 rows (approximately)
/*!40000 ALTER TABLE `vp_app_expense_wkflw_det` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_app_expense_wkflw_det` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.vp_app_invoice_wkflw_det
DROP TABLE IF EXISTS `vp_app_invoice_wkflw_det`;
CREATE TABLE IF NOT EXISTS `vp_app_invoice_wkflw_det` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sort_order` int(11) NOT NULL,
  `level_id` int(11) NOT NULL,
  `workflow_id` int(11) NOT NULL,
  `data_entry` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK4jng2702ic9nfmpd870vmixty` (`level_id`) USING BTREE,
  KEY `workflow_id` (`workflow_id`) USING BTREE,
  CONSTRAINT `vp_app_invoice_wkflw_det_ibfk_1` FOREIGN KEY (`level_id`) REFERENCES `common_approval_group` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `vp_app_invoice_wkflw_det_ibfk_2` FOREIGN KEY (`workflow_id`) REFERENCES `vp_app_wkflw_mst` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table papertrl_default_script.vp_app_invoice_wkflw_det: ~0 rows (approximately)
/*!40000 ALTER TABLE `vp_app_invoice_wkflw_det` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_app_invoice_wkflw_det` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.vp_app_opportunity_wkflw_det
DROP TABLE IF EXISTS `vp_app_opportunity_wkflw_det`;
CREATE TABLE IF NOT EXISTS `vp_app_opportunity_wkflw_det` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sort_order` int(11) NOT NULL,
  `level_id` int(11) NOT NULL,
  `workflow_id` int(11) NOT NULL,
  `data_entry` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `vp_app_opportunity_wkflw_det_ibfk_1` (`level_id`),
  KEY `vp_app_opportunity_wkflw_det_ibfk_2` (`workflow_id`),
  CONSTRAINT `vp_app_opportunity_wkflw_det_ibfk_1` FOREIGN KEY (`level_id`) REFERENCES `common_approval_group` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `vp_app_opportunity_wkflw_det_ibfk_2` FOREIGN KEY (`workflow_id`) REFERENCES `vp_app_wkflw_mst` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table papertrl_default_script.vp_app_opportunity_wkflw_det: ~0 rows (approximately)
/*!40000 ALTER TABLE `vp_app_opportunity_wkflw_det` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_app_opportunity_wkflw_det` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.vp_app_po_wkflw_det
DROP TABLE IF EXISTS `vp_app_po_wkflw_det`;
CREATE TABLE IF NOT EXISTS `vp_app_po_wkflw_det` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sort_order` int(11) NOT NULL,
  `level_id` int(11) NOT NULL,
  `workflow_id` int(11) NOT NULL,
  `data_entry` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK4jng2702ic9nfmpd870vmixty` (`level_id`) USING BTREE,
  KEY `workflow_id` (`workflow_id`) USING BTREE,
  CONSTRAINT `vp_app_po_wkflw_det_ibfk_1` FOREIGN KEY (`level_id`) REFERENCES `common_approval_group` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `vp_app_po_wkflw_det_ibfk_2` FOREIGN KEY (`workflow_id`) REFERENCES `vp_app_wkflw_mst` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table papertrl_default_script.vp_app_po_wkflw_det: ~0 rows (approximately)
/*!40000 ALTER TABLE `vp_app_po_wkflw_det` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_app_po_wkflw_det` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.vp_app_project_wkflw_det
DROP TABLE IF EXISTS `vp_app_project_wkflw_det`;
CREATE TABLE IF NOT EXISTS `vp_app_project_wkflw_det` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sort_order` int(11) NOT NULL,
  `level_id` int(11) NOT NULL,
  `workflow_id` int(11) NOT NULL,
  `data_entry` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK4jng2702ic9nfmpd870vmixty` (`level_id`) USING BTREE,
  KEY `workflow_id` (`workflow_id`) USING BTREE,
  CONSTRAINT `vp_app_project_wkflw_det_ibfk_1` FOREIGN KEY (`level_id`) REFERENCES `common_approval_group` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `vp_app_project_wkflw_det_ibfk_2` FOREIGN KEY (`workflow_id`) REFERENCES `vp_app_wkflw_mst` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table papertrl_default_script.vp_app_project_wkflw_det: ~0 rows (approximately)
/*!40000 ALTER TABLE `vp_app_project_wkflw_det` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_app_project_wkflw_det` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.vp_app_proposal_wkflw_det
DROP TABLE IF EXISTS `vp_app_proposal_wkflw_det`;
CREATE TABLE IF NOT EXISTS `vp_app_proposal_wkflw_det` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sort_order` int(11) NOT NULL,
  `level_id` int(11) NOT NULL,
  `workflow_id` int(11) NOT NULL,
  `data_entry` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `vp_app_proposal_wkflw_det_ibfk_1` (`level_id`),
  KEY `vp_app_proposal_wkflw_det_ibfk_2` (`workflow_id`),
  CONSTRAINT `vp_app_proposal_wkflw_det_ibfk_1` FOREIGN KEY (`level_id`) REFERENCES `common_approval_group` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `vp_app_proposal_wkflw_det_ibfk_2` FOREIGN KEY (`workflow_id`) REFERENCES `vp_app_wkflw_mst` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table papertrl_default_script.vp_app_proposal_wkflw_det: ~0 rows (approximately)
/*!40000 ALTER TABLE `vp_app_proposal_wkflw_det` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_app_proposal_wkflw_det` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.vp_app_wkflw_mst
DROP TABLE IF EXISTS `vp_app_wkflw_mst`;
CREATE TABLE IF NOT EXISTS `vp_app_wkflw_mst` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `created_by` varchar(100) NOT NULL,
  `created_on` datetime NOT NULL,
  `status` char(2) NOT NULL,
  `update_on` datetime DEFAULT NULL,
  `update_by` varchar(100) DEFAULT NULL,
  `delete_on` datetime DEFAULT NULL,
  `delete_by` varchar(100) DEFAULT '',
  `project_code_entry_level` int(2) DEFAULT NULL,
  `proposal_code_entry_level` int(2) DEFAULT NULL,
  `opportunity_code_entry_level` int(2) DEFAULT NULL,
  `expense_code_entry_level` int(2) DEFAULT NULL,
  `vp_invoice_code_entry_level` int(2) DEFAULT NULL,
  `purches_order_code_enty_level` int(2) DEFAULT NULL,
  `defaultWrkflow` tinyint(1) DEFAULT NULL,
  `client_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table papertrl_default_script.vp_app_wkflw_mst: ~0 rows (approximately)
/*!40000 ALTER TABLE `vp_app_wkflw_mst` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_app_wkflw_mst` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.vp_bill
DROP TABLE IF EXISTS `vp_bill`;
CREATE TABLE IF NOT EXISTS `vp_bill` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `automation_id` int(11) DEFAULT NULL,
  `vendor_id` int(11) DEFAULT NULL,
  `uuid` varchar(100) NOT NULL,
  `po_id` int(11) DEFAULT NULL,
  `receipt_id` int(11) DEFAULT NULL,
  `bill_attachment_id` int(11) DEFAULT NULL,
  `term` int(11) DEFAULT NULL,
  `balance_amount` decimal(19,2) DEFAULT NULL,
  `bill_amount` decimal(19,2) DEFAULT NULL,
  `discount_amount` decimal(19,2) DEFAULT NULL,
  `discount_percentage` decimal(5,2) DEFAULT NULL,
  `discount_days_due` int(3) DEFAULT NULL,
  `net_days_due` int(3) DEFAULT NULL,
  `due_date` datetime DEFAULT NULL,
  `bill_date_str` varchar(40) DEFAULT NULL,
  `bill_date_format` varchar(40) DEFAULT NULL,
  `bill_date` date DEFAULT NULL,
  `bill_no` varchar(50) DEFAULT NULL,
  `content_extractable` char(1) DEFAULT NULL,
  `remark` longtext DEFAULT NULL,
  `template_id` int(11) DEFAULT NULL,
  `submitted_on` datetime DEFAULT NULL,
  `submitted_by` varchar(100) DEFAULT NULL,
  `submitted_by_name` varchar(200) DEFAULT NULL,
  `deletection_level` char(1) DEFAULT NULL,
  `tax` decimal(19,2) DEFAULT NULL,
  `additional_notes` varchar(500) DEFAULT NULL,
  `discount_applicable_date` datetime DEFAULT NULL,
  `bill_type` char(1) DEFAULT NULL,
  `applicable_discount_amount` decimal(19,2) DEFAULT NULL,
  `workflow_id` int(11) DEFAULT NULL,
  `workflow_level` int(11) DEFAULT NULL,
  `no_of_levels` int(3) DEFAULT NULL,
  `remaining_celing` decimal(19,2) DEFAULT NULL,
  `approval_user` varchar(100) DEFAULT NULL,
  `approval_group_name` varchar(75) DEFAULT NULL,
  `approval_group` int(11) DEFAULT NULL,
  `approval_user_name` varchar(200) DEFAULT NULL,
  `export_status` char(1) DEFAULT NULL,
  `payment_status` char(2) DEFAULT NULL,
  `status` char(1) NOT NULL,
  `approved_date` datetime DEFAULT NULL,
  `submitted_by_vendor` tinyint(1) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `created_by` varchar(100) NOT NULL,
  `created_on` datetime NOT NULL,
  `update_by` varchar(100) DEFAULT NULL,
  `update_on` datetime DEFAULT NULL,
  `delete_by` varchar(100) DEFAULT NULL,
  `delete_on` datetime DEFAULT NULL,
  `paid_amount` decimal(19,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK39h0uns08ssn9fvuqlpktjdj8` (`vendor_id`) USING BTREE,
  KEY `PO_KEY_FK_1` (`po_id`),
  KEY `AUTOMATION_ID_FK_6` (`automation_id`),
  KEY `WORKFLOW_ID_FK_9` (`workflow_id`),
  KEY `BILL_ATTACHMENT_ID_FK_1` (`bill_attachment_id`),
  KEY `PO_RECEIPT_FK_1` (`receipt_id`),
  KEY `DEPT_ID_FK` (`department_id`),
  CONSTRAINT `AUTOMATION_ID_FK_6` FOREIGN KEY (`automation_id`) REFERENCES `common_automation_mst` (`id`),
  CONSTRAINT `DEPT_ID_FK` FOREIGN KEY (`department_id`) REFERENCES `common_department` (`id`),
  CONSTRAINT `PO_KEY_FK_1` FOREIGN KEY (`po_id`) REFERENCES `vp_po_mst` (`id`),
  CONSTRAINT `PO_RECEIPT_FK_1` FOREIGN KEY (`receipt_id`) REFERENCES `vp_po_receipt_mst` (`id`),
  CONSTRAINT `VENDOR_ID_FK_8` FOREIGN KEY (`vendor_id`) REFERENCES `vp_vendor_mst` (`id`),
  CONSTRAINT `WORKFLOW_ID_FK_9` FOREIGN KEY (`workflow_id`) REFERENCES `common_document_workflow_config` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table papertrl_default_script.vp_bill: ~0 rows (approximately)
/*!40000 ALTER TABLE `vp_bill` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_bill` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.vp_bill_additional_data
DROP TABLE IF EXISTS `vp_bill_additional_data`;
CREATE TABLE IF NOT EXISTS `vp_bill_additional_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field_value` varchar(200) DEFAULT NULL,
  `field_id` int(15) NOT NULL,
  `field_name` varchar(50) DEFAULT NULL,
  `bill_mst_id` int(15) NOT NULL,
  `field_type_id` int(11) DEFAULT NULL,
  `section_id` int(11) NOT NULL,
  `detail_id` int(11) DEFAULT NULL,
  `display_order` int(11) NOT NULL,
  `multiple_status` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK__vp_invoice_mst` (`bill_mst_id`),
  CONSTRAINT `FK__vp_invoice_mst` FOREIGN KEY (`bill_mst_id`) REFERENCES `vp_bill` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table papertrl_default_script.vp_bill_additional_data: ~0 rows (approximately)
/*!40000 ALTER TABLE `vp_bill_additional_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_bill_additional_data` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.vp_bill_additional_field_attachment
DROP TABLE IF EXISTS `vp_bill_additional_field_attachment`;
CREATE TABLE IF NOT EXISTS `vp_bill_additional_field_attachment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field_id` int(11) NOT NULL,
  `bill_mst_id` int(11) NOT NULL,
  `attachment_url` varchar(200) NOT NULL,
  `file_name` varchar(200) DEFAULT NULL,
  `file_type` varchar(100) DEFAULT NULL,
  `status` char(1) NOT NULL,
  `delete_by` varchar(100) DEFAULT '',
  `delete_on` datetime DEFAULT NULL,
  `field_name` varchar(50) NOT NULL,
  `section_id` int(11) NOT NULL,
  `detail_id` int(11) DEFAULT NULL,
  `display_order` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_inv_mst` (`bill_mst_id`),
  CONSTRAINT `FK_inv_mst` FOREIGN KEY (`bill_mst_id`) REFERENCES `vp_bill` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table papertrl_default_script.vp_bill_additional_field_attachment: ~0 rows (approximately)
/*!40000 ALTER TABLE `vp_bill_additional_field_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_bill_additional_field_attachment` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.vp_bill_assignee
DROP TABLE IF EXISTS `vp_bill_assignee`;
CREATE TABLE IF NOT EXISTS `vp_bill_assignee` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `assignee` varchar(100) NOT NULL,
  `invoice_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `invoice_id` (`invoice_id`) USING BTREE,
  KEY `assignees` (`assignee`) USING BTREE,
  CONSTRAINT `vp_bill_assignee_ibfk_1` FOREIGN KEY (`invoice_id`) REFERENCES `vp_bill` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table papertrl_default_script.vp_bill_assignee: ~0 rows (approximately)
/*!40000 ALTER TABLE `vp_bill_assignee` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_bill_assignee` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.vp_bill_attachment
DROP TABLE IF EXISTS `vp_bill_attachment`;
CREATE TABLE IF NOT EXISTS `vp_bill_attachment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bill_id` int(11) DEFAULT NULL,
  `file_name` varchar(200) NOT NULL,
  `file_type` varchar(50) NOT NULL,
  `attachment_url` varchar(300) NOT NULL,
  `status` char(1) NOT NULL DEFAULT 'A',
  `delete_by` varchar(100) DEFAULT '',
  `delete_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `BILL_ID_FK_1` (`bill_id`),
  CONSTRAINT `BILL_ID_FK_1` FOREIGN KEY (`bill_id`) REFERENCES `vp_bill` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table papertrl_default_script.vp_bill_attachment: ~0 rows (approximately)
/*!40000 ALTER TABLE `vp_bill_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_bill_attachment` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.vp_bill_audit_trail
DROP TABLE IF EXISTS `vp_bill_audit_trail`;
CREATE TABLE IF NOT EXISTS `vp_bill_audit_trail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_date` datetime NOT NULL,
  `status_id` int(11) NOT NULL,
  `user_id` varchar(100) NOT NULL,
  `user_name` varchar(200) NOT NULL,
  `comment` varchar(1000) DEFAULT '',
  `bill_id` int(11) NOT NULL,
  `undo_status` char(1) DEFAULT NULL,
  `undo_action` tinyint(1) DEFAULT NULL,
  `automation_name` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKbcyeuds2xgf57mx6c46cmrmag` (`bill_id`) USING BTREE,
  KEY `status_id` (`status_id`) USING BTREE,
  CONSTRAINT `vp_bill_audit_trail_ibfk_1` FOREIGN KEY (`bill_id`) REFERENCES `vp_bill` (`id`),
  CONSTRAINT `vp_bill_audit_trail_ibfk_2` FOREIGN KEY (`status_id`) REFERENCES `common_audit_trial_status` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table papertrl_default_script.vp_bill_audit_trail: ~0 rows (approximately)
/*!40000 ALTER TABLE `vp_bill_audit_trail` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_bill_audit_trail` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.vp_bill_audit_trail_cost_distribution
DROP TABLE IF EXISTS `vp_bill_audit_trail_cost_distribution`;
CREATE TABLE IF NOT EXISTS `vp_bill_audit_trail_cost_distribution` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `audit_trail_id` int(11) NOT NULL,
  `cost_type` varchar(100) NOT NULL,
  `number` varchar(100) NOT NULL,
  `project_code` varchar(100) DEFAULT NULL,
  `department` varchar(100) DEFAULT NULL,
  `qty` decimal(19,2) DEFAULT 0.00,
  `cost` decimal(19,2) DEFAULT 0.00,
  `amount` decimal(19,2) NOT NULL DEFAULT 0.00,
  `changed` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table papertrl_default_script.vp_bill_audit_trail_cost_distribution: ~0 rows (approximately)
/*!40000 ALTER TABLE `vp_bill_audit_trail_cost_distribution` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_bill_audit_trail_cost_distribution` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.vp_bill_create_detail
DROP TABLE IF EXISTS `vp_bill_create_detail`;
CREATE TABLE IF NOT EXISTS `vp_bill_create_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bill_id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `sort_order` int(3) DEFAULT NULL,
  `item_number` varchar(50) DEFAULT '',
  `item_name` varchar(300) NOT NULL DEFAULT '',
  `description` varchar(150) DEFAULT NULL,
  `qty` decimal(12,2) NOT NULL,
  `uom_id` int(11) DEFAULT NULL,
  `unit_price` decimal(19,0) NOT NULL,
  `amount` decimal(19,0) NOT NULL,
  `discount_amount` decimal(19,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_invoice` (`bill_id`) USING BTREE,
  CONSTRAINT `BILL_CREATE_BILL_ID_FK_1` FOREIGN KEY (`bill_id`) REFERENCES `vp_bill` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table papertrl_default_script.vp_bill_create_detail: ~0 rows (approximately)
/*!40000 ALTER TABLE `vp_bill_create_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_bill_create_detail` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.vp_bill_expense_cost_distribution
DROP TABLE IF EXISTS `vp_bill_expense_cost_distribution`;
CREATE TABLE IF NOT EXISTS `vp_bill_expense_cost_distribution` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) NOT NULL,
  `description` varchar(500) DEFAULT '',
  `amount` decimal(19,2) NOT NULL,
  `billable` tinyint(1) DEFAULT NULL,
  `tax` tinyint(1) DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  `bill_id` int(11) NOT NULL,
  `department_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_vp_vendor_item_cost_distribution_vp_vendor_mst` (`bill_id`),
  KEY `FK_vp_vendor_item_cost_distribution_common_chart_of_account` (`account_id`),
  KEY `PROJECT_ID_FK_3` (`project_id`),
  KEY `DEPT_ID_FK_1` (`department_id`),
  CONSTRAINT `DEPT_ID_FK_1` FOREIGN KEY (`department_id`) REFERENCES `common_department` (`id`),
  CONSTRAINT `FK_vp_vendor_item_cost_distribution_common_chart_of_account` FOREIGN KEY (`account_id`) REFERENCES `common_account_number` (`id`),
  CONSTRAINT `FK_vp_vendor_item_cost_distribution_vp_vendor_mst` FOREIGN KEY (`bill_id`) REFERENCES `vp_bill` (`id`),
  CONSTRAINT `PROJECT_ID_FK_3` FOREIGN KEY (`project_id`) REFERENCES `common_approval_code` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table papertrl_default_script.vp_bill_expense_cost_distribution: ~0 rows (approximately)
/*!40000 ALTER TABLE `vp_bill_expense_cost_distribution` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_bill_expense_cost_distribution` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.vp_bill_item_cost_distribution
DROP TABLE IF EXISTS `vp_bill_item_cost_distribution`;
CREATE TABLE IF NOT EXISTS `vp_bill_item_cost_distribution` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) DEFAULT NULL,
  `description` varchar(500) DEFAULT '',
  `qty` decimal(12,2) NOT NULL DEFAULT 0.00,
  `rate` decimal(19,2) NOT NULL,
  `amount` decimal(19,2) NOT NULL,
  `billable` tinyint(1) DEFAULT NULL,
  `tax` tinyint(1) DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  `po_id` int(11) DEFAULT NULL,
  `bill_id` int(11) NOT NULL,
  `item_number` varchar(50) DEFAULT '',
  `item_name` varchar(300) DEFAULT '',
  `department_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_vp_invoice_item_cost_distribution_common_product_mst` (`item_id`),
  KEY `FK_vp_invoice_item_cost_distribution_vp_vendor_invoice` (`bill_id`),
  KEY `PROJECT_ID_FK_1` (`project_id`),
  KEY `PO_ID_FK_1` (`po_id`),
  KEY `DEPTID_FK` (`department_id`),
  CONSTRAINT `DEPTID_FK` FOREIGN KEY (`department_id`) REFERENCES `common_department` (`id`),
  CONSTRAINT `FK_vp_invoice_item_cost_distribution_common_product_mst` FOREIGN KEY (`item_id`) REFERENCES `common_item_mst` (`id`),
  CONSTRAINT `FK_vp_invoice_item_cost_distribution_vp_vendor_invoice` FOREIGN KEY (`bill_id`) REFERENCES `vp_bill` (`id`),
  CONSTRAINT `PO_ID_FK_1` FOREIGN KEY (`po_id`) REFERENCES `vp_po_mst` (`id`),
  CONSTRAINT `PROJECT_ID_FK_1` FOREIGN KEY (`project_id`) REFERENCES `common_approval_code` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table papertrl_default_script.vp_bill_item_cost_distribution: ~0 rows (approximately)
/*!40000 ALTER TABLE `vp_bill_item_cost_distribution` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_bill_item_cost_distribution` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.vp_bill_payment
DROP TABLE IF EXISTS `vp_bill_payment`;
CREATE TABLE IF NOT EXISTS `vp_bill_payment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `payment_referance_no` varchar(30) NOT NULL,
  `payment_date` datetime NOT NULL,
  `payment_type` char(1) DEFAULT NULL,
  `payment_type_description` varchar(200) DEFAULT NULL,
  `bill_id` int(11) NOT NULL,
  `amount` decimal(19,2) NOT NULL,
  `discount_amount` decimal(19,2) NOT NULL,
  `status` char(1) DEFAULT NULL,
  `mailed_date` datetime DEFAULT NULL,
  `mailed_user` varchar(50) DEFAULT NULL,
  `sync_id` int(11) DEFAULT NULL,
  `bill_no` varchar(50) DEFAULT '',
  `import_id` int(11) DEFAULT NULL,
  `ap_account_ref` int(11) DEFAULT NULL,
  `bank_account_ref` int(11) DEFAULT NULL,
  `distribution_id` int(11) DEFAULT NULL,
  `export_status` char(1) DEFAULT NULL,
  `update_by` varchar(100) DEFAULT NULL,
  `update_on` datetime DEFAULT NULL,
  `created_by` varchar(100) NOT NULL,
  `created_on` datetime NOT NULL,
  `delete_by` varchar(100) DEFAULT NULL,
  `delete_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `invoice_id` (`bill_id`) USING BTREE,
  KEY `FK_IMPORT_MST` (`import_id`),
  KEY `FK_AP_ACCOUNT` (`ap_account_ref`),
  KEY `FK_BANK_ACCOUNT_REF` (`bank_account_ref`),
  CONSTRAINT `BILL_PAYMENT_BILL_ID_FK_1` FOREIGN KEY (`bill_id`) REFERENCES `vp_bill` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_AP_ACCOUNT` FOREIGN KEY (`ap_account_ref`) REFERENCES `common_account_number` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_BANK_ACCOUNT_REF` FOREIGN KEY (`bank_account_ref`) REFERENCES `common_account_number` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_IMPORT_MST` FOREIGN KEY (`import_id`) REFERENCES `vp_bill_payment_import_mst` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table papertrl_default_script.vp_bill_payment: ~0 rows (approximately)
/*!40000 ALTER TABLE `vp_bill_payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_bill_payment` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.vp_bill_payment_additional_data
DROP TABLE IF EXISTS `vp_bill_payment_additional_data`;
CREATE TABLE IF NOT EXISTS `vp_bill_payment_additional_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field_value` varchar(200) DEFAULT NULL,
  `field_value_date` date DEFAULT NULL,
  `field_id` int(15) NOT NULL,
  `field_name` varchar(50) DEFAULT NULL,
  `payment_mst_id` int(15) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK__vp_payment_mst` (`payment_mst_id`),
  CONSTRAINT `FK__vp_payment_mst` FOREIGN KEY (`payment_mst_id`) REFERENCES `vp_bill_payment` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table papertrl_default_script.vp_bill_payment_additional_data: ~0 rows (approximately)
/*!40000 ALTER TABLE `vp_bill_payment_additional_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_bill_payment_additional_data` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.vp_bill_payment_additional_field_attachment
DROP TABLE IF EXISTS `vp_bill_payment_additional_field_attachment`;
CREATE TABLE IF NOT EXISTS `vp_bill_payment_additional_field_attachment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field_id` int(11) NOT NULL,
  `payment_mst_id` int(11) NOT NULL,
  `attachment_url` varchar(200) NOT NULL,
  `file_name` varchar(200) DEFAULT NULL,
  `file_type` varchar(100) DEFAULT NULL,
  `status` char(1) NOT NULL,
  `delete_by` varchar(100) DEFAULT '',
  `delete_on` datetime DEFAULT NULL,
  `field_name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_payment_mst` (`payment_mst_id`),
  CONSTRAINT `FK_payment_mst` FOREIGN KEY (`payment_mst_id`) REFERENCES `vp_bill_payment` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table papertrl_default_script.vp_bill_payment_additional_field_attachment: ~0 rows (approximately)
/*!40000 ALTER TABLE `vp_bill_payment_additional_field_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_bill_payment_additional_field_attachment` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.vp_bill_payment_attachment
DROP TABLE IF EXISTS `vp_bill_payment_attachment`;
CREATE TABLE IF NOT EXISTS `vp_bill_payment_attachment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bill_payment_id` int(11) NOT NULL,
  `payment_data` mediumblob NOT NULL,
  `name` varchar(200) NOT NULL,
  `file_type` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table papertrl_default_script.vp_bill_payment_attachment: ~0 rows (approximately)
/*!40000 ALTER TABLE `vp_bill_payment_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_bill_payment_attachment` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.vp_bill_payment_distribution
DROP TABLE IF EXISTS `vp_bill_payment_distribution`;
CREATE TABLE IF NOT EXISTS `vp_bill_payment_distribution` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `un_tag_referance` int(11) NOT NULL,
  `invoice_referance` int(11) NOT NULL,
  `distribute_amount` decimal(19,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table papertrl_default_script.vp_bill_payment_distribution: ~0 rows (approximately)
/*!40000 ALTER TABLE `vp_bill_payment_distribution` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_bill_payment_distribution` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.vp_bill_payment_import_issue
DROP TABLE IF EXISTS `vp_bill_payment_import_issue`;
CREATE TABLE IF NOT EXISTS `vp_bill_payment_import_issue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `import_mst_id` int(11) NOT NULL,
  `record` text DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL,
  `line_no` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_IMPORT_MST2` (`import_mst_id`),
  CONSTRAINT `FK_IMPORT_MST2` FOREIGN KEY (`import_mst_id`) REFERENCES `vp_bill_payment_import_mst` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table papertrl_default_script.vp_bill_payment_import_issue: ~0 rows (approximately)
/*!40000 ALTER TABLE `vp_bill_payment_import_issue` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_bill_payment_import_issue` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.vp_bill_payment_import_mst
DROP TABLE IF EXISTS `vp_bill_payment_import_mst`;
CREATE TABLE IF NOT EXISTS `vp_bill_payment_import_mst` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(100) NOT NULL,
  `total_records` int(11) DEFAULT NULL,
  `succeeded` int(11) DEFAULT NULL,
  `failed` int(11) DEFAULT NULL,
  `created_by` varchar(100) NOT NULL DEFAULT '',
  `created_on` datetime NOT NULL,
  `update_by` varchar(100) DEFAULT NULL,
  `update_on` datetime DEFAULT NULL,
  `delete_by` varchar(100) DEFAULT NULL,
  `delete_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table papertrl_default_script.vp_bill_payment_import_mst: ~0 rows (approximately)
/*!40000 ALTER TABLE `vp_bill_payment_import_mst` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_bill_payment_import_mst` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.vp_bill_related_grn
DROP TABLE IF EXISTS `vp_bill_related_grn`;
CREATE TABLE IF NOT EXISTS `vp_bill_related_grn` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_mst_id` int(11) NOT NULL,
  `grn_mst_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_vp_invoice_related_grn_vp_vendor_invoice` (`invoice_mst_id`),
  KEY `FK_vp_invoice_related_grn_vp_grn_mst` (`grn_mst_id`),
  CONSTRAINT `FK_vp_invoice_related_grn_vp_grn_mst` FOREIGN KEY (`grn_mst_id`) REFERENCES `vp_po_receipt_mst` (`id`),
  CONSTRAINT `FK_vp_invoice_related_grn_vp_vendor_invoice` FOREIGN KEY (`invoice_mst_id`) REFERENCES `vp_bill` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table papertrl_default_script.vp_bill_related_grn: ~0 rows (approximately)
/*!40000 ALTER TABLE `vp_bill_related_grn` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_bill_related_grn` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.vp_bill_temp
DROP TABLE IF EXISTS `vp_bill_temp`;
CREATE TABLE IF NOT EXISTS `vp_bill_temp` (
  `temp_rcd_id` int(11) NOT NULL AUTO_INCREMENT,
  `id` int(11) NOT NULL,
  `approval_status` char(2) NOT NULL,
  `approved_by` varchar(100) DEFAULT '',
  `approved_date` datetime DEFAULT NULL,
  `attachment_url` varchar(250) NOT NULL,
  `balance_amount` decimal(19,2) DEFAULT NULL,
  `entered_to_gcs_on` datetime DEFAULT NULL,
  `invoice_amount` decimal(19,2) DEFAULT NULL,
  `discount_amount` decimal(19,2) DEFAULT NULL,
  `discount_percentage` decimal(5,2) DEFAULT NULL,
  `discount_days_due` int(3) DEFAULT NULL,
  `net_days_due` int(3) DEFAULT NULL,
  `due_date` datetime DEFAULT NULL,
  `invoice_date_str` varchar(40) DEFAULT NULL,
  `invoice_date_format` varchar(40) DEFAULT NULL,
  `invoice_date` datetime DEFAULT NULL,
  `invoice_no` varchar(50) DEFAULT NULL,
  `content_extractable` char(1) DEFAULT NULL,
  `paid_by_card` varchar(2) DEFAULT NULL,
  `payment_status` char(2) NOT NULL,
  `record_status` char(2) NOT NULL,
  `remark` longtext DEFAULT NULL,
  `vendor` int(11) DEFAULT NULL,
  `term_id` int(11) DEFAULT NULL,
  `original_file_name` varchar(150) NOT NULL,
  `created_on` datetime NOT NULL,
  `update_by` varchar(100) DEFAULT NULL,
  `update_on` datetime DEFAULT NULL,
  `delete_by` varchar(100) DEFAULT NULL,
  `delete_on` datetime DEFAULT NULL,
  `template_id` int(11) DEFAULT NULL,
  `submitted_on` datetime DEFAULT NULL,
  `submitted_by` varchar(100) DEFAULT '',
  `deletection_level` char(1) DEFAULT NULL,
  `attachment_url_approved` varchar(250) DEFAULT NULL,
  `temp_sync_date_time` datetime NOT NULL,
  `tax` decimal(19,2) DEFAULT NULL,
  `additional_notes` varchar(500) DEFAULT NULL,
  `discount_applicable_date` datetime DEFAULT NULL,
  `invoice_type` char(1) DEFAULT NULL,
  `applicable_discount_amount` decimal(19,2) DEFAULT NULL,
  `workflow_id` int(11) DEFAULT NULL,
  `workflow_level` int(11) DEFAULT NULL,
  `no_of_levels` int(3) DEFAULT NULL,
  `code_entry_level` int(11) DEFAULT NULL,
  `approval_group_level` int(3) DEFAULT NULL,
  `remaining_celing` decimal(10,2) DEFAULT NULL,
  `po_id` int(11) DEFAULT NULL,
  `created_by` varchar(100) NOT NULL,
  PRIMARY KEY (`temp_rcd_id`),
  KEY `FK39h0uns08ssn9fvuqlpktjdj8` (`vendor`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table papertrl_default_script.vp_bill_temp: ~0 rows (approximately)
/*!40000 ALTER TABLE `vp_bill_temp` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_bill_temp` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.vp_bill_template_detail
DROP TABLE IF EXISTS `vp_bill_template_detail`;
CREATE TABLE IF NOT EXISTS `vp_bill_template_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `template_id` int(11) NOT NULL,
  `field_name` varchar(50) NOT NULL,
  `page_no` int(3) NOT NULL,
  `axis_x` float(10,2) NOT NULL,
  `axis_y` float(10,2) NOT NULL,
  `width` float(10,2) NOT NULL,
  `height` float(10,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `template_id` (`template_id`) USING BTREE,
  CONSTRAINT `vp_bill_template_detail_ibfk_1` FOREIGN KEY (`template_id`) REFERENCES `vp_bill_template_mst` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table papertrl_default_script.vp_bill_template_detail: ~0 rows (approximately)
/*!40000 ALTER TABLE `vp_bill_template_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_bill_template_detail` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.vp_bill_template_mst
DROP TABLE IF EXISTS `vp_bill_template_mst`;
CREATE TABLE IF NOT EXISTS `vp_bill_template_mst` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vendor_id` int(11) NOT NULL,
  `template_name` varchar(100) NOT NULL,
  `bill_date_format` varchar(30) DEFAULT NULL,
  `bill_id` int(11) DEFAULT NULL,
  `bill_term` int(11) DEFAULT NULL,
  `created_by` varchar(100) NOT NULL,
  `created_on` datetime NOT NULL,
  `update_by` varchar(100) DEFAULT NULL,
  `update_on` datetime DEFAULT NULL,
  `delete_by` varchar(100) DEFAULT NULL,
  `delete_on` datetime DEFAULT NULL,
  `status` char(1) NOT NULL DEFAULT 'A',
  `po_no` varchar(100) DEFAULT NULL,
  `bill_amount` decimal(10,2) DEFAULT 0.00,
  `bill_date_str` varchar(100) DEFAULT NULL,
  `bill_no` varchar(100) DEFAULT NULL,
  `attachment_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `vendor_id` (`vendor_id`) USING BTREE,
  KEY `invoice_id` (`bill_id`) USING BTREE,
  CONSTRAINT `vp_bill_template_mst_ibfk_2` FOREIGN KEY (`bill_id`) REFERENCES `vp_bill` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table papertrl_default_script.vp_bill_template_mst: ~0 rows (approximately)
/*!40000 ALTER TABLE `vp_bill_template_mst` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_bill_template_mst` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.vp_bill_term
DROP TABLE IF EXISTS `vp_bill_term`;
CREATE TABLE IF NOT EXISTS `vp_bill_term` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `term` varchar(50) NOT NULL,
  `in_months` int(4) DEFAULT NULL,
  `on_month` int(4) DEFAULT NULL,
  `on_day` int(4) DEFAULT NULL,
  `net_days_due` int(4) NOT NULL,
  `discount_percentage` decimal(5,2) DEFAULT NULL,
  `discount_days_due` int(4) DEFAULT NULL,
  `end_of_month` tinyint(1) DEFAULT 0,
  `from_entry` tinyint(1) DEFAULT 0,
  `status` char(1) NOT NULL,
  `created_by` varchar(100) NOT NULL,
  `created_on` datetime NOT NULL,
  `update_by` varchar(100) DEFAULT '',
  `update_on` datetime DEFAULT NULL,
  `delete_by` varchar(100) DEFAULT NULL,
  `delete_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

-- Dumping data for table papertrl_default_script.vp_bill_term: ~10 rows (approximately)
/*!40000 ALTER TABLE `vp_bill_term` DISABLE KEYS */;
INSERT INTO `vp_bill_term` (`id`, `term`, `in_months`, `on_month`, `on_day`, `net_days_due`, `discount_percentage`, `discount_days_due`, `end_of_month`, `from_entry`, `status`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES
	(1, 'Due on receipt', NULL, NULL, NULL, 0, 0.00, 0, 0, 0, 'A', 'admin', '2019-10-14 10:38:44', NULL, NULL, NULL, NULL),
	(2, 'Net 10', NULL, NULL, NULL, 10, 0.00, 0, 0, 0, 'A', 'admin', '2019-10-14 10:39:29', NULL, NULL, NULL, NULL),
	(3, 'Net 15', NULL, NULL, NULL, 15, 0.00, 0, 0, 0, 'A', 'admin', '2019-10-14 10:40:09', NULL, NULL, NULL, NULL),
	(4, 'Net 30', NULL, NULL, NULL, 30, 0.00, 0, 0, 0, 'A', 'admin', '2019-10-14 10:40:28', NULL, NULL, NULL, NULL),
	(5, 'Net 60', NULL, NULL, NULL, 60, 0.00, 0, 0, 0, 'A', 'admin', '2019-10-14 10:40:57', NULL, NULL, NULL, NULL),
	(6, '1%/10, Net 30', NULL, NULL, NULL, 30, 1.00, 10, 0, 0, 'A', 'admin', '2019-10-14 10:41:27', NULL, NULL, NULL, NULL),
	(7, '1%/15, Net 30', NULL, NULL, NULL, 30, 1.00, 15, 0, 0, 'A', 'admin', '2019-10-14 10:41:48', NULL, NULL, NULL, NULL),
	(8, '2%/10, Net 30', NULL, NULL, NULL, 30, 2.00, 10, 0, 0, 'A', 'admin', '2019-10-14 10:42:08', NULL, NULL, NULL, NULL),
	(9, '2%/15/Net 30', NULL, NULL, NULL, 30, 2.00, 15, 0, 0, 'A', 'admin', '2019-10-14 10:42:46', NULL, NULL, NULL, NULL),
	(10, 'Other', NULL, NULL, NULL, 0, 0.00, 0, 0, 0, 'A', 'admin', '2019-10-14 10:43:11', NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `vp_bill_term` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.vp_customer_vendor_relation
DROP TABLE IF EXISTS `vp_customer_vendor_relation`;
CREATE TABLE IF NOT EXISTS `vp_customer_vendor_relation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vendor_name` varchar(50) DEFAULT NULL,
  `vendor_email` varchar(50) DEFAULT NULL,
  `contact_number` varchar(50) DEFAULT '',
  `contact_person` varchar(150) DEFAULT NULL,
  `local_vendor_id` int(11) DEFAULT NULL,
  `community_vendor_id` int(11) NOT NULL,
  `request_id` int(11) NOT NULL,
  `request_by` varchar(100) NOT NULL,
  `request_on` datetime DEFAULT NULL,
  `vendor_deleted` tinyint(1) NOT NULL DEFAULT 0,
  `status` char(1) DEFAULT NULL,
  `created_by` varchar(100) NOT NULL,
  `created_on` datetime NOT NULL,
  `update_by` varchar(100) DEFAULT '',
  `update_on` datetime DEFAULT NULL,
  `delete_by` varchar(100) DEFAULT NULL,
  `delete_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `LOCAL_VENDOR_FK_1` (`local_vendor_id`),
  CONSTRAINT `LOCAL_VENDOR_FK_1` FOREIGN KEY (`local_vendor_id`) REFERENCES `vp_vendor_mst` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table papertrl_default_script.vp_customer_vendor_relation: ~0 rows (approximately)
/*!40000 ALTER TABLE `vp_customer_vendor_relation` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_customer_vendor_relation` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.vp_expense_additional_data
DROP TABLE IF EXISTS `vp_expense_additional_data`;
CREATE TABLE IF NOT EXISTS `vp_expense_additional_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field_value` varchar(300) DEFAULT '',
  `field_id` int(11) NOT NULL,
  `field_type_id` int(11) DEFAULT NULL,
  `field_name` varchar(50) NOT NULL,
  `section_id` int(11) NOT NULL,
  `detail_id` int(11) DEFAULT NULL,
  `expense_mst_id` int(15) NOT NULL,
  `display_order` int(11) NOT NULL,
  `multiple_status` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK__vp_expense_mst` (`expense_mst_id`),
  CONSTRAINT `EXPENSE_ADDITIONAL_FIELD_ID_FK_1` FOREIGN KEY (`expense_mst_id`) REFERENCES `vp_expense_mst` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table papertrl_default_script.vp_expense_additional_data: ~0 rows (approximately)
/*!40000 ALTER TABLE `vp_expense_additional_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_expense_additional_data` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.vp_expense_additional_field_attachment
DROP TABLE IF EXISTS `vp_expense_additional_field_attachment`;
CREATE TABLE IF NOT EXISTS `vp_expense_additional_field_attachment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field_id` int(11) NOT NULL,
  `expense_mst_id` int(11) NOT NULL,
  `attachment_url` varchar(200) NOT NULL,
  `file_name` varchar(200) DEFAULT '',
  `file_type` varchar(100) DEFAULT NULL,
  `status` char(1) NOT NULL,
  `delete_by` varchar(100) DEFAULT '',
  `delete_on` datetime DEFAULT NULL,
  `field_name` varchar(50) NOT NULL,
  `section_id` int(11) NOT NULL,
  `detail_id` int(11) DEFAULT NULL,
  `display_order` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Fk_fieldId` (`field_id`),
  KEY `Fk_expense_mst` (`expense_mst_id`),
  CONSTRAINT `ADDITIONAL_FIELD_EXPENSE_ID_FK_1` FOREIGN KEY (`expense_mst_id`) REFERENCES `vp_expense_mst` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `EXPENSE_ADDITIONAL_ATTACHMENT_FIELD_ID_FK1` FOREIGN KEY (`field_id`) REFERENCES `common_additional_field` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table papertrl_default_script.vp_expense_additional_field_attachment: ~0 rows (approximately)
/*!40000 ALTER TABLE `vp_expense_additional_field_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_expense_additional_field_attachment` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.vp_expense_attachment
DROP TABLE IF EXISTS `vp_expense_attachment`;
CREATE TABLE IF NOT EXISTS `vp_expense_attachment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `expense_mst_id` int(11) NOT NULL,
  `expense_detail_id` int(11) DEFAULT NULL,
  `attachment_url` varchar(200) NOT NULL,
  `file_name` varchar(200) DEFAULT NULL,
  `file_type` varchar(30) DEFAULT NULL,
  `status` char(1) NOT NULL,
  `delete_by` varchar(100) DEFAULT '',
  `delete_on` datetime DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `EXPENSE_ID_FK_1` (`expense_mst_id`),
  KEY `EXPENSE_DETAIL_FK_1` (`expense_detail_id`),
  CONSTRAINT `EXPENSE_DETAIL_FK_1` FOREIGN KEY (`expense_detail_id`) REFERENCES `vp_expense_detail` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `EXPENSE_ID_FK_1` FOREIGN KEY (`expense_mst_id`) REFERENCES `vp_expense_mst` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table papertrl_default_script.vp_expense_attachment: ~0 rows (approximately)
/*!40000 ALTER TABLE `vp_expense_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_expense_attachment` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.vp_expense_audit_trail
DROP TABLE IF EXISTS `vp_expense_audit_trail`;
CREATE TABLE IF NOT EXISTS `vp_expense_audit_trail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_date` datetime NOT NULL,
  `status_id` int(11) NOT NULL,
  `user_id` varchar(50) NOT NULL,
  `user_name` varchar(200) NOT NULL,
  `comment` varchar(500) DEFAULT NULL,
  `expense_id` int(11) NOT NULL,
  `automation_name` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK__vp_expense_type` (`status_id`),
  KEY `FK__ar_expense_mst` (`expense_id`),
  CONSTRAINT `` FOREIGN KEY (`status_id`) REFERENCES `common_audit_trial_status` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_ar_expense_det` FOREIGN KEY (`expense_id`) REFERENCES `vp_expense_mst` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_vp_expense_audit_trail_vp_vendor_invoice_status` FOREIGN KEY (`status_id`) REFERENCES `common_audit_trial_status` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table papertrl_default_script.vp_expense_audit_trail: ~0 rows (approximately)
/*!40000 ALTER TABLE `vp_expense_audit_trail` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_expense_audit_trail` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.vp_expense_detail
DROP TABLE IF EXISTS `vp_expense_detail`;
CREATE TABLE IF NOT EXISTS `vp_expense_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `expense_mst_id` int(11) DEFAULT NULL,
  `project_code_id` int(11) DEFAULT NULL,
  `account_id` int(11) DEFAULT NULL,
  `attachment_id` int(11) DEFAULT NULL,
  `amount` decimal(19,2) DEFAULT NULL,
  `expense_date` date DEFAULT NULL,
  `project_code_name` varchar(255) DEFAULT NULL,
  `project_account_code` varchar(200) DEFAULT NULL,
  `expense_account_code` varchar(200) DEFAULT NULL,
  `merchant` varchar(50) DEFAULT NULL,
  `expense_type` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1_EXPENSE_MST_ID` (`expense_mst_id`) USING BTREE,
  KEY `EXPENSE_PROJECT_ID_FK_1` (`project_code_id`),
  KEY `EXPENSE_ACCOUNT_ID_FK_1` (`account_id`),
  KEY `ATTACHMENT_ID_FK_1` (`attachment_id`),
  CONSTRAINT `EXPENSE_ACCOUNT_ID_FK_1` FOREIGN KEY (`account_id`) REFERENCES `common_account_number` (`id`),
  CONSTRAINT `EXPENSE_MASTER_ID_FK_1` FOREIGN KEY (`expense_mst_id`) REFERENCES `vp_expense_mst` (`id`),
  CONSTRAINT `EXPENSE_PROJECT_ID_FK_1` FOREIGN KEY (`project_code_id`) REFERENCES `common_approval_code` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table papertrl_default_script.vp_expense_detail: ~0 rows (approximately)
/*!40000 ALTER TABLE `vp_expense_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_expense_detail` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.vp_expense_mst
DROP TABLE IF EXISTS `vp_expense_mst`;
CREATE TABLE IF NOT EXISTS `vp_expense_mst` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(100) NOT NULL,
  `automation_id` int(11) DEFAULT NULL,
  `vendor_id` int(11) DEFAULT NULL,
  `attachment_id` int(11) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `notes` varchar(500) DEFAULT NULL,
  `total_amount` decimal(19,2) DEFAULT NULL,
  `status` char(1) NOT NULL,
  `report_name` varchar(50) DEFAULT '',
  `business_purpose` varchar(50) DEFAULT '',
  `export_status` char(1) DEFAULT 'N',
  `workflow_id` int(11) DEFAULT NULL,
  `workflow_level` int(11) DEFAULT NULL,
  `no_of_levels` int(3) DEFAULT NULL,
  `approval_user` varchar(100) DEFAULT NULL,
  `approval_group_name` varchar(75) DEFAULT NULL,
  `approval_group` int(11) DEFAULT NULL,
  `approval_user_name` varchar(200) DEFAULT NULL,
  `approved_date` datetime DEFAULT NULL,
  `created_by_name` varchar(200) NOT NULL,
  `created_by` varchar(100) NOT NULL,
  `created_on` datetime NOT NULL,
  `update_by` varchar(100) DEFAULT NULL,
  `update_on` datetime DEFAULT NULL,
  `delete_by` varchar(100) DEFAULT NULL,
  `delete_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `EXPENSE_VNDOR_FK_1` (`vendor_id`),
  KEY `EXPENSE_ATTACHMENT_ID_FK_1` (`attachment_id`),
  KEY `EXPENSE_AUTOMATION_ID_FK_1` (`automation_id`),
  CONSTRAINT `EXPENSE_AUTOMATION_ID_FK_1` FOREIGN KEY (`automation_id`) REFERENCES `common_automation_mst` (`id`),
  CONSTRAINT `EXPENSE_VNDOR_FK_1` FOREIGN KEY (`vendor_id`) REFERENCES `vp_vendor_mst` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table papertrl_default_script.vp_expense_mst: ~0 rows (approximately)
/*!40000 ALTER TABLE `vp_expense_mst` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_expense_mst` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.vp_expense_type
DROP TABLE IF EXISTS `vp_expense_type`;
CREATE TABLE IF NOT EXISTS `vp_expense_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `status` char(1) DEFAULT NULL,
  `created_by` varchar(100) NOT NULL DEFAULT '',
  `created_on` datetime NOT NULL,
  `update_by` varchar(100) DEFAULT NULL,
  `update_on` datetime DEFAULT NULL,
  `delete_by` varchar(100) DEFAULT NULL,
  `delete_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

-- Dumping data for table papertrl_default_script.vp_expense_type: ~14 rows (approximately)
/*!40000 ALTER TABLE `vp_expense_type` DISABLE KEYS */;
INSERT INTO `vp_expense_type` (`id`, `name`, `status`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES
	(1, 'Airfare', 'A', 'admin', '2020-06-02 14:52:36', NULL, NULL, NULL, NULL),
	(2, 'Ground transportation', 'A', 'admin', '2020-06-02 14:54:00', NULL, NULL, NULL, NULL),
	(3, 'Tolls', 'A', 'admin', '2020-06-02 14:55:44', NULL, NULL, NULL, NULL),
	(4, 'Meals', 'A', 'admin', '2020-06-02 14:59:17', NULL, NULL, NULL, NULL),
	(5, 'Lodging', 'A', 'admin', '2020-06-02 14:59:31', NULL, NULL, NULL, NULL),
	(6, 'Tips', 'A', 'admin', '2020-06-02 14:59:50', NULL, NULL, NULL, NULL),
	(7, 'Entertainment', 'A', 'admin', '2020-06-02 15:00:03', NULL, NULL, NULL, NULL),
	(8, 'Registration fees', 'A', 'admin', '2020-06-02 15:00:18', NULL, NULL, NULL, NULL),
	(9, 'Business supplies', 'A', 'admin', '2020-06-02 15:00:29', NULL, NULL, NULL, NULL),
	(10, 'Business services', 'A', 'admin', '2020-06-02 15:00:42', NULL, NULL, NULL, NULL),
	(11, 'Maintenance', 'A', 'admin', '2020-06-02 15:00:53', NULL, NULL, NULL, NULL),
	(12, 'Permits', 'A', 'admin', '2020-06-02 15:01:11', NULL, NULL, NULL, NULL),
	(13, 'Shipping', 'A', 'admin', '2020-06-02 15:01:22', NULL, NULL, NULL, NULL),
	(14, 'Training', 'A', 'admin', '2020-06-02 15:01:34', NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `vp_expense_type` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.vp_payment_batch
DROP TABLE IF EXISTS `vp_payment_batch`;
CREATE TABLE IF NOT EXISTS `vp_payment_batch` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `provider_id` int(11) NOT NULL,
  `provider_name` varchar(100) DEFAULT NULL,
  `tp_batch_id` varchar(12) DEFAULT NULL,
  `no_of_vendor` int(6) DEFAULT NULL,
  `no_of_bills` int(6) DEFAULT NULL,
  `total_amount` decimal(19,2) DEFAULT NULL,
  `scheduled_date` datetime DEFAULT NULL,
  `cancellable_date` datetime DEFAULT NULL,
  `status` char(1) NOT NULL,
  `api_status` char(1) DEFAULT NULL,
  `remarks` varchar(500) DEFAULT NULL,
  `api_message` varchar(500) DEFAULT NULL,
  `processed_date` datetime DEFAULT NULL,
  `created_by` varchar(100) NOT NULL,
  `created_on` datetime NOT NULL,
  `created_by_name` varchar(200) CHARACTER SET latin1 DEFAULT '',
  `update_by` varchar(100) DEFAULT NULL,
  `update_on` datetime DEFAULT NULL,
  `delete_by` varchar(100) DEFAULT NULL,
  `delete_on` datetime DEFAULT NULL,
  `approval_user` varchar(100) CHARACTER SET latin1 DEFAULT '',
  `approval_group_name` varchar(75) CHARACTER SET latin1 DEFAULT '',
  `approval_group` int(11) DEFAULT NULL,
  `approval_user_name` varchar(200) CHARACTER SET latin1 DEFAULT '',
  `workflow_id` int(11) DEFAULT NULL,
  `workflow_level` int(11) DEFAULT NULL,
  `no_of_levels` int(3) DEFAULT NULL,
  `approved_date` datetime DEFAULT NULL,
  `cancelled_by` varchar(100) DEFAULT NULL,
  `cancelled_on` datetime DEFAULT NULL,
  `automation_id` int(11) DEFAULT NULL,
  `export_status` char(1) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `PAYMENT_STATUS_FK_1` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table papertrl_default_script.vp_payment_batch: ~0 rows (approximately)
/*!40000 ALTER TABLE `vp_payment_batch` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_payment_batch` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.vp_payment_batch_audit_trail
DROP TABLE IF EXISTS `vp_payment_batch_audit_trail`;
CREATE TABLE IF NOT EXISTS `vp_payment_batch_audit_trail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_date` datetime NOT NULL,
  `status_id` int(11) NOT NULL,
  `user_id` varchar(100) NOT NULL,
  `user_name` varchar(200) NOT NULL,
  `comment` varchar(300) DEFAULT NULL,
  `automation_name` varchar(300) DEFAULT NULL,
  `payment_batch_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `frky1_po_id` (`payment_batch_id`),
  KEY `frky2_status_id` (`status_id`),
  CONSTRAINT `VP_PAYMENT_AUDIT_TRAIL_BATCH_ID_FK1` FOREIGN KEY (`payment_batch_id`) REFERENCES `vp_payment_batch` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `vp_payment_batch_audit_trail_ibfk_2` FOREIGN KEY (`status_id`) REFERENCES `common_audit_trial_status` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=598 DEFAULT CHARSET=latin1;

-- Dumping data for table papertrl_default_script.vp_payment_batch_audit_trail: ~0 rows (approximately)
/*!40000 ALTER TABLE `vp_payment_batch_audit_trail` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_payment_batch_audit_trail` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.vp_payment_batch_bill_wise_transaction
DROP TABLE IF EXISTS `vp_payment_batch_bill_wise_transaction`;
CREATE TABLE IF NOT EXISTS `vp_payment_batch_bill_wise_transaction` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tp_txn_id` varchar(12) DEFAULT NULL,
  `batch_id` int(11) NOT NULL,
  `vendor_id` int(11) NOT NULL,
  `bill_id` int(11) NOT NULL,
  `bill_no` varchar(50) NOT NULL DEFAULT '',
  `txn_ref` varchar(50) DEFAULT NULL,
  `txn_type` int(11) NOT NULL,
  `txn_type_name` varchar(100) DEFAULT NULL,
  `txn_amount` decimal(19,2) DEFAULT NULL,
  `txn_discount` decimal(19,2) DEFAULT NULL,
  `txn_date` datetime DEFAULT NULL,
  `payment_date` datetime DEFAULT NULL,
  `status` char(1) NOT NULL,
  `reason` text DEFAULT NULL,
  `comment` varchar(500) DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `TXN_VENDOR_ID_FK1` (`vendor_id`),
  KEY `TXN_BATCH_ID_FK1` (`batch_id`),
  KEY `TXN_BILL_ID_FK1` (`bill_id`),
  CONSTRAINT `TXN_BATCH_ID_FK1` FOREIGN KEY (`batch_id`) REFERENCES `vp_payment_batch` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `TXN_BILL_ID_FK1` FOREIGN KEY (`bill_id`) REFERENCES `vp_bill` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `TXN_VENDOR_ID_FK1` FOREIGN KEY (`vendor_id`) REFERENCES `vp_vendor_mst` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table papertrl_default_script.vp_payment_batch_bill_wise_transaction: ~0 rows (approximately)
/*!40000 ALTER TABLE `vp_payment_batch_bill_wise_transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_payment_batch_bill_wise_transaction` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.vp_payment_bill_wise_cache
DROP TABLE IF EXISTS `vp_payment_bill_wise_cache`;
CREATE TABLE IF NOT EXISTS `vp_payment_bill_wise_cache` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vendor_cache_id` int(11) NOT NULL,
  `vendor_id` int(11) NOT NULL,
  `bill_id` int(11) NOT NULL,
  `txn_type` int(11) DEFAULT NULL,
  `txn_amount` decimal(19,2) DEFAULT NULL,
  `txn_discount` decimal(19,2) DEFAULT NULL,
  `comment` varchar(500) DEFAULT NULL,
  `bill_no` varchar(50) NOT NULL DEFAULT '',
  `txn_ref` varchar(50) DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `BILL_PAYMENT_CACHE_BILL_ID_FK_1` (`bill_id`),
  KEY `BILL_PAYMENT_CACHE_VENDOR_CACHE_ID_FK1` (`vendor_cache_id`),
  CONSTRAINT `BILL_PAYMENT_CACHE_BILL_ID_FK_1` FOREIGN KEY (`bill_id`) REFERENCES `vp_bill` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `BILL_PAYMENT_CACHE_VENDOR_CACHE_ID_FK1` FOREIGN KEY (`vendor_cache_id`) REFERENCES `vp_payment_vendor_wise_cache` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table papertrl_default_script.vp_payment_bill_wise_cache: ~0 rows (approximately)
/*!40000 ALTER TABLE `vp_payment_bill_wise_cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_payment_bill_wise_cache` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.vp_payment_status
DROP TABLE IF EXISTS `vp_payment_status`;
CREATE TABLE IF NOT EXISTS `vp_payment_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `short_code` char(1) NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table papertrl_default_script.vp_payment_status: ~0 rows (approximately)
/*!40000 ALTER TABLE `vp_payment_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_payment_status` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.vp_payment_vendor_wise_cache
DROP TABLE IF EXISTS `vp_payment_vendor_wise_cache`;
CREATE TABLE IF NOT EXISTS `vp_payment_vendor_wise_cache` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vendor_id` int(11) NOT NULL,
  `vendor_name` varchar(150) DEFAULT NULL,
  `no_of_bills` int(5) DEFAULT NULL,
  `payment_amount` decimal(19,2) DEFAULT NULL,
  `discount_amount` decimal(19,2) DEFAULT NULL,
  `balance_amount` decimal(19,2) DEFAULT NULL,
  `created_by` varchar(100) NOT NULL,
  `created_on` datetime NOT NULL,
  `created_by_name` varchar(200) CHARACTER SET latin1 DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `BILL_PAYMENT_VENDOR_CACHE_VENDOR_ID_FK1` (`vendor_id`),
  CONSTRAINT `BILL_PAYMENT_VENDOR_CACHE_VENDOR_ID_FK1` FOREIGN KEY (`vendor_id`) REFERENCES `vp_vendor_mst` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table papertrl_default_script.vp_payment_vendor_wise_cache: ~0 rows (approximately)
/*!40000 ALTER TABLE `vp_payment_vendor_wise_cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_payment_vendor_wise_cache` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.vp_payment_vendor_wise_transaction
DROP TABLE IF EXISTS `vp_payment_vendor_wise_transaction`;
CREATE TABLE IF NOT EXISTS `vp_payment_vendor_wise_transaction` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `batch_id` int(11) NOT NULL,
  `vendor_id` int(11) NOT NULL,
  `vendor_name` varchar(150) DEFAULT NULL,
  `no_of_bills` int(5) DEFAULT NULL,
  `payment_amount` decimal(19,2) DEFAULT NULL,
  `discount_amount` decimal(19,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `BILL_PAYMENT_VENDOR_CACHE_VENDOR_ID_FK1` (`vendor_id`),
  KEY `vp_payment_vendor_wise_trasaction_batch_id_fk_1` (`batch_id`),
  CONSTRAINT `vp_payment_vendor_wise_transaction_ibfk_1` FOREIGN KEY (`vendor_id`) REFERENCES `vp_vendor_mst` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `vp_payment_vendor_wise_trasaction_batch_id_fk_1` FOREIGN KEY (`batch_id`) REFERENCES `vp_payment_batch` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table papertrl_default_script.vp_payment_vendor_wise_transaction: ~0 rows (approximately)
/*!40000 ALTER TABLE `vp_payment_vendor_wise_transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_payment_vendor_wise_transaction` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.vp_po_account_detail
DROP TABLE IF EXISTS `vp_po_account_detail`;
CREATE TABLE IF NOT EXISTS `vp_po_account_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  `purchase_order_mst_id` int(11) DEFAULT NULL,
  `amount` decimal(19,2) DEFAULT NULL,
  `account_number` varchar(50) DEFAULT NULL,
  `account_name` varchar(300) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `received` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_vp_po_account_chart_of_account` (`account_id`),
  KEY `FK_vp_po_account_approval_code` (`project_id`),
  KEY `FK_vp_po_account_po_mst` (`purchase_order_mst_id`),
  KEY `FK_DEPT_ID_FK1` (`department_id`),
  CONSTRAINT `FK_DEPT_ID_FK1` FOREIGN KEY (`department_id`) REFERENCES `common_department` (`id`),
  CONSTRAINT `FK_vp_po_account_approval_code` FOREIGN KEY (`project_id`) REFERENCES `common_approval_code` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_vp_po_account_chart_of_account` FOREIGN KEY (`account_id`) REFERENCES `common_account_number` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_vp_po_account_po_mst` FOREIGN KEY (`purchase_order_mst_id`) REFERENCES `vp_po_mst` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table papertrl_default_script.vp_po_account_detail: ~0 rows (approximately)
/*!40000 ALTER TABLE `vp_po_account_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_po_account_detail` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.vp_po_additional_data
DROP TABLE IF EXISTS `vp_po_additional_data`;
CREATE TABLE IF NOT EXISTS `vp_po_additional_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field_value` varchar(300) DEFAULT NULL,
  `field_id` int(11) NOT NULL,
  `field_type_id` int(11) DEFAULT NULL,
  `field_name` varchar(50) NOT NULL,
  `section_id` int(11) NOT NULL,
  `detail_id` int(11) DEFAULT NULL,
  `po_mst_id` int(15) NOT NULL,
  `display_order` int(11) NOT NULL,
  `multiple_status` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK__vp_purchase_order_mst` (`po_mst_id`),
  KEY `PO_ADDITIONAL_FIELD_TYPE_FK_1` (`field_type_id`),
  CONSTRAINT `FK__vp_purchase_order_mst` FOREIGN KEY (`po_mst_id`) REFERENCES `vp_po_mst` (`id`),
  CONSTRAINT `PO_ADDITIONAL_FIELD_TYPE_FK_1` FOREIGN KEY (`field_type_id`) REFERENCES `common_additional_field_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table papertrl_default_script.vp_po_additional_data: ~0 rows (approximately)
/*!40000 ALTER TABLE `vp_po_additional_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_po_additional_data` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.vp_po_additional_field_attachment
DROP TABLE IF EXISTS `vp_po_additional_field_attachment`;
CREATE TABLE IF NOT EXISTS `vp_po_additional_field_attachment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field_id` int(11) NOT NULL,
  `po_mst_id` int(11) NOT NULL,
  `attachment_url` varchar(200) NOT NULL,
  `file_name` varchar(200) DEFAULT NULL,
  `file_type` varchar(100) DEFAULT NULL,
  `status` char(1) NOT NULL,
  `delete_by` varchar(100) DEFAULT '',
  `delete_on` datetime DEFAULT NULL,
  `field_name` varchar(50) NOT NULL,
  `section_id` int(11) NOT NULL,
  `detail_id` int(11) DEFAULT NULL,
  `display_order` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Fk_po_mst` (`po_mst_id`),
  CONSTRAINT `Fk_po_mst` FOREIGN KEY (`po_mst_id`) REFERENCES `vp_po_mst` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table papertrl_default_script.vp_po_additional_field_attachment: ~0 rows (approximately)
/*!40000 ALTER TABLE `vp_po_additional_field_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_po_additional_field_attachment` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.vp_po_attachment
DROP TABLE IF EXISTS `vp_po_attachment`;
CREATE TABLE IF NOT EXISTS `vp_po_attachment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `po_mst_id` int(11) NOT NULL,
  `attachment_url` varchar(200) NOT NULL,
  `file_name` varchar(200) DEFAULT NULL,
  `file_type` varchar(30) DEFAULT NULL,
  `status` char(1) NOT NULL DEFAULT 'A',
  `delete_by` varchar(100) DEFAULT '',
  `delete_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_vp_purchase_order_attachment_vp_purchase_order_mst` (`po_mst_id`),
  CONSTRAINT `FK_vp_purchase_order_attachment_vp_purchase_order_mst` FOREIGN KEY (`po_mst_id`) REFERENCES `vp_po_mst` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table papertrl_default_script.vp_po_attachment: ~0 rows (approximately)
/*!40000 ALTER TABLE `vp_po_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_po_attachment` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.vp_po_audit_trail
DROP TABLE IF EXISTS `vp_po_audit_trail`;
CREATE TABLE IF NOT EXISTS `vp_po_audit_trail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_date` datetime NOT NULL,
  `status_id` int(11) NOT NULL,
  `user_id` varchar(100) NOT NULL,
  `user_name` varchar(200) NOT NULL,
  `comment` varchar(300) DEFAULT NULL,
  `puchase_order_id` int(11) NOT NULL,
  `automation_name` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `frky1_po_id` (`puchase_order_id`),
  KEY `frky2_status_id` (`status_id`),
  CONSTRAINT `frky1_po_id` FOREIGN KEY (`puchase_order_id`) REFERENCES `vp_po_mst` (`id`),
  CONSTRAINT `frky2_status_id` FOREIGN KEY (`status_id`) REFERENCES `common_audit_trial_status` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table papertrl_default_script.vp_po_audit_trail: ~0 rows (approximately)
/*!40000 ALTER TABLE `vp_po_audit_trail` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_po_audit_trail` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.vp_po_detail
DROP TABLE IF EXISTS `vp_po_detail`;
CREATE TABLE IF NOT EXISTS `vp_po_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `purchase_order_mst_id` int(11) NOT NULL,
  `sort_order` int(3) DEFAULT NULL,
  `item_number` varchar(50) DEFAULT '',
  `item_name` varchar(300) DEFAULT '',
  `description` varchar(200) DEFAULT '',
  `qty` decimal(12,2) DEFAULT NULL,
  `remaining_qty` decimal(12,2) DEFAULT NULL,
  `uom_id` int(11) DEFAULT NULL,
  `unit_price` decimal(19,2) DEFAULT NULL,
  `discount_amount` decimal(19,2) DEFAULT NULL,
  `per_unit_discount` decimal(19,2) DEFAULT NULL,
  `amount` decimal(19,2) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mst_id` (`purchase_order_mst_id`),
  KEY `uom_id` (`uom_id`),
  KEY `FK_DEPT_ID` (`department_id`),
  CONSTRAINT `FK_DEPT_ID` FOREIGN KEY (`department_id`) REFERENCES `common_department` (`id`),
  CONSTRAINT `mst_id` FOREIGN KEY (`purchase_order_mst_id`) REFERENCES `vp_po_mst` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `uom_id` FOREIGN KEY (`uom_id`) REFERENCES `common_uom` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table papertrl_default_script.vp_po_detail: ~0 rows (approximately)
/*!40000 ALTER TABLE `vp_po_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_po_detail` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.vp_po_mst
DROP TABLE IF EXISTS `vp_po_mst`;
CREATE TABLE IF NOT EXISTS `vp_po_mst` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(100) NOT NULL,
  `project_code_id` int(11) DEFAULT NULL,
  `vendor_id` int(11) DEFAULT NULL,
  `workflow_id` int(11) DEFAULT NULL,
  `automation_id` int(11) DEFAULT NULL,
  `approval_group` int(11) DEFAULT NULL,
  `attachment_id` int(11) DEFAULT NULL,
  `workflow_level` int(11) DEFAULT NULL,
  `no_of_levels` int(3) DEFAULT NULL,
  `po_number` varchar(100) DEFAULT NULL,
  `po_date` date DEFAULT NULL,
  `delivery_date` date DEFAULT NULL,
  `shipping_address` varchar(255) DEFAULT NULL,
  `account_gross_amount` decimal(19,2) DEFAULT NULL,
  `item_gross_amount` decimal(19,2) DEFAULT NULL,
  `vendor_approved_date` datetime DEFAULT NULL,
  `gross_amount` decimal(19,2) DEFAULT NULL,
  `discount_amount` decimal(19,2) DEFAULT NULL,
  `net_amount` decimal(19,2) DEFAULT NULL,
  `tax_amount` decimal(19,2) NOT NULL,
  `contact_person` varchar(150) DEFAULT NULL,
  `contact_number` varchar(20) DEFAULT NULL,
  `billing_address` varchar(255) DEFAULT NULL,
  `vendor_approval_status` char(1) DEFAULT NULL,
  `remaining_celing` decimal(19,2) DEFAULT NULL,
  `approval_user` varchar(100) DEFAULT NULL,
  `approval_group_name` varchar(100) DEFAULT NULL,
  `approval_user_name` varchar(100) DEFAULT NULL,
  `poc_name` varchar(50) DEFAULT NULL,
  `poc_phone` varchar(40) DEFAULT NULL,
  `notes` varchar(300) DEFAULT NULL,
  `receipt_status` char(1) NOT NULL,
  `status` char(1) NOT NULL,
  `export_status` char(1) NOT NULL,
  `approved_date` date DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `created_by_name` varchar(200) DEFAULT NULL,
  `created_by` varchar(100) NOT NULL,
  `created_on` datetime NOT NULL,
  `update_by` varchar(100) DEFAULT NULL,
  `update_on` datetime DEFAULT NULL,
  `delete_by` varchar(100) DEFAULT NULL,
  `delete_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1_CODE` (`project_code_id`),
  KEY `FK1_VENDOR_PO` (`vendor_id`),
  KEY `PO_WORKFLOW_FK_1` (`workflow_id`),
  KEY `PO_AUTOMATION_ID_FK_1` (`automation_id`),
  KEY `PO_ATTACHMENT_ID_FK_1` (`attachment_id`),
  KEY `PO_DEPT_ID_FK_1` (`department_id`),
  CONSTRAINT `FK1_CODE` FOREIGN KEY (`project_code_id`) REFERENCES `common_approval_code` (`id`),
  CONSTRAINT `PO_ATTACHMENT_ID_FK_1` FOREIGN KEY (`attachment_id`) REFERENCES `vp_po_attachment` (`id`),
  CONSTRAINT `PO_AUTOMATION_ID_FK_1` FOREIGN KEY (`automation_id`) REFERENCES `common_automation_mst` (`id`),
  CONSTRAINT `PO_DEPT_ID_FK_1` FOREIGN KEY (`department_id`) REFERENCES `common_department` (`id`),
  CONSTRAINT `PO_VENDOR_ID_FK_1` FOREIGN KEY (`vendor_id`) REFERENCES `vp_vendor_mst` (`id`),
  CONSTRAINT `PO_WORKFLOW_FK_1` FOREIGN KEY (`workflow_id`) REFERENCES `common_document_workflow_config` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table papertrl_default_script.vp_po_mst: ~0 rows (approximately)
/*!40000 ALTER TABLE `vp_po_mst` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_po_mst` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.vp_po_number_config
DROP TABLE IF EXISTS `vp_po_number_config`;
CREATE TABLE IF NOT EXISTS `vp_po_number_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `department_id` int(10) NOT NULL,
  `department_name` varchar(255) DEFAULT '',
  `prefixes` varchar(50) DEFAULT NULL,
  `suffixes` varchar(50) DEFAULT NULL,
  `separator_symbol_id` int(10) DEFAULT NULL,
  `running_no` int(10) unsigned DEFAULT NULL,
  `is_override` char(1) DEFAULT NULL,
  `po_no_pattern` varchar(255) DEFAULT NULL,
  `status` char(5) DEFAULT NULL,
  `created_username` varchar(100) DEFAULT NULL,
  `created_by` varchar(100) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `update_by` varchar(100) DEFAULT NULL,
  `update_on` datetime DEFAULT NULL,
  `delete_by` varchar(100) DEFAULT NULL,
  `delete_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table papertrl_default_script.vp_po_number_config: ~0 rows (approximately)
/*!40000 ALTER TABLE `vp_po_number_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_po_number_config` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.vp_po_receipt_account_detail
DROP TABLE IF EXISTS `vp_po_receipt_account_detail`;
CREATE TABLE IF NOT EXISTS `vp_po_receipt_account_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `receipt_mst_id` int(11) NOT NULL,
  `account_detail_id` int(11) DEFAULT NULL,
  `account_id` int(11) DEFAULT NULL,
  `amount` decimal(19,2) DEFAULT NULL,
  `account_number` varchar(50) DEFAULT NULL,
  `account_name` varchar(300) DEFAULT NULL,
  `is_select_account` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_po_receipt_mst_id` (`receipt_mst_id`),
  KEY `FK_po_receipt_account_detail` (`account_detail_id`),
  KEY `FK_po_receipt_account_id` (`account_id`),
  CONSTRAINT `FK_po_receipt_account_detail` FOREIGN KEY (`account_detail_id`) REFERENCES `vp_po_account_detail` (`id`),
  CONSTRAINT `FK_po_receipt_account_id` FOREIGN KEY (`account_id`) REFERENCES `common_account_number` (`id`),
  CONSTRAINT `FK_po_receipt_mst_id` FOREIGN KEY (`receipt_mst_id`) REFERENCES `vp_po_receipt_mst` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=latin1;

-- Dumping data for table papertrl_default_script.vp_po_receipt_account_detail: ~0 rows (approximately)
/*!40000 ALTER TABLE `vp_po_receipt_account_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_po_receipt_account_detail` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.vp_po_receipt_additional_data
DROP TABLE IF EXISTS `vp_po_receipt_additional_data`;
CREATE TABLE IF NOT EXISTS `vp_po_receipt_additional_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field_value` varchar(1000) DEFAULT '',
  `field_id` int(15) NOT NULL,
  `field_name` varchar(50) NOT NULL,
  `receipt_mst_id` int(15) NOT NULL,
  `field_type_id` int(11) DEFAULT NULL,
  `section_id` int(11) NOT NULL,
  `detail_id` int(11) DEFAULT NULL,
  `display_order` int(11) NOT NULL,
  `multiple_status` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_vp_grn_additional_data_vp_grn_mst` (`receipt_mst_id`),
  CONSTRAINT `FK_vp_grn_additional_data_vp_grn_mst` FOREIGN KEY (`receipt_mst_id`) REFERENCES `vp_po_receipt_mst` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table papertrl_default_script.vp_po_receipt_additional_data: ~0 rows (approximately)
/*!40000 ALTER TABLE `vp_po_receipt_additional_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_po_receipt_additional_data` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.vp_po_receipt_additional_field_attachment
DROP TABLE IF EXISTS `vp_po_receipt_additional_field_attachment`;
CREATE TABLE IF NOT EXISTS `vp_po_receipt_additional_field_attachment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field_id` int(11) NOT NULL,
  `receipt_mst_id` int(11) NOT NULL,
  `detail_Id` int(11) DEFAULT NULL,
  `attachment_url` varchar(200) NOT NULL,
  `file_name` varchar(200) DEFAULT NULL,
  `file_type` varchar(100) DEFAULT NULL,
  `status` char(1) NOT NULL,
  `delete_by` varchar(100) DEFAULT '',
  `delete_on` datetime DEFAULT NULL,
  `field_name` varchar(50) NOT NULL,
  `section_id` int(11) NOT NULL,
  `display_order` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Fk_grn_mst` (`receipt_mst_id`),
  CONSTRAINT `Fk_grn_mst` FOREIGN KEY (`receipt_mst_id`) REFERENCES `vp_po_receipt_mst` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `RECEIPT_DETAIL_ID_FK_1` FOREIGN KEY (`receipt_mst_id`) REFERENCES `vp_po_receipt_mst` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table papertrl_default_script.vp_po_receipt_additional_field_attachment: ~0 rows (approximately)
/*!40000 ALTER TABLE `vp_po_receipt_additional_field_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_po_receipt_additional_field_attachment` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.vp_po_receipt_attachment
DROP TABLE IF EXISTS `vp_po_receipt_attachment`;
CREATE TABLE IF NOT EXISTS `vp_po_receipt_attachment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `receipt_mst_id` int(11) NOT NULL,
  `attachment_url` varchar(200) NOT NULL,
  `file_name` varchar(200) DEFAULT NULL,
  `file_type` varchar(30) DEFAULT NULL,
  `status` char(1) NOT NULL DEFAULT 'A',
  `delete_by` varchar(100) DEFAULT '',
  `delete_on` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_vp_grn_attachment_vp_grn_mst` (`receipt_mst_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table papertrl_default_script.vp_po_receipt_attachment: ~0 rows (approximately)
/*!40000 ALTER TABLE `vp_po_receipt_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_po_receipt_attachment` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.vp_po_receipt_detail
DROP TABLE IF EXISTS `vp_po_receipt_detail`;
CREATE TABLE IF NOT EXISTS `vp_po_receipt_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `receipt_mst_id` int(11) NOT NULL,
  `po_detail_id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `received_qty` decimal(12,2) NOT NULL DEFAULT 0.00,
  `remaining_qty` decimal(12,2) DEFAULT NULL,
  `amount` decimal(19,2) NOT NULL DEFAULT 0.00,
  `item_number` varchar(50) DEFAULT NULL,
  `item_name` varchar(300) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `uom` varchar(100) DEFAULT '',
  `unit_price` decimal(19,2) NOT NULL,
  `discount_amount` decimal(19,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK__vp_grn_mst` (`receipt_mst_id`),
  KEY `PO_RECEIPT_PRODUCT_ID_FK_1` (`product_id`),
  KEY `PO_DETAIL_ID_FK_1` (`po_detail_id`),
  CONSTRAINT `FK__vp_grn_mst` FOREIGN KEY (`receipt_mst_id`) REFERENCES `vp_po_receipt_mst` (`id`),
  CONSTRAINT `PO_DETAIL_ID_FK_1` FOREIGN KEY (`po_detail_id`) REFERENCES `vp_po_detail` (`id`),
  CONSTRAINT `PO_RECEIPT_PRODUCT_ID_FK_1` FOREIGN KEY (`product_id`) REFERENCES `common_item_mst` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table papertrl_default_script.vp_po_receipt_detail: ~0 rows (approximately)
/*!40000 ALTER TABLE `vp_po_receipt_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_po_receipt_detail` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.vp_po_receipt_mst
DROP TABLE IF EXISTS `vp_po_receipt_mst`;
CREATE TABLE IF NOT EXISTS `vp_po_receipt_mst` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(100) NOT NULL,
  `po_id` int(11) NOT NULL,
  `vendor_id` int(11) NOT NULL,
  `attachment_id` int(11) DEFAULT NULL,
  `po_date` date NOT NULL,
  `receipt_date` date NOT NULL,
  `receipt_number` varchar(50) DEFAULT '',
  `received_by` varchar(50) DEFAULT '',
  `notes` varchar(255) DEFAULT '',
  `status` char(1) NOT NULL,
  `export_status` char(1) NOT NULL,
  `total_amount` decimal(19,2) DEFAULT NULL,
  `created_by` varchar(100) NOT NULL,
  `created_on` datetime NOT NULL,
  `delete_by` varchar(100) DEFAULT '',
  `delete_on` datetime DEFAULT NULL,
  `update_by` varchar(100) DEFAULT '',
  `update_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1_VENDOR_GRN` (`vendor_id`),
  KEY `RECEIPT_ATTACHMENT_ID_FK_1` (`attachment_id`),
  KEY `RECEIPT_PO_ID_FK_1` (`po_id`),
  CONSTRAINT `PO_RECEIPT_VENDOR_ID_FK_1` FOREIGN KEY (`vendor_id`) REFERENCES `vp_vendor_mst` (`id`),
  CONSTRAINT `RECEIPT_ATTACHMENT_ID_FK_1` FOREIGN KEY (`attachment_id`) REFERENCES `vp_po_receipt_attachment` (`id`),
  CONSTRAINT `RECEIPT_PO_ID_FK_1` FOREIGN KEY (`po_id`) REFERENCES `vp_po_mst` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table papertrl_default_script.vp_po_receipt_mst: ~0 rows (approximately)
/*!40000 ALTER TABLE `vp_po_receipt_mst` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_po_receipt_mst` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.vp_recurring_bill_attachment
DROP TABLE IF EXISTS `vp_recurring_bill_attachment`;
CREATE TABLE IF NOT EXISTS `vp_recurring_bill_attachment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `template_mst_id` int(11) NOT NULL,
  `file_name` varchar(200) NOT NULL,
  `file_type` varchar(50) NOT NULL,
  `attachment_url` varchar(300) NOT NULL,
  `status` char(1) NOT NULL DEFAULT 'A',
  `delete_by` varchar(100) DEFAULT '',
  `delete_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `vp_recurring_bill_attachment_fkid_1` (`template_mst_id`),
  CONSTRAINT `vp_recurring_bill_attachment_fkid_1` FOREIGN KEY (`template_mst_id`) REFERENCES `vp_recurring_bill_template_mst` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table papertrl_default_script.vp_recurring_bill_attachment: ~0 rows (approximately)
/*!40000 ALTER TABLE `vp_recurring_bill_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_recurring_bill_attachment` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.vp_recurring_bill_expense_cost_distribution
DROP TABLE IF EXISTS `vp_recurring_bill_expense_cost_distribution`;
CREATE TABLE IF NOT EXISTS `vp_recurring_bill_expense_cost_distribution` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) NOT NULL,
  `description` varchar(500) DEFAULT '',
  `amount` decimal(19,2) NOT NULL,
  `billable` tinyint(1) DEFAULT NULL,
  `tax` tinyint(1) DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `template_mst_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK_vp_vendor_item_cost_distribution_common_chart_of_account` (`account_id`) USING BTREE,
  KEY `PROJECT_ID_FK_3` (`project_id`) USING BTREE,
  KEY `DEPT_ID_FK_1` (`department_id`) USING BTREE,
  KEY `vp_recurring_bill_expense_cost_distribution_idfk_5` (`template_mst_id`),
  CONSTRAINT `vp_recurring_bill_expense_cost_distribution_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `common_department` (`id`),
  CONSTRAINT `vp_recurring_bill_expense_cost_distribution_ibfk_2` FOREIGN KEY (`account_id`) REFERENCES `common_account_number` (`id`),
  CONSTRAINT `vp_recurring_bill_expense_cost_distribution_ibfk_4` FOREIGN KEY (`project_id`) REFERENCES `common_approval_code` (`id`),
  CONSTRAINT `vp_recurring_bill_expense_cost_distribution_idfk_5` FOREIGN KEY (`template_mst_id`) REFERENCES `vp_recurring_bill_template_mst` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table papertrl_default_script.vp_recurring_bill_expense_cost_distribution: ~0 rows (approximately)
/*!40000 ALTER TABLE `vp_recurring_bill_expense_cost_distribution` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_recurring_bill_expense_cost_distribution` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.vp_recurring_bill_item_cost_distribution
DROP TABLE IF EXISTS `vp_recurring_bill_item_cost_distribution`;
CREATE TABLE IF NOT EXISTS `vp_recurring_bill_item_cost_distribution` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) DEFAULT NULL,
  `item_number` varchar(50) DEFAULT '',
  `item_name` varchar(300) DEFAULT '',
  `description` varchar(500) DEFAULT '',
  `qty` decimal(12,2) NOT NULL DEFAULT 0.00,
  `rate` decimal(19,2) NOT NULL,
  `amount` decimal(19,2) NOT NULL,
  `billable` tinyint(1) DEFAULT NULL,
  `tax` tinyint(1) DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `template_mst_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_vp_recurring_bill_item_cost_approval_code` (`project_id`),
  KEY `FK_vp_recurring_bill_item_cost_department` (`department_id`),
  KEY `FK_vp_recurring_bill_item_cost_item_mst` (`item_id`),
  KEY `FK_vp_recurring_bill_item_cost_template_mst` (`template_mst_id`),
  CONSTRAINT `FK_vp_recurring_bill_item_cost_approval_code` FOREIGN KEY (`project_id`) REFERENCES `common_approval_code` (`id`),
  CONSTRAINT `FK_vp_recurring_bill_item_cost_department` FOREIGN KEY (`department_id`) REFERENCES `common_department` (`id`),
  CONSTRAINT `FK_vp_recurring_bill_item_cost_item_mst` FOREIGN KEY (`item_id`) REFERENCES `common_item_mst` (`id`),
  CONSTRAINT `FK_vp_recurring_bill_item_cost_template_mst` FOREIGN KEY (`template_mst_id`) REFERENCES `vp_recurring_bill_template_mst` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table papertrl_default_script.vp_recurring_bill_item_cost_distribution: ~0 rows (approximately)
/*!40000 ALTER TABLE `vp_recurring_bill_item_cost_distribution` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_recurring_bill_item_cost_distribution` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.vp_recurring_bill_template_mst
DROP TABLE IF EXISTS `vp_recurring_bill_template_mst`;
CREATE TABLE IF NOT EXISTS `vp_recurring_bill_template_mst` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(100) NOT NULL,
  `schedule_name` varchar(100) NOT NULL,
  `interval_value` varchar(50) NOT NULL,
  `custom_Interval_value` varchar(50) DEFAULT NULL,
  `recurring_month` varchar(50) DEFAULT '',
  `recurring_day` varchar(50) DEFAULT '',
  `recurring_day_of_week` varchar(50) DEFAULT NULL,
  `generation_frequent_status` varchar(50) DEFAULT NULL,
  `generation_frequent` int(11) DEFAULT NULL,
  `recurring_start_date` date DEFAULT NULL,
  `recurring_end_date` date DEFAULT NULL,
  `occurrence_frequent_status` varchar(50) DEFAULT NULL,
  `occurrence_frequent` int(11) DEFAULT NULL,
  `last_generation_date` date DEFAULT NULL,
  `vendor_id` int(11) DEFAULT NULL,
  `term` int(11) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `bill_amount` decimal(19,2) DEFAULT NULL,
  `discount_amount` decimal(19,2) DEFAULT NULL,
  `tax` decimal(19,2) DEFAULT NULL,
  `additional_notes` varchar(500) DEFAULT NULL,
  `prefixes` varchar(50) DEFAULT NULL,
  `suffixes` varchar(50) DEFAULT NULL,
  `separator_symbol_id` int(10) DEFAULT NULL,
  `running_no` int(10) DEFAULT NULL,
  `bill_no_pattern` varchar(200) DEFAULT NULL,
  `status` char(1) NOT NULL,
  `created_by` varchar(100) NOT NULL,
  `created_by_name` varchar(200) DEFAULT NULL,
  `created_on` datetime NOT NULL,
  `update_by` varchar(100) DEFAULT NULL,
  `update_on` datetime DEFAULT NULL,
  `delete_by` varchar(100) DEFAULT NULL,
  `delete_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table papertrl_default_script.vp_recurring_bill_template_mst: ~0 rows (approximately)
/*!40000 ALTER TABLE `vp_recurring_bill_template_mst` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_recurring_bill_template_mst` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.vp_recurring_template_ad_hoc_workflow_detail_config
DROP TABLE IF EXISTS `vp_recurring_template_ad_hoc_workflow_detail_config`;
CREATE TABLE IF NOT EXISTS `vp_recurring_template_ad_hoc_workflow_detail_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `template_mst_id` int(11) NOT NULL,
  `approval_group` int(11) DEFAULT NULL,
  `approval_user` varchar(100) DEFAULT '',
  `approval_order` int(3) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK_recurring_template_ad_hoc_workflow_detail_config_idfk_1` (`template_mst_id`),
  CONSTRAINT `FK_recurring_template_ad_hoc_workflow_detail_config_idfk_1` FOREIGN KEY (`template_mst_id`) REFERENCES `vp_recurring_bill_template_mst` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table papertrl_default_script.vp_recurring_template_ad_hoc_workflow_detail_config: ~0 rows (approximately)
/*!40000 ALTER TABLE `vp_recurring_template_ad_hoc_workflow_detail_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_recurring_template_ad_hoc_workflow_detail_config` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.vp_vendor_address
DROP TABLE IF EXISTS `vp_vendor_address`;
CREATE TABLE IF NOT EXISTS `vp_vendor_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address_line_1` varchar(300) DEFAULT NULL,
  `address_line_2` varchar(300) DEFAULT NULL,
  `type` varchar(5) DEFAULT NULL,
  `city` varchar(200) DEFAULT '',
  `country` varchar(200) DEFAULT '',
  `address_state` varchar(200) DEFAULT '',
  `vendor_mst_id` int(11) DEFAULT NULL,
  `zipcode` varchar(30) DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `FKp54ae4xbmwuo3fj2v0mqr6ify` (`city`) USING BTREE,
  KEY `FK9q1h8wlehll8abof3gy0m2rr6` (`country`) USING BTREE,
  KEY `FK6spbmlk298owe39onhokfa67x` (`address_state`) USING BTREE,
  KEY `FK5539bpkljsmqi7ww9wq6w3v76` (`vendor_mst_id`) USING BTREE,
  KEY `FK933hd6ya9jh5wnur9s9l16l9w` (`zipcode`) USING BTREE,
  CONSTRAINT `VENDOR_MST_FK_1` FOREIGN KEY (`vendor_mst_id`) REFERENCES `vp_vendor_mst` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table papertrl_default_script.vp_vendor_address: ~0 rows (approximately)
/*!40000 ALTER TABLE `vp_vendor_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_vendor_address` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.vp_vendor_classification
DROP TABLE IF EXISTS `vp_vendor_classification`;
CREATE TABLE IF NOT EXISTS `vp_vendor_classification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vendor_id` int(11) NOT NULL,
  `classification_id` int(11) NOT NULL,
  `status` char(1) NOT NULL DEFAULT 'A',
  `vendor_mst_id` int(11) DEFAULT NULL,
  `vendor_temp_id` int(11) DEFAULT NULL,
  `created_by` varchar(100) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `update_by` varchar(100) DEFAULT NULL,
  `update_on` datetime DEFAULT NULL,
  `delete_by` varchar(100) DEFAULT NULL,
  `delete_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=215 DEFAULT CHARSET=latin1;

-- Dumping data for table papertrl_default_script.vp_vendor_classification: ~0 rows (approximately)
/*!40000 ALTER TABLE `vp_vendor_classification` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_vendor_classification` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.vp_vendor_classification_attachment
DROP TABLE IF EXISTS `vp_vendor_classification_attachment`;
CREATE TABLE IF NOT EXISTS `vp_vendor_classification_attachment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vendor_id` int(11) DEFAULT NULL,
  `vendor_classification_relation_id` int(11) DEFAULT NULL,
  `file_name` varchar(200) NOT NULL,
  `file_type` varchar(50) NOT NULL,
  `attachment_url` varchar(300) NOT NULL,
  `status` char(1) NOT NULL DEFAULT 'A',
  `created_by` varchar(100) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `update_by` varchar(100) DEFAULT NULL,
  `update_on` datetime DEFAULT NULL,
  `delete_by` varchar(100) DEFAULT '',
  `delete_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=205 DEFAULT CHARSET=latin1;

-- Dumping data for table papertrl_default_script.vp_vendor_classification_attachment: ~0 rows (approximately)
/*!40000 ALTER TABLE `vp_vendor_classification_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_vendor_classification_attachment` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.vp_vendor_field_config
DROP TABLE IF EXISTS `vp_vendor_field_config`;
CREATE TABLE IF NOT EXISTS `vp_vendor_field_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `document_type` int(11) NOT NULL,
  `field_id` int(11) NOT NULL,
  `vendor_id` int(11) DEFAULT NULL,
  `show_enable` tinyint(1) NOT NULL,
  `all_config` char(1) DEFAULT NULL,
  `status` char(1) NOT NULL,
  `created_by` varchar(100) NOT NULL DEFAULT '',
  `created_on` datetime NOT NULL,
  `update_by` varchar(100) DEFAULT NULL,
  `update_on` datetime DEFAULT NULL,
  `delete_by` varchar(100) DEFAULT NULL,
  `delete_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table papertrl_default_script.vp_vendor_field_config: ~0 rows (approximately)
/*!40000 ALTER TABLE `vp_vendor_field_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_vendor_field_config` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.vp_vendor_import_issue
DROP TABLE IF EXISTS `vp_vendor_import_issue`;
CREATE TABLE IF NOT EXISTS `vp_vendor_import_issue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `import_mst_id` int(11) NOT NULL,
  `record` text DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL,
  `line_no` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_IMPORT_MST3` (`import_mst_id`),
  CONSTRAINT `FK_IMPORT_MST3` FOREIGN KEY (`import_mst_id`) REFERENCES `vp_vendor_import_mst` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table papertrl_default_script.vp_vendor_import_issue: ~0 rows (approximately)
/*!40000 ALTER TABLE `vp_vendor_import_issue` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_vendor_import_issue` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.vp_vendor_import_mst
DROP TABLE IF EXISTS `vp_vendor_import_mst`;
CREATE TABLE IF NOT EXISTS `vp_vendor_import_mst` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(100) NOT NULL,
  `total_records` int(11) DEFAULT NULL,
  `succeeded` int(11) DEFAULT NULL,
  `failed` int(11) DEFAULT NULL,
  `created_by` varchar(100) NOT NULL DEFAULT '',
  `created_on` datetime NOT NULL,
  `update_by` varchar(100) DEFAULT NULL,
  `update_on` datetime DEFAULT NULL,
  `delete_by` varchar(100) DEFAULT NULL,
  `delete_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table papertrl_default_script.vp_vendor_import_mst: ~0 rows (approximately)
/*!40000 ALTER TABLE `vp_vendor_import_mst` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_vendor_import_mst` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.vp_vendor_invitation
DROP TABLE IF EXISTS `vp_vendor_invitation`;
CREATE TABLE IF NOT EXISTS `vp_vendor_invitation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(100) NOT NULL,
  `email_address` varchar(100) NOT NULL,
  `vendor_name` varchar(100) NOT NULL,
  `contact_name` varchar(50) DEFAULT NULL,
  `status` char(1) NOT NULL,
  `created_by` varchar(100) NOT NULL DEFAULT '',
  `created_on` datetime NOT NULL,
  `accepted_on` datetime DEFAULT NULL,
  `delete_by` varchar(100) DEFAULT NULL,
  `delete_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table papertrl_default_script.vp_vendor_invitation: ~0 rows (approximately)
/*!40000 ALTER TABLE `vp_vendor_invitation` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_vendor_invitation` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.vp_vendor_mst
DROP TABLE IF EXISTS `vp_vendor_mst`;
CREATE TABLE IF NOT EXISTS `vp_vendor_mst` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(100) NOT NULL,
  `vendor_code` varchar(50) DEFAULT NULL,
  `business_name` varchar(150) DEFAULT NULL,
  `email` varchar(150) NOT NULL,
  `cc_email` varchar(150) DEFAULT NULL,
  `contact_number` varchar(50) DEFAULT '',
  `contact_person` varchar(150) DEFAULT NULL,
  `emp_id_no` varchar(20) DEFAULT '',
  `exempt_payee_code` varchar(40) DEFAULT '',
  `fatca_reporting_code` varchar(40) DEFAULT '',
  `fax` varchar(20) DEFAULT '',
  `name` varchar(150) NOT NULL DEFAULT '',
  `social_sec_no` varchar(15) DEFAULT '',
  `tax_class_otherdetail` varchar(300) DEFAULT '',
  `tax_classification` varchar(3) DEFAULT '',
  `tax_code` varchar(25) DEFAULT '',
  `w9_form_url` varchar(200) DEFAULT '',
  `status` char(1) NOT NULL DEFAULT '',
  `sic_code` int(11) DEFAULT NULL,
  `naics_code` int(11) DEFAULT NULL,
  `business_description` text CHARACTER SET utf8 DEFAULT NULL,
  `web_url` varchar(300) CHARACTER SET utf8 DEFAULT '',
  `requested_tenant_id` varchar(50) DEFAULT '',
  `invitation_id` int(11) DEFAULT NULL,
  `community_id` int(11) DEFAULT NULL,
  `payment_type_id` int(11) DEFAULT NULL,
  `created_on` datetime NOT NULL,
  `created_by` varchar(100) NOT NULL,
  `update_on` datetime DEFAULT NULL,
  `update_by` varchar(100) DEFAULT '',
  `delete_on` datetime DEFAULT NULL,
  `delete_by` varchar(100) DEFAULT '',
  `is_diverse_supplier` char(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table papertrl_default_script.vp_vendor_mst: ~0 rows (approximately)
/*!40000 ALTER TABLE `vp_vendor_mst` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_vendor_mst` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.vp_vendor_mst_additional_data
DROP TABLE IF EXISTS `vp_vendor_mst_additional_data`;
CREATE TABLE IF NOT EXISTS `vp_vendor_mst_additional_data` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `vendor_mst_id` int(11) NOT NULL,
  `field_value` varchar(1000) DEFAULT NULL,
  `field_id` int(15) unsigned NOT NULL,
  `field_name` varchar(50) NOT NULL,
  `field_type_id` int(11) unsigned DEFAULT NULL,
  `section_id` int(11) unsigned NOT NULL,
  `display_order` int(11) unsigned NOT NULL,
  `multiple_status` char(1) DEFAULT 'I',
  `detail_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

-- Dumping data for table papertrl_default_script.vp_vendor_mst_additional_data: ~0 rows (approximately)
/*!40000 ALTER TABLE `vp_vendor_mst_additional_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_vendor_mst_additional_data` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.vp_vendor_mst_additional_field_attachment
DROP TABLE IF EXISTS `vp_vendor_mst_additional_field_attachment`;
CREATE TABLE IF NOT EXISTS `vp_vendor_mst_additional_field_attachment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field_id` int(11) NOT NULL,
  `vendor_mst_id` int(11) NOT NULL,
  `attachment_url` varchar(200) NOT NULL,
  `file_name` varchar(200) DEFAULT NULL,
  `file_type` varchar(100) DEFAULT NULL,
  `status` char(1) NOT NULL,
  `delete_by` varchar(100) DEFAULT '',
  `delete_on` datetime DEFAULT NULL,
  `field_name` varchar(50) NOT NULL,
  `section_id` int(11) NOT NULL,
  `display_order` int(11) NOT NULL,
  `detail_Id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Dumping data for table papertrl_default_script.vp_vendor_mst_additional_field_attachment: ~0 rows (approximately)
/*!40000 ALTER TABLE `vp_vendor_mst_additional_field_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_vendor_mst_additional_field_attachment` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.vp_vendor_w9_attachment
DROP TABLE IF EXISTS `vp_vendor_w9_attachment`;
CREATE TABLE IF NOT EXISTS `vp_vendor_w9_attachment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vendor_id` int(11) NOT NULL,
  `w9_form_data` mediumblob NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table papertrl_default_script.vp_vendor_w9_attachment: ~0 rows (approximately)
/*!40000 ALTER TABLE `vp_vendor_w9_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_vendor_w9_attachment` ENABLE KEYS */;

-- Dumping structure for table papertrl_default_script.vp_vendor_w9_parameter
DROP TABLE IF EXISTS `vp_vendor_w9_parameter`;
CREATE TABLE IF NOT EXISTS `vp_vendor_w9_parameter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `property_name` varchar(300) NOT NULL,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

-- Dumping data for table papertrl_default_script.vp_vendor_w9_parameter: ~21 rows (approximately)
/*!40000 ALTER TABLE `vp_vendor_w9_parameter` DISABLE KEYS */;
INSERT INTO `vp_vendor_w9_parameter` (`id`, `name`, `property_name`, `status`) VALUES
	(1, 'NAME_FIELD', 'topmostSubform[0].Page1[0].f1_1[0]', 'A'),
	(2, 'BUSINESS_NAME_FIELD', 'topmostSubform[0].Page1[0].f1_2[0]', 'A'),
	(3, 'EXEMPT_PAYEE_CODE', 'topmostSubform[0].Page1[0].Exemptions[0].f1_5[0]', 'A'),
	(4, 'FACTA_CODE', 'topmostSubform[0].Page1[0].Exemptions[0].f1_6[0]', 'A'),
	(5, 'TAX_TYPE_INDIVIDUAL', 'topmostSubform[0].Page1[0].FederalClassification[0].c1_1[0]', 'A'),
	(6, 'TAX_TYPE_C_CORPORATION', 'topmostSubform[0].Page1[0].FederalClassification[0].c1_1[1]', 'A'),
	(7, 'TAX_TYPE_S_CORPORATION', 'topmostSubform[0].Page1[0].FederalClassification[0].c1_1[2]', 'A'),
	(8, 'TAX_TYPE_S_PARTNERSHIP', 'topmostSubform[0].Page1[0].FederalClassification[0].c1_1[3]', 'A'),
	(9, 'TAX_TYPE_TRUST_ESTATE', 'topmostSubform[0].Page1[0].FederalClassification[0].c1_1[4]', 'A'),
	(10, 'TAX_TYPE_OTHER', 'topmostSubform[0].Page1[0].FederalClassification[0].c1_1[6]', 'A'),
	(11, 'TAX_TYPE_OTHER_DESC', 'topmostSubform[0].Page1[0].FederalClassification[0].f1_4[0]', 'A'),
	(12, 'TAX_TYPE_LIMITED_LIABILITY', 'topmostSubform[0].Page1[0].FederalClassification[0].c1_1[5]', 'A'),
	(13, 'TAX_TYPE_LIMITED_LIABILITY_CODE', 'topmostSubform[0].Page1[0].FederalClassification[0].f1_3[0]', 'A'),
	(14, 'ADDRESS_PART_1', 'topmostSubform[0].Page1[0].Address[0].f1_7[0]', 'A'),
	(15, 'ADDRESS_PART_2', 'topmostSubform[0].Page1[0].Address[0].f1_8[0]', 'A'),
	(16, 'ADDRESS_OTHER', 'topmostSubform[0].Page1[0].f1_9[0]', 'A'),
	(17, 'SOCIAL_SECURITY_NO_PART_1', 'topmostSubform[0].Page1[0].SSN[0].f1_11[0]', 'A'),
	(18, 'SOCIAL_SECURITY_NO_PART_2', 'topmostSubform[0].Page1[0].SSN[0].f1_12[0]', 'A'),
	(19, 'SOCIAL_SECURITY_NO_PART_3', 'topmostSubform[0].Page1[0].SSN[0].f1_13[0]', 'A'),
	(20, 'EMPLOYEE_ID_NO_PART_1', 'topmostSubform[0].Page1[0].EmployerID[0].f1_14[0]', 'A'),
	(21, 'EMPLOYEE_ID_NO_PART_2', 'topmostSubform[0].Page1[0].EmployerID[0].f1_15[0]', 'A');
/*!40000 ALTER TABLE `vp_vendor_w9_parameter` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
