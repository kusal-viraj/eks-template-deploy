/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

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

/*!40000 ALTER TABLE `ar_client_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `ar_client_address` ENABLE KEYS */;

DROP TABLE IF EXISTS `ar_client_category`;
CREATE TABLE IF NOT EXISTS `ar_client_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(70) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*!40000 ALTER TABLE `ar_client_category` DISABLE KEYS */;
INSERT INTO `ar_client_category` (`id`, `name`) VALUES
	(1, 'Commercial'),
	(2, 'Federal'),
	(3, 'J_Ventures'),
	(4, 'State');
/*!40000 ALTER TABLE `ar_client_category` ENABLE KEYS */;

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

/*!40000 ALTER TABLE `ar_client_mst` DISABLE KEYS */;
/*!40000 ALTER TABLE `ar_client_mst` ENABLE KEYS */;

DROP TABLE IF EXISTS `ar_contract_type`;
CREATE TABLE IF NOT EXISTS `ar_contract_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

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

/*!40000 ALTER TABLE `ar_division` DISABLE KEYS */;
INSERT INTO `ar_division` (`id`, `name`, `product_line_id`, `status`) VALUES
	(1, 'Construction', 1, 'A'),
	(2, 'Facilities', 1, 'A'),
	(3, 'Environmental', 2, 'A'),
	(4, 'Industrial Hygiene', 2, 'A'),
	(5, 'Radiological', 2, 'A'),
	(6, 'Drilling', 2, 'A');
/*!40000 ALTER TABLE `ar_division` ENABLE KEYS */;

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

/*!40000 ALTER TABLE `ar_oppartunity_project_location_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `ar_oppartunity_project_location_info` ENABLE KEYS */;

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

/*!40000 ALTER TABLE `ar_opportunity` DISABLE KEYS */;
/*!40000 ALTER TABLE `ar_opportunity` ENABLE KEYS */;

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

/*!40000 ALTER TABLE `ar_opportunity_additional_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `ar_opportunity_additional_data` ENABLE KEYS */;

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

/*!40000 ALTER TABLE `ar_opportunity_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `ar_opportunity_attachment` ENABLE KEYS */;

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

/*!40000 ALTER TABLE `ar_opportunity_audit_trial` DISABLE KEYS */;
/*!40000 ALTER TABLE `ar_opportunity_audit_trial` ENABLE KEYS */;

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

/*!40000 ALTER TABLE `ar_opportunity_internal_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `ar_opportunity_internal_info` ENABLE KEYS */;

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

/*!40000 ALTER TABLE `ar_opportunity_size_standard_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `ar_opportunity_size_standard_info` ENABLE KEYS */;

DROP TABLE IF EXISTS `ar_opportunity_source`;
CREATE TABLE IF NOT EXISTS `ar_opportunity_source` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*!40000 ALTER TABLE `ar_opportunity_source` DISABLE KEYS */;
INSERT INTO `ar_opportunity_source` (`id`, `name`, `status`) VALUES
	(1, 'FBO', 'A'),
	(2, 'GovWin', 'A');
/*!40000 ALTER TABLE `ar_opportunity_source` ENABLE KEYS */;

DROP TABLE IF EXISTS `ar_opportunity_type`;
CREATE TABLE IF NOT EXISTS `ar_opportunity_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*!40000 ALTER TABLE `ar_opportunity_type` DISABLE KEYS */;
INSERT INTO `ar_opportunity_type` (`id`, `name`, `status`) VALUES
	(1, 'Solicitation', 'A'),
	(2, 'Sources Sought', 'A'),
	(3, 'Pre-solicitation', 'A');
/*!40000 ALTER TABLE `ar_opportunity_type` ENABLE KEYS */;

DROP TABLE IF EXISTS `ar_partnership_type`;
CREATE TABLE IF NOT EXISTS `ar_partnership_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*!40000 ALTER TABLE `ar_partnership_type` DISABLE KEYS */;
INSERT INTO `ar_partnership_type` (`id`, `name`, `status`) VALUES
	(1, 'Tidewater', 'A'),
	(2, 'Joint Venture', 'A'),
	(3, 'Teaming ', 'A');
/*!40000 ALTER TABLE `ar_partnership_type` ENABLE KEYS */;

DROP TABLE IF EXISTS `ar_product_line`;
CREATE TABLE IF NOT EXISTS `ar_product_line` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*!40000 ALTER TABLE `ar_product_line` DISABLE KEYS */;
INSERT INTO `ar_product_line` (`id`, `name`, `status`) VALUES
	(1, 'Infrastructure', 'A'),
	(2, 'Environmental', 'A');
/*!40000 ALTER TABLE `ar_product_line` ENABLE KEYS */;

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

/*!40000 ALTER TABLE `ar_project` DISABLE KEYS */;
/*!40000 ALTER TABLE `ar_project` ENABLE KEYS */;

DROP TABLE IF EXISTS `ar_project_additional_data`;
CREATE TABLE IF NOT EXISTS `ar_project_additional_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field_value` varchar(200) DEFAULT NULL,
  `field_id` int(15) NOT NULL,
  `field_name` varchar(50) NOT NULL,
  `project_mst_id` int(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*!40000 ALTER TABLE `ar_project_additional_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `ar_project_additional_data` ENABLE KEYS */;

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

/*!40000 ALTER TABLE `ar_project_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `ar_project_attachment` ENABLE KEYS */;

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

/*!40000 ALTER TABLE `ar_project_audit_trial` DISABLE KEYS */;
/*!40000 ALTER TABLE `ar_project_audit_trial` ENABLE KEYS */;

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

/*!40000 ALTER TABLE `ar_project_employee_information` DISABLE KEYS */;
/*!40000 ALTER TABLE `ar_project_employee_information` ENABLE KEYS */;

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

/*!40000 ALTER TABLE `ar_project_partnership_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `ar_project_partnership_detail` ENABLE KEYS */;

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

/*!40000 ALTER TABLE `ar_project_subcontractor_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `ar_project_subcontractor_info` ENABLE KEYS */;

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

/*!40000 ALTER TABLE `ar_proposal` DISABLE KEYS */;
/*!40000 ALTER TABLE `ar_proposal` ENABLE KEYS */;

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

/*!40000 ALTER TABLE `ar_proposal_additional_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `ar_proposal_additional_data` ENABLE KEYS */;

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

/*!40000 ALTER TABLE `ar_proposal_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `ar_proposal_attachment` ENABLE KEYS */;

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

/*!40000 ALTER TABLE `ar_proposal_audit_trial` DISABLE KEYS */;
/*!40000 ALTER TABLE `ar_proposal_audit_trial` ENABLE KEYS */;

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

/*!40000 ALTER TABLE `ar_proposal_employee_information` DISABLE KEYS */;
/*!40000 ALTER TABLE `ar_proposal_employee_information` ENABLE KEYS */;

DROP TABLE IF EXISTS `ar_set_aside`;
CREATE TABLE IF NOT EXISTS `ar_set_aside` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

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

DROP TABLE IF EXISTS `ar_type_of_location`;
CREATE TABLE IF NOT EXISTS `ar_type_of_location` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;

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

DROP TABLE IF EXISTS `ar_type_of_work`;
CREATE TABLE IF NOT EXISTS `ar_type_of_work` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `status` char(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*!40000 ALTER TABLE `ar_type_of_work` DISABLE KEYS */;
INSERT INTO `ar_type_of_work` (`id`, `name`, `status`) VALUES
	(1, 'Elevator Installers and Repairers', 'A'),
	(2, 'Boilermakers', 'A'),
	(3, 'Construction Equipment Operators', 'A');
/*!40000 ALTER TABLE `ar_type_of_work` ENABLE KEYS */;

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
  PRIMARY KEY (`id`),
  KEY `FK_ACCOUNT_TYPE_1` (`account_type`),
  CONSTRAINT `FK_ACCOUNT_TYPE_1` FOREIGN KEY (`account_type`) REFERENCES `common_account_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=latin1;

/*!40000 ALTER TABLE `common_account_number` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_account_number` ENABLE KEYS */;

DROP TABLE IF EXISTS `common_account_number_import`;
CREATE TABLE IF NOT EXISTS `common_account_number_import` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `total_recodes` int(11) NOT NULL,
  `succeed` int(11) NOT NULL,
  `failed` int(11) NOT NULL,
  `created_by` varchar(100) NOT NULL,
  `created_on` datetime NOT NULL,
  `update_by` varchar(100) DEFAULT NULL,
  `update_on` datetime DEFAULT NULL,
  `delete_by` varchar(100) DEFAULT NULL,
  `delete_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*!40000 ALTER TABLE `common_account_number_import` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_account_number_import` ENABLE KEYS */;

DROP TABLE IF EXISTS `common_account_number_import_issue`;
CREATE TABLE IF NOT EXISTS `common_account_number_import_issue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `import_mst_id` int(11) NOT NULL,
  `recode` text DEFAULT NULL,
  `description` varchar(256) DEFAULT NULL,
  `line_no` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK__common_chart_of_account_import_mst` (`import_mst_id`),
  CONSTRAINT `FK__common_chart_of_account_import_mst` FOREIGN KEY (`import_mst_id`) REFERENCES `common_account_number_import` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*!40000 ALTER TABLE `common_account_number_import_issue` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_account_number_import_issue` ENABLE KEYS */;

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
	(59, 8, 'Rents in trust - Liability', 'RentsInTrust_Liability'),
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
	(73, 10, 'Paid-In Capital or Surplus', 'Paid_InCapitalOrSurplus'),
	(74, 10, 'Partner Contributions', 'PartnerContributions'),
	(75, 10, 'Partner\'s Equity', 'PartnersEquity'),
	(76, 10, 'Personal Expense', 'PersonalExpense'),
	(77, 10, 'Personal Income', 'PersonalIncome'),
	(78, 10, 'Preferred Stock', 'PreferredStock'),
	(79, 10, 'Retained Earnings', 'RetainedEarnings'),
	(80, 10, 'Treasury Stock', 'TreasuryStock'),
	(81, 11, 'Discounts/Refunds Given', 'DiscountsRefundsGiven'),
	(82, 11, 'Non-Profit Income', 'Non_ProfitIncome'),
	(83, 11, 'Other Primary Income', 'OtherPrimaryIncome'),
	(84, 11, 'Sales of Product Income', 'SalesOfProductIncome'),
	(85, 11, 'Service/Fee Income', 'ServiceFeeIncome'),
	(86, 11, 'Unapplied Cash Payment Income', 'UnappliedCashPaymentIncome'),
	(87, 12, 'Dividend Income', 'DividendIncome'),
	(88, 12, 'Interest Earned', 'InterestEarned'),
	(89, 12, 'Other Investment Income', 'OtherInvestmentIncome'),
	(90, 12, 'Other Miscellaneous Income', 'OtherMiscellaneousIncome'),
	(91, 12, 'Tax-Exempt Interest', 'Tax_ExemptInterest'),
	(92, 13, 'Cost of labor - COS', 'CostOfLaborCos'),
	(93, 13, 'Equipment Rental - COS', 'EquipmentRental_COS'),
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

DROP TABLE IF EXISTS `common_account_type`;
CREATE TABLE IF NOT EXISTS `common_account_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL DEFAULT '',
  `short_name` varchar(200) NOT NULL,
  `short_name_no_space` varchar(200) NOT NULL,
  `short_name_underscore` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

/*!40000 ALTER TABLE `common_account_type` DISABLE KEYS */;
INSERT INTO `common_account_type` (`id`, `name`, `short_name`, `short_name_no_space`, `short_name_underscore`) VALUES
	(1, 'Accounts receivable (A/R)', 'Accounts receivable', 'AccountsReceivable', 'ACCOUNTS_RECEIVABLE'),
	(2, 'Other Current Assets', 'Other Current Asset', 'OtherCurrentAsset', 'OTHER_CURRENT_ASSET'),
	(3, 'Bank', 'Bank', 'Bank', 'BANK'),
	(4, 'Fixed Assets', 'Fixed Asset', 'FixedAsset', 'FIXED_ASSET'),
	(5, 'Other Assets', 'Other Asset', 'OtherAsset', 'OTHER_ASSET'),
	(6, 'Accounts payable (A/P)', 'Accounts payable', 'AccountsPayable', 'ACCOUNTS_PAYABLE'),
	(7, 'Credit Card', 'Credit Card', 'CreditCard', 'CREDIT_CARD'),
	(8, 'Other Current Liabilities', 'Other Current Liability', 'OtherCurrentLiability', 'OTHER_CURRENT_LIABILITY'),
	(9, 'Long Term Liabilities', 'Long Term Liability', 'LongTermLiability', 'LONG_TERM_LIABILITY'),
	(10, 'Equity', 'Equity', 'Equity', 'EQUITY'),
	(11, 'Income', 'Income', 'Income', 'INCOME'),
	(12, 'Other Income', 'Other Income', 'OtherIncome', 'OTHER_INCOME'),
	(13, 'Cost of Goods Sold', 'Cost of Goods Sold', 'CostOfGoodsSold', 'COST_OF_GOODSSOLD'),
	(14, 'Expenses', 'Expense', 'Expense', 'EXPENSE'),
	(15, 'Other Expense', 'Other Expense', 'OtherExpense', 'OTHER_EXPENSE'),
	(16, 'Non Posting', 'Non Posting', 'NonPosting', 'NON_POSTING');
/*!40000 ALTER TABLE `common_account_type` ENABLE KEYS */;

DROP TABLE IF EXISTS `common_additional_field`;
CREATE TABLE IF NOT EXISTS `common_additional_field` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `module_id` int(11) NOT NULL,
  `field_name` varchar(80) NOT NULL,
  `max_length` int(5) DEFAULT NULL,
  `display_order` int(5) NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT 0,
  `field_id` int(11) NOT NULL,
  `section_id` int(11) DEFAULT NULL,
  `field_type` varchar(50) DEFAULT NULL,
  `data_type` varchar(150) DEFAULT NULL,
  `create_new` char(1) DEFAULT NULL,
  `multiple` char(1) DEFAULT NULL,
  `file_types` varchar(300) DEFAULT '',
  `status` char(1) NOT NULL DEFAULT 'A',
  `row_count` int(50) DEFAULT NULL,
  `value` varchar(250) DEFAULT NULL,
  `data_source_id` int(11) DEFAULT NULL,
  `delete_by` varchar(100) DEFAULT '',
  `delete_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*!40000 ALTER TABLE `common_additional_field` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_additional_field` ENABLE KEYS */;

DROP TABLE IF EXISTS `common_additional_field_option`;
CREATE TABLE IF NOT EXISTS `common_additional_field_option` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field_id` int(11) DEFAULT NULL,
  `option_value` varchar(100) NOT NULL,
  `data_source_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_FIELD_ID` (`field_id`),
  CONSTRAINT `FK_FIELD_ID` FOREIGN KEY (`field_id`) REFERENCES `common_additional_field` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

/*!40000 ALTER TABLE `common_additional_field_option` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_additional_field_option` ENABLE KEYS */;

DROP TABLE IF EXISTS `common_approval_code`;
CREATE TABLE IF NOT EXISTS `common_approval_code` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `long_name` varchar(300) DEFAULT NULL,
  `description` varchar(300) DEFAULT NULL,
  `expense_category_id` int(11) NOT NULL,
  `status` char(1) NOT NULL,
  `created_by` varchar(100) NOT NULL,
  `created_on` datetime NOT NULL,
  `update_by` varchar(100) DEFAULT '',
  `update_on` datetime DEFAULT NULL,
  `delete_by` varchar(100) DEFAULT NULL,
  `delete_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_EXP_CAT` (`expense_category_id`),
  CONSTRAINT `FK_EXP_CAT` FOREIGN KEY (`expense_category_id`) REFERENCES `common_approval_code_category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*!40000 ALTER TABLE `common_approval_code` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_approval_code` ENABLE KEYS */;

DROP TABLE IF EXISTS `common_approval_code_category`;
CREATE TABLE IF NOT EXISTS `common_approval_code_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(70) NOT NULL,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

/*!40000 ALTER TABLE `common_approval_code_category` DISABLE KEYS */;
INSERT INTO `common_approval_code_category` (`id`, `name`, `status`) VALUES
	(1, 'Expense', 'I'),
	(2, 'Project', 'A');
/*!40000 ALTER TABLE `common_approval_code_category` ENABLE KEYS */;

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
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=latin1;

/*!40000 ALTER TABLE `common_approval_code_import_issue` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_approval_code_import_issue` ENABLE KEYS */;

DROP TABLE IF EXISTS `common_approval_code_import_mst`;
CREATE TABLE IF NOT EXISTS `common_approval_code_import_mst` (
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

/*!40000 ALTER TABLE `common_approval_code_import_mst` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_approval_code_import_mst` ENABLE KEYS */;

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*!40000 ALTER TABLE `common_approval_group` DISABLE KEYS */;
INSERT INTO `common_approval_group` (`id`, `name`, `status`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES
	(1, 'Administrator', 'A', 'admin', '2019-11-19 22:58:33', NULL, NULL, NULL, NULL),
	(3, 'No Approval Group', 'A', 'admin', '2020-03-31 09:31:43', NULL, NULL, NULL, NULL),
	(4, 'Project Manager', 'A', 'admin', '2021-03-06 10:57:57', NULL, NULL, NULL, NULL),
	(5, 'Account Receivable', 'A', 'admin', '2021-03-06 11:00:09', NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `common_approval_group` ENABLE KEYS */;

DROP TABLE IF EXISTS `common_approval_group_import_issue`;
CREATE TABLE IF NOT EXISTS `common_approval_group_import_issue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `import_mst_id` int(11) NOT NULL,
  `record` text DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL,
  `line_no` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*!40000 ALTER TABLE `common_approval_group_import_issue` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_approval_group_import_issue` ENABLE KEYS */;

DROP TABLE IF EXISTS `common_approval_group_import_mst`;
CREATE TABLE IF NOT EXISTS `common_approval_group_import_mst` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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

/*!40000 ALTER TABLE `common_approval_group_import_mst` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_approval_group_import_mst` ENABLE KEYS */;

DROP TABLE IF EXISTS `common_attachment_type`;
CREATE TABLE IF NOT EXISTS `common_attachment_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=latin1;

/*!40000 ALTER TABLE `common_attachment_type` DISABLE KEYS */;
INSERT INTO `common_attachment_type` (`id`, `name`) VALUES
	(1, 'RFP '),
	(2, 'Final Proposal'),
	(3, 'Amendments'),
	(4, 'Debrief/Protest'),
	(5, 'Award Letter'),
	(6, 'Final Report'),
	(7, 'Signed Contract'),
	(8, 'CPARS'),
	(9, 'Work Order'),
	(10, 'Task Proposal'),
	(11, 'Contract'),
	(20, 'Other'),
	(38, 'Project Folder 3'),
	(39, 'Folder 3'),
	(40, 'Folder 6'),
	(41, 'Project Folder 9'),
	(42, 'Project Folder 4'),
	(43, 'Sample Folder 10'),
	(44, 'Sample Folder 11');
/*!40000 ALTER TABLE `common_attachment_type` ENABLE KEYS */;

DROP TABLE IF EXISTS `common_audit_trial_status`;
CREATE TABLE IF NOT EXISTS `common_audit_trial_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(75) NOT NULL,
  `sort_order` int(2) NOT NULL,
  `icon` varchar(50) NOT NULL,
  `color` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;

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
	(9, 'Last action reversed by ', 8, 'fa fa-undo', 'bg-blue'),
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
	(23, 'Save as approved by', 15, 'fa fa-check', 'bg-blue');
/*!40000 ALTER TABLE `common_audit_trial_status` ENABLE KEYS */;

DROP TABLE IF EXISTS `common_automation_action`;
CREATE TABLE IF NOT EXISTS `common_automation_action` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `short_code` varchar(100) NOT NULL,
  `action_name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*!40000 ALTER TABLE `common_automation_action` DISABLE KEYS */;
INSERT INTO `common_automation_action` (`id`, `short_code`, `action_name`) VALUES
	(1, 'CREATE_APPROVAL_WORKFLOW', 'Create Approval Workflow'),
	(2, 'SEND_EMAIL_NOTIFICATION', 'Send Email Notification'),
	(3, 'SEND_USER_NOTIFICATION', 'Send User Notification'),
	(4, 'SET_FIELD_VALUE', 'Set Field Value'),
	(5, 'EXECUTE_AUTOMATION', 'Execute Automation'),
	(6, 'SYNC_WITH_THIRD_PART_APPLICATION', 'Sync With Third-Part Application');
/*!40000 ALTER TABLE `common_automation_action` ENABLE KEYS */;

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

/*!40000 ALTER TABLE `common_automation_action_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_automation_action_config` ENABLE KEYS */;

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

/*!40000 ALTER TABLE `common_automation_chain_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_automation_chain_config` ENABLE KEYS */;

DROP TABLE IF EXISTS `common_automation_condition`;
CREATE TABLE IF NOT EXISTS `common_automation_condition` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `condition_name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*!40000 ALTER TABLE `common_automation_condition` DISABLE KEYS */;
INSERT INTO `common_automation_condition` (`id`, `condition_name`) VALUES
	(1, 'Equals'),
	(2, 'Not Equals'),
	(3, 'Greater Than'),
	(4, 'Greater Than or Equal'),
	(5, 'Less Than'),
	(6, 'Less Than or Equal'),
	(7, 'Contains'),
	(8, 'Between');
/*!40000 ALTER TABLE `common_automation_condition` ENABLE KEYS */;

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

/*!40000 ALTER TABLE `common_automation_condition_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_automation_condition_config` ENABLE KEYS */;

DROP TABLE IF EXISTS `common_automation_document_type`;
CREATE TABLE IF NOT EXISTS `common_automation_document_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `document_type` varchar(100) NOT NULL,
  `short_code` varchar(100) NOT NULL,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*!40000 ALTER TABLE `common_automation_document_type` DISABLE KEYS */;
INSERT INTO `common_automation_document_type` (`id`, `document_type`, `short_code`, `status`) VALUES
	(1, 'Bills', 'BILL', 'A'),
	(2, 'Purchasing Orders', 'PO', 'A'),
	(3, 'Purchasing Order Receipts', 'PO_RECEIPT', 'A'),
	(4, 'Expenses', 'EXPENSE', 'A'),
	(5, 'Bill Payment', 'BILL_PAYMENT', 'A');
/*!40000 ALTER TABLE `common_automation_document_type` ENABLE KEYS */;

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

/*!40000 ALTER TABLE `common_automation_document_type_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_automation_document_type_config` ENABLE KEYS */;

DROP TABLE IF EXISTS `common_automation_document_type_event`;
CREATE TABLE IF NOT EXISTS `common_automation_document_type_event` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `document_type_id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `DOC_TYPE_FK` (`document_type_id`),
  KEY `EVENT_FK` (`event_id`),
  CONSTRAINT `DOC_TYPE_FK` FOREIGN KEY (`document_type_id`) REFERENCES `common_automation_document_type` (`id`),
  CONSTRAINT `EVENT_FK` FOREIGN KEY (`event_id`) REFERENCES `common_automation_event` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

/*!40000 ALTER TABLE `common_automation_document_type_event` DISABLE KEYS */;
INSERT INTO `common_automation_document_type_event` (`id`, `document_type_id`, `event_id`) VALUES
	(1, 1, 1),
	(2, 1, 2),
	(3, 1, 3),
	(4, 1, 5),
	(5, 1, 4),
	(6, 1, 6),
	(7, 1, 9),
	(8, 1, 8),
	(9, 1, 10);
/*!40000 ALTER TABLE `common_automation_document_type_event` ENABLE KEYS */;

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

/*!40000 ALTER TABLE `common_automation_email_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_automation_email_config` ENABLE KEYS */;

DROP TABLE IF EXISTS `common_automation_event`;
CREATE TABLE IF NOT EXISTS `common_automation_event` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event_name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

/*!40000 ALTER TABLE `common_automation_event` DISABLE KEYS */;
INSERT INTO `common_automation_event` (`id`, `event_name`) VALUES
	(1, 'Submitted'),
	(2, 'Edit & Resubmitted'),
	(3, 'Approved'),
	(4, 'Rejected'),
	(5, 'Skipped Approval'),
	(6, 'Deleted'),
	(7, 'Sent to Vendor'),
	(8, 'Created'),
	(9, 'Uploaded'),
	(10, 'Reassigned'),
	(11, 'Voided'),
	(12, 'Marked as Mailed'),
	(13, 'Applied to Different Bill');
/*!40000 ALTER TABLE `common_automation_event` ENABLE KEYS */;

DROP TABLE IF EXISTS `common_automation_expense_cost_config`;
CREATE TABLE IF NOT EXISTS `common_automation_expense_cost_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `automation_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `description` varchar(500) NOT NULL DEFAULT '',
  `amount` decimal(19,2) NOT NULL,
  `billable` tinyint(1) DEFAULT NULL,
  `tax` tinyint(1) DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_vp_vendor_item_cost_distribution_common_chart_of_account` (`account_id`),
  KEY `PROJECT_ID_FK_3` (`project_id`),
  KEY `AUTOMATION_ID_FK_12` (`automation_id`),
  CONSTRAINT `AUTOMATION_ID_FK_12` FOREIGN KEY (`automation_id`) REFERENCES `common_automation_mst` (`id`),
  CONSTRAINT `common_automation_expense_cost_config_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `common_account_number` (`id`),
  CONSTRAINT `common_automation_expense_cost_config_ibfk_3` FOREIGN KEY (`project_id`) REFERENCES `common_approval_code` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*!40000 ALTER TABLE `common_automation_expense_cost_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_automation_expense_cost_config` ENABLE KEYS */;

DROP TABLE IF EXISTS `common_automation_field`;
CREATE TABLE IF NOT EXISTS `common_automation_field` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `document_type` int(11) NOT NULL,
  `short_code` varchar(100) DEFAULT NULL,
  `field_name` varchar(200) NOT NULL,
  `condition_enable` tinyint(1) NOT NULL,
  `action_enable` tinyint(1) NOT NULL,
  `show_hide_enable` tinyint(1) NOT NULL,
  `data_type` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `DOCUMENT_TYPE_FK` (`document_type`),
  CONSTRAINT `DOCUMENT_TYPE_FK` FOREIGN KEY (`document_type`) REFERENCES `common_automation_document_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8;

/*!40000 ALTER TABLE `common_automation_field` DISABLE KEYS */;
INSERT INTO `common_automation_field` (`id`, `document_type`, `short_code`, `field_name`, `condition_enable`, `action_enable`, `show_hide_enable`, `data_type`) VALUES
	(1, 1, '[DB Entity]', 'Bill Number', 1, 1, 0, '0'),
	(2, 1, '[DB Entity]', 'Bill Amount', 1, 1, 0, '0'),
	(3, 1, '[DB Entity]', 'Vendor', 1, 1, 0, '0'),
	(4, 1, '[DB Entity]', 'Template', 1, 1, 0, '0'),
	(5, 1, '[DB Entity]', 'PO Number', 1, 1, 1, '0'),
	(6, 1, '[DB Entity]', 'PO Receipt Number', 1, 1, 1, '0'),
	(7, 1, '[DB Entity]', 'Date Format', 0, 0, 0, '0'),
	(8, 1, '[DB Entity]', 'Bill Date', 1, 1, 0, '0'),
	(9, 1, '[DB Entity]', 'Payment Terms', 1, 1, 0, '0'),
	(10, 1, '[DB Entity]', 'Due Date', 1, 1, 0, '0'),
	(11, 1, '[DB Entity]', 'Comment', 0, 0, 1, '0'),
	(12, 1, '[DB Entity]', 'Item Code', 0, 0, 0, '0'),
	(13, 1, '[DB Entity]', 'Item Name', 0, 0, 0, '0'),
	(14, 1, '[DB Entity]', 'Units', 0, 0, 0, '0'),
	(15, 1, '[DB Entity]', 'Unit Price', 0, 0, 0, '0'),
	(16, 1, '[DB Entity]', 'Tax Amount', 1, 1, 0, '0'),
	(17, 3, '[DB Entity]', 'PO Receipt Number', 1, 1, 0, '0'),
	(18, 3, '[DB Entity]', 'PO Receipt Date', 1, 1, 0, '0'),
	(19, 3, '[DB Entity]', 'Vendor', 1, 1, 0, '0'),
	(20, 3, '[DB Entity]', 'PO Number', 1, 1, 0, '0'),
	(21, 3, '[DB Entity]', 'PO Date', 1, 1, 0, '0'),
	(22, 3, '[DB Entity]', 'Received By', 0, 0, 0, '0'),
	(23, 3, '[DB Entity]', 'Item Number', 0, 0, 1, '0'),
	(24, 3, '[DB Entity]', 'Item Name', 0, 0, 1, '0'),
	(25, 3, '[DB Entity]', 'UOM', 0, 0, 1, '0'),
	(26, 3, '[DB Entity]', 'Remaining Qty', 0, 0, 1, '0'),
	(27, 3, '[DB Entity]', 'Received Qty', 0, 0, 1, '0'),
	(28, 3, '[DB Entity]', 'Unit Price', 0, 0, 1, '0'),
	(29, 3, '[DB Entity]', 'Amount', 0, 0, 1, '0'),
	(30, 3, '[DB Entity]', 'Total Amount', 1, 1, 0, '0'),
	(31, 3, '[DB Entity]', 'Notes', 0, 0, 0, '0'),
	(32, 2, '[DB Entity]', 'Po Number', 1, 1, 0, '0'),
	(33, 2, '[DB Entity]', 'Submit Date', 1, 1, 1, '0'),
	(34, 2, '[DB Entity]', 'Vendor', 1, 1, 0, '0'),
	(35, 2, '[DB Entity]', 'Project / Task', 1, 1, 1, '0'),
	(36, 2, '[DB Entity]', 'Date of Delivery ', 1, 1, 0, '0'),
	(37, 2, '[DB Entity]', 'Contact Number', 0, 1, 0, '0'),
	(38, 2, '[DB Entity]', 'Contact Person', 1, 1, 0, '0'),
	(39, 2, '[DB Entity]', 'Notes', 0, 0, 1, '0'),
	(40, 2, '[DB Entity]', 'Shipping Address', 0, 0, 0, '0'),
	(41, 2, '[DB Entity]', 'Billing Address', 0, 0, 0, '0'),
	(42, 2, '[DB Entity]', 'Select Item', 0, 0, 0, '0'),
	(43, 2, '[DB Entity]', 'Item Name', 0, 0, 0, '0'),
	(44, 2, '[DB Entity]', 'UOM', 0, 0, 0, '0'),
	(45, 2, '[DB Entity]', 'QTY', 0, 0, 0, '0'),
	(46, 2, '[DB Entity]', 'Price', 0, 0, 0, '0'),
	(47, 2, '[DB Entity]', 'Discount', 0, 0, 0, '0'),
	(48, 2, '[DB Entity]', 'Amount', 0, 0, 0, '0'),
	(49, 2, '[DB Entity]', 'Tax amount', 1, 1, 0, '0'),
	(50, 2, '[DB Entity]', 'Discount Amount', 1, 1, 0, '0'),
	(51, 2, '[DB Entity]', 'Net Amount', 1, 1, 0, '0'),
	(52, 4, '[DB Entity]', 'Report Name', 0, 0, 1, '0'),
	(53, 4, '[DB Entity]', 'Business Purpose', 0, 0, 1, '0'),
	(54, 4, '[DB Entity]', 'Receipt', 0, 0, 0, '0'),
	(55, 4, '[DB Entity]', 'Date', 0, 0, 0, '0'),
	(56, 4, '[DB Entity]', 'Merchant', 0, 0, 0, '0'),
	(57, 4, '[DB Entity]', 'Project / Task', 0, 0, 0, '0'),
	(58, 4, '[DB Entity]', 'Expense Type', 0, 0, 0, '0'),
	(59, 4, '[DB Entity]', 'Amount', 0, 0, 0, '0'),
	(60, 4, '[DB Entity]', 'Net Amount', 1, 1, 0, '0'),
	(61, 4, '[DB Entity]', 'Notes', 0, 0, 1, '0'),
	(62, 4, '[DB Entity]', 'Description', 0, 0, 1, '0'),
	(63, 5, '[DB Entity]', 'Vendor', 1, 1, 0, '0'),
	(64, 5, '[DB Entity]', 'Invoice Number', 1, 1, 0, '0'),
	(65, 5, '[DB Entity]', 'Payment Method', 1, 1, 0, '0'),
	(66, 5, '[DB Entity]', 'Payment Reference', 1, 1, 0, '0'),
	(67, 5, '[DB Entity]', 'Invoice Date', 1, 1, 0, '0'),
	(68, 5, '[DB Entity]', 'Payment Date', 1, 1, 0, '0'),
	(69, 5, '[DB Entity]', 'Balance to be Paid', 1, 1, 0, '0'),
	(70, 5, '[DB Entity]', 'Payment Amount', 1, 1, 0, '0'),
	(71, 5, '[DB Entity]', 'Discount Amount', 1, 1, 0, '0'),
	(72, 5, '[DB Entity]', 'Receipt', 0, 0, 0, '0');
/*!40000 ALTER TABLE `common_automation_field` ENABLE KEYS */;

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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

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
	(10, 2, 8);
/*!40000 ALTER TABLE `common_automation_field_condition` ENABLE KEYS */;

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

/*!40000 ALTER TABLE `common_automation_field_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_automation_field_config` ENABLE KEYS */;

DROP TABLE IF EXISTS `common_automation_item_cost_config`;
CREATE TABLE IF NOT EXISTS `common_automation_item_cost_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `automation_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `description` varchar(500) NOT NULL DEFAULT '',
  `qty` decimal(12,2) NOT NULL DEFAULT 0.00,
  `rate` decimal(19,2) DEFAULT 0.00,
  `amount` decimal(19,2) NOT NULL,
  `billable` tinyint(1) DEFAULT 1,
  `tax` tinyint(1) DEFAULT 1,
  `project_id` int(11) DEFAULT NULL,
  `po_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_vp_invoice_item_cost_distribution_common_product_mst` (`item_id`),
  KEY `AUTOMATION_FK_10` (`automation_id`),
  KEY `PROJECT_ID_FK_2` (`project_id`),
  KEY `PO_ID_FK_2` (`po_id`),
  CONSTRAINT `AUTOMATION_FK_10` FOREIGN KEY (`automation_id`) REFERENCES `common_automation_mst` (`id`),
  CONSTRAINT `PO_ID_FK_2` FOREIGN KEY (`po_id`) REFERENCES `vp_po_mst` (`id`),
  CONSTRAINT `PROJECT_ID_FK_2` FOREIGN KEY (`project_id`) REFERENCES `common_approval_code` (`id`),
  CONSTRAINT `common_automation_item_cost_config_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `common_item_mst` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

/*!40000 ALTER TABLE `common_automation_item_cost_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_automation_item_cost_config` ENABLE KEYS */;

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

/*!40000 ALTER TABLE `common_automation_mst` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_automation_mst` ENABLE KEYS */;

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

/*!40000 ALTER TABLE `common_automation_notification` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_automation_notification` ENABLE KEYS */;

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

/*!40000 ALTER TABLE `common_automation_notification_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_automation_notification_config` ENABLE KEYS */;

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

/*!40000 ALTER TABLE `common_automation_system_sync_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_automation_system_sync_config` ENABLE KEYS */;

DROP TABLE IF EXISTS `common_automation_workflow_config`;
CREATE TABLE IF NOT EXISTS `common_automation_workflow_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `automation_id` int(11) NOT NULL,
  `action_id` int(11) NOT NULL,
  `approval_group` varchar(100) DEFAULT NULL,
  `approval_user` varchar(100) DEFAULT '',
  `approval_order` int(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `AUTOMATION_ID_FK2` (`automation_id`),
  KEY `ACTION_FK1` (`action_id`),
  CONSTRAINT `ACTION_FK1` FOREIGN KEY (`action_id`) REFERENCES `common_automation_action` (`id`),
  CONSTRAINT `AUTOMATION_ID_FK2` FOREIGN KEY (`automation_id`) REFERENCES `common_automation_mst` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*!40000 ALTER TABLE `common_automation_workflow_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_automation_workflow_config` ENABLE KEYS */;

DROP TABLE IF EXISTS `common_data_source`;
CREATE TABLE IF NOT EXISTS `common_data_source` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `type` int(11) NOT NULL,
  `config_id` int(11) DEFAULT NULL,
  `status` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

/*!40000 ALTER TABLE `common_data_source` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_data_source` ENABLE KEYS */;

DROP TABLE IF EXISTS `common_data_source_config`;
CREATE TABLE IF NOT EXISTS `common_data_source_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entity` varchar(100) NOT NULL,
  `alias` varchar(50) NOT NULL,
  `field` varchar(100) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

/*!40000 ALTER TABLE `common_data_source_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_data_source_config` ENABLE KEYS */;

DROP TABLE IF EXISTS `common_date_format`;
CREATE TABLE IF NOT EXISTS `common_date_format` (
  `id` varchar(30) NOT NULL,
  `name` varchar(30) NOT NULL,
  `sort_order` int(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
	('yyyy-MM/dd', '2018-12-30', 44),
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*!40000 ALTER TABLE `common_document_ad_hoc_workflow_config` DISABLE KEYS */;
INSERT INTO `common_document_ad_hoc_workflow_config` (`id`, `reference_no`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES
	(3, '5', 'admin', '2021-03-06 12:37:56', NULL, NULL, NULL, NULL),
	(4, '7', 'admin', '2021-03-06 14:19:55', NULL, NULL, NULL, NULL),
	(5, '8', 'admin', '2021-03-06 14:29:37', NULL, NULL, NULL, NULL),
	(6, '9', 'admin', '2021-03-06 14:44:18', NULL, NULL, NULL, NULL),
	(7, '11', 'admin', '2021-03-06 14:48:08', NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `common_document_ad_hoc_workflow_config` ENABLE KEYS */;

DROP TABLE IF EXISTS `common_document_ad_hoc_workflow_detail_config`;
CREATE TABLE IF NOT EXISTS `common_document_ad_hoc_workflow_detail_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `workflow_id` int(11) NOT NULL,
  `approval_group` varchar(100) DEFAULT NULL,
  `approval_user` varchar(100) DEFAULT '',
  `approval_order` int(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `AUTOMATION_ID_FK2` (`workflow_id`),
  CONSTRAINT `AD_HOC_WORKFLOW_FK_1` FOREIGN KEY (`workflow_id`) REFERENCES `common_document_ad_hoc_workflow_config` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

/*!40000 ALTER TABLE `common_document_ad_hoc_workflow_detail_config` DISABLE KEYS */;
INSERT INTO `common_document_ad_hoc_workflow_detail_config` (`id`, `workflow_id`, `approval_group`, `approval_user`, `approval_order`) VALUES
	(5, 3, '4', NULL, 1),
	(6, 3, '5', NULL, 2),
	(7, 4, '4', NULL, 1),
	(8, 4, '5', NULL, 2),
	(9, 4, NULL, 'indragupthaekanayaka@gmail.com', 3),
	(10, 5, '4', 'indragupthaekanayaka@gmail.com', 1),
	(11, 6, '4', NULL, 1),
	(12, 6, '4', NULL, 2),
	(13, 7, '4', NULL, 1);
/*!40000 ALTER TABLE `common_document_ad_hoc_workflow_detail_config` ENABLE KEYS */;

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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*!40000 ALTER TABLE `common_document_workflow_config` DISABLE KEYS */;
INSERT INTO `common_document_workflow_config` (`id`, `document_id`, `document_type`, `automation_id`, `ah_hoc_workflow_id`, `event_id`, `workflow_level`, `no_of_level`, `status`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES
	(3, 5, 2, NULL, 3, 1, 2, 2, 'A', 'admin', '2021-03-06 12:38:06', NULL, NULL, NULL, NULL),
	(4, 7, 2, NULL, 4, 1, 3, 3, 'A', 'admin', '2021-03-06 14:19:55', NULL, NULL, NULL, NULL),
	(5, 8, 2, NULL, 5, 1, 1, 1, 'R', 'admin', '2021-03-06 14:29:37', NULL, NULL, NULL, NULL),
	(6, 9, 2, NULL, 6, 1, 1, 2, 'P', 'admin', '2021-03-06 14:44:18', NULL, NULL, NULL, NULL),
	(7, 11, 2, NULL, 7, 1, 1, 1, 'A', 'admin', '2021-03-06 14:48:08', NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `common_document_workflow_config` ENABLE KEYS */;

DROP TABLE IF EXISTS `common_drop_down`;
CREATE TABLE IF NOT EXISTS `common_drop_down` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `drop_down_name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

/*!40000 ALTER TABLE `common_drop_down` DISABLE KEYS */;
INSERT INTO `common_drop_down` (`id`, `drop_down_name`) VALUES
	(1, 'Active Inactive Status Drop Down'),
	(2, 'Approval Group Status'),
	(3, 'User Status'),
	(4, 'Account Status'),
	(5, 'Item Status'),
	(6, 'Item Taxability'),
	(7, 'Sub Account Status'),
	(8, 'Bill Payment Status'),
	(9, 'Project Code Status'),
	(10, 'Additional Field Required Status'),
	(11, 'Additional Field Active Status'),
	(12, 'Internal Approval Status'),
	(13, 'Vendor Approval Status');
/*!40000 ALTER TABLE `common_drop_down` ENABLE KEYS */;

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
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

/*!40000 ALTER TABLE `common_drop_down_connection` DISABLE KEYS */;
INSERT INTO `common_drop_down_connection` (`id`, `drop_down_id`, `drop_down_value_id`) VALUES
	(1, 1, 1),
	(2, 1, 2),
	(3, 2, 1),
	(4, 2, 2),
	(5, 3, 3),
	(6, 4, 1),
	(7, 4, 2),
	(8, 5, 1),
	(9, 5, 2),
	(10, 6, 4),
	(11, 6, 5),
	(12, 7, 1),
	(13, 7, 2),
	(14, 8, 1),
	(15, 8, 6),
	(16, 8, 7),
	(17, 8, 8),
	(18, 9, 1),
	(19, 9, 2),
	(21, 10, 9),
	(22, 10, 10),
	(23, 11, 1),
	(24, 11, 2),
	(25, 13, 13),
	(26, 13, 14),
	(27, 13, 12),
	(28, 12, 13),
	(29, 12, 12),
	(30, 12, 11),
	(31, 12, 13);
/*!40000 ALTER TABLE `common_drop_down_connection` ENABLE KEYS */;

DROP TABLE IF EXISTS `common_drop_down_value`;
CREATE TABLE IF NOT EXISTS `common_drop_down_value` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value` varchar(50) NOT NULL,
  `label` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

/*!40000 ALTER TABLE `common_drop_down_value` DISABLE KEYS */;
INSERT INTO `common_drop_down_value` (`id`, `value`, `label`) VALUES
	(1, 'A', 'Active'),
	(2, 'I', 'In-Active'),
	(3, 'L', 'Locked'),
	(4, 'T', 'Taxable'),
	(5, 'N', 'Non Taxable'),
	(6, 'V', 'Void'),
	(7, 'PAID', 'Paid'),
	(8, 'M', 'Mailed'),
	(9, 'Y', 'Required'),
	(10, 'N', 'Optional'),
	(11, 'A', 'Approved'),
	(12, 'R', 'Reject'),
	(13, 'P', 'Pending'),
	(14, 'NA', 'Not-Assigned');
/*!40000 ALTER TABLE `common_drop_down_value` ENABLE KEYS */;

DROP TABLE IF EXISTS `common_email_attachment`;
CREATE TABLE IF NOT EXISTS `common_email_attachment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `attachment_url` text NOT NULL,
  `attachment_name` varchar(100) NOT NULL,
  `email_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `EMAIL_ID_FK1` (`email_id`) USING BTREE,
  CONSTRAINT `common_email_attachment_ibfk_1` FOREIGN KEY (`email_id`) REFERENCES `common_email_mst` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*!40000 ALTER TABLE `common_email_attachment` DISABLE KEYS */;
INSERT INTO `common_email_attachment` (`id`, `attachment_url`, `attachment_name`, `email_id`) VALUES
	(1, 'VP_SYSTEM/Purchase_Order/13/2021-03-06/03-06-2021/admin/1615040413210_PURCHASE_ORDER_REPORT.pdf', 'PURCHASE_ORDER_REPORT.pdf', 18),
	(2, 'VP_SYSTEM/Purchase_Order/13/2021-03-06/03-06-2021/admin/1615040977476_PURCHASE_ORDER_REPORT.pdf', 'PURCHASE_ORDER_REPORT.pdf', 19);
/*!40000 ALTER TABLE `common_email_attachment` ENABLE KEYS */;

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
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

/*!40000 ALTER TABLE `common_email_mst` DISABLE KEYS */;
INSERT INTO `common_email_mst` (`id`, `subject`, `message`, `to_address`, `cc_address`, `status`, `attempts`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES
	(1, 'Log in to PaperTrl and get started!', '<!doctype html>\n<!--\nTo change this license header, choose License Headers in Project Properties.\nTo change this template file, choose Tools | Templates\nand open the template in the editor.\n-->\n<html>\n <head> \n  <meta charset="UTF-8"> \n  <meta name="viewport" content="width=device-width, initial-scale=1.0"> \n </head> \n <body> \n  <table style="color: #207580;"> \n   <tbody>\n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr> \n     <td style="font-weight: bold">Hi <span id="EMAIL_SEND_TO">Papertrl</span>,</td> \n    </tr> \n    <tr>\n     <td></td> \n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr> \n     <td>You are all set! Your PaperTrl User ID is <span style="font-weight: bold; font-style: italic;" id="USER_ID">admin</span></td> \n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr> \n     <td>\n      <ul></ul>\n      <ul></ul>Please <a id="PASSWORD_RESET_URL" href="https://demo-test1.papertrl.com:443/temporary-password-reset?usd=wyohu1LnkeU%3D&amp;tkn=2zkFPxq9TQkxgGIDfmprnA%3D%3D"> click here </a> here to reset your password then use the Task List below to get started. </td> \n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr> \n     <td> \n      <dl> \n       <dt>\n        Begin using PaperTrl in five easy steps:\n       </dt> \n       <dd>\n        1. Log in with the \n        <b>link</b> above.\n       </dd> \n       <dd>\n        2. Click on \n        <b>Settings</b> to complete your Company Profile.\n       </dd> \n       <dd>\n        3. Click on \n        <b>User Management</b> to add users.\n       </dd> \n       <dd>\n        4. Click on \n        <b>Code Management</b> to create or upload account codes from your accounting system.\n       </dd> \n       <dd>\n        5. Click on \n        <b>Vendor Management</b> to create or upload vendors from your accounting system.\n       </dd> \n      </dl> </td>\n     <td> </td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr> \n     <td> Once you\'ve completed these steps, you are ready to process your first invoice! Click on <b>Upload Invoice</b> to upload an invoice and begin the approval process. Or invite a vendor to the system using <b>Vendor Management</b> and let them upload invoices on their own </td> \n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr> \n     <td>Want some help? Email <span style="font-weight: bold"><a href="mailto:support@papertrl.com">support@papertrl.com</a></span> to schedule a free Get Started session with one of our team members or email us with questions anytime. </td> \n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr style="margin-top: 65px"> \n     <td> <span style="font-weight: bold">\n       <ul></ul>\n       <ul></ul>\n       <ul></ul>\n       <ul></ul>Thank You!</span> </td> \n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr style="margin-top: 65px"> \n     <td> <span>The PaperTrl Team</span> </td> \n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr> \n     <td>Questions? Contact us anytime at <span style="font-weight: bold"><a id="URL" href="">support@papertrl.com</a></span></td> \n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr> \n     <td> <img style="width: 170px;height: 45px;" src="https://papertrl.com/wp-content/uploads/2019/09/logo.png"> </td> \n    </tr> \n    <tr> \n     <td>This email is an automated notification, Replies to this message will not be read or responded to. We\'re happy to help you with any questions or concerns you may have. Please contact us directly 24/7 via <span style="font-weight: bold">support@papertrl.com</span> <p class="MsoNormal"><span style="font-size:8.0pt;color:#207580">CONFIDENTIALITY NOTICE: This e-mail transmission, and any attachments, is intended only for the use of PaperTrl Inc. or recipient named above and may contain information that is confidential, privileged and exempt from disclosure under applicable law. If you are not the intended recipient or authorized to receive this message for the recipient, you must not use, copy, disclose or take any action based on this message or any information herein. If you have received this message in error, please advise the sender immediately.</span><span style="font-size:8.0pt;color:#014708"></span></p> <p><span style="font-size:18.0pt;font-family:Webdings;color:green">P</span><span style="color:black"> </span><span style="font-size:10.0pt;font-family:&quot;Helvetica&quot;,sans-serif;color:green">Be Environmentally Responsible. Please don\'t print this e-mail unless you really need to.</span><u></u><u></u></p> </td> \n    </tr> \n    <tr> \n     <td></td> \n    </tr> \n    <tr> \n     <td></td> \n    </tr> \n   </tbody>\n  </table>   \n </body>\n</html>', 'indragupthaekanayaka@gmail.com', NULL, 'Y', 1, 'admin', '2020-05-12 08:00:12', NULL, NULL, NULL, NULL),
	(2, 'Log in to PaperTrl and get started!', '<!doctype html>\n<!--\nTo change this license header, choose License Headers in Project Properties.\nTo change this template file, choose Tools | Templates\nand open the template in the editor.\n-->\n<html>\n <head> \n  <meta charset="UTF-8"> \n  <meta name="viewport" content="width=device-width, initial-scale=1.0"> \n </head> \n <body> \n  <table style="color: #207580;"> \n   <tbody>\n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr> \n     <td style="font-weight: bold">Hi <span id="EMAIL_SEND_TO">avishka</span>,</td> \n    </tr> \n    <tr>\n     <td></td> \n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr> \n     <td>You are all set! Your PaperTrl User ID is <span style="font-weight: bold; font-style: italic;" id="USER_ID">admin</span></td> \n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr> \n     <td>\n      <ul></ul>\n      <ul></ul>Please <a id="PASSWORD_RESET_URL" href="https://qa-app153.papertrl.com:443/#/temporary-password-reset?usd=wyohu1LnkeU%3D&amp;tkn=EG4QtSEJRSfsQ%2B061ZpIpQ%3D%3D"> click here </a> here to reset your password then use the Task List below to get started. </td> \n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr> \n     <td> \n      <dl> \n       <dt>\n        Begin using PaperTrl in four easy steps:\n       </dt> \n       <dd>\n        1. Log in with the \n        <b>link</b> above.\n       </dd> \n       <dd>\n        2. Click on \n        <b>Settings</b> to complete your Company Profile.\n       </dd> \n       <dd>\n        3. Click on \n        <b>User Management</b> to add users.\n       </dd> \n       <dd>\n        4. Click on \n        <b>Code Management</b> to create or upload account codes from your accounting system.\n       </dd> \n      </dl> </td>\n     <td> </td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr> \n     <td> Once you\'ve completed these steps, you are ready to process your first invoice! Click on <b>Upload Invoice</b> to upload an invoice and begin the approval process. Or invite a vendor to the system using <b>Vendor Management</b> and let them upload invoices on their own </td> \n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr> \n     <td>Want some help? Email <span style="font-weight: bold"><a href="mailto:support@papertrl.com">support@papertrl.com</a></span> to schedule a free Get Started session with one of our team members or email us with questions anytime. </td> \n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr style="margin-top: 65px"> \n     <td> <span style="font-weight: bold">\n       <ul></ul>\n       <ul></ul>\n       <ul></ul>\n       <ul></ul>Thank You!</span> </td> \n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr style="margin-top: 65px"> \n     <td> <span>The PaperTrl Team</span> </td> \n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr> \n     <td>Questions? Contact us anytime at <span style="font-weight: bold"><a id="URL" href="">support@papertrl.com</a></span></td> \n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr> \n     <td> <img style="width: 170px;height: 45px;" src="https://papertrl.com/wp-content/uploads/2019/09/logo.png"> </td> \n    </tr> \n    <tr> \n     <td>This email is an automated notification, Replies to this message will not be read or responded to. We\'re happy to help you with any questions or concerns you may have. Please contact us directly 24/7 via <span style="font-weight: bold">support@papertrl.com</span> <p class="MsoNormal"><span style="font-size:8.0pt;color:#207580">CONFIDENTIALITY NOTICE: This e-mail transmission, and any attachments, is intended only for the use of PaperTrl Inc. or recipient named above and may contain information that is confidential, privileged and exempt from disclosure under applicable law. If you are not the intended recipient or authorized to receive this message for the recipient, you must not use, copy, disclose or take any action based on this message or any information herein. If you have received this message in error, please advise the sender immediately.</span><span style="font-size:8.0pt;color:#014708"></span></p> <p><span style="font-size:18.0pt;font-family:Webdings;color:green">P</span><span style="color:black"> </span><span style="font-size:10.0pt;font-family:&quot;Helvetica&quot;,sans-serif;color:green">Be Environmentally Responsible. Please don\'t print this e-mail unless you really need to.</span><u></u><u></u></p> </td> \n    </tr> \n    <tr> \n     <td></td> \n    </tr> \n    <tr> \n     <td></td> \n    </tr> \n   </tbody>\n  </table>   \n </body>\n</html>', 'carijiv438@1092df.com', NULL, 'Y', 1, 'admin', '2021-01-08 08:26:44', NULL, NULL, NULL, NULL),
	(3, 'New PaperTrl trial has been begun', '<html>\n <head> \n  <meta charset="UTF-8"> \n  <meta name="viewport" content="width=device-width, initial-scale=1.0"> \n </head> \n <body> \n  <table style="color: #207580;"> \n   <tbody>\n    <tr> \n     <td style="font-weight: bold">Dear customer support team,</td> \n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr style="margin-left: 250px"> \n     <td>New customer has been registered to a trial.</td> \n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr> \n     <td> \n      <table style="color: #207580;"> \n       <tbody>\n        <tr>\n         <td><span style="font-weight: bold">Full name</span></td>\n         <td>:</td>\n         <td><span id="PAREM_TRIAL_USER">avishka perera</span></td>\n        </tr> \n        <tr>\n         <td><span style="font-weight: bold">Email</span></td>\n         <td>:</td>\n         <td><span style="text-decoration: underline" id="PAREM_TRIAL_USER_EMAIL">carijiv438@1092df.com</span></td>\n        </tr> \n        <tr>\n         <td><span style="font-weight: bold">Company name</span></td>\n         <td>:</td>\n         <td><span id="PAREM_TRIAL_USER_COMPANY">20210108</span></td>\n        </tr> \n       </tbody>\n      </table> </td> \n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr style="margin-top: 65px"> \n     <td> <span style="font-weight: bold">Thank You!</span> </td> \n    </tr> \n    <tr> \n     <td> <img style="width: 170px;height: 45px;" src="https://papertrl.com/wp-content/uploads/2019/09/logo.png"> </td> \n    </tr> \n    <tr> \n     <td>This email is an automated notification, Replies to this message will not be read or responded to. We\'re happy to help you with any questions or concerns you may have. Please contact us directly 24/7 via <span style="font-weight: bold">support@papertrl.com</span> <p class="MsoNormal"><span style="font-size:8.0pt;color:#207580">CONFIDENTIALITY NOTICE: This e-mail transmission, and any attachments, is intended only for the use of PaperTrl Inc. or recipient named above and may contain information that is confidential, privileged and exempt from disclosure under applicable law. If you are not the intended recipient or authorized to receive this message for the recipient, you must not use, copy, disclose or take any action based on this message or any information herein. If you have received this message in error, please advise the sender immediately.</span><span style="font-size:8.0pt;color:#014708"></span></p> <p><span style="font-size:18.0pt;font-family:Webdings;color:green">P</span><span style="color:black"> </span><span style="font-size:10.0pt;font-family:&quot;Helvetica&quot;,sans-serif;color:green">Be Environmentally Responsible. Please don\'t print this e-mail unless you really need to.</span><u></u><u></u></p> </td> \n    </tr> \n   </tbody>\n  </table>  \n </body>\n</html>', 'avishka.p@papertrl.com', NULL, 'Y', 1, 'PAPERTRL_SYSTEM', '2021-01-08 08:26:44', NULL, NULL, NULL, NULL),
	(4, 'Account URL', '<!doctype html>\n<!--\nTo change this license header, choose License Headers in Project Properties.\nTo change this template file, choose Tools | Templates\nand open the template in the editor.\n-->\n<html>\n <head> \n  <meta charset="UTF-8"> \n  <meta name="viewport" content="width=device-width, initial-scale=1.0"> \n </head> \n <body> \n  <table style="color: #207580;"> \n   <tbody>\n    <tr> \n     <td>Dear <span style="font-weight: bold" id="EMAIL_SEND_TO">avishka perera</span>,</td> \n    </tr> \n    <tr> \n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr style="margin-left: 250px"> \n     <td>\n      <ul></ul>\n      <ul></ul>Your unique PaperTrl Account URL is <a id="PAPERTRL_URL" href="https://qa-app153.papertrl.com">https://qa-app153.papertrl.com</a> Please bookmark this page in your browser and save this email for future reference.</td> \n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr style="margin-top: 65px"> \n     <td> <span style="font-weight: bold">\n       <ul></ul>\n       <ul></ul>\n       <ul></ul>\n       <ul></ul>Thank You!</span> </td> \n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr style="margin-top: 65px"> \n     <td> <span>The PaperTrl Team</span> </td> \n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr> \n     <td>Questions? Contact us anytime at <span style="font-weight: bold"><a id="URL" href="mailto:support@papertrl.com">support@papertrl.com</a></span></td> \n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr> \n     <td> <img style="width: 170px;height: 45px;" src="https://papertrl.com/wp-content/uploads/2019/09/logo.png"> </td> \n    </tr> \n    <tr> \n     <td>This email is an automated notification, Replies to this message will not be read or responded to. We\'re happy to help you with any questions or concerns you may have. Please contact us directly 24/7 via <span style="font-weight: bold">support@papertrl.com</span> <p class="MsoNormal"><span style="font-size:8.0pt;color:#207580">CONFIDENTIALITY NOTICE: This e-mail transmission, and any attachments, is intended only for the use of PaperTrl Inc. or recipient named above and may contain information that is confidential, privileged and exempt from disclosure under applicable law. If you are not the intended recipient or authorized to receive this message for the recipient, you must not use, copy, disclose or take any action based on this message or any information herein. If you have received this message in error, please advise the sender immediately.</span><span style="font-size:8.0pt;color:#014708"></span></p> <p><span style="font-size:18.0pt;font-family:Webdings;color:green">P</span><span style="color:black"> </span><span style="font-size:10.0pt;font-family:&quot;Helvetica&quot;,sans-serif;color:green">Be Environmentally Responsible. Please don\'t print this e-mail unless you really need to.</span><u></u><u></u></p> </td> \n    </tr> \n    <tr> \n     <td></td> \n    </tr> \n    <tr> \n     <td></td> \n    </tr> \n   </tbody>\n  </table>  \n </body>\n</html>', 'carijiv438@1092df.com', NULL, 'Y', 1, 'PAPERTRL_SYSTEM', '2021-01-08 08:31:00', NULL, NULL, NULL, NULL),
	(5, 'Your PaperTrl account is ready to access', '<!doctype html>\n<!--\r\nTo change this license header, choose License Headers in Project Properties.\r\nTo change this template file, choose Tools | Templates\r\nand open the template in the editor.\r\n-->\n<html>\n <head> \n  <meta charset="UTF-8"> \n  <meta name="viewport" content="width=device-width, initial-scale=1.0"> \n </head> \n <body> \n  <table style="color: #207580;"> \n   <tbody>\n    <tr> \n     <td style="font-weight: bold">Dear <span id="EMAIL_SEND_TO">Anu Lakmali</span>,</td> \n    </tr> \n    <tr> \n     <td></td> \n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr style="margin-left: 250px"> \n     <td>\n      <ul></ul>\n      <ul></ul>Your PaperTrl user account has been successfully created.</td> \n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr> \n     <td>Your User ID is <span id="USER_ID">indragupthaekanayaka@gmail.com</span></td> \n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr> \n     <td>\n      <ul></ul>\n      <ul></ul>Please <a id="PASSWORD_RESET_URL" href="http://localhost:4200/#/temporary-password-reset?usd=qpUGQi3KHP%2Bm0%2BNYHKGyGjNtk2eYkWjd7%2FUUCE3zOqo%3D&amp;tkn=%242a%2410%24XOc.hFXvkmMqKVD2m6PC%2Fe1zTIkz5EhtLc7MF0ohTx82iR2qco5SO">click here </a> to reset your password and log into PaperTrl.</td> \n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr> \n     <td>If you have any comments or questions, please do not hesitate to contact us at <span style="font-weight: bold"><a href="mailto:support@papertrl.com">support@papertrl.com.</a></span></td> \n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr style="margin-top: 65px"> \n     <td> <span style="font-weight: bold">\n       <ul></ul>\n       <ul></ul>\n       <ul></ul>\n       <ul></ul>Thank You!</span> </td> \n    </tr> \n    <tr> \n     <td> <img style="width: 170px;height: 45px;" src="https://papertrl.com/wp-content/uploads/2019/09/logo.png"> </td> \n    </tr> \n    <tr> \n     <td>This email is an automated notification, Replies to this message will not be read or responded to. We\'re happy to help you with any questions or concerns you may have. Please contact us directly 24/7 via <span style="font-weight: bold">support@papertrl.com</span> <p class="MsoNormal"><span style="font-size:8.0pt;color:#207580">CONFIDENTIALITY NOTICE: This e-mail transmission, and any attachments, is intended only for the use of PaperTrl Inc. or recipient named above and may contain information that is confidential, privileged and exempt from disclosure under applicable law. If you are not the intended recipient or authorized to receive this message for the recipient, you must not use, copy, disclose or take any action based on this message or any information herein. If you have received this message in error, please advise the sender immediately.</span><span style="font-size:8.0pt;color:#014708"></span></p> <p><span style="font-size:18.0pt;font-family:Webdings;color:green">P</span><span style="color:black"> </span><span style="font-size:10.0pt;font-family:&quot;Helvetica&quot;,sans-serif;color:green">Be Environmentally Responsible. Please don\'t print this e-mail unless you really need to.</span><u></u><u></u></p> </td> \n    </tr> \n    <tr> \n     <td></td> \n    </tr> \n    <tr> \n     <td></td> \n    </tr> \n   </tbody>\n  </table>  \n </body>\n</html>', 'indragupthaekanayaka@gmail.com', NULL, 'Y', 1, 'admin', '2021-03-06 11:02:36', NULL, NULL, NULL, NULL),
	(6, 'Account URL', '<!doctype html>\n<!--\r\nTo change this license header, choose License Headers in Project Properties.\r\nTo change this template file, choose Tools | Templates\r\nand open the template in the editor.\r\n-->\n<html>\n <head> \n  <meta charset="UTF-8"> \n  <meta name="viewport" content="width=device-width, initial-scale=1.0"> \n </head> \n <body> \n  <table style="color: #207580;"> \n   <tbody>\n    <tr> \n     <td>Dear <span style="font-weight: bold" id="EMAIL_SEND_TO">Anu Lakmali</span>,</td> \n    </tr> \n    <tr> \n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr style="margin-left: 250px"> \n     <td>\n      <ul></ul>\n      <ul></ul>Your unique PaperTrl Account URL is <a id="PAPERTRL_URL" href="http://localhost:4200">http://localhost:4200</a> Please bookmark this page in your browser and save this email for future reference.</td> \n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr style="margin-top: 65px"> \n     <td> <span style="font-weight: bold">\n       <ul></ul>\n       <ul></ul>\n       <ul></ul>\n       <ul></ul>Thank You!</span> </td> \n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr style="margin-top: 65px"> \n     <td> <span>The PaperTrl Team</span> </td> \n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr> \n     <td>Questions? Contact us anytime at <span style="font-weight: bold"><a id="URL" href="mailto:support@papertrl.com">support@papertrl.com</a></span></td> \n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr> \n     <td> <img style="width: 170px;height: 45px;" src="https://papertrl.com/wp-content/uploads/2019/09/logo.png"> </td> \n    </tr> \n    <tr> \n     <td>This email is an automated notification, Replies to this message will not be read or responded to. We\'re happy to help you with any questions or concerns you may have. Please contact us directly 24/7 via <span style="font-weight: bold">support@papertrl.com</span> <p class="MsoNormal"><span style="font-size:8.0pt;color:#207580">CONFIDENTIALITY NOTICE: This e-mail transmission, and any attachments, is intended only for the use of PaperTrl Inc. or recipient named above and may contain information that is confidential, privileged and exempt from disclosure under applicable law. If you are not the intended recipient or authorized to receive this message for the recipient, you must not use, copy, disclose or take any action based on this message or any information herein. If you have received this message in error, please advise the sender immediately.</span><span style="font-size:8.0pt;color:#014708"></span></p> <p><span style="font-size:18.0pt;font-family:Webdings;color:green">P</span><span style="color:black"> </span><span style="font-size:10.0pt;font-family:&quot;Helvetica&quot;,sans-serif;color:green">Be Environmentally Responsible. Please don\'t print this e-mail unless you really need to.</span><u></u><u></u></p> </td> \n    </tr> \n    <tr> \n     <td></td> \n    </tr> \n    <tr> \n     <td></td> \n    </tr> \n   </tbody>\n  </table>  \n </body>\n</html>', 'indragupthaekanayaka@gmail.com', NULL, 'N', 10, 'PAPERTRL_SYSTEM', '2021-03-06 11:03:53', NULL, NULL, NULL, NULL),
	(8, 'A purchase order has submitted for approval', '<html>\n <head> \n  <meta charset="UTF-8"> \n  <meta name="viewport" content="width=device-width, initial-scale=1.0"> \n </head> \n <body> \n  <table style="color: #207580;"> \n   <tbody>\n    <tr> \n     <td style="font-weight: bold">Dear <span id="EMAIL_SEND_TO">Anu Lakmali</span>,</td> \n    </tr> \n    <tr> \n     <td></td> \n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr style="margin-left: 250px"> \n     <td>\n      <ul></ul>\n      <ul></ul>Purchase Order <span id="PO_NUMBER">PO0001</span> has been submitted by <span id="SUBMITTED_BY">avishka perera</span> for the approval of <span id="APPROVAL_GROUP">Project Manager</span> Approval Group. </td> \n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td>Please log in to <a id="URL" href="http://localhost:4200">PaperTrl</a> <span id="ACCOUNT_NAME"></span> to Approve or Reject the Purchase Order.</td> \n    </tr>\n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr> \n     <td>If you have any comments or questions, please do not hesitate to contact us at <span style="font-weight: bold"><a href="mailto:support@papertrl.com">support@papertrl.com.</a></span></td> \n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr style="margin-top: 65px"> \n     <td> <span style="font-weight: bold">\n       <ul></ul>\n       <ul></ul>\n       <ul></ul>\n       <ul></ul>Thank You!</span> </td> \n    </tr> \n    <tr> \n     <td> <img style="width: 170px;height: 45px;" src="https://papertrl.com/wp-content/uploads/2019/09/logo.png"> </td> \n    </tr> \n    <tr> \n     <td>This email is an automated notification, Replies to this message will not be read or responded to. We\'re happy to help you with any questions or concerns you may have. Please contact us directly 24/7 via <span style="font-weight: bold">support@papertrl.com</span> <p class="MsoNormal"><span style="font-size:8.0pt;color:#207580">CONFIDENTIALITY NOTICE: This e-mail transmission, and any attachments, is intended only for the use of PaperTrl Inc. or recipient named above and may contain information that is confidential, privileged and exempt from disclosure under applicable law. If you are not the intended recipient or authorized to receive this message for the recipient, you must not use, copy, disclose or take any action based on this message or any information herein. If you have received this message in error, please advise the sender immediately.</span><span style="font-size:8.0pt;color:#014708"></span></p> <p><span style="font-size:18.0pt;font-family:Webdings;color:green">P</span><span style="color:black"> </span><span style="font-size:10.0pt;font-family:&quot;Helvetica&quot;,sans-serif;color:green">Be Environmentally Responsible. Please don\'t print this e-mail unless you really need to.</span><u></u><u></u></p> </td> \n    </tr> \n   </tbody>\n  </table>  \n </body>\n</html>', 'indragupthaekanayaka@gmail.com', NULL, 'Y', 1, 'admin', '2021-03-06 12:39:25', NULL, NULL, NULL, NULL),
	(9, 'A purchase order has approved', '<html>\n <head> \n  <meta charset="UTF-8"> \n  <meta name="viewport" content="width=device-width, initial-scale=1.0"> \n </head> \n <body> \n  <table style="color: #207580;"> \n   <tbody>\n    <tr> \n     <td style="font-weight: bold">Dear <span id="EMAIL_SEND_TO">avishka perera</span>,</td> \n    </tr> \n    <tr> \n     <td></td> \n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr style="margin-left: 250px"> \n     <td>\n      <ul></ul>\n      <ul></ul>Purchase Order <span id="PO_NUMBER">PO0002</span> has been approved by <span id="APPROVER_NAME">avishka perera</span>. </td> \n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr> \n     <td>If you have any comments or questions, please do not hesitate to contact us at <span style="font-weight: bold"><a href="mailto:support@papertrl.com">support@papertrl.com.</a></span></td> \n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr style="margin-top: 65px"> \n     <td> <span style="font-weight: bold">\n       <ul></ul>\n       <ul></ul>\n       <ul></ul>\n       <ul></ul>Thank You!</span> </td> \n    </tr> \n    <tr> \n     <td> <img style="width: 170px;height: 45px;" src="https://papertrl.com/wp-content/uploads/2019/09/logo.png"> </td> \n    </tr> \n    <tr> \n     <td>This email is an automated notification, Replies to this message will not be read or responded to. We\'re happy to help you with any questions or concerns you may have. Please contact us directly 24/7 via <span style="font-weight: bold">support@papertrl.com</span> <p class="MsoNormal"><span style="font-size:8.0pt;color:#207580">CONFIDENTIALITY NOTICE: This e-mail transmission, and any attachments, is intended only for the use of PaperTrl Inc. or recipient named above and may contain information that is confidential, privileged and exempt from disclosure under applicable law. If you are not the intended recipient or authorized to receive this message for the recipient, you must not use, copy, disclose or take any action based on this message or any information herein. If you have received this message in error, please advise the sender immediately.</span><span style="font-size:8.0pt;color:#014708"></span></p> <p><span style="font-size:18.0pt;font-family:Webdings;color:green">P</span><span style="color:black"> </span><span style="font-size:10.0pt;font-family:&quot;Helvetica&quot;,sans-serif;color:green">Be Environmentally Responsible. Please don\'t print this e-mail unless you really need to.</span><u></u><u></u></p> </td> \n    </tr> \n   </tbody>\n  </table>  \n </body>\n</html>', 'carijiv438@1092df.com', NULL, 'Y', 1, 'admin', '2021-03-06 13:18:36', NULL, NULL, NULL, NULL),
	(10, 'A purchase order has submitted for approval', '<html>\n <head> \n  <meta charset="UTF-8"> \n  <meta name="viewport" content="width=device-width, initial-scale=1.0"> \n </head> \n <body> \n  <table style="color: #207580;"> \n   <tbody>\n    <tr> \n     <td style="font-weight: bold">Dear <span id="EMAIL_SEND_TO">Anu Lakmali</span>,</td> \n    </tr> \n    <tr> \n     <td></td> \n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr style="margin-left: 250px"> \n     <td>\n      <ul></ul>\n      <ul></ul>Purchase Order <span id="PO_NUMBER">PO0001</span> has been submitted by <span id="SUBMITTED_BY">avishka perera</span> for the approval of <span id="APPROVAL_GROUP">Project Manager</span> Approval Group. </td> \n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td>Please log in to <a id="URL" href="http://localhost:4200">PaperTrl</a> <span id="ACCOUNT_NAME"></span> to Approve or Reject the Purchase Order.</td> \n    </tr>\n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr> \n     <td>If you have any comments or questions, please do not hesitate to contact us at <span style="font-weight: bold"><a href="mailto:support@papertrl.com">support@papertrl.com.</a></span></td> \n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr style="margin-top: 65px"> \n     <td> <span style="font-weight: bold">\n       <ul></ul>\n       <ul></ul>\n       <ul></ul>\n       <ul></ul>Thank You!</span> </td> \n    </tr> \n    <tr> \n     <td> <img style="width: 170px;height: 45px;" src="https://papertrl.com/wp-content/uploads/2019/09/logo.png"> </td> \n    </tr> \n    <tr> \n     <td>This email is an automated notification, Replies to this message will not be read or responded to. We\'re happy to help you with any questions or concerns you may have. Please contact us directly 24/7 via <span style="font-weight: bold">support@papertrl.com</span> <p class="MsoNormal"><span style="font-size:8.0pt;color:#207580">CONFIDENTIALITY NOTICE: This e-mail transmission, and any attachments, is intended only for the use of PaperTrl Inc. or recipient named above and may contain information that is confidential, privileged and exempt from disclosure under applicable law. If you are not the intended recipient or authorized to receive this message for the recipient, you must not use, copy, disclose or take any action based on this message or any information herein. If you have received this message in error, please advise the sender immediately.</span><span style="font-size:8.0pt;color:#014708"></span></p> <p><span style="font-size:18.0pt;font-family:Webdings;color:green">P</span><span style="color:black"> </span><span style="font-size:10.0pt;font-family:&quot;Helvetica&quot;,sans-serif;color:green">Be Environmentally Responsible. Please don\'t print this e-mail unless you really need to.</span><u></u><u></u></p> </td> \n    </tr> \n   </tbody>\n  </table>  \n </body>\n</html>', 'indragupthaekanayaka@gmail.com', NULL, 'Y', 1, 'admin', '2021-03-06 13:38:13', NULL, NULL, NULL, NULL),
	(11, 'No users found in the approval group to approve', '<html>\n <head> \n  <meta charset="UTF-8"> \n  <meta name="viewport" content="width=device-width, initial-scale=1.0"> \n </head> \n <body> \n  <table style="color: #207580;"> \n   <tbody>\n    <tr> \n     <td style="font-weight: bold">Dear <span id="EMAIL_SEND_TO">avishka perera</span>,</td> \n    </tr> \n    <tr> \n     <td></td> \n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr style="margin-left: 250px"> \n     <td>\n      <ul></ul>\n      <ul></ul>Purchase Order <span id="INVOICE_NUMBER">001255</span> has been submitted by <span id="CREATED_BY">avishka perera</span> for the approval of <span id="APPROVAL_GROUP">Account Receivable</span> approval group, But there is no user found in this approval group. </td> \n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr> \n     <td>If you have any comments or questions, please do not hesitate to contact us at <span style="font-weight: bold"><a id="URL" href="http://localhost:4200">support@papertrl.com</a></span></td> \n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr style="margin-top: 65px"> \n     <td> <span style="font-weight: bold">\n       <ul></ul>\n       <ul></ul>\n       <ul></ul>\n       <ul></ul>Thank You!</span> </td> \n    </tr> \n    <tr> \n     <td> <img style="width: 170px;height: 45px;" src="https://papertrl.com/wp-content/uploads/2019/09/logo.png"> </td> \n    </tr> \n    <tr> \n     <td>This email is an automated notification, Replies to this message will not be read or responded to. We\'re happy to help you with any questions or concerns you may have. Please contact us directly 24/7 via <span style="font-weight: bold">support@papertrl.com</span> <p class="MsoNormal"><span style="font-size:8.0pt;color:#207580">CONFIDENTIALITY NOTICE: This e-mail transmission, and any attachments, is intended only for the use of PaperTrl Inc. or recipient named above and may contain information that is confidential, privileged and exempt from disclosure under applicable law. If you are not the intended recipient or authorized to receive this message for the recipient, you must not use, copy, disclose or take any action based on this message or any information herein. If you have received this message in error, please advise the sender immediately.</span><span style="font-size:8.0pt;color:#014708"></span></p> <p><span style="font-size:18.0pt;font-family:Webdings;color:green">P</span><span style="color:black"> </span><span style="font-size:10.0pt;font-family:&quot;Helvetica&quot;,sans-serif;color:green">Be Environmentally Responsible. Please don\'t print this e-mail unless you really need to.</span><u></u><u></u></p> </td> \n    </tr> \n   </tbody>\n  </table>  \n </body>\n</html>', 'carijiv438@1092df.com', NULL, 'Y', 1, 'admin', '2021-03-06 13:50:33', NULL, NULL, NULL, NULL),
	(12, 'No users found in the approval group to approve', '<html>\n <head> \n  <meta charset="UTF-8"> \n  <meta name="viewport" content="width=device-width, initial-scale=1.0"> \n </head> \n <body> \n  <table style="color: #207580;"> \n   <tbody>\n    <tr> \n     <td style="font-weight: bold">Dear <span id="EMAIL_SEND_TO">avishka perera</span>,</td> \n    </tr> \n    <tr> \n     <td></td> \n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr style="margin-left: 250px"> \n     <td>\n      <ul></ul>\n      <ul></ul>Purchase Order <span id="INVOICE_NUMBER">001255</span> has been submitted by <span id="CREATED_BY">avishka perera</span> for the approval of <span id="APPROVAL_GROUP">Account Receivable</span> approval group, But there is no user found in this approval group. </td> \n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr> \n     <td>If you have any comments or questions, please do not hesitate to contact us at <span style="font-weight: bold"><a id="URL" href="http://localhost:4200">support@papertrl.com</a></span></td> \n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr style="margin-top: 65px"> \n     <td> <span style="font-weight: bold">\n       <ul></ul>\n       <ul></ul>\n       <ul></ul>\n       <ul></ul>Thank You!</span> </td> \n    </tr> \n    <tr> \n     <td> <img style="width: 170px;height: 45px;" src="https://papertrl.com/wp-content/uploads/2019/09/logo.png"> </td> \n    </tr> \n    <tr> \n     <td>This email is an automated notification, Replies to this message will not be read or responded to. We\'re happy to help you with any questions or concerns you may have. Please contact us directly 24/7 via <span style="font-weight: bold">support@papertrl.com</span> <p class="MsoNormal"><span style="font-size:8.0pt;color:#207580">CONFIDENTIALITY NOTICE: This e-mail transmission, and any attachments, is intended only for the use of PaperTrl Inc. or recipient named above and may contain information that is confidential, privileged and exempt from disclosure under applicable law. If you are not the intended recipient or authorized to receive this message for the recipient, you must not use, copy, disclose or take any action based on this message or any information herein. If you have received this message in error, please advise the sender immediately.</span><span style="font-size:8.0pt;color:#014708"></span></p> <p><span style="font-size:18.0pt;font-family:Webdings;color:green">P</span><span style="color:black"> </span><span style="font-size:10.0pt;font-family:&quot;Helvetica&quot;,sans-serif;color:green">Be Environmentally Responsible. Please don\'t print this e-mail unless you really need to.</span><u></u><u></u></p> </td> \n    </tr> \n   </tbody>\n  </table>  \n </body>\n</html>', 'carijiv438@1092df.com', NULL, 'Y', 1, 'admin', '2021-03-06 14:04:13', NULL, NULL, NULL, NULL),
	(13, 'No users found in the approval group to approve', '<html>\n <head> \n  <meta charset="UTF-8"> \n  <meta name="viewport" content="width=device-width, initial-scale=1.0"> \n </head> \n <body> \n  <table style="color: #207580;"> \n   <tbody>\n    <tr> \n     <td style="font-weight: bold">Dear <span id="EMAIL_SEND_TO">avishka perera</span>,</td> \n    </tr> \n    <tr> \n     <td></td> \n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr style="margin-left: 250px"> \n     <td>\n      <ul></ul>\n      <ul></ul>Purchase Order <span id="INVOICE_NUMBER">001255</span> has been submitted by <span id="CREATED_BY">avishka perera</span> for the approval of <span id="APPROVAL_GROUP">Account Receivable</span> approval group, But there is no user found in this approval group. </td> \n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr> \n     <td>If you have any comments or questions, please do not hesitate to contact us at <span style="font-weight: bold"><a id="URL" href="http://localhost:4200">support@papertrl.com</a></span></td> \n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr style="margin-top: 65px"> \n     <td> <span style="font-weight: bold">\n       <ul></ul>\n       <ul></ul>\n       <ul></ul>\n       <ul></ul>Thank You!</span> </td> \n    </tr> \n    <tr> \n     <td> <img style="width: 170px;height: 45px;" src="https://papertrl.com/wp-content/uploads/2019/09/logo.png"> </td> \n    </tr> \n    <tr> \n     <td>This email is an automated notification, Replies to this message will not be read or responded to. We\'re happy to help you with any questions or concerns you may have. Please contact us directly 24/7 via <span style="font-weight: bold">support@papertrl.com</span> <p class="MsoNormal"><span style="font-size:8.0pt;color:#207580">CONFIDENTIALITY NOTICE: This e-mail transmission, and any attachments, is intended only for the use of PaperTrl Inc. or recipient named above and may contain information that is confidential, privileged and exempt from disclosure under applicable law. If you are not the intended recipient or authorized to receive this message for the recipient, you must not use, copy, disclose or take any action based on this message or any information herein. If you have received this message in error, please advise the sender immediately.</span><span style="font-size:8.0pt;color:#014708"></span></p> <p><span style="font-size:18.0pt;font-family:Webdings;color:green">P</span><span style="color:black"> </span><span style="font-size:10.0pt;font-family:&quot;Helvetica&quot;,sans-serif;color:green">Be Environmentally Responsible. Please don\'t print this e-mail unless you really need to.</span><u></u><u></u></p> </td> \n    </tr> \n   </tbody>\n  </table>  \n </body>\n</html>', 'carijiv438@1092df.com', NULL, 'Y', 1, 'admin', '2021-03-06 14:10:53', NULL, NULL, NULL, NULL),
	(14, 'No users found in the approval group to approve', '<html>\n <head> \n  <meta charset="UTF-8"> \n  <meta name="viewport" content="width=device-width, initial-scale=1.0"> \n </head> \n <body> \n  <table style="color: #207580;"> \n   <tbody>\n    <tr> \n     <td style="font-weight: bold">Dear <span id="EMAIL_SEND_TO">avishka perera</span>,</td> \n    </tr> \n    <tr> \n     <td></td> \n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr style="margin-left: 250px"> \n     <td>\n      <ul></ul>\n      <ul></ul>Purchase Order <span id="INVOICE_NUMBER">001255</span> has been submitted by <span id="CREATED_BY">avishka perera</span> for the approval of <span id="APPROVAL_GROUP">Account Receivable</span> approval group, But there is no user found in this approval group. </td> \n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr> \n     <td>If you have any comments or questions, please do not hesitate to contact us at <span style="font-weight: bold"><a id="URL" href="http://localhost:4200">support@papertrl.com</a></span></td> \n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr style="margin-top: 65px"> \n     <td> <span style="font-weight: bold">\n       <ul></ul>\n       <ul></ul>\n       <ul></ul>\n       <ul></ul>Thank You!</span> </td> \n    </tr> \n    <tr> \n     <td> <img style="width: 170px;height: 45px;" src="https://papertrl.com/wp-content/uploads/2019/09/logo.png"> </td> \n    </tr> \n    <tr> \n     <td>This email is an automated notification, Replies to this message will not be read or responded to. We\'re happy to help you with any questions or concerns you may have. Please contact us directly 24/7 via <span style="font-weight: bold">support@papertrl.com</span> <p class="MsoNormal"><span style="font-size:8.0pt;color:#207580">CONFIDENTIALITY NOTICE: This e-mail transmission, and any attachments, is intended only for the use of PaperTrl Inc. or recipient named above and may contain information that is confidential, privileged and exempt from disclosure under applicable law. If you are not the intended recipient or authorized to receive this message for the recipient, you must not use, copy, disclose or take any action based on this message or any information herein. If you have received this message in error, please advise the sender immediately.</span><span style="font-size:8.0pt;color:#014708"></span></p> <p><span style="font-size:18.0pt;font-family:Webdings;color:green">P</span><span style="color:black"> </span><span style="font-size:10.0pt;font-family:&quot;Helvetica&quot;,sans-serif;color:green">Be Environmentally Responsible. Please don\'t print this e-mail unless you really need to.</span><u></u><u></u></p> </td> \n    </tr> \n   </tbody>\n  </table>  \n </body>\n</html>', 'carijiv438@1092df.com', NULL, 'Y', 1, 'admin', '2021-03-06 14:13:50', NULL, NULL, NULL, NULL),
	(15, 'No users found in the approval group to approve', '<html>\n <head> \n  <meta charset="UTF-8"> \n  <meta name="viewport" content="width=device-width, initial-scale=1.0"> \n </head> \n <body> \n  <table style="color: #207580;"> \n   <tbody>\n    <tr> \n     <td style="font-weight: bold">Dear <span id="EMAIL_SEND_TO">avishka perera</span>,</td> \n    </tr> \n    <tr> \n     <td></td> \n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr style="margin-left: 250px"> \n     <td>\n      <ul></ul>\n      <ul></ul>Purchase Order <span id="INVOICE_NUMBER">001255</span> has been submitted by <span id="CREATED_BY">avishka perera</span> for the approval of <span id="APPROVAL_GROUP">Account Receivable</span> approval group, But there is no user found in this approval group. </td> \n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr> \n     <td>If you have any comments or questions, please do not hesitate to contact us at <span style="font-weight: bold"><a id="URL" href="http://localhost:4200">support@papertrl.com</a></span></td> \n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr style="margin-top: 65px"> \n     <td> <span style="font-weight: bold">\n       <ul></ul>\n       <ul></ul>\n       <ul></ul>\n       <ul></ul>Thank You!</span> </td> \n    </tr> \n    <tr> \n     <td> <img style="width: 170px;height: 45px;" src="https://papertrl.com/wp-content/uploads/2019/09/logo.png"> </td> \n    </tr> \n    <tr> \n     <td>This email is an automated notification, Replies to this message will not be read or responded to. We\'re happy to help you with any questions or concerns you may have. Please contact us directly 24/7 via <span style="font-weight: bold">support@papertrl.com</span> <p class="MsoNormal"><span style="font-size:8.0pt;color:#207580">CONFIDENTIALITY NOTICE: This e-mail transmission, and any attachments, is intended only for the use of PaperTrl Inc. or recipient named above and may contain information that is confidential, privileged and exempt from disclosure under applicable law. If you are not the intended recipient or authorized to receive this message for the recipient, you must not use, copy, disclose or take any action based on this message or any information herein. If you have received this message in error, please advise the sender immediately.</span><span style="font-size:8.0pt;color:#014708"></span></p> <p><span style="font-size:18.0pt;font-family:Webdings;color:green">P</span><span style="color:black"> </span><span style="font-size:10.0pt;font-family:&quot;Helvetica&quot;,sans-serif;color:green">Be Environmentally Responsible. Please don\'t print this e-mail unless you really need to.</span><u></u><u></u></p> </td> \n    </tr> \n   </tbody>\n  </table>  \n </body>\n</html>', 'carijiv438@1092df.com', NULL, 'Y', 1, 'admin', '2021-03-06 14:17:41', NULL, NULL, NULL, NULL),
	(16, 'A purchase order has submitted for approval', '<html>\n <head> \n  <meta charset="UTF-8"> \n  <meta name="viewport" content="width=device-width, initial-scale=1.0"> \n </head> \n <body> \n  <table style="color: #207580;"> \n   <tbody>\n    <tr> \n     <td style="font-weight: bold">Dear <span id="EMAIL_SEND_TO">Anu Lakmali</span>,</td> \n    </tr> \n    <tr> \n     <td></td> \n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr style="margin-left: 250px"> \n     <td>\n      <ul></ul>\n      <ul></ul>Purchase Order <span id="PO_NUMBER">PO0003</span> has been submitted by <span id="SUBMITTED_BY">avishka perera</span> for the approval of <span id="APPROVAL_GROUP">Project Manager</span> Approval Group. </td> \n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td>Please log in to <a id="URL" href="http://localhost:4200">PaperTrl</a> <span id="ACCOUNT_NAME"></span> to Approve or Reject the Purchase Order.</td> \n    </tr>\n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr> \n     <td>If you have any comments or questions, please do not hesitate to contact us at <span style="font-weight: bold"><a href="mailto:support@papertrl.com">support@papertrl.com.</a></span></td> \n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr style="margin-top: 65px"> \n     <td> <span style="font-weight: bold">\n       <ul></ul>\n       <ul></ul>\n       <ul></ul>\n       <ul></ul>Thank You!</span> </td> \n    </tr> \n    <tr> \n     <td> <img style="width: 170px;height: 45px;" src="https://papertrl.com/wp-content/uploads/2019/09/logo.png"> </td> \n    </tr> \n    <tr> \n     <td>This email is an automated notification, Replies to this message will not be read or responded to. We\'re happy to help you with any questions or concerns you may have. Please contact us directly 24/7 via <span style="font-weight: bold">support@papertrl.com</span> <p class="MsoNormal"><span style="font-size:8.0pt;color:#207580">CONFIDENTIALITY NOTICE: This e-mail transmission, and any attachments, is intended only for the use of PaperTrl Inc. or recipient named above and may contain information that is confidential, privileged and exempt from disclosure under applicable law. If you are not the intended recipient or authorized to receive this message for the recipient, you must not use, copy, disclose or take any action based on this message or any information herein. If you have received this message in error, please advise the sender immediately.</span><span style="font-size:8.0pt;color:#014708"></span></p> <p><span style="font-size:18.0pt;font-family:Webdings;color:green">P</span><span style="color:black"> </span><span style="font-size:10.0pt;font-family:&quot;Helvetica&quot;,sans-serif;color:green">Be Environmentally Responsible. Please don\'t print this e-mail unless you really need to.</span><u></u><u></u></p> </td> \n    </tr> \n   </tbody>\n  </table>  \n </body>\n</html>', 'indragupthaekanayaka@gmail.com', NULL, 'Y', 1, 'admin', '2021-03-06 14:20:20', NULL, NULL, NULL, NULL),
	(17, 'No users found in the approval group to approve', '<html>\n <head> \n  <meta charset="UTF-8"> \n  <meta name="viewport" content="width=device-width, initial-scale=1.0"> \n </head> \n <body> \n  <table style="color: #207580;"> \n   <tbody>\n    <tr> \n     <td style="font-weight: bold">Dear <span id="EMAIL_SEND_TO">avishka perera</span>,</td> \n    </tr> \n    <tr> \n     <td></td> \n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr style="margin-left: 250px"> \n     <td>\n      <ul></ul>\n      <ul></ul>Purchase Order <span id="INVOICE_NUMBER">001255</span> has been submitted by <span id="CREATED_BY">avishka perera</span> for the approval of <span id="APPROVAL_GROUP">Account Receivable</span> approval group, But there is no user found in this approval group. </td> \n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr> \n     <td>If you have any comments or questions, please do not hesitate to contact us at <span style="font-weight: bold"><a id="URL" href="http://localhost:4200">support@papertrl.com</a></span></td> \n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr style="margin-top: 65px"> \n     <td> <span style="font-weight: bold">\n       <ul></ul>\n       <ul></ul>\n       <ul></ul>\n       <ul></ul>Thank You!</span> </td> \n    </tr> \n    <tr> \n     <td> <img style="width: 170px;height: 45px;" src="https://papertrl.com/wp-content/uploads/2019/09/logo.png"> </td> \n    </tr> \n    <tr> \n     <td>This email is an automated notification, Replies to this message will not be read or responded to. We\'re happy to help you with any questions or concerns you may have. Please contact us directly 24/7 via <span style="font-weight: bold">support@papertrl.com</span> <p class="MsoNormal"><span style="font-size:8.0pt;color:#207580">CONFIDENTIALITY NOTICE: This e-mail transmission, and any attachments, is intended only for the use of PaperTrl Inc. or recipient named above and may contain information that is confidential, privileged and exempt from disclosure under applicable law. If you are not the intended recipient or authorized to receive this message for the recipient, you must not use, copy, disclose or take any action based on this message or any information herein. If you have received this message in error, please advise the sender immediately.</span><span style="font-size:8.0pt;color:#014708"></span></p> <p><span style="font-size:18.0pt;font-family:Webdings;color:green">P</span><span style="color:black"> </span><span style="font-size:10.0pt;font-family:&quot;Helvetica&quot;,sans-serif;color:green">Be Environmentally Responsible. Please don\'t print this e-mail unless you really need to.</span><u></u><u></u></p> </td> \n    </tr> \n   </tbody>\n  </table>  \n </body>\n</html>', 'carijiv438@1092df.com', NULL, 'Y', 1, 'admin', '2021-03-06 14:21:10', NULL, NULL, NULL, NULL),
	(18, 'A purchase order has submitted for your approval', '<html>\n <head> \n  <meta charset="UTF-8"> \n  <meta name="viewport" content="width=device-width, initial-scale=1.0"> \n </head> \n <body> \n  <table style="color: #207580;"> \n   <tbody>\n    <tr> \n     <td style="font-weight: bold">Dear <span id="EMAIL_SEND_TO">Anu Lakmali</span>,</td> \n    </tr> \n    <tr> \n     <td></td> \n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr style="margin-left: 250px"> \n     <td>\n      <ul></ul>\n      <ul></ul>Purchase Order <span id="PO_NUMBER">PO0003</span> has been submitted by <span id="SUBMITTED_BY">avishka perera</span> for your approval. </td> \n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td>Please log in to <a id="URL" href="http://localhost:4200">PaperTrl</a> <span id="ACCOUNT_NAME"></span> to Approve or Reject the Purchase Order.</td> \n    </tr>\n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr> \n     <td>If you have any comments or questions, please do not hesitate to contact us at <span style="font-weight: bold"><a href="mailto:support@papertrl.com">support@papertrl.com.</a></span></td> \n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr style="margin-top: 65px"> \n     <td> <span style="font-weight: bold">\n       <ul></ul>\n       <ul></ul>\n       <ul></ul>\n       <ul></ul>Thank You!</span> </td> \n    </tr> \n    <tr> \n     <td> <img style="width: 170px;height: 45px;" src="https://papertrl.com/wp-content/uploads/2019/09/logo.png"> </td> \n    </tr> \n    <tr> \n     <td>This email is an automated notification, Replies to this message will not be read or responded to. We\'re happy to help you with any questions or concerns you may have. Please contact us directly 24/7 via <span style="font-weight: bold">support@papertrl.com</span> <p class="MsoNormal"><span style="font-size:8.0pt;color:#207580">CONFIDENTIALITY NOTICE: This e-mail transmission, and any attachments, is intended only for the use of PaperTrl Inc. or recipient named above and may contain information that is confidential, privileged and exempt from disclosure under applicable law. If you are not the intended recipient or authorized to receive this message for the recipient, you must not use, copy, disclose or take any action based on this message or any information herein. If you have received this message in error, please advise the sender immediately.</span><span style="font-size:8.0pt;color:#014708"></span></p> <p><span style="font-size:18.0pt;font-family:Webdings;color:green">P</span><span style="color:black"> </span><span style="font-size:10.0pt;font-family:&quot;Helvetica&quot;,sans-serif;color:green">Be Environmentally Responsible. Please don\'t print this e-mail unless you really need to.</span><u></u><u></u></p> </td> \n    </tr> \n   </tbody>\n  </table>  \n </body>\n</html>', 'indragupthaekanayaka@gmail.com', NULL, 'N', 10, 'admin', '2021-03-06 14:21:34', NULL, NULL, NULL, NULL),
	(19, 'A purchase order has submitted for your approval', '<html>\n <head> \n  <meta charset="UTF-8"> \n  <meta name="viewport" content="width=device-width, initial-scale=1.0"> \n </head> \n <body> \n  <table style="color: #207580;"> \n   <tbody>\n    <tr> \n     <td style="font-weight: bold">Dear <span id="EMAIL_SEND_TO">Anu Lakmali</span>,</td> \n    </tr> \n    <tr> \n     <td></td> \n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr style="margin-left: 250px"> \n     <td>\n      <ul></ul>\n      <ul></ul>Purchase Order <span id="PO_NUMBER">PO0004</span> has been submitted by <span id="SUBMITTED_BY">avishka perera</span> for your approval. </td> \n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td>Please log in to <a id="URL" href="http://localhost:4200">PaperTrl</a> <span id="ACCOUNT_NAME"></span> to Approve or Reject the Purchase Order.</td> \n    </tr>\n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr> \n     <td>If you have any comments or questions, please do not hesitate to contact us at <span style="font-weight: bold"><a href="mailto:support@papertrl.com">support@papertrl.com.</a></span></td> \n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr style="margin-top: 65px"> \n     <td> <span style="font-weight: bold">\n       <ul></ul>\n       <ul></ul>\n       <ul></ul>\n       <ul></ul>Thank You!</span> </td> \n    </tr> \n    <tr> \n     <td> <img style="width: 170px;height: 45px;" src="https://papertrl.com/wp-content/uploads/2019/09/logo.png"> </td> \n    </tr> \n    <tr> \n     <td>This email is an automated notification, Replies to this message will not be read or responded to. We\'re happy to help you with any questions or concerns you may have. Please contact us directly 24/7 via <span style="font-weight: bold">support@papertrl.com</span> <p class="MsoNormal"><span style="font-size:8.0pt;color:#207580">CONFIDENTIALITY NOTICE: This e-mail transmission, and any attachments, is intended only for the use of PaperTrl Inc. or recipient named above and may contain information that is confidential, privileged and exempt from disclosure under applicable law. If you are not the intended recipient or authorized to receive this message for the recipient, you must not use, copy, disclose or take any action based on this message or any information herein. If you have received this message in error, please advise the sender immediately.</span><span style="font-size:8.0pt;color:#014708"></span></p> <p><span style="font-size:18.0pt;font-family:Webdings;color:green">P</span><span style="color:black"> </span><span style="font-size:10.0pt;font-family:&quot;Helvetica&quot;,sans-serif;color:green">Be Environmentally Responsible. Please don\'t print this e-mail unless you really need to.</span><u></u><u></u></p> </td> \n    </tr> \n   </tbody>\n  </table>  \n </body>\n</html>', 'indragupthaekanayaka@gmail.com', NULL, 'N', 10, 'admin', '2021-03-06 14:29:44', NULL, NULL, NULL, NULL),
	(20, 'A purchase order has submitted for approval', '<html>\n <head> \n  <meta charset="UTF-8"> \n  <meta name="viewport" content="width=device-width, initial-scale=1.0"> \n </head> \n <body> \n  <table style="color: #207580;"> \n   <tbody>\n    <tr> \n     <td style="font-weight: bold">Dear <span id="EMAIL_SEND_TO">Anu Lakmali</span>,</td> \n    </tr> \n    <tr> \n     <td></td> \n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr style="margin-left: 250px"> \n     <td>\n      <ul></ul>\n      <ul></ul>Purchase Order <span id="PO_NUMBER">PO0004</span> has been submitted by <span id="SUBMITTED_BY">avishka perera</span> for the approval of <span id="APPROVAL_GROUP">Project Manager</span> Approval Group. </td> \n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td>Please log in to <a id="URL" href="http://localhost:4200">PaperTrl</a> <span id="ACCOUNT_NAME"></span> to Approve or Reject the Purchase Order.</td> \n    </tr>\n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr> \n     <td>If you have any comments or questions, please do not hesitate to contact us at <span style="font-weight: bold"><a href="mailto:support@papertrl.com">support@papertrl.com.</a></span></td> \n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr style="margin-top: 65px"> \n     <td> <span style="font-weight: bold">\n       <ul></ul>\n       <ul></ul>\n       <ul></ul>\n       <ul></ul>Thank You!</span> </td> \n    </tr> \n    <tr> \n     <td> <img style="width: 170px;height: 45px;" src="https://papertrl.com/wp-content/uploads/2019/09/logo.png"> </td> \n    </tr> \n    <tr> \n     <td>This email is an automated notification, Replies to this message will not be read or responded to. We\'re happy to help you with any questions or concerns you may have. Please contact us directly 24/7 via <span style="font-weight: bold">support@papertrl.com</span> <p class="MsoNormal"><span style="font-size:8.0pt;color:#207580">CONFIDENTIALITY NOTICE: This e-mail transmission, and any attachments, is intended only for the use of PaperTrl Inc. or recipient named above and may contain information that is confidential, privileged and exempt from disclosure under applicable law. If you are not the intended recipient or authorized to receive this message for the recipient, you must not use, copy, disclose or take any action based on this message or any information herein. If you have received this message in error, please advise the sender immediately.</span><span style="font-size:8.0pt;color:#014708"></span></p> <p><span style="font-size:18.0pt;font-family:Webdings;color:green">P</span><span style="color:black"> </span><span style="font-size:10.0pt;font-family:&quot;Helvetica&quot;,sans-serif;color:green">Be Environmentally Responsible. Please don\'t print this e-mail unless you really need to.</span><u></u><u></u></p> </td> \n    </tr> \n   </tbody>\n  </table>  \n </body>\n</html>', 'indragupthaekanayaka@gmail.com', NULL, 'Y', 1, 'admin', '2021-03-06 14:29:44', NULL, NULL, NULL, NULL),
	(21, 'A purchase order has submitted for approval', '<html>\n <head> \n  <meta charset="UTF-8"> \n  <meta name="viewport" content="width=device-width, initial-scale=1.0"> \n </head> \n <body> \n  <table style="color: #207580;"> \n   <tbody>\n    <tr> \n     <td style="font-weight: bold">Dear <span id="EMAIL_SEND_TO">Anu Lakmali</span>,</td> \n    </tr> \n    <tr> \n     <td></td> \n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr style="margin-left: 250px"> \n     <td>\n      <ul></ul>\n      <ul></ul>Purchase Order <span id="PO_NUMBER">PO0005</span> has been submitted by <span id="SUBMITTED_BY">avishka perera</span> for the approval of <span id="APPROVAL_GROUP">Project Manager</span> Approval Group. </td> \n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td>Please log in to <a id="URL" href="http://localhost:4200">PaperTrl</a> <span id="ACCOUNT_NAME"></span> to Approve or Reject the Purchase Order.</td> \n    </tr>\n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr> \n     <td>If you have any comments or questions, please do not hesitate to contact us at <span style="font-weight: bold"><a href="mailto:support@papertrl.com">support@papertrl.com.</a></span></td> \n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr style="margin-top: 65px"> \n     <td> <span style="font-weight: bold">\n       <ul></ul>\n       <ul></ul>\n       <ul></ul>\n       <ul></ul>Thank You!</span> </td> \n    </tr> \n    <tr> \n     <td> <img style="width: 170px;height: 45px;" src="https://papertrl.com/wp-content/uploads/2019/09/logo.png"> </td> \n    </tr> \n    <tr> \n     <td>This email is an automated notification, Replies to this message will not be read or responded to. We\'re happy to help you with any questions or concerns you may have. Please contact us directly 24/7 via <span style="font-weight: bold">support@papertrl.com</span> <p class="MsoNormal"><span style="font-size:8.0pt;color:#207580">CONFIDENTIALITY NOTICE: This e-mail transmission, and any attachments, is intended only for the use of PaperTrl Inc. or recipient named above and may contain information that is confidential, privileged and exempt from disclosure under applicable law. If you are not the intended recipient or authorized to receive this message for the recipient, you must not use, copy, disclose or take any action based on this message or any information herein. If you have received this message in error, please advise the sender immediately.</span><span style="font-size:8.0pt;color:#014708"></span></p> <p><span style="font-size:18.0pt;font-family:Webdings;color:green">P</span><span style="color:black"> </span><span style="font-size:10.0pt;font-family:&quot;Helvetica&quot;,sans-serif;color:green">Be Environmentally Responsible. Please don\'t print this e-mail unless you really need to.</span><u></u><u></u></p> </td> \n    </tr> \n   </tbody>\n  </table>  \n </body>\n</html>', 'indragupthaekanayaka@gmail.com', NULL, 'Y', 1, 'admin', '2021-03-06 14:44:33', NULL, NULL, NULL, NULL),
	(22, 'A purchase order has submitted for approval', '<html>\n <head> \n  <meta charset="UTF-8"> \n  <meta name="viewport" content="width=device-width, initial-scale=1.0"> \n </head> \n <body> \n  <table style="color: #207580;"> \n   <tbody>\n    <tr> \n     <td style="font-weight: bold">Dear <span id="EMAIL_SEND_TO">Anu Lakmali</span>,</td> \n    </tr> \n    <tr> \n     <td></td> \n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr style="margin-left: 250px"> \n     <td>\n      <ul></ul>\n      <ul></ul>Purchase Order <span id="PO_NUMBER">PO0006</span> has been submitted by <span id="SUBMITTED_BY">avishka perera</span> for the approval of <span id="APPROVAL_GROUP">Project Manager</span> Approval Group. </td> \n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td>Please log in to <a id="URL" href="http://localhost:4200">PaperTrl</a> <span id="ACCOUNT_NAME"></span> to Approve or Reject the Purchase Order.</td> \n    </tr>\n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr> \n     <td>If you have any comments or questions, please do not hesitate to contact us at <span style="font-weight: bold"><a href="mailto:support@papertrl.com">support@papertrl.com.</a></span></td> \n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr style="margin-top: 65px"> \n     <td> <span style="font-weight: bold">\n       <ul></ul>\n       <ul></ul>\n       <ul></ul>\n       <ul></ul>Thank You!</span> </td> \n    </tr> \n    <tr> \n     <td> <img style="width: 170px;height: 45px;" src="https://papertrl.com/wp-content/uploads/2019/09/logo.png"> </td> \n    </tr> \n    <tr> \n     <td>This email is an automated notification, Replies to this message will not be read or responded to. We\'re happy to help you with any questions or concerns you may have. Please contact us directly 24/7 via <span style="font-weight: bold">support@papertrl.com</span> <p class="MsoNormal"><span style="font-size:8.0pt;color:#207580">CONFIDENTIALITY NOTICE: This e-mail transmission, and any attachments, is intended only for the use of PaperTrl Inc. or recipient named above and may contain information that is confidential, privileged and exempt from disclosure under applicable law. If you are not the intended recipient or authorized to receive this message for the recipient, you must not use, copy, disclose or take any action based on this message or any information herein. If you have received this message in error, please advise the sender immediately.</span><span style="font-size:8.0pt;color:#014708"></span></p> <p><span style="font-size:18.0pt;font-family:Webdings;color:green">P</span><span style="color:black"> </span><span style="font-size:10.0pt;font-family:&quot;Helvetica&quot;,sans-serif;color:green">Be Environmentally Responsible. Please don\'t print this e-mail unless you really need to.</span><u></u><u></u></p> </td> \n    </tr> \n   </tbody>\n  </table>  \n </body>\n</html>', 'indragupthaekanayaka@gmail.com', NULL, 'Y', 1, 'admin', '2021-03-06 14:48:37', NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `common_email_mst` ENABLE KEYS */;

DROP TABLE IF EXISTS `common_email_privilege`;
CREATE TABLE IF NOT EXISTS `common_email_privilege` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_privilage_id` int(11) DEFAULT NULL,
  `email_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

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

/*!40000 ALTER TABLE `common_email_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_email_tmp` ENABLE KEYS */;

DROP TABLE IF EXISTS `common_email_type`;
CREATE TABLE IF NOT EXISTS `common_email_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email_service` varchar(255) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

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

/*!40000 ALTER TABLE `common_employee` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_employee` ENABLE KEYS */;

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

/*!40000 ALTER TABLE `common_employee_import_issue` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_employee_import_issue` ENABLE KEYS */;

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

/*!40000 ALTER TABLE `common_employee_import_mst` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_employee_import_mst` ENABLE KEYS */;

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
  PRIMARY KEY (`id`),
  KEY `TABLE_FK_2` (`grid_id`),
  CONSTRAINT `TABLE_FK_2` FOREIGN KEY (`grid_id`) REFERENCES `common_grid_template` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=117 DEFAULT CHARSET=utf8;

/*!40000 ALTER TABLE `common_grid_column_template` DISABLE KEYS */;
INSERT INTO `common_grid_column_template` (`id`, `grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`) VALUES
	(8, 3, 'checkbox', NULL, 1, 0, 0, 0, 0, 'center', 'checkbox', '', 1),
	(9, 3, 'action', 'Action', 1, 0, 0, 0, 0, 'center', 'actionButton', '', 2),
	(10, 3, 'apgr.id', 'Approval Group ID', 1, 1, 1, 1, 1, 'left', 'input', 'Approval Group ID', 3),
	(11, 3, 'apgr.name', 'Approval Group Name', 1, 1, 1, 1, 1, 'left', 'input', 'Approval Group Name', 4),
	(12, 3, 'usm.name', 'Created By', 1, 1, 1, 1, 1, 'left', 'input', 'Created By', 5),
	(13, 3, 'apgr.dateCreated', 'Create Date', 1, 1, 1, 1, 1, 'center', 'date', 'Create Date', 6),
	(14, 3, 'apgr.status', 'Status', 1, 1, 1, 1, 1, 'center', 'dropdown', 'All', 7),
	(15, 2, 'checkbox', NULL, 1, 0, 0, 0, 0, 'center', 'checkbox', '', 1),
	(16, 2, 'action', 'Action', 1, 0, 0, 0, 0, 'center', 'actionButton', '', 2),
	(17, 2, 'usm.email', 'Email Address', 1, 1, 1, 1, 1, 'left', 'input', 'Email Address', 3),
	(18, 2, 'usm.name', 'Name', 1, 1, 1, 1, 1, 'left', 'input', 'Name', 4),
	(19, 2, 'usm.nicPassportNo', 'Employee No', 1, 1, 1, 1, 1, 'left', 'input', 'Employee No', 5),
	(20, 2, 'approvalGroup.approvalGroupId', 'Approval Groups', 1, 1, 1, 1, 1, 'left', 'dropdown', 'Approval Groups', 6),
	(21, 2, 'rolem.id', 'Role', 1, 1, 1, 1, 1, 'left', 'dropdown', 'Role', 7),
	(22, 2, 'usm.status', 'Status', 1, 1, 1, 1, 1, 'center', 'dropdown', 'All', 8),
	(23, 4, 'checkbox', NULL, 1, 0, 0, 0, 0, 'center', 'checkbox', '', 1),
	(24, 4, 'action', 'Action', 1, 0, 0, 0, 0, 'center', 'actionButton', '', 2),
	(25, 4, 'acct.id', 'Account Type', 1, 1, 1, 1, 1, 'left', 'dropdown', 'Account Type', 3),
	(26, 4, 'accdt.id', 'Account Detail Type', 1, 1, 1, 1, 1, 'left', 'dropdown', 'Account Detail Type', 4),
	(27, 4, 'acc.number', 'Account No', 1, 1, 1, 1, 1, 'left', 'input', 'Account No', 5),
	(28, 4, 'acc.name', 'Account Name', 1, 1, 1, 1, 1, 'left', 'input', 'Account Name', 6),
	(29, 4, 'accParent.id', 'Parent Account', 1, 1, 1, 1, 1, 'left', 'dropdown', 'Parent Account', 7),
	(30, 4, 'acc.status', 'Status', 1, 1, 1, 1, 1, 'center', 'dropdown', 'All', 8),
	(31, 5, 'checkbox', NULL, 1, 0, 0, 0, 0, 'center', 'checkbox', '', 1),
	(32, 5, 'action', 'Action', 1, 0, 0, 0, 0, 'center', 'actionButton', '', 2),
	(33, 5, 'type.id', 'Item Type', 1, 1, 1, 1, 1, 'left', 'dropdown', 'Item Type', 3),
	(34, 5, 'cat.id', 'Category', 1, 1, 1, 1, 1, 'left', 'dropdown', 'Category', 4),
	(35, 5, 'item.itemNumber', 'Item No', 1, 1, 1, 1, 1, 'left', 'input', 'Item No', 5),
	(36, 5, 'item.name', 'Item Name', 1, 1, 1, 1, 1, 'left', 'input', 'Item Name', 6),
	(37, 5, 'item.taxable', 'Taxability', 1, 1, 1, 1, 1, 'center', 'dropdown', 'Taxability', 7),
	(38, 5, 'item.salesPrice', 'Selling Price', 1, 1, 1, 1, 1, 'right', 'numeric', 'Selling Price', 8),
	(39, 5, 'item.status', 'Status', 1, 1, 1, 1, 1, 'center', 'dropdown', 'All', 9),
	(40, 6, 'checkbox', NULL, 1, 0, 0, 0, 0, 'center', 'checkbox', '', 1),
	(41, 6, 'action', 'Action', 1, 0, 0, 0, 0, 'center', 'actionButton', '', 2),
	(42, 6, 'tenant.tenantId', 'Tenant ID', 1, 1, 1, 1, 1, 'left', 'input', 'Tenant ID', 3),
	(43, 6, 'tenant.ownerName', 'Company Name', 1, 1, 1, 1, 1, 'left', 'input', 'Company Name', 4),
	(44, 6, 'tenant.ownerEmail', 'Email Address', 1, 1, 1, 1, 1, 'left', 'input', 'Email Address', 5),
	(45, 6, 'tenant.status', 'Status', 1, 1, 1, 1, 1, 'center', 'dropdown', 'All', 6),
	(46, 7, 'checkbox', NULL, 1, 0, 0, 0, 0, 'center', 'checkbox', '', 1),
	(47, 7, 'action', 'Action', 1, 0, 0, 0, 0, 'center', 'actionButton', '', 2),
	(48, 7, 'chk.paymentReferanceNo', 'Payment Ref.', 1, 1, 1, 1, 1, 'left', 'input', 'Payment Ref.', 3),
	(49, 7, 'chk.amount', 'Amount', 1, 1, 1, 1, 1, 'right', 'input', 'Amount', 4),
	(50, 7, 'chk.discountAmount', 'Discount Amount', 1, 1, 1, 1, 1, 'right', 'input', 'Discount Amount', 5),
	(51, 7, 'chk.paymentDate', 'Date', 1, 1, 1, 1, 1, 'center', 'date', 'Date', 6),
	(52, 7, 'vi.invoiceNo', 'Bill No', 1, 1, 1, 1, 1, 'left', 'input', 'Bill No.', 7),
	(53, 7, 'vi.invoiceAmount', 'Bill Amount', 1, 1, 1, 1, 1, 'right', 'input', 'Bill Amount', 8),
	(54, 7, 'vn.name', 'Vendor', 1, 1, 1, 1, 1, 'left', 'input', 'Vendor', 9),
	(55, 7, 'vi.invoiceDate', 'Bill Date', 1, 1, 1, 1, 1, 'center', 'date', 'Bill Date', 10),
	(56, 7, 'vi.dueDate', 'Due Date', 1, 1, 1, 1, 1, 'center', 'date', 'Due Date', 11),
	(57, 7, 'chk.status', 'Status', 1, 1, 1, 1, 1, 'center', 'dropdown', 'All', 13),
	(58, 8, 'checkbox', '', 1, 0, 0, 0, 0, 'center', 'checkbox', '', 1),
	(59, 8, 'action', 'Action', 1, 0, 0, 1, 0, 'center', 'actionButton', '', 2),
	(60, 8, 'vendor.vendorName', 'Vendor Name', 1, 1, 1, 1, 1, 'left', 'input', 'Vendor Name', 3),
	(61, 8, 'vendor.email', 'Contact Email', 1, 1, 1, 1, 1, 'left', 'input', 'Contact Email', 4),
	(62, 8, 'vendor.contactPerson', 'Contact Name', 1, 1, 1, 1, 1, 'left', 'input', 'Contact Name', 5),
	(63, 8, 'vendor.contactNumber', 'Contact Phone', 1, 1, 1, 1, 1, 'left', 'input', 'Contact Phone', 6),
	(64, 8, 'addr.country', 'Country', 1, 1, 1, 1, 1, 'left', 'dropdown', 'All', 7),
	(65, 8, 'vendor.socialSecNo', 'Social Security No', 1, 1, 1, 1, 1, 'left', 'input', 'Social Security No', 8),
	(66, 8, 'sic.code', 'SIC Code', 1, 1, 1, 1, 1, 'left', 'input', 'SIC Code', 9),
	(67, 8, 'naic.code', 'NAIC Code', 1, 1, 1, 1, 1, 'left', 'input', 'NAIC Code', 10),
	(68, 9, 'checkbox', '', 1, 0, 0, 0, 0, 'center', 'checkbox', '', 1),
	(69, 9, 'action', 'Action', 1, 0, 0, 1, 0, 'center', 'actionButton', '', 2),
	(70, 9, 'req.vendorName', 'Vendor Name', 1, 1, 1, 1, 1, 'left', 'input', 'Vendor Name', 3),
	(71, 9, 'req.contactPerson', 'Contact Name', 1, 1, 1, 1, 1, 'left', 'input', 'Contact Name', 4),
	(72, 9, 'req.contactNumber', 'Contact Number', 1, 1, 1, 1, 1, 'left', 'input', 'Contact Number', 5),
	(73, 9, 'req.contactNumber', 'Email Address', 1, 1, 1, 1, 1, 'left', 'input', 'Email Address', 6),
	(74, 9, 'req.requestOn', 'Request Date', 1, 1, 1, 1, 1, 'center', 'input', 'Request Date', 7),
	(75, 9, 'req.status', 'Status', 1, 1, 1, 1, 1, 'center', 'dropdown', 'Status', 8),
	(76, 10, 'checkbox', NULL, 1, 0, 0, 0, 0, 'center', 'checkbox', '', 1),
	(77, 10, 'action', 'Action', 1, 0, 0, 0, 0, 'center', 'actionButton', '', 2),
	(78, 10, 'appCode.name', 'Project Code', 1, 1, 1, 1, 1, 'left', 'input', 'Project Code', 3),
	(79, 10, 'parent.name', 'Parent Project', 1, 1, 1, 1, 1, 'left', 'input', 'Parent Project', 4),
	(80, 10, 'appCode.createdOn', 'Create Date', 1, 1, 1, 1, 1, 'center', 'date', 'Create Date', 5),
	(81, 10, 'usm.name', 'Created By', 1, 1, 1, 1, 1, 'left', 'input', 'Created By', 6),
	(82, 10, 'appCode.status', 'Status', 1, 1, 1, 1, 1, 'center', 'dropdown', 'All', 7),
	(83, 7, 'po.poNumber', 'PO No', 1, 1, 1, 1, 1, 'left', 'input', 'PO No', 12),
	(84, 11, 'action', 'Action', 1, 0, 1, 1, 0, 'center', 'actionButton', '', 1),
	(85, 11, 'field.moduleId', 'Document Type', 1, 1, 1, 1, 1, 'left', 'dropdown', 'Document Type', 2),
	(86, 11, 'field.fieldName', 'Field Name', 1, 1, 1, 1, 1, 'center', 'input', 'Field Name', 3),
	(87, 11, 'field.fieldId', 'Field Type', 1, 1, 1, 1, 1, 'center', 'dropdown', 'Field Type', 4),
	(88, 11, 'field.required', 'Required Status', 1, 1, 1, 1, 1, 'center', 'dropdown', 'All', 5),
	(89, 11, 'field.status', 'Active Status', 1, 1, 1, 1, 1, 'center', 'dropdown', 'All', 6),
	(90, 1, 'checkbox', NULL, 1, 0, 0, 0, 0, 'center', 'checkbox', '', 1),
	(91, 1, 'action', 'Action', 1, 0, 1, 1, 0, 'center', 'actionButton', '', 2),
	(92, 1, 'rolem.id', 'Role ID', 1, 1, 1, 1, 1, 'left', 'number', 'Role ID', 3),
	(93, 1, 'rolem.name', 'Role Name', 1, 1, 1, 1, 1, 'left', 'input', 'Role Name', 4),
	(94, 1, 'rolem.createdUser', 'Created By', 1, 1, 1, 1, 1, 'left', 'input', 'Created By', 5),
	(95, 1, 'rolem.dateCreated', 'Create Date', 1, 1, 1, 1, 1, 'left', 'date', 'Create Date', 6),
	(96, 1, 'rolem.status', 'Status', 1, 1, 1, 1, 1, 'center', 'dropdown', 'All', 7),
	(97, 12, 'checkbox', '', 1, 0, 0, 0, 0, 'center', 'checkbox', '', 1),
	(98, 12, 'action', 'Action', 1, 0, 1, 1, 0, 'center', 'actionButton', '', 2),
	(99, 12, 'aut.name', 'Name', 1, 1, 1, 1, 1, 'left', 'input', 'Name', 3),
	(100, 12, 'configDoc.documentTypeId', 'Document Type', 1, 1, 1, 1, 1, 'left', 'dropdown', 'Document Type', 4),
	(101, 12, 'configDoc.eventId', 'Event', 1, 1, 1, 1, 1, 'left', 'dropdown', 'Event', 5),
	(102, 12, 'aut.createdBy', 'Created By', 1, 1, 1, 1, 1, 'left', 'input', 'Created By', 6),
	(103, 12, 'aut.createdDate', 'Create Date', 1, 1, 1, 1, 1, 'center', 'date', 'Create Date', 7),
	(104, 12, 'aut.staus', 'Status', 1, 1, 1, 1, 1, 'center', 'dropdown', 'All', 8),
	(105, 13, 'checkbox', NULL, 1, 0, 0, 0, 0, 'center', 'checkbox', '', 1),
	(106, 13, 'action', 'Action', 1, 0, 0, 0, 0, 'center', 'actionButton', '', 2),
	(107, 13, 'ven.name', 'Vendor', 1, 1, 1, 1, 1, 'center', 'input', 'Vendor', 3),
	(108, 13, 'po.poNumber', 'PO Number', 1, 1, 1, 1, 1, 'center', 'input', 'PO Number', 4),
	(109, 13, 'cod.longName', 'Project / Task', 1, 1, 1, 1, 1, 'center', 'input', 'Project / Task', 5),
	(110, 13, 'po.grossAmount', 'Amount', 1, 1, 1, 1, 1, 'right', 'input', 'Amount', 6),
	(111, 13, 'po.poDate', 'PO Date', 1, 1, 1, 1, 1, 'center', 'date', 'PO Date', 7),
	(112, 13, 'po.deliveryDate', 'Delivery Date', 1, 1, 1, 1, 1, 'center', 'date', 'Delivery Date', 8),
	(113, 13, 'po.createdBy', 'Submited By', 1, 1, 1, 1, 1, 'center', 'input', 'Submited By', 9),
	(114, 13, 'po.createdOn', 'Submited Date', 1, 1, 1, 1, 1, 'center', 'date', 'Submited Date', 10),
	(115, 13, 'po.status', 'Internal Approval Status', 1, 1, 1, 1, 1, 'center', 'dropdown', 'Internal Approval Status', 11),
	(116, 13, 'po.vendorApprovalStatus', 'Vendor Approval Status', 1, 1, 1, 1, 1, 'center', 'dropdown', 'Vendor Approval Status', 12);
/*!40000 ALTER TABLE `common_grid_column_template` ENABLE KEYS */;

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
  PRIMARY KEY (`id`),
  KEY `TABLE_FK_2` (`grid_id`),
  CONSTRAINT `common_grid_column_user_wice_ibfk_1` FOREIGN KEY (`grid_id`) REFERENCES `common_grid_template` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

/*!40000 ALTER TABLE `common_grid_column_user_wice` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_grid_column_user_wice` ENABLE KEYS */;

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
	(10, 3, 2, 'apgr.status', 'Status', 'dropdown'),
	(11, 2, NULL, 'usm.email', 'Email Address', 'input'),
	(12, 2, NULL, 'usm.name', 'Name', 'input'),
	(13, 2, NULL, 'usm.nicPassportNo', 'Employee No', 'input'),
	(14, 2, NULL, 'approvalGroups', 'Approval Groups', 'dropdown'),
	(15, 2, NULL, 'rolem.name', 'Role', 'dropdown'),
	(16, 2, 3, 'usm.status', 'Status', 'dropdown'),
	(17, 4, NULL, 'acct.name', 'Account Type', 'dropdown'),
	(18, 4, NULL, 'accdt.name', 'Account Detail Type', 'dropdown'),
	(19, 4, NULL, 'acc.number', 'Account No', 'input'),
	(20, 4, NULL, 'acc.name', 'Account Name', 'input'),
	(21, 4, NULL, 'acc2.name', 'Parent Account', 'dropdown'),
	(22, 4, 4, 'acc.status', 'Status', 'dropdown'),
	(23, 5, NULL, 'type.name', 'Item Type', 'dropdown'),
	(24, 5, NULL, 'cat.name', 'Category', 'input'),
	(25, 5, NULL, 'item.itemNumber', 'Item No', 'input'),
	(26, 5, NULL, 'item.name', 'Item Name', 'input'),
	(27, 5, 6, 'item.taxable', 'Taxability', 'dropdown'),
	(28, 5, NULL, 'item.salesPrice', 'Selling Price', 'input'),
	(29, 5, 5, 'item.status', 'Status', 'dropdown'),
	(30, 6, NULL, 'tenantId', 'Tenant ID', 'input'),
	(31, 6, NULL, 'companyName', 'Company Name', 'input'),
	(32, 6, NULL, 'emailAddress', 'Email Address', 'input'),
	(33, 6, 7, 'status', 'Status', 'dropdown'),
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
	(44, 8, NULL, 'vendor.vendorName', 'Vendor Name', 'input'),
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
	(55, 10, NULL, 'parent.name', 'Parent Project', 'input'),
	(56, 10, NULL, 'appCode.createdOn', 'Create Date', 'date'),
	(57, 10, NULL, 'usm.name', 'Created By', 'input'),
	(59, 10, 9, 'appCode.status', 'Status', 'dropdown'),
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
	(72, 13, NULL, 'ven.name', 'Vendor', 'input'),
	(73, 13, NULL, 'poNumber', 'PO Number', 'input'),
	(74, 13, NULL, 'cod.longName', 'Project / Task', 'input'),
	(75, 13, NULL, 'grossAmount', 'Amount', 'input'),
	(76, 13, NULL, 'poDate', 'PO Date', 'date'),
	(77, 13, NULL, 'deliveryDate', 'Delivery Date', 'date'),
	(78, 13, NULL, 'createdBy', 'Submited By', 'input'),
	(79, 13, NULL, 'createdOn', 'Submited Date', 'input'),
	(80, 13, 2, 'status', 'Internal Approval Status', 'dropdown'),
	(81, 13, 3, 'vendorApprovalStatus', 'Vendor Approval Status', 'dropdown');
/*!40000 ALTER TABLE `common_grid_filter_template` ENABLE KEYS */;

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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

/*!40000 ALTER TABLE `common_grid_state_template` DISABLE KEYS */;
INSERT INTO `common_grid_state_template` (`id`, `grid_id`, `start_from`, `total_rows`, `column_widths`) VALUES
	(1, 1, 0, 10, '50,100,307,307,307,307,307'),
	(2, 3, 0, 10, '50,100,306,306,306,307,307'),
	(3, 2, 0, 10, '50,100,255,268,246,256,256,256'),
	(4, 4, 0, 10, '50,102,257,257,257,257,257,257'),
	(5, 5, 0, 10, '50,100,220,218,214,218,218,219,219'),
	(6, 6, 0, 10, '50,50,100,100,100,100'),
	(7, 7, 0, 10, '50,100,154,155,155,155,155,155,155'),
	(8, 8, 0, 10, '50,100,210,210,210,200,200,200,200,200'),
	(9, 9, 0, 10, '50,100,180,180,180,181,181,181'),
	(10, 10, 0, 10, '50,100,305,305,305,305,305'),
	(11, 11, 0, 10, '100,220,218,214,218,218'),
	(12, 12, 0, 10, '58,147,147,147,147,147,147,147'),
	(13, 13, 0, 10, '50,100,220,218,214,218,218,219,219,219,219,219');
/*!40000 ALTER TABLE `common_grid_state_template` ENABLE KEYS */;

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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*!40000 ALTER TABLE `common_grid_state_user_wice` DISABLE KEYS */;
INSERT INTO `common_grid_state_user_wice` (`id`, `user_id`, `grid_id`, `start_from`, `total_rows`, `column_widths`) VALUES
	(7, 'admin', 1, 0, 10, '50,100,307,307,307,307,307');
/*!40000 ALTER TABLE `common_grid_state_user_wice` ENABLE KEYS */;

DROP TABLE IF EXISTS `common_grid_template`;
CREATE TABLE IF NOT EXISTS `common_grid_template` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `grid_name` varchar(100) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

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
	(13, 'PO_LIST');
/*!40000 ALTER TABLE `common_grid_template` ENABLE KEYS */;

DROP TABLE IF EXISTS `common_integration_error`;
CREATE TABLE IF NOT EXISTS `common_integration_error` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `error_code` varchar(200) DEFAULT NULL,
  `error_message` text DEFAULT NULL,
  `error_detail` varchar(255) DEFAULT NULL,
  `date_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*!40000 ALTER TABLE `common_integration_error` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_integration_error` ENABLE KEYS */;

DROP TABLE IF EXISTS `common_integration_failed_record`;
CREATE TABLE IF NOT EXISTS `common_integration_failed_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tp_id` varchar(100) DEFAULT NULL,
  `papertrl_id` int(11) DEFAULT NULL,
  `system_short_code` varchar(30) NOT NULL,
  `failed_reason` varchar(300) DEFAULT NULL,
  `reference_number` varchar(255) NOT NULL,
  `object_type` varchar(100) NOT NULL,
  `failed_date_time` datetime NOT NULL,
  `exception_message` varchar(500) DEFAULT NULL,
  `system_id` int(11) NOT NULL,
  `system_name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*!40000 ALTER TABLE `common_integration_failed_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_integration_failed_record` ENABLE KEYS */;

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

/*!40000 ALTER TABLE `common_integration_id_connection` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_integration_id_connection` ENABLE KEYS */;

DROP TABLE IF EXISTS `common_integration_incomplete_record`;
CREATE TABLE IF NOT EXISTS `common_integration_incomplete_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tp_id` varchar(20) NOT NULL,
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

/*!40000 ALTER TABLE `common_integration_incomplete_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_integration_incomplete_record` ENABLE KEYS */;

DROP TABLE IF EXISTS `common_integration_service`;
CREATE TABLE IF NOT EXISTS `common_integration_service` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `status` char(1) DEFAULT NULL,
  `service_type` int(5) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

/*!40000 ALTER TABLE `common_integration_service` DISABLE KEYS */;
INSERT INTO `common_integration_service` (`id`, `name`, `status`, `service_type`) VALUES
	(1, 'Push account', 'A', 1),
	(2, 'Pull account', 'A', 2),
	(3, 'Pull uom', 'A', 2),
	(4, 'Push uom', 'A', 1),
	(5, 'Push item', 'A', 1),
	(6, 'Pull item', 'A', 2),
	(7, 'Push client', 'A', 1),
	(8, 'Pull client', 'A', 2),
	(9, 'Push term', 'A', 1),
	(10, 'Pull term', 'A', 2),
	(11, 'Push vendor', 'A', 1),
	(12, 'Pull vendor', 'A', 2),
	(13, 'Push purchase order', 'A', 1),
	(14, 'Pull purchase order', 'A', 2),
	(15, 'Push invoice', 'A', 1),
	(16, 'Pull invoice', 'A', 2),
	(17, 'Push purchase order receipt', 'A', 1),
	(18, 'Pull purchase order receipt', 'A', 2),
	(19, 'Push payment', 'A', 1),
	(20, 'Pull payment', 'A', 2),
	(21, 'Push deleted record', 'A', 1),
	(22, 'Pull deleted record', 'A', 2),
	(23, 'Push expense', 'A', 1),
	(24, 'Pull item category', 'A', 2),
	(25, 'Push item category', 'A', 1);
/*!40000 ALTER TABLE `common_integration_service` ENABLE KEYS */;

DROP TABLE IF EXISTS `common_integration_service_dependency`;
CREATE TABLE IF NOT EXISTS `common_integration_service_dependency` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `service_id` int(11) NOT NULL,
  `dependant_service_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

/*!40000 ALTER TABLE `common_integration_service_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_integration_service_status` ENABLE KEYS */;

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

/*!40000 ALTER TABLE `common_item_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_item_attachment` ENABLE KEYS */;

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

/*!40000 ALTER TABLE `common_item_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_item_category` ENABLE KEYS */;

DROP TABLE IF EXISTS `common_item_import_issue`;
CREATE TABLE IF NOT EXISTS `common_item_import_issue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `import_mst_id` int(11) NOT NULL,
  `recode` text DEFAULT NULL,
  `description` varchar(256) DEFAULT NULL,
  `line_no` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_common_product_import_issue_common_product_import_mst` (`import_mst_id`),
  CONSTRAINT `FK_common_product_import_issue_common_product_import_mst` FOREIGN KEY (`import_mst_id`) REFERENCES `common_item_import_mst` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*!40000 ALTER TABLE `common_item_import_issue` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_item_import_issue` ENABLE KEYS */;

DROP TABLE IF EXISTS `common_item_import_mst`;
CREATE TABLE IF NOT EXISTS `common_item_import_mst` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `total_recodes` int(11) NOT NULL,
  `succeed` int(11) NOT NULL,
  `failed` int(11) NOT NULL,
  `created_by` varchar(100) NOT NULL,
  `created_on` datetime NOT NULL,
  `update_by` varchar(100) DEFAULT NULL,
  `update_on` datetime DEFAULT NULL,
  `delete_by` varchar(100) DEFAULT NULL,
  `delete_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*!40000 ALTER TABLE `common_item_import_mst` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_item_import_mst` ENABLE KEYS */;

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*!40000 ALTER TABLE `common_item_mst` DISABLE KEYS */;
INSERT INTO `common_item_mst` (`id`, `name`, `item_number`, `partner_service`, `taxable`, `buying_price`, `sales_price`, `status`, `purchase_description`, `sales_description`, `inventory_asset_account`, `income_account`, `expense_account`, `update_by`, `update_on`, `delete_by`, `delete_on`, `uom_id`, `product_type_id`, `product_category_id`, `parent_id`, `sub_level`, `vendor_id`, `created_by`, `created_on`) VALUES
	(1, 'Sand', 'ITEM 1', NULL, 1, NULL, 15000.00, 'A', NULL, 'Cube', 6, NULL, NULL, NULL, NULL, NULL, NULL, 2, 1, NULL, NULL, 0, NULL, 'admin', '2021-03-06 12:13:04'),
	(2, 'Ciment', 'ITEM 2', NULL, 0, NULL, 1000.00, 'A', NULL, 'insee cement', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0, NULL, 'admin', '2021-03-06 12:15:47');
/*!40000 ALTER TABLE `common_item_mst` ENABLE KEYS */;

DROP TABLE IF EXISTS `common_item_type`;
CREATE TABLE IF NOT EXISTS `common_item_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `description` varchar(200) NOT NULL,
  `status` char(1) NOT NULL,
  `icon` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*!40000 ALTER TABLE `common_item_type` DISABLE KEYS */;
INSERT INTO `common_item_type` (`id`, `name`, `description`, `status`, `icon`) VALUES
	(1, 'Inventory', 'Product you buy and/or sell and that you track quantities of.', 'A', 'fa fa-shopping-basket'),
	(2, 'Non-Inventory', 'Product you buy and/or sell but don\'t need to (or can\'t) track quantities of, for example, nuts and bolts used in an installation.', 'A', 'fa fa-archive'),
	(3, 'Service', 'Service that you provide to customers, for example, landscaping or tax preparation service.', 'A', 'fa fa-taxi'),
	(4, 'Other', 'Use for miscellaneous labor, material, or part charges, such as delivery charges, setup fees, and service charges.', 'A', 'fa fa-ellipsis-h');
/*!40000 ALTER TABLE `common_item_type` ENABLE KEYS */;

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

/*!40000 ALTER TABLE `common_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_message` ENABLE KEYS */;

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
  `created_on` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*!40000 ALTER TABLE `common_object_sync_mst` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_object_sync_mst` ENABLE KEYS */;

DROP TABLE IF EXISTS `common_outstanding_task`;
CREATE TABLE IF NOT EXISTS `common_outstanding_task` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `status` char(1) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `created_by` varchar(100) DEFAULT '',
  `created_on` datetime DEFAULT NULL,
  `update_by` varchar(100) DEFAULT '',
  `update_on` datetime DEFAULT NULL,
  `delete_by` varchar(100) DEFAULT NULL,
  `delete_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*!40000 ALTER TABLE `common_outstanding_task` DISABLE KEYS */;
INSERT INTO `common_outstanding_task` (`id`, `title`, `description`, `status`, `url`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES
	(1, 'Bookmark this page', 'Please bookmark this page so you can easily access your unique PaperTrl Account URL', 'A', '/', 'admin', '2020-06-22 15:53:35', NULL, NULL, NULL, NULL),
	(2, 'Complete your Company Profile', 'Go to Settings and complete your company information', 'A', '/home/support/package-change-request', 'admin', '2020-05-03 11:06:34', NULL, NULL, NULL, NULL),
	(3, 'Create Users', 'Go to User Management to add new users', 'S', '/home/admin/user', 'admin', '2020-05-03 11:06:37', 'admin', '2021-03-06 11:02:36', NULL, NULL),
	(4, 'Create Codes', 'Go to Code Management to upload or create codes.These are the account codes used to classify your expenses.', 'A', '/home/ven-invoice/approval-code-management', 'admin', '2020-05-03 11:06:38', NULL, NULL, NULL, NULL),
	(5, 'Create Vendors', 'Go to Vendor Management to upload or create vendors', 'A', '/home/vendor/management/vendor-management', 'admin', '2020-05-03 11:06:40', NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `common_outstanding_task` ENABLE KEYS */;

DROP TABLE IF EXISTS `common_payment_type`;
CREATE TABLE IF NOT EXISTS `common_payment_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` char(1) NOT NULL,
  `Description` varchar(100) NOT NULL,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

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

DROP TABLE IF EXISTS `common_system_endpoint`;
CREATE TABLE IF NOT EXISTS `common_system_endpoint` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `url_index` (`url`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=latin1;

/*!40000 ALTER TABLE `common_system_endpoint` DISABLE KEYS */;
INSERT INTO `common_system_endpoint` (`id`, `url`) VALUES
	(60, '/approval_level_management/sec_check_approval_level_availability'),
	(63, '/approval_level_management/sec_create_approval_level'),
	(62, '/approval_level_management/sec_search_approval_group_v2'),
	(32, '/common_service/load_data_grid'),
	(33, '/common_service/save_data_grid_state'),
	(75, '/common_service/sec_check_item_no_availability'),
	(76, '/common_service/sec_create_item'),
	(41, '/common_service/sec_field_types'),
	(46, '/common_service/sec_get_additional_fields_v2'),
	(16, '/common_service/sec_get_approval_codes'),
	(71, '/common_service/sec_get_category_dropdown_list'),
	(44, '/common_service/sec_get_detailed_approval_codes_by_category'),
	(47, '/common_service/sec_get_item_dropdown_list_v2'),
	(77, '/common_service/sec_get_item_name_by_id'),
	(69, '/common_service/sec_get_item_type_dropdown_list'),
	(9, '/common_service/sec_get_outstanding_task_list'),
	(74, '/common_service/sec_get_parent_item_dropdown_list_create'),
	(81, '/common_service/sec_get_parent_list_by_category'),
	(40, '/common_service/sec_get_system_module_name_list'),
	(51, '/common_service/sec_get_uom_dropdown_list'),
	(72, '/common_service/sec_search_item_v2'),
	(82, '/common_service/sec_search_project_code_v2'),
	(56, '/common_service/sec_view_access_levels'),
	(43, '/common_service/sec_view_access_levels_except'),
	(6, '/common_service/sec_view_approval_statuses'),
	(54, '/common_service/sec_view_city_names'),
	(53, '/common_service/sec_view_countries'),
	(13, '/common_service/sec_view_dateformats'),
	(14, '/common_service/sec_view_payment_statuses'),
	(52, '/common_service/sec_view_state_names'),
	(27, '/error'),
	(10, '/message_service/get_user_list'),
	(7, '/message_service/sec_get_user_notification'),
	(5, '/report_service/sec_get_bar_chart_data'),
	(11, '/report_service/sec_get_pie_chart_data'),
	(23, '/role_management/sec_check_role_name_availability'),
	(24, '/role_management/sec_create_role'),
	(50, '/role_management/sec_get_displayable_optional_fields_v2'),
	(20, '/role_management/sec_search_roles'),
	(64, '/role_management/sec_search_role_v2'),
	(22, '/role_management/sec_update_role'),
	(21, '/role_management/sec_view_role'),
	(57, '/role_management/sec_view_role_dropdown'),
	(19, '/role_management/sec_view_role_menu_list'),
	(39, '/role_management/sec_view_user_nav_list'),
	(67, '/role_management/update_role_v2'),
	(36, '/role_management/view_role_field_list_v2'),
	(35, '/role_management/view_role_menu_list_v2'),
	(38, '/role_management/view_role_selected_field_list_v2'),
	(37, '/role_management/view_role_selected_menu_list_v2'),
	(83, '/tenant_management/sec_get_tenant_details'),
	(29, '/tenant_management/sec_get_trial_verify_percentage'),
	(30, '/tenant_management/sec_is_email_available'),
	(26, '/tenant_management/sec_trial_request'),
	(28, '/tenant_management/sec_verify_trial'),
	(59, '/user_management/sec_check_user_email_availability'),
	(65, '/user_management/sec_create_user_v2'),
	(4, '/user_management/sec_download_profile_pic'),
	(17, '/user_management/sec_get_userlist_dropdown'),
	(58, '/user_management/sec_search_users_v2'),
	(1, '/user_management/sec_temporary_password_reset'),
	(34, '/user_management/sec_view_authenticated_user'),
	(80, '/user_management/sec_view_user'),
	(2, '/user_management/sec_view_user_byuserid'),
	(31, '/user_management/sec_view_user_nav_list'),
	(90, '/vendor_portal/sec_approve_purchase_order_v2'),
	(66, '/vendor_portal/sec_check_po_number_availability_v2'),
	(49, '/vendor_portal/sec_common_uom_list'),
	(78, '/vendor_portal/sec_create_purchase_order_as_approved_v2'),
	(79, '/vendor_portal/sec_create_purchase_order_v2'),
	(70, '/vendor_portal/sec_get_account_dropdown_list'),
	(73, '/vendor_portal/sec_get_account_types'),
	(85, '/vendor_portal/sec_get_all_pending_pos_v2'),
	(45, '/vendor_portal/sec_get_all_po_approvers_v2'),
	(12, '/vendor_portal/sec_get_discounted_invoices'),
	(86, '/vendor_portal/sec_get_extended_approval_users_v2'),
	(25, '/vendor_portal/sec_get_marketplace_vendors_dropdown'),
	(15, '/vendor_portal/sec_get_term_list_dropdown'),
	(3, '/vendor_portal/sec_get_uptodate_total_discount'),
	(8, '/vendor_portal/sec_get_vendors_dropdown'),
	(48, '/vendor_portal/sec_local_vendor_dropdown_list_v2'),
	(87, '/vendor_portal/sec_purchase_order_attachment_list_v2'),
	(91, '/vendor_portal/sec_purchase_order_audit_trial_v2'),
	(88, '/vendor_portal/sec_purchase_order_receipt_attachment_v2'),
	(92, '/vendor_portal/sec_reject_purchase_order_v2'),
	(18, '/vendor_portal/sec_search_invoice'),
	(42, '/vendor_portal/sec_search_purchase_orders_v2'),
	(55, '/vendor_portal/sec_search_vendor_v2'),
	(89, '/vendor_portal/sec_send_to_vendor_approval_v2'),
	(68, '/vendor_portal/sec_vendor_info'),
	(84, '/vendor_portal/sec_view_po_v2');
/*!40000 ALTER TABLE `common_system_endpoint` ENABLE KEYS */;

DROP TABLE IF EXISTS `common_uom`;
CREATE TABLE IF NOT EXISTS `common_uom` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `unit` varchar(100) DEFAULT '',
  `description` varchar(100) DEFAULT NULL,
  `status` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*!40000 ALTER TABLE `common_uom` DISABLE KEYS */;
INSERT INTO `common_uom` (`id`, `unit`, `description`, `status`) VALUES
	(1, 'HR', 'Human Resource', 'A'),
	(2, 'EA', 'Each', 'A');
/*!40000 ALTER TABLE `common_uom` ENABLE KEYS */;

DROP TABLE IF EXISTS `common_user_email_subscription`;
CREATE TABLE IF NOT EXISTS `common_user_email_subscription` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email_id` int(11) DEFAULT NULL,
  `user_id` varchar(30) DEFAULT NULL,
  `subscribe` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

/*!40000 ALTER TABLE `common_user_email_subscription` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_user_email_subscription` ENABLE KEYS */;

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
) ENGINE=InnoDB AUTO_INCREMENT=1945 DEFAULT CHARSET=latin1;

/*!40000 ALTER TABLE `common_user_log` DISABLE KEYS */;
INSERT INTO `common_user_log` (`id`, `endpoint_id`, `ip_address`, `user_name`, `status_code`, `additional_message`, `created_on`, `tenant_id`) VALUES
	(1, 1, '10.22.21.81', 'anonymousUser', '200', NULL, '2021-01-08 08:31:00', 'qa-app153'),
	(2, 2, '10.22.21.81', 'admin', '200', NULL, '2021-01-08 08:31:27', 'qa-app153'),
	(3, 3, '10.22.21.81', 'admin', '200', NULL, '2021-01-08 08:31:28', 'qa-app153'),
	(4, 12, '10.22.21.81', 'admin', '200', NULL, '2021-01-08 08:31:28', 'qa-app153'),
	(5, 18, '10.22.21.81', 'admin', '200', NULL, '2021-01-08 08:31:28', 'qa-app153'),
	(6, 4, '10.22.21.81', 'admin', '200', NULL, '2021-01-08 08:31:28', 'qa-app153'),
	(7, 11, '10.22.21.81', 'admin', '200', NULL, '2021-01-08 08:31:28', 'qa-app153'),
	(8, 25, '10.22.21.81', 'admin', '200', NULL, '2021-01-08 08:31:28', 'qa-app153'),
	(9, 13, '10.22.21.81', 'admin', '200', NULL, '2021-01-08 08:31:28', 'qa-app153'),
	(10, 14, '10.22.21.81', 'admin', '200', NULL, '2021-01-08 08:31:28', 'qa-app153'),
	(11, 16, '10.22.21.81', 'admin', '200', NULL, '2021-01-08 08:31:28', 'qa-app153'),
	(12, 7, '10.22.21.81', 'admin', '200', NULL, '2021-01-08 08:31:28', 'qa-app153'),
	(13, 10, '10.22.21.81', 'admin', '200', NULL, '2021-01-08 08:31:28', 'qa-app153'),
	(14, 6, '10.22.21.81', 'admin', '200', NULL, '2021-01-08 08:31:29', 'qa-app153'),
	(15, 9, '10.22.21.81', 'admin', '200', NULL, '2021-01-08 08:31:29', 'qa-app153'),
	(16, 17, '10.22.21.81', 'admin', '200', NULL, '2021-01-08 08:31:29', 'qa-app153'),
	(17, 15, '10.22.21.81', 'admin', '200', NULL, '2021-01-08 08:31:29', 'qa-app153'),
	(18, 5, '10.22.21.81', 'admin', '200', NULL, '2021-01-08 08:31:29', 'qa-app153'),
	(19, 26, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-21 07:38:48', 'v2_tenant'),
	(20, 27, '127.0.0.1', 'anonymousUser', '404', NULL, '2021-01-21 07:38:48', 'v2_tenant'),
	(21, 26, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-21 07:40:37', 'v2_tenant'),
	(22, 26, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-21 08:00:31', 'v2_tenant'),
	(23, 26, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-21 08:02:28', 'v2_tenant'),
	(24, 26, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-21 08:04:38', 'v2_tenant'),
	(25, 26, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-21 08:11:31', 'v2_tenant'),
	(26, 26, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-21 12:08:09', 'v2_tenant'),
	(27, 28, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-21 18:59:50', 'v2_tenant'),
	(28, 27, '127.0.0.1', 'anonymousUser', '401', NULL, '2021-01-21 18:59:52', 'v2_tenant'),
	(29, 28, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-21 19:01:24', 'v2_tenant'),
	(30, 27, '127.0.0.1', 'anonymousUser', '401', NULL, '2021-01-21 19:01:24', 'v2_tenant'),
	(31, 27, '127.0.0.1', 'anonymousUser', '401', NULL, '2021-01-21 19:01:36', 'v2_tenant'),
	(32, 27, '127.0.0.1', 'anonymousUser', '401', NULL, '2021-01-21 19:03:32', 'v2_tenant'),
	(33, 28, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-21 19:03:32', 'v2_tenant'),
	(34, 27, '127.0.0.1', 'anonymousUser', '401', NULL, '2021-01-21 19:03:39', 'v2_tenant'),
	(35, 27, '127.0.0.1', 'anonymousUser', '401', NULL, '2021-01-21 19:03:41', 'v2_tenant'),
	(36, 27, '127.0.0.1', 'anonymousUser', '401', NULL, '2021-01-21 19:03:41', 'v2_tenant'),
	(37, 27, '127.0.0.1', 'anonymousUser', '401', NULL, '2021-01-21 19:03:42', 'v2_tenant'),
	(38, 27, '127.0.0.1', 'anonymousUser', '401', NULL, '2021-01-21 19:03:42', 'v2_tenant'),
	(39, 27, '127.0.0.1', 'anonymousUser', '401', NULL, '2021-01-21 19:03:42', 'v2_tenant'),
	(40, 28, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-21 19:07:19', 'v2_tenant'),
	(41, 29, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-21 19:07:27', 'v2_tenant'),
	(42, 28, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-21 19:08:01', 'v2_tenant'),
	(43, 29, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-21 19:08:01', 'v2_tenant'),
	(44, 29, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-21 19:08:01', 'v2_tenant'),
	(45, 29, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-21 19:10:50', 'v2_tenant'),
	(46, 28, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-21 19:10:50', 'v2_tenant'),
	(47, 28, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-21 19:10:50', 'v2_tenant'),
	(48, 29, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-21 19:10:50', 'v2_tenant'),
	(49, 29, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-21 19:10:52', 'v2_tenant'),
	(50, 29, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-21 19:10:52', 'v2_tenant'),
	(51, 29, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-21 19:10:53', 'v2_tenant'),
	(52, 29, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-21 19:10:53', 'v2_tenant'),
	(53, 29, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-21 19:10:53', 'v2_tenant'),
	(54, 29, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-21 19:10:53', 'v2_tenant'),
	(55, 29, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-21 19:12:57', 'v2_tenant'),
	(56, 28, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-21 19:12:57', 'v2_tenant'),
	(57, 29, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-21 19:13:12', 'v2_tenant'),
	(58, 29, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-21 19:13:16', 'v2_tenant'),
	(59, 29, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-21 19:13:17', 'v2_tenant'),
	(60, 28, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-21 19:14:18', 'v2_tenant'),
	(61, 29, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-21 19:14:21', 'v2_tenant'),
	(62, 29, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-21 19:14:24', 'v2_tenant'),
	(63, 28, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-21 19:17:37', 'v2_tenant'),
	(64, 29, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-21 19:17:37', 'v2_tenant'),
	(65, 29, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-21 19:17:40', 'v2_tenant'),
	(66, 29, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-21 19:17:42', 'v2_tenant'),
	(67, 28, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-21 19:17:57', 'v2_tenant'),
	(68, 29, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-21 19:17:57', 'v2_tenant'),
	(69, 29, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-21 19:18:02', 'v2_tenant'),
	(70, 29, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-21 19:18:04', 'v2_tenant'),
	(71, 28, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-21 19:18:35', 'v2_tenant'),
	(72, 29, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-21 19:18:35', 'v2_tenant'),
	(73, 29, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-21 19:18:38', 'v2_tenant'),
	(74, 28, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-21 19:20:22', 'v2_tenant'),
	(75, 28, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-21 19:51:33', 'v2_tenant'),
	(76, 28, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-21 19:56:10', 'v2_tenant'),
	(77, 28, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-21 19:57:22', 'v2_tenant'),
	(78, 28, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-21 20:01:31', 'v2_tenant'),
	(79, 28, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-21 20:02:43', 'v2_tenant'),
	(80, 26, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-21 20:03:49', 'v2_tenant'),
	(81, 28, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-21 20:05:20', 'v2_tenant'),
	(82, 26, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-21 20:06:54', 'v2_tenant'),
	(83, 28, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-21 20:07:17', 'v2_tenant'),
	(84, 28, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-22 05:44:10', 'v2_tenant'),
	(85, 28, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-22 05:44:11', 'v2_tenant'),
	(86, 26, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-22 09:14:23', 'v2_tenant'),
	(87, 28, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-22 09:15:09', 'v2_tenant'),
	(88, 28, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-22 09:20:42', 'v2_tenant'),
	(89, 28, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-22 09:23:48', 'v2_tenant'),
	(90, 28, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-22 09:25:33', 'v2_tenant'),
	(91, 28, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-22 09:26:08', 'v2_tenant'),
	(92, 26, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-22 09:26:45', 'v2_tenant'),
	(93, 28, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-22 09:27:08', 'v2_tenant'),
	(94, 29, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-22 09:27:09', 'v2_tenant'),
	(95, 29, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-22 09:27:12', 'v2_tenant'),
	(96, 29, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-22 09:27:15', 'v2_tenant'),
	(97, 29, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-22 09:27:18', 'v2_tenant'),
	(98, 29, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-22 09:27:21', 'v2_tenant'),
	(99, 29, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-22 09:27:24', 'v2_tenant'),
	(100, 29, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-22 09:27:27', 'v2_tenant'),
	(101, 29, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-22 09:27:30', 'v2_tenant'),
	(102, 29, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-22 09:27:33', 'v2_tenant'),
	(103, 29, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-22 09:27:36', 'v2_tenant'),
	(104, 29, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-22 09:27:39', 'v2_tenant'),
	(105, 29, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-22 09:27:42', 'v2_tenant'),
	(106, 29, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-22 09:27:45', 'v2_tenant'),
	(107, 29, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-22 09:27:48', 'v2_tenant'),
	(108, 26, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-22 09:31:58', 'v2_tenant'),
	(109, 28, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-22 09:42:11', 'v2_tenant'),
	(110, 29, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-22 09:42:12', 'v2_tenant'),
	(111, 29, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-22 09:42:19', 'v2_tenant'),
	(112, 29, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-22 09:42:20', 'v2_tenant'),
	(113, 29, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-22 09:42:21', 'v2_tenant'),
	(114, 29, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-22 09:42:25', 'v2_tenant'),
	(115, 29, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-22 09:42:28', 'v2_tenant'),
	(116, 29, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-22 09:42:30', 'v2_tenant'),
	(117, 29, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-22 09:42:33', 'v2_tenant'),
	(118, 29, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-22 09:42:36', 'v2_tenant'),
	(119, 29, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-22 09:42:39', 'v2_tenant'),
	(120, 29, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-22 09:42:42', 'v2_tenant'),
	(121, 28, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-22 09:43:14', 'v2_tenant'),
	(122, 28, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-22 09:43:20', 'v2_tenant'),
	(123, 29, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-22 09:43:21', 'v2_tenant'),
	(124, 26, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-22 09:46:22', 'v2_tenant'),
	(125, 26, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-22 09:48:11', 'v2_tenant'),
	(126, 28, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-22 09:48:33', 'v2_tenant'),
	(127, 29, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-22 09:48:33', 'v2_tenant'),
	(128, 29, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-22 09:48:36', 'v2_tenant'),
	(129, 29, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-22 09:48:39', 'v2_tenant'),
	(130, 29, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-22 09:48:42', 'v2_tenant'),
	(131, 29, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-22 09:48:45', 'v2_tenant'),
	(132, 29, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-22 09:48:48', 'v2_tenant'),
	(133, 29, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-22 09:48:51', 'v2_tenant'),
	(134, 29, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-22 09:48:54', 'v2_tenant'),
	(135, 29, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-22 09:48:57', 'v2_tenant'),
	(136, 29, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-22 09:49:00', 'v2_tenant'),
	(137, 29, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-22 09:49:03', 'v2_tenant'),
	(138, 26, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-22 10:02:29', 'v2_tenant'),
	(139, 28, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-22 10:02:56', 'v2_tenant'),
	(140, 29, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-22 10:02:57', 'v2_tenant'),
	(141, 29, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-22 10:03:00', 'v2_tenant'),
	(142, 29, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-22 10:03:03', 'v2_tenant'),
	(143, 29, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-22 10:03:06', 'v2_tenant'),
	(144, 29, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-22 10:03:09', 'v2_tenant'),
	(145, 29, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-22 10:03:12', 'v2_tenant'),
	(146, 29, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-22 10:03:15', 'v2_tenant'),
	(147, 29, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-22 10:03:18', 'v2_tenant'),
	(148, 29, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-22 10:03:21', 'v2_tenant'),
	(149, 29, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-22 10:03:24', 'v2_tenant'),
	(150, 29, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-22 10:03:27', 'v2_tenant'),
	(151, 26, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-22 10:07:18', 'v2_tenant'),
	(152, 28, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-22 10:07:46', 'v2_tenant'),
	(153, 29, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-22 10:07:48', 'v2_tenant'),
	(154, 29, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-22 10:07:51', 'v2_tenant'),
	(155, 29, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-22 10:07:54', 'v2_tenant'),
	(156, 29, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-22 10:07:57', 'v2_tenant'),
	(157, 29, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-22 10:08:00', 'v2_tenant'),
	(158, 29, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-22 10:08:03', 'v2_tenant'),
	(159, 29, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-22 10:08:06', 'v2_tenant'),
	(160, 29, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-22 10:08:09', 'v2_tenant'),
	(161, 29, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-22 10:08:12', 'v2_tenant'),
	(162, 29, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-22 10:08:15', 'v2_tenant'),
	(163, 26, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-22 10:13:27', 'v2_tenant'),
	(164, 28, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-22 10:13:50', 'v2_tenant'),
	(165, 29, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-22 10:13:50', 'v2_tenant'),
	(166, 29, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-22 10:13:50', 'v2_tenant'),
	(167, 29, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-22 10:13:51', 'v2_tenant'),
	(168, 29, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-22 10:13:52', 'v2_tenant'),
	(169, 29, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-22 10:13:53', 'v2_tenant'),
	(170, 29, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-22 10:13:54', 'v2_tenant'),
	(171, 29, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-22 10:13:55', 'v2_tenant'),
	(172, 29, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-22 10:13:56', 'v2_tenant'),
	(173, 29, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-22 10:13:57', 'v2_tenant'),
	(174, 29, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-22 10:13:58', 'v2_tenant'),
	(175, 29, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-22 10:13:59', 'v2_tenant'),
	(176, 29, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-22 10:14:00', 'v2_tenant'),
	(177, 29, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-22 10:14:01', 'v2_tenant'),
	(178, 29, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-22 10:14:02', 'v2_tenant'),
	(179, 29, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-22 10:14:03', 'v2_tenant'),
	(180, 29, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-22 10:14:04', 'v2_tenant'),
	(181, 29, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-22 10:14:05', 'v2_tenant'),
	(182, 29, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-22 10:14:06', 'v2_tenant'),
	(183, 29, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-22 10:14:07', 'v2_tenant'),
	(184, 29, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-22 10:14:08', 'v2_tenant'),
	(185, 29, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-22 10:14:09', 'v2_tenant'),
	(186, 29, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-22 10:14:10', 'v2_tenant'),
	(187, 29, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-22 10:14:11', 'v2_tenant'),
	(188, 29, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-22 10:14:12', 'v2_tenant'),
	(189, 29, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-22 10:14:13', 'v2_tenant'),
	(190, 29, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-22 10:14:14', 'v2_tenant'),
	(191, 29, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-22 10:14:15', 'v2_tenant'),
	(192, 29, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-22 10:14:16', 'v2_tenant'),
	(193, 29, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-22 10:14:17', 'v2_tenant'),
	(194, 29, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-22 10:14:18', 'v2_tenant'),
	(195, 29, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-22 10:14:19', 'v2_tenant'),
	(196, 29, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-22 10:14:20', 'v2_tenant'),
	(197, 28, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-22 10:15:00', 'v2_tenant'),
	(198, 29, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-22 10:15:00', 'v2_tenant'),
	(199, 26, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-22 11:33:42', 'v2_tenant'),
	(200, 26, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-22 11:34:23', 'v2_tenant'),
	(201, 26, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-22 11:35:18', 'v2_tenant'),
	(202, 28, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-22 11:38:31', 'v2_tenant'),
	(203, 29, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-22 11:38:33', 'v2_tenant'),
	(204, 29, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-22 11:38:36', 'v2_tenant'),
	(205, 29, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-22 11:38:39', 'v2_tenant'),
	(206, 29, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-22 11:38:42', 'v2_tenant'),
	(207, 29, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-22 11:38:45', 'v2_tenant'),
	(208, 29, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-22 11:38:48', 'v2_tenant'),
	(209, 29, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-22 11:38:51', 'v2_tenant'),
	(210, 29, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-22 11:38:54', 'v2_tenant'),
	(211, 29, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-22 11:38:57', 'v2_tenant'),
	(212, 29, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-22 11:39:00', 'v2_tenant'),
	(213, 28, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-22 11:44:46', 'v2_tenant'),
	(214, 28, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-22 11:47:05', 'v2_tenant'),
	(215, 28, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-23 15:10:55', 'v2_tenant'),
	(216, 26, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 15:07:30', 'v2_tenant'),
	(217, 28, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 15:08:25', 'v2_tenant'),
	(218, 29, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 15:08:28', 'v2_tenant'),
	(219, 29, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 15:08:31', 'v2_tenant'),
	(220, 29, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 15:08:34', 'v2_tenant'),
	(221, 29, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 15:08:37', 'v2_tenant'),
	(222, 29, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 15:08:40', 'v2_tenant'),
	(223, 29, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 15:08:43', 'v2_tenant'),
	(224, 29, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 15:08:46', 'v2_tenant'),
	(225, 26, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 15:21:51', 'v2_tenant'),
	(226, 26, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 15:22:03', 'v2_tenant'),
	(227, 26, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 15:22:57', 'v2_tenant'),
	(228, 30, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 15:54:50', 'v2_tenant'),
	(229, 30, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 15:55:32', 'v2_tenant'),
	(230, 30, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 15:55:36', 'v2_tenant'),
	(231, 30, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 15:55:48', 'v2_tenant'),
	(232, 30, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 15:55:51', 'v2_tenant'),
	(233, 30, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 15:55:54', 'v2_tenant'),
	(234, 30, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 16:05:39', 'v2_tenant'),
	(235, 30, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 16:12:32', 'v2_tenant'),
	(236, 30, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 16:14:41', 'v2_tenant'),
	(237, 30, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 16:14:53', 'v2_tenant'),
	(238, 30, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 16:16:13', 'v2_tenant'),
	(239, 30, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 16:17:47', 'v2_tenant'),
	(240, 30, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 16:17:53', 'v2_tenant'),
	(241, 30, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 16:18:28', 'v2_tenant'),
	(242, 30, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 16:18:51', 'v2_tenant'),
	(243, 30, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 16:22:46', 'v2_tenant'),
	(244, 30, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 16:23:13', 'v2_tenant'),
	(245, 30, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 16:23:31', 'v2_tenant'),
	(246, 30, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 16:24:14', 'v2_tenant'),
	(247, 30, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 16:24:22', 'v2_tenant'),
	(248, 30, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 16:24:55', 'v2_tenant'),
	(249, 30, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 16:25:19', 'v2_tenant'),
	(250, 30, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 16:27:53', 'v2_tenant'),
	(251, 30, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 16:28:45', 'v2_tenant'),
	(252, 30, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 16:29:16', 'v2_tenant'),
	(253, 30, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 16:31:33', 'v2_tenant'),
	(254, 30, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 16:31:37', 'v2_tenant'),
	(255, 30, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 16:31:49', 'v2_tenant'),
	(256, 30, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 16:33:55', 'v2_tenant'),
	(257, 30, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 16:34:00', 'v2_tenant'),
	(258, 30, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 16:39:32', 'v2_tenant'),
	(259, 30, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 16:39:48', 'v2_tenant'),
	(260, 30, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 16:40:38', 'v2_tenant'),
	(261, 30, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 16:41:23', 'v2_tenant'),
	(262, 30, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 16:41:52', 'v2_tenant'),
	(263, 30, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 16:42:13', 'v2_tenant'),
	(264, 30, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 16:43:31', 'v2_tenant'),
	(265, 30, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 16:49:42', 'v2_tenant'),
	(266, 30, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 17:13:20', 'v2_tenant'),
	(267, 30, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 17:13:24', 'v2_tenant'),
	(268, 30, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 17:13:24', 'v2_tenant'),
	(269, 30, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 17:13:31', 'v2_tenant'),
	(270, 30, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 17:13:32', 'v2_tenant'),
	(271, 30, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 17:13:35', 'v2_tenant'),
	(272, 30, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 17:13:37', 'v2_tenant'),
	(273, 30, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 17:13:38', 'v2_tenant'),
	(274, 30, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 17:14:06', 'v2_tenant'),
	(275, 30, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 17:14:06', 'v2_tenant'),
	(276, 30, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 17:14:07', 'v2_tenant'),
	(277, 30, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 17:14:07', 'v2_tenant'),
	(278, 30, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 17:14:07', 'v2_tenant'),
	(279, 30, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 17:14:07', 'v2_tenant'),
	(280, 30, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 17:14:08', 'v2_tenant'),
	(281, 30, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 17:14:08', 'v2_tenant'),
	(282, 30, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 17:14:08', 'v2_tenant'),
	(283, 30, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 17:14:08', 'v2_tenant'),
	(284, 30, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 17:14:08', 'v2_tenant'),
	(285, 30, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 17:14:09', 'v2_tenant'),
	(286, 30, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 17:14:09', 'v2_tenant'),
	(287, 30, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 17:14:09', 'v2_tenant'),
	(288, 30, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 17:14:09', 'v2_tenant'),
	(289, 26, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 17:14:15', 'v2_tenant'),
	(290, 30, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 17:16:01', 'v2_tenant'),
	(291, 30, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 17:16:01', 'v2_tenant'),
	(292, 30, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 17:16:01', 'v2_tenant'),
	(293, 30, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 17:16:02', 'v2_tenant'),
	(294, 30, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 17:16:02', 'v2_tenant'),
	(295, 30, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 17:16:02', 'v2_tenant'),
	(296, 30, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 17:16:03', 'v2_tenant'),
	(297, 30, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 17:16:03', 'v2_tenant'),
	(298, 30, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 17:16:03', 'v2_tenant'),
	(299, 30, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 17:16:03', 'v2_tenant'),
	(300, 30, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 17:16:03', 'v2_tenant'),
	(301, 30, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 17:16:03', 'v2_tenant'),
	(302, 30, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 17:16:03', 'v2_tenant'),
	(303, 30, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 17:16:03', 'v2_tenant'),
	(304, 30, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 17:18:02', 'v2_tenant'),
	(305, 30, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 17:18:02', 'v2_tenant'),
	(306, 30, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 17:18:02', 'v2_tenant'),
	(307, 30, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 17:18:02', 'v2_tenant'),
	(308, 30, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 17:18:03', 'v2_tenant'),
	(309, 30, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 17:18:03', 'v2_tenant'),
	(310, 30, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 17:18:03', 'v2_tenant'),
	(311, 30, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 17:18:03', 'v2_tenant'),
	(312, 30, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 17:18:03', 'v2_tenant'),
	(313, 30, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 17:18:04', 'v2_tenant'),
	(314, 30, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 17:18:04', 'v2_tenant'),
	(315, 30, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 17:18:04', 'v2_tenant'),
	(316, 30, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 17:18:04', 'v2_tenant'),
	(317, 30, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 17:18:04', 'v2_tenant'),
	(318, 30, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 17:18:04', 'v2_tenant'),
	(319, 30, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 17:21:06', 'v2_tenant'),
	(320, 30, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 17:21:06', 'v2_tenant'),
	(321, 26, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 17:21:49', 'v2_tenant'),
	(322, 30, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 17:22:24', 'v2_tenant'),
	(323, 30, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 17:22:25', 'v2_tenant'),
	(324, 30, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 17:22:25', 'v2_tenant'),
	(325, 30, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 17:22:25', 'v2_tenant'),
	(326, 30, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 17:22:26', 'v2_tenant'),
	(327, 30, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 17:22:26', 'v2_tenant'),
	(328, 30, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 17:22:26', 'v2_tenant'),
	(329, 30, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 17:23:49', 'v2_tenant'),
	(330, 26, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 17:24:12', 'v2_tenant'),
	(331, 30, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 17:25:02', 'v2_tenant'),
	(332, 26, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 17:25:15', 'v2_tenant'),
	(333, 30, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 17:29:12', 'v2_tenant'),
	(334, 30, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 17:29:14', 'v2_tenant'),
	(335, 30, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 17:29:21', 'v2_tenant'),
	(336, 30, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 17:29:21', 'v2_tenant'),
	(337, 30, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 17:29:21', 'v2_tenant'),
	(338, 30, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 17:29:21', 'v2_tenant'),
	(339, 30, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 17:29:21', 'v2_tenant'),
	(340, 30, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 17:29:23', 'v2_tenant'),
	(341, 30, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 17:29:25', 'v2_tenant'),
	(342, 30, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 17:29:25', 'v2_tenant'),
	(343, 30, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 17:29:26', 'v2_tenant'),
	(344, 30, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 17:29:26', 'v2_tenant'),
	(345, 30, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 17:29:26', 'v2_tenant'),
	(346, 30, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 17:29:27', 'v2_tenant'),
	(347, 30, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 17:29:27', 'v2_tenant'),
	(348, 30, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 17:29:27', 'v2_tenant'),
	(349, 30, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 17:29:27', 'v2_tenant'),
	(350, 30, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 17:29:32', 'v2_tenant'),
	(351, 30, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 17:29:35', 'v2_tenant'),
	(352, 30, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 17:29:37', 'v2_tenant'),
	(353, 30, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 17:29:39', 'v2_tenant'),
	(354, 30, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 17:29:41', 'v2_tenant'),
	(355, 30, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 17:32:02', 'v2_tenant'),
	(356, 26, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 17:32:07', 'v2_tenant'),
	(357, 26, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 17:32:13', 'v2_tenant'),
	(358, 26, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 17:32:20', 'v2_tenant'),
	(359, 26, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 17:40:37', 'v2_tenant'),
	(360, 26, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 17:40:44', 'v2_tenant'),
	(361, 26, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 17:40:53', 'v2_tenant'),
	(362, 30, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 17:41:22', 'v2_tenant'),
	(363, 26, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 17:41:26', 'v2_tenant'),
	(364, 30, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 17:42:14', 'v2_tenant'),
	(365, 30, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 18:03:12', 'v2_tenant'),
	(366, 30, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 18:03:15', 'v2_tenant'),
	(367, 26, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 18:03:26', 'v2_tenant'),
	(368, 30, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 18:05:27', 'v2_tenant'),
	(369, 30, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 18:05:28', 'v2_tenant'),
	(370, 26, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 18:05:31', 'v2_tenant'),
	(371, 30, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 18:11:48', 'v2_tenant'),
	(372, 26, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 18:11:52', 'v2_tenant'),
	(373, 28, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 18:30:09', 'v2_tenant'),
	(374, 29, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 18:30:12', 'v2_tenant'),
	(375, 29, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 18:30:15', 'v2_tenant'),
	(376, 29, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 18:30:18', 'v2_tenant'),
	(377, 29, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 18:30:21', 'v2_tenant'),
	(378, 29, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 18:30:24', 'v2_tenant'),
	(379, 29, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 18:30:27', 'v2_tenant'),
	(380, 29, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 18:30:30', 'v2_tenant'),
	(381, 29, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 18:30:33', 'v2_tenant'),
	(382, 29, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 18:30:36', 'v2_tenant'),
	(383, 30, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 18:40:52', 'v2_tenant'),
	(384, 26, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 18:40:55', 'v2_tenant'),
	(385, 28, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 18:43:39', 'v2_tenant'),
	(386, 29, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 18:43:43', 'v2_tenant'),
	(387, 29, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 18:43:46', 'v2_tenant'),
	(388, 29, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 18:43:49', 'v2_tenant'),
	(389, 29, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 18:43:52', 'v2_tenant'),
	(390, 29, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 18:43:55', 'v2_tenant'),
	(391, 29, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 18:43:58', 'v2_tenant'),
	(392, 29, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 18:44:01', 'v2_tenant'),
	(393, 29, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 18:44:04', 'v2_tenant'),
	(394, 29, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 18:44:07', 'v2_tenant'),
	(395, 29, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 18:44:10', 'v2_tenant'),
	(396, 29, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 18:44:13', 'v2_tenant'),
	(397, 29, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 18:44:16', 'v2_tenant'),
	(398, 29, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 18:44:19', 'v2_tenant'),
	(399, 29, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 18:44:22', 'v2_tenant'),
	(400, 29, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 18:44:25', 'v2_tenant'),
	(401, 29, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 18:44:28', 'v2_tenant'),
	(402, 29, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 18:44:30', 'v2_tenant'),
	(403, 30, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 18:51:44', 'v2_tenant'),
	(404, 26, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 18:51:47', 'v2_tenant'),
	(405, 28, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 18:52:12', 'v2_tenant'),
	(406, 29, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 18:52:15', 'v2_tenant'),
	(407, 29, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 18:52:18', 'v2_tenant'),
	(408, 29, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 18:52:21', 'v2_tenant'),
	(409, 29, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 18:52:24', 'v2_tenant'),
	(410, 29, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 18:52:27', 'v2_tenant'),
	(411, 29, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 18:52:30', 'v2_tenant'),
	(412, 29, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 18:52:33', 'v2_tenant'),
	(413, 29, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 18:52:36', 'v2_tenant'),
	(414, 29, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 18:52:39', 'v2_tenant'),
	(415, 29, '127.0.0.1', 'anonymousUser', '200', NULL, '2021-01-24 18:52:42', 'v2_tenant'),
	(416, 31, '127.0.0.1', 'admin', '200', NULL, '2021-02-06 08:51:29', 'v2_tenant'),
	(417, 31, '127.0.0.1', 'admin', '200', NULL, '2021-02-06 09:01:50', 'v2_tenant'),
	(418, 31, '127.0.0.1', 'admin', '200', NULL, '2021-02-06 09:10:47', 'v2_tenant'),
	(419, 31, '127.0.0.1', 'admin', '200', NULL, '2021-02-06 09:11:23', 'v2_tenant'),
	(420, 31, '127.0.0.1', 'admin', '200', NULL, '2021-02-06 09:18:55', 'v2_tenant'),
	(421, 31, '127.0.0.1', 'admin', '200', NULL, '2021-02-06 09:23:17', 'v2_tenant'),
	(422, 31, '127.0.0.1', 'admin', '200', NULL, '2021-02-06 19:30:37', 'v2_tenant'),
	(423, 31, '127.0.0.1', 'admin', '200', NULL, '2021-02-06 19:32:13', 'v2_tenant'),
	(424, 31, '127.0.0.1', 'admin', '200', NULL, '2021-02-06 19:42:54', 'v2_tenant'),
	(425, 31, '127.0.0.1', 'admin', '200', NULL, '2021-02-06 19:50:26', 'v2_tenant'),
	(426, 31, '127.0.0.1', 'admin', '200', NULL, '2021-02-06 19:58:34', 'v2_tenant'),
	(427, 32, '127.0.0.1', 'admin', '200', NULL, '2021-02-08 14:29:32', 'v2_tenant'),
	(428, 32, '127.0.0.1', 'admin', '200', NULL, '2021-02-08 15:04:12', 'v2_tenant'),
	(429, 32, '127.0.0.1', 'admin', '200', NULL, '2021-02-09 07:25:22', 'v2_tenant'),
	(430, 32, '127.0.0.1', 'admin', '200', NULL, '2021-02-09 07:48:22', 'v2_tenant'),
	(431, 33, '127.0.0.1', 'admin', '200', NULL, '2021-02-09 08:02:44', 'v2_tenant'),
	(432, 33, '127.0.0.1', 'admin', '200', NULL, '2021-02-09 08:02:54', 'v2_tenant'),
	(433, 33, '127.0.0.1', 'admin', '200', NULL, '2021-02-09 08:08:03', 'v2_tenant'),
	(434, 33, '127.0.0.1', 'admin', '200', NULL, '2021-02-09 08:09:55', 'v2_tenant'),
	(435, 33, '127.0.0.1', 'admin', '200', NULL, '2021-02-09 08:11:07', 'v2_tenant'),
	(436, 33, '127.0.0.1', 'admin', '200', NULL, '2021-02-09 08:21:43', 'v2_tenant'),
	(437, 33, '127.0.0.1', 'admin', '200', NULL, '2021-02-09 08:30:06', 'v2_tenant'),
	(438, 33, '127.0.0.1', 'admin', '200', NULL, '2021-02-09 10:34:18', 'v2_tenant'),
	(439, 32, '127.0.0.1', 'admin', '200', NULL, '2021-02-09 10:34:55', 'v2_tenant'),
	(440, 32, '127.0.0.1', 'admin', '200', NULL, '2021-02-09 10:44:27', 'v2_tenant'),
	(441, 31, '127.0.0.1', 'admin', '200', NULL, '2021-02-11 05:12:17', 'v2_tenant'),
	(442, 31, '127.0.0.1', 'admin', '200', NULL, '2021-02-11 05:13:15', 'v2_tenant'),
	(443, 31, '127.0.0.1', 'admin', '200', NULL, '2021-02-11 06:46:26', 'v2_tenant'),
	(444, 31, '127.0.0.1', 'admin', '200', NULL, '2021-02-11 06:49:25', 'v2_tenant'),
	(445, 34, '127.0.0.1', 'admin', '200', NULL, '2021-02-11 06:49:25', 'v2_tenant'),
	(446, 31, '127.0.0.1', 'admin', '200', NULL, '2021-02-11 06:52:59', 'v2_tenant'),
	(447, 34, '127.0.0.1', 'admin', '200', NULL, '2021-02-11 06:52:59', 'v2_tenant'),
	(448, 31, '127.0.0.1', 'admin', '200', NULL, '2021-02-11 17:08:49', 'v2_tenant'),
	(449, 34, '127.0.0.1', 'admin', '200', NULL, '2021-02-11 17:08:49', 'v2_tenant'),
	(450, 35, '127.0.0.1', 'admin', '200', NULL, '2021-02-11 20:35:23', 'v2_tenant'),
	(451, 35, '127.0.0.1', 'admin', '200', NULL, '2021-02-12 10:13:44', 'v2_tenant'),
	(452, 36, '127.0.0.1', 'admin', '200', NULL, '2021-02-12 10:13:58', 'v2_tenant'),
	(453, 37, '127.0.0.1', 'admin', '200', NULL, '2021-02-12 10:14:26', 'v2_tenant'),
	(454, 37, '127.0.0.1', 'admin', '200', NULL, '2021-02-12 10:14:48', 'v2_tenant'),
	(455, 37, '127.0.0.1', 'admin', '200', NULL, '2021-02-12 10:15:01', 'v2_tenant'),
	(456, 38, '127.0.0.1', 'admin', '200', NULL, '2021-02-12 10:15:09', 'v2_tenant'),
	(457, 31, '127.0.0.1', 'admin', '200', NULL, '2021-02-12 16:24:42', 'v2_tenant'),
	(458, 27, '127.0.0.1', 'admin', '404', NULL, '2021-02-12 16:24:42', 'v2_tenant'),
	(459, 31, '127.0.0.1', 'admin', '200', NULL, '2021-02-12 16:25:04', 'v2_tenant'),
	(460, 27, '127.0.0.1', 'admin', '404', NULL, '2021-02-12 16:25:04', 'v2_tenant'),
	(461, 39, '127.0.0.1', 'admin', '200', NULL, '2021-02-12 16:27:14', 'v2_tenant'),
	(462, 34, '127.0.0.1', 'admin', '200', NULL, '2021-02-12 16:27:14', 'v2_tenant'),
	(463, 39, '127.0.0.1', 'admin', '200', NULL, '2021-02-14 07:56:43', 'v2_tenant'),
	(464, 39, '127.0.0.1', 'admin', '200', NULL, '2021-02-14 07:56:51', 'v2_tenant'),
	(465, 34, '127.0.0.1', 'admin', '200', NULL, '2021-02-14 07:56:51', 'v2_tenant'),
	(466, 34, '127.0.0.1', 'admin', '200', NULL, '2021-02-14 07:57:04', 'v2_tenant'),
	(467, 32, '127.0.0.1', 'admin', '200', NULL, '2021-02-14 07:58:57', 'v2_tenant'),
	(468, 32, '127.0.0.1', 'admin', '200', NULL, '2021-02-14 08:04:40', 'v2_tenant'),
	(469, 32, '127.0.0.1', 'admin', '200', NULL, '2021-02-14 08:04:57', 'v2_tenant'),
	(470, 32, '127.0.0.1', 'admin', '200', NULL, '2021-02-14 08:09:30', 'v2_tenant'),
	(471, 32, '127.0.0.1', 'admin', '200', NULL, '2021-02-14 08:10:00', 'v2_tenant'),
	(472, 32, '127.0.0.1', 'admin', '200', NULL, '2021-02-14 08:10:26', 'v2_tenant'),
	(473, 32, '127.0.0.1', 'admin', '200', NULL, '2021-02-14 08:12:00', 'v2_tenant'),
	(474, 32, '127.0.0.1', 'admin', '200', NULL, '2021-02-14 08:12:23', 'v2_tenant'),
	(475, 32, '127.0.0.1', 'admin', '200', NULL, '2021-02-14 08:12:43', 'v2_tenant'),
	(476, 32, '127.0.0.1', 'admin', '200', NULL, '2021-02-14 08:17:37', 'v2_tenant'),
	(477, 35, '127.0.0.1', 'admin', '200', NULL, '2021-02-14 08:18:22', 'v2_tenant'),
	(478, 35, '127.0.0.1', 'admin', '200', NULL, '2021-02-14 08:18:48', 'v2_tenant'),
	(479, 35, '127.0.0.1', 'admin', '200', NULL, '2021-02-14 08:19:06', 'v2_tenant'),
	(480, 35, '127.0.0.1', 'admin', '200', NULL, '2021-02-14 08:20:51', 'v2_tenant'),
	(481, 36, '127.0.0.1', 'admin', '200', NULL, '2021-02-14 08:20:52', 'v2_tenant'),
	(482, 35, '127.0.0.1', 'admin', '200', NULL, '2021-02-14 08:21:50', 'v2_tenant'),
	(483, 36, '127.0.0.1', 'admin', '200', NULL, '2021-02-14 08:21:50', 'v2_tenant'),
	(484, 35, '127.0.0.1', 'admin', '200', NULL, '2021-02-14 08:23:18', 'v2_tenant'),
	(485, 36, '127.0.0.1', 'admin', '200', NULL, '2021-02-14 08:23:19', 'v2_tenant'),
	(486, 35, '127.0.0.1', 'admin', '200', NULL, '2021-02-14 08:24:00', 'v2_tenant'),
	(487, 36, '127.0.0.1', 'admin', '200', NULL, '2021-02-14 08:24:00', 'v2_tenant'),
	(488, 36, '127.0.0.1', 'admin', '200', NULL, '2021-02-14 08:24:42', 'v2_tenant'),
	(489, 35, '127.0.0.1', 'admin', '200', NULL, '2021-02-14 08:24:42', 'v2_tenant'),
	(490, 35, '127.0.0.1', 'admin', '200', NULL, '2021-02-14 08:34:24', 'v2_tenant'),
	(491, 36, '127.0.0.1', 'admin', '200', NULL, '2021-02-14 08:34:24', 'v2_tenant'),
	(492, 35, '127.0.0.1', 'admin', '200', NULL, '2021-02-14 08:37:49', 'v2_tenant'),
	(493, 36, '127.0.0.1', 'admin', '200', NULL, '2021-02-14 08:37:49', 'v2_tenant'),
	(494, 36, '127.0.0.1', 'admin', '200', NULL, '2021-02-14 08:37:57', 'v2_tenant'),
	(495, 35, '127.0.0.1', 'admin', '200', NULL, '2021-02-14 08:37:57', 'v2_tenant'),
	(496, 40, '127.0.0.1', 'admin', '200', NULL, '2021-02-14 09:02:26', 'v2_tenant'),
	(497, 41, '127.0.0.1', 'admin', '200', NULL, '2021-02-14 09:02:26', 'v2_tenant'),
	(498, 32, '127.0.0.1', 'admin', '200', NULL, '2021-02-14 09:02:33', 'v2_tenant'),
	(499, 36, '127.0.0.1', 'admin', '200', NULL, '2021-02-14 09:03:46', 'v2_tenant'),
	(500, 35, '127.0.0.1', 'admin', '200', NULL, '2021-02-14 09:03:46', 'v2_tenant'),
	(501, 32, '127.0.0.1', 'admin', '200', NULL, '2021-02-14 09:04:15', 'v2_tenant'),
	(502, 35, '127.0.0.1', 'admin', '200', NULL, '2021-02-14 09:04:19', 'v2_tenant'),
	(503, 36, '127.0.0.1', 'admin', '200', NULL, '2021-02-14 09:04:19', 'v2_tenant'),
	(504, 32, '127.0.0.1', 'admin', '200', NULL, '2021-02-14 09:04:21', 'v2_tenant'),
	(505, 35, '127.0.0.1', 'admin', '200', NULL, '2021-02-14 09:04:24', 'v2_tenant'),
	(506, 36, '127.0.0.1', 'admin', '200', NULL, '2021-02-14 09:04:24', 'v2_tenant'),
	(507, 39, '127.0.0.1', 'admin', '200', NULL, '2021-02-15 07:23:51', 'v2_tenant'),
	(508, 34, '127.0.0.1', 'admin', '200', NULL, '2021-02-15 07:23:51', 'v2_tenant'),
	(509, 32, '127.0.0.1', 'admin', '200', NULL, '2021-02-15 07:24:03', 'v2_tenant'),
	(510, 36, '127.0.0.1', 'admin', '200', NULL, '2021-02-15 07:24:07', 'v2_tenant'),
	(511, 35, '127.0.0.1', 'admin', '200', NULL, '2021-02-15 07:24:07', 'v2_tenant'),
	(512, 36, '127.0.0.1', 'admin', '200', NULL, '2021-02-15 07:34:30', 'v2_tenant'),
	(513, 35, '127.0.0.1', 'admin', '200', NULL, '2021-02-15 07:34:30', 'v2_tenant'),
	(514, 35, '127.0.0.1', 'admin', '200', NULL, '2021-02-15 07:34:41', 'v2_tenant'),
	(515, 36, '127.0.0.1', 'admin', '200', NULL, '2021-02-15 07:34:41', 'v2_tenant'),
	(516, 36, '127.0.0.1', 'admin', '200', NULL, '2021-02-15 07:35:28', 'v2_tenant'),
	(517, 35, '127.0.0.1', 'admin', '200', NULL, '2021-02-15 07:35:28', 'v2_tenant'),
	(518, 39, '127.0.0.1', 'admin', '200', NULL, '2021-02-15 07:45:40', 'v2_tenant'),
	(519, 34, '127.0.0.1', 'admin', '200', NULL, '2021-02-15 07:45:41', 'v2_tenant'),
	(520, 32, '127.0.0.1', 'admin', '200', NULL, '2021-02-15 07:45:46', 'v2_tenant'),
	(521, 35, '127.0.0.1', 'admin', '200', NULL, '2021-02-15 07:45:49', 'v2_tenant'),
	(522, 36, '127.0.0.1', 'admin', '200', NULL, '2021-02-15 07:45:49', 'v2_tenant'),
	(523, 35, '127.0.0.1', 'admin', '200', NULL, '2021-02-15 07:49:02', 'v2_tenant'),
	(524, 36, '127.0.0.1', 'admin', '200', NULL, '2021-02-15 07:49:02', 'v2_tenant'),
	(525, 36, '127.0.0.1', 'admin', '200', NULL, '2021-02-15 08:02:50', 'v2_tenant'),
	(526, 35, '127.0.0.1', 'admin', '200', NULL, '2021-02-15 08:02:50', 'v2_tenant'),
	(527, 39, '127.0.0.1', 'admin', '200', NULL, '2021-02-15 13:18:06', 'v2_tenant'),
	(528, 34, '127.0.0.1', 'admin', '200', NULL, '2021-02-15 13:18:06', 'v2_tenant'),
	(529, 32, '127.0.0.1', 'admin', '200', NULL, '2021-02-15 13:18:15', 'v2_tenant'),
	(530, 35, '127.0.0.1', 'admin', '200', NULL, '2021-02-15 13:18:23', 'v2_tenant'),
	(531, 36, '127.0.0.1', 'admin', '200', NULL, '2021-02-15 13:18:23', 'v2_tenant'),
	(532, 32, '127.0.0.1', 'admin', '200', NULL, '2021-02-15 13:20:00', 'v2_tenant'),
	(533, 36, '127.0.0.1', 'admin', '200', NULL, '2021-02-15 13:20:02', 'v2_tenant'),
	(534, 35, '127.0.0.1', 'admin', '200', NULL, '2021-02-15 13:20:02', 'v2_tenant'),
	(535, 35, '127.0.0.1', 'admin', '200', NULL, '2021-02-15 13:34:23', 'v2_tenant'),
	(536, 36, '127.0.0.1', 'admin', '200', NULL, '2021-02-15 13:34:23', 'v2_tenant'),
	(537, 39, '127.0.0.1', 'admin', '200', NULL, '2021-02-18 15:14:16', 'v2_tenant'),
	(538, 34, '127.0.0.1', 'admin', '200', NULL, '2021-02-18 15:14:16', 'v2_tenant'),
	(539, 39, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 09:51:55', 'v2_tenant'),
	(540, 34, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 09:51:55', 'v2_tenant'),
	(541, 4, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 09:51:55', 'v2_tenant'),
	(542, 42, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 09:52:02', 'v2_tenant'),
	(543, 32, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 09:52:02', 'v2_tenant'),
	(544, 43, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 09:55:03', 'v2_tenant'),
	(545, 46, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 09:55:03', 'v2_tenant'),
	(546, 44, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 09:55:03', 'v2_tenant'),
	(547, 45, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 09:55:03', 'v2_tenant'),
	(548, 48, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 09:55:03', 'v2_tenant'),
	(549, 47, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 09:55:03', 'v2_tenant'),
	(550, 49, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 09:55:03', 'v2_tenant'),
	(551, 27, '127.0.0.1', 'admin', '404', NULL, '2021-03-06 09:55:03', 'v2_tenant'),
	(552, 50, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 09:55:04', 'v2_tenant'),
	(553, 42, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:09:30', 'v2_tenant'),
	(554, 4, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:09:34', 'v2_tenant'),
	(555, 32, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:09:34', 'v2_tenant'),
	(556, 42, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:09:34', 'v2_tenant'),
	(557, 4, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:16:55', 'v2_tenant'),
	(558, 32, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:16:55', 'v2_tenant'),
	(559, 42, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:16:56', 'v2_tenant'),
	(560, 48, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:17:05', 'v2_tenant'),
	(561, 44, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:17:05', 'v2_tenant'),
	(562, 49, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:17:06', 'v2_tenant'),
	(563, 43, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:17:06', 'v2_tenant'),
	(564, 50, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:17:06', 'v2_tenant'),
	(565, 27, '127.0.0.1', 'admin', '404', NULL, '2021-03-06 10:17:06', 'v2_tenant'),
	(566, 47, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:17:06', 'v2_tenant'),
	(567, 46, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:17:06', 'v2_tenant'),
	(568, 45, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:17:06', 'v2_tenant'),
	(569, 42, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:26:52', 'v2_tenant'),
	(570, 4, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:26:59', 'v2_tenant'),
	(571, 42, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:26:59', 'v2_tenant'),
	(572, 32, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:27:00', 'v2_tenant'),
	(573, 49, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:27:16', 'v2_tenant'),
	(574, 48, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:27:16', 'v2_tenant'),
	(575, 44, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:27:16', 'v2_tenant'),
	(576, 47, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:27:16', 'v2_tenant'),
	(577, 27, '127.0.0.1', 'admin', '404', NULL, '2021-03-06 10:27:16', 'v2_tenant'),
	(578, 43, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:27:16', 'v2_tenant'),
	(579, 45, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:27:16', 'v2_tenant'),
	(580, 50, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:27:16', 'v2_tenant'),
	(581, 46, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:27:16', 'v2_tenant'),
	(582, 4, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:37:43', 'v2_tenant'),
	(583, 32, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:37:43', 'v2_tenant'),
	(584, 42, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:37:44', 'v2_tenant'),
	(585, 51, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:37:51', 'v2_tenant'),
	(586, 48, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:37:51', 'v2_tenant'),
	(587, 47, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:37:51', 'v2_tenant'),
	(588, 44, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:37:51', 'v2_tenant'),
	(589, 43, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:37:51', 'v2_tenant'),
	(590, 45, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:37:51', 'v2_tenant'),
	(591, 50, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:37:51', 'v2_tenant'),
	(592, 46, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:37:51', 'v2_tenant'),
	(593, 4, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:48:24', 'v2_tenant'),
	(594, 42, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:48:24', 'v2_tenant'),
	(595, 32, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:48:24', 'v2_tenant'),
	(596, 48, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:48:30', 'v2_tenant'),
	(597, 47, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:48:30', 'v2_tenant'),
	(598, 44, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:48:30', 'v2_tenant'),
	(599, 43, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:48:30', 'v2_tenant'),
	(600, 46, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:48:30', 'v2_tenant'),
	(601, 50, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:48:30', 'v2_tenant'),
	(602, 51, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:48:30', 'v2_tenant'),
	(603, 45, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:48:30', 'v2_tenant'),
	(604, 4, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:49:48', 'v2_tenant'),
	(605, 32, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:49:48', 'v2_tenant'),
	(606, 42, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:49:48', 'v2_tenant'),
	(607, 48, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:50:07', 'v2_tenant'),
	(608, 46, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:50:07', 'v2_tenant'),
	(609, 44, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:50:07', 'v2_tenant'),
	(610, 50, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:50:07', 'v2_tenant'),
	(611, 47, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:50:07', 'v2_tenant'),
	(612, 45, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:50:07', 'v2_tenant'),
	(613, 51, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:50:07', 'v2_tenant'),
	(614, 43, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:50:07', 'v2_tenant'),
	(615, 4, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:50:11', 'v2_tenant'),
	(616, 32, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:50:11', 'v2_tenant'),
	(617, 42, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:50:11', 'v2_tenant'),
	(618, 51, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:50:18', 'v2_tenant'),
	(619, 48, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:50:18', 'v2_tenant'),
	(620, 50, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:50:18', 'v2_tenant'),
	(621, 43, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:50:18', 'v2_tenant'),
	(622, 44, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:50:18', 'v2_tenant'),
	(623, 47, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:50:19', 'v2_tenant'),
	(624, 46, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:50:19', 'v2_tenant'),
	(625, 45, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:50:19', 'v2_tenant'),
	(626, 4, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:50:28', 'v2_tenant'),
	(627, 32, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:50:28', 'v2_tenant'),
	(628, 42, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:50:28', 'v2_tenant'),
	(629, 51, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:52:41', 'v2_tenant'),
	(630, 46, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:52:41', 'v2_tenant'),
	(631, 43, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:52:41', 'v2_tenant'),
	(632, 48, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:52:41', 'v2_tenant'),
	(633, 45, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:52:41', 'v2_tenant'),
	(634, 44, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:52:41', 'v2_tenant'),
	(635, 47, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:52:41', 'v2_tenant'),
	(636, 50, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:52:41', 'v2_tenant'),
	(637, 42, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:52:45', 'v2_tenant'),
	(638, 53, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:53:23', 'v2_tenant'),
	(639, 52, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:53:23', 'v2_tenant'),
	(640, 54, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:53:23', 'v2_tenant'),
	(641, 55, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:53:24', 'v2_tenant'),
	(642, 32, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:56:05', 'v2_tenant'),
	(643, 42, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:56:05', 'v2_tenant'),
	(644, 51, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:56:07', 'v2_tenant'),
	(645, 48, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:56:07', 'v2_tenant'),
	(646, 47, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:56:07', 'v2_tenant'),
	(647, 44, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:56:07', 'v2_tenant'),
	(648, 46, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:56:07', 'v2_tenant'),
	(649, 43, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:56:07', 'v2_tenant'),
	(650, 45, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:56:07', 'v2_tenant'),
	(651, 50, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:56:07', 'v2_tenant'),
	(652, 42, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:56:14', 'v2_tenant'),
	(653, 32, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:56:22', 'v2_tenant'),
	(654, 56, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:56:22', 'v2_tenant'),
	(655, 57, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:56:22', 'v2_tenant'),
	(656, 58, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:56:22', 'v2_tenant'),
	(657, 57, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:56:22', 'v2_tenant'),
	(658, 56, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:56:22', 'v2_tenant'),
	(659, 56, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:56:26', 'v2_tenant'),
	(660, 57, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:56:26', 'v2_tenant'),
	(661, 59, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:56:32', 'v2_tenant'),
	(662, 59, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:56:32', 'v2_tenant'),
	(663, 59, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:56:33', 'v2_tenant'),
	(664, 59, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:56:33', 'v2_tenant'),
	(665, 59, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:56:33', 'v2_tenant'),
	(666, 59, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:56:33', 'v2_tenant'),
	(667, 59, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:56:34', 'v2_tenant'),
	(668, 59, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:56:34', 'v2_tenant'),
	(669, 56, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:56:48', 'v2_tenant'),
	(670, 57, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:56:48', 'v2_tenant'),
	(671, 60, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:56:53', 'v2_tenant'),
	(672, 60, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:56:53', 'v2_tenant'),
	(673, 60, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:56:53', 'v2_tenant'),
	(674, 60, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:56:54', 'v2_tenant'),
	(675, 60, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:56:54', 'v2_tenant'),
	(676, 60, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:56:56', 'v2_tenant'),
	(677, 60, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:56:56', 'v2_tenant'),
	(678, 60, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:56:56', 'v2_tenant'),
	(679, 60, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:56:56', 'v2_tenant'),
	(680, 60, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:56:56', 'v2_tenant'),
	(681, 32, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:57:08', 'v2_tenant'),
	(682, 62, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:57:08', 'v2_tenant'),
	(683, 60, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:57:15', 'v2_tenant'),
	(684, 60, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:57:15', 'v2_tenant'),
	(685, 60, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:57:15', 'v2_tenant'),
	(686, 60, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:57:16', 'v2_tenant'),
	(687, 60, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:57:17', 'v2_tenant'),
	(688, 60, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:57:18', 'v2_tenant'),
	(689, 60, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:57:18', 'v2_tenant'),
	(690, 60, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:57:18', 'v2_tenant'),
	(691, 60, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:57:18', 'v2_tenant'),
	(692, 60, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:57:19', 'v2_tenant'),
	(693, 60, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:57:20', 'v2_tenant'),
	(694, 60, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:57:25', 'v2_tenant'),
	(695, 60, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:57:25', 'v2_tenant'),
	(696, 60, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:57:25', 'v2_tenant'),
	(697, 60, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:57:26', 'v2_tenant'),
	(698, 60, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:57:27', 'v2_tenant'),
	(699, 60, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:57:33', 'v2_tenant'),
	(700, 60, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:57:33', 'v2_tenant'),
	(701, 60, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:57:33', 'v2_tenant'),
	(702, 60, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:57:33', 'v2_tenant'),
	(703, 60, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:57:34', 'v2_tenant'),
	(704, 60, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:57:34', 'v2_tenant'),
	(705, 60, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:57:34', 'v2_tenant'),
	(706, 60, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:57:34', 'v2_tenant'),
	(707, 60, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:57:35', 'v2_tenant'),
	(708, 60, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:57:35', 'v2_tenant'),
	(709, 60, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:57:35', 'v2_tenant'),
	(710, 60, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:57:35', 'v2_tenant'),
	(711, 60, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:57:35', 'v2_tenant'),
	(712, 60, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:57:36', 'v2_tenant'),
	(713, 60, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:57:36', 'v2_tenant'),
	(714, 60, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:57:36', 'v2_tenant'),
	(715, 60, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:57:36', 'v2_tenant'),
	(716, 63, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:57:57', 'v2_tenant'),
	(717, 62, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:57:57', 'v2_tenant'),
	(718, 57, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:58:06', 'v2_tenant'),
	(719, 56, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:58:06', 'v2_tenant'),
	(720, 60, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:58:11', 'v2_tenant'),
	(721, 60, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:58:11', 'v2_tenant'),
	(722, 60, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:58:15', 'v2_tenant'),
	(723, 60, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:58:16', 'v2_tenant'),
	(724, 60, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:58:17', 'v2_tenant'),
	(725, 60, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:58:17', 'v2_tenant'),
	(726, 60, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:58:17', 'v2_tenant'),
	(727, 60, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:58:18', 'v2_tenant'),
	(728, 60, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:58:18', 'v2_tenant'),
	(729, 60, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:58:19', 'v2_tenant'),
	(730, 60, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:58:19', 'v2_tenant'),
	(731, 60, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:58:19', 'v2_tenant'),
	(732, 60, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:58:20', 'v2_tenant'),
	(733, 60, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:58:20', 'v2_tenant'),
	(734, 60, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:58:21', 'v2_tenant'),
	(735, 60, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:58:21', 'v2_tenant'),
	(736, 60, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:58:21', 'v2_tenant'),
	(737, 60, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:58:21', 'v2_tenant'),
	(738, 60, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:58:21', 'v2_tenant'),
	(739, 60, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:58:22', 'v2_tenant'),
	(740, 60, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:58:22', 'v2_tenant'),
	(741, 60, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:58:22', 'v2_tenant'),
	(742, 60, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:58:22', 'v2_tenant'),
	(743, 60, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:58:22', 'v2_tenant'),
	(744, 32, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:58:31', 'v2_tenant'),
	(745, 64, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:58:31', 'v2_tenant'),
	(746, 4, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:58:47', 'v2_tenant'),
	(747, 57, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:58:47', 'v2_tenant'),
	(748, 56, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:58:47', 'v2_tenant'),
	(749, 56, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:58:52', 'v2_tenant'),
	(750, 57, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:58:52', 'v2_tenant'),
	(751, 60, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:58:54', 'v2_tenant'),
	(752, 60, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:58:54', 'v2_tenant'),
	(753, 60, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:58:55', 'v2_tenant'),
	(754, 60, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:58:55', 'v2_tenant'),
	(755, 60, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:58:56', 'v2_tenant'),
	(756, 60, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:58:56', 'v2_tenant'),
	(757, 60, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:58:57', 'v2_tenant'),
	(758, 60, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:58:57', 'v2_tenant'),
	(759, 60, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:58:57', 'v2_tenant'),
	(760, 60, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:58:58', 'v2_tenant'),
	(761, 60, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:58:58', 'v2_tenant'),
	(762, 60, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:58:59', 'v2_tenant'),
	(763, 60, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:58:59', 'v2_tenant'),
	(764, 32, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:59:14', 'v2_tenant'),
	(765, 62, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:59:14', 'v2_tenant'),
	(766, 56, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:59:43', 'v2_tenant'),
	(767, 57, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:59:43', 'v2_tenant'),
	(768, 60, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:59:49', 'v2_tenant'),
	(769, 60, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:59:50', 'v2_tenant'),
	(770, 60, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:59:51', 'v2_tenant'),
	(771, 60, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:59:54', 'v2_tenant'),
	(772, 60, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:59:54', 'v2_tenant'),
	(773, 60, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:59:55', 'v2_tenant'),
	(774, 60, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:59:55', 'v2_tenant'),
	(775, 60, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:59:56', 'v2_tenant'),
	(776, 60, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:59:56', 'v2_tenant'),
	(777, 60, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:59:56', 'v2_tenant'),
	(778, 60, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:59:56', 'v2_tenant'),
	(779, 60, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:59:57', 'v2_tenant'),
	(780, 60, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 10:59:57', 'v2_tenant'),
	(781, 60, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:00:01', 'v2_tenant'),
	(782, 60, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:00:02', 'v2_tenant'),
	(783, 60, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:00:02', 'v2_tenant'),
	(784, 60, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:00:02', 'v2_tenant'),
	(785, 60, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:00:02', 'v2_tenant'),
	(786, 60, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:00:02', 'v2_tenant'),
	(787, 60, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:00:03', 'v2_tenant'),
	(788, 60, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:00:03', 'v2_tenant'),
	(789, 60, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:00:03', 'v2_tenant'),
	(790, 60, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:00:04', 'v2_tenant'),
	(791, 60, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:00:04', 'v2_tenant'),
	(792, 63, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:00:09', 'v2_tenant'),
	(793, 57, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:00:09', 'v2_tenant'),
	(794, 56, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:00:09', 'v2_tenant'),
	(795, 4, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:00:24', 'v2_tenant'),
	(796, 32, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:00:24', 'v2_tenant'),
	(797, 62, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:00:24', 'v2_tenant'),
	(798, 57, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:00:30', 'v2_tenant'),
	(799, 56, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:00:30', 'v2_tenant'),
	(800, 59, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:00:32', 'v2_tenant'),
	(801, 59, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:00:32', 'v2_tenant'),
	(802, 59, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:00:32', 'v2_tenant'),
	(803, 59, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:00:33', 'v2_tenant'),
	(804, 59, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:00:33', 'v2_tenant'),
	(805, 59, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:00:33', 'v2_tenant'),
	(806, 59, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:00:33', 'v2_tenant'),
	(807, 59, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:00:33', 'v2_tenant'),
	(808, 59, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:00:34', 'v2_tenant'),
	(809, 59, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:00:34', 'v2_tenant'),
	(810, 59, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:00:34', 'v2_tenant'),
	(811, 59, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:00:35', 'v2_tenant'),
	(812, 59, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:00:35', 'v2_tenant'),
	(813, 59, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:01:39', 'v2_tenant'),
	(814, 59, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:01:40', 'v2_tenant'),
	(815, 59, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:01:40', 'v2_tenant'),
	(816, 59, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:01:40', 'v2_tenant'),
	(817, 59, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:01:40', 'v2_tenant'),
	(818, 59, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:01:40', 'v2_tenant'),
	(819, 59, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:01:41', 'v2_tenant'),
	(820, 59, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:01:41', 'v2_tenant'),
	(821, 59, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:01:41', 'v2_tenant'),
	(822, 59, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:01:41', 'v2_tenant'),
	(823, 59, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:01:41', 'v2_tenant'),
	(824, 59, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:01:42', 'v2_tenant'),
	(825, 59, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:01:42', 'v2_tenant'),
	(826, 59, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:01:42', 'v2_tenant'),
	(827, 59, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:01:43', 'v2_tenant'),
	(828, 59, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:01:43', 'v2_tenant'),
	(829, 59, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:01:43', 'v2_tenant'),
	(830, 59, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:01:44', 'v2_tenant'),
	(831, 59, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:01:44', 'v2_tenant'),
	(832, 59, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:01:44', 'v2_tenant'),
	(833, 59, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:01:45', 'v2_tenant'),
	(834, 59, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:01:45', 'v2_tenant'),
	(835, 59, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:01:45', 'v2_tenant'),
	(836, 59, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:01:46', 'v2_tenant'),
	(837, 59, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:01:46', 'v2_tenant'),
	(838, 59, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:01:46', 'v2_tenant'),
	(839, 59, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:01:48', 'v2_tenant'),
	(840, 59, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:01:48', 'v2_tenant'),
	(841, 59, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:01:48', 'v2_tenant'),
	(842, 59, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:01:49', 'v2_tenant'),
	(843, 59, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:01:49', 'v2_tenant'),
	(844, 59, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:01:49', 'v2_tenant'),
	(845, 59, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:01:49', 'v2_tenant'),
	(846, 59, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:01:50', 'v2_tenant'),
	(847, 59, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:01:50', 'v2_tenant'),
	(848, 59, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:01:50', 'v2_tenant'),
	(849, 59, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:01:50', 'v2_tenant'),
	(850, 59, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:01:51', 'v2_tenant'),
	(851, 59, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:01:51', 'v2_tenant'),
	(852, 59, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:01:52', 'v2_tenant'),
	(853, 59, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:01:52', 'v2_tenant'),
	(854, 59, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:01:52', 'v2_tenant'),
	(855, 59, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:01:52', 'v2_tenant'),
	(856, 59, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:01:52', 'v2_tenant'),
	(857, 59, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:01:52', 'v2_tenant'),
	(858, 59, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:01:52', 'v2_tenant'),
	(859, 59, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:01:52', 'v2_tenant'),
	(860, 59, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:01:53', 'v2_tenant'),
	(861, 59, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:01:53', 'v2_tenant'),
	(862, 59, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:01:54', 'v2_tenant'),
	(863, 59, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:01:54', 'v2_tenant'),
	(864, 59, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:01:54', 'v2_tenant'),
	(865, 59, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:01:54', 'v2_tenant'),
	(866, 59, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:01:54', 'v2_tenant'),
	(867, 59, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:01:55', 'v2_tenant'),
	(868, 59, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:01:55', 'v2_tenant'),
	(869, 59, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:01:55', 'v2_tenant'),
	(870, 59, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:01:55', 'v2_tenant'),
	(871, 65, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:02:35', 'v2_tenant'),
	(872, 57, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:02:36', 'v2_tenant'),
	(873, 32, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:02:36', 'v2_tenant'),
	(874, 57, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:02:36', 'v2_tenant'),
	(875, 56, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:02:36', 'v2_tenant'),
	(876, 58, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:02:36', 'v2_tenant'),
	(877, 56, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:02:36', 'v2_tenant'),
	(878, 57, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:02:58', 'v2_tenant'),
	(879, 56, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:02:58', 'v2_tenant'),
	(880, 59, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:03:01', 'v2_tenant'),
	(881, 59, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:03:01', 'v2_tenant'),
	(882, 59, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:03:01', 'v2_tenant'),
	(883, 59, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:03:02', 'v2_tenant'),
	(884, 59, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:03:02', 'v2_tenant'),
	(885, 59, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:03:02', 'v2_tenant'),
	(886, 59, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:03:02', 'v2_tenant'),
	(887, 59, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:03:02', 'v2_tenant'),
	(888, 59, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:03:03', 'v2_tenant'),
	(889, 59, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:03:03', 'v2_tenant'),
	(890, 59, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:03:03', 'v2_tenant'),
	(891, 59, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:03:03', 'v2_tenant'),
	(892, 59, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:03:04', 'v2_tenant'),
	(893, 59, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:03:04', 'v2_tenant'),
	(894, 59, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:03:04', 'v2_tenant'),
	(895, 59, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:03:05', 'v2_tenant'),
	(896, 59, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:03:05', 'v2_tenant'),
	(897, 59, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:03:05', 'v2_tenant'),
	(898, 59, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:03:05', 'v2_tenant'),
	(899, 59, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:03:05', 'v2_tenant'),
	(900, 1, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:03:53', 'v2_tenant'),
	(901, 39, '127.0.0.1', 'indragupthaekanayaka@gmail.com', '200', NULL, '2021-03-06 11:05:01', 'v2_tenant'),
	(902, 34, '127.0.0.1', 'indragupthaekanayaka@gmail.com', '200', NULL, '2021-03-06 11:05:01', 'v2_tenant'),
	(903, 4, '127.0.0.1', 'indragupthaekanayaka@gmail.com', '200', NULL, '2021-03-06 11:05:01', 'v2_tenant'),
	(904, 39, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:05:27', 'v2_tenant'),
	(905, 34, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:05:27', 'v2_tenant'),
	(906, 4, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:05:27', 'v2_tenant'),
	(907, 32, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:05:29', 'v2_tenant'),
	(908, 42, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:05:29', 'v2_tenant'),
	(909, 51, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:05:32', 'v2_tenant'),
	(910, 48, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:05:32', 'v2_tenant'),
	(911, 50, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:05:32', 'v2_tenant'),
	(912, 44, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:05:32', 'v2_tenant'),
	(913, 43, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:05:32', 'v2_tenant'),
	(914, 47, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:05:32', 'v2_tenant'),
	(915, 46, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:05:32', 'v2_tenant'),
	(916, 45, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:05:32', 'v2_tenant'),
	(917, 66, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:05:38', 'v2_tenant'),
	(918, 66, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:05:38', 'v2_tenant'),
	(919, 66, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:05:39', 'v2_tenant'),
	(920, 66, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:05:39', 'v2_tenant'),
	(921, 66, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:05:39', 'v2_tenant'),
	(922, 66, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:05:39', 'v2_tenant'),
	(923, 42, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:05:56', 'v2_tenant'),
	(924, 56, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:06:02', 'v2_tenant'),
	(925, 57, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:06:02', 'v2_tenant'),
	(926, 32, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:06:02', 'v2_tenant'),
	(927, 57, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:06:02', 'v2_tenant'),
	(928, 58, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:06:02', 'v2_tenant'),
	(929, 56, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:06:02', 'v2_tenant'),
	(930, 32, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:06:09', 'v2_tenant'),
	(931, 64, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:06:09', 'v2_tenant'),
	(932, 36, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:06:15', 'v2_tenant'),
	(933, 35, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:06:15', 'v2_tenant'),
	(934, 35, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:06:32', 'v2_tenant'),
	(935, 36, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:06:32', 'v2_tenant'),
	(936, 35, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:06:57', 'v2_tenant'),
	(937, 36, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:06:57', 'v2_tenant'),
	(938, 35, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:07:34', 'v2_tenant'),
	(939, 36, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:07:34', 'v2_tenant'),
	(940, 36, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:09:01', 'v2_tenant'),
	(941, 35, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:09:01', 'v2_tenant'),
	(942, 35, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:16:06', 'v2_tenant'),
	(943, 36, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:16:06', 'v2_tenant'),
	(944, 36, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:18:24', 'v2_tenant'),
	(945, 35, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:18:24', 'v2_tenant'),
	(946, 37, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:18:24', 'v2_tenant'),
	(947, 38, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:18:24', 'v2_tenant'),
	(948, 36, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:27:53', 'v2_tenant'),
	(949, 35, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:27:53', 'v2_tenant'),
	(950, 38, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:27:53', 'v2_tenant'),
	(951, 37, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:27:53', 'v2_tenant'),
	(952, 36, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:28:02', 'v2_tenant'),
	(953, 35, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:28:02', 'v2_tenant'),
	(954, 37, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:28:02', 'v2_tenant'),
	(955, 38, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:28:02', 'v2_tenant'),
	(956, 67, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:28:30', 'v2_tenant'),
	(957, 67, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:28:45', 'v2_tenant'),
	(958, 32, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:33:38', 'v2_tenant'),
	(959, 4, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:33:39', 'v2_tenant'),
	(960, 64, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:33:39', 'v2_tenant'),
	(961, 36, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:33:50', 'v2_tenant'),
	(962, 35, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:33:50', 'v2_tenant'),
	(963, 37, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:33:50', 'v2_tenant'),
	(964, 38, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:33:50', 'v2_tenant'),
	(965, 67, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:34:14', 'v2_tenant'),
	(966, 64, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:34:14', 'v2_tenant'),
	(967, 32, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:34:25', 'v2_tenant'),
	(968, 42, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:34:25', 'v2_tenant'),
	(969, 48, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:34:28', 'v2_tenant'),
	(970, 44, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:34:29', 'v2_tenant'),
	(971, 47, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:34:29', 'v2_tenant'),
	(972, 43, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:34:29', 'v2_tenant'),
	(973, 50, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:34:29', 'v2_tenant'),
	(974, 51, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:34:29', 'v2_tenant'),
	(975, 46, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:34:29', 'v2_tenant'),
	(976, 45, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:34:29', 'v2_tenant'),
	(977, 66, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:36:31', 'v2_tenant'),
	(978, 42, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:41:24', 'v2_tenant'),
	(979, 51, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:41:25', 'v2_tenant'),
	(980, 48, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:41:25', 'v2_tenant'),
	(981, 50, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:41:25', 'v2_tenant'),
	(982, 45, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:41:25', 'v2_tenant'),
	(983, 44, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:41:26', 'v2_tenant'),
	(984, 47, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:41:26', 'v2_tenant'),
	(985, 43, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:41:26', 'v2_tenant'),
	(986, 46, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:41:26', 'v2_tenant'),
	(987, 66, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:41:34', 'v2_tenant'),
	(988, 68, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 11:41:36', 'v2_tenant'),
	(989, 27, '127.0.0.1', 'admin', '404', NULL, '2021-03-06 11:41:36', 'v2_tenant'),
	(990, 42, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:01:54', 'v2_tenant'),
	(991, 48, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:01:58', 'v2_tenant'),
	(992, 51, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:01:58', 'v2_tenant'),
	(993, 47, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:01:58', 'v2_tenant'),
	(994, 43, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:01:58', 'v2_tenant'),
	(995, 50, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:01:58', 'v2_tenant'),
	(996, 44, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:01:58', 'v2_tenant'),
	(997, 45, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:01:58', 'v2_tenant'),
	(998, 46, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:01:58', 'v2_tenant'),
	(999, 66, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:02:01', 'v2_tenant'),
	(1000, 68, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:02:05', 'v2_tenant'),
	(1001, 68, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:03:44', 'v2_tenant'),
	(1002, 68, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:03:54', 'v2_tenant'),
	(1003, 4, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:05:10', 'v2_tenant'),
	(1004, 57, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:05:10', 'v2_tenant'),
	(1005, 56, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:05:10', 'v2_tenant'),
	(1006, 4, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:05:10', 'v2_tenant'),
	(1007, 32, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:05:10', 'v2_tenant'),
	(1008, 42, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:05:10', 'v2_tenant'),
	(1009, 4, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:06:10', 'v2_tenant'),
	(1010, 32, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:06:10', 'v2_tenant'),
	(1011, 42, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:06:10', 'v2_tenant'),
	(1012, 4, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:06:10', 'v2_tenant'),
	(1013, 56, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:06:10', 'v2_tenant'),
	(1014, 57, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:06:10', 'v2_tenant'),
	(1015, 51, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:06:15', 'v2_tenant'),
	(1016, 48, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:06:15', 'v2_tenant'),
	(1017, 47, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:06:15', 'v2_tenant'),
	(1018, 50, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:06:15', 'v2_tenant'),
	(1019, 43, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:06:15', 'v2_tenant'),
	(1020, 44, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:06:15', 'v2_tenant'),
	(1021, 45, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:06:15', 'v2_tenant'),
	(1022, 46, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:06:15', 'v2_tenant'),
	(1023, 66, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:06:18', 'v2_tenant'),
	(1024, 68, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:06:20', 'v2_tenant'),
	(1025, 4, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:09:15', 'v2_tenant'),
	(1026, 56, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:09:15', 'v2_tenant'),
	(1027, 57, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:09:15', 'v2_tenant'),
	(1028, 4, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:09:15', 'v2_tenant'),
	(1029, 32, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:09:16', 'v2_tenant'),
	(1030, 42, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:09:16', 'v2_tenant'),
	(1031, 51, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:09:18', 'v2_tenant'),
	(1032, 44, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:09:18', 'v2_tenant'),
	(1033, 48, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:09:18', 'v2_tenant'),
	(1034, 47, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:09:18', 'v2_tenant'),
	(1035, 43, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:09:18', 'v2_tenant'),
	(1036, 50, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:09:18', 'v2_tenant'),
	(1037, 45, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:09:19', 'v2_tenant'),
	(1038, 46, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:09:19', 'v2_tenant'),
	(1039, 68, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:09:23', 'v2_tenant'),
	(1040, 4, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:11:08', 'v2_tenant'),
	(1041, 32, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:11:08', 'v2_tenant'),
	(1042, 42, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:11:08', 'v2_tenant'),
	(1043, 51, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:11:11', 'v2_tenant'),
	(1044, 48, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:11:11', 'v2_tenant'),
	(1045, 47, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:11:11', 'v2_tenant'),
	(1046, 44, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:11:11', 'v2_tenant'),
	(1047, 43, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:11:11', 'v2_tenant'),
	(1048, 50, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:11:11', 'v2_tenant'),
	(1049, 45, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:11:11', 'v2_tenant'),
	(1050, 46, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:11:11', 'v2_tenant'),
	(1051, 66, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:11:14', 'v2_tenant'),
	(1052, 68, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:11:16', 'v2_tenant'),
	(1053, 42, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:11:46', 'v2_tenant'),
	(1054, 51, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:11:49', 'v2_tenant'),
	(1055, 70, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:11:49', 'v2_tenant'),
	(1056, 69, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:11:49', 'v2_tenant'),
	(1057, 25, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:11:49', 'v2_tenant'),
	(1058, 32, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:11:49', 'v2_tenant'),
	(1059, 71, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:11:49', 'v2_tenant'),
	(1060, 27, '127.0.0.1', 'admin', '404', NULL, '2021-03-06 12:11:49', 'v2_tenant'),
	(1061, 72, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:11:49', 'v2_tenant'),
	(1062, 69, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:11:49', 'v2_tenant'),
	(1063, 71, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:11:49', 'v2_tenant'),
	(1064, 51, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:11:51', 'v2_tenant'),
	(1065, 69, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:11:51', 'v2_tenant'),
	(1066, 25, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:11:52', 'v2_tenant'),
	(1067, 70, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:11:52', 'v2_tenant'),
	(1068, 71, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:11:51', 'v2_tenant'),
	(1069, 27, '127.0.0.1', 'admin', '404', NULL, '2021-03-06 12:11:52', 'v2_tenant'),
	(1070, 73, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:11:52', 'v2_tenant'),
	(1071, 74, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:11:54', 'v2_tenant'),
	(1072, 75, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:11:57', 'v2_tenant'),
	(1073, 76, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:13:04', 'v2_tenant'),
	(1074, 69, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:13:05', 'v2_tenant'),
	(1075, 71, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:13:05', 'v2_tenant'),
	(1076, 51, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:13:05', 'v2_tenant'),
	(1077, 70, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:13:05', 'v2_tenant'),
	(1078, 32, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:13:05', 'v2_tenant'),
	(1079, 72, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:13:05', 'v2_tenant'),
	(1080, 25, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:13:05', 'v2_tenant'),
	(1081, 27, '127.0.0.1', 'admin', '404', NULL, '2021-03-06 12:13:05', 'v2_tenant'),
	(1082, 69, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:13:05', 'v2_tenant'),
	(1083, 71, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:13:05', 'v2_tenant'),
	(1084, 69, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:13:29', 'v2_tenant'),
	(1085, 71, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:13:29', 'v2_tenant'),
	(1086, 70, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:13:29', 'v2_tenant'),
	(1087, 73, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:13:29', 'v2_tenant'),
	(1088, 25, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:13:29', 'v2_tenant'),
	(1089, 51, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:13:29', 'v2_tenant'),
	(1090, 27, '127.0.0.1', 'admin', '404', NULL, '2021-03-06 12:13:29', 'v2_tenant'),
	(1091, 74, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:13:31', 'v2_tenant'),
	(1092, 75, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:13:34', 'v2_tenant'),
	(1093, 69, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:14:46', 'v2_tenant'),
	(1094, 51, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:14:46', 'v2_tenant'),
	(1095, 70, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:14:46', 'v2_tenant'),
	(1096, 32, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:14:46', 'v2_tenant'),
	(1097, 71, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:14:46', 'v2_tenant'),
	(1098, 25, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:14:46', 'v2_tenant'),
	(1099, 72, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:14:46', 'v2_tenant'),
	(1100, 69, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:14:46', 'v2_tenant'),
	(1101, 27, '127.0.0.1', 'admin', '404', NULL, '2021-03-06 12:14:46', 'v2_tenant'),
	(1102, 71, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:14:46', 'v2_tenant'),
	(1103, 51, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:14:49', 'v2_tenant'),
	(1104, 69, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:14:49', 'v2_tenant'),
	(1105, 71, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:14:49', 'v2_tenant'),
	(1106, 70, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:14:49', 'v2_tenant'),
	(1107, 25, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:14:49', 'v2_tenant'),
	(1108, 73, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:14:49', 'v2_tenant'),
	(1109, 27, '127.0.0.1', 'admin', '404', NULL, '2021-03-06 12:14:49', 'v2_tenant'),
	(1110, 74, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:14:51', 'v2_tenant'),
	(1111, 75, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:14:53', 'v2_tenant'),
	(1112, 76, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:15:47', 'v2_tenant'),
	(1113, 69, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:15:48', 'v2_tenant'),
	(1114, 51, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:15:48', 'v2_tenant'),
	(1115, 71, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:15:48', 'v2_tenant'),
	(1116, 72, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:15:48', 'v2_tenant'),
	(1117, 70, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:15:48', 'v2_tenant'),
	(1118, 25, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:15:48', 'v2_tenant'),
	(1119, 69, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:15:48', 'v2_tenant'),
	(1120, 32, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:15:48', 'v2_tenant'),
	(1121, 27, '127.0.0.1', 'admin', '404', NULL, '2021-03-06 12:15:48', 'v2_tenant'),
	(1122, 71, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:15:48', 'v2_tenant'),
	(1123, 32, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:15:56', 'v2_tenant'),
	(1124, 42, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:15:56', 'v2_tenant'),
	(1125, 43, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:16:00', 'v2_tenant'),
	(1126, 47, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:16:00', 'v2_tenant'),
	(1127, 51, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:16:00', 'v2_tenant'),
	(1128, 48, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:16:00', 'v2_tenant'),
	(1129, 44, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:16:00', 'v2_tenant'),
	(1130, 46, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:16:00', 'v2_tenant'),
	(1131, 50, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:16:00', 'v2_tenant'),
	(1132, 45, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:16:00', 'v2_tenant'),
	(1133, 66, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:16:03', 'v2_tenant'),
	(1134, 68, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:16:05', 'v2_tenant'),
	(1135, 77, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:16:33', 'v2_tenant'),
	(1136, 77, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:16:53', 'v2_tenant'),
	(1137, 78, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:17:33', 'v2_tenant'),
	(1138, 4, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:18:27', 'v2_tenant'),
	(1139, 32, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:18:27', 'v2_tenant'),
	(1140, 42, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:18:28', 'v2_tenant'),
	(1141, 4, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:18:28', 'v2_tenant'),
	(1142, 51, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:18:28', 'v2_tenant'),
	(1143, 69, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:18:28', 'v2_tenant'),
	(1144, 70, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:18:28', 'v2_tenant'),
	(1145, 71, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:18:28', 'v2_tenant'),
	(1146, 73, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:18:28', 'v2_tenant'),
	(1147, 25, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:18:28', 'v2_tenant'),
	(1148, 27, '127.0.0.1', 'admin', '404', NULL, '2021-03-06 12:18:28', 'v2_tenant'),
	(1149, 51, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:18:43', 'v2_tenant'),
	(1150, 44, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:18:43', 'v2_tenant'),
	(1151, 50, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:18:43', 'v2_tenant'),
	(1152, 43, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:18:43', 'v2_tenant'),
	(1153, 46, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:18:43', 'v2_tenant'),
	(1154, 45, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:18:43', 'v2_tenant'),
	(1155, 48, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:18:43', 'v2_tenant'),
	(1156, 47, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:18:43', 'v2_tenant'),
	(1157, 4, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:18:55', 'v2_tenant'),
	(1158, 32, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:18:55', 'v2_tenant'),
	(1159, 42, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:18:56', 'v2_tenant'),
	(1160, 4, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:18:56', 'v2_tenant'),
	(1161, 69, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:18:56', 'v2_tenant'),
	(1162, 70, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:18:56', 'v2_tenant'),
	(1163, 51, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:18:56', 'v2_tenant'),
	(1164, 71, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:18:56', 'v2_tenant'),
	(1165, 25, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:18:56', 'v2_tenant'),
	(1166, 73, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:18:56', 'v2_tenant'),
	(1167, 27, '127.0.0.1', 'admin', '404', NULL, '2021-03-06 12:18:56', 'v2_tenant'),
	(1168, 4, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:19:51', 'v2_tenant'),
	(1169, 32, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:19:51', 'v2_tenant'),
	(1170, 42, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:19:51', 'v2_tenant'),
	(1171, 4, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:19:52', 'v2_tenant'),
	(1172, 69, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:19:52', 'v2_tenant'),
	(1173, 51, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:19:52', 'v2_tenant'),
	(1174, 70, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:19:52', 'v2_tenant'),
	(1175, 71, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:19:52', 'v2_tenant'),
	(1176, 25, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:19:52', 'v2_tenant'),
	(1177, 73, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:19:52', 'v2_tenant'),
	(1178, 27, '127.0.0.1', 'admin', '404', NULL, '2021-03-06 12:19:52', 'v2_tenant'),
	(1179, 48, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:19:55', 'v2_tenant'),
	(1180, 51, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:19:55', 'v2_tenant'),
	(1181, 45, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:19:55', 'v2_tenant'),
	(1182, 46, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:19:55', 'v2_tenant'),
	(1183, 43, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:19:55', 'v2_tenant'),
	(1184, 44, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:19:55', 'v2_tenant'),
	(1185, 50, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:19:55', 'v2_tenant'),
	(1186, 47, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:19:55', 'v2_tenant'),
	(1187, 66, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:19:57', 'v2_tenant'),
	(1188, 68, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:19:58', 'v2_tenant'),
	(1189, 77, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:20:11', 'v2_tenant'),
	(1190, 77, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:20:20', 'v2_tenant'),
	(1191, 78, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:20:52', 'v2_tenant'),
	(1192, 79, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:23:01', 'v2_tenant'),
	(1193, 79, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:23:57', 'v2_tenant'),
	(1194, 79, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:26:12', 'v2_tenant'),
	(1195, 79, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:37:23', 'v2_tenant'),
	(1196, 42, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:39:29', 'v2_tenant'),
	(1197, 4, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:40:00', 'v2_tenant'),
	(1198, 32, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:40:00', 'v2_tenant'),
	(1199, 42, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:40:00', 'v2_tenant'),
	(1200, 4, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:40:19', 'v2_tenant'),
	(1201, 32, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:40:19', 'v2_tenant'),
	(1202, 42, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:40:19', 'v2_tenant'),
	(1203, 56, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:40:24', 'v2_tenant'),
	(1204, 57, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:40:24', 'v2_tenant'),
	(1205, 32, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:40:24', 'v2_tenant'),
	(1206, 57, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:40:24', 'v2_tenant'),
	(1207, 56, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:40:24', 'v2_tenant'),
	(1208, 58, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:40:24', 'v2_tenant'),
	(1209, 56, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:40:31', 'v2_tenant'),
	(1210, 57, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:40:32', 'v2_tenant'),
	(1211, 80, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:40:32', 'v2_tenant'),
	(1212, 32, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:40:38', 'v2_tenant'),
	(1213, 64, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:40:38', 'v2_tenant'),
	(1214, 36, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:40:42', 'v2_tenant'),
	(1215, 35, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:40:42', 'v2_tenant'),
	(1216, 37, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:40:42', 'v2_tenant'),
	(1217, 38, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:40:42', 'v2_tenant'),
	(1218, 67, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:41:07', 'v2_tenant'),
	(1219, 64, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:41:07', 'v2_tenant'),
	(1220, 32, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:41:12', 'v2_tenant'),
	(1221, 81, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:41:12', 'v2_tenant'),
	(1222, 82, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:41:12', 'v2_tenant'),
	(1223, 83, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:41:18', 'v2_tenant'),
	(1224, 56, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:41:19', 'v2_tenant'),
	(1225, 57, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:41:19', 'v2_tenant'),
	(1226, 57, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:41:19', 'v2_tenant'),
	(1227, 32, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:41:19', 'v2_tenant'),
	(1228, 58, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:41:19', 'v2_tenant'),
	(1229, 56, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:41:19', 'v2_tenant'),
	(1230, 32, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:41:21', 'v2_tenant'),
	(1231, 64, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:41:21', 'v2_tenant'),
	(1232, 36, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:41:25', 'v2_tenant'),
	(1233, 35, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:41:25', 'v2_tenant'),
	(1234, 37, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:41:25', 'v2_tenant'),
	(1235, 38, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:41:25', 'v2_tenant'),
	(1236, 81, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:41:33', 'v2_tenant'),
	(1237, 32, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:41:33', 'v2_tenant'),
	(1238, 82, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:41:33', 'v2_tenant'),
	(1239, 32, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:41:39', 'v2_tenant'),
	(1240, 42, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:41:39', 'v2_tenant'),
	(1241, 39, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:41:53', 'v2_tenant'),
	(1242, 34, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:41:53', 'v2_tenant'),
	(1243, 4, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:41:53', 'v2_tenant'),
	(1244, 32, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:41:58', 'v2_tenant'),
	(1245, 42, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:41:58', 'v2_tenant'),
	(1246, 4, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:47:43', 'v2_tenant'),
	(1247, 32, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:47:43', 'v2_tenant'),
	(1248, 42, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:47:43', 'v2_tenant'),
	(1249, 4, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:48:14', 'v2_tenant'),
	(1250, 32, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:48:14', 'v2_tenant'),
	(1251, 42, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:48:14', 'v2_tenant'),
	(1252, 4, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:52:33', 'v2_tenant'),
	(1253, 32, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:52:33', 'v2_tenant'),
	(1254, 42, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:52:33', 'v2_tenant'),
	(1255, 4, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:59:32', 'v2_tenant'),
	(1256, 32, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:59:32', 'v2_tenant'),
	(1257, 42, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 12:59:32', 'v2_tenant'),
	(1258, 4, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 13:02:51', 'v2_tenant'),
	(1259, 32, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 13:02:51', 'v2_tenant'),
	(1260, 42, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 13:02:51', 'v2_tenant'),
	(1261, 84, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 13:03:36', 'v2_tenant'),
	(1262, 85, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 13:03:36', 'v2_tenant'),
	(1263, 48, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 13:03:36', 'v2_tenant'),
	(1264, 44, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 13:03:36', 'v2_tenant'),
	(1265, 50, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 13:03:36', 'v2_tenant'),
	(1266, 47, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 13:03:36', 'v2_tenant'),
	(1267, 43, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 13:03:36', 'v2_tenant'),
	(1268, 51, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 13:03:36', 'v2_tenant'),
	(1269, 50, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 13:03:36', 'v2_tenant'),
	(1270, 86, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 13:03:36', 'v2_tenant'),
	(1271, 87, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 13:03:36', 'v2_tenant'),
	(1272, 88, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 13:03:36', 'v2_tenant'),
	(1273, 42, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 13:04:02', 'v2_tenant'),
	(1274, 44, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 13:04:05', 'v2_tenant'),
	(1275, 47, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 13:04:05', 'v2_tenant'),
	(1276, 43, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 13:04:05', 'v2_tenant'),
	(1277, 48, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 13:04:05', 'v2_tenant'),
	(1278, 46, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 13:04:05', 'v2_tenant'),
	(1279, 51, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 13:04:05', 'v2_tenant'),
	(1280, 50, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 13:04:05', 'v2_tenant'),
	(1281, 45, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 13:04:05', 'v2_tenant'),
	(1282, 66, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 13:05:26', 'v2_tenant'),
	(1283, 66, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 13:05:27', 'v2_tenant'),
	(1284, 66, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 13:05:27', 'v2_tenant'),
	(1285, 68, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 13:05:30', 'v2_tenant'),
	(1286, 77, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 13:15:55', 'v2_tenant'),
	(1287, 78, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 13:16:52', 'v2_tenant'),
	(1288, 42, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 13:18:40', 'v2_tenant'),
	(1289, 89, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 13:18:50', 'v2_tenant'),
	(1290, 89, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 13:22:28', 'v2_tenant'),
	(1291, 89, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 13:23:57', 'v2_tenant'),
	(1292, 89, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 13:24:23', 'v2_tenant'),
	(1293, 84, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 13:31:24', 'v2_tenant'),
	(1294, 85, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 13:31:24', 'v2_tenant'),
	(1295, 51, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 13:31:24', 'v2_tenant'),
	(1296, 48, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 13:31:24', 'v2_tenant'),
	(1297, 47, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 13:31:24', 'v2_tenant'),
	(1298, 50, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 13:31:24', 'v2_tenant'),
	(1299, 44, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 13:31:24', 'v2_tenant'),
	(1300, 43, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 13:31:24', 'v2_tenant'),
	(1301, 86, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 13:31:24', 'v2_tenant'),
	(1302, 50, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 13:31:24', 'v2_tenant'),
	(1303, 87, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 13:31:24', 'v2_tenant'),
	(1304, 88, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 13:31:24', 'v2_tenant'),
	(1305, 4, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 13:31:54', 'v2_tenant'),
	(1306, 32, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 13:31:54', 'v2_tenant'),
	(1307, 42, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 13:31:54', 'v2_tenant'),
	(1308, 84, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 13:31:58', 'v2_tenant'),
	(1309, 85, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 13:31:58', 'v2_tenant'),
	(1310, 48, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 13:31:58', 'v2_tenant'),
	(1311, 50, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 13:31:58', 'v2_tenant'),
	(1312, 43, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 13:31:58', 'v2_tenant'),
	(1313, 51, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 13:31:58', 'v2_tenant'),
	(1314, 44, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 13:31:58', 'v2_tenant'),
	(1315, 86, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 13:31:58', 'v2_tenant'),
	(1316, 88, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 13:31:58', 'v2_tenant'),
	(1317, 47, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 13:31:58', 'v2_tenant'),
	(1318, 50, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 13:31:58', 'v2_tenant'),
	(1319, 87, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 13:31:58', 'v2_tenant'),
	(1320, 42, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 13:37:42', 'v2_tenant'),
	(1321, 85, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 13:37:44', 'v2_tenant'),
	(1322, 84, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 13:37:44', 'v2_tenant'),
	(1323, 48, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 13:37:44', 'v2_tenant'),
	(1324, 44, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 13:37:44', 'v2_tenant'),
	(1325, 47, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 13:37:44', 'v2_tenant'),
	(1326, 50, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 13:37:44', 'v2_tenant'),
	(1327, 51, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 13:37:44', 'v2_tenant'),
	(1328, 43, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 13:37:44', 'v2_tenant'),
	(1329, 50, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 13:37:44', 'v2_tenant'),
	(1330, 87, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 13:37:44', 'v2_tenant'),
	(1331, 86, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 13:37:44', 'v2_tenant'),
	(1332, 88, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 13:37:44', 'v2_tenant'),
	(1333, 90, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 13:38:13', 'v2_tenant'),
	(1334, 85, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 13:38:13', 'v2_tenant'),
	(1335, 42, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 13:38:35', 'v2_tenant'),
	(1336, 85, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 13:38:37', 'v2_tenant'),
	(1337, 84, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 13:38:37', 'v2_tenant'),
	(1338, 48, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 13:38:37', 'v2_tenant'),
	(1339, 50, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 13:38:37', 'v2_tenant'),
	(1340, 43, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 13:38:37', 'v2_tenant'),
	(1341, 51, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 13:38:37', 'v2_tenant'),
	(1342, 44, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 13:38:37', 'v2_tenant'),
	(1343, 47, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 13:38:37', 'v2_tenant'),
	(1344, 50, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 13:38:37', 'v2_tenant'),
	(1345, 86, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 13:38:37', 'v2_tenant'),
	(1346, 87, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 13:38:37', 'v2_tenant'),
	(1347, 88, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 13:38:37', 'v2_tenant'),
	(1348, 90, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 13:39:30', 'v2_tenant'),
	(1349, 42, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 13:42:28', 'v2_tenant'),
	(1350, 84, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 13:42:34', 'v2_tenant'),
	(1351, 85, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 13:42:34', 'v2_tenant'),
	(1352, 48, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 13:42:34', 'v2_tenant'),
	(1353, 50, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 13:42:34', 'v2_tenant'),
	(1354, 47, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 13:42:34', 'v2_tenant'),
	(1355, 43, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 13:42:34', 'v2_tenant'),
	(1356, 50, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 13:42:35', 'v2_tenant'),
	(1357, 44, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 13:42:35', 'v2_tenant'),
	(1358, 51, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 13:42:35', 'v2_tenant'),
	(1359, 86, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 13:42:35', 'v2_tenant'),
	(1360, 87, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 13:42:35', 'v2_tenant'),
	(1361, 88, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 13:42:35', 'v2_tenant'),
	(1362, 90, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 13:42:37', 'v2_tenant'),
	(1363, 90, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 13:45:32', 'v2_tenant'),
	(1364, 90, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 13:50:11', 'v2_tenant'),
	(1365, 85, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 13:50:40', 'v2_tenant'),
	(1366, 42, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 13:57:10', 'v2_tenant'),
	(1367, 4, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 13:57:47', 'v2_tenant'),
	(1368, 42, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 13:57:47', 'v2_tenant'),
	(1369, 32, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 13:57:47', 'v2_tenant'),
	(1370, 42, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 13:57:55', 'v2_tenant'),
	(1371, 42, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 13:57:55', 'v2_tenant'),
	(1372, 42, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 13:57:55', 'v2_tenant'),
	(1373, 42, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 13:57:56', 'v2_tenant'),
	(1374, 42, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 13:57:56', 'v2_tenant'),
	(1375, 84, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 13:57:58', 'v2_tenant'),
	(1376, 85, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 13:57:58', 'v2_tenant'),
	(1377, 48, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 13:57:58', 'v2_tenant'),
	(1378, 51, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 13:57:58', 'v2_tenant'),
	(1379, 50, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 13:57:59', 'v2_tenant'),
	(1380, 44, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 13:57:58', 'v2_tenant'),
	(1381, 43, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 13:57:59', 'v2_tenant'),
	(1382, 47, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 13:57:59', 'v2_tenant'),
	(1383, 88, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 13:57:59', 'v2_tenant'),
	(1384, 86, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 13:57:59', 'v2_tenant'),
	(1385, 50, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 13:57:59', 'v2_tenant'),
	(1386, 87, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 13:57:59', 'v2_tenant'),
	(1387, 90, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 13:58:01', 'v2_tenant'),
	(1388, 90, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:03:11', 'v2_tenant'),
	(1389, 85, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:04:37', 'v2_tenant'),
	(1390, 42, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:04:43', 'v2_tenant'),
	(1391, 85, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:04:46', 'v2_tenant'),
	(1392, 84, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:04:46', 'v2_tenant'),
	(1393, 48, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:04:46', 'v2_tenant'),
	(1394, 44, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:04:46', 'v2_tenant'),
	(1395, 50, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:04:46', 'v2_tenant'),
	(1396, 51, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:04:46', 'v2_tenant'),
	(1397, 43, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:04:46', 'v2_tenant'),
	(1398, 47, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:04:46', 'v2_tenant'),
	(1399, 86, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:04:46', 'v2_tenant'),
	(1400, 50, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:04:46', 'v2_tenant'),
	(1401, 87, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:04:46', 'v2_tenant'),
	(1402, 88, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:04:46', 'v2_tenant'),
	(1403, 4, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:09:53', 'v2_tenant'),
	(1404, 51, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:09:53', 'v2_tenant'),
	(1405, 69, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:09:53', 'v2_tenant'),
	(1406, 71, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:09:53', 'v2_tenant'),
	(1407, 70, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:09:53', 'v2_tenant'),
	(1408, 25, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:09:53', 'v2_tenant'),
	(1409, 73, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:09:53', 'v2_tenant'),
	(1410, 27, '127.0.0.1', 'admin', '404', NULL, '2021-03-06 14:09:53', 'v2_tenant'),
	(1411, 4, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:09:54', 'v2_tenant'),
	(1412, 32, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:09:54', 'v2_tenant'),
	(1413, 42, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:09:54', 'v2_tenant'),
	(1414, 4, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:10:19', 'v2_tenant'),
	(1415, 32, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:10:19', 'v2_tenant'),
	(1416, 42, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:10:19', 'v2_tenant'),
	(1417, 84, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:10:32', 'v2_tenant'),
	(1418, 85, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:10:32', 'v2_tenant'),
	(1419, 48, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:10:33', 'v2_tenant'),
	(1420, 47, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:10:33', 'v2_tenant'),
	(1421, 50, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:10:33', 'v2_tenant'),
	(1422, 44, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:10:33', 'v2_tenant'),
	(1423, 43, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:10:33', 'v2_tenant'),
	(1424, 51, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:10:33', 'v2_tenant'),
	(1425, 86, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:10:33', 'v2_tenant'),
	(1426, 88, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:10:33', 'v2_tenant'),
	(1427, 50, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:10:33', 'v2_tenant'),
	(1428, 87, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:10:33', 'v2_tenant'),
	(1429, 90, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:10:36', 'v2_tenant'),
	(1430, 85, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:11:00', 'v2_tenant'),
	(1431, 4, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:11:56', 'v2_tenant'),
	(1432, 32, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:11:56', 'v2_tenant'),
	(1433, 42, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:11:56', 'v2_tenant'),
	(1434, 84, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:12:00', 'v2_tenant'),
	(1435, 85, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:12:00', 'v2_tenant'),
	(1436, 48, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:12:00', 'v2_tenant'),
	(1437, 51, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:12:00', 'v2_tenant'),
	(1438, 47, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:12:00', 'v2_tenant'),
	(1439, 44, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:12:00', 'v2_tenant'),
	(1440, 50, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:12:00', 'v2_tenant'),
	(1441, 43, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:12:00', 'v2_tenant'),
	(1442, 50, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:12:00', 'v2_tenant'),
	(1443, 87, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:12:00', 'v2_tenant'),
	(1444, 86, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:12:00', 'v2_tenant'),
	(1445, 88, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:12:00', 'v2_tenant'),
	(1446, 4, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:12:52', 'v2_tenant'),
	(1447, 32, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:12:52', 'v2_tenant'),
	(1448, 42, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:12:52', 'v2_tenant'),
	(1449, 4, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:12:53', 'v2_tenant'),
	(1450, 69, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:12:53', 'v2_tenant'),
	(1451, 70, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:12:53', 'v2_tenant'),
	(1452, 25, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:12:53', 'v2_tenant'),
	(1453, 71, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:12:53', 'v2_tenant'),
	(1454, 51, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:12:53', 'v2_tenant'),
	(1455, 27, '127.0.0.1', 'admin', '404', NULL, '2021-03-06 14:12:53', 'v2_tenant'),
	(1456, 73, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:12:53', 'v2_tenant'),
	(1457, 32, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:13:19', 'v2_tenant'),
	(1458, 42, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:13:19', 'v2_tenant'),
	(1459, 84, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:13:24', 'v2_tenant'),
	(1460, 85, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:13:24', 'v2_tenant'),
	(1461, 51, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:13:24', 'v2_tenant'),
	(1462, 48, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:13:24', 'v2_tenant'),
	(1463, 50, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:13:24', 'v2_tenant'),
	(1464, 44, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:13:24', 'v2_tenant'),
	(1465, 47, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:13:24', 'v2_tenant'),
	(1466, 43, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:13:24', 'v2_tenant'),
	(1467, 50, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:13:24', 'v2_tenant'),
	(1468, 86, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:13:24', 'v2_tenant'),
	(1469, 87, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:13:24', 'v2_tenant'),
	(1470, 88, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:13:24', 'v2_tenant'),
	(1471, 90, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:13:32', 'v2_tenant'),
	(1472, 85, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:13:50', 'v2_tenant'),
	(1473, 42, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:14:09', 'v2_tenant'),
	(1474, 4, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:16:18', 'v2_tenant'),
	(1475, 4, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:16:18', 'v2_tenant'),
	(1476, 69, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:16:18', 'v2_tenant'),
	(1477, 51, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:16:18', 'v2_tenant'),
	(1478, 71, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:16:18', 'v2_tenant'),
	(1479, 70, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:16:18', 'v2_tenant'),
	(1480, 25, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:16:18', 'v2_tenant'),
	(1481, 73, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:16:18', 'v2_tenant'),
	(1482, 27, '127.0.0.1', 'admin', '404', NULL, '2021-03-06 14:16:18', 'v2_tenant'),
	(1483, 32, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:16:18', 'v2_tenant'),
	(1484, 42, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:16:19', 'v2_tenant'),
	(1485, 4, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:16:35', 'v2_tenant'),
	(1486, 4, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:16:35', 'v2_tenant'),
	(1487, 69, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:16:35', 'v2_tenant'),
	(1488, 51, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:16:35', 'v2_tenant'),
	(1489, 71, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:16:35', 'v2_tenant'),
	(1490, 70, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:16:35', 'v2_tenant'),
	(1491, 25, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:16:35', 'v2_tenant'),
	(1492, 27, '127.0.0.1', 'admin', '404', NULL, '2021-03-06 14:16:35', 'v2_tenant'),
	(1493, 73, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:16:35', 'v2_tenant'),
	(1494, 32, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:16:36', 'v2_tenant'),
	(1495, 42, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:16:36', 'v2_tenant'),
	(1496, 4, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:17:12', 'v2_tenant'),
	(1497, 32, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:17:12', 'v2_tenant'),
	(1498, 42, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:17:12', 'v2_tenant'),
	(1499, 85, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:17:19', 'v2_tenant'),
	(1500, 84, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:17:19', 'v2_tenant'),
	(1501, 84, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:17:19', 'v2_tenant'),
	(1502, 48, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:17:19', 'v2_tenant'),
	(1503, 44, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:17:19', 'v2_tenant'),
	(1504, 51, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:17:19', 'v2_tenant'),
	(1505, 47, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:17:19', 'v2_tenant'),
	(1506, 43, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:17:19', 'v2_tenant'),
	(1507, 50, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:17:19', 'v2_tenant'),
	(1508, 50, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:17:19', 'v2_tenant'),
	(1509, 86, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:17:19', 'v2_tenant'),
	(1510, 87, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:17:19', 'v2_tenant'),
	(1511, 88, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:17:19', 'v2_tenant'),
	(1512, 90, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:17:41', 'v2_tenant'),
	(1513, 85, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:17:41', 'v2_tenant'),
	(1514, 84, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:18:09', 'v2_tenant'),
	(1515, 51, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:18:11', 'v2_tenant'),
	(1516, 48, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:18:11', 'v2_tenant'),
	(1517, 44, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:18:11', 'v2_tenant'),
	(1518, 47, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:18:11', 'v2_tenant'),
	(1519, 43, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:18:11', 'v2_tenant'),
	(1520, 50, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:18:11', 'v2_tenant'),
	(1521, 50, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:18:11', 'v2_tenant'),
	(1522, 86, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:18:11', 'v2_tenant'),
	(1523, 87, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:18:11', 'v2_tenant'),
	(1524, 88, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:18:11', 'v2_tenant'),
	(1525, 90, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:18:31', 'v2_tenant'),
	(1526, 85, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:18:31', 'v2_tenant'),
	(1527, 42, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:18:31', 'v2_tenant'),
	(1528, 42, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:18:31', 'v2_tenant'),
	(1529, 48, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:18:51', 'v2_tenant'),
	(1530, 51, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:18:51', 'v2_tenant'),
	(1531, 47, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:18:51', 'v2_tenant'),
	(1532, 50, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:18:51', 'v2_tenant'),
	(1533, 43, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:18:51', 'v2_tenant'),
	(1534, 44, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:18:51', 'v2_tenant'),
	(1535, 45, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:18:51', 'v2_tenant'),
	(1536, 46, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:18:51', 'v2_tenant'),
	(1537, 66, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:18:55', 'v2_tenant'),
	(1538, 66, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:18:58', 'v2_tenant'),
	(1539, 66, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:18:58', 'v2_tenant'),
	(1540, 66, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:18:58', 'v2_tenant'),
	(1541, 66, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:18:58', 'v2_tenant'),
	(1542, 68, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:19:01', 'v2_tenant'),
	(1543, 77, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:19:07', 'v2_tenant'),
	(1544, 79, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:19:48', 'v2_tenant'),
	(1545, 42, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:20:21', 'v2_tenant'),
	(1546, 84, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:20:33', 'v2_tenant'),
	(1547, 85, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:20:33', 'v2_tenant'),
	(1548, 48, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:20:33', 'v2_tenant'),
	(1549, 51, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:20:33', 'v2_tenant'),
	(1550, 47, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:20:33', 'v2_tenant'),
	(1551, 44, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:20:33', 'v2_tenant'),
	(1552, 43, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:20:33', 'v2_tenant'),
	(1553, 50, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:20:33', 'v2_tenant'),
	(1554, 86, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:20:34', 'v2_tenant'),
	(1555, 87, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:20:34', 'v2_tenant'),
	(1556, 50, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:20:34', 'v2_tenant'),
	(1557, 88, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:20:34', 'v2_tenant'),
	(1558, 84, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:20:34', 'v2_tenant'),
	(1559, 51, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:20:34', 'v2_tenant'),
	(1560, 48, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:20:34', 'v2_tenant'),
	(1561, 47, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:20:34', 'v2_tenant'),
	(1562, 50, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:20:34', 'v2_tenant'),
	(1563, 43, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:20:34', 'v2_tenant'),
	(1564, 44, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:20:34', 'v2_tenant'),
	(1565, 50, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:20:34', 'v2_tenant'),
	(1566, 86, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:20:34', 'v2_tenant'),
	(1567, 87, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:20:34', 'v2_tenant'),
	(1568, 88, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:20:38', 'v2_tenant'),
	(1569, 90, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:21:10', 'v2_tenant'),
	(1570, 85, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:21:10', 'v2_tenant'),
	(1571, 84, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:21:10', 'v2_tenant'),
	(1572, 48, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:21:10', 'v2_tenant'),
	(1573, 50, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:21:10', 'v2_tenant'),
	(1574, 47, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:21:10', 'v2_tenant'),
	(1575, 87, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:21:10', 'v2_tenant'),
	(1576, 51, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:21:10', 'v2_tenant'),
	(1577, 86, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:21:10', 'v2_tenant'),
	(1578, 43, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:21:10', 'v2_tenant'),
	(1579, 44, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:21:10', 'v2_tenant'),
	(1580, 50, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:21:10', 'v2_tenant'),
	(1581, 88, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:21:10', 'v2_tenant'),
	(1582, 90, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:21:34', 'v2_tenant'),
	(1583, 85, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:21:34', 'v2_tenant'),
	(1584, 84, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:21:35', 'v2_tenant'),
	(1585, 48, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:21:35', 'v2_tenant'),
	(1586, 47, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:21:35', 'v2_tenant'),
	(1587, 51, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:21:35', 'v2_tenant'),
	(1588, 44, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:21:35', 'v2_tenant'),
	(1589, 43, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:21:35', 'v2_tenant'),
	(1590, 50, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:21:35', 'v2_tenant'),
	(1591, 50, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:21:35', 'v2_tenant'),
	(1592, 86, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:21:35', 'v2_tenant'),
	(1593, 87, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:21:35', 'v2_tenant'),
	(1594, 88, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:21:35', 'v2_tenant'),
	(1595, 90, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:21:57', 'v2_tenant'),
	(1596, 85, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:21:57', 'v2_tenant'),
	(1597, 42, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:21:57', 'v2_tenant'),
	(1598, 42, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:21:57', 'v2_tenant'),
	(1599, 91, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:22:41', 'v2_tenant'),
	(1600, 4, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:25:45', 'v2_tenant'),
	(1601, 70, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:25:45', 'v2_tenant'),
	(1602, 69, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:25:45', 'v2_tenant'),
	(1603, 51, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:25:45', 'v2_tenant'),
	(1604, 71, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:25:45', 'v2_tenant'),
	(1605, 25, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:25:45', 'v2_tenant'),
	(1606, 27, '127.0.0.1', 'admin', '404', NULL, '2021-03-06 14:25:45', 'v2_tenant'),
	(1607, 73, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:25:45', 'v2_tenant'),
	(1608, 4, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:25:45', 'v2_tenant'),
	(1609, 32, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:25:45', 'v2_tenant'),
	(1610, 42, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:25:45', 'v2_tenant'),
	(1611, 4, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:26:08', 'v2_tenant'),
	(1612, 51, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:26:08', 'v2_tenant'),
	(1613, 69, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:26:08', 'v2_tenant'),
	(1614, 70, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:26:08', 'v2_tenant'),
	(1615, 71, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:26:08', 'v2_tenant'),
	(1616, 25, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:26:08', 'v2_tenant'),
	(1617, 27, '127.0.0.1', 'admin', '404', NULL, '2021-03-06 14:26:08', 'v2_tenant'),
	(1618, 73, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:26:08', 'v2_tenant'),
	(1619, 4, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:26:09', 'v2_tenant'),
	(1620, 32, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:26:10', 'v2_tenant'),
	(1621, 42, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:26:10', 'v2_tenant'),
	(1622, 91, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:28:21', 'v2_tenant'),
	(1623, 48, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:28:53', 'v2_tenant'),
	(1624, 50, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:28:53', 'v2_tenant'),
	(1625, 43, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:28:53', 'v2_tenant'),
	(1626, 51, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:28:53', 'v2_tenant'),
	(1627, 47, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:28:53', 'v2_tenant'),
	(1628, 46, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:28:53', 'v2_tenant'),
	(1629, 44, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:28:53', 'v2_tenant'),
	(1630, 45, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:28:53', 'v2_tenant'),
	(1631, 66, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:28:56', 'v2_tenant'),
	(1632, 66, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:28:58', 'v2_tenant'),
	(1633, 66, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:28:58', 'v2_tenant'),
	(1634, 68, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:29:01', 'v2_tenant'),
	(1635, 77, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:29:06', 'v2_tenant'),
	(1636, 79, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:29:37', 'v2_tenant'),
	(1637, 42, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:29:44', 'v2_tenant'),
	(1638, 84, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:29:50', 'v2_tenant'),
	(1639, 85, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:29:50', 'v2_tenant'),
	(1640, 84, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:29:50', 'v2_tenant'),
	(1641, 48, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:29:50', 'v2_tenant'),
	(1642, 51, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:29:50', 'v2_tenant'),
	(1643, 44, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:29:50', 'v2_tenant'),
	(1644, 47, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:29:50', 'v2_tenant'),
	(1645, 50, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:29:50', 'v2_tenant'),
	(1646, 43, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:29:50', 'v2_tenant'),
	(1647, 50, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:29:50', 'v2_tenant'),
	(1648, 87, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:29:50', 'v2_tenant'),
	(1649, 86, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:29:50', 'v2_tenant'),
	(1650, 88, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:29:50', 'v2_tenant'),
	(1651, 92, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:30:08', 'v2_tenant'),
	(1652, 85, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:30:08', 'v2_tenant'),
	(1653, 42, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:30:08', 'v2_tenant'),
	(1654, 42, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:30:08', 'v2_tenant'),
	(1655, 39, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:43:22', 'v2_tenant'),
	(1656, 34, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:43:22', 'v2_tenant'),
	(1657, 4, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:43:23', 'v2_tenant'),
	(1658, 42, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:43:26', 'v2_tenant'),
	(1659, 32, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:43:26', 'v2_tenant'),
	(1660, 48, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:43:29', 'v2_tenant'),
	(1661, 50, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:43:29', 'v2_tenant'),
	(1662, 51, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:43:29', 'v2_tenant'),
	(1663, 43, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:43:29', 'v2_tenant'),
	(1664, 46, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:43:29', 'v2_tenant'),
	(1665, 45, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:43:29', 'v2_tenant'),
	(1666, 44, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:43:29', 'v2_tenant'),
	(1667, 47, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:43:29', 'v2_tenant'),
	(1668, 66, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:43:40', 'v2_tenant'),
	(1669, 68, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:43:41', 'v2_tenant'),
	(1670, 77, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:43:47', 'v2_tenant'),
	(1671, 77, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:43:56', 'v2_tenant'),
	(1672, 79, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:44:18', 'v2_tenant'),
	(1673, 42, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:44:33', 'v2_tenant'),
	(1674, 51, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:47:29', 'v2_tenant'),
	(1675, 47, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:47:29', 'v2_tenant'),
	(1676, 50, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:47:29', 'v2_tenant'),
	(1677, 46, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:47:29', 'v2_tenant'),
	(1678, 44, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:47:29', 'v2_tenant'),
	(1679, 43, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:47:30', 'v2_tenant'),
	(1680, 45, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:47:30', 'v2_tenant'),
	(1681, 48, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:47:30', 'v2_tenant'),
	(1682, 66, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:47:32', 'v2_tenant'),
	(1683, 66, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:47:33', 'v2_tenant'),
	(1684, 66, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:47:34', 'v2_tenant'),
	(1685, 68, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:47:36', 'v2_tenant'),
	(1686, 77, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:47:42', 'v2_tenant'),
	(1687, 79, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:47:53', 'v2_tenant'),
	(1688, 79, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:48:08', 'v2_tenant'),
	(1689, 42, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:48:38', 'v2_tenant'),
	(1690, 85, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:48:46', 'v2_tenant'),
	(1691, 84, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:48:46', 'v2_tenant'),
	(1692, 84, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:48:46', 'v2_tenant'),
	(1693, 50, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:48:46', 'v2_tenant'),
	(1694, 47, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:48:46', 'v2_tenant'),
	(1695, 48, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:48:46', 'v2_tenant'),
	(1696, 51, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:48:46', 'v2_tenant'),
	(1697, 43, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:48:46', 'v2_tenant'),
	(1698, 44, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:48:46', 'v2_tenant'),
	(1699, 50, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:48:46', 'v2_tenant'),
	(1700, 42, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:49:00', 'v2_tenant'),
	(1701, 84, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:49:05', 'v2_tenant'),
	(1702, 85, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:49:05', 'v2_tenant'),
	(1703, 84, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:49:05', 'v2_tenant'),
	(1704, 51, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:49:05', 'v2_tenant'),
	(1705, 44, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:49:06', 'v2_tenant'),
	(1706, 43, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:49:06', 'v2_tenant'),
	(1707, 48, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:49:06', 'v2_tenant'),
	(1708, 50, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:49:06', 'v2_tenant'),
	(1709, 47, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:49:06', 'v2_tenant'),
	(1710, 50, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:49:06', 'v2_tenant'),
	(1711, 42, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:49:14', 'v2_tenant'),
	(1712, 84, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:49:32', 'v2_tenant'),
	(1713, 85, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:49:32', 'v2_tenant'),
	(1714, 84, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:49:32', 'v2_tenant'),
	(1715, 44, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:49:32', 'v2_tenant'),
	(1716, 47, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:49:32', 'v2_tenant'),
	(1717, 51, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:49:32', 'v2_tenant'),
	(1718, 43, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:49:32', 'v2_tenant'),
	(1719, 50, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:49:32', 'v2_tenant'),
	(1720, 48, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:49:32', 'v2_tenant'),
	(1721, 50, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:49:32', 'v2_tenant'),
	(1722, 86, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:49:32', 'v2_tenant'),
	(1723, 87, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:49:32', 'v2_tenant'),
	(1724, 88, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:49:32', 'v2_tenant'),
	(1725, 84, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:49:41', 'v2_tenant'),
	(1726, 51, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:49:42', 'v2_tenant'),
	(1727, 48, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:49:42', 'v2_tenant'),
	(1728, 44, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:49:42', 'v2_tenant'),
	(1729, 47, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:49:42', 'v2_tenant'),
	(1730, 43, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:49:42', 'v2_tenant'),
	(1731, 50, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:49:42', 'v2_tenant'),
	(1732, 50, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:49:42', 'v2_tenant'),
	(1733, 42, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:49:46', 'v2_tenant'),
	(1734, 4, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:53:58', 'v2_tenant'),
	(1735, 32, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:53:58', 'v2_tenant'),
	(1736, 42, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:53:58', 'v2_tenant'),
	(1737, 4, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:54:01', 'v2_tenant'),
	(1738, 32, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:54:01', 'v2_tenant'),
	(1739, 42, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:54:01', 'v2_tenant'),
	(1740, 84, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:54:04', 'v2_tenant'),
	(1741, 85, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:54:04', 'v2_tenant'),
	(1742, 51, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:54:04', 'v2_tenant'),
	(1743, 48, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:54:04', 'v2_tenant'),
	(1744, 44, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:54:04', 'v2_tenant'),
	(1745, 47, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:54:04', 'v2_tenant'),
	(1746, 43, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:54:04', 'v2_tenant'),
	(1747, 50, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:54:05', 'v2_tenant'),
	(1748, 50, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:54:05', 'v2_tenant'),
	(1749, 86, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:54:05', 'v2_tenant'),
	(1750, 87, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:54:05', 'v2_tenant'),
	(1751, 88, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:54:05', 'v2_tenant'),
	(1752, 84, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:54:08', 'v2_tenant'),
	(1753, 51, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:54:08', 'v2_tenant'),
	(1754, 48, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:54:08', 'v2_tenant'),
	(1755, 47, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:54:08', 'v2_tenant'),
	(1756, 44, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:54:08', 'v2_tenant'),
	(1757, 43, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:54:08', 'v2_tenant'),
	(1758, 50, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:54:08', 'v2_tenant'),
	(1759, 50, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:54:08', 'v2_tenant'),
	(1760, 86, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:54:08', 'v2_tenant'),
	(1761, 87, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:54:08', 'v2_tenant'),
	(1762, 88, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:54:08', 'v2_tenant'),
	(1763, 90, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:54:27', 'v2_tenant'),
	(1764, 85, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:54:27', 'v2_tenant'),
	(1765, 84, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:54:27', 'v2_tenant'),
	(1766, 51, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:54:27', 'v2_tenant'),
	(1767, 44, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:54:27', 'v2_tenant'),
	(1768, 48, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:54:27', 'v2_tenant'),
	(1769, 50, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:54:27', 'v2_tenant'),
	(1770, 47, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:54:27', 'v2_tenant'),
	(1771, 43, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:54:27', 'v2_tenant'),
	(1772, 50, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:54:27', 'v2_tenant'),
	(1773, 88, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:54:27', 'v2_tenant'),
	(1774, 86, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:54:27', 'v2_tenant'),
	(1775, 87, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:54:27', 'v2_tenant'),
	(1776, 42, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:54:34', 'v2_tenant'),
	(1777, 4, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:55:49', 'v2_tenant'),
	(1778, 32, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:55:50', 'v2_tenant'),
	(1779, 42, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:55:50', 'v2_tenant'),
	(1780, 4, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:55:50', 'v2_tenant'),
	(1781, 32, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:55:50', 'v2_tenant'),
	(1782, 42, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:55:50', 'v2_tenant'),
	(1783, 4, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:56:13', 'v2_tenant'),
	(1784, 4, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:56:13', 'v2_tenant'),
	(1785, 32, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:56:13', 'v2_tenant'),
	(1786, 42, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:56:13', 'v2_tenant'),
	(1787, 32, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:56:13', 'v2_tenant'),
	(1788, 42, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:56:13', 'v2_tenant'),
	(1789, 89, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:56:25', 'v2_tenant'),
	(1790, 91, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:56:28', 'v2_tenant'),
	(1791, 84, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:56:32', 'v2_tenant'),
	(1792, 85, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:56:32', 'v2_tenant'),
	(1793, 84, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:56:32', 'v2_tenant'),
	(1794, 51, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:56:33', 'v2_tenant'),
	(1795, 48, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:56:33', 'v2_tenant'),
	(1796, 47, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:56:33', 'v2_tenant'),
	(1797, 50, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:56:33', 'v2_tenant'),
	(1798, 43, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:56:33', 'v2_tenant'),
	(1799, 44, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:56:33', 'v2_tenant'),
	(1800, 86, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:56:33', 'v2_tenant'),
	(1801, 50, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:56:33', 'v2_tenant'),
	(1802, 87, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:56:33', 'v2_tenant'),
	(1803, 88, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:56:33', 'v2_tenant'),
	(1804, 42, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:56:38', 'v2_tenant'),
	(1805, 84, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:56:44', 'v2_tenant'),
	(1806, 85, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:56:44', 'v2_tenant'),
	(1807, 84, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:56:44', 'v2_tenant'),
	(1808, 48, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:56:44', 'v2_tenant'),
	(1809, 44, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:56:44', 'v2_tenant'),
	(1810, 47, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:56:44', 'v2_tenant'),
	(1811, 43, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:56:44', 'v2_tenant'),
	(1812, 51, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:56:44', 'v2_tenant'),
	(1813, 86, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:56:44', 'v2_tenant'),
	(1814, 87, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:56:44', 'v2_tenant'),
	(1815, 50, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:56:44', 'v2_tenant'),
	(1816, 88, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:56:44', 'v2_tenant'),
	(1817, 50, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:56:44', 'v2_tenant'),
	(1818, 42, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:56:49', 'v2_tenant'),
	(1819, 85, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:56:53', 'v2_tenant'),
	(1820, 84, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:56:53', 'v2_tenant'),
	(1821, 84, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:56:53', 'v2_tenant'),
	(1822, 48, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:56:53', 'v2_tenant'),
	(1823, 44, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:56:53', 'v2_tenant'),
	(1824, 47, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:56:53', 'v2_tenant'),
	(1825, 43, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:56:53', 'v2_tenant'),
	(1826, 51, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:56:53', 'v2_tenant'),
	(1827, 50, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:56:53', 'v2_tenant'),
	(1828, 50, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:56:53', 'v2_tenant'),
	(1829, 86, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:56:53', 'v2_tenant'),
	(1830, 87, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:56:53', 'v2_tenant'),
	(1831, 88, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:56:53', 'v2_tenant'),
	(1832, 42, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:56:58', 'v2_tenant'),
	(1833, 85, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:57:10', 'v2_tenant'),
	(1834, 84, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:57:10', 'v2_tenant'),
	(1835, 84, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:57:11', 'v2_tenant'),
	(1836, 48, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:57:11', 'v2_tenant'),
	(1837, 43, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:57:11', 'v2_tenant'),
	(1838, 51, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:57:11', 'v2_tenant'),
	(1839, 50, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:57:11', 'v2_tenant'),
	(1840, 47, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:57:11', 'v2_tenant'),
	(1841, 44, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:57:11', 'v2_tenant'),
	(1842, 50, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:57:11', 'v2_tenant'),
	(1843, 87, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:57:11', 'v2_tenant'),
	(1844, 86, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:57:11', 'v2_tenant'),
	(1845, 88, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:57:11', 'v2_tenant'),
	(1846, 42, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:57:30', 'v2_tenant'),
	(1847, 4, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:57:34', 'v2_tenant'),
	(1848, 32, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:57:34', 'v2_tenant'),
	(1849, 42, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:57:34', 'v2_tenant'),
	(1850, 84, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:57:41', 'v2_tenant'),
	(1851, 85, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:57:41', 'v2_tenant'),
	(1852, 51, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:57:41', 'v2_tenant'),
	(1853, 48, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:57:41', 'v2_tenant'),
	(1854, 47, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:57:41', 'v2_tenant'),
	(1855, 44, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:57:41', 'v2_tenant'),
	(1856, 43, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:57:41', 'v2_tenant'),
	(1857, 50, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:57:41', 'v2_tenant'),
	(1858, 50, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:57:41', 'v2_tenant'),
	(1859, 86, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:57:41', 'v2_tenant'),
	(1860, 87, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:57:41', 'v2_tenant'),
	(1861, 88, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:57:41', 'v2_tenant'),
	(1862, 84, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:57:44', 'v2_tenant'),
	(1863, 48, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:57:44', 'v2_tenant'),
	(1864, 51, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:57:44', 'v2_tenant'),
	(1865, 47, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:57:44', 'v2_tenant'),
	(1866, 44, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:57:44', 'v2_tenant'),
	(1867, 43, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:57:44', 'v2_tenant'),
	(1868, 50, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:57:44', 'v2_tenant'),
	(1869, 50, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:57:44', 'v2_tenant'),
	(1870, 87, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:57:44', 'v2_tenant'),
	(1871, 86, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:57:44', 'v2_tenant'),
	(1872, 88, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:57:44', 'v2_tenant'),
	(1873, 42, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:58:01', 'v2_tenant'),
	(1874, 85, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:58:05', 'v2_tenant'),
	(1875, 84, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:58:05', 'v2_tenant'),
	(1876, 84, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:58:05', 'v2_tenant'),
	(1877, 44, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:58:05', 'v2_tenant'),
	(1878, 43, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:58:05', 'v2_tenant'),
	(1879, 48, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:58:05', 'v2_tenant'),
	(1880, 51, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:58:05', 'v2_tenant'),
	(1881, 50, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:58:05', 'v2_tenant'),
	(1882, 47, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:58:05', 'v2_tenant'),
	(1883, 50, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:58:05', 'v2_tenant'),
	(1884, 86, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:58:05', 'v2_tenant'),
	(1885, 87, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:58:05', 'v2_tenant'),
	(1886, 88, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:58:05', 'v2_tenant'),
	(1887, 42, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:58:07', 'v2_tenant'),
	(1888, 4, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:59:16', 'v2_tenant'),
	(1889, 32, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:59:16', 'v2_tenant'),
	(1890, 42, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:59:16', 'v2_tenant'),
	(1891, 4, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:59:17', 'v2_tenant'),
	(1892, 32, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:59:17', 'v2_tenant'),
	(1893, 42, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 14:59:17', 'v2_tenant'),
	(1894, 4, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 15:00:20', 'v2_tenant'),
	(1895, 32, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 15:00:20', 'v2_tenant'),
	(1896, 42, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 15:00:20', 'v2_tenant'),
	(1897, 4, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 15:00:21', 'v2_tenant'),
	(1898, 32, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 15:00:21', 'v2_tenant'),
	(1899, 42, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 15:00:21', 'v2_tenant'),
	(1900, 84, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 15:00:33', 'v2_tenant'),
	(1901, 85, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 15:00:33', 'v2_tenant'),
	(1902, 51, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 15:00:34', 'v2_tenant'),
	(1903, 44, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 15:00:34', 'v2_tenant'),
	(1904, 48, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 15:00:34', 'v2_tenant'),
	(1905, 47, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 15:00:34', 'v2_tenant'),
	(1906, 43, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 15:00:34', 'v2_tenant'),
	(1907, 50, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 15:00:34', 'v2_tenant'),
	(1908, 50, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 15:00:34', 'v2_tenant'),
	(1909, 86, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 15:00:34', 'v2_tenant'),
	(1910, 87, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 15:00:34', 'v2_tenant'),
	(1911, 88, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 15:00:34', 'v2_tenant'),
	(1912, 84, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 15:00:34', 'v2_tenant'),
	(1913, 51, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 15:00:34', 'v2_tenant'),
	(1914, 48, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 15:00:34', 'v2_tenant'),
	(1915, 43, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 15:00:34', 'v2_tenant'),
	(1916, 44, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 15:00:34', 'v2_tenant'),
	(1917, 47, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 15:00:34', 'v2_tenant'),
	(1918, 50, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 15:00:34', 'v2_tenant'),
	(1919, 50, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 15:00:34', 'v2_tenant'),
	(1920, 86, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 15:00:34', 'v2_tenant'),
	(1921, 87, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 15:00:34', 'v2_tenant'),
	(1922, 88, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 15:00:35', 'v2_tenant'),
	(1923, 42, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 15:00:41', 'v2_tenant'),
	(1924, 84, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 15:00:45', 'v2_tenant'),
	(1925, 51, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 15:00:45', 'v2_tenant'),
	(1926, 48, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 15:00:45', 'v2_tenant'),
	(1927, 44, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 15:00:45', 'v2_tenant'),
	(1928, 47, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 15:00:45', 'v2_tenant'),
	(1929, 43, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 15:00:45', 'v2_tenant'),
	(1930, 50, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 15:00:46', 'v2_tenant'),
	(1931, 50, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 15:00:46', 'v2_tenant'),
	(1932, 86, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 15:00:46', 'v2_tenant'),
	(1933, 88, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 15:00:46', 'v2_tenant'),
	(1934, 87, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 15:00:46', 'v2_tenant'),
	(1935, 42, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 15:00:55', 'v2_tenant'),
	(1936, 51, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 15:29:18', 'v2_tenant'),
	(1937, 46, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 15:29:18', 'v2_tenant'),
	(1938, 45, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 15:29:18', 'v2_tenant'),
	(1939, 48, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 15:29:18', 'v2_tenant'),
	(1940, 43, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 15:29:18', 'v2_tenant'),
	(1941, 47, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 15:29:18', 'v2_tenant'),
	(1942, 44, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 15:29:18', 'v2_tenant'),
	(1943, 50, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 15:29:18', 'v2_tenant'),
	(1944, 42, '127.0.0.1', 'admin', '200', NULL, '2021-03-06 15:29:22', 'v2_tenant');
/*!40000 ALTER TABLE `common_user_log` ENABLE KEYS */;

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
  `date_created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`to_user_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*!40000 ALTER TABLE `common_user_notification` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_user_notification` ENABLE KEYS */;

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
  `created_by` varchar(100) NOT NULL DEFAULT '',
  `created_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `update_by` varchar(100) DEFAULT NULL,
  `update_on` datetime DEFAULT NULL,
  `delete_by` varchar(100) DEFAULT NULL,
  `delete_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=latin1;

/*!40000 ALTER TABLE `umm_menu` DISABLE KEYS */;
INSERT INTO `umm_menu` (`id`, `name`, `display_text`, `menu_style`, `url`, `tab`, `type`, `super_type`, `super_type_2`, `department`, `menu_order`, `display_icon`, `short_name`, `detail_text`, `status`, `portal_menu`, `individual_tenant_menu`, `vendor_community_menu`, `version`, `auth_code`, `slim_menu`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES
	(1, 'Dashboard Options', 'Dashboard Options', 'card text-white bg-info', '/home/dashboard', NULL, 'M', NULL, NULL, 'Admin', 1, 'icon-speedometer', 'Dashboard', 'Dashboard', 'A', 0, 0, 0, 'V1', 'DASHBOARD_OPTION', 0, 'System', '2021-02-03 22:36:36', NULL, NULL, NULL, NULL),
	(2, 'Admin', 'Admin', 'card text-white bg-info', '/pages', NULL, 'M', NULL, NULL, 'Admin', 300, 'icon-settings icons', 'Admin', 'Admin', 'A', 0, 0, 0, 'V1', 'ADMIN', 0, 'System', '2021-02-03 22:36:42', NULL, NULL, NULL, NULL),
	(3, 'User Management', 'User Management', 'card text-white bg-info', '/home/admin/user', NULL, 'S', 2, NULL, 'Admin', 305, 'icon-user icons', 'User', 'Management', 'A', 0, 0, 0, 'V1', 'USER_MANAGEMENT', 0, 'System', '2021-02-03 22:36:42', NULL, NULL, NULL, NULL),
	(4, 'Role Management', 'Role Management', 'card text-white bg-info', '/home/admin/role', NULL, 'S', 2, NULL, 'Admin', 302, 'icon-key icons', 'Role', 'Management', 'A', 0, 0, 0, 'V1', 'ROLE_MANAGEMENT', 0, 'System', '2021-02-03 22:36:42', NULL, NULL, NULL, NULL),
	(5, 'VendorTrl', 'VendorTrl', 'card text-white bg-info', '/pages', NULL, 'M', NULL, NULL, 'Admin', 200, 'icon-people icons', 'Vendor', 'Trl', 'A', 0, 0, 0, 'V1', 'VENDORTRL', 0, 'System', '2021-02-03 22:36:42', NULL, NULL, NULL, NULL),
	(6, 'Vendor Management', 'Vendor Management', 'card text-white bg-info', '/home/vendor/management/vendor-management', NULL, 'S', 5, NULL, 'Admin', 206, 'fa fa-street-view', 'Vendor', 'Management', 'A', 0, 0, 0, 'V1', 'VENDOR_MANAGEMENT', 0, 'System', '2021-02-03 22:36:42', NULL, NULL, NULL, NULL),
	(8, 'Workflow Configuration', 'Workflow Configuration', 'card text-white bg-info', '/home/vendor/workflow/configuration', NULL, 'S', 2, NULL, 'Admin', 304, 'icon-magnifier icons', 'Workflow ', 'Configuration', 'A', 0, 0, 0, 'V1', 'WORKFLOW_CONFIGURATION', 0, 'System', '2021-02-03 22:36:42', NULL, NULL, NULL, NULL),
	(9, 'Upload Invoice', 'Upload Invoice', 'card text-white bg-info', '/home/ven-invoice/invoice-upload', NULL, 'S', 5, NULL, 'Admin', 201, 'icon-cloud-upload', 'Upload', ' Invoice', 'A', 0, 0, 0, 'V1', 'UPLOAD_INVOICE', 0, 'System', '2021-02-03 22:36:42', NULL, NULL, NULL, NULL),
	(10, 'Review Invoice', 'Review Invoice', 'card text-white bg-info', '/home/ven-invoice/invoice-review', NULL, 'S', 5, NULL, 'Admin', 202, 'icon-eye icons', 'Review', 'Invoice', 'A', 0, 0, 0, 'V1', 'REVIEW_INVOICE', 0, 'System', '2021-02-03 22:36:42', NULL, NULL, NULL, NULL),
	(11, 'Invoice Approval', 'Invoice Approval', 'card text-white bg-info', '/home/ven-invoice/invoice-status-box', NULL, 'S', 5, NULL, 'Admin', 204, 'icon-social-dropbox icons', 'Invoice', 'Approval', 'A', 0, 0, 0, 'V1', 'INVOICE_APPROVAL', 0, 'System', '2021-02-03 22:36:42', NULL, NULL, NULL, NULL),
	(12, 'Project Code Management', 'Project Code Management', 'card text-white bg-info', '/home/ven-invoice/approval-code-management', NULL, 'S', 2, NULL, 'Admin', 306, 'fa fa-code', 'Project Code', 'Management', 'A', 0, 0, 0, 'V1', 'PROJECT_CODE_MANAGEMENT', 0, 'System', '2021-02-03 22:36:42', NULL, NULL, NULL, NULL),
	(13, 'Invoice Search', 'Invoice Search', 'card text-white bg-info', '/home/ven-invoice/invoice-search', NULL, 'S', 5, NULL, 'Admin', 205, 'icon-magnifier', 'Invoice', 'Search', 'A', 0, 0, 0, 'V1', 'INVOICE_SEARCH', 0, 'System', '2021-02-03 22:36:42', NULL, NULL, NULL, NULL),
	(14, 'Dashboard', 'Dashboard', 'card text-white bg-info', '/home/dashboard', NULL, 'S', 1, NULL, 'Admin', 1, 'icon-speedometer', 'Dashboard', 'Dashboard', 'A', 0, 0, 0, 'V1', 'DASHBOARD', 0, 'System', '2021-02-03 22:36:42', NULL, NULL, NULL, NULL),
	(20, 'E-Invoice', 'E-Invoice', 'card text-white bg-info', '/home/ven-invoice/e-invoice', NULL, 'S', 5, NULL, 'Admin', 203, 'fa fa-calculator', 'E-invoice', 'E-Invoice', 'A', 0, 0, 0, 'V1', 'E_INVOICE', 0, 'System', '2021-02-03 22:36:42', NULL, NULL, NULL, NULL),
	(21, 'Payment Management', 'Payment Management', 'card text-white bg-info', '/home/ven-invoice/payment/management', NULL, 'S', 5, NULL, 'Admin', 208, 'fa fa-money', 'Payment', 'Management', 'A', 0, 0, 0, 'V1', 'PAYMENT_MANAGEMENT', 0, 'System', '2021-02-03 22:36:42', NULL, NULL, NULL, NULL),
	(22, 'Sync Dashboard', 'Sync Dashboard', 'card text-white bg-info', '/home/ven-invoice/sync-dashboard', NULL, 'S', 2, NULL, 'Admin', 307, 'fa fa-stumbleupon-circle', 'Sync', 'Dashboard', 'A', 0, 0, 0, 'V1', 'SYNC_DASHBOARD', 0, 'System', '2021-02-03 22:36:42', NULL, NULL, NULL, NULL),
	(23, 'Approval Group Management', 'Approval Group Management', 'card text-white bg-info', '/home/admin/approval-level', NULL, 'S', 2, NULL, 'Admin', 303, 'fa fa-level-up', 'Approval', 'Group Management', 'A', 0, 0, 0, 'V1', 'APPROVAL_GROUP_MANAGEMENT', 0, 'System', '2021-02-03 22:36:42', NULL, NULL, NULL, NULL),
	(28, 'Settings', 'Settings', 'card text-white bg-info', '/home/support/package-change-request', NULL, 'S', 2, NULL, 'Admin', 301, 'fa fa-cogs', 'Settings', 'Settings', 'A', 0, 0, 0, 'V1', 'SETTINGS', 0, 'System', '2021-02-03 22:36:42', NULL, NULL, NULL, NULL),
	(29, 'CaptureTrl', 'CaptureTrl', 'card text-white bg-info', '/pages', NULL, 'M', NULL, NULL, 'Admin', 100, 'fa fa-camera', 'Capture', 'Trl', 'A', 0, 0, 0, 'V1', 'CAPTURETRL', 0, 'System', '2021-02-03 22:36:42', NULL, NULL, NULL, NULL),
	(30, 'Client Management', 'Client Management', 'card text-white bg-info', '/home/ar-module/client/client-management', NULL, 'S', 29, NULL, 'Admin', 101, 'fa fa-handshake-o', 'Client', 'Management', 'A', 0, 0, 0, 'V1', 'CLIENT_MANAGEMENT', 0, 'System', '2021-02-03 22:36:42', NULL, NULL, NULL, NULL),
	(32, 'Employee Management', 'Employee Management', 'card text-white bg-info', '/home/admin/employee-management', NULL, 'S', 2, NULL, 'Admin', 308, 'fa fa-users ', 'Employee', 'Management', 'I', 0, 0, 0, 'V1', 'EMPLOYEE_MANAGEMENT', 0, 'System', '2021-02-03 22:36:42', NULL, NULL, NULL, NULL),
	(33, 'Opportunity Management', 'Opportunity Management', 'card text-white bg-info', '/home/ar-module/opportunity/opportunity-management', NULL, 'S', 29, NULL, 'Admin', 102, 'fa fa-tasks', 'Opportunity', 'Management', 'A', 0, 0, 0, 'V1', 'OPPORTUNITY_MANAGEMENT', 0, 'System', '2021-02-03 22:36:42', NULL, NULL, NULL, NULL),
	(34, 'Proposal Management', 'Proposal Management', 'card text-white bg-info', '/home/ar-module/proposal/proposal-management', NULL, 'S', 29, NULL, 'Admin', 103, 'fa fa-book', 'Proposal', 'Management', 'A', 0, 0, 0, 'V1', 'PROPOSAL_MANAGEMENT', 0, 'System', '2021-02-03 22:36:42', NULL, NULL, NULL, NULL),
	(35, 'Project Management', 'Project Management', 'card text-white bg-info', '/home/ar-module/project/project-management', NULL, 'S', 29, NULL, 'Admin', 104, 'fa fa-building', 'Project', 'Management', 'A', 0, 0, 0, 'V1', 'PROJECT_MANAGEMENT', 0, 'System', '2021-02-03 22:36:42', NULL, NULL, NULL, NULL),
	(36, 'Proposal Approval', 'Proposal Approval', 'card text-white bg-info', '/home/ar-module/approval-proposal/proposal-approval', NULL, 'S', 29, NULL, 'Admin', 107, 'fa fa-check-circle-o', 'Approval', 'Proposal', 'A', 0, 0, 0, 'V1', 'PROPOSAL_APPROVAL', 0, 'System', '2021-02-03 22:36:42', NULL, NULL, NULL, NULL),
	(37, 'Expense Management', 'Expense Management', 'card text-white bg-info', '/home/vendor/expense/expense-management', NULL, 'S', 5, NULL, 'Admin', 209, 'fa fa-usd', 'Expenses', 'Management', 'A', 0, 0, 0, 'V1', 'EXPENSE_MANAGEMENT', 0, 'System', '2021-02-03 22:36:42', NULL, NULL, NULL, NULL),
	(38, 'Expense Approval', 'Expense Approval', 'card text-white bg-info', '/home/vendor/approval-expense', NULL, 'S', 5, NULL, 'Admin', 210, 'fa fa-check-circle-o', 'Expense', 'Approval', 'A', 0, 0, 0, 'V1', 'EXPENSE_APPROVAL', 0, 'System', '2021-02-03 22:36:42', NULL, NULL, NULL, NULL),
	(40, 'Opportunity Approval', 'Opportunity Approval', 'card text-white bg-info', '/home/ar-module/approval-opportunity/opportunity-approval', NULL, 'S', 29, NULL, 'Admin', 106, 'fa fa-check-circle-o', 'Opportunity', 'Approval', 'A', 0, 0, 0, 'V1', 'OPPORTUNITY_APPROVAL', 0, 'System', '2021-02-03 22:36:42', NULL, NULL, NULL, NULL),
	(41, 'Project Approval', 'Project Approval', 'card text-white bg-info', '/home/ar-module/approval-project/project-approval', NULL, 'S', 29, NULL, 'Admin', 108, 'fa fa-check-circle-o', 'Project', 'Approval', 'A', 0, 0, 0, 'V1', 'PROJECT_APPROVAL', 0, 'System', '2021-02-03 22:36:42', NULL, NULL, NULL, NULL),
	(42, 'Purchase Order Management', 'Purchase Order Management', 'card text-white bg-info', '/home/purchase-order/management/po-management', NULL, 'S', 5, NULL, 'Admin', 211, 'fa fa-usd', 'Purchase Order', 'Management', 'A', 0, 0, 0, 'V1', 'PURCHASE_ORDER_MANAGEMENT', 0, 'System', '2021-02-03 22:36:42', NULL, NULL, NULL, NULL),
	(43, 'Purchase Order Approval', 'Purchase Order Approval', 'card text-white bg-info', '/home/purchase-order/approval-po', NULL, 'S', 5, NULL, 'Admin', 212, 'fa fa-check-circle-o', 'Purchase Order', 'Approval', 'A', 0, 0, 0, 'V1', 'PURCHASE_ORDER_APPROVAL', 0, 'System', '2021-02-03 22:36:42', NULL, NULL, NULL, NULL),
	(45, 'Purchase Order Receipt', 'Purchase Order Receipt', 'card text-white bg-info', '/home/po-receipt/management/po-receipt', NULL, 'S', 5, NULL, 'Admin', 215, 'fa fa-file-text-o', 'PurchaseOrder', 'Receipt', 'A', 0, 0, 0, 'V1', 'PURCHASE_ORDER_RECEIPT', 0, 'System', '2021-02-03 22:36:42', NULL, NULL, NULL, NULL),
	(51, 'Item Management', 'Item Management', 'card text-white bg-info', '/home/item-catalogue/management/item-management', NULL, 'S', 5, NULL, 'Admin', 309, 'fa fa-cube', 'Item', 'Management', 'A', 0, 0, 0, 'V1', 'ITEM_MANAGEMENT', 0, 'System', '2021-02-03 22:36:42', NULL, NULL, NULL, NULL),
	(52, 'Account Management', 'Account Management', 'card text-white bg-info', '/home/account/management/account-management', NULL, 'S', 5, NULL, 'Admin', 209, 'fa fa-industry', 'Account', 'Management', 'A', 0, 0, 0, 'V1', 'ACCOUNT_MANAGEMENT', 0, 'System', '2021-02-03 22:36:42', NULL, NULL, NULL, NULL),
	(53, 'Admin', 'Admin', 'fa fa-key', '/home/admin', NULL, 'S', 67, NULL, 'Admin', 0, 'fa fa-key', 'Admin', 'Admin', 'A', 1, 1, 1, 'V2', 'ADMIN', 1, 'System', '2021-02-07 01:02:09', NULL, NULL, NULL, NULL),
	(54, 'Dashboard', 'Dashboard', 'fa fa-th-large', '/home/dashboard', NULL, 'S', 67, NULL, 'Admin', 0, 'fa fa-th-large', 'Dashboard', 'Dashboard', 'A', 1, 1, 1, 'V2', 'DASHBOARD', 1, 'System', '2021-02-07 01:02:09', NULL, NULL, NULL, NULL),
	(55, 'Settings', 'Settings', 'fa fa-cog', '/home/settings', NULL, 'S', 67, NULL, 'Admin', 0, 'fa fa-cog', 'Settings', 'Settings', 'A', 1, 1, 0, 'V2', 'SETTINGS', 1, 'System', '2021-02-07 01:02:09', NULL, NULL, NULL, NULL),
	(56, 'Automation', 'Automation', 'fa fa-tasks', '/home/automation', NULL, 'S', 67, NULL, 'Admin', 0, 'fa fa-tasks', 'Automations', 'Automations', 'A', 1, 1, 0, 'V2', 'AUTOMATION', 1, 'System', '2021-02-07 01:02:09', NULL, NULL, NULL, NULL),
	(57, 'Vendors', 'Vendors', 'fa fa-user', '/home/vendor', NULL, 'S', 68, NULL, 'Admin', 0, 'fa fa-user', 'Vendors', 'Vendors', 'A', 0, 1, 0, 'V2', 'VENDORS', 1, 'System', '2021-02-07 01:02:09', NULL, NULL, NULL, NULL),
	(58, 'Bills', 'Bills', 'fa fa-file-text-o', '/home/vendor', NULL, 'S', 68, NULL, 'Admin', 0, 'fa fa-file-text-o', 'Bills', 'Bills', 'A', 0, 1, 0, 'V2', 'BILL_MANAGEMENT', 0, 'System', '2021-02-07 01:02:09', NULL, NULL, NULL, NULL),
	(59, 'Purchase Orders', 'Purchase Orders', 'fa fa-money', '/home/purchase-order', NULL, 'S', 68, NULL, 'Admin', 0, 'fa fa-money', 'PO', 'PO', 'A', 0, 1, 1, 'V2', 'PO', 0, 'System', '2021-02-12 00:52:56', NULL, NULL, NULL, NULL),
	(60, 'Expenses', 'Expenses', 'fa fa-credit-card', '/home/expense', NULL, 'S', 68, NULL, 'Admin', 0, 'fa fa-credit-card', 'Expenses', 'Expenses', 'A', 0, 1, 0, 'V2', 'EXPENSES', 1, 'System', '2021-02-07 01:02:09', NULL, NULL, NULL, NULL),
	(61, 'Items', 'Items', 'fa fa-cube', '/home/item', NULL, 'S', 67, NULL, 'Admin', 0, 'fa fa-cube', 'Items', 'Items', 'A', 0, 1, 1, 'V2', 'ITEMS', 1, 'System', '2021-02-07 01:02:09', NULL, NULL, NULL, NULL),
	(62, 'Accounts', 'Accounts', 'fa fa-industry', '/home/account', NULL, 'S', 67, NULL, 'Admin', 0, 'fa fa-industry', 'Accounts', 'Accounts', 'A', 0, 1, 0, 'V2', 'ACCOUNTS', 1, 'System', '2021-02-07 01:02:09', NULL, NULL, NULL, NULL),
	(63, 'Project Codes', 'Project Codes', 'fa fa-code', '/home/project-code', NULL, 'S', 69, NULL, 'Admin', 0, 'fa fa-code', 'Project Codes', 'Project Codes', 'A', 0, 1, 0, 'V2', 'PROJECT_CODES', 1, 'System', '2021-02-07 01:02:09', NULL, NULL, NULL, NULL),
	(64, 'Users', 'Users', 'fa fa-user', '/home/admin', '0', 'S', 53, NULL, 'Admin', 0, 'fa fa-user', 'Users', 'Users', 'A', 1, 1, 1, 'V2', 'USERS', 0, 'System', '2021-02-11 10:23:46', NULL, NULL, NULL, NULL),
	(65, 'Roles', 'Roles', 'fa fa-lock', '/home/admin', '1', 'S', 53, NULL, 'Admin', 0, 'fa fa-lock', 'Roles', 'Roles', 'A', 1, 1, 1, 'V2', 'ROLES', 0, 'System', '2021-02-11 10:21:22', NULL, NULL, NULL, NULL),
	(66, 'Approval Groups', 'Approval Groups', 'fa fa-users', '/home/admin', '2', 'S', 53, NULL, 'Admin', 0, 'fa fa-users', 'Approval Groups', 'Approval Groups', 'A', 1, 1, 1, 'V2', 'APPROVAL_GROUPS', 0, 'System', '2021-02-11 10:21:25', NULL, NULL, NULL, NULL),
	(67, 'Company', 'Company', 'fa fa-home', '', NULL, 'M', NULL, NULL, 'Admin', 0, 'fa fa-home', 'Company', 'Company', 'A', 1, 1, 0, 'V2', 'CPMPANY', 0, 'System', '2021-02-06 16:31:26', NULL, NULL, NULL, NULL),
	(68, 'Payable', 'Payable', 'fa fa-industry', '', NULL, 'M', NULL, NULL, 'Admin', 0, 'fa fa-industry', 'Payable', 'Payable', 'A', 1, 1, 0, 'V2', 'PAYABLE', 0, 'System', '2021-02-06 17:15:39', NULL, NULL, NULL, NULL),
	(69, 'Receivable', 'Receivable', 'fa fa-cube', '', NULL, 'M', NULL, NULL, 'Admin', 0, 'fa fa-industry', 'Receivable', 'Receivable', 'A', 1, 1, 0, 'V2', 'RECEIVABLE', 0, 'System', '2021-02-06 16:31:57', NULL, NULL, NULL, NULL),
	(70, 'Company Profile', 'Company Profile', 'fa fa-building', '/home/settings', '0', 'S', 55, NULL, 'Admin', 0, 'fa fa-building', 'Company Profile', 'Company Profile', 'A', 1, 1, 1, 'V2', 'COMPANY_PROFILE', 0, 'System', '2021-02-11 10:21:28', NULL, NULL, NULL, NULL),
	(71, 'Additional Fields', 'Additional Fields', 'fa fa-pencil-square-o', '/home/settings', '1', 'S', 55, NULL, 'Admin', 0, 'fa fa-pencil-square-o', 'Additional Fields', 'Additional Fields', 'A', 1, 1, 1, 'V2', 'ADDITIONAL_FIELDS', 0, 'System', '2021-02-11 10:21:30', NULL, NULL, NULL, NULL),
	(72, 'Bills', 'Bills', 'fa fa-file-text-o', '/home/bills', '0', 'S', 58, NULL, 'Admin', 0, 'fa fa-file-text-o', 'Bills', 'Bills', 'A', 1, 1, 1, 'V2', 'BILL', 1, 'System', '2021-02-11 10:21:36', NULL, NULL, NULL, NULL),
	(73, 'Bill Payments', 'Bill Payments', 'fa fa-list-alt', '/home/bills', '1', 'S', 58, NULL, 'Admin', 0, 'fa fa-list-alt', 'Bill Payments', 'Bill Payments', 'A', 1, 1, 1, 'V2', 'BILL_PAYMENT', 0, 'System', '2021-02-11 10:21:39', NULL, NULL, NULL, NULL),
	(74, 'Purchase Orders', 'Purchase Orders', 'fa fa-money', '/home/purchase-order', '0', 'S', 59, NULL, 'Admin', 0, 'fa fa-money', 'Purchase Orders', 'Purchase Orders', 'A', 1, 1, 1, 'V2', 'PURCHASE_ORDER', 1, 'System', '2021-02-12 00:52:38', NULL, NULL, NULL, NULL),
	(75, 'PO Receipts', 'PO Receipts', 'fa fa-usd', '/home/purchase-order', '1', 'S', 59, NULL, 'Admin', 0, 'fa fa-usd', 'PO Receipts', 'PO Receipts', 'A', 1, 1, 1, 'V2', 'PO_RECEIPT', 0, 'System', '2021-02-12 00:52:14', NULL, NULL, NULL, NULL),
	(76, 'Sub Accounts', 'Sub Accounts', 'fa fa-users', '/home/sub-accounts', NULL, 'S', 67, NULL, 'Admin', 0, 'fa fa-users', 'Sub Accounts', 'Sub Accounts', 'A', 1, 0, 0, 'V2', 'SUB_ACCOUNT', 0, 'System', '2021-02-12 00:52:03', NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `umm_menu` ENABLE KEYS */;

DROP TABLE IF EXISTS `umm_menu_privilage`;
CREATE TABLE IF NOT EXISTS `umm_menu_privilage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_id` int(11) NOT NULL,
  `prililage_id` int(11) NOT NULL,
  `auth_code` varchar(75) NOT NULL,
  `created_by` varchar(100) NOT NULL,
  `created_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `update_by` varchar(100) DEFAULT NULL,
  `update_on` datetime DEFAULT NULL,
  `delete_by` varchar(100) DEFAULT NULL,
  `delete_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `menu_id` (`menu_id`) USING BTREE,
  KEY `privilage_id` (`prililage_id`) USING BTREE,
  CONSTRAINT `umm_menu_privilage_ibfk_1` FOREIGN KEY (`menu_id`) REFERENCES `umm_menu` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `umm_menu_privilage_ibfk_2` FOREIGN KEY (`prililage_id`) REFERENCES `umm_privilages` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=335 DEFAULT CHARSET=latin1;

/*!40000 ALTER TABLE `umm_menu_privilage` DISABLE KEYS */;
INSERT INTO `umm_menu_privilage` (`id`, `menu_id`, `prililage_id`, `auth_code`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES
	(1, 3, 1, 'USER_MANAGEMENT_CREATE', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(2, 3, 2, 'USER_MANAGEMENT_SEARCH', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(3, 3, 3, 'USER_MANAGEMENT_DETAIL_VIEW', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(4, 3, 4, 'USER_MANAGEMENT_EDIT', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(5, 3, 5, 'USER_MANAGEMENT_DELETE', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(6, 4, 1, 'ROLE_MANAGEMENT_CREATE', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(7, 4, 2, 'ROLE_MANAGEMENT_SEARCH', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(8, 4, 3, 'ROLE_MANAGEMENT_DETAIL_VIEW', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(9, 4, 4, 'ROLE_MANAGEMENT_EDIT', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(10, 4, 5, 'ROLE_MANAGEMENT_DELETE', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(11, 6, 1, 'VENDOR_MANAGEMENT_CREATE', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(12, 6, 2, 'VENDOR_MANAGEMENT_SEARCH', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(13, 6, 3, 'VENDOR_MANAGEMENT_DETAIL_VIEW', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(14, 6, 4, 'VENDOR_MANAGEMENT_EDIT', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(15, 6, 5, 'VENDOR_MANAGEMENT_DELETE', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(19, 8, 1, 'WORKFLOW_CONFIGURATION_CREATE', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(20, 8, 2, 'WORKFLOW_CONFIGURATION_SEARCH', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(21, 8, 3, 'WORKFLOW_CONFIGURATION_DETAIL_VIEW', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(22, 8, 4, 'WORKFLOW_CONFIGURATION_EDIT', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(23, 8, 5, 'WORKFLOW_CONFIGURATION_DELETE', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(24, 9, 8, 'UPLOAD_INVOICE_UPLOAD', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(25, 10, 5, 'REVIEW_INVOICE_DELETE', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(26, 10, 11, 'REVIEW_INVOICE_SUBMIT', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(27, 11, 2, 'INVOICE_APPROVAL_SEARCH', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(28, 11, 3, 'INVOICE_APPROVAL_DETAIL_VIEW', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(29, 11, 6, 'INVOICE_APPROVAL_APPROVE', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(30, 11, 7, 'INVOICE_APPROVAL_REJECT', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(31, 11, 10, 'INVOICE_APPROVAL_VIEW_AUDIT_TRAIL', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(33, 12, 8, 'PROJECT_CODE_MANAGEMENT_UPLOAD', 'admin', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(34, 3, 8, 'USER_MANAGEMENT_UPLOAD', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(35, 12, 2, 'PROJECT_CODE_MANAGEMENT_SEARCH', 'admin', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(36, 12, 13, 'PROJECT_CODE_MANAGEMENT_INACTIVATE', 'admin', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(37, 12, 14, 'PROJECT_CODE_MANAGEMENT_ACTIVATE', 'admin', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(38, 3, 15, 'USER_MANAGEMENT_RESET_PASSWORD', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(39, 4, 13, 'ROLE_MANAGEMENT_INACTIVATE', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(40, 4, 14, 'ROLE_MANAGEMENT_ACTIVATE', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(41, 13, 16, 'INVOICE_SEARCH_ASSIGNEE_CHANGE', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(42, 13, 17, 'INVOICE_SEARCH_UNDO_APPROVAL', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(43, 13, 18, 'INVOICE_SEARCH_UNDO_REJECTION', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(44, 13, 2, 'INVOICE_SEARCH_SEARCH', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(45, 13, 3, 'INVOICE_SEARCH_DETAIL_VIEW', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(48, 13, 10, 'INVOICE_SEARCH_VIEW_AUDIT_TRAIL', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(49, 13, 12, 'INVOICE_SEARCH_RE_SUBMIT', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(51, 14, 22, 'DASHBOARD_SYSTEM_SHORTCUTS', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(52, 14, 23, 'DASHBOARD_INVOICE_SUMMARY ', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(53, 14, 24, 'DASHBOARD_ACCUMULATED_INVOICE_SUMMARY ', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(54, 14, 25, 'DASHBOARD_INVOICE_APPROVAL', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(55, 20, 1, 'E_INVOICE_CREATE', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(59, 21, 1, 'PAYMENT_MANAGEMENT_CREATE', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(60, 21, 26, 'PAYMENT_MANAGEMENT_CHANGE_INVOICE', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(61, 21, 27, 'PAYMENT_MANAGEMENT_MARK_AS_MAILED', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(62, 21, 28, 'PAYMENT_MANAGEMENT_REVOKE_PAYMENT', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(64, 13, 5, 'INVOICE_SEARCH_DELETE', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(65, 22, 29, 'SYNC_DASHBOARD_CHECK_SYNC', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(66, 22, 30, 'SYNC_DASHBOARD_VENDOR_SYNC', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(67, 22, 31, 'SYNC_DASHBOARD_CHANGE_AUTO_SYNC_STATUS', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(68, 22, 32, 'SYNC_DASHBOARD_VIEW_CHECK_SYNC_HISTORY', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(69, 22, 33, 'SYNC_DASHBOARD_VIEW_VENDOR_SYNC_HISTORY', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(70, 14, 34, 'DASHBOARD_VIEW_DISCOUNT_APPLICABLE_INVOICES', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(71, 21, 2, 'PAYMENT_MANAGEMENT_SEARCH', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(72, 21, 35, 'PAYMENT_MANAGEMENT_VIEW_INVOICE', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(73, 23, 1, 'APPROVAL_GROUP_MANAGEMENT_CREATE', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(74, 23, 2, 'APPROVAL_GROUP_MANAGEMENT_SEARCH', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(75, 23, 4, 'APPROVAL_GROUP_MANAGEMENT_EDIT', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(76, 23, 5, 'APPROVAL_GROUP_MANAGEMENT_DELETE', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(77, 23, 13, 'APPROVAL_GROUP_MANAGEMENT_INACTIVATE', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(78, 23, 14, 'APPROVAL_GROUP_MANAGEMENT_ACTIVATE', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(79, 6, 8, 'VENDOR_MANAGEMENT_UPLOAD', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(85, 28, 37, 'SETTINGS_CHANGE_PACKAGE', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(86, 30, 1, 'CLIENT_MANAGEMENT_CREATE', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(87, 30, 2, 'CLIENT_MANAGEMENT_SEARCH', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(88, 30, 3, 'CLIENT_MANAGEMENT_DETAIL_VIEW', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(89, 30, 4, 'CLIENT_MANAGEMENT_EDIT', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(90, 30, 5, 'CLIENT_MANAGEMENT_DELETE', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(91, 12, 1, 'PROJECT_CODE_MANAGEMENT_CREATE', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(92, 32, 1, 'EMPLOYEE_MANAGEMENT_CREATE', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(93, 32, 2, 'EMPLOYEE_MANAGEMENT_SEARCH', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(94, 32, 4, 'EMPLOYEE_MANAGEMENT_EDIT', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(95, 32, 5, 'EMPLOYEE_MANAGEMENT_DELETE', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(96, 32, 13, 'EMPLOYEE_MANAGEMENT_INACTIVATE', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(97, 32, 14, 'EMPLOYEE_MANAGEMENT_ACTIVATE', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(98, 32, 8, 'EMPLOYEE_MANAGEMENT_UPLOAD', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(99, 33, 1, 'OPPORTUNITY_MANAGEMENT_CREATE', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(100, 33, 2, 'OPPORTUNITY_MANAGEMENT_SEARCH', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(101, 33, 3, 'OPPORTUNITY_MANAGEMENT_DETAIL_VIEW', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(102, 33, 4, 'OPPORTUNITY_MANAGEMENT_EDIT', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(103, 33, 5, 'OPPORTUNITY_MANAGEMENT_DELETE', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(105, 34, 1, 'PROPOSAL_MANAGEMENT_CREATE', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(106, 34, 2, 'PROPOSAL_MANAGEMENT_SEARCH', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(107, 34, 3, 'PROPOSAL_MANAGEMENT_DETAIL_VIEW', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(108, 34, 4, 'PROPOSAL_MANAGEMENT_EDIT', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(109, 34, 5, 'PROPOSAL_MANAGEMENT_DELETE', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(110, 34, 10, 'PROPOSAL_MANAGEMENT_VIEW_AUDIT_TRAIL', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(111, 35, 1, 'PROJECT_MANAGEMENT_CREATE', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(112, 35, 2, 'PROJECT_MANAGEMENT_SEARCH', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(113, 35, 3, 'PROJECT_MANAGEMENT_DETAIL_VIEW', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(114, 35, 4, 'PROJECT_MANAGEMENT_EDIT', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(115, 35, 5, 'PROJECT_MANAGEMENT_DELETE', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(116, 35, 10, 'PROJECT_MANAGEMENT_VIEW_AUDIT_TRAIL', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(117, 36, 6, 'PROPOSAL_APPROVAL_APPROVE', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(118, 36, 7, 'PROPOSAL_APPROVAL_REJECT', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(119, 37, 1, 'EXPENSE_MANAGEMENT_CREATE', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(120, 37, 2, 'EXPENSE_MANAGEMENT_SEARCH', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(121, 34, 16, 'PROPOSAL_MANAGEMENT_ASSIGNEE_CHANGE', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(122, 40, 6, 'OPPORTUNITY_APPROVAL_APPROVE', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(123, 40, 7, 'OPPORTUNITY_APPROVAL_REJECT', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(131, 34, 38, 'PROPOSAL_MANAGEMENT_SKIP_APPROVAL', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(132, 37, 4, 'EXPENSE_MANAGEMENT_EDIT', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(133, 37, 5, 'EXPENSE_MANAGEMENT_DELETE', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(134, 37, 10, 'EXPENSE_MANAGEMENT_VIEW_AUDIT_TRAIL', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(135, 37, 16, 'EXPENSE_MANAGEMENT_ASSIGNEE_CHANGE', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(136, 37, 38, 'EXPENSE_MANAGEMENT_SKIP_APPROVAL', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(137, 41, 6, 'PROJECT_APPROVAL_APPROVE', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(138, 41, 7, 'PROJECT_APPROVAL_REJECT', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(139, 38, 6, 'EXPENSE_APPROVAL_APPROVE', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(140, 38, 7, 'EXPENSE_APPROVAL_REJECT', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(141, 38, 39, 'EXPENSE_APPROVAL_DOWNLOAD_RECEIPT', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(144, 33, 16, 'OPPORTUNITY_MANAGEMENT_ASSIGNEE_CHANGE', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(145, 33, 10, 'OPPORTUNITY_MANAGEMENT_VIEW_AUDIT_TRAIL', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(146, 33, 38, 'OPPORTUNITY_MANAGEMENT_SKIP_APPROVAL', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(147, 40, 40, 'OPPORTUNITY_APPROVAL_OVERRIDE_APPROVAL', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(148, 36, 40, 'PROPOSAL_APPROVAL_OVERRIDE_APPROVAL', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(149, 41, 40, 'PROJECT_APPROVAL_OVERRIDE_APPROVAL', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(150, 38, 40, 'EXPENSE_APPROVAL_OVERRIDE_APPROVAL', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(151, 42, 1, 'PURCHASE_ORDER_MANAGEMENT_CREATE', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(152, 42, 2, 'PURCHASE_ORDER_MANAGEMENT_SEARCH', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(153, 42, 3, 'PURCHASE_ORDER_MANAGEMENT_DETAIL_VIEW', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(154, 42, 4, 'PURCHASE_ORDER_MANAGEMENT_EDIT', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(155, 42, 5, 'PURCHASE_ORDER_MANAGEMENT_DELETE', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(156, 42, 10, 'PURCHASE_ORDER_MANAGEMENT_VIEW_AUDIT_TRAIL', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(157, 42, 16, 'PURCHASE_ORDER_MANAGEMENT_ASSIGNEE_CHANGE', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(158, 42, 38, 'PURCHASE_ORDER_MANAGEMENT_SKIP_APPROVAL', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(159, 42, 39, 'PURCHASE_ORDER_MANAGEMENT_DOWNLOAD_RECEIPT', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(160, 43, 6, 'PURCHASE_ORDER_APPROVAL_APPROVE', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(161, 43, 7, 'PURCHASE_ORDER_APPROVAL_REJECT', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(162, 21, 39, 'PAYMENT_MANAGEMENT_DOWNLOAD_RECEIPT', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(166, 43, 39, 'PURCHASE_ORDER_APPROVAL_DOWNLOAD_RECEIPT', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(167, 35, 16, 'PROJECT_MANAGEMENT_ASSIGNEE_CHANGE', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(168, 35, 38, 'PROJECT_MANAGEMENT_SKIP_APPROVAL', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(170, 43, 40, 'PURCHASE_ORDER_APPROVAL_OVERRIDE_APPROVAL', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(171, 13, 38, 'INVOICE_SEARCH_SKIP_APPROVAL', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(172, 11, 40, 'INVOICE_APPROVAL_OVERRIDE_APPROVAL', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(173, 45, 1, 'PURCHASE_ORDER_RECEIPT_CREATE', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(174, 45, 2, 'PURCHASE_ORDER_RECEIPT_SEARCH', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(175, 45, 4, 'PURCHASE_ORDER_RECEIPT_EDIT', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(176, 45, 5, 'PURCHASE_ORDER_RECEIPT_DELETE', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(177, 45, 41, 'PURCHASE_ORDER_RECEIPT_CLOSE_PO_RECEIPT', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(180, 12, 43, 'PROJECT_CODE_MANAGEMENT_EDIT_DESCRIPTION', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(181, 42, 42, 'PURCHASE_ORDER_MANAGEMENT_GENERATE_AN_INVOICE', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(182, 13, 44, 'INVOICE_SEARCH_GENERATE_DETAILED_REPORT', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(183, 45, 45, 'PURCHASE_ORDER_RECEIPT_OPEN_PO_RECEIPT', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(184, 11, 46, 'INVOICE_APPROVAL_DOWNLOAD_INVOICE', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(185, 13, 46, 'INVOICE_SEARCH_DOWNLOAD_INVOICE', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(186, 37, 44, 'EXPENSE_MANAGEMENT_GENERATE_DETAILED_REPORT', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(187, 13, 47, 'INVOICE_SEARCH_CSV_EXPORT', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(188, 21, 48, 'PAYMENT_MANAGEMENT_CSV_IMPORT', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(189, 37, 47, 'EXPENSE_MANAGEMENT_CSV_EXPORT', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(193, 21, 3, 'PAYMENT_MANAGEMENT_DETAIL_VIEW', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(201, 6, 50, 'VENDOR_MANAGEMENT_APPROVE_PERMISSION_REQUEST', 'Sytem', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(202, 6, 51, 'VENDOR_MANAGEMENT_REJECTPERMISSION_REQUEST', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(203, 51, 1, 'ITEM_MANAGEMENT_CREATE', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(204, 51, 2, 'ITEM_MANAGEMENT_SEARCH', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(205, 51, 3, 'ITEM_MANAGEMENT_DETAIL_VIEW', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(206, 51, 4, 'ITEM_MANAGEMENT_EDIT', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(207, 51, 5, 'ITEM_MANAGEMENT_DELETE', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(208, 52, 1, 'ACCOUNT_MANAGEMENT_CREATE', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(209, 52, 2, 'ACCOUNT_MANAGEMENT_SEARCH', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(210, 52, 4, 'ACCOUNT_MANAGEMENT_EDIT', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(211, 52, 5, 'ACCOUNT_MANAGEMENT_DELETE', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(212, 52, 3, 'ACCOUNT_MANAGEMENT_DETAIL_VIEW', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(213, 12, 5, 'PROJECT_CODE_MANAGEMENT_DELETE', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(214, 6, 54, 'VENDOR_MANAGEMENT_ADD_VENDOR', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(215, 64, 1, 'USERS_CREATE', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(216, 64, 5, 'USERS_DELETE', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(217, 64, 13, 'USERS_INACTIVATE', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(218, 64, 14, 'USERS_ACTIVATE', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(219, 64, 4, 'USERS_EDIT', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(220, 64, 3, 'USERS_DETAIL_VIEW', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(221, 64, 55, 'USERS_UNLOCK', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(222, 64, 8, 'USERS_UPLOAD', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(223, 65, 1, 'ROLES_CREATE', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(224, 65, 5, 'ROLES_DELETE', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(225, 65, 13, 'ROLES_INACTIVATE', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(226, 65, 14, 'ROLES_ACTIVATE', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(227, 65, 3, 'ROLES_DETAIL_VIEW', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(228, 65, 4, 'ROLES_EDIT', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(229, 66, 1, 'APPROVAL_GROUPS_CREATE', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(230, 66, 4, 'APPROVAL_GROUPS_EDIT', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(231, 66, 5, 'APPROVAL_GROUPS_DELETE', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(232, 66, 13, 'APPROVAL_GROUPS_INACTIVATE', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(233, 66, 14, 'APPROVAL_GROUPS_ACTIVATE', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(234, 66, 8, 'APPROVAL_GROUPS_UPLOAD', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(235, 70, 4, 'COMPANY_PROFILE_EDIT', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(236, 70, 37, 'COMPANY_PROFILE_CHANGE_PACKAGE', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(237, 70, 56, 'COMPANY_PROFILE_CONVERT_TO_PORTAL', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(238, 71, 1, 'ADDITIONAL_FIELDS_CREATE', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(239, 71, 4, 'ADDITIONAL_FIELDS_EDIT', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(240, 71, 5, 'ADDITIONAL_FIELDS_DELETE', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(241, 71, 13, 'ADDITIONAL_FIELDS_INACTIVATE', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(242, 71, 14, 'ADDITIONAL_FIELDS_ACTIVATE', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(243, 56, 1, 'AUTOMATION_CREATE', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(244, 56, 4, 'AUTOMATION_EDIT', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(245, 56, 5, 'AUTOMATION_DELETE', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(246, 56, 13, 'AUTOMATION_INACTIVATE', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(247, 56, 14, 'AUTOMATION_ACTIVATE', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(248, 56, 3, 'AUTOMATION_DETAIL_VIEW', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(249, 61, 1, 'ITEMS_CREATE', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(250, 61, 8, 'ITEMS_UPLOAD', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(251, 61, 4, 'ITEMS_EDIT', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(252, 61, 5, 'ITEMS_DELETE', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(253, 61, 13, 'ITEMS_INACTIVATE', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(254, 61, 14, 'ITEMS_ACTIVATE', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(255, 61, 3, 'ITEMS_DETAIL_VIEW', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(256, 62, 1, 'ACCOUNTS_CREATE', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(257, 62, 8, 'ACCOUNTS_UPLOAD', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(258, 62, 4, 'ACCOUNTS_EDIT', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(259, 62, 5, 'ACCOUNTS_DELETE', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(260, 62, 13, 'ACCOUNTS_INACTIVATE', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(261, 62, 14, 'ACCOUNTS_ACTIVATE', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(262, 62, 3, 'ACCOUNTS_DETAIL_VIEW', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(263, 76, 1, 'SUB_ACCOUNT_CREATE', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(264, 76, 4, 'SUB_ACCOUNT_EDIT', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(265, 76, 5, 'SUB_ACCOUNT_DELETE', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(266, 76, 13, 'SUB_ACCOUNT_INACTIVATE', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(267, 76, 14, 'SUB_ACCOUNT_ACTIVATE', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(268, 76, 3, 'SUB_ACCOUNT_DETAIL_VIEW', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(269, 57, 1, 'VENDORS_CREATE', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(270, 57, 57, 'VENDORS_SEND_VENDOR_INVITATION', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(271, 57, 8, 'VENDORS_UPLOAD', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(272, 57, 58, 'VENDORS_MANAGE_VENDOR_REQUEST', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(273, 57, 4, 'VENDORS_EDIT', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(274, 57, 3, 'VENDORS_DETAIL_VIEW', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(275, 72, 1, 'BILL_CREATE', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(276, 72, 59, 'BILL_PROCESS', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(277, 72, 4, 'BILL_EDIT', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(278, 72, 6, 'BILL_APPROVE', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(279, 72, 7, 'BILL_REJECT', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(280, 72, 60, 'BILL_QUICK_APPROVE', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(281, 72, 38, 'BILL_SKIP_APPROVAL', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(282, 72, 3, 'BILL_DETAIL_VIEW', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(283, 72, 10, 'BILL_VIEW_AUDIT_TRAIL', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(284, 72, 61, 'BILL_DOWNLOAD_BILL', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(285, 72, 62, 'BILL_APPLY_PAYMENT', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(286, 72, 63, 'BILL_VIEW_PAYMENTS', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(287, 72, 5, 'BILL_DELETE', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(288, 72, 47, 'BILL_CSV_EXPORT', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(289, 73, 1, 'BILL_PAYMENT_CREATE', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(290, 73, 8, 'BILL_PAYMENT_UPLOAD', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(292, 73, 64, 'BILL_PAYMENT_CHANGE_BILL', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(293, 73, 27, 'BILL_PAYMENT_MARK_AS_MAILED', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(294, 73, 28, 'BILL_PAYMENT_REVOKE_PAYMENT', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(295, 73, 3, 'BILL_PAYMENT_DETAIL_VIEW', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(296, 73, 65, 'BILL_PAYMENT_VIEW_BILLS', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(297, 73, 47, 'BILL_PAYMENT_CSV_EXPORT', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(298, 73, 39, 'BILL_PAYMENT_DOWNLOAD_RECEIPT', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(299, 74, 1, 'PURCHASE_ORDER_CREATE', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(300, 74, 4, 'PURCHASE_ORDER_EDIT', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(301, 74, 3, 'PURCHASE_ORDER_DETAIL_VIEW', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(302, 74, 5, 'PURCHASE_ORDER_DELETE', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(303, 74, 6, 'PURCHASE_ORDER_APPROVE', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(304, 74, 7, 'PURCHASE_ORDER_REJECT', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(305, 74, 10, 'PURCHASE_ORDER_VIEW_AUDIT_TRAIL', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(306, 74, 47, 'PURCHASE_ORDER_CSV_EXPORT', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(307, 74, 66, 'PURCHASE_ORDER_DOWNLOAD_REPORT', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(308, 74, 60, 'PURCHASE_ORDER_QUICK_APPROVE', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(309, 75, 1, 'PO_RECEIPT_CREATE', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(310, 75, 4, 'PO_RECEIPT_EDIT', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(311, 75, 3, 'PO_RECEIPT_DETAIL_VIEW', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(312, 75, 5, 'PO_RECEIPT_DELETE', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(313, 75, 67, 'PO_RECEIPT_ATTACH_TO_A_BILL', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(314, 75, 41, 'PO_RECEIPT_CLOSE_PO_RECEIPT', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(315, 75, 47, 'PO_RECEIPT_CSV_EXPORT', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(316, 75, 66, 'PO_RECEIPT_DOWNLOAD_REPORT', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(317, 60, 1, 'EXPENSES_CREATE', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(318, 60, 4, 'EXPENSES_EDIT', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(319, 60, 5, 'EXPENSES_DELETE', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(320, 60, 6, 'EXPENSES_APPROVE', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(321, 60, 7, 'EXPENSES_REJECT', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(322, 60, 10, 'EXPENSES_VIEW_AUDIT_TRAIL', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(323, 60, 66, 'EXPENSES_DOWNLOAD_REPORT', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(324, 60, 68, 'EXPENSES_VIEW_REPORT', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(325, 60, 47, 'EXPENSES_CSV_EXPORT', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(326, 60, 60, 'EXPENSES_QUICK_APPROVE', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(327, 63, 1, 'PROJECT_CODES_CREATE', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(328, 63, 4, 'PROJECT_CODES_EDIT', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(329, 63, 5, 'PROJECT_CODES_DELETE', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(330, 63, 13, 'PROJECT_CODES_INACTIVATE', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(331, 63, 14, 'PROJECT_CODES_ACTIVATE', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(333, 63, 8, 'PROJECT_CODES_UPLOAD', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL),
	(334, 63, 47, 'PROJECT_CODES_CSV_EXPORT', 'System', '2021-02-12 01:01:39', NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `umm_menu_privilage` ENABLE KEYS */;

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
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=latin1;

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
	(16, 'Assignee Change', 'Assignee Change', 'ASSIGNEE_CHANGE', 'System', '2021-02-03 22:33:35', NULL, NULL, NULL, NULL),
	(17, 'Undo Approval', 'Undo Approval', 'UNDO_APPROVAL', 'System', '2021-02-03 22:33:35', NULL, NULL, NULL, NULL),
	(18, 'Undo Rejection', 'Undo Rejection', 'UNDO_REJECTION', 'System', '2021-02-03 22:33:35', NULL, NULL, NULL, NULL),
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
	(42, 'Generate an Invoice', 'Generate an Invoice', 'GENERATE_AN_INVOICE', 'System', '2021-02-03 22:33:35', NULL, NULL, NULL, NULL),
	(43, 'Edit Description', 'Edit Description', 'EDIT_DESCRIPTION', 'System', '2021-02-03 22:33:35', NULL, NULL, NULL, NULL),
	(44, 'Generate Detailed Report', 'Generate Detailed Report', 'GENERATE_DETAILED_REPORT', 'System', '2021-02-03 22:33:35', NULL, NULL, NULL, NULL),
	(45, 'Open PO Receipt', 'Open PO Receipt', 'OPEN_PO_RECEIPT', 'System', '2021-02-03 22:33:35', NULL, NULL, NULL, NULL),
	(46, 'Download Invoice', 'Download Invoice', 'DOWNLOAD_INVOICE', 'System', '2021-02-03 22:33:35', NULL, NULL, NULL, NULL),
	(47, 'CSV Export', 'CSV Export', 'CSV_EXPORT', 'System', '2021-02-03 22:33:35', NULL, NULL, NULL, NULL),
	(48, 'CSV Import', 'CSV Import', 'CSV_IMPORT', 'System', '2021-02-03 22:33:35', NULL, NULL, NULL, NULL),
	(50, 'Approve Permission Request', 'Approve Permission Request', 'APPROVE_PERMISSION_REQUEST', 'System', '2021-02-03 22:33:35', NULL, NULL, NULL, NULL),
	(51, 'Reject Permission Request', 'RejectPermission Request', 'REJECTPERMISSION_REQUEST', 'System', '2021-02-03 22:33:35', NULL, NULL, NULL, NULL),
	(54, 'Add Vendor', 'Add Vendor', 'ADD_VENDOR', 'System', '2021-02-03 22:33:35', NULL, NULL, NULL, NULL),
	(55, 'Unlock', 'Unlock', 'UNLOCK', 'System', '2021-02-11 22:23:37', NULL, NULL, NULL, NULL),
	(56, 'Convert To Agency Portal', 'Convert To Agency Portal', 'CONVERT_TO_PORTAL', 'System', '2021-02-11 22:41:46', NULL, NULL, NULL, NULL),
	(57, 'Send Vendor Invitation', 'Send Vendor Invitation', 'SEND_VENDOR_INVITATION', 'System', '2021-02-11 23:26:57', NULL, NULL, NULL, NULL),
	(58, 'Manage Vendor Request', 'Manage Vendor Request', 'MANAGE_VENDOR_REQUEST', 'System', '2021-02-11 23:32:57', NULL, NULL, NULL, NULL),
	(59, 'Process', 'Process', 'PROCESS', 'System', '2021-02-11 23:51:24', NULL, NULL, NULL, NULL),
	(60, 'Quick Approve', 'Quick Approve', 'QUICK_APPROVE', 'System', '2021-02-11 23:53:21', NULL, NULL, NULL, NULL),
	(61, 'Download Bill', 'Download Bill', 'DOWNLOAD_BILL', 'System', '2021-02-11 23:59:44', NULL, NULL, NULL, NULL),
	(62, 'Apply Payments', 'Apply Payments', 'APPLY_PAYMENT', 'System', '2021-02-12 00:01:00', NULL, NULL, NULL, NULL),
	(63, 'View Payments', 'View Payments', 'VIEW_PAYMENTS', 'System', '2021-02-12 00:01:26', NULL, NULL, NULL, NULL),
	(64, 'Change Bill', 'Change Bill', 'CHANGE_BILL', 'System', '2021-02-12 00:06:22', NULL, NULL, NULL, NULL),
	(65, 'View Bills', 'View Bills', 'VIEW_BILLS', 'System', '2021-02-12 00:09:06', NULL, NULL, NULL, NULL),
	(66, 'Download Report', 'Download Report', 'DOWNLOAD_REPORT', 'System', '2021-02-12 00:18:06', NULL, NULL, NULL, NULL),
	(67, 'Attach To a Bill', 'Attach To a Bill', 'ATTACH_TO_A_BILL', 'System', '2021-02-12 00:23:04', NULL, NULL, NULL, NULL),
	(68, 'View Report', 'View Report', 'VIEW_REPORT', 'System', '2021-02-12 00:32:30', NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `umm_privilages` ENABLE KEYS */;

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*!40000 ALTER TABLE `umm_role_field_config` DISABLE KEYS */;
INSERT INTO `umm_role_field_config` (`id`, `role_id`, `field_id`, `sub_account_id`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES
	(1, 11, 2, NULL, 'admin', '2021-03-06 11:34:14', NULL, NULL, NULL, NULL),
	(2, 11, 33, NULL, 'admin', '2021-03-06 11:34:14', NULL, NULL, NULL, NULL),
	(3, 11, 35, NULL, 'admin', '2021-03-06 11:34:14', NULL, NULL, NULL, NULL),
	(4, 11, 39, NULL, 'admin', '2021-03-06 11:34:14', NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `umm_role_field_config` ENABLE KEYS */;

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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

/*!40000 ALTER TABLE `umm_role_mst` DISABLE KEYS */;
INSERT INTO `umm_role_mst` (`id`, `name`, `status`, `vendor_id`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES
	(6, 'System Admin Role', 'A', NULL, 'admin', '2019-07-03 14:18:40', 'admin', '2021-03-06 12:41:07', NULL, NULL),
	(7, 'Employee - expense only', 'A', NULL, 'admin', '2020-05-12 10:06:41', NULL, NULL, NULL, NULL),
	(8, 'AP Invoice Processor', 'A', NULL, 'admin', '2020-05-12 10:10:50', NULL, NULL, NULL, NULL),
	(9, 'Controller', 'A', NULL, 'admin', '2020-05-12 10:13:45', NULL, NULL, NULL, NULL),
	(10, 'Purchasing', 'A', NULL, 'admin', '2020-05-12 10:18:41', NULL, NULL, NULL, NULL),
	(11, 'Project Manager', 'A', NULL, 'admin', '2020-05-12 10:24:55', 'admin', '2021-03-06 11:34:14', NULL, NULL),
	(12, 'Finance Manager', 'A', NULL, 'admin', '2020-05-12 10:27:30', NULL, NULL, NULL, NULL),
	(13, 'CFO', 'A', NULL, 'admin', '2020-05-12 10:28:52', NULL, NULL, NULL, NULL),
	(14, 'Vendor', 'A', NULL, 'admin', '2020-05-12 10:33:15', NULL, NULL, NULL, NULL),
	(15, 'Business Manager', 'A', NULL, 'admin', '2020-05-12 10:36:26', NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `umm_role_mst` ENABLE KEYS */;

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
) ENGINE=InnoDB AUTO_INCREMENT=977 DEFAULT CHARSET=latin1;

/*!40000 ALTER TABLE `umm_role_previlege` DISABLE KEYS */;
INSERT INTO `umm_role_previlege` (`id`, `role_id`, `privilege_id`, `sub_account_id`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES
	(164, 7, 136, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(165, 7, 135, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(166, 7, 134, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(167, 7, 133, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(168, 7, 132, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(169, 7, 120, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(170, 7, 119, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(171, 7, 51, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(172, 8, 24, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(173, 8, 25, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(174, 8, 26, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(175, 8, 27, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(176, 8, 28, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(177, 8, 29, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(178, 8, 31, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(179, 8, 30, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(180, 8, 41, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(181, 8, 42, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(182, 8, 18, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(183, 8, 17, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(184, 8, 16, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(185, 8, 51, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(186, 8, 52, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(187, 8, 53, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(188, 8, 54, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(189, 8, 70, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(190, 8, 11, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(191, 8, 12, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(192, 8, 13, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(193, 8, 14, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(194, 8, 15, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(195, 8, 79, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(196, 8, 43, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(197, 8, 44, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(198, 8, 45, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(199, 8, 135, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(200, 8, 136, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(201, 8, 139, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(202, 8, 140, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(203, 8, 141, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(204, 8, 150, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(205, 8, 163, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(206, 8, 164, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(207, 8, 165, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(208, 8, 173, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(209, 8, 174, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(210, 8, 175, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(211, 8, 176, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(212, 8, 177, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(213, 8, 183, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(214, 8, 134, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(215, 8, 133, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(216, 8, 132, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(217, 8, 48, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(218, 8, 49, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(219, 8, 64, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(220, 8, 171, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(221, 8, 182, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(222, 8, 55, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(223, 8, 59, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(224, 8, 60, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(225, 8, 61, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(226, 8, 62, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(227, 8, 71, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(228, 8, 72, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(229, 8, 162, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(230, 8, 119, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(231, 8, 120, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(232, 9, 29, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(233, 9, 55, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(234, 9, 160, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(235, 9, 181, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(236, 9, 159, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(237, 9, 95, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(238, 9, 156, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(239, 9, 155, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(240, 9, 154, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(241, 9, 153, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(242, 9, 161, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(243, 9, 166, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(244, 9, 175, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(245, 9, 94, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(246, 9, 174, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(247, 9, 173, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(248, 9, 165, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(249, 9, 164, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(250, 9, 163, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(251, 9, 170, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(252, 9, 152, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(253, 9, 151, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(254, 9, 119, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(255, 9, 162, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(256, 9, 72, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(257, 9, 71, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(258, 9, 62, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(259, 9, 61, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(260, 9, 60, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(261, 9, 59, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(262, 9, 120, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(263, 9, 132, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(264, 9, 150, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(265, 9, 141, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(266, 9, 140, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(267, 9, 139, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(268, 9, 136, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(269, 9, 135, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(270, 9, 134, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(271, 9, 133, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(272, 9, 176, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(273, 9, 177, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(274, 9, 66, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(275, 9, 65, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(276, 9, 180, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(277, 9, 91, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(278, 9, 37, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(279, 9, 36, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(280, 9, 35, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(281, 9, 33, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(282, 9, 67, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(283, 9, 68, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(284, 9, 85, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(285, 9, 78, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(286, 9, 77, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(287, 9, 76, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(288, 9, 75, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(289, 9, 74, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(290, 9, 73, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(291, 9, 69, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(292, 9, 23, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(293, 9, 21, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(294, 9, 38, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(295, 9, 34, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(296, 9, 5, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(297, 9, 4, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(298, 9, 3, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(299, 9, 2, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(300, 9, 1, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(301, 9, 183, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(302, 9, 6, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(303, 9, 7, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(304, 9, 20, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(305, 9, 19, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(306, 9, 40, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(307, 9, 39, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(308, 9, 93, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(309, 9, 10, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(310, 9, 9, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(311, 9, 8, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(312, 9, 92, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(313, 9, 182, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(314, 9, 22, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(315, 9, 79, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(316, 9, 157, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(317, 9, 15, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(318, 9, 14, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(319, 9, 13, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(320, 9, 12, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(321, 9, 11, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(322, 9, 96, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(323, 9, 54, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(324, 9, 53, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(325, 9, 52, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(326, 9, 51, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(327, 9, 97, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(328, 9, 98, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(329, 9, 158, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(330, 9, 70, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(331, 9, 16, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(332, 9, 17, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(333, 9, 18, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(334, 9, 49, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(335, 9, 64, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(336, 9, 171, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(337, 9, 48, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(338, 9, 45, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(339, 9, 44, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(340, 9, 43, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(341, 9, 42, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(342, 9, 41, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(343, 9, 172, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(344, 9, 24, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(345, 9, 25, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(346, 9, 26, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(347, 9, 27, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(348, 9, 28, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(349, 9, 30, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(350, 9, 31, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(351, 10, 156, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(352, 10, 155, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(353, 10, 154, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(354, 10, 153, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(355, 10, 152, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(356, 10, 151, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(357, 10, 141, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(358, 10, 157, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(359, 10, 158, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(360, 10, 159, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(361, 10, 140, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(362, 10, 176, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(363, 10, 175, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(364, 10, 174, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(365, 10, 173, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(366, 10, 170, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(367, 10, 166, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(368, 10, 161, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(369, 10, 160, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(370, 10, 181, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(371, 10, 139, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(372, 10, 119, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(373, 10, 18, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(374, 10, 17, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(375, 10, 16, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(376, 10, 79, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(377, 10, 15, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(378, 10, 14, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(379, 10, 13, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(380, 10, 12, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(381, 10, 11, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(382, 10, 24, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(383, 10, 25, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(384, 10, 26, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(385, 10, 55, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(386, 10, 48, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(387, 10, 45, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(388, 10, 44, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(389, 10, 31, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(390, 10, 30, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(391, 10, 29, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(392, 10, 28, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(393, 10, 27, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(394, 10, 51, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(395, 10, 177, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(396, 10, 183, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(444, 12, 174, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(445, 12, 79, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(446, 12, 158, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(447, 12, 2, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(448, 12, 3, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(449, 12, 4, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(450, 12, 5, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(451, 12, 34, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(452, 12, 38, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(453, 12, 6, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(454, 12, 7, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(455, 12, 8, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(456, 12, 9, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(457, 12, 10, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(458, 12, 39, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(459, 12, 1, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(460, 12, 183, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(461, 12, 177, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(462, 12, 159, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(463, 12, 181, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(464, 12, 160, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(465, 12, 161, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(466, 12, 166, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(467, 12, 170, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(468, 12, 163, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(469, 12, 164, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(470, 12, 165, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(471, 12, 173, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(472, 12, 175, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(473, 12, 176, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(474, 12, 40, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(475, 12, 19, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(476, 12, 20, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(477, 12, 74, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(478, 12, 75, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(479, 12, 76, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(480, 12, 77, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(481, 12, 78, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(482, 12, 85, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(483, 12, 92, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(484, 12, 93, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(485, 12, 94, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(486, 12, 95, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(487, 12, 96, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(488, 12, 97, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(489, 12, 73, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(490, 12, 69, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(491, 12, 68, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(492, 12, 21, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(493, 12, 22, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(494, 12, 23, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(495, 12, 33, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(496, 12, 35, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(497, 12, 36, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(498, 12, 37, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(499, 12, 91, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(500, 12, 180, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(501, 12, 65, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(502, 12, 66, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(503, 12, 67, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(504, 12, 98, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(505, 12, 51, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(506, 12, 27, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(507, 12, 28, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(508, 12, 29, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(509, 12, 30, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(510, 12, 31, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(511, 12, 172, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(512, 12, 41, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(513, 12, 42, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(514, 12, 43, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(515, 12, 44, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(516, 12, 45, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(517, 12, 48, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(518, 12, 26, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(519, 12, 25, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(520, 12, 24, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(521, 12, 52, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(522, 12, 53, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(523, 12, 54, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(524, 12, 70, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(525, 12, 11, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(526, 12, 12, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(527, 12, 13, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(528, 12, 14, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(529, 12, 15, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(530, 12, 16, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(531, 12, 17, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(532, 12, 18, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(533, 12, 49, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(534, 12, 64, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(535, 12, 182, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(536, 12, 135, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(537, 12, 136, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(538, 12, 139, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(539, 12, 140, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(540, 12, 141, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(541, 12, 150, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(542, 12, 151, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(543, 12, 152, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(544, 12, 153, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(545, 12, 154, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(546, 12, 155, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(547, 12, 156, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(548, 12, 157, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(549, 12, 134, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(550, 12, 133, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(551, 12, 171, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(552, 12, 55, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(553, 12, 59, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(554, 12, 60, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(555, 12, 61, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(556, 12, 62, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(557, 12, 71, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(558, 12, 132, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(559, 12, 120, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(560, 12, 119, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(561, 12, 162, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(562, 12, 72, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(563, 13, 11, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(564, 13, 12, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(565, 13, 70, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(566, 13, 54, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(567, 13, 53, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(568, 13, 52, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(569, 13, 51, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(570, 13, 164, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(571, 13, 72, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(572, 13, 13, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(573, 13, 14, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(574, 13, 159, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(575, 13, 156, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(576, 13, 133, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(577, 13, 155, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(578, 13, 154, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(579, 13, 153, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(580, 13, 152, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(581, 13, 151, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(582, 13, 150, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(583, 13, 141, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(584, 13, 140, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(585, 13, 139, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(586, 13, 136, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(587, 13, 135, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(588, 13, 132, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(589, 13, 157, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(590, 13, 158, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(591, 13, 183, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(592, 13, 177, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(593, 13, 176, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(594, 13, 175, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(595, 13, 174, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(596, 13, 173, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(597, 13, 165, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(598, 13, 134, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(599, 13, 163, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(600, 13, 170, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(601, 13, 166, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(602, 13, 161, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(603, 13, 160, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(604, 13, 181, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(605, 13, 120, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(606, 13, 15, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(607, 13, 41, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(608, 13, 172, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(609, 13, 31, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(610, 13, 30, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(611, 13, 29, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(612, 13, 28, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(613, 13, 27, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(614, 13, 26, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(615, 13, 25, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(616, 13, 24, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(617, 13, 18, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(618, 13, 17, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(619, 13, 16, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(620, 13, 79, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(621, 13, 42, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(622, 13, 43, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(623, 13, 119, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(624, 13, 162, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(625, 13, 71, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(626, 13, 62, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(627, 13, 61, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(628, 13, 60, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(629, 13, 59, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(630, 13, 55, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(631, 13, 182, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(632, 13, 44, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(633, 13, 45, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(634, 13, 48, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(635, 13, 49, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(636, 13, 64, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(637, 13, 171, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(638, 14, 160, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(639, 14, 181, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(640, 14, 153, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(641, 14, 152, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(642, 14, 64, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(643, 14, 49, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(644, 14, 48, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(645, 14, 45, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(646, 14, 44, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(647, 14, 26, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(648, 14, 25, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(649, 14, 54, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(650, 14, 24, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(651, 14, 161, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(652, 14, 51, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(653, 15, 156, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(654, 15, 119, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(655, 15, 155, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(656, 15, 154, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(657, 15, 159, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(658, 15, 153, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(659, 15, 152, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(660, 15, 151, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(661, 15, 141, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(662, 15, 140, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(663, 15, 157, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(664, 15, 158, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(665, 15, 181, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(666, 15, 183, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(667, 15, 177, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(668, 15, 176, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(669, 15, 175, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(670, 15, 174, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(671, 15, 173, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(672, 15, 170, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(673, 15, 166, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(674, 15, 161, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(675, 15, 160, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(676, 15, 139, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(677, 15, 136, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(678, 15, 27, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(679, 15, 18, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(680, 15, 17, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(681, 15, 16, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(682, 15, 79, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(683, 15, 15, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(684, 15, 14, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(685, 15, 51, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(686, 15, 11, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(687, 15, 12, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(688, 15, 28, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(689, 15, 29, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(690, 15, 135, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(691, 15, 134, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(692, 15, 133, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(693, 15, 132, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(694, 15, 120, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(695, 15, 48, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(696, 15, 45, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(697, 15, 44, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(698, 15, 31, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(699, 15, 30, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(700, 15, 13, NULL, 'admin', '2020-06-22 17:30:00', NULL, NULL, NULL, NULL),
	(718, 11, 51, NULL, 'admin', '2020-05-12 10:24:55', NULL, NULL, NULL, NULL),
	(719, 11, 26, NULL, 'admin', '2020-05-12 10:24:55', NULL, NULL, NULL, NULL),
	(720, 11, 27, NULL, 'admin', '2020-05-12 10:24:55', NULL, NULL, NULL, NULL),
	(721, 11, 28, NULL, 'admin', '2020-05-12 10:24:55', NULL, NULL, NULL, NULL),
	(722, 11, 29, NULL, 'admin', '2020-05-12 10:24:55', NULL, NULL, NULL, NULL),
	(723, 11, 30, NULL, 'admin', '2020-05-12 10:24:55', NULL, NULL, NULL, NULL),
	(724, 11, 31, NULL, 'admin', '2020-05-12 10:24:55', NULL, NULL, NULL, NULL),
	(725, 11, 44, NULL, 'admin', '2020-05-12 10:24:55', NULL, NULL, NULL, NULL),
	(726, 11, 45, NULL, 'admin', '2020-05-12 10:24:55', NULL, NULL, NULL, NULL),
	(727, 11, 48, NULL, 'admin', '2020-05-12 10:24:55', NULL, NULL, NULL, NULL),
	(728, 11, 55, NULL, 'admin', '2020-05-12 10:24:55', NULL, NULL, NULL, NULL),
	(729, 11, 25, NULL, 'admin', '2020-05-12 10:24:55', NULL, NULL, NULL, NULL),
	(730, 11, 24, NULL, 'admin', '2020-05-12 10:24:55', NULL, NULL, NULL, NULL),
	(731, 11, 54, NULL, 'admin', '2020-05-12 10:24:55', NULL, NULL, NULL, NULL),
	(732, 11, 11, NULL, 'admin', '2020-05-12 10:24:55', NULL, NULL, NULL, NULL),
	(733, 11, 12, NULL, 'admin', '2020-05-12 10:24:55', NULL, NULL, NULL, NULL),
	(734, 11, 13, NULL, 'admin', '2020-05-12 10:24:55', NULL, NULL, NULL, NULL),
	(735, 11, 14, NULL, 'admin', '2020-05-12 10:24:55', NULL, NULL, NULL, NULL),
	(736, 11, 15, NULL, 'admin', '2020-05-12 10:24:55', NULL, NULL, NULL, NULL),
	(737, 11, 79, NULL, 'admin', '2020-05-12 10:24:55', NULL, NULL, NULL, NULL),
	(738, 11, 16, NULL, 'admin', '2020-05-12 10:24:55', NULL, NULL, NULL, NULL),
	(739, 11, 17, NULL, 'admin', '2020-05-12 10:24:55', NULL, NULL, NULL, NULL),
	(740, 11, 18, NULL, 'admin', '2020-05-12 10:24:55', NULL, NULL, NULL, NULL),
	(741, 11, 119, NULL, 'admin', '2020-05-12 10:24:55', NULL, NULL, NULL, NULL),
	(742, 11, 139, NULL, 'admin', '2020-05-12 10:24:55', NULL, NULL, NULL, NULL),
	(743, 11, 166, NULL, 'admin', '2020-05-12 10:24:55', NULL, NULL, NULL, NULL),
	(744, 11, 170, NULL, 'admin', '2020-05-12 10:24:55', NULL, NULL, NULL, NULL),
	(745, 11, 173, NULL, 'admin', '2020-05-12 10:24:55', NULL, NULL, NULL, NULL),
	(746, 11, 174, NULL, 'admin', '2020-05-12 10:24:55', NULL, NULL, NULL, NULL),
	(747, 11, 175, NULL, 'admin', '2020-05-12 10:24:55', NULL, NULL, NULL, NULL),
	(748, 11, 176, NULL, 'admin', '2020-05-12 10:24:55', NULL, NULL, NULL, NULL),
	(749, 11, 177, NULL, 'admin', '2020-05-12 10:24:55', NULL, NULL, NULL, NULL),
	(750, 11, 183, NULL, 'admin', '2020-05-12 10:24:55', NULL, NULL, NULL, NULL),
	(751, 11, 140, NULL, 'admin', '2020-05-12 10:24:55', NULL, NULL, NULL, NULL),
	(752, 11, 161, NULL, 'admin', '2020-05-12 10:24:55', NULL, NULL, NULL, NULL),
	(753, 11, 160, NULL, 'admin', '2020-05-12 10:24:55', NULL, NULL, NULL, NULL),
	(754, 11, 181, NULL, 'admin', '2020-05-12 10:24:55', NULL, NULL, NULL, NULL),
	(755, 11, 141, NULL, 'admin', '2020-05-12 10:24:55', NULL, NULL, NULL, NULL),
	(756, 11, 151, NULL, 'admin', '2020-05-12 10:24:55', NULL, NULL, NULL, NULL),
	(757, 11, 152, NULL, 'admin', '2020-05-12 10:24:55', NULL, NULL, NULL, NULL),
	(758, 11, 153, NULL, 'admin', '2020-05-12 10:24:55', NULL, NULL, NULL, NULL),
	(759, 11, 154, NULL, 'admin', '2020-05-12 10:24:55', NULL, NULL, NULL, NULL),
	(760, 11, 155, NULL, 'admin', '2020-05-12 10:24:55', NULL, NULL, NULL, NULL),
	(761, 11, 156, NULL, 'admin', '2020-05-12 10:24:55', NULL, NULL, NULL, NULL),
	(762, 11, 157, NULL, 'admin', '2020-05-12 10:24:55', NULL, NULL, NULL, NULL),
	(763, 11, 158, NULL, 'admin', '2020-05-12 10:24:55', NULL, NULL, NULL, NULL),
	(764, 11, 159, NULL, 'admin', '2020-05-12 10:24:55', NULL, NULL, NULL, NULL),
	(765, 11, 74, NULL, 'admin', '2020-05-12 10:24:55', NULL, NULL, NULL, NULL),
	(766, 11, 299, NULL, 'admin', '2020-05-12 10:24:55', NULL, NULL, NULL, NULL),
	(767, 11, 300, NULL, 'admin', '2020-05-12 10:24:55', NULL, NULL, NULL, NULL),
	(768, 11, 301, NULL, 'admin', '2020-05-12 10:24:55', NULL, NULL, NULL, NULL),
	(769, 11, 302, NULL, 'admin', '2020-05-12 10:24:55', NULL, NULL, NULL, NULL),
	(770, 11, 303, NULL, 'admin', '2020-05-12 10:24:55', NULL, NULL, NULL, NULL),
	(771, 11, 304, NULL, 'admin', '2020-05-12 10:24:55', NULL, NULL, NULL, NULL),
	(772, 11, 305, NULL, 'admin', '2020-05-12 10:24:55', NULL, NULL, NULL, NULL),
	(773, 11, 306, NULL, 'admin', '2020-05-12 10:24:55', NULL, NULL, NULL, NULL),
	(774, 11, 307, NULL, 'admin', '2020-05-12 10:24:55', NULL, NULL, NULL, NULL),
	(775, 11, 308, NULL, 'admin', '2020-05-12 10:24:55', NULL, NULL, NULL, NULL),
	(776, 6, 30, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(777, 6, 187, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(778, 6, 55, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(779, 6, 60, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(780, 6, 61, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(781, 6, 62, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(782, 6, 71, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(783, 6, 72, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(784, 6, 162, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(785, 6, 188, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(786, 6, 119, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(787, 6, 120, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(788, 6, 132, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(789, 6, 185, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(790, 6, 182, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(791, 6, 31, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(792, 6, 172, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(793, 6, 184, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(794, 6, 41, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(795, 6, 42, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(796, 6, 43, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(797, 6, 44, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(798, 6, 45, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(799, 6, 48, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(800, 6, 49, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(801, 6, 64, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(802, 6, 171, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(803, 6, 133, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(804, 6, 134, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(805, 6, 135, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(806, 6, 158, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(807, 6, 159, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(808, 6, 181, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(809, 6, 160, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(810, 6, 161, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(811, 6, 166, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(812, 6, 170, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(813, 6, 163, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(814, 6, 164, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(815, 6, 165, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(816, 6, 173, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(817, 6, 174, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(818, 6, 157, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(819, 6, 156, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(820, 6, 136, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(821, 6, 186, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(822, 6, 189, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(823, 6, 139, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(824, 6, 140, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(825, 6, 141, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(826, 6, 150, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(827, 6, 151, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(828, 6, 152, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(829, 6, 153, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(830, 6, 154, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(831, 6, 155, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(832, 6, 175, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(833, 6, 29, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(834, 6, 98, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(835, 6, 103, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(836, 6, 144, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(837, 6, 145, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(838, 6, 146, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(839, 6, 105, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(840, 6, 106, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(841, 6, 107, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(842, 6, 108, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(843, 6, 109, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(844, 6, 110, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(845, 6, 121, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(846, 6, 131, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(847, 6, 102, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(848, 6, 101, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(849, 6, 51, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(850, 6, 52, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(851, 6, 53, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(852, 6, 54, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(853, 6, 70, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(854, 6, 86, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(855, 6, 87, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(856, 6, 88, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(857, 6, 89, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(858, 6, 90, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(859, 6, 99, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(860, 6, 100, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(861, 6, 111, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(862, 6, 113, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(863, 6, 114, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(864, 6, 12, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(865, 6, 13, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(866, 6, 14, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(867, 6, 15, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(868, 6, 79, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(869, 6, 16, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(870, 6, 17, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(871, 6, 18, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(872, 6, 24, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(873, 6, 25, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(874, 6, 26, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(875, 6, 27, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(876, 6, 11, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(877, 6, 149, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(878, 6, 115, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(879, 6, 116, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(880, 6, 167, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(881, 6, 168, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(882, 6, 117, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(883, 6, 118, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(884, 6, 148, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(885, 6, 122, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(886, 6, 123, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(887, 6, 147, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(888, 6, 137, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(889, 6, 138, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(890, 6, 28, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(891, 6, 112, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(892, 6, 73, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(893, 6, 69, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(894, 6, 68, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(895, 6, 67, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(896, 6, 66, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(897, 6, 65, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(898, 6, 180, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(899, 6, 59, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(900, 6, 91, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(901, 6, 37, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(902, 6, 74, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(903, 6, 75, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(904, 6, 97, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(905, 6, 96, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(906, 6, 95, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(907, 6, 94, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(908, 6, 93, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(909, 6, 92, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(910, 6, 85, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(911, 6, 78, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(912, 6, 77, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(913, 6, 76, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(914, 6, 36, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(915, 6, 35, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(916, 6, 38, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(917, 6, 34, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(918, 6, 5, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(919, 6, 4, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(920, 6, 3, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(921, 6, 2, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(922, 6, 1, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(923, 6, 183, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(924, 6, 177, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(925, 6, 176, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(926, 6, 6, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(927, 6, 7, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(928, 6, 8, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(929, 6, 33, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(930, 6, 23, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(931, 6, 22, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(932, 6, 21, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(933, 6, 20, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(934, 6, 19, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(935, 6, 40, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(936, 6, 39, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(937, 6, 10, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(938, 6, 9, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(939, 6, 49, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(940, 6, 50, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(941, 6, 208, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(942, 6, 209, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(943, 6, 210, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(944, 6, 211, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(945, 6, 212, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(946, 6, 203, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(947, 6, 204, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(948, 6, 205, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(949, 6, 206, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(950, 6, 207, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(951, 6, 213, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(952, 6, 215, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(953, 6, 216, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(954, 6, 217, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(955, 6, 218, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(956, 6, 299, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(957, 6, 59, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(958, 6, 300, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(959, 6, 59, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(960, 6, 301, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(961, 6, 59, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(962, 6, 302, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(963, 6, 59, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(964, 6, 303, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(965, 6, 59, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(966, 6, 304, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(967, 6, 59, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(968, 6, 305, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(969, 6, 59, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(970, 6, 306, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(971, 6, 59, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(972, 6, 307, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(973, 6, 59, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(974, 6, 308, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(975, 6, 74, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL),
	(976, 6, 59, NULL, 'admin', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `umm_role_previlege` ENABLE KEYS */;

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*!40000 ALTER TABLE `umm_user_approval_group` DISABLE KEYS */;
INSERT INTO `umm_user_approval_group` (`id`, `user_id`, `approval_group_id`) VALUES
	(1, 1, 1),
	(2, 2, 4);
/*!40000 ALTER TABLE `umm_user_approval_group` ENABLE KEYS */;

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

/*!40000 ALTER TABLE `umm_user_import_issue` DISABLE KEYS */;
/*!40000 ALTER TABLE `umm_user_import_issue` ENABLE KEYS */;

DROP TABLE IF EXISTS `umm_user_import_mst`;
CREATE TABLE IF NOT EXISTS `umm_user_import_mst` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=latin1;

/*!40000 ALTER TABLE `umm_user_import_mst` DISABLE KEYS */;
/*!40000 ALTER TABLE `umm_user_import_mst` ENABLE KEYS */;

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
  `vendor_id` int(11) DEFAULT NULL,
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
  KEY `VENDOR_FK_1` (`vendor_id`) USING BTREE,
  KEY `user_name` (`user_name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*!40000 ALTER TABLE `umm_user_mst` DISABLE KEYS */;
INSERT INTO `umm_user_mst` (`id`, `uuid`, `role_id`, `user_name`, `name`, `address`, `email`, `telephone_no`, `status`, `login_attempt`, `password`, `created_on`, `created_by`, `nic_passport_no`, `image_attached`, `first_login`, `account_locked_date`, `vendor_id`, `pro_pic_content_type`, `pro_pic_name`, `update_on`, `update_by`, `last_login_date`, `last_login_date_time`, `user_type`, `temporary_password`, `temporary_password_status`, `temporary_password_issue_date`, `temporary_password_expired_date`, `workflow_id`, `propic_id`, `delete_by`, `delete_on`) VALUES
	(1, 'aadadasas', 6, 'admin', 'avishka perera', NULL, 'carijiv438@1092df.com', NULL, 'A', 0, '$2a$10$7nUrdyIaqNkinWcoeVjOAeRn6SGFhuexFhvVgw1WAro7lXSNAEafO', '2021-02-24 19:30:16', 'PAPERTRL_SYSTEM', 'NP', 'N', 'Y', NULL, NULL, 'image/png', 'default_propic.png', NULL, NULL, NULL, NULL, 'I', 'EG4QtSEJRSfsQ+061ZpIpQ==', 'I', '2021-01-08 00:00:00', '2021-01-28 00:00:00', NULL, 1, NULL, NULL),
	(2, 'ba3e4b5d-6203-49f7-ad3c-0f3dc7970377', 11, 'indragupthaekanayaka@gmail.com', 'Anu Lakmali', NULL, 'indragupthaekanayaka@gmail.com', NULL, 'A', 0, '$2a$10$uobAr7soIdwSZ5IfuhhjWe/2M6OLfAIJtMuUYBcktr5znwkeueDWK', '2021-03-06 11:02:35', 'admin', 'EMP001', 'N', 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'I', '$2a$10$XOc.hFXvkmMqKVD2m6PC/e1zTIkz5EhtLc7MF0ohTx82iR2qco5SO', 'I', '2021-03-06 00:00:00', '2021-03-07 00:00:00', NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `umm_user_mst` ENABLE KEYS */;

DROP TABLE IF EXISTS `umm_user_propic`;
CREATE TABLE IF NOT EXISTS `umm_user_propic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `file_name` varchar(100) NOT NULL,
  `file_type` varchar(50) NOT NULL,
  `image_data` mediumblob NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*!40000 ALTER TABLE `umm_user_propic` DISABLE KEYS */;
INSERT INTO `umm_user_propic` (`id`, `file_name`, `file_type`, `image_data`) VALUES
	(1, 'default_propic.png', 'image/png', _binary 0x89504E470D0A1A0A0000000D494844520000017500000175080600000017FD7AC80000200049444154789CEDDD799464595D2FFAEF6F9F73E2EC93911991630D599535F754595D08A220C3BD884F975779BED7030AE2803E19E4C9C5FBF0C17B08175AB9BA70C1BBEA0551E4B2BC3C1CD06E5B9FA0AE25A2A2225EF402D555DD40CF5D5D43565566E57CF68973F6FEBD3FEA6475767565560E1171224EFC3E8B5A5D1919C38FCA38DFDCB147FADA0327B11526365B7A9C10DBA523DD076010C050FEDF1A8020FF7B00A03FBF2BE5B75D6B1600E77F5F0490E6B7A500E6F3BF5F06306B62B3DC9AFF17426CDD5FFCF967D6FC9EDFC63A8458978EF40880FD0026F23F0799795FFEF751221AC295000733370064CCECF27826067B0008FCCCFB9AC1E1B5AF43A064D5171900269005C020808814009F882A3AD200B0C0CC33002E01384D444F01781CC0E9FCCF932636D3CDFDD710626B24D4455BE948F703781E80DB004C32F324816E02619C991D80841D83994366D6CC0C06030C303398571AD8DB7AEF866BFCFDBA886888888640384CA017111188C81051428A0020D49156609C65F0C344740AC029000F01F89A89CDE2366A15625324D445CBE848DF06E076002F64E61711D16D00069D734BCC1CB0E3EA4A503BE7AE3EACB082D770CD2F93151AD7D4AA943A40440788E8BB49D11211A54AA9AA8EF42C333F4444FF0CE05F003C6062F3509BCA173D46425D34451EE0DF01C62B18FC12223AC0CC4BCE393073BF734EE52D70E0FAFDDC5D6FD52F2600A8AEFC8588C648D19852EA6544B4A894828E7495999F20D01741F85B00FF24412F9A41425D6C898EF4CB017C1F33BF92888E3373C339E739E7AAECAEB6BC6B0597D91198196C19CE3A8555FF264AA9C3A4E8B052EA4EA594D591AE30F30922FA3C803F37B1F9FBE2AA16DD4A425D6C888EF48B00DCC5CCDF4D44CF73CECD39E7AACEB9206F81775CB749A773CE010EB0B05500202290A26F574A3D5F29F5661DE93A337F8D88FE0AC07D2636FF5C70C9A20B48A88BEBD2911EC79596F80F11D1CB9C738973AECF5917E4ADF05276A11469558B7E657A269452DFA23C35A9947AA38E74C8CCFF40449FC69596FCD9622B169D48425D5CA523FD6D007E9899FF6766DEED9C63675DD53A0B70E70D60F602E71C9C7301803A08F094F73F294F7D8752EAD7421D9E23A23F03F07B26365F2EBA56D11924D47B9C8EF4CBC0783D08773133596BABCE3AFF9A413FD10918B0D6C2DA2BDD354AA9C3CA533FE379DE4FE8483318F781F049139B2F145DAA288E847A0FD291FE0E30DE08C29DEE8ABACD2C5D67DA9EE860792BDECFD2AC4E44F07CEF27955277E9487B60FC3108BF6562F34F45D729DA4B42BD47E848DF02E0AD007ED039174890970B33234B3302309807FC8F29A5FE171DE90CC0A7017C44A64CF60609F592D391BE8799EF64E6FDD6DAC866D697202FB7EB04FC9B3CCFFBD15087A789E83E139BF7165DA3681D09F512D2917E3E186F07E135D6DA659BD901E923EF4D79C0FB599AD59452939EEFEDD391FE7930FE00840F99D87CA5E81A457349A897848EB402F00BCCFC6A66DE69AD1DC8D24C011828BA36D1199C73700D379022851FF8AFF53CEF55A10EA788E88F00FC47131BF9CD5F02AAE802C4F6E8481FD65A7F1280B5D6FE6CDA486F4E4C52CF035D88EBCAD24C2526A9A78DF4666BEDCF02B05AEBFF5747FA70D1B589ED910BBF4BE948BF32D4E11798F9AB99CD7ED8C4066923AD4A378BD80CE71CD2465A35B14166B3D732F357431D7E4147FABB8AAE4D6C8D74BF74997CE0F375CEB9912CCB069D951017CD91A59997A559BFF2D4CB7DDFBF37D4E13411FDAE0CAC761769A977091DE95FD691BE9077B11C6E240D0974D112CE3A3492C660DA480F5B6B7F5647FAA28EF42F175D97D81809F50EA723FD2B3AD20BD6DAB72626194B1B694DBA58443BE45D33B5C424A3D6DAB7EA482FE848FF4AD17589F549A877281DE90FEA482FD9CCBE2531497FDA48AB32BF5C1481999136D26A62927E9BD9B7E8482FE9487FB0E8BAC4F549A877181DE90FE848CFDBCCBE3931495F9A4A988BCEC0CC48D3B49A98A4CF66F6A7F396FB078AAE4B3C9B847A87D091FE451DE9296BED5B12930C48988B4E95877B5F62927E6BED5B74A4A774A47FB1E8BAC41512EA05D3917E61A8C3AF5B6BFF7D62921D6923ED973017DD20EF96E94F4CB2C35AFBEF431D7E3DDFBE59144842BD203AD283A10EFF94993F9736D25BD2465A933017DD280FF75ADA486F61E6BF0A75F8A73AD272884A4124D4DB4C475AE9487F14C0056BEDF72726A9CB6C165106CE392426A95B6BBF1FC0051DE98FE6DB578836927FF036CAFB1D2FDBCCBEDEC426C8D2CC2BBA26219A2D4B33CFC426B0997D3D80CBD2DFDE5E12EA6DA0237D20D4E1579D756F4D4C524BD3548E8613A597A6A94E4C5273D6BD35D4E15775A40F145D532F90506F311DE98F31F303D6DAE7351A8DBAF49B8B5EC2CC68341A756BEDF398F9011DE98F155D53D949A8B7888EF40B75A4CFD8CCFE486292FE2CCD8A2E4988C26469867CF1D28FE8489FD1917E61D1359595847A93E948EB5087BFCFCC9F4B4C329EA66954744D42748A344DA3C424E3CCFCB95087BFAF232D5D914D26A1DE44F980D0456BED9D8949A4AB4588EB60E69559327702B82803A9CD255BEF36818E743F33FF8173EEA5B27848888DC9D2AC62335B092AC1CF843A7C3E11BDC6C466B1E8BABA9DB4D4B74947FA0500CE586BBFA791340625D085D838664623690C5A6BBF07C099FC7A12DB20A1BE0D5AEB4F30F3E71393D4B2340B8AAE47886E95A5599098A4C6CC9FD75A7FA2E87ABA9984FA16E8488F853A7CD05AFB43D2772E4473ACEA6BFFA150870FEA488F155D53379250DF241DE90F8271DA5A7B5B9AA67D45D72344D9A469DA67ADBD0D8CD3B26FFBE6C940E906E583A1F7596B5F9C36D2B0E87A8428B32CCD90A55918548237843A3C4E4477CA20EAC6484B7D0374A4770078D85AFB9D6923AD155D8F10BD226DA4356BED2B003C9C5F87E20624D46F4047FA9799F9A9C424BB64305488F6CB07517731F3537200F68D49A8AF436BFD49E7DC9B1B492394C150218A934F7D0C9D736FD65A7FB2E87A3A9984FA75E8480F853AFCB2B5F62E997B2E44675835A7FDAE50875FD6911E2ABAA64E24A17E0D1DE943009EB2D6BE4066B708D179F2D9312F00F0747EBD8A5524D457D191FE1566FE5ABEABA2FCDB08D1A1B234538949FA98F96B3AD2BF52743D9D44822BA7B5FEB873EE0D4992C8DE2D42740166469224FDCEB93768AD3F5E743D9DA2E7E7A9EB485798F94FADB32F4D1BE940D1F5082136818146D2180C2AC10F863ADC4B443F6062D328BAAC22F5744B5D477A9099BFECACFB4E097421BA57DA48079C75AF60E62FEB480F165D4F917A36D4F37D254E596B27D35456880AD1EDD2340DADB593007A7ADF989E0CF57C65DAD359968D6769E6155D8F10A239B234F3B22CDB8D2BDBF8F6E40AD49E0B751DE97B009C4E4C5291734385289FFC3CD400C0E9FC7AEF293D15EA3AD2EF67E6B72726A9C80C1721CA2BDFC6B7C2CCFF878EF4FB8BAEA79D7A26D4F339E83FD3481A55097421CA2F5F81DACFCC3FD34B73D97B22D475A4FF733E075D0EB410A287E473D9EBCEB937E848FFE7A2EB6987D287BA8EF4AF3AE75EDF481A83903C17A2F7E473D99D73AFD791FED5A2CB69B55287BA8EF4879D733FDE481A3D3D6F55087135D87F5C47FAC345D7D24AA50DF53CD05F27812E84589107FBEB74A47FA3E85A5AA594A19E77B948A00B219E230FF6D796B52BA674A19E0F8A4A978B10624DABBA624A37785AAA50D791FEC0D54151218458C7AAC1D30F145D4B339526D4F385456F4A1BA904BA106243D2463AC8CC6F2AD302A55284BA8EF43DCCFCB646D29079E842880DCB1728D599F96D65D952A0EB433DDFB4E7FFCA578E155D8E10A2CBACAC3C05E39D65D804ACAB433DDF5EF38CECE52284D88E7CE569882BBB3B76F5B6BD5D1BEAF946F80F6459E64BA00B21B68B999165990FE0816E3E68A32B435D473A64E62F6459362ADBE70A219A254B33645936CACC5FD091EECAC373BA32D499F9FFB3D6DE2C075C08219A2D4B33CF5A7B3333FF59D1B56C45D785BAD6FA13CEB9EFC8D2AC2B7F8B0A213A5F9666A173EEC55AEB4F145DCB667555A8EB487FC0B1BB430E891642B45ADA48071CBB3BBA6D7152D784BA8EF461667E8B2C2E1242B44BBE38E92D3AD2878BAE65A3BA22D475A447009C94B9E8428876BA3A871D3895E750C7EBF850D79156CCFC7759968512E8428876CBA73A5698F9EF74A43B7E7246C7873A33DFEBAC3B9CA519155D8B10A237656946CEBAC3CCFC4745D772231D1DEA3AD21F64C7AF4CD354175D8B10A2B7A569AAD9F12B75A43F54742DEBE9D850D791DECBCC6F6E341AF5A26B1142080068341AF57C57C7BD45D7B2968E0C751DE97E005F69248D6AD1B50821C46A792E7D25CFA98ED391A1CECCF7655926DBE80A213A4E3E705A67E6FB8BAEE57A3A2ED4F3E3E85E9CA55950742D4208713D599A05CEB96FEFC4E3F03A2AD475A47733F31BD3465A2BBA162184584FDA486BCCFC461DE9DD45D7B29A5F74012B74A40330FEB9D168F4155D8BE83E44844A10200C4354C20A02DF879FFFF1BC2B538B95BAD28671CE0100ACB3C8328B2C4D9165191A698A244990240D48D79FD88846A3D11756C27FD6913E6C6293165D0FD041A10EC67FB3D6EE60271793589F520AFDD52AAAFD55F44511A228421469103567290333C39804711C63398EB1B8B884A5A525586B9BF2FCA23CD831ACB53B94A73E09E0B545D7037448A8EB48DFE39CFB77699ACACE8BE2398808FDFD55D4EB75D46A03A8F6F5352DC0D77ABD28D288228D610C01B812F4711C636E7E0173737358585894D6BC0000A4691A5654E57B75A4EF31B1796FD1F5D0D71E38B9A5079AD834A5001DE90100E71393F4C94522561011EAB51A86878730343478B50BA55358E730373B87E99919CCCDCD5FEDD211BD898810EA7019C02E139B8556BFDE5FFCF967D6FC5EE12D7566FEB4B556CE18150080BE28C2D8D828464686E1FB85BF3DD7E42985E1E1210C0F0FC15A8B9999CBB870F1129696968A2E4D1460657F18CFF3FE08C0F716594BA1578D8EF4FBF3032F3AF7EA152D4744181A1AC4AE9D3BD0DFDF91EB39D6E5791EC6C6463136368AE5E518E7A7A6303D3D23DD333D264B335F29F5221DE9F79BD8BCBBA83A0AEB7EC9BB5D2E262691DD177B141161C7D81876EDDA81302CD7704A9AA6989ABA80A90B176580B587E4DD300980B15676C37464F70B33FFAEB5D69340EF3D4484B1D1518C8FEF42A55229BA9C960882007BF7EEC1AE5D3B71EEFC14A6A62E48BF7B0FC8BB613CCFF37E17C00F145143218B8F74A4EF61E6974BB74BEFA9D76BB8FDD8240E1CD857DA405FCDF77D4CECDD83E3B74F626478B8E872441B6469E633F3CB75A4EF29E2F5DBDEFDA223ED03B8909864485AE9BD230C431CD8BF0FF57A6F2F165E5C5CC2134F3E89E5E5B8E852440BE5DD30B3B8D20D9335FBF9D7EB7E697F4B9DF1319BD94802BD37101176EFDA89DB8F1DEDF9400780FEFE2A268FDE86BD7BF75C5DE12ACA87996133ABC1F8ED76BF765BDF553AD247187CB71C7AD11BB40E71F4B65B3031B157026C1522C2F8EE5D983C7A1BFAFA64578CB24AD35433F82E1DE923ED7CDDB65E69CC7C9FB576A09DAF298A3136368AC9C9A3A856654BFCB54491C6E4D15BB17BD7CEA24B112D9236D20166BEAF9DAFD9B650D791FE25E7DC812C6D7AF792E8204A291C3A7800070FEC8727ADF31B22224C4CECC5CD371DE9B855B362FB9C7370CE1DD091FEA576BD665BAE3A1DE90A80B76569269DAA251686151CBDED168C8E8E145D4AD7191CAC63F2E86D88A2A8E8524493E5B9F7361DE9B6743BB7A729C5F8B8CD644E7A9955AB551CBDED56E923DE8695310819502E977CEEBA0FC6C7DAF17A2D0F751DE90906DF293B3096D7D0E0206EBBF56604811C56B55D9EE7E1E69B8E606C6CB4E852441365695661F09D3AD213AD7EAD96873A337FC25A2BCDB7921A1D19C191238764764B1311110E1ED88F5D32805A2AD6DA3E66FE9D56BF4E4BAF441DE99732F30BB3346BDDE6D7A2303B768CE1D0A1032DDDDBBC97ED9BD88BF1F18E3A294D6C439666C4CC2FD0917E592B5FA7A5A1CECCFF354BB3C156BE8628C6D8D8280EECDF577419A5B777CFB8047B89646936C8CC1F6FE56BB42CD475A47FD139B75B36312A9F91E16109F436DABB671CBB76EE28BA0CD104F914C75D3AD2BFD8AAD768654BFD8D3285B17C6AB501E97229C0BE7D131819910DC1CA204BB33A809F6CD5F3B724D475A47F391F1468C5D38B82F445116E3A725802BD20870E1E40AD260BB2BB1D33C35ADBAF23FDFE563C7FAB5AEAFF7B9666DD77848D5893EFFBB8F96659F5582422C291C3874A77A0482FCA7B31DED08AE76E7AA8EB487F50161A950B11E1C891433DB1FF79A7F37D1F371D392C5348BB5CDE5A8F5AB17D402BDE193F9D6599CC4B2F91BD7BF7A036201FFB3B455F5F848307F6175D86D8A62CCD0600FC74B39FB7A9A19EB7D2595AE9E551AFD76417C10E3432322C7BEC74B9BCB5EEEB487FA099CFDBEC96FA9BB22C93BD564BC2F77D1C3A78A0E832C41AF6EF9B90FEF52E978F3DBEA599CFD9B450CF67BC90B4D2CBE3E081FDB29F4B07F33C0F870E1D28BA0CB10D796B9D9AD95A6F664BFD7FCB5269A597C5D0D0208686643170A71BE8EFC78E1D63459721B621CFCDA6CD5B6F4AA8EB48DF63AD0DA5955E0E9EE761BFAC18ED1A137BF7C8CCA42E96B7D62B3AD2F734E3F99A12EACCFCA336B3B27AB424F6ECD98D8A74BB740DCFF33031B1A7E832C436D8CCD698F9479BF15CDB0E751DE95730F390ECF1520E5A6BECDC21FB8C749B91E161F4F7CB7ABF6EE59C03330FE9487FD7769F6BDBA1CECCEFCB32D989B12C2626F6C836005D6AFFBEBD459720B621CBB241667ECF769F675BA1AE237D08C0B73A2BADF432E8EFAF6268507E3F77AB6A557E7EDD2CCFD16FCD7375CBB6D75267DC63AD9593724B62CF9EF1A24B10DB243FC3EE66AD8DC0D8D680E996435D475A81F023599AC90E4F25D0DF5F45BD2663DDDDAEAF2F92D67A17CBD2CC03E1753AD25BCED5EDB4D4DF6F33BBBC8DC78B0E22E76196C7EEDDBB8A2E416C83CD6C0C60CB87686C3DD419AFCBAC6CDC55063A0C313C34547419A249FAFBABE8EF977580DD2AB3591F18AFDBEAE3B71AEA2F73EC6AEC64B15119C88AC4F29169A9DD8B1DC3B1AB6DF580EA2D853A33FF9FCE39E9B82B012292DDFE4A68686810BEEF175D86D822E7DC2033BF632B8FDD4AA85788E855599A6DE5F54487918BBF9C94521895334DBB56966620A2EFD791DEF4FE0F5B09F5F7586BE32D3C4E74A0D11169A597951C54DDDDF29CDDF462A44D873A33DF6D332BA33025E0791EEA7599C65856D56A55F65BEF6236B355667EF5661FB7D9503F0A605CF6792987A1A141D912A0E48687655653B7CA7376B78EF4D1CD3C6EB3A1FE166BAD4C632C89C1C17AD1258816939F7177CBF3765327236D36D45F63332BA36A254044B282B407F457AB3210DEC5F2BC7DCD661EB399507FA973CE938330CAA1BFBF0ACF931D1ECA8E8850AB0D145D86D822668673CED3917EE9461FB3F15067BCC939279FE54AA226ADF49E511B9050EF66CEB93A186FDAE8FD371EEA843B6C666554AD2406E440859E21876774379B5902E18E8DDE7FA3A1FE72E75C265D2FE54044A8CADE203DA3AF2F92AEB62E9677C1643AD22FDFC8FD3716EA8C1F97AE97F208C3109E6ACAF1B4A24BF4F5C9A4B56E9677C1FCF846EEBBB12B9B70A774BD94475F24E79AF41AF99977B7BC0BE6CE8DDC7723A1FE6DCCACA4EBA53CA23EB9C07B8DFCCCBB1B338399958EF4B7DDE8BE1B09F5D7582BDB029449A475D1258836939F79F7CB73F88673D66F1CEA8C3B9D75B27AA144C270D31BBF892E273FF3EEE7ACF399F986B3606E14EA7B193C267BBD948B6CF2D47B8220907D7EBA5C9EC33B74A4F7AE77BF1B85FA1B9C75F24E2811A5942C1BEF4144844A2528BA0CB14D791EBF61BDFBAC1BEACCFC12E79CCC852A115FE62BF72CF965DEFD9C737DCCFC92F5EEB36EA813D1CBADB5CDAD4A14CA0FE4C2EE5512EADDCF5A0B225A7711D27AA1FE62E79C9C7054329E92967AAFF23D09F53270CEC577DC75F78BD7FAFE7AA17EA7734E368D2819CF9750EF59323A560ACEB92AB0F642A435439D99BF47A6320A511EB2FF4B3938EB0266FEEEB5BEBF66A813D17199CA583E4AF67C11A2AB39E74044CF5BEBFB6B5DE12F77CECDB5A8265120F9452D44F773CECDDD71D7DDD71D305D2BD45F95F7DB08214A427EA197479ECFAFBADEF7AE1BEACCFC0AE79CAC542821B9B07B976CCA571ECEB980995F71BDEF5D37D489E879CECAC55F46567EAE3D4BAEE9F27076ED7EF5EB85FA2433272DAE491424CBB2A24B100549B3B4E8124413317372C75D771FBBF6F6EB85FAB739E7648A444949A8F7AE2C93D5E165E29CF3007CFBB5B73F37BC19AF944547E565AD957EF51E95A6D2522F13E75C158C575C7BFB73429DC12F6527032A659624D2BBD66BB22C83ECE3542EEC180C7ED9B5B73F27D489E890B4E4CA2D491A459720DA4C7EE6E5932F423A78EDEDD786FAB730B32C3A2A39232DF59E6312537409A2059879EE8EBBEE7EFEEADBAE0DF5E7E79DEFA2C4E25836DFEC35712CA15E46CE391FC0BAA1FE1D32485A7ECBCB12EABD26969F7929E52B4B9FB50DEFB3429D99BF550649CB2F8E63595DD8639697978B2E41B4003B0633BF70F56DCF0A75223A22177BF939E7E4E3780F693452240D19282D236606111D597DDBEA501F65E68A847A6F585C5C2CBA04D126F2B32E2F6606330777DC75F7E8CA6DAB43FD28334BF3AD47CCCF2F145D826893850509F532CB73FBE8CAD7AB43FD16762C3B33F688F98505E957EF1173F3F34597205A881D5700DCBAF2F5B52D75D943BD47645986C5A5A5A2CB102D9624098C910FE065C6CC7DB85E4B9D998F4BCBADB7CCCDCA3AB3B29B9D939F71D9E5FDEAB7AF7C7D35D40974D8B16C0FD04B662E5F2EBA04D1623333F2332E3BC70E043ABCF2F533DD2F847199A3DE5B8C49B024F3974BAB91A63248DA03D83140185FF97A25D4C79859B670EB41D2922BAF999999A24B106DC2CCD91D77DDBD037826D42700C82E4F3DE8D2A56999055352172F4E175D82689F0680BDC033A1BE4FBA5E7A539AA6989501D3D2595C5C948DDB7A489EDFFB80552D75660E0BAB4814EAC2C58B4597209AECC2C54B459720DA28CFEF09E099503FC0CCBAB8924491E6E6E6A5555722699A627A5AFAD37B499EDF07803CD499F980F4ABF6B673E7A78A2E4134C9F9A90B324ED263F2B9EA0780675AEAE30C7913F4B2E9E91939F2AC04B2CCE2C205E94EEB35797EEF02F25027D02EC9F4DEC6CC387BEE5CD165886D3A3F3525074CF7220608340EACB4D40983F2714D5CBA342DE79776B12CCB303575A1E83244019819200C02CF74BF0C48A80B66C6E9D34F175D86D8A2A7CF9C95567A8FCAF37B00B812EA5500B2E98B00005CBE3C2B7BAD77A1388E7151A631F63A77C75D7757158041664E8BAE46748EA74E9F96D9135DE6C9A7E467D6EBF21C1F540006016405D7233AC8F2728CF332C5B16B5CBA342D9FAE047025C707575AEAD2FD229EE5CCD9733046064D3B5D9A66784AC64104803CC7071580FEA28B119DC73987C71F7F423ED277B8279E7C1259261FB4C555030A403F33AB1BDE55F49C85C5459C3B77BEE832C41A2E5EBC84CB97678B2E4374883CC7AB0A400DCF3EAB5488ABCE9C3D87C54539CBB4D31863F0E453A78B2E43741605A0A600F86050D1D588CEC4CC78E4D1C790A6F211BF5358E7F0F0238FC239190A13AB5CC971FF4AF70BD82FBA1ED1B91A8D061E79F431E95FEF108F3FF604E2D8145D86E830798EF74BB78BD890858505F9B8DF01CE9C3D2707868B7549A88B0DBB70E1A20C9C16687A7A0667CE9C2DBA0CD1E156A634568A2E447487D34F9F9103180A3037378FC71E7FA2E8324467AB209FD2E80132502A36EEB1C79F90A9746DB4B0B080871F7954C634C48D100025DD2F62D35666C4CCCEC981D5ADB6B8B8886F3E2C335DC4C649A88B2D61663CFCF0A33268D742F3F30BF8C6371E96ED74C5A628001690738FC4E631331E7DF4715CBA345D7429A5333B3B876F3EFC08ACB4D0C5C63100AB002C0290C329C59630331E7BFC099C392B47E135CB850B17657191D88A0680455974249AE2CC99B3484C820307F641C950CD96AC9C3C755E8EA413DB20A12E9AE6D2F4346213E3A6238751A9C82CD9CDC8B20C8F3CFA98EC8B2EB64D01982722D9D84334C5D2D2324E9E7A087373F34597D23516171771F2D44312E8625BF21C9F53000CE48C52D1445996E11BDF7C184F3E755AFA85D7C1CC3873E62C1EFAFA37D168C8B096D8360720F17125D465F68B68BAA9A90B989F9FC7C10307D0DF5F2DBA9C8EB21CC778E2F127B1B824DB1A8BA66100C6C795EE17694E8996886383071FFA3A76EEDC81BD7BC6E1795ED12515CA3987B3E7CEE3DCB9F3B2425434559EE3F33E80E5A28B11E537357501333397B177EF38C646478B2EA710972FCFE2F4E9A7611239FB55B4CCB20F609688640E9A68B9344DF1F8E34FE2C2D4454C4CEC41AD562BBAA4B6585A5AC2E9D36730BF2003A1A275F21C9FF501CC42A6368A365A5A5EC6D7BFF1300606FAB177CF380606068A2EA92596969671F6EC395C9E95CDCF445BF8580975220A8AAE46F49E8585453CF4F56FA25AAD62F7AE9D181A1A0451F76F183A3B3B87F35353324551B4559EE3B33E8025C8C65EA2404B4B4B78E4D1C750A9543036368AB1D191AE5BBC94A6192E5DBA848B97A6618C1C35270AA1EEBFEFDEA5956E9779221A92D17851A446A3813367CEE2ECD973A8D50630323C8CA1A1C18E9D3163ADC5ECEC1C66662E63766E4E66B388C2E49F701780BC2F9D992F4BA88B4EC1CC989B9BC7DCDC3CE80942AD36807ABD86C17A1D5AEB426B4B9206E6E6E6AED4373F2F8BAB4447202230F365E09901D2F3201C2AB02621AE6B75C03F85A751A95430D0DF8FFEFE2AFAFBAB88A2A8651B883133E238C6E2D232161716B1B0B88844A6238A4E746528EA1CB02AD4494EB4135DA0D168607A6606D33357CE49252284618828D208C3106158415809E1073E7CDF87EFF9F0FDEB77DF586B916516599622CD32A48D144992C02409E2D8C018235D2AA22BE4F97D1EC8439D889E28C3AC03D17B9819C6980D0D4EAEBCC725A845D9101188E809E099592F8F13910CD98B5263660974514A797E3F093C13EA4F139174160A2144372224009E069E09F5A74849F78B104274A37CB2C069E099503F0D202CAA20218410DB5201F014F04CA85F24A2CE5CE1218410625D44E4DF7FDFBD53C0EAED011867A50B460821BA0B2902186757BEBE1AEA0C7E58C90EBC4208D155142930F8D1AB5FAFFC85884ECA5C752184E82EF91CF5132B5FAF6E9A3F48447260A2104274913CB71F5CF97A75A87F9D145289998C00001CFB49444154A5ED2F490821C456E5B9FD8D95AFAF6DA917BB059E1042884DC973FBD4CAD7AB437D9A881AD2AF2E8410DD21EF4F6FDC7FDFBDD32BB73D6BBA0B333F2CA12E8410DD21DF47FD91D5B7A96BEEF03F64AEBA10427407520422FAD7D5B7F9D7DCE78B4AA9D75AD8FE36D62544531111822040A51220080228A5E02905520A4A29100006C08EE19C856386B30E699A224D5334D2544E34125D4129B508E09F56DF766DA87F552965DB5792105B178615445174E58FD688A208954A054170EDDB7AF3ACB568341A3026416C0CE2E518CB712C0767888E92E7F55756DF465F7BE0E4B5F7732636D207233A0A11A1BF5AC5406D00FDD52B47D9F9FEF6C37BB39C73585C5AC2D2E212E61716B0B8B0082BAD7A51101D69DC7FDFBDCFCAEBE75C15CCFC9852EAB07CFC14450B021F83F5410C0ED651AFD75A7616E96628A5501B18406D6000BB77EF023363616111B3B3B3B83C3B2767988AB6514A81991FBBF6F6E7843A81BE488A0E43325D14A01204181919C6D0D020FAFB3B7F68878850AB0DA0561BC0BE7D1388E318972FCFE2D2F4CC868ED81362AB481108F48FD7DEFEDCCFAF84CF2BA5EE90C152D12E4484A1A1418C8E8EA05EABA19BA7D5AEF4F18F8FEFC6E2E2122E5DBA84E999CBB05686AA447329A51641F8FCB5B75FAF53F24B4A291909122D57A954B073C718C6C6460BE91F6FB5FEFE2B7DFFFBF64D607AE632A6CE4F61398E8B2E4B94449ED35FBAF6F6EB0D9402C07262924846F9452B54AB7DD8B57327868787BABA55BE157373F3383F3585B9B9F9A24B115D4E473AB9FFBE7B9FB3B5CB759B47CC7C8214BD88AD84BA689EFE6A157BF78EA356AB155D4A61EAF51AEAF51A9697639C3973169767678B2E497421E52930F3D7AEF7BDEB863A11FD8D52EA05CEBAA0B5A5895ED0D71761CF9E710C0D0E165D4AC7E8EB8B70D34D87B1B4B484D34F9FC5FCBCB4DCC5C629A552227A4E7F3AB046A803F8AC52EACD00E42A145B56A95430B1770F4646868B2EA56355AB55DC7ACB4D989F5FC053A79FC6F2F272D125892EA0945A02F0D9EB7D6FAD3E7500B02636C54F0C165D8788B06BD74E8C8FEF86D70173CBBB0533E3E2C54B38FDF419992D23D6A523EDEEBFEF5EEF7ADF5B73CA01339F504A7D8B2C42129B51AFD7B07FDF04B496ADF9378B88B063C71886878770FAE933B878F152D125890E942F3ABA6E7F3AB04EA813D15F294F4D3A27FDEAE2C67CDFC3FE7DFBA4ABA5097CDFC7C103FB313A328CC71E7F5256A98A67519E4A89E8736B7E7F9DC7DEA794920E3E7143F57A0DC7262725D09B6C606000C7266FC38EB1B1A24B111D24CFE5FBD6FAFE7A7DEA00101B63346466A3B80E4F294CEC9BC08EB1D1A24B29BDB9F9793CFEF8136834E418E19E4680D6DADC7FDFBDD15A775977148B99FFDE53D7ED8B173D2E8A224C4EDE2681DE26F55A0DC7268FA25EEFDD39FE02F0940766FEFBF5EEB36EA813D1BDD20523AE353A3A82C9A3B7CA60689BF9BE8F5B6EBE097BF78CF7DC4A5C7185526A9988EE5DF73E37788ECF284FA6A4892B94523878603F0E1D3CD011DBE0F6AAF1F1DDB8E5E69B10043287A1D7E4797CDDF9E957EF7383E7380BE08C5CC0A21204B8EDD69B3126DD2D1DA1561BC0E4D15BD117ADD9B52A4A26CFE133263667D6BDDF8D9E8888FE4C792A6B5661A2FB54AB7D383A791BAAD56AD1A588552A950A6EBBED16D4EBF5A24B116DA03C9511D19FDDF07E1B78AE3FF03C6FA90935892E343858C7ADB7DE828A7CD4EF489EE7E1E69B0E63E78E1D4597225A2CCFE1DFBFD1FD3612EA5F26222B0333BD676C6C14371D392C4BFD3B1C1161FFFE09ECDBB7B7E852448B101188C89AD8FCCB8DEEBBB1AB9571BFE77BB25F400FD9BD7B170E1ED82FB32CBAC8AE9D3B71E8D001F99995509EBF7FBC91FB6E2CD409BFA39492BD417BC4DEBD7B30B1774FD165882D181D19C191C38724D84B26CFDF4F6EE8BE1B7CCE7F504A2979A394DFBE7D7B31BE7B57D165886D181A1AC4CD371D9169A7254144504A792636EB2E3A5AB1F19F3AE38FA50BA6DC26F6EEC1AE9D3B8B2E433441BD5E93167B4978BEE7C06BEFF572AD8D873AE1B7A40BA6BCF68CEFC66E69A197CAE0601D870F1F9460EF724AA979107E6BC3F7DFC4737F4929D5903748F9ECDEB5137BF68C175D866881E1A1211C3C2803DEDD2AEF7A6998D87C69A38FD96CA7DB1F7ABE27DBC495C88E1D63989890A97065363A3282FDFB268A2E436C419EB77FB899C76C36D43FE2799ED9E46344871A1A1C948BBD47ECD831863DE3BB8B2E436C529EB71FD9CC63361BEA5F87EC05530AFDFD55E96FED317BF68CCBDE3D5D64D55E2F5FDFD4E336FB424474AFE7CBB601DD4C87A14C79EB5107F6EF43AD3650741962033CDF5BBAD136BBD7B395ABFA1ECFF3FAB6F038D1013CCFC3CD371F81EFAF793CAD283122C24D470ECB5EF85D20CFD97B36FBB8AD847AC6CC7FE207120ADDE8D0A1037241F738CFF3AEECE9E3C9A9669DCA0F7C30F39F98D86C7A87DC2D7DFE26A20F2AA566B7F258519C3DE3BB313438587419A2034491C6C183FB8B2E43AC4129354B441FDAD263B7F89A5F54A4E648C9205BB7181CACCB5C74F12CC34343B2254407224550A4E64C6CFE712B8FDFFA4819E1F77CCF9701D32EA0C310870F1D2CBA0CD181F6EC1947BD2687597712DFF39740F8BDAD3E7E3BD31F7EDEF33D390AA7C311110E1F3924FDA7E2BA8808870E1D90F34E3B489EAB3FBFD5C76F39D44D6C188C4FF9816FB7FA1CA2F52626F6A2DA279395C4DA822090FEF50EE107BE05E3532636BCD5E7D8DE4465C27B3DCF8BB7F51CA265EAF51A76ED9463CEC48D0DD6EBF25EE9009EE7C520BC773BCFB1AD5037B1790CC0BF2A4F16B1741ADFF771E8E081A2CB105D6462622FFAE4535D61F21CFDD73C57B7FE3CDB2D8488DEE7FBBE4C6FEC30070EEC937E52B1292BFDEBB27544317CDF9F25A2F76DF779B61DEA26367F4B449764C979E7181E1EC2F0D050D165882ED4174518978DBFDA4E2905229A36B1F9DB6D3F5713EA0111FD9EE77B72804607F07D1F07F6EF2BBA0CD1C5C677EF425F14155D464FF17C6F9E887EB719CFD5945037B179AFE779463EB6156FFFBE09D9D7456C0B11E1E041E98669172282E7798989CDB606485734B3CFE4BFFA812C462A52BD5EC3C8C870D1658812A856FB64364C9BE4B9F9F1663D5FD342DDC4E65D9EE739F9ED5E0C22C2FE7DD2ED229A67CF9E7184954AD165945ADE4AB72636EF6AD673367B74F337A5B55E8C5DBB7642EBB0E832448928A5B06FBF9C8CD54A7EE02F02F8CD663E675343DDC4E61D9EE7B1B4D6DBAB52A9C85165A22586060751AFCBDE30ADB0AA2FFD9DCD7CDE56CC43FCA8EF4B6BBD9DF64DEC95538C44CBECDF372183A62DE007FE02808F35FB799B9E042636EFF07CE95B6F97DAC0008687654EBA681DAD3576EE182BBA8C52C95BE9CBCDEC4B5FD1AAE6DD47F2DF42A2C52626F6165D82E801E3E3BB65A7CF26F2037F1EC06FB7E2B95B12EA2636FFB7E7794BD25A6FAD91916154ABB25787683DDFF7B17BD7CEA2CB28055204CFF3E64D6CDED38AE76F6547ECC7FDC09F6BE1F3F73422C25E39C948B4D1AE5D3B653FA12608FC600EC0275AF5FC2D0B75139BF728A5CEC9005E6BEC181B4318CA1446D13E4A299965B54D4A2990A273CD5A3D7ADDD768D513030011FD841FC80E8ECDA694C2EE71395B52B4DFD8D8A83426B6C10FFC5922FAC956BE464B43DDC4E64B44F4653FF0B77C8A8778AEB1D11154E463B0280011C961D55BE4073E13D1974D6CFEA995AFD3F2BE11227ABD9C8ED43C4484DD725189028D8E8EA022DB076C9AE7793111FD44AB5FA7E5A16E627396409F0E822069F56BF502B9A044D1A461B17941102404FAB489CD9956BF567B4631096FF67CCFCA14C7ED918FBEA2538C8D8EC84C980D222278BE674178733B5EAF2DA16E62D300F06BF9847BB145C3C3433248253A82520ABB64DEFA86E4B9F76B790EB65CDBE61B9AD8BC4B29F5B81FC8010E5B258B3F4427D931360A4FA62CAFCB0F7C28A59E68C576006B69EB4F8488EEF43C6FB19DAF5916FDFD5539E95D7414CFF3303A365A74191DCDF3BC4522BAA39DAFD9D65037B1792C1F3435ED7CDD32D8B5535AE9A2F3C8465F6B0B82C010E88F4C6C1E6BE7EBB6FFB313E14D9E2FFBC26C46A552C1D0D060D16508F11C5A6BD96FFD3AF2C1D12510DED0EED76E7BA89BD858001F092A81AC34DDA09D3B77C87ED6A263C9A7C8E7CAF3ED2379DEB55521A31C2636EF25A2BFF3033F2DE2F5BB0911616C74A4E832845853BD5E935959ABF8819F12D1DFB5727F97F51436744D44AFF37D3F9316E8FA868786E0FB32634874B61D32600AE04A23CCF77D4B44AF2BAA86C242DDC46609C087A41B667D6372B1882E303A3A225D84B8DAEDF2A13CDF0A51E82453139BF710D13F4837CCF5856105B5DA40D165087143411060B05E2FBA8C42E5DD2EFF6862F3EE22EB287CE50011BDD6F7FD447ECB3FD7E888F4A58BEE31DAC3633F79B74B83885E53742D8587BA89CD2280FF47BA619EAB972F12D17D0607EB3D3BFEB3AADBA5F0C59585873A7065368C22F5595994F48C6AB52A330A445721A29E5C4F11048151A4FEA2A8D92ED7EA88500700105EEF79DE1429E986018091E1A1A24B1062D37AED7D9B1F223D05C28F155DCB8A8E0975139B0C846FAF542A72A006AEECC82844B7191818E8A92D792B954A0CC28B4C6CB2A26B59D131A10E0026361788E8A34125E8E92D7A07FAFBE5200CD1958808C33DD2051354827922FAA889CD54D1B5ACD651A10E0026366F574A7DB197A7390E8F482B5D74AFE1E1E1A24B68393FF053A5D4174D6CDE5E742DD7EAB8500700227AB5EFFB977B759AE3D0A084BAE85E0303FD084A7C6E423E7DF13211BDBAE85AAEA723433D9F16F4BC4A5889D163B95EEDEB43A5D23B7D92A29CEA655D88444025AC2C03F8964E98BE783D1D19EA006062739E883E5C092A7345D7D24EF5C1925E0CA2A79475756925A8CC11D1474C6CCE155DCB5A3A36D401C0C4E61DA4E8AF8220E89919318312EAA204EAF55AE9F68209822026459F33B17947D1B5ACA7A3431D0088E80795A71EF603DF155D4BAB05818FFE6AB5E83284D836CFF34AB56F911FF8AC3CF570A7F6A3AFD6F1A16E62C344F49DBDB03F4C593FB28ADE5496F7733E306A88E89526365C743D37D2F1A10E00263633008E56C2CA629983BD26C782891229434B9D8850092B8B00264D6CA68BAE6723BA22D401C0C4E60922FA8D326FFC55AF49A88BF288A2A8EB579706956096887EC3C4E6F1A26BD9A8AE09750030B179A722757F5009168AAEA5D9FAFAA29EDDE14E94576DA07B5BEB41255850A4EE37B17967D1B56C4657853A0018637E5229F5377EE02745D7D24C035DFCE617622D03B5FEA24BD8123FF013A5D4178C313F59742D9BD575A10E5C9911E379DE37FDC06FFB49DDADD2CD2D1A21D652EBC22E453FF0ADE779DF24A2BB8AAE652BBA32D44D6C1222FA37BEEF5FF24BB21C7960A03B5B3442AC47876157AD90F6031FBEEF5F22A27F6362D395BD015D19EA006062330BE0F67CAA51D1E56C8BD65AFAD34569F557BBA3C1924F5DCC00DC9EE74B57EADA500700139B8B00F6873AB4DD1CECFDFDB2E0489457B50BDEDF4484508716C09E3C57BA5657873A70650F7600FFA9125696BA35D825D4459975FA2AE97C2EFA1280FF94E74957EBFA5007AE9C714A44BF5A092BF3DD18ECD50E7FD30BB11DD56A5FC7EE039307FA3C11FD6AA79C31BA5DA508750030B1793711FD66B72D4E524AA12F8A8A2E438896514A218A74D1655C57BEB8E8374D6CDE5D742DCD529A5007F2C5494AFD4E25AC744DB04751D4B1AD18219AA5133F8D56C2CAAC52EA77BA6D71D18D942AD401C0C4E63F7453B0F7F5492B5D945FA7BDCF5705FA7F28BA96662B5DA8035783FD93DD10EC9174BD881ED0495D8C79A07FB28C810E9434D401C0C4E66DDD10EC9DF46617A2553AA5F1B22AD0DF56742DAD52DA5007AE067B4777C574DAC752215AC1F7FDC25796AEEA72296DA003250F75E06A57CC272A6165AED3062483209095A4A26714D55ACFA72DCE2AA53E51D62E97D54A1FEA006062F376A5D46F75DA3CF64EF9482A443B14F17E5F9987AE94FA9889CDDBDB5E40017A22D4812BD31D89E8BF54C2CA72A704BBD661D12508D1363A6CEFFB7D65A52811FD97B24D5B5C4FCF843A707581D207431DA69D10EC619BDFE44214A99DEFF77C2F9794883E54A685451BD153A10E5CD95200C0DE5087C60FFC420F916D77CB458822B5EB93A91FF81CEAD000D85B96A5FF9BD173A10E5CDD046CC2F7FD33451EB4212D75D14B2A954ACB574FFB816F7DDF3F0B60A20C9B736D454F863A0098D85C0270CCF3BC13411014B2197E18568A7859210A4144A8545AF79E0F8220F13CEF010093F9F5DD937A36D401C0C4668E885EA43CF5F9761F661D043E3CCF6BE74B0A51B8567D3A0D2AC182F2D4E789E8DB4D6CE65AF2225DA2A7431D004C6CD2C424DFE779DE1F54C2CA6CBB06505BD96211A253854D7EDFAFCC41F73CEFD38949BECFC4266DEA0B74A19E0FF51526366F544A7DAC5D876D48A88B5ED4CC55A52B5316F339E86F68DA13773909F555F2B9EC47431D2EFB81EF5AF95A41D03D87F10AD12C41931A337EE0BB5087CB4434D94B73D0374242FD1A26364F0198C80750E356BD4E45425DF4A020D8FEB6184110C4F980E88489CD93DBAFAA5C24D4AFC3C46686885EA03CF5D94AA5328716F4C6484B5DF4A26D356608A8542A73CA539F25A2E79BD8CC34AFB2F290505F83890D272679B5F2D4C7C2308C9BDDCF2E1B79895EB4D5F73D11210CC35879EA6389495E6D6253E8C2C14E26A17E032636EF20A283A10EA7FCC06FDAC8BADF848FA142749BAD84BA1FF869A8C329223A6862F38E1694552A12EA1B60623305E090E7799F0B2AC17C339E53E6A88B5EB4D9F77D5009E63DCFFB6B0087F2EB50DC8084FA0699D82CE7F3D97F3BD461ACD4F6FEE97C0975D1A37CFFC6EF7DA514421DC69EE7FD7662927F6762B3DC86D24A41427D934C6C7E8E880E542A95278220305B7D1E69A98B5EE5A9F5DFFB4110984AA5F204111D30B1F9B93695551A12EA5B6062730184239EE7DDBBD555A812EAA257796BB4D457AD0EBD178423BDBA21D77649A86F91898D35C6FCA852EAD7431D2E6C661055025DF4B2EBBDFFF3C1D005A5D4AF1B637ED4C4A6B0DD53BB9D84FA36E5FB358F7B9EF7971B6DB54BA88B5EB6FAFDBFAA75FE9700C67B71FFF36693506F02139BC5C4243FA094FA70BEC5C0BAADF6E2CF5C12A2388AAEC44EDE3A5F564A7D3831C90F98D82C165C5A2948A8379189CD7B00ECF03CEF33EBB5DAA5A52E7A1A61A575FE19003BF2EB463489847A9399D82C2526B933EF6BBFB89D19324294CDD367CE9AE538BEA494FAF5C424779AD82C155D53D948A8B748DE37B8CBF3BD4F853A5C9215A4A2974D5DB880071FFAFAE2ECDCDCEF02D8297DE7AD23A1DE422636CEC4E60D4434E979DE572A95CA1C1149F78BE8195996E1B1279E989B9E9EF94A66EDEDC78EDEF653B58181966E6BDDEBA4F9D806F9F6A02FD091FEA5D00BDF6A9D0B00C8A9D3A2D4CE9C3D975C9E9D4D99F9376E9F3CFAAEA2EBE915D2526F23139B77011871EC3E75F2C187E2F35317A4C5224AE7FCD40577F2C187E2CBB3B39F72CE8D48A0B797B4D4DBCCC4A631D0DFFF53A9CDDE353D33F3C9F9F9F917EDDD333ED8D7D7577469426CCBF2F2329E3E737636CDB27F76CEFDD8F16393B222B40012EA0570CCC8DFF0DF7BE2E4A9173FFEE4539F88B41EDF33BEBBDEAAD3D6856895244970E6ECB9B9D89873D6DA9F387E6CF24B45D7D4CB24D40BC0EE995E97FC02387AE2E4A97B1E79ECF19FAA56AB037B76EF1A90939144A74BB30C67CE9E5B585A5A5AB0D67EFCF8B1C90DCD68B1567600682509F50E915F10EF7DE0D483BFF48DC5C59FAED76AC1EE5D3BAB724292E8345996E1DCF9A9A5B9F9F94C06413B8F2446011CAF7D12577E81BCEB81530F7E606E7EFEA76BB501B57BD7AE6A20E12E0A966619CE9D3FBF343FBFE098F9A3B74F1E7D67D13589E792A4288073379EF4925F30EF7CE0D4831F989F5F78F3C0C080DAB963AC5F4B9FBB6833932498BA7071716161C131F36F6E37CCA5FBA5B524D40BB091505F7135DC4F9E7AFFE2E2E28F6B1D0EEC1CDB51EFEFAFB6AE4021002C2E2E61EAE2853963920567ED7FBBFDD8E4BB9BF1BCCEC999D1AD24A15E80ADB454F20BEADD274E9EFABEA7CCE95FF43CEFF0E060BDB673C70ED9F45134D5D4850B3C3B3B376FAD7D34B3F63DC78F4DFE79339F5F5AEAAD25A15E006686730E5B39E734BFC0FEFCC4C9532FB8343DF30B972E4D7FE7F0F07065D7CE1DFE564E601202B8F29E3C7FE14236333DD300D1DF586BFFE3F16393FFA315AF25A1DE5A12EA05B1D66E29D457E417DCAB4E9C3C353E3D33F30B172F5DFA89A1C1C1787474A41A69DDBC4245A9C5C6E0D2A5E9A5CBB3B391A7D4A7AC733F7FFCD8E4D956BEA6847A6B49A817C45A87664C45CF2FC09F02F0530F9C3CF5FEF985851F0E7C7FA85EAFD5A56B46AC65EAC2059E9B9B9F4BB3ECB2B3F6F78E37A9BF7C2324D45B4B42BD20AD7863AFEA777F713A3DF38EA90B17FFD7C1C1FAF2C8F070B52ADB10F4BCA5E5654CCFCC2CCDCECEF5799EF727D6DA5F69F7EACF95AE47D13A12EA05B1366BD973E717EA9D274E9EF26667E7DEB7B8B0780788F60D0D0EEAE1A1A1200C2B2D7B6DD15992A48199CB97D3CBB3B306CC4F65D6DE0FE07D93B7DD5A487339CBA495DE6A12EA0549D3D685FA8AE3C7262D80F70078CF8993A76E9A9E99F9999999991FF48320AAD76A0323C3434AB623289F34CB303D3DE3E6E6E717B2348D19F843E7DC878F1F9B7CB8E8DAB26CDDE37B451348A817246DF39B3BBFA0DF06E06D274E9EFAB64BD3D36FBC343D7D77A552416D60A0363C34A82A1569C177AB46A38199CBB36E7E6161BED16810803F72CE7DECF8B1C92F175DDB6AED68CCF43A09F58214F9E6CE2FF42F0378C38993A75ED268347EECD2F4F45DBEEF07F55AADAF5EAF057D5154587D626396E3187373F3E9DCFCFC7276A5097C9F73EE93C78F4D7EB1E8DAD692A6D2526F3509F582A48DCE7873E701F045006F3E71F2D4B75C9A9EFE9199CB975FC5CCFB6AB501571B18A80EF4F7CB117C1DC05A8B85C545CC2F2C2CCDCF2F28227ACA39F71966FED4F163935F2DBABE8D90506F3D09F58234D246D1253C471E0C5F05F073274E9EDA393B3BF7FD8B0B8B775BE7FE6DA5524907FAAB7D03030341B5AF6F5B73ECC5C638E7B0B4BC8C85858574617169B9D168049E527F97597B2F80CF1E3F363955748D9BD56874DEFBBE6C24D40BD2E89096FA5AF2C0F844FE07274E9E7A61A3D1B8EBF2ECDC7739E78E5782C054ABD54A7FB51AF5F54590FEF8ED6B341A585E8EB1B8B4142F2D2D351A69AA9552279C737FCDCCF71D3F36F92F45D7B85D0D69A9B79C847A41922429BA844DC903E56AA89C3879EAF949A3F192B9F9F9EF65E617135154EDEBB351A46B03FDFDD05A4B6B7E1DCE391863B0B0B8883836F34BCBCB1E33C744F4256BED5F02F8A7562DD32F5262BAEB7DDF8D24D40BC2CC68341A5DDBC23D7E6CF22B00BE02E0230070E2E4A989F98585972C2E2D7DD7A5E999973BE70E7B9E97681DDABE28EA8FA2C8D361885E3CAE2F49129824411CC776398E178D4994B5562BA51E65E6BF77CEFD35AE84F85345D7DA6A494342BDD524D40B6492A46B43FD5AC78F4D9E06F0E9FC0F00E0C4C953871717B3DB9796965FE429F5AD0C3EE61CEF082B95451D692FAC54AA611852A5524158A974F560ACB51649A38146A3812449386934964C6C6CD268F42B45170874D23AF7AFCCFCDF013C70FCD8E42345D7DC6E596665F1511B48A81728310930305074192D73FCD8E4A3001E05F0272BB79D38794A9B24396E926492886EF3943AC6C011E7DC041191EFFB4910F85CA954824A10F4054100DFF7AFFCF13CF8BEDFD66E1DE71CB22C4366ED95FF6619D23445234D971B8D469AA61965591632332BA54E13F08875EE24333F04E014801393B71D356D2BB883755B9763B792502F502FBEC98F1F9B3400FE7BFEE7594E9C3C35D46834261A8DC6DEA5A5E509223AA4949A20600F03BB987998996B007C224A3CA532CFF39C528A9552448A48294F794A79447435F93D4FF944E431B3B5D65D5D20C0CCCEBA2BFF63C7EC9C63E71C596B9575CE67E610404644F3443443C07906CE38E74E33F363004E03781AC0E9E3C7262FB7FC1FAFCBF5E2FBBD0812EA054A1299DEB55A1E8C97019C58EF7E274E9EAA30F3A0736E30CDB24100FD00AA0022001AC0009EFDDEEE03100248002CAFBA3D03B000C00088012C01580430BBF2E7F8B149F921358991506F8BFF1F6FBBECED14E42EE70000000049454E44AE426082);
/*!40000 ALTER TABLE `umm_user_propic` ENABLE KEYS */;

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

/*!40000 ALTER TABLE `vp_app_expense_wkflw_det` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_app_expense_wkflw_det` ENABLE KEYS */;

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

/*!40000 ALTER TABLE `vp_app_invoice_wkflw_det` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_app_invoice_wkflw_det` ENABLE KEYS */;

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

/*!40000 ALTER TABLE `vp_app_opportunity_wkflw_det` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_app_opportunity_wkflw_det` ENABLE KEYS */;

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

/*!40000 ALTER TABLE `vp_app_po_wkflw_det` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_app_po_wkflw_det` ENABLE KEYS */;

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

/*!40000 ALTER TABLE `vp_app_project_wkflw_det` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_app_project_wkflw_det` ENABLE KEYS */;

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

/*!40000 ALTER TABLE `vp_app_proposal_wkflw_det` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_app_proposal_wkflw_det` ENABLE KEYS */;

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

/*!40000 ALTER TABLE `vp_app_wkflw_mst` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_app_wkflw_mst` ENABLE KEYS */;

DROP TABLE IF EXISTS `vp_bill`;
CREATE TABLE IF NOT EXISTS `vp_bill` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(100) NOT NULL,
  `status` char(1) NOT NULL,
  `approved_date` datetime DEFAULT NULL,
  `attachment_url` varchar(250) DEFAULT NULL,
  `balance_amount` decimal(19,2) DEFAULT NULL,
  `invoice_amount` decimal(19,2) DEFAULT NULL,
  `discount_amount` decimal(19,2) DEFAULT NULL,
  `discount_percentage` decimal(5,2) DEFAULT NULL,
  `discount_days_due` int(3) DEFAULT NULL,
  `net_days_due` int(3) DEFAULT NULL,
  `due_date` datetime DEFAULT NULL,
  `invoice_date_str` varchar(40) DEFAULT NULL,
  `invoice_date_format` varchar(40) DEFAULT NULL,
  `invoice_date` date DEFAULT NULL,
  `invoice_no` varchar(50) DEFAULT NULL,
  `content_extractable` char(1) DEFAULT NULL,
  `payment_status` char(2) NOT NULL,
  `remark` longtext DEFAULT NULL,
  `vendor_id` int(11) DEFAULT NULL,
  `po_id` int(11) DEFAULT NULL,
  `original_file_name` varchar(150) DEFAULT NULL,
  `created_on` datetime NOT NULL,
  `update_by` varchar(100) DEFAULT NULL,
  `update_on` datetime DEFAULT NULL,
  `delete_by` varchar(100) DEFAULT NULL,
  `delete_on` datetime DEFAULT NULL,
  `template_id` int(11) DEFAULT NULL,
  `submitted_on` datetime DEFAULT NULL,
  `submitted_by` varchar(100) DEFAULT '',
  `deletection_level` char(1) DEFAULT NULL,
  `term` int(11) DEFAULT NULL,
  `attachment_url_approved` varchar(250) DEFAULT NULL,
  `tax` decimal(19,2) DEFAULT NULL,
  `additional_notes` varchar(500) DEFAULT NULL,
  `discount_applicable_date` datetime DEFAULT NULL,
  `invoice_type` char(1) DEFAULT NULL,
  `applicable_discount_amount` decimal(19,2) DEFAULT NULL,
  `approved_by` varchar(100) DEFAULT '',
  `workflow_id` int(11) DEFAULT NULL,
  `workflow_level` int(11) DEFAULT NULL,
  `no_of_levels` int(3) DEFAULT NULL,
  `code_entry_level` int(11) DEFAULT NULL,
  `approval_group_level` int(3) DEFAULT NULL,
  `remaining_celing` decimal(19,2) DEFAULT NULL,
  `export_status` char(1) DEFAULT NULL,
  `created_by` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK39h0uns08ssn9fvuqlpktjdj8` (`vendor_id`) USING BTREE,
  KEY `PO_KEY_FK_1` (`po_id`),
  CONSTRAINT `PO_KEY_FK_1` FOREIGN KEY (`po_id`) REFERENCES `vp_po_mst` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*!40000 ALTER TABLE `vp_bill` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_bill` ENABLE KEYS */;

DROP TABLE IF EXISTS `vp_bill_additional_data`;
CREATE TABLE IF NOT EXISTS `vp_bill_additional_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field_value` varchar(200) DEFAULT NULL,
  `field_value_date` date DEFAULT NULL,
  `field_id` int(15) NOT NULL,
  `field_name` varchar(50) DEFAULT NULL,
  `invoice_mst_id` int(15) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK__vp_invoice_mst` (`invoice_mst_id`),
  CONSTRAINT `FK__vp_invoice_mst` FOREIGN KEY (`invoice_mst_id`) REFERENCES `vp_bill` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*!40000 ALTER TABLE `vp_bill_additional_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_bill_additional_data` ENABLE KEYS */;

DROP TABLE IF EXISTS `vp_bill_additional_field_attachment`;
CREATE TABLE IF NOT EXISTS `vp_bill_additional_field_attachment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field_id` int(11) NOT NULL,
  `invoice_mst_id` int(11) NOT NULL,
  `attachment_url` varchar(200) NOT NULL,
  `file_name` varchar(200) DEFAULT NULL,
  `file_type` varchar(100) DEFAULT NULL,
  `status` char(1) NOT NULL,
  `delete_by` varchar(100) DEFAULT '',
  `delete_on` datetime DEFAULT NULL,
  `field_name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_inv_mst` (`invoice_mst_id`),
  CONSTRAINT `FK_inv_mst` FOREIGN KEY (`invoice_mst_id`) REFERENCES `vp_bill` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*!40000 ALTER TABLE `vp_bill_additional_field_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_bill_additional_field_attachment` ENABLE KEYS */;

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

/*!40000 ALTER TABLE `vp_bill_assignee` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_bill_assignee` ENABLE KEYS */;

DROP TABLE IF EXISTS `vp_bill_attachment`;
CREATE TABLE IF NOT EXISTS `vp_bill_attachment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_id` int(11) NOT NULL,
  `invoice_data` mediumblob NOT NULL,
  `file_name` varchar(200) NOT NULL,
  `file_type` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*!40000 ALTER TABLE `vp_bill_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_bill_attachment` ENABLE KEYS */;

DROP TABLE IF EXISTS `vp_bill_audit_trail`;
CREATE TABLE IF NOT EXISTS `vp_bill_audit_trail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_date` datetime NOT NULL,
  `status_id` int(11) NOT NULL,
  `user_id` varchar(100) NOT NULL,
  `user_name` varchar(200) NOT NULL,
  `comment` varchar(1000) DEFAULT '',
  `invoice_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKbcyeuds2xgf57mx6c46cmrmag` (`invoice_id`) USING BTREE,
  KEY `status_id` (`status_id`) USING BTREE,
  CONSTRAINT `vp_bill_audit_trail_ibfk_1` FOREIGN KEY (`invoice_id`) REFERENCES `vp_bill` (`id`),
  CONSTRAINT `vp_bill_audit_trail_ibfk_2` FOREIGN KEY (`status_id`) REFERENCES `common_audit_trial_status` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*!40000 ALTER TABLE `vp_bill_audit_trail` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_bill_audit_trail` ENABLE KEYS */;

DROP TABLE IF EXISTS `vp_bill_create_detail`;
CREATE TABLE IF NOT EXISTS `vp_bill_create_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sku` varchar(50) DEFAULT NULL,
  `description` varchar(150) DEFAULT NULL,
  `unit_price` decimal(19,0) NOT NULL,
  `no_of_units` decimal(12,2) NOT NULL DEFAULT 0.00,
  `amount` decimal(19,0) NOT NULL,
  `invoice_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_invoice` (`invoice_id`) USING BTREE,
  CONSTRAINT `vp_bill_create_detail_ibfk_1` FOREIGN KEY (`invoice_id`) REFERENCES `vp_bill` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*!40000 ALTER TABLE `vp_bill_create_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_bill_create_detail` ENABLE KEYS */;

DROP TABLE IF EXISTS `vp_bill_expense_cost_distribution`;
CREATE TABLE IF NOT EXISTS `vp_bill_expense_cost_distribution` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) NOT NULL,
  `description` varchar(500) NOT NULL DEFAULT '',
  `amount` decimal(19,2) NOT NULL,
  `billable` tinyint(1) DEFAULT NULL,
  `tax` tinyint(1) DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  `invoice_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_vp_vendor_item_cost_distribution_vp_vendor_mst` (`invoice_id`),
  KEY `FK_vp_vendor_item_cost_distribution_common_chart_of_account` (`account_id`),
  KEY `PROJECT_ID_FK_3` (`project_id`),
  CONSTRAINT `FK_vp_vendor_item_cost_distribution_common_chart_of_account` FOREIGN KEY (`account_id`) REFERENCES `common_account_number` (`id`),
  CONSTRAINT `FK_vp_vendor_item_cost_distribution_vp_vendor_mst` FOREIGN KEY (`invoice_id`) REFERENCES `vp_bill` (`id`),
  CONSTRAINT `PROJECT_ID_FK_3` FOREIGN KEY (`project_id`) REFERENCES `common_approval_code` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*!40000 ALTER TABLE `vp_bill_expense_cost_distribution` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_bill_expense_cost_distribution` ENABLE KEYS */;

DROP TABLE IF EXISTS `vp_bill_item_cost_distribution`;
CREATE TABLE IF NOT EXISTS `vp_bill_item_cost_distribution` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) NOT NULL,
  `description` varchar(500) DEFAULT '',
  `qty` decimal(12,2) NOT NULL DEFAULT 0.00,
  `rate` decimal(19,2) NOT NULL,
  `amount` decimal(19,2) NOT NULL,
  `billable` tinyint(1) DEFAULT NULL,
  `tax` tinyint(1) DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  `po_id` int(11) DEFAULT NULL,
  `invoice_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_vp_invoice_item_cost_distribution_common_product_mst` (`item_id`),
  KEY `FK_vp_invoice_item_cost_distribution_vp_vendor_invoice` (`invoice_id`),
  KEY `PROJECT_ID_FK_1` (`project_id`),
  KEY `PO_ID_FK_1` (`po_id`),
  CONSTRAINT `FK_vp_invoice_item_cost_distribution_common_product_mst` FOREIGN KEY (`item_id`) REFERENCES `common_item_mst` (`id`),
  CONSTRAINT `FK_vp_invoice_item_cost_distribution_vp_vendor_invoice` FOREIGN KEY (`invoice_id`) REFERENCES `vp_bill` (`id`),
  CONSTRAINT `PO_ID_FK_1` FOREIGN KEY (`po_id`) REFERENCES `vp_po_mst` (`id`),
  CONSTRAINT `PROJECT_ID_FK_1` FOREIGN KEY (`project_id`) REFERENCES `common_approval_code` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

/*!40000 ALTER TABLE `vp_bill_item_cost_distribution` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_bill_item_cost_distribution` ENABLE KEYS */;

DROP TABLE IF EXISTS `vp_bill_payment`;
CREATE TABLE IF NOT EXISTS `vp_bill_payment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `payment_referance_no` varchar(30) NOT NULL,
  `payment_date` datetime NOT NULL,
  `payment_type` char(1) DEFAULT NULL,
  `payment_type_description` varchar(200) DEFAULT NULL,
  `invoice_id` int(11) NOT NULL,
  `amount` decimal(19,2) NOT NULL,
  `discount_amount` decimal(19,2) NOT NULL,
  `status` char(1) DEFAULT NULL,
  `mailed_date` datetime DEFAULT NULL,
  `mailed_user` varchar(50) DEFAULT NULL,
  `sync_id` int(11) DEFAULT NULL,
  `invoice_no` varchar(50) DEFAULT NULL,
  `import_id` int(11) DEFAULT NULL,
  `ap_account_ref` int(11) DEFAULT NULL,
  `bank_account_ref` int(11) DEFAULT NULL,
  `distribution_id` int(11) DEFAULT NULL,
  `update_by` varchar(100) DEFAULT NULL,
  `update_on` datetime DEFAULT NULL,
  `created_by` varchar(100) NOT NULL,
  `created_on` datetime NOT NULL,
  `delete_by` varchar(100) DEFAULT NULL,
  `delete_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `invoice_id` (`invoice_id`) USING BTREE,
  KEY `FK_IMPORT_MST` (`import_id`),
  KEY `FK_AP_ACCOUNT` (`ap_account_ref`),
  KEY `FK_BANK_ACCOUNT_REF` (`bank_account_ref`),
  CONSTRAINT `FK_AP_ACCOUNT` FOREIGN KEY (`ap_account_ref`) REFERENCES `common_account_number` (`id`),
  CONSTRAINT `FK_BANK_ACCOUNT_REF` FOREIGN KEY (`bank_account_ref`) REFERENCES `common_account_number` (`id`),
  CONSTRAINT `FK_IMPORT_MST` FOREIGN KEY (`import_id`) REFERENCES `vp_bill_payment_import_mst` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*!40000 ALTER TABLE `vp_bill_payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_bill_payment` ENABLE KEYS */;

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*!40000 ALTER TABLE `vp_bill_payment_additional_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_bill_payment_additional_data` ENABLE KEYS */;

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*!40000 ALTER TABLE `vp_bill_payment_additional_field_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_bill_payment_additional_field_attachment` ENABLE KEYS */;

DROP TABLE IF EXISTS `vp_bill_payment_attachment`;
CREATE TABLE IF NOT EXISTS `vp_bill_payment_attachment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_payment_id` int(11) NOT NULL,
  `payment_data` mediumblob NOT NULL,
  `name` varchar(200) NOT NULL,
  `file_type` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*!40000 ALTER TABLE `vp_bill_payment_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_bill_payment_attachment` ENABLE KEYS */;

DROP TABLE IF EXISTS `vp_bill_payment_distribution`;
CREATE TABLE IF NOT EXISTS `vp_bill_payment_distribution` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `un_tag_referance` int(11) NOT NULL,
  `invoice_referance` int(11) NOT NULL,
  `distribute_amount` decimal(19,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*!40000 ALTER TABLE `vp_bill_payment_distribution` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_bill_payment_distribution` ENABLE KEYS */;

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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

/*!40000 ALTER TABLE `vp_bill_payment_import_issue` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_bill_payment_import_issue` ENABLE KEYS */;

DROP TABLE IF EXISTS `vp_bill_payment_import_mst`;
CREATE TABLE IF NOT EXISTS `vp_bill_payment_import_mst` (
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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

/*!40000 ALTER TABLE `vp_bill_payment_import_mst` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_bill_payment_import_mst` ENABLE KEYS */;

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

/*!40000 ALTER TABLE `vp_bill_related_grn` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_bill_related_grn` ENABLE KEYS */;

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

/*!40000 ALTER TABLE `vp_bill_temp` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_bill_temp` ENABLE KEYS */;

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

/*!40000 ALTER TABLE `vp_bill_template_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_bill_template_detail` ENABLE KEYS */;

DROP TABLE IF EXISTS `vp_bill_template_mst`;
CREATE TABLE IF NOT EXISTS `vp_bill_template_mst` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vendor_id` int(11) NOT NULL,
  `template_name` varchar(100) NOT NULL,
  `invoice_date_format` varchar(30) NOT NULL,
  `invoice_id` int(11) DEFAULT NULL,
  `created_by` varchar(100) NOT NULL,
  `created_on` datetime NOT NULL,
  `update_by` varchar(100) DEFAULT NULL,
  `update_on` datetime DEFAULT NULL,
  `delete_by` varchar(100) DEFAULT NULL,
  `delete_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `vendor_id` (`vendor_id`) USING BTREE,
  KEY `invoice_id` (`invoice_id`) USING BTREE,
  CONSTRAINT `vp_bill_template_mst_ibfk_2` FOREIGN KEY (`invoice_id`) REFERENCES `vp_bill` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*!40000 ALTER TABLE `vp_bill_template_mst` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_bill_template_mst` ENABLE KEYS */;

DROP TABLE IF EXISTS `vp_bill_term`;
CREATE TABLE IF NOT EXISTS `vp_bill_term` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `term` varchar(50) NOT NULL,
  `net_days_due` int(4) NOT NULL,
  `discount_percentage` decimal(5,2) DEFAULT NULL,
  `discount_days_due` int(4) DEFAULT NULL,
  `status` char(1) NOT NULL,
  `created_by` varchar(100) NOT NULL,
  `created_on` datetime NOT NULL,
  `update_by` varchar(100) DEFAULT '',
  `update_on` datetime DEFAULT NULL,
  `delete_by` varchar(100) DEFAULT NULL,
  `delete_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

/*!40000 ALTER TABLE `vp_bill_term` DISABLE KEYS */;
INSERT INTO `vp_bill_term` (`id`, `term`, `net_days_due`, `discount_percentage`, `discount_days_due`, `status`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES
	(1, 'Due on receipt', 0, 0.00, 0, 'A', 'admin', '2019-10-14 10:38:44', NULL, NULL, NULL, NULL),
	(2, 'Net 10', 10, 0.00, 0, 'A', 'admin', '2019-10-14 10:39:29', NULL, NULL, NULL, NULL),
	(3, 'Net 15', 15, 0.00, 0, 'A', 'admin', '2019-10-14 10:40:09', NULL, NULL, NULL, NULL),
	(4, 'Net 30', 30, 0.00, 0, 'A', 'admin', '2019-10-14 10:40:28', NULL, NULL, NULL, NULL),
	(5, 'Net 60', 60, 0.00, 0, 'A', 'admin', '2019-10-14 10:40:57', NULL, NULL, NULL, NULL),
	(6, '1%/10, Net 30', 30, 1.00, 10, 'A', 'admin', '2019-10-14 10:41:27', NULL, NULL, NULL, NULL),
	(7, '1%/15, Net 30', 30, 1.00, 15, 'A', 'admin', '2019-10-14 10:41:48', NULL, NULL, NULL, NULL),
	(8, '2%/10, Net 30', 30, 2.00, 10, 'A', 'admin', '2019-10-14 10:42:08', NULL, NULL, NULL, NULL),
	(9, '2%/15/Net 30', 30, 2.00, 15, 'A', 'admin', '2019-10-14 10:42:46', NULL, NULL, NULL, NULL),
	(10, 'Other', 0, 0.00, 0, 'A', 'admin', '2019-10-14 10:43:11', NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `vp_bill_term` ENABLE KEYS */;

DROP TABLE IF EXISTS `vp_check_mst`;
CREATE TABLE IF NOT EXISTS `vp_check_mst` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `amount` decimal(19,2) NOT NULL,
  `check_date` date NOT NULL,
  `check_no` varchar(30) NOT NULL,
  `check_status` char(1) NOT NULL,
  `invoice_id` int(11) NOT NULL,
  `vendor_id` int(11) NOT NULL,
  `created_by` varchar(100) NOT NULL,
  `created_on` datetime NOT NULL,
  `update_by` varchar(100) DEFAULT NULL,
  `update_on` datetime DEFAULT NULL,
  `delete_by` varchar(100) DEFAULT NULL,
  `delete_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKd7r0kgjcs1kcsxv21l0iy9vvs` (`invoice_id`),
  KEY `FK3iawric89lsfvftwdt9hyxo82` (`vendor_id`),
  CONSTRAINT `FKd7r0kgjcs1kcsxv21l0iy9vvs` FOREIGN KEY (`invoice_id`) REFERENCES `vp_bill` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*!40000 ALTER TABLE `vp_check_mst` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_check_mst` ENABLE KEYS */;

DROP TABLE IF EXISTS `vp_customer_vendor_relation`;
CREATE TABLE IF NOT EXISTS `vp_customer_vendor_relation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vendor_name` varchar(50) DEFAULT NULL,
  `vendor_email` varchar(50) DEFAULT NULL,
  `contact_number` varchar(20) DEFAULT '',
  `contact_person` varchar(150) DEFAULT NULL,
  `local_vendor_id` int(11) DEFAULT NULL,
  `community_vendor_id` int(11) NOT NULL,
  `request_id` int(11) NOT NULL,
  `request_by` varchar(100) NOT NULL,
  `request_on` datetime DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=latin1;

/*!40000 ALTER TABLE `vp_customer_vendor_relation` DISABLE KEYS */;
INSERT INTO `vp_customer_vendor_relation` (`id`, `vendor_name`, `vendor_email`, `contact_number`, `contact_person`, `local_vendor_id`, `community_vendor_id`, `request_id`, `request_by`, `request_on`, `status`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES
	(20, 'Silver Kite, Inc', 'steve@flysilverkite.com', NULL, NULL, NULL, 1443, 0, 'silverkiteinc', '2020-02-19 03:45:00', 'A', '', '0000-00-00 00:00:00', NULL, NULL, NULL, NULL),
	(21, 'Aerotek, Inc', 'eklebahn@aerotek.com', NULL, NULL, NULL, 1446, 0, 'Aerotek', '2020-04-23 02:41:07', 'A', '', '0000-00-00 00:00:00', NULL, NULL, NULL, NULL),
	(22, 'Test Company for Kim', 'kimaddis1@gmail.com', NULL, NULL, NULL, 1450, 0, 'kimaddis1@gmail.com', '2020-04-25 00:32:37', 'A', '', '0000-00-00 00:00:00', NULL, NULL, NULL, NULL),
	(23, 'Design Solutions LLC', 'trageser@ds-engrs.com', NULL, NULL, NULL, 1452, 0, 'Design Solutions LLC', '2020-04-29 20:01:28', 'A', '', '0000-00-00 00:00:00', NULL, NULL, NULL, NULL),
	(24, 'Titan Construction, LLC', 'dlbellinger@comcast.net', NULL, NULL, NULL, 1453, 0, 'dlbellinger', '2020-04-30 01:25:41', 'A', '', '0000-00-00 00:00:00', NULL, NULL, NULL, NULL),
	(25, 'Mark S. Shinto', 'msshinto@comcast.net', NULL, NULL, NULL, 1449, 0, 'MarkS', '2020-05-04 20:33:47', 'A', '', '0000-00-00 00:00:00', NULL, NULL, NULL, NULL),
	(26, 'On Point Design, LLC', 'TA@onpointdesignstudio.com', NULL, NULL, NULL, 1460, 0, 'onpointdesignstudio', '2020-05-15 20:46:11', 'A', '', '0000-00-00 00:00:00', NULL, NULL, NULL, NULL),
	(27, 'Property Condition Assessments, LLC', 'epowers@pcallc.com', NULL, NULL, NULL, 1462, 0, 'epowers@pcallc.com', '2020-05-29 19:22:55', 'A', '', '0000-00-00 00:00:00', NULL, NULL, NULL, NULL),
	(28, 'Veterans Environmental', 'ryan@vetsgee.com', NULL, NULL, NULL, 1464, 0, '248', '2020-06-12 18:39:59', 'A', '', '0000-00-00 00:00:00', NULL, NULL, NULL, NULL),
	(29, 'Nichols Contracting, Inc.', 'psweeney@nicholscontracting.com', NULL, NULL, NULL, 1457, 0, 'PSweeney', '2020-06-18 01:39:51', 'A', '', '0000-00-00 00:00:00', NULL, NULL, NULL, NULL),
	(30, 'Steven Myers', 'Sm1@sdc-ae.com', NULL, NULL, NULL, 1491, 0, 'Sm1', '2020-06-26 18:57:52', 'A', '', '0000-00-00 00:00:00', NULL, NULL, NULL, NULL),
	(31, 'SECUR LPT, LLC', 'cliff.bright@securllc.com', NULL, NULL, NULL, 1492, 0, 'SECURLPT', '2020-07-09 19:04:43', 'A', '', '0000-00-00 00:00:00', NULL, NULL, NULL, NULL),
	(32, 'Crane Service Company, Inc.', 'katiet@craneserviceco.com', NULL, NULL, NULL, 1465, 0, 'katiet@craneserviceco.com', '2020-07-23 01:36:29', 'A', '', '0000-00-00 00:00:00', NULL, NULL, NULL, NULL),
	(33, 'Red Team Consulting', 'rina.kim@redteamconsulting.com', NULL, NULL, NULL, 1494, 0, 'redteam9009', '2020-07-24 00:37:34', 'A', '', '0000-00-00 00:00:00', NULL, NULL, NULL, NULL),
	(34, 'Industrial Boiler & Mechanical Company, Inc.', 'amy@industrialboiler.com', NULL, NULL, NULL, 1502, 0, 'Ibm2018', '2020-08-26 18:26:48', 'A', '', '0000-00-00 00:00:00', NULL, NULL, NULL, NULL),
	(35, 'Optimal Tank Solutions', 'mvaughan@optimaltanksolutions.com', NULL, NULL, NULL, 1506, 0, 'optimaltank', '2020-09-24 20:10:48', 'A', '', '0000-00-00 00:00:00', NULL, NULL, NULL, NULL),
	(51, 'testCompany', 'mevitol345@nic58.com', NULL, NULL, NULL, 1513, 0, 'ven02', '2020-10-19 12:22:18', 'A', '', '0000-00-00 00:00:00', 'user1', '2020-10-19 12:24:03', NULL, NULL),
	(52, 'a1', 'avishkaperera6@gmail.com', NULL, NULL, NULL, 1514, 0, 'a1', '2020-10-23 05:25:30', 'C', '', '0000-00-00 00:00:00', 'a1', '2020-10-23 05:39:47', NULL, NULL),
	(53, 'a1', 'avishkaperera6@gmail.com', NULL, NULL, NULL, 1514, 0, 'a1', '2020-10-23 05:25:41', 'C', '', '0000-00-00 00:00:00', 'a1', '2020-10-23 05:39:52', NULL, NULL),
	(54, 'a1', 'avishkaperera6@gmail.com', NULL, NULL, NULL, 1514, 0, 'a1', '2020-10-23 05:42:07', 'A', '', '0000-00-00 00:00:00', 'admin', '2020-10-23 11:46:56', NULL, NULL),
	(55, 'we', 'avishkaperera6@gmail.com', NULL, NULL, NULL, 1516, 0, 'newww', '2020-10-25 16:07:29', 'A', '', '0000-00-00 00:00:00', 'admin', '2020-10-25 16:08:20', NULL, NULL),
	(56, 'newprod', 'yifejov599@akxpert.com', NULL, NULL, NULL, 1519, 0, 'yifejov599@akxpert.com', '2020-11-08 12:44:19', 'A', '', '0000-00-00 00:00:00', 'admin', '2020-11-08 13:39:13', NULL, NULL),
	(57, 'avishka141', 'avishkaperera6@gmail.com', NULL, NULL, NULL, 1514, 0, 'a1', '2020-11-28 11:48:27', 'A', '', '0000-00-00 00:00:00', 'admin', '2020-12-03 16:01:01', NULL, NULL),
	(58, 'avishka141', 'avishkaperera6@gmail.com', NULL, NULL, NULL, 1514, 0, 'a1', '2020-12-09 18:54:49', 'A', '', '0000-00-00 00:00:00', 'admin', '2020-12-09 18:55:07', NULL, NULL),
	(59, 'QBREGVEN', 'avishkaperera6@gmail.com', NULL, NULL, NULL, 1814, 0, 'sitalev143@hebgsw.com', '2020-12-11 06:20:36', 'A', '', '0000-00-00 00:00:00', 'admin', '2020-12-11 06:21:52', NULL, NULL),
	(60, 'myvendor1', 'testpapertrl6@gmail.com', NULL, NULL, NULL, 2094, 0, 'QA-138', '2021-01-02 20:29:58', 'A', '', '0000-00-00 00:00:00', 'myvendor1', '2021-01-02 20:29:58', NULL, NULL),
	(61, 'heyload', 'testpapertrl8@gmail.com', NULL, NULL, NULL, 2103, 0, 'qwerty@123', '2021-01-05 08:14:02', 'A', '', '0000-00-00 00:00:00', 'heyload', '2021-01-05 08:14:02', NULL, NULL),
	(62, 'PortalInvite', 'foyorar546@liaphoto.com', NULL, NULL, NULL, 2416, 0, 'testing-qa', '2021-01-08 06:43:31', 'A', '', '0000-00-00 00:00:00', 'PortalInvite', '2021-01-08 06:43:31', NULL, NULL);
/*!40000 ALTER TABLE `vp_customer_vendor_relation` ENABLE KEYS */;

DROP TABLE IF EXISTS `vp_expense_additional_data`;
CREATE TABLE IF NOT EXISTS `vp_expense_additional_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field_value` varchar(300) DEFAULT NULL,
  `field_value_date` date DEFAULT NULL,
  `field_id` int(15) NOT NULL,
  `field_name` varchar(50) DEFAULT NULL,
  `expense_mst_id` int(15) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK__vp_expense_mst` (`expense_mst_id`),
  CONSTRAINT `FK__vp_expense_mst` FOREIGN KEY (`expense_mst_id`) REFERENCES `vp_expense_mst` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*!40000 ALTER TABLE `vp_expense_additional_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_expense_additional_data` ENABLE KEYS */;

DROP TABLE IF EXISTS `vp_expense_additional_field_attachments`;
CREATE TABLE IF NOT EXISTS `vp_expense_additional_field_attachments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field_id` int(11) NOT NULL,
  `expense_mst_id` int(11) NOT NULL,
  `attachment_url` varchar(200) NOT NULL,
  `file_name` varchar(200) DEFAULT NULL,
  `file_type` varchar(100) DEFAULT NULL,
  `status` char(1) NOT NULL,
  `delete_by` varchar(100) DEFAULT '',
  `delete_on` datetime DEFAULT NULL,
  `field_name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Fk_fieldId` (`field_id`),
  KEY `Fk_expense_mst` (`expense_mst_id`),
  CONSTRAINT `Fk_expense_mst` FOREIGN KEY (`expense_mst_id`) REFERENCES `vp_expense_mst` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*!40000 ALTER TABLE `vp_expense_additional_field_attachments` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_expense_additional_field_attachments` ENABLE KEYS */;

DROP TABLE IF EXISTS `vp_expense_attachments`;
CREATE TABLE IF NOT EXISTS `vp_expense_attachments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `expense_mst_id` int(11) NOT NULL,
  `attachment_url` varchar(200) NOT NULL,
  `file_name` varchar(200) DEFAULT NULL,
  `file_type` varchar(30) DEFAULT NULL,
  `status` char(1) NOT NULL,
  `delete_by` varchar(100) DEFAULT '',
  `delete_on` datetime DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*!40000 ALTER TABLE `vp_expense_attachments` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_expense_attachments` ENABLE KEYS */;

DROP TABLE IF EXISTS `vp_expense_audit_trail`;
CREATE TABLE IF NOT EXISTS `vp_expense_audit_trail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_date` datetime NOT NULL,
  `status_id` int(11) NOT NULL,
  `user_id` varchar(50) NOT NULL,
  `user_name` varchar(200) NOT NULL,
  `comment` varchar(300) DEFAULT NULL,
  `expense_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK__vp_expense_type` (`status_id`),
  KEY `FK__ar_expense_mst` (`expense_id`),
  CONSTRAINT `` FOREIGN KEY (`status_id`) REFERENCES `common_audit_trial_status` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_ar_expense_det` FOREIGN KEY (`expense_id`) REFERENCES `vp_expense_mst` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_vp_expense_audit_trail_vp_vendor_invoice_status` FOREIGN KEY (`status_id`) REFERENCES `common_audit_trial_status` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*!40000 ALTER TABLE `vp_expense_audit_trail` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_expense_audit_trail` ENABLE KEYS */;

DROP TABLE IF EXISTS `vp_expense_detail`;
CREATE TABLE IF NOT EXISTS `vp_expense_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `amount` decimal(19,2) DEFAULT NULL,
  `expense_date` date DEFAULT NULL,
  `file_name` varchar(200) DEFAULT '',
  `file_type` varchar(50) DEFAULT NULL,
  `attachment_url` varchar(255) DEFAULT NULL,
  `project_code_id` int(15) DEFAULT NULL,
  `account_id` int(15) DEFAULT NULL,
  `project_account_code` varchar(200) DEFAULT NULL,
  `expense_account_code` varchar(200) DEFAULT NULL,
  `expense_mst_id` int(11) DEFAULT NULL,
  `merchant` varchar(50) DEFAULT NULL,
  `expense_type` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1_EXPENSE_MST_ID` (`expense_mst_id`) USING BTREE,
  CONSTRAINT `vp_expense_detail_ibfk_1` FOREIGN KEY (`expense_mst_id`) REFERENCES `vp_expense_mst` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*!40000 ALTER TABLE `vp_expense_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_expense_detail` ENABLE KEYS */;

DROP TABLE IF EXISTS `vp_expense_mst`;
CREATE TABLE IF NOT EXISTS `vp_expense_mst` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `creator_name` varchar(100) DEFAULT '',
  `workflow_id` int(11) DEFAULT NULL,
  `workflow_level` int(11) DEFAULT NULL,
  `no_of_levels` int(3) DEFAULT NULL,
  `code_entry_level` int(3) DEFAULT NULL,
  `file_name` varchar(30) DEFAULT NULL,
  `file_type` varchar(30) DEFAULT NULL,
  `attachment_url` varchar(255) DEFAULT NULL,
  `approval_group_level` int(3) DEFAULT NULL,
  `notes` varchar(500) DEFAULT NULL,
  `first_level_approver` varchar(50) DEFAULT NULL,
  `created_by` varchar(100) NOT NULL,
  `created_on` datetime NOT NULL,
  `update_by` varchar(100) DEFAULT '',
  `update_on` datetime DEFAULT NULL,
  `delete_by` varchar(100) DEFAULT '',
  `delete_on` datetime DEFAULT NULL,
  `approved_by` varchar(100) DEFAULT '',
  `approved_date` date DEFAULT NULL,
  `total_amount` decimal(19,2) DEFAULT NULL,
  `status` char(1) NOT NULL,
  `report_name` varchar(50) DEFAULT NULL,
  `business_purpose` varchar(50) DEFAULT NULL,
  `export_status` char(1) DEFAULT 'N',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10000 DEFAULT CHARSET=latin1;

/*!40000 ALTER TABLE `vp_expense_mst` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_expense_mst` ENABLE KEYS */;

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

DROP TABLE IF EXISTS `vp_po_additional_data`;
CREATE TABLE IF NOT EXISTS `vp_po_additional_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field_value` varchar(300) DEFAULT NULL,
  `field_value_date` date DEFAULT NULL,
  `field_id` int(15) NOT NULL,
  `field_name` varchar(50) NOT NULL,
  `section_id` int(11) NOT NULL,
  `detail_id` int(11) DEFAULT NULL,
  `po_mst_id` int(15) NOT NULL,
  `display_order` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK__vp_purchase_order_mst` (`po_mst_id`),
  CONSTRAINT `FK__vp_purchase_order_mst` FOREIGN KEY (`po_mst_id`) REFERENCES `vp_po_mst` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*!40000 ALTER TABLE `vp_po_additional_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_po_additional_data` ENABLE KEYS */;

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

/*!40000 ALTER TABLE `vp_po_additional_field_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_po_additional_field_attachment` ENABLE KEYS */;

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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

/*!40000 ALTER TABLE `vp_po_attachment` DISABLE KEYS */;
INSERT INTO `vp_po_attachment` (`id`, `po_mst_id`, `attachment_url`, `file_name`, `file_type`, `status`, `delete_by`, `delete_on`) VALUES
	(2, 5, 'VP_SYSTEM/Purchase_Order/13/2021-03-06/03-06-2021/admin/1615034311095_INV10101.pdf', 'INV10101.pdf', 'application/pdf', 'A', NULL, NULL),
	(3, 6, 'VP_SYSTEM/Purchase_Order/13/2021-03-06/03-06-2021/admin/1615036631445_invoice_011717.pdf', 'invoice_011717.pdf', 'application/pdf', 'A', NULL, NULL),
	(4, 7, 'VP_SYSTEM/Purchase_Order/13/2021-03-06/03-06-2021/admin/1615040395097_invoice_10917.pdf', 'invoice_10917.pdf', 'application/pdf', 'A', NULL, NULL),
	(5, 7, 'VP_SYSTEM/Purchase_Order/13/2021-03-06/03-06-2021/admin/1615040401810_invoice_11117.pdf', 'invoice_11117.pdf', 'application/pdf', 'A', NULL, NULL),
	(6, 9, 'VP_SYSTEM/Purchase_Order/13/2021-03-06/03-06-2021/admin/1615041858591_invoice_10917.pdf', 'invoice_10917.pdf', 'application/pdf', 'A', NULL, NULL),
	(7, 11, 'VP_SYSTEM/Purchase_Order/13/2021-03-06/03-06-2021/admin/1615042089024_INV10101.pdf', 'INV10101.pdf', 'application/pdf', 'A', NULL, NULL);
/*!40000 ALTER TABLE `vp_po_attachment` ENABLE KEYS */;

DROP TABLE IF EXISTS `vp_po_audit_trail`;
CREATE TABLE IF NOT EXISTS `vp_po_audit_trail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_date` datetime NOT NULL,
  `status_id` int(11) NOT NULL,
  `user_id` varchar(100) NOT NULL,
  `user_name` varchar(200) NOT NULL,
  `comment` varchar(300) DEFAULT NULL,
  `puchase_order_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `frky1_po_id` (`puchase_order_id`),
  KEY `frky2_status_id` (`status_id`),
  CONSTRAINT `frky1_po_id` FOREIGN KEY (`puchase_order_id`) REFERENCES `vp_po_mst` (`id`),
  CONSTRAINT `frky2_status_id` FOREIGN KEY (`status_id`) REFERENCES `common_audit_trial_status` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

/*!40000 ALTER TABLE `vp_po_audit_trail` DISABLE KEYS */;
INSERT INTO `vp_po_audit_trail` (`id`, `action_date`, `status_id`, `user_id`, `user_name`, `comment`, `puchase_order_id`) VALUES
	(2, '2021-03-06 12:39:27', 15, 'admin', 'avishka perera', 'Assigned to Project Manager Group ', 5),
	(3, '2021-03-06 13:18:38', 23, 'admin', 'avishka perera', NULL, 6),
	(4, '2021-03-06 13:38:13', 5, 'admin', 'avishka perera', 'Assigned to Account Receivable Group ', 5),
	(5, '2021-03-06 13:50:40', 5, 'admin', 'avishka perera', 'Assigned to Account Receivable Group ', 5),
	(6, '2021-03-06 14:04:18', 5, 'admin', 'avishka perera', 'Assigned to Account Receivable Group ', 5),
	(7, '2021-03-06 14:10:54', 5, 'admin', 'avishka perera', 'Assigned to Account Receivable Group ', 5),
	(8, '2021-03-06 14:13:50', 5, 'admin', 'avishka perera', 'Assigned to Account Receivable Group ', 5),
	(9, '2021-03-06 14:17:41', 5, 'admin', 'avishka perera', 'Assigned to Account Receivable Group ', 5),
	(10, '2021-03-06 14:18:31', 3, 'admin', 'avishka perera', NULL, 5),
	(11, '2021-03-06 14:20:20', 15, 'admin', 'avishka perera', 'Assigned to Project Manager Group ', 7),
	(12, '2021-03-06 14:21:10', 5, 'admin', 'avishka perera', 'Assigned to Account Receivable Group ', 7),
	(13, '2021-03-06 14:21:34', 5, 'admin', 'avishka perera', 'Assigned to indragupthaekanayaka@gmail.com', 7),
	(14, '2021-03-06 14:21:57', 3, 'admin', 'avishka perera', 'Approver Finalized', 7),
	(15, '2021-03-06 14:29:44', 15, 'admin', 'avishka perera', 'Assigned to Project Manager Group  And indragupthaekanayaka@gmail.com', 8),
	(16, '2021-03-06 14:30:08', 4, 'admin', 'avishka perera', NULL, 8),
	(17, '2021-03-06 14:44:33', 15, 'admin', 'avishka perera', 'Assigned to Project Manager Group ', 9),
	(18, '2021-03-06 14:48:37', 15, 'admin', 'avishka perera', 'Assigned to Project Manager Group ', 11),
	(19, '2021-03-06 14:54:27', 3, 'admin', 'avishka perera', NULL, 11);
/*!40000 ALTER TABLE `vp_po_audit_trail` ENABLE KEYS */;

DROP TABLE IF EXISTS `vp_po_detail`;
CREATE TABLE IF NOT EXISTS `vp_po_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `purchase_order_mst_id` int(11) NOT NULL,
  `sort_order` int(3) DEFAULT NULL,
  `item_number` varchar(50) NOT NULL DEFAULT '',
  `description` varchar(200) DEFAULT NULL,
  `qty` decimal(12,2) DEFAULT NULL,
  `uom_id` int(11) DEFAULT NULL,
  `unit_price` decimal(19,2) DEFAULT NULL,
  `discount_amount` decimal(19,2) DEFAULT NULL,
  `amount` decimal(19,2) DEFAULT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mst_id` (`purchase_order_mst_id`),
  KEY `uom_id` (`uom_id`),
  CONSTRAINT `mst_id` FOREIGN KEY (`purchase_order_mst_id`) REFERENCES `vp_po_mst` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `uom_id` FOREIGN KEY (`uom_id`) REFERENCES `common_uom` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

/*!40000 ALTER TABLE `vp_po_detail` DISABLE KEYS */;
INSERT INTO `vp_po_detail` (`id`, `purchase_order_mst_id`, `sort_order`, `item_number`, `description`, `qty`, `uom_id`, `unit_price`, `discount_amount`, `amount`, `product_id`) VALUES
	(3, 5, NULL, 'ITEM 1', 'Sand', 10.50, 2, 15000.00, 0.00, 157500.00, 1),
	(4, 5, NULL, 'ITEM 2', 'Ciment', 30.00, 2, 1000.00, 0.00, 30000.00, 2),
	(5, 6, NULL, 'ITEM 1', 'Sand', 1.00, NULL, 15000.00, 0.00, 15000.00, 1),
	(6, 7, NULL, 'ITEM 1', 'Sand', 2.00, 2, 15000.00, 0.00, 30000.00, 1),
	(7, 8, NULL, 'ITEM 2', 'Ciment', 12.00, 2, 1000.00, 0.00, 12000.00, 2),
	(8, 9, NULL, 'ITEM 1', 'Sand', 10.00, 2, 15000.00, 0.00, 150000.00, 1),
	(9, 9, NULL, 'ITEM 2', 'Ciment', 11.00, 2, 1000.00, 0.00, 11000.00, 2),
	(10, 11, NULL, 'ITEM 1', 'Sand', 100.00, NULL, 15000.00, 0.00, 1500000.00, 1);
/*!40000 ALTER TABLE `vp_po_detail` ENABLE KEYS */;

DROP TABLE IF EXISTS `vp_po_mst`;
CREATE TABLE IF NOT EXISTS `vp_po_mst` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `creator_name` varchar(100) DEFAULT '',
  `created_by` varchar(100) NOT NULL,
  `created_on` datetime NOT NULL,
  `status` char(1) NOT NULL,
  `update_on` datetime DEFAULT NULL,
  `update_by` varchar(100) DEFAULT '',
  `delete_on` datetime DEFAULT NULL,
  `delete_by` varchar(100) DEFAULT '',
  `notes` varchar(300) DEFAULT NULL,
  `approved_by` varchar(100) DEFAULT '',
  `first_level_approver` varchar(100) DEFAULT '',
  `approved_date` date DEFAULT NULL,
  `workflow_id` int(11) DEFAULT NULL,
  `workflow_level` int(11) DEFAULT NULL,
  `no_of_levels` int(3) DEFAULT NULL,
  `code_entry_level` int(11) DEFAULT NULL,
  `approval_group_level` int(3) DEFAULT NULL,
  `po_number` varchar(100) DEFAULT NULL,
  `po_date` date DEFAULT NULL,
  `project_code_id` int(11) DEFAULT NULL,
  `task_code_id` int(11) DEFAULT NULL,
  `vendor_id` int(11) DEFAULT NULL,
  `delivery_date` date DEFAULT NULL,
  `shipping_address` varchar(255) DEFAULT NULL,
  `gross_amount` decimal(19,2) DEFAULT NULL,
  `discount_amount` decimal(19,2) DEFAULT NULL,
  `net_amount` decimal(19,2) DEFAULT NULL,
  `tax_amount` decimal(19,2) NOT NULL,
  `file_name` varchar(100) DEFAULT NULL,
  `file_type` varchar(20) DEFAULT NULL,
  `report_url` varchar(255) DEFAULT NULL,
  `poc_name` varchar(150) DEFAULT NULL,
  `poc_phone` varchar(20) DEFAULT NULL,
  `billing_address` varchar(255) DEFAULT NULL,
  `vendor_approval_status` char(1) DEFAULT NULL,
  `remaining_celing` decimal(19,2) DEFAULT NULL,
  `approval_user` varchar(100) DEFAULT NULL,
  `approval_group` varchar(100) DEFAULT NULL,
  `extended_approval_user` varchar(100) DEFAULT NULL,
  `automation_id` int(11) DEFAULT NULL,
  `deletion_status` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1_CODE` (`project_code_id`),
  KEY `FK2_CODE` (`task_code_id`),
  KEY `FK1_VENDOR_PO` (`vendor_id`),
  CONSTRAINT `FK1_CODE` FOREIGN KEY (`project_code_id`) REFERENCES `common_approval_code` (`id`),
  CONSTRAINT `FK2_CODE` FOREIGN KEY (`task_code_id`) REFERENCES `common_approval_code` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

/*!40000 ALTER TABLE `vp_po_mst` DISABLE KEYS */;
INSERT INTO `vp_po_mst` (`id`, `creator_name`, `created_by`, `created_on`, `status`, `update_on`, `update_by`, `delete_on`, `delete_by`, `notes`, `approved_by`, `first_level_approver`, `approved_date`, `workflow_id`, `workflow_level`, `no_of_levels`, `code_entry_level`, `approval_group_level`, `po_number`, `po_date`, `project_code_id`, `task_code_id`, `vendor_id`, `delivery_date`, `shipping_address`, `gross_amount`, `discount_amount`, `net_amount`, `tax_amount`, `file_name`, `file_type`, `report_url`, `poc_name`, `poc_phone`, `billing_address`, `vendor_approval_status`, `remaining_celing`, `approval_user`, `approval_group`, `extended_approval_user`, `automation_id`, `deletion_status`) VALUES
	(5, 'avishka perera', 'admin', '2021-03-06 12:37:28', 'A', NULL, NULL, NULL, NULL, NULL, 'admin', NULL, '2021-03-06', 3, 2, 2, NULL, NULL, 'PO0001', '2021-03-06', NULL, NULL, 1, '2021-03-06', 'Baltimore, MD', 187500.00, 0.00, 187500.00, 0.00, 'PURCHASE_ORDER_REPORT.pdf', 'application/pdf', 'VP_SYSTEM/Purchase_Order/13/2021-03-06/03-06-2021/admin/1615034349684_PURCHASE_ORDER_REPORT.pdf', 'Indraguptha', '756709395', 'Duino Inc\nNo 33 Weherakanda\nPitakotte\n60060', NULL, 187500.00, NULL, '5', NULL, NULL, NULL),
	(6, 'avishka perera', 'admin', '2021-03-06 13:16:59', 'A', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PO0002', '2021-03-06', NULL, NULL, 2, '2021-03-06', 'Baltimore, MD', 15000.00, 0.00, 15000.00, 0.00, 'PURCHASE_ORDER_REPORT.pdf', 'application/pdf', 'VP_SYSTEM/Purchase_Order/13/2021-03-06/03-06-2021/admin/1615036665810_PURCHASE_ORDER_REPORT.pdf', 'app50ven', '23232', 'Ladvo Computers (PVT) Ltd\r\nNo 33 Weherakanda\r\nPitakotte\r\n60060, , , .', NULL, 15000.00, NULL, NULL, NULL, NULL, NULL),
	(7, 'avishka perera', 'admin', '2021-03-06 14:19:48', 'A', NULL, NULL, NULL, NULL, NULL, 'admin', NULL, '2021-03-06', 4, 3, 3, NULL, NULL, 'PO0003', '2021-03-06', NULL, NULL, 1, '2021-03-06', 'Baltimore, MD', 30000.00, 0.00, 30000.00, 0.00, 'PURCHASE_ORDER_REPORT.pdf', 'application/pdf', 'VP_SYSTEM/Purchase_Order/13/2021-03-06/03-06-2021/admin/1615040413210_PURCHASE_ORDER_REPORT.pdf', 'Indraguptha', '756709395', 'Duino Inc\r\nNo 33 Weherakanda\r\nPitakotte\r\n60060, , , .', NULL, 30000.00, 'indragupthaekanayaka@gmail.com', NULL, NULL, NULL, NULL),
	(8, 'avishka perera', 'admin', '2021-03-06 14:29:37', 'R', '2021-03-06 14:30:08', 'admin', NULL, NULL, NULL, NULL, NULL, NULL, 5, 1, 1, NULL, NULL, 'PO0004', '2021-03-06', NULL, NULL, 2, '2021-03-06', 'Baltimore, MD', 12000.00, 0.00, 12000.00, 0.00, 'PURCHASE_ORDER_REPORT.pdf', 'application/pdf', 'VP_SYSTEM/Purchase_Order/13/2021-03-06/03-06-2021/admin/1615040977476_PURCHASE_ORDER_REPORT.pdf', 'app50ven', '23232', 'Ladvo Computers (PVT) Ltd\r\nNo 33 Weherakanda\r\nPitakotte\r\n60060, , , .', NULL, 12000.00, 'indragupthaekanayaka@gmail.com', '4', NULL, NULL, NULL),
	(9, 'avishka perera', 'admin', '2021-03-06 14:44:18', 'P', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 1, 2, NULL, NULL, 'PO0005', '2021-03-06', NULL, NULL, 1, '2021-03-06', 'Baltimore, MD', 161000.00, 0.00, 161000.00, 0.00, 'PURCHASE_ORDER_REPORT.pdf', 'application/pdf', 'VP_SYSTEM/Purchase_Order/13/2021-03-06/03-06-2021/admin/1615041866744_PURCHASE_ORDER_REPORT.pdf', 'Indraguptha', '756709395', 'Duino Inc\r\nNo 33 Weherakanda\r\nPitakotte\r\n60060, , , .', NULL, 161000.00, NULL, '4', NULL, NULL, NULL),
	(11, 'avishka perera', 'admin', '2021-03-06 14:48:08', 'A', NULL, NULL, NULL, NULL, NULL, 'admin', NULL, '2021-03-06', 7, 1, 1, NULL, NULL, 'PO0006', '2021-03-06', NULL, NULL, 2, '2021-03-06', 'Baltimore, MD', 1500000.00, 0.00, 1500000.00, 0.00, 'PURCHASE_ORDER_REPORT.pdf', 'application/pdf', 'VP_SYSTEM/Purchase_Order/13/2021-03-06/03-06-2021/admin/1615042110491_PURCHASE_ORDER_REPORT.pdf', 'app50ven', '23232', 'Ladvo Computers (PVT) Ltd\r\nNo 33 Weherakanda\r\nPitakotte\r\n60060, , , .', NULL, 1500000.00, NULL, '4', NULL, NULL, NULL);
/*!40000 ALTER TABLE `vp_po_mst` ENABLE KEYS */;

DROP TABLE IF EXISTS `vp_po_receipt_additional_data`;
CREATE TABLE IF NOT EXISTS `vp_po_receipt_additional_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field_value` varchar(300) DEFAULT NULL,
  `field_value_date` date DEFAULT NULL,
  `field_id` int(15) NOT NULL,
  `field_name` varchar(50) NOT NULL,
  `grn_mst_id` int(15) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_vp_grn_additional_data_vp_grn_mst` (`grn_mst_id`),
  CONSTRAINT `FK_vp_grn_additional_data_vp_grn_mst` FOREIGN KEY (`grn_mst_id`) REFERENCES `vp_po_receipt_mst` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*!40000 ALTER TABLE `vp_po_receipt_additional_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_po_receipt_additional_data` ENABLE KEYS */;

DROP TABLE IF EXISTS `vp_po_receipt_additional_field_attachment`;
CREATE TABLE IF NOT EXISTS `vp_po_receipt_additional_field_attachment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field_id` int(11) NOT NULL,
  `grn_mst_id` int(11) NOT NULL,
  `attachment_url` varchar(200) NOT NULL,
  `file_name` varchar(200) DEFAULT NULL,
  `file_type` varchar(100) DEFAULT NULL,
  `status` char(1) NOT NULL,
  `delete_by` varchar(100) DEFAULT '',
  `delete_on` datetime DEFAULT NULL,
  `field_name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Fk_grn_mst` (`grn_mst_id`),
  CONSTRAINT `Fk_grn_mst` FOREIGN KEY (`grn_mst_id`) REFERENCES `vp_po_receipt_mst` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*!40000 ALTER TABLE `vp_po_receipt_additional_field_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_po_receipt_additional_field_attachment` ENABLE KEYS */;

DROP TABLE IF EXISTS `vp_po_receipt_attachment`;
CREATE TABLE IF NOT EXISTS `vp_po_receipt_attachment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `grn_mst_id` int(11) NOT NULL,
  `attachment_url` varchar(200) NOT NULL,
  `file_name` varchar(200) DEFAULT NULL,
  `file_type` varchar(30) DEFAULT NULL,
  `status` char(1) NOT NULL DEFAULT 'A',
  `delete_by` varchar(100) DEFAULT '',
  `delete_on` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_vp_grn_attachment_vp_grn_mst` (`grn_mst_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*!40000 ALTER TABLE `vp_po_receipt_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_po_receipt_attachment` ENABLE KEYS */;

DROP TABLE IF EXISTS `vp_po_receipt_detail`;
CREATE TABLE IF NOT EXISTS `vp_po_receipt_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `received_qty` decimal(12,2) NOT NULL DEFAULT 0.00,
  `remaining_qty` decimal(12,2) DEFAULT NULL,
  `amount` decimal(19,2) NOT NULL DEFAULT 0.00,
  `grn_mst_id` int(11) NOT NULL,
  `po_detail_id` int(11) DEFAULT NULL,
  `item_number` varchar(20) NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  `qty` decimal(12,2) NOT NULL DEFAULT 0.00,
  `uom_id` int(11) DEFAULT NULL,
  `product_id` int(11) NOT NULL,
  `unit_price` decimal(19,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK__vp_grn_mst` (`grn_mst_id`),
  KEY `FK__vp_purchase_order_detail` (`po_detail_id`),
  CONSTRAINT `FK__vp_grn_mst` FOREIGN KEY (`grn_mst_id`) REFERENCES `vp_po_receipt_mst` (`id`),
  CONSTRAINT `FK__vp_purchase_order_detail` FOREIGN KEY (`po_detail_id`) REFERENCES `vp_po_detail` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*!40000 ALTER TABLE `vp_po_receipt_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_po_receipt_detail` ENABLE KEYS */;

DROP TABLE IF EXISTS `vp_po_receipt_mst`;
CREATE TABLE IF NOT EXISTS `vp_po_receipt_mst` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `grn_date` date NOT NULL,
  `grn_number` varchar(50) DEFAULT NULL,
  `vendor_id` int(11) NOT NULL,
  `po_id` int(11) NOT NULL,
  `transporter_name` varchar(50) DEFAULT NULL,
  `vehicle_number` varchar(15) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `file_name` varchar(35) DEFAULT NULL,
  `file_type` varchar(30) DEFAULT NULL,
  `report_url` varchar(255) DEFAULT NULL,
  `status` char(1) NOT NULL,
  `total_amount` decimal(19,2) NOT NULL,
  `created_by` varchar(100) NOT NULL,
  `created_on` datetime NOT NULL,
  `delete_by` varchar(100) DEFAULT '',
  `delete_on` datetime DEFAULT NULL,
  `update_by` varchar(100) DEFAULT '',
  `update_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1_VENDOR_GRN` (`vendor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*!40000 ALTER TABLE `vp_po_receipt_mst` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_po_receipt_mst` ENABLE KEYS */;

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*!40000 ALTER TABLE `vp_vendor_address` DISABLE KEYS */;
INSERT INTO `vp_vendor_address` (`id`, `address_line_1`, `address_line_2`, `type`, `city`, `country`, `address_state`, `vendor_mst_id`, `zipcode`) VALUES
	(1, 'No 33 Weherakanda', 'Pitakotte', 'PA', '', '', '', 1, '60060'),
	(2, 'No 33 Weherakanda', 'Pitakotte', 'PA', '', '', '', 2, '60060');
/*!40000 ALTER TABLE `vp_vendor_address` ENABLE KEYS */;

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
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=latin1;

/*!40000 ALTER TABLE `vp_vendor_import_issue` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_vendor_import_issue` ENABLE KEYS */;

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
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=latin1;

/*!40000 ALTER TABLE `vp_vendor_import_mst` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_vendor_import_mst` ENABLE KEYS */;

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

/*!40000 ALTER TABLE `vp_vendor_invitation` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_vendor_invitation` ENABLE KEYS */;

DROP TABLE IF EXISTS `vp_vendor_mst`;
CREATE TABLE IF NOT EXISTS `vp_vendor_mst` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(100) NOT NULL,
  `vendor_code` varchar(50) DEFAULT NULL,
  `user_id` varchar(100) DEFAULT '',
  `business_name` varchar(150) DEFAULT NULL,
  `email` varchar(150) NOT NULL,
  `cc_email` varchar(150) DEFAULT NULL,
  `contact_number` varchar(20) NOT NULL,
  `contact_person` varchar(150) NOT NULL,
  `date_created` datetime NOT NULL,
  `created_by` varchar(100) NOT NULL,
  `emp_id_no` varchar(20) DEFAULT NULL,
  `exempt_payee_code` varchar(40) DEFAULT NULL,
  `fatca_reporting_code` varchar(40) DEFAULT NULL,
  `fax` varchar(20) DEFAULT NULL,
  `name` varchar(150) DEFAULT NULL,
  `social_sec_no` varchar(15) DEFAULT NULL,
  `tax_class_otherdetail` varchar(300) DEFAULT NULL,
  `tax_classification` varchar(3) DEFAULT NULL,
  `tax_code` varchar(25) DEFAULT NULL,
  `w9_form_url` varchar(200) DEFAULT NULL,
  `status` char(1) NOT NULL DEFAULT '',
  `last_updated_on` datetime NOT NULL,
  `last_updated_by` varchar(100) NOT NULL,
  `sic_code` int(11) DEFAULT NULL,
  `naics_code` int(11) DEFAULT NULL,
  `business_description` text CHARACTER SET utf8 DEFAULT NULL,
  `web_url` varchar(300) CHARACTER SET utf8 DEFAULT NULL,
  `requested_tenant_id` varchar(50) DEFAULT NULL,
  `invitation_id` int(11) DEFAULT NULL,
  `community_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*!40000 ALTER TABLE `vp_vendor_mst` DISABLE KEYS */;
INSERT INTO `vp_vendor_mst` (`id`, `uuid`, `vendor_code`, `user_id`, `business_name`, `email`, `cc_email`, `contact_number`, `contact_person`, `date_created`, `created_by`, `emp_id_no`, `exempt_payee_code`, `fatca_reporting_code`, `fax`, `name`, `social_sec_no`, `tax_class_otherdetail`, `tax_classification`, `tax_code`, `w9_form_url`, `status`, `last_updated_on`, `last_updated_by`, `sic_code`, `naics_code`, `business_description`, `web_url`, `requested_tenant_id`, `invitation_id`, `community_id`) VALUES
	(1, 'indra', NULL, 'indragupthaekanayaka@gmail.com', 'Duino Inc', 'indragupthaekanayaka@gmail.com', 'bhagya.e@papertrl.com', '756709395', 'Indraguptha', '2020-12-11 12:18:37', 'admin', NULL, NULL, NULL, NULL, 'Duino Inc', '111111111', NULL, 'I', NULL, NULL, 'A', '2020-12-11 12:18:37', 'admin', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(2, 'indra1', NULL, 'indragupthaekanayaka@gmail.com', 'Ladvo Computers (PVT) Ltd', 'indragupthaekanayaka@gmail.com', 'bhagya.e@papertrl.com', '23232', 'app50ven', '2021-01-19 09:02:01', 'admin', NULL, NULL, NULL, NULL, 'Ladvo Computers (PVT) Ltd', '999999999', NULL, NULL, NULL, NULL, 'A', '2021-01-19 09:02:01', 'admin', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `vp_vendor_mst` ENABLE KEYS */;

DROP TABLE IF EXISTS `vp_vendor_w9_attachment`;
CREATE TABLE IF NOT EXISTS `vp_vendor_w9_attachment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vendor_id` int(11) NOT NULL,
  `w9_form_data` mediumblob NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=latin1;

/*!40000 ALTER TABLE `vp_vendor_w9_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_vendor_w9_attachment` ENABLE KEYS */;

DROP TABLE IF EXISTS `vp_vendor_w9_parameter`;
CREATE TABLE IF NOT EXISTS `vp_vendor_w9_parameter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `property_name` varchar(300) NOT NULL,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

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
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
