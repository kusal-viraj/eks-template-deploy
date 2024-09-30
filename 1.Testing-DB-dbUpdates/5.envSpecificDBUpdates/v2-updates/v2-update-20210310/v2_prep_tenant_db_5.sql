/*
Navicat MySQL Data Transfer

Source Server         : MARIA_DB_LOCAL
Source Server Version : 50505
Source Host           : 127.0.0.1:3307
Source Database       : v2_prep_tenant_db

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2021-03-10 19:44:04
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for ar_client_address
-- ----------------------------
DROP TABLE IF EXISTS `ar_client_address`;
CREATE TABLE `ar_client_address` (
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

-- ----------------------------
-- Records of ar_client_address
-- ----------------------------

-- ----------------------------
-- Table structure for ar_client_category
-- ----------------------------
DROP TABLE IF EXISTS `ar_client_category`;
CREATE TABLE `ar_client_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(70) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of ar_client_category
-- ----------------------------
INSERT INTO `ar_client_category` VALUES ('1', 'Commercial');
INSERT INTO `ar_client_category` VALUES ('2', 'Federal');
INSERT INTO `ar_client_category` VALUES ('3', 'J_Ventures');
INSERT INTO `ar_client_category` VALUES ('4', 'State');

-- ----------------------------
-- Table structure for ar_client_mst
-- ----------------------------
DROP TABLE IF EXISTS `ar_client_mst`;
CREATE TABLE `ar_client_mst` (
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

-- ----------------------------
-- Records of ar_client_mst
-- ----------------------------

-- ----------------------------
-- Table structure for ar_contract_type
-- ----------------------------
DROP TABLE IF EXISTS `ar_contract_type`;
CREATE TABLE `ar_contract_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of ar_contract_type
-- ----------------------------
INSERT INTO `ar_contract_type` VALUES ('1', 'Fixed Price', 'A');
INSERT INTO `ar_contract_type` VALUES ('2', 'IDIQ', 'A');
INSERT INTO `ar_contract_type` VALUES ('3', 'Cost Reimbursement', 'A');
INSERT INTO `ar_contract_type` VALUES ('4', 'Incentive', 'A');
INSERT INTO `ar_contract_type` VALUES ('5', 'Time and Materials', 'A');
INSERT INTO `ar_contract_type` VALUES ('6', 'Labor-Hour', 'A');
INSERT INTO `ar_contract_type` VALUES ('7', 'Sealed Bidding', 'A');
INSERT INTO `ar_contract_type` VALUES ('8', 'Negotiation', 'A');
INSERT INTO `ar_contract_type` VALUES ('9', 'Reverse Auction', 'A');
INSERT INTO `ar_contract_type` VALUES ('10', 'Sole Source', 'A');

-- ----------------------------
-- Table structure for ar_division
-- ----------------------------
DROP TABLE IF EXISTS `ar_division`;
CREATE TABLE `ar_division` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `product_line_id` int(11) NOT NULL,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1_PRODUCT_LINE` (`product_line_id`),
  CONSTRAINT `FK1_PRODUCT_LINE` FOREIGN KEY (`product_line_id`) REFERENCES `ar_product_line` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of ar_division
-- ----------------------------
INSERT INTO `ar_division` VALUES ('1', 'Construction', '1', 'A');
INSERT INTO `ar_division` VALUES ('2', 'Facilities', '1', 'A');
INSERT INTO `ar_division` VALUES ('3', 'Environmental', '2', 'A');
INSERT INTO `ar_division` VALUES ('4', 'Industrial Hygiene', '2', 'A');
INSERT INTO `ar_division` VALUES ('5', 'Radiological', '2', 'A');
INSERT INTO `ar_division` VALUES ('6', 'Drilling', '2', 'A');

-- ----------------------------
-- Table structure for ar_oppartunity_project_location_info
-- ----------------------------
DROP TABLE IF EXISTS `ar_oppartunity_project_location_info`;
CREATE TABLE `ar_oppartunity_project_location_info` (
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

-- ----------------------------
-- Records of ar_oppartunity_project_location_info
-- ----------------------------

-- ----------------------------
-- Table structure for ar_opportunity
-- ----------------------------
DROP TABLE IF EXISTS `ar_opportunity`;
CREATE TABLE `ar_opportunity` (
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

-- ----------------------------
-- Records of ar_opportunity
-- ----------------------------

-- ----------------------------
-- Table structure for ar_opportunity_additional_data
-- ----------------------------
DROP TABLE IF EXISTS `ar_opportunity_additional_data`;
CREATE TABLE `ar_opportunity_additional_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field_value` varchar(200) DEFAULT NULL,
  `field_id` int(15) NOT NULL,
  `field_name` varchar(50) NOT NULL,
  `opportunity_mst_id` int(15) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK__ar_opportunity` (`opportunity_mst_id`),
  CONSTRAINT `FK__ar_opportunity` FOREIGN KEY (`opportunity_mst_id`) REFERENCES `ar_opportunity` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of ar_opportunity_additional_data
-- ----------------------------

-- ----------------------------
-- Table structure for ar_opportunity_attachment
-- ----------------------------
DROP TABLE IF EXISTS `ar_opportunity_attachment`;
CREATE TABLE `ar_opportunity_attachment` (
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

-- ----------------------------
-- Records of ar_opportunity_attachment
-- ----------------------------

-- ----------------------------
-- Table structure for ar_opportunity_audit_trial
-- ----------------------------
DROP TABLE IF EXISTS `ar_opportunity_audit_trial`;
CREATE TABLE `ar_opportunity_audit_trial` (
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

-- ----------------------------
-- Records of ar_opportunity_audit_trial
-- ----------------------------

-- ----------------------------
-- Table structure for ar_opportunity_internal_info
-- ----------------------------
DROP TABLE IF EXISTS `ar_opportunity_internal_info`;
CREATE TABLE `ar_opportunity_internal_info` (
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

-- ----------------------------
-- Records of ar_opportunity_internal_info
-- ----------------------------

-- ----------------------------
-- Table structure for ar_opportunity_size_standard_info
-- ----------------------------
DROP TABLE IF EXISTS `ar_opportunity_size_standard_info`;
CREATE TABLE `ar_opportunity_size_standard_info` (
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

-- ----------------------------
-- Records of ar_opportunity_size_standard_info
-- ----------------------------

-- ----------------------------
-- Table structure for ar_opportunity_source
-- ----------------------------
DROP TABLE IF EXISTS `ar_opportunity_source`;
CREATE TABLE `ar_opportunity_source` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of ar_opportunity_source
-- ----------------------------
INSERT INTO `ar_opportunity_source` VALUES ('1', 'FBO', 'A');
INSERT INTO `ar_opportunity_source` VALUES ('2', 'GovWin', 'A');

-- ----------------------------
-- Table structure for ar_opportunity_type
-- ----------------------------
DROP TABLE IF EXISTS `ar_opportunity_type`;
CREATE TABLE `ar_opportunity_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of ar_opportunity_type
-- ----------------------------
INSERT INTO `ar_opportunity_type` VALUES ('1', 'Solicitation', 'A');
INSERT INTO `ar_opportunity_type` VALUES ('2', 'Sources Sought', 'A');
INSERT INTO `ar_opportunity_type` VALUES ('3', 'Pre-solicitation', 'A');

-- ----------------------------
-- Table structure for ar_partnership_type
-- ----------------------------
DROP TABLE IF EXISTS `ar_partnership_type`;
CREATE TABLE `ar_partnership_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of ar_partnership_type
-- ----------------------------
INSERT INTO `ar_partnership_type` VALUES ('1', 'Tidewater', 'A');
INSERT INTO `ar_partnership_type` VALUES ('2', 'Joint Venture', 'A');
INSERT INTO `ar_partnership_type` VALUES ('3', 'Teaming ', 'A');

-- ----------------------------
-- Table structure for ar_product_line
-- ----------------------------
DROP TABLE IF EXISTS `ar_product_line`;
CREATE TABLE `ar_product_line` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of ar_product_line
-- ----------------------------
INSERT INTO `ar_product_line` VALUES ('1', 'Infrastructure', 'A');
INSERT INTO `ar_product_line` VALUES ('2', 'Environmental', 'A');

-- ----------------------------
-- Table structure for ar_project
-- ----------------------------
DROP TABLE IF EXISTS `ar_project`;
CREATE TABLE `ar_project` (
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

-- ----------------------------
-- Records of ar_project
-- ----------------------------

-- ----------------------------
-- Table structure for ar_project_additional_data
-- ----------------------------
DROP TABLE IF EXISTS `ar_project_additional_data`;
CREATE TABLE `ar_project_additional_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field_value` varchar(200) DEFAULT NULL,
  `field_id` int(15) NOT NULL,
  `field_name` varchar(50) NOT NULL,
  `project_mst_id` int(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of ar_project_additional_data
-- ----------------------------

-- ----------------------------
-- Table structure for ar_project_attachment
-- ----------------------------
DROP TABLE IF EXISTS `ar_project_attachment`;
CREATE TABLE `ar_project_attachment` (
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

-- ----------------------------
-- Records of ar_project_attachment
-- ----------------------------

-- ----------------------------
-- Table structure for ar_project_audit_trial
-- ----------------------------
DROP TABLE IF EXISTS `ar_project_audit_trial`;
CREATE TABLE `ar_project_audit_trial` (
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

-- ----------------------------
-- Records of ar_project_audit_trial
-- ----------------------------

-- ----------------------------
-- Table structure for ar_project_employee_information
-- ----------------------------
DROP TABLE IF EXISTS `ar_project_employee_information`;
CREATE TABLE `ar_project_employee_information` (
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

-- ----------------------------
-- Records of ar_project_employee_information
-- ----------------------------

-- ----------------------------
-- Table structure for ar_project_partnership_detail
-- ----------------------------
DROP TABLE IF EXISTS `ar_project_partnership_detail`;
CREATE TABLE `ar_project_partnership_detail` (
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

-- ----------------------------
-- Records of ar_project_partnership_detail
-- ----------------------------

-- ----------------------------
-- Table structure for ar_project_subcontractor_info
-- ----------------------------
DROP TABLE IF EXISTS `ar_project_subcontractor_info`;
CREATE TABLE `ar_project_subcontractor_info` (
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

-- ----------------------------
-- Records of ar_project_subcontractor_info
-- ----------------------------

-- ----------------------------
-- Table structure for ar_proposal
-- ----------------------------
DROP TABLE IF EXISTS `ar_proposal`;
CREATE TABLE `ar_proposal` (
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

-- ----------------------------
-- Records of ar_proposal
-- ----------------------------

-- ----------------------------
-- Table structure for ar_proposal_additional_data
-- ----------------------------
DROP TABLE IF EXISTS `ar_proposal_additional_data`;
CREATE TABLE `ar_proposal_additional_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field_value` varchar(200) DEFAULT NULL,
  `field_id` int(15) NOT NULL,
  `field_name` varchar(50) NOT NULL,
  `proposal_mst_id` int(15) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK__ar_proposal` (`proposal_mst_id`),
  CONSTRAINT `FK__ar_proposal` FOREIGN KEY (`proposal_mst_id`) REFERENCES `ar_proposal` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of ar_proposal_additional_data
-- ----------------------------

-- ----------------------------
-- Table structure for ar_proposal_attachment
-- ----------------------------
DROP TABLE IF EXISTS `ar_proposal_attachment`;
CREATE TABLE `ar_proposal_attachment` (
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

-- ----------------------------
-- Records of ar_proposal_attachment
-- ----------------------------

-- ----------------------------
-- Table structure for ar_proposal_audit_trial
-- ----------------------------
DROP TABLE IF EXISTS `ar_proposal_audit_trial`;
CREATE TABLE `ar_proposal_audit_trial` (
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

-- ----------------------------
-- Records of ar_proposal_audit_trial
-- ----------------------------

-- ----------------------------
-- Table structure for ar_proposal_employee_information
-- ----------------------------
DROP TABLE IF EXISTS `ar_proposal_employee_information`;
CREATE TABLE `ar_proposal_employee_information` (
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

-- ----------------------------
-- Records of ar_proposal_employee_information
-- ----------------------------

-- ----------------------------
-- Table structure for ar_set_aside
-- ----------------------------
DROP TABLE IF EXISTS `ar_set_aside`;
CREATE TABLE `ar_set_aside` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of ar_set_aside
-- ----------------------------
INSERT INTO `ar_set_aside` VALUES ('1', 'Competitive 8(a)', 'A');
INSERT INTO `ar_set_aside` VALUES ('2', 'Small Business', 'A');
INSERT INTO `ar_set_aside` VALUES ('3', 'Total Small Business', 'A');
INSERT INTO `ar_set_aside` VALUES ('4', 'Veteran Owned Small Business', 'A');
INSERT INTO `ar_set_aside` VALUES ('5', 'Service Disabled Veteran Owned Small Business', 'A');
INSERT INTO `ar_set_aside` VALUES ('6', 'Woman Owned Small Business', 'A');
INSERT INTO `ar_set_aside` VALUES ('7', 'Partial HBCU', 'A');
INSERT INTO `ar_set_aside` VALUES ('8', 'Total HBCU', 'A');
INSERT INTO `ar_set_aside` VALUES ('9', 'HUBZone', 'A');

-- ----------------------------
-- Table structure for ar_type_of_location
-- ----------------------------
DROP TABLE IF EXISTS `ar_type_of_location`;
CREATE TABLE `ar_type_of_location` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of ar_type_of_location
-- ----------------------------
INSERT INTO `ar_type_of_location` VALUES ('1', 'Civilian', 'A');
INSERT INTO `ar_type_of_location` VALUES ('2', 'Military', 'A');
INSERT INTO `ar_type_of_location` VALUES ('3', 'Medical', 'A');
INSERT INTO `ar_type_of_location` VALUES ('4', 'National Park', 'A');
INSERT INTO `ar_type_of_location` VALUES ('5', 'Commercial', 'A');
INSERT INTO `ar_type_of_location` VALUES ('6', 'Residential', 'A');
INSERT INTO `ar_type_of_location` VALUES ('7', 'Religious', 'A');
INSERT INTO `ar_type_of_location` VALUES ('8', 'Agricultural', 'A');
INSERT INTO `ar_type_of_location` VALUES ('9', 'School', 'A');
INSERT INTO `ar_type_of_location` VALUES ('10', 'University', 'A');
INSERT INTO `ar_type_of_location` VALUES ('11', 'Government', 'A');
INSERT INTO `ar_type_of_location` VALUES ('12', 'Industrial', 'A');
INSERT INTO `ar_type_of_location` VALUES ('13', 'Parking and Storage', 'A');
INSERT INTO `ar_type_of_location` VALUES ('14', 'Transportation', 'A');
INSERT INTO `ar_type_of_location` VALUES ('15', 'Infrastructure', 'A');
INSERT INTO `ar_type_of_location` VALUES ('16', 'Power', 'A');
INSERT INTO `ar_type_of_location` VALUES ('17', 'Information Technology', 'A');
INSERT INTO `ar_type_of_location` VALUES ('18', 'Sports', 'A');
INSERT INTO `ar_type_of_location` VALUES ('19', 'Parks', 'A');
INSERT INTO `ar_type_of_location` VALUES ('20', 'Fuel', 'A');
INSERT INTO `ar_type_of_location` VALUES ('21', 'Historic', 'A');
INSERT INTO `ar_type_of_location` VALUES ('22', 'Monument', 'A');
INSERT INTO `ar_type_of_location` VALUES ('23', 'Secure Facility', 'A');
INSERT INTO `ar_type_of_location` VALUES ('24', 'Water Body', 'A');
INSERT INTO `ar_type_of_location` VALUES ('25', 'Forest', 'A');
INSERT INTO `ar_type_of_location` VALUES ('26', 'Dessert', 'A');
INSERT INTO `ar_type_of_location` VALUES ('27', 'Extreme Weather', 'A');
INSERT INTO `ar_type_of_location` VALUES ('28', 'Wetlands', 'A');
INSERT INTO `ar_type_of_location` VALUES ('29', 'High Elevation', 'A');
INSERT INTO `ar_type_of_location` VALUES ('30', 'Coastal', 'A');
INSERT INTO `ar_type_of_location` VALUES ('31', 'Inland', 'A');
INSERT INTO `ar_type_of_location` VALUES ('32', 'Laboratory', 'A');

-- ----------------------------
-- Table structure for ar_type_of_work
-- ----------------------------
DROP TABLE IF EXISTS `ar_type_of_work`;
CREATE TABLE `ar_type_of_work` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `status` char(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of ar_type_of_work
-- ----------------------------
INSERT INTO `ar_type_of_work` VALUES ('1', 'Elevator Installers and Repairers', 'A');
INSERT INTO `ar_type_of_work` VALUES ('2', 'Boilermakers', 'A');
INSERT INTO `ar_type_of_work` VALUES ('3', 'Construction Equipment Operators', 'A');

-- ----------------------------
-- Table structure for common_account_number
-- ----------------------------
DROP TABLE IF EXISTS `common_account_number`;
CREATE TABLE `common_account_number` (
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

-- ----------------------------
-- Records of common_account_number
-- ----------------------------

-- ----------------------------
-- Table structure for common_account_number_import
-- ----------------------------
DROP TABLE IF EXISTS `common_account_number_import`;
CREATE TABLE `common_account_number_import` (
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

-- ----------------------------
-- Records of common_account_number_import
-- ----------------------------

-- ----------------------------
-- Table structure for common_account_number_import_issue
-- ----------------------------
DROP TABLE IF EXISTS `common_account_number_import_issue`;
CREATE TABLE `common_account_number_import_issue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `import_mst_id` int(11) NOT NULL,
  `recode` text DEFAULT NULL,
  `description` varchar(256) DEFAULT NULL,
  `line_no` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK__common_chart_of_account_import_mst` (`import_mst_id`),
  CONSTRAINT `FK__common_chart_of_account_import_mst` FOREIGN KEY (`import_mst_id`) REFERENCES `common_account_number_import` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of common_account_number_import_issue
-- ----------------------------

-- ----------------------------
-- Table structure for common_account_sub_type
-- ----------------------------
DROP TABLE IF EXISTS `common_account_sub_type`;
CREATE TABLE `common_account_sub_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_type` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `short_code` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_ACCOUNT_TYPE` (`account_type`),
  CONSTRAINT `FK_ACCOUNT_TYPE` FOREIGN KEY (`account_type`) REFERENCES `common_account_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=149 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of common_account_sub_type
-- ----------------------------
INSERT INTO `common_account_sub_type` VALUES ('1', '1', 'Accounts Receivable (A/R)', 'AccountsReceivable');
INSERT INTO `common_account_sub_type` VALUES ('2', '2', 'Allowance for Bad Debts', 'AllowanceForBadDebts');
INSERT INTO `common_account_sub_type` VALUES ('3', '2', 'Development Costs', 'DevelopmentCosts');
INSERT INTO `common_account_sub_type` VALUES ('4', '2', 'Employee Cash Advances', 'EmployeeCashAdvances');
INSERT INTO `common_account_sub_type` VALUES ('5', '2', 'Inventory', 'Inventory');
INSERT INTO `common_account_sub_type` VALUES ('6', '2', 'Investment - Mortgage/Real Estate Loans', 'Investment_MortgageRealEstateLoans');
INSERT INTO `common_account_sub_type` VALUES ('7', '2', 'Investment - Tax-Exempt Securities', 'Investment_TaxExemptSecurities');
INSERT INTO `common_account_sub_type` VALUES ('8', '2', 'Investment - U.S. Government Obligations', 'Investment_USGovernmentObligations');
INSERT INTO `common_account_sub_type` VALUES ('9', '2', 'Investments - Other', 'Investments_Other');
INSERT INTO `common_account_sub_type` VALUES ('10', '2', 'Loans To Officers', 'LoansToOfficers');
INSERT INTO `common_account_sub_type` VALUES ('11', '2', 'Loans to Others', 'LoansToOthers');
INSERT INTO `common_account_sub_type` VALUES ('12', '2', 'Loans to Stockholders', 'LoansToStockholders');
INSERT INTO `common_account_sub_type` VALUES ('13', '2', 'Other Current Assets', 'OtherCurrentAssets');
INSERT INTO `common_account_sub_type` VALUES ('14', '2', 'Prepaid Expenses', 'PrepaidExpenses');
INSERT INTO `common_account_sub_type` VALUES ('15', '2', 'Retainage', 'Retainage');
INSERT INTO `common_account_sub_type` VALUES ('16', '2', 'Undeposited Funds', 'UndepositedFunds');
INSERT INTO `common_account_sub_type` VALUES ('17', '3', 'Cash on hand', 'CashOnHand');
INSERT INTO `common_account_sub_type` VALUES ('18', '3', 'Checking', 'Checking');
INSERT INTO `common_account_sub_type` VALUES ('19', '3', 'Money Market', 'MoneyMarket');
INSERT INTO `common_account_sub_type` VALUES ('20', '3', 'Rents Held in Trust', 'RentsHeldInTrust');
INSERT INTO `common_account_sub_type` VALUES ('21', '3', 'Savings', 'Savings');
INSERT INTO `common_account_sub_type` VALUES ('22', '3', 'Trust account', 'TrustAccount');
INSERT INTO `common_account_sub_type` VALUES ('23', '4', 'Accumulated Amortization', 'AccumulatedAmortization');
INSERT INTO `common_account_sub_type` VALUES ('24', '4', 'Accumulated Depletion', 'AccumulatedDepletion');
INSERT INTO `common_account_sub_type` VALUES ('25', '4', 'Accumulated Depreciation', 'AccumulatedDepreciation');
INSERT INTO `common_account_sub_type` VALUES ('26', '4', 'Buildings', 'Buildings');
INSERT INTO `common_account_sub_type` VALUES ('27', '4', 'Depletable Assets', 'DepletableAssets');
INSERT INTO `common_account_sub_type` VALUES ('28', '4', 'Fixed Asset Computers', 'FixedAssetComputers');
INSERT INTO `common_account_sub_type` VALUES ('29', '4', 'Fixed Asset Copiers', 'FixedAssetCopiers');
INSERT INTO `common_account_sub_type` VALUES ('30', '4', 'Fixed Asset Furniture', 'FixedAssetFurniture');
INSERT INTO `common_account_sub_type` VALUES ('31', '4', 'Fixed Asset Other Tools Equipment', 'FixedAssetOtherToolsEquipment');
INSERT INTO `common_account_sub_type` VALUES ('32', '4', 'Fixed Asset Phone', 'FixedAssetPhone');
INSERT INTO `common_account_sub_type` VALUES ('33', '4', 'Fixed Asset Photo Video', 'FixedAssetPhotoVideo');
INSERT INTO `common_account_sub_type` VALUES ('34', '4', 'Fixed Asset Software', 'FixedAssetSoftware');
INSERT INTO `common_account_sub_type` VALUES ('35', '4', 'Furniture & Fixtures', 'FurnitureAndFixtures');
INSERT INTO `common_account_sub_type` VALUES ('36', '4', 'Intangible Assets', 'IntangibleAssets');
INSERT INTO `common_account_sub_type` VALUES ('37', '4', 'Land', 'Land');
INSERT INTO `common_account_sub_type` VALUES ('38', '4', 'Leasehold Improvements', 'LeaseholdImprovements');
INSERT INTO `common_account_sub_type` VALUES ('39', '4', 'Machinery & Equipment', 'MachineryAndEquipment');
INSERT INTO `common_account_sub_type` VALUES ('40', '4', 'Other fixed assets', 'OtherFixedAssets');
INSERT INTO `common_account_sub_type` VALUES ('41', '4', 'Vehicles', 'Vehicles');
INSERT INTO `common_account_sub_type` VALUES ('42', '5', 'Accumulated Amortization of Other Assets', 'AccumulatedAmortizationOfOtherAssets');
INSERT INTO `common_account_sub_type` VALUES ('43', '5', 'Goodwill', 'Goodwill');
INSERT INTO `common_account_sub_type` VALUES ('44', '5', 'Lease Buyout', 'LeaseBuyout');
INSERT INTO `common_account_sub_type` VALUES ('45', '5', 'Licenses', 'Licenses');
INSERT INTO `common_account_sub_type` VALUES ('46', '5', 'Organizational Costs', 'OrganizationalCosts');
INSERT INTO `common_account_sub_type` VALUES ('47', '5', 'Other Long-term Assets', 'OtherLong_termAssets');
INSERT INTO `common_account_sub_type` VALUES ('48', '5', 'Security Deposits', 'SecurityDeposits');
INSERT INTO `common_account_sub_type` VALUES ('49', '6', 'Accounts Payable (A/P)', 'AccountsPayable');
INSERT INTO `common_account_sub_type` VALUES ('50', '7', 'Credit Card', 'CreditCard');
INSERT INTO `common_account_sub_type` VALUES ('51', '8', 'Federal Income Tax Payable', 'FederalIncomeTaxPayable');
INSERT INTO `common_account_sub_type` VALUES ('52', '8', 'Insurance Payable', 'InsurancePayable');
INSERT INTO `common_account_sub_type` VALUES ('53', '8', 'Line of Credit', 'LineOfCredit');
INSERT INTO `common_account_sub_type` VALUES ('54', '8', 'Loan Payable', 'LoanPayable');
INSERT INTO `common_account_sub_type` VALUES ('55', '8', 'Other Current Liabilities', 'OtherCurrentLiabilities');
INSERT INTO `common_account_sub_type` VALUES ('56', '8', 'Payroll Clearing', 'PayrollClearing');
INSERT INTO `common_account_sub_type` VALUES ('57', '8', 'Payroll Tax Payable', 'PayrollTaxPayable');
INSERT INTO `common_account_sub_type` VALUES ('58', '8', 'Prepaid Expenses Payable', 'PrepaidExpensesPayable');
INSERT INTO `common_account_sub_type` VALUES ('59', '8', 'Rents in trust - Liability', 'RentsInTrust_Liability');
INSERT INTO `common_account_sub_type` VALUES ('60', '8', 'Sales Tax Payable', 'SalesTaxPayable');
INSERT INTO `common_account_sub_type` VALUES ('61', '8', 'State/Local Income Tax Payable', 'StateLocalIncomeTaxPayable');
INSERT INTO `common_account_sub_type` VALUES ('62', '8', 'Trust Accounts - Liabilities', 'Trust Accounts _Liabilities');
INSERT INTO `common_account_sub_type` VALUES ('63', '8', 'Undistributed Tips', 'UndistributedTips');
INSERT INTO `common_account_sub_type` VALUES ('64', '9', 'Notes Payable', 'NotesPayable');
INSERT INTO `common_account_sub_type` VALUES ('65', '9', 'Other Long Term Liabilities', 'OtherLongTermLiabilities');
INSERT INTO `common_account_sub_type` VALUES ('66', '9', 'Shareholder Notes Payable', 'ShareholderNotesPayable');
INSERT INTO `common_account_sub_type` VALUES ('67', '10', 'Accumulated Adjustment', 'AccumulatedAdjustment');
INSERT INTO `common_account_sub_type` VALUES ('68', '10', 'Common Stock', 'CommonStock');
INSERT INTO `common_account_sub_type` VALUES ('69', '10', 'Estimated Taxes', 'EstimatedTaxes');
INSERT INTO `common_account_sub_type` VALUES ('70', '10', 'Healthcare', 'Healthcare');
INSERT INTO `common_account_sub_type` VALUES ('71', '10', 'Opening Balance Equity', 'OpeningBalanceEquity');
INSERT INTO `common_account_sub_type` VALUES ('72', '10', 'Owner\'s Equity', 'OwnersEquity');
INSERT INTO `common_account_sub_type` VALUES ('73', '10', 'Paid-In Capital or Surplus', 'Paid_InCapitalOrSurplus');
INSERT INTO `common_account_sub_type` VALUES ('74', '10', 'Partner Contributions', 'PartnerContributions');
INSERT INTO `common_account_sub_type` VALUES ('75', '10', 'Partner\'s Equity', 'PartnersEquity');
INSERT INTO `common_account_sub_type` VALUES ('76', '10', 'Personal Expense', 'PersonalExpense');
INSERT INTO `common_account_sub_type` VALUES ('77', '10', 'Personal Income', 'PersonalIncome');
INSERT INTO `common_account_sub_type` VALUES ('78', '10', 'Preferred Stock', 'PreferredStock');
INSERT INTO `common_account_sub_type` VALUES ('79', '10', 'Retained Earnings', 'RetainedEarnings');
INSERT INTO `common_account_sub_type` VALUES ('80', '10', 'Treasury Stock', 'TreasuryStock');
INSERT INTO `common_account_sub_type` VALUES ('81', '11', 'Discounts/Refunds Given', 'DiscountsRefundsGiven');
INSERT INTO `common_account_sub_type` VALUES ('82', '11', 'Non-Profit Income', 'Non_ProfitIncome');
INSERT INTO `common_account_sub_type` VALUES ('83', '11', 'Other Primary Income', 'OtherPrimaryIncome');
INSERT INTO `common_account_sub_type` VALUES ('84', '11', 'Sales of Product Income', 'SalesOfProductIncome');
INSERT INTO `common_account_sub_type` VALUES ('85', '11', 'Service/Fee Income', 'ServiceFeeIncome');
INSERT INTO `common_account_sub_type` VALUES ('86', '11', 'Unapplied Cash Payment Income', 'UnappliedCashPaymentIncome');
INSERT INTO `common_account_sub_type` VALUES ('87', '12', 'Dividend Income', 'DividendIncome');
INSERT INTO `common_account_sub_type` VALUES ('88', '12', 'Interest Earned', 'InterestEarned');
INSERT INTO `common_account_sub_type` VALUES ('89', '12', 'Other Investment Income', 'OtherInvestmentIncome');
INSERT INTO `common_account_sub_type` VALUES ('90', '12', 'Other Miscellaneous Income', 'OtherMiscellaneousIncome');
INSERT INTO `common_account_sub_type` VALUES ('91', '12', 'Tax-Exempt Interest', 'Tax_ExemptInterest');
INSERT INTO `common_account_sub_type` VALUES ('92', '13', 'Cost of labor - COS', 'CostOfLaborCos');
INSERT INTO `common_account_sub_type` VALUES ('93', '13', 'Equipment Rental - COS', 'EquipmentRental_COS');
INSERT INTO `common_account_sub_type` VALUES ('94', '13', 'Other Costs of Services - COS', 'OtherCostsOfServiceCos');
INSERT INTO `common_account_sub_type` VALUES ('95', '13', 'Shipping, Freight & Delivery - COS', 'ShippingFreightDeliveryCos');
INSERT INTO `common_account_sub_type` VALUES ('96', '13', 'Supplies & Materials - COGS', 'SuppliesMaterialsCogs');
INSERT INTO `common_account_sub_type` VALUES ('97', '14', 'Advertising/Promotional', 'AdvertisingPromotional');
INSERT INTO `common_account_sub_type` VALUES ('98', '14', 'Auto', 'Auto');
INSERT INTO `common_account_sub_type` VALUES ('99', '14', 'Bad Debts', 'BadDebts');
INSERT INTO `common_account_sub_type` VALUES ('100', '14', 'Bank Charges', 'BankCharges');
INSERT INTO `common_account_sub_type` VALUES ('101', '14', 'Charitable Contributions', 'CharitableContributions');
INSERT INTO `common_account_sub_type` VALUES ('102', '14', 'Cost of Labor', 'CostOfLabor');
INSERT INTO `common_account_sub_type` VALUES ('103', '14', 'Dues & subscriptions', 'DuesSubscriptions');
INSERT INTO `common_account_sub_type` VALUES ('104', '14', 'Entertainment', 'Entertainment');
INSERT INTO `common_account_sub_type` VALUES ('105', '14', 'Entertainment Meals', 'EntertainmentMeals');
INSERT INTO `common_account_sub_type` VALUES ('106', '14', 'Equipment Rental', 'EquipmentRental');
INSERT INTO `common_account_sub_type` VALUES ('107', '14', 'Finance costs', 'FinanceCosts');
INSERT INTO `common_account_sub_type` VALUES ('108', '14', 'Insurance', 'Insurance');
INSERT INTO `common_account_sub_type` VALUES ('109', '14', 'Interest Paid', 'InterestPaid');
INSERT INTO `common_account_sub_type` VALUES ('110', '14', 'Legal & Professional Fees', 'LegalProfessionalFees');
INSERT INTO `common_account_sub_type` VALUES ('111', '14', 'Office/General Administrative Expenses', 'OfficeGeneralAdministrativeExpenses');
INSERT INTO `common_account_sub_type` VALUES ('112', '14', 'Other Business Expenses', 'OtherBusinessExpenses');
INSERT INTO `common_account_sub_type` VALUES ('113', '14', 'Other Miscellaneous Service Cost', 'OtherMiscellaneousServiceCost');
INSERT INTO `common_account_sub_type` VALUES ('114', '14', 'Payroll Expenses', 'PayrollExpenses');
INSERT INTO `common_account_sub_type` VALUES ('115', '14', 'Promotional Meals', 'PromotionalMeals');
INSERT INTO `common_account_sub_type` VALUES ('116', '14', 'Rent or Lease of Buildings', 'RentOrLeaseOfBuildings');
INSERT INTO `common_account_sub_type` VALUES ('117', '14', 'Repair & Maintenance', 'RepairMaintenance');
INSERT INTO `common_account_sub_type` VALUES ('118', '14', 'Shipping, Freight & Delivery', 'ShippingFreightAndDelivery');
INSERT INTO `common_account_sub_type` VALUES ('119', '14', 'Supplies & Materials', 'SuppliesMaterials');
INSERT INTO `common_account_sub_type` VALUES ('120', '14', 'Taxes Paid', 'TaxesPaid');
INSERT INTO `common_account_sub_type` VALUES ('121', '14', 'Travel', 'Travel');
INSERT INTO `common_account_sub_type` VALUES ('122', '14', 'Travel Meals', 'TravelMeals');
INSERT INTO `common_account_sub_type` VALUES ('123', '14', 'Unapplied Cash Bill Payment Expense', 'UnappliedCashBillPaymentExpense');
INSERT INTO `common_account_sub_type` VALUES ('124', '14', 'Utilities', 'Utilities');
INSERT INTO `common_account_sub_type` VALUES ('125', '15', 'Amortization', 'Amortization');
INSERT INTO `common_account_sub_type` VALUES ('126', '15', 'Depreciation', 'Depreciation');
INSERT INTO `common_account_sub_type` VALUES ('127', '15', 'Exchange Gain or Loss', 'ExchangeGainOrLoss');
INSERT INTO `common_account_sub_type` VALUES ('128', '15', 'Gas And Fuel', 'GasAndFuel');
INSERT INTO `common_account_sub_type` VALUES ('129', '15', 'Home Office', 'HomeOffice');
INSERT INTO `common_account_sub_type` VALUES ('130', '15', 'Homeowner Rental Insurance', 'HomeownerRentalInsurance');
INSERT INTO `common_account_sub_type` VALUES ('131', '15', 'Mortgage Interest Home Office', 'MortgageInterestHomeOffice');
INSERT INTO `common_account_sub_type` VALUES ('132', '15', 'Other Home Office Expenses', 'OtherHomeOfficeExpenses');
INSERT INTO `common_account_sub_type` VALUES ('133', '15', 'Other Miscellaneous Expense', 'OtherMiscellaneousExpense');
INSERT INTO `common_account_sub_type` VALUES ('134', '15', 'Other Vehicle Expenses', 'OtherVehicleExpenses');
INSERT INTO `common_account_sub_type` VALUES ('135', '15', 'Parking and Tolls', 'ParkingAndTolls');
INSERT INTO `common_account_sub_type` VALUES ('136', '15', 'Penalties & Settlements', 'PenaltiesSettlements');
INSERT INTO `common_account_sub_type` VALUES ('137', '15', 'Rent and Lease Home Office', 'RentAndLeaseHomeOffice');
INSERT INTO `common_account_sub_type` VALUES ('138', '15', 'Repairs and Maintenance Home Office', 'RepairsAndMaintenanceHomeOffice');
INSERT INTO `common_account_sub_type` VALUES ('139', '15', 'Utilities Home Office', 'UtilitiesHomeOffice');
INSERT INTO `common_account_sub_type` VALUES ('140', '15', 'Vehicle', 'Vehicle');
INSERT INTO `common_account_sub_type` VALUES ('141', '15', 'Vehicle Insurance', 'VehicleInsurance');
INSERT INTO `common_account_sub_type` VALUES ('142', '15', 'Vehicle Lease', 'VehicleLease');
INSERT INTO `common_account_sub_type` VALUES ('143', '15', 'Vehicle Loan', 'VehicleLoan');
INSERT INTO `common_account_sub_type` VALUES ('144', '15', 'Vehicle Loan Interest', 'VehicleLoan Interest');
INSERT INTO `common_account_sub_type` VALUES ('145', '15', 'Vehicle Registration', 'VehicleRegistration');
INSERT INTO `common_account_sub_type` VALUES ('146', '15', 'Vehicle Repairs', 'VehicleRepairs');
INSERT INTO `common_account_sub_type` VALUES ('147', '15', 'Wash and Road Services', 'WashAndRoadServices');
INSERT INTO `common_account_sub_type` VALUES ('148', '8', 'Global Tax Payable', 'GlobalTaxPayable');

-- ----------------------------
-- Table structure for common_account_type
-- ----------------------------
DROP TABLE IF EXISTS `common_account_type`;
CREATE TABLE `common_account_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL DEFAULT '',
  `short_name` varchar(200) NOT NULL,
  `short_name_no_space` varchar(200) NOT NULL,
  `short_name_underscore` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of common_account_type
-- ----------------------------
INSERT INTO `common_account_type` VALUES ('1', 'Accounts receivable (A/R)', 'Accounts receivable', 'AccountsReceivable', 'ACCOUNTS_RECEIVABLE');
INSERT INTO `common_account_type` VALUES ('2', 'Other Current Assets', 'Other Current Asset', 'OtherCurrentAsset', 'OTHER_CURRENT_ASSET');
INSERT INTO `common_account_type` VALUES ('3', 'Bank', 'Bank', 'Bank', 'BANK');
INSERT INTO `common_account_type` VALUES ('4', 'Fixed Assets', 'Fixed Asset', 'FixedAsset', 'FIXED_ASSET');
INSERT INTO `common_account_type` VALUES ('5', 'Other Assets', 'Other Asset', 'OtherAsset', 'OTHER_ASSET');
INSERT INTO `common_account_type` VALUES ('6', 'Accounts payable (A/P)', 'Accounts payable', 'AccountsPayable', 'ACCOUNTS_PAYABLE');
INSERT INTO `common_account_type` VALUES ('7', 'Credit Card', 'Credit Card', 'CreditCard', 'CREDIT_CARD');
INSERT INTO `common_account_type` VALUES ('8', 'Other Current Liabilities', 'Other Current Liability', 'OtherCurrentLiability', 'OTHER_CURRENT_LIABILITY');
INSERT INTO `common_account_type` VALUES ('9', 'Long Term Liabilities', 'Long Term Liability', 'LongTermLiability', 'LONG_TERM_LIABILITY');
INSERT INTO `common_account_type` VALUES ('10', 'Equity', 'Equity', 'Equity', 'EQUITY');
INSERT INTO `common_account_type` VALUES ('11', 'Income', 'Income', 'Income', 'INCOME');
INSERT INTO `common_account_type` VALUES ('12', 'Other Income', 'Other Income', 'OtherIncome', 'OTHER_INCOME');
INSERT INTO `common_account_type` VALUES ('13', 'Cost of Goods Sold', 'Cost of Goods Sold', 'CostOfGoodsSold', 'COST_OF_GOODSSOLD');
INSERT INTO `common_account_type` VALUES ('14', 'Expenses', 'Expense', 'Expense', 'EXPENSE');
INSERT INTO `common_account_type` VALUES ('15', 'Other Expense', 'Other Expense', 'OtherExpense', 'OTHER_EXPENSE');
INSERT INTO `common_account_type` VALUES ('16', 'Non Posting', 'Non Posting', 'NonPosting', 'NON_POSTING');

-- ----------------------------
-- Table structure for common_additional_field
-- ----------------------------
DROP TABLE IF EXISTS `common_additional_field`;
CREATE TABLE `common_additional_field` (
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

-- ----------------------------
-- Records of common_additional_field
-- ----------------------------

-- ----------------------------
-- Table structure for common_additional_field_option
-- ----------------------------
DROP TABLE IF EXISTS `common_additional_field_option`;
CREATE TABLE `common_additional_field_option` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field_id` int(11) DEFAULT NULL,
  `option_value` varchar(100) NOT NULL,
  `data_source_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_FIELD_ID` (`field_id`),
  CONSTRAINT `FK_FIELD_ID` FOREIGN KEY (`field_id`) REFERENCES `common_additional_field` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of common_additional_field_option
-- ----------------------------

-- ----------------------------
-- Table structure for common_approval_code
-- ----------------------------
DROP TABLE IF EXISTS `common_approval_code`;
CREATE TABLE `common_approval_code` (
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

-- ----------------------------
-- Records of common_approval_code
-- ----------------------------

-- ----------------------------
-- Table structure for common_approval_code_category
-- ----------------------------
DROP TABLE IF EXISTS `common_approval_code_category`;
CREATE TABLE `common_approval_code_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(70) NOT NULL,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of common_approval_code_category
-- ----------------------------
INSERT INTO `common_approval_code_category` VALUES ('1', 'Expense', 'I');
INSERT INTO `common_approval_code_category` VALUES ('2', 'Project', 'A');

-- ----------------------------
-- Table structure for common_approval_code_import_issue
-- ----------------------------
DROP TABLE IF EXISTS `common_approval_code_import_issue`;
CREATE TABLE `common_approval_code_import_issue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `import_mst_id` int(11) NOT NULL,
  `record` text DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL,
  `line_no` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_IMPORT_MST4` (`import_mst_id`),
  CONSTRAINT `FK_IMPORT_MST4` FOREIGN KEY (`import_mst_id`) REFERENCES `common_approval_code_import_mst` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of common_approval_code_import_issue
-- ----------------------------

-- ----------------------------
-- Table structure for common_approval_code_import_mst
-- ----------------------------
DROP TABLE IF EXISTS `common_approval_code_import_mst`;
CREATE TABLE `common_approval_code_import_mst` (
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

-- ----------------------------
-- Records of common_approval_code_import_mst
-- ----------------------------

-- ----------------------------
-- Table structure for common_approval_group
-- ----------------------------
DROP TABLE IF EXISTS `common_approval_group`;
CREATE TABLE `common_approval_group` (
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of common_approval_group
-- ----------------------------
INSERT INTO `common_approval_group` VALUES ('1', 'Administrator', 'A', 'admin', '2019-11-19 22:58:33', null, null, null, null);
INSERT INTO `common_approval_group` VALUES ('3', 'No Approval Group', 'A', 'admin', '2020-03-31 09:31:43', null, null, null, null);

-- ----------------------------
-- Table structure for common_approval_group_import_issue
-- ----------------------------
DROP TABLE IF EXISTS `common_approval_group_import_issue`;
CREATE TABLE `common_approval_group_import_issue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `import_mst_id` int(11) NOT NULL,
  `record` text DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL,
  `line_no` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of common_approval_group_import_issue
-- ----------------------------

-- ----------------------------
-- Table structure for common_approval_group_import_mst
-- ----------------------------
DROP TABLE IF EXISTS `common_approval_group_import_mst`;
CREATE TABLE `common_approval_group_import_mst` (
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

-- ----------------------------
-- Records of common_approval_group_import_mst
-- ----------------------------

-- ----------------------------
-- Table structure for common_attachment_type
-- ----------------------------
DROP TABLE IF EXISTS `common_attachment_type`;
CREATE TABLE `common_attachment_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of common_attachment_type
-- ----------------------------
INSERT INTO `common_attachment_type` VALUES ('1', 'RFP ');
INSERT INTO `common_attachment_type` VALUES ('2', 'Final Proposal');
INSERT INTO `common_attachment_type` VALUES ('3', 'Amendments');
INSERT INTO `common_attachment_type` VALUES ('4', 'Debrief/Protest');
INSERT INTO `common_attachment_type` VALUES ('5', 'Award Letter');
INSERT INTO `common_attachment_type` VALUES ('6', 'Final Report');
INSERT INTO `common_attachment_type` VALUES ('7', 'Signed Contract');
INSERT INTO `common_attachment_type` VALUES ('8', 'CPARS');
INSERT INTO `common_attachment_type` VALUES ('9', 'Work Order');
INSERT INTO `common_attachment_type` VALUES ('10', 'Task Proposal');
INSERT INTO `common_attachment_type` VALUES ('11', 'Contract');
INSERT INTO `common_attachment_type` VALUES ('20', 'Other');
INSERT INTO `common_attachment_type` VALUES ('38', 'Project Folder 3');
INSERT INTO `common_attachment_type` VALUES ('39', 'Folder 3');
INSERT INTO `common_attachment_type` VALUES ('40', 'Folder 6');
INSERT INTO `common_attachment_type` VALUES ('41', 'Project Folder 9');
INSERT INTO `common_attachment_type` VALUES ('42', 'Project Folder 4');
INSERT INTO `common_attachment_type` VALUES ('43', 'Sample Folder 10');
INSERT INTO `common_attachment_type` VALUES ('44', 'Sample Folder 11');

-- ----------------------------
-- Table structure for common_audit_trial_status
-- ----------------------------
DROP TABLE IF EXISTS `common_audit_trial_status`;
CREATE TABLE `common_audit_trial_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(75) NOT NULL,
  `sort_order` int(2) NOT NULL,
  `icon` varchar(50) NOT NULL,
  `color` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of common_audit_trial_status
-- ----------------------------
INSERT INTO `common_audit_trial_status` VALUES ('1', 'Uploaded by ', '1', 'fa fa-upload', 'bg-blue');
INSERT INTO `common_audit_trial_status` VALUES ('2', 'Reviewed and submitted by ', '2', 'fa fa-location-arrow', 'bg-blue');
INSERT INTO `common_audit_trial_status` VALUES ('3', 'Approved by ', '3', 'fa fa-check', 'bg-blue');
INSERT INTO `common_audit_trial_status` VALUES ('4', 'Rejected by ', '4', 'fa fa-close', 'bg-red');
INSERT INTO `common_audit_trial_status` VALUES ('5', 'Reassigned by ', '5', 'fa fa-share', 'bg-blue');
INSERT INTO `common_audit_trial_status` VALUES ('6', 'Deleted by ', '6', 'fa fa-trash', 'bg-red');
INSERT INTO `common_audit_trial_status` VALUES ('7', 'Re submitted by ', '7', 'fa fa-angle-double-right', 'bg-blue');
INSERT INTO `common_audit_trial_status` VALUES ('8', 'Approved and re-assigned by ', '7', 'fa fa-angle-double-right', 'bg-blue');
INSERT INTO `common_audit_trial_status` VALUES ('9', 'Last action reversed by ', '8', 'fa fa-undo', 'bg-blue');
INSERT INTO `common_audit_trial_status` VALUES ('10', 'Created by ', '1', 'fa fa-upload', 'bg-blue');
INSERT INTO `common_audit_trial_status` VALUES ('11', 'Payment issued by ', '10', 'fa fa-credit-card', 'bg-blue');
INSERT INTO `common_audit_trial_status` VALUES ('12', 'Check mailed by ', '11', 'fa fa-envelope-open', ' bg-blue');
INSERT INTO `common_audit_trial_status` VALUES ('13', 'Payment revoked by ', '12', 'fa fa-undo', ' bg-red');
INSERT INTO `common_audit_trial_status` VALUES ('14', 'Payment Invoice changed by', '13', 'fa fa-undo', ' bg-red');
INSERT INTO `common_audit_trial_status` VALUES ('15', 'Submitted by', '1', 'fa fa-upload', 'bg-blue');
INSERT INTO `common_audit_trial_status` VALUES ('16', 'Skipped by', '2', 'fa fa-step-forward', 'bg-blue');
INSERT INTO `common_audit_trial_status` VALUES ('17', 'Updated by', '3', 'fa fa-pencil', 'bg-blue');
INSERT INTO `common_audit_trial_status` VALUES ('18', 'Sent to vendor by', '4', 'fa fa-paper-plane-o', 'bg-blue');
INSERT INTO `common_audit_trial_status` VALUES ('19', 'Mark as under discussion by', '5', 'fa fa-thumb-tack', 'bg-blue');
INSERT INTO `common_audit_trial_status` VALUES ('20', 'Taged by', '6', 'fa fa-tag', 'bg-blue');
INSERT INTO `common_audit_trial_status` VALUES ('21', 'Un tagged by', '7', 'fa fa-tag', 'bg-red');
INSERT INTO `common_audit_trial_status` VALUES ('22', 'Imported by', '14', 'fafa-thumb-tack', 'bg-blue');
INSERT INTO `common_audit_trial_status` VALUES ('23', 'Save as approved by', '15', 'fa fa-check', 'bg-blue');

-- ----------------------------
-- Table structure for common_automation_action
-- ----------------------------
DROP TABLE IF EXISTS `common_automation_action`;
CREATE TABLE `common_automation_action` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `short_code` varchar(100) NOT NULL,
  `action_name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of common_automation_action
-- ----------------------------
INSERT INTO `common_automation_action` VALUES ('1', 'CREATE_APPROVAL_WORKFLOW', 'Create Approval Workflow');
INSERT INTO `common_automation_action` VALUES ('2', 'SEND_EMAIL_NOTIFICATION', 'Send Email Notification');
INSERT INTO `common_automation_action` VALUES ('3', 'SEND_USER_NOTIFICATION', 'Send User Notification');
INSERT INTO `common_automation_action` VALUES ('4', 'SET_FIELD_VALUE', 'Set Field Value');
INSERT INTO `common_automation_action` VALUES ('5', 'EXECUTE_AUTOMATION', 'Execute Automation');
INSERT INTO `common_automation_action` VALUES ('6', 'SYNC_WITH_THIRD_PART_APPLICATION', 'Sync With Third-Part Application');

-- ----------------------------
-- Table structure for common_automation_action_config
-- ----------------------------
DROP TABLE IF EXISTS `common_automation_action_config`;
CREATE TABLE `common_automation_action_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `automation_id` int(11) NOT NULL,
  `action_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `AUTOMATIO_ID_FK1` (`automation_id`),
  KEY `ACTION_ID_FK1` (`action_id`),
  CONSTRAINT `ACTION_ID_FK1` FOREIGN KEY (`action_id`) REFERENCES `common_automation_action` (`id`),
  CONSTRAINT `AUTOMATIO_ID_FK1` FOREIGN KEY (`automation_id`) REFERENCES `common_automation_mst` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of common_automation_action_config
-- ----------------------------

-- ----------------------------
-- Table structure for common_automation_chain_config
-- ----------------------------
DROP TABLE IF EXISTS `common_automation_chain_config`;
CREATE TABLE `common_automation_chain_config` (
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

-- ----------------------------
-- Records of common_automation_chain_config
-- ----------------------------

-- ----------------------------
-- Table structure for common_automation_condition
-- ----------------------------
DROP TABLE IF EXISTS `common_automation_condition`;
CREATE TABLE `common_automation_condition` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `condition_name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of common_automation_condition
-- ----------------------------
INSERT INTO `common_automation_condition` VALUES ('1', 'Equals');
INSERT INTO `common_automation_condition` VALUES ('2', 'Not Equals');
INSERT INTO `common_automation_condition` VALUES ('3', 'Greater Than');
INSERT INTO `common_automation_condition` VALUES ('4', 'Greater Than or Equal');
INSERT INTO `common_automation_condition` VALUES ('5', 'Less Than');
INSERT INTO `common_automation_condition` VALUES ('6', 'Less Than or Equal');
INSERT INTO `common_automation_condition` VALUES ('7', 'Contains');
INSERT INTO `common_automation_condition` VALUES ('8', 'Between');

-- ----------------------------
-- Table structure for common_automation_condition_config
-- ----------------------------
DROP TABLE IF EXISTS `common_automation_condition_config`;
CREATE TABLE `common_automation_condition_config` (
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

-- ----------------------------
-- Records of common_automation_condition_config
-- ----------------------------

-- ----------------------------
-- Table structure for common_automation_document_type
-- ----------------------------
DROP TABLE IF EXISTS `common_automation_document_type`;
CREATE TABLE `common_automation_document_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `document_type` varchar(100) NOT NULL,
  `short_code` varchar(100) NOT NULL,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of common_automation_document_type
-- ----------------------------
INSERT INTO `common_automation_document_type` VALUES ('1', 'Bills', 'BILL', 'A');
INSERT INTO `common_automation_document_type` VALUES ('2', 'Purchasing Orders', 'PO', 'A');
INSERT INTO `common_automation_document_type` VALUES ('3', 'Purchasing Order Receipts', 'PO_RECEIPT', 'A');
INSERT INTO `common_automation_document_type` VALUES ('4', 'Expenses', 'EXPENSE', 'A');
INSERT INTO `common_automation_document_type` VALUES ('5', 'Bill Payment', 'BILL_PAYMENT', 'A');

-- ----------------------------
-- Table structure for common_automation_document_type_config
-- ----------------------------
DROP TABLE IF EXISTS `common_automation_document_type_config`;
CREATE TABLE `common_automation_document_type_config` (
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

-- ----------------------------
-- Records of common_automation_document_type_config
-- ----------------------------

-- ----------------------------
-- Table structure for common_automation_document_type_event
-- ----------------------------
DROP TABLE IF EXISTS `common_automation_document_type_event`;
CREATE TABLE `common_automation_document_type_event` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `document_type_id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `DOC_TYPE_FK` (`document_type_id`),
  KEY `EVENT_FK` (`event_id`),
  CONSTRAINT `DOC_TYPE_FK` FOREIGN KEY (`document_type_id`) REFERENCES `common_automation_document_type` (`id`),
  CONSTRAINT `EVENT_FK` FOREIGN KEY (`event_id`) REFERENCES `common_automation_event` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of common_automation_document_type_event
-- ----------------------------
INSERT INTO `common_automation_document_type_event` VALUES ('1', '1', '1');
INSERT INTO `common_automation_document_type_event` VALUES ('2', '1', '2');
INSERT INTO `common_automation_document_type_event` VALUES ('3', '1', '3');
INSERT INTO `common_automation_document_type_event` VALUES ('4', '1', '5');
INSERT INTO `common_automation_document_type_event` VALUES ('5', '1', '4');
INSERT INTO `common_automation_document_type_event` VALUES ('6', '1', '6');
INSERT INTO `common_automation_document_type_event` VALUES ('7', '1', '9');
INSERT INTO `common_automation_document_type_event` VALUES ('8', '1', '8');
INSERT INTO `common_automation_document_type_event` VALUES ('9', '1', '10');

-- ----------------------------
-- Table structure for common_automation_email_config
-- ----------------------------
DROP TABLE IF EXISTS `common_automation_email_config`;
CREATE TABLE `common_automation_email_config` (
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

-- ----------------------------
-- Records of common_automation_email_config
-- ----------------------------

-- ----------------------------
-- Table structure for common_automation_event
-- ----------------------------
DROP TABLE IF EXISTS `common_automation_event`;
CREATE TABLE `common_automation_event` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event_name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of common_automation_event
-- ----------------------------
INSERT INTO `common_automation_event` VALUES ('1', 'Submitted');
INSERT INTO `common_automation_event` VALUES ('2', 'Edit & Resubmitted');
INSERT INTO `common_automation_event` VALUES ('3', 'Approved');
INSERT INTO `common_automation_event` VALUES ('4', 'Rejected');
INSERT INTO `common_automation_event` VALUES ('5', 'Skipped Approval');
INSERT INTO `common_automation_event` VALUES ('6', 'Deleted');
INSERT INTO `common_automation_event` VALUES ('7', 'Sent to Vendor');
INSERT INTO `common_automation_event` VALUES ('8', 'Created');
INSERT INTO `common_automation_event` VALUES ('9', 'Uploaded');
INSERT INTO `common_automation_event` VALUES ('10', 'Reassigned');
INSERT INTO `common_automation_event` VALUES ('11', 'Voided');
INSERT INTO `common_automation_event` VALUES ('12', 'Marked as Mailed');
INSERT INTO `common_automation_event` VALUES ('13', 'Applied to Different Bill');

-- ----------------------------
-- Table structure for common_automation_expense_cost_config
-- ----------------------------
DROP TABLE IF EXISTS `common_automation_expense_cost_config`;
CREATE TABLE `common_automation_expense_cost_config` (
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

-- ----------------------------
-- Records of common_automation_expense_cost_config
-- ----------------------------

-- ----------------------------
-- Table structure for common_automation_field
-- ----------------------------
DROP TABLE IF EXISTS `common_automation_field`;
CREATE TABLE `common_automation_field` (
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
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of common_automation_field
-- ----------------------------
INSERT INTO `common_automation_field` VALUES ('1', '1', 'invoiceNo', 'Bill Number', '1', '1', '0', '0');
INSERT INTO `common_automation_field` VALUES ('2', '1', 'invoiceAmount', 'Bill Amount', '1', '1', '0', '0');
INSERT INTO `common_automation_field` VALUES ('3', '1', 'vendorId', 'Vendor', '1', '1', '0', '0');
INSERT INTO `common_automation_field` VALUES ('4', '1', 'templateId', 'Template', '1', '1', '0', '0');
INSERT INTO `common_automation_field` VALUES ('5', '1', 'poId', 'PO Number', '1', '1', '1', '0');
INSERT INTO `common_automation_field` VALUES ('6', '1', 'grnMstId', 'PO Receipt Number', '1', '1', '1', '0');
INSERT INTO `common_automation_field` VALUES ('7', '1', 'invoiceDateFormat', 'Date Format', '0', '0', '0', '0');
INSERT INTO `common_automation_field` VALUES ('8', '1', 'invoiceDate', 'Bill Date', '1', '1', '0', '0');
INSERT INTO `common_automation_field` VALUES ('9', '1', 'term', 'Payment Terms', '1', '1', '0', '0');
INSERT INTO `common_automation_field` VALUES ('10', '1', 'dueDate', 'Due Date', '1', '1', '0', '0');
INSERT INTO `common_automation_field` VALUES ('11', '1', 'additionalNotes', 'Comment', '0', '0', '1', '0');
INSERT INTO `common_automation_field` VALUES ('12', '1', 'itemId', 'Item Code', '0', '0', '0', '0');
INSERT INTO `common_automation_field` VALUES ('13', '1', 'description', 'Item Name', '0', '0', '0', '0');
INSERT INTO `common_automation_field` VALUES ('14', '1', 'qty', 'Units', '0', '0', '0', '0');
INSERT INTO `common_automation_field` VALUES ('15', '1', 'rate', 'Unit Price', '0', '0', '0', '0');
INSERT INTO `common_automation_field` VALUES ('16', '1', 'tax', 'Tax Amount', '1', '1', '0', '0');
INSERT INTO `common_automation_field` VALUES ('17', '3', 'grnNumber', 'PO Receipt Number', '1', '1', '0', '0');
INSERT INTO `common_automation_field` VALUES ('18', '3', 'grnDate', 'PO Receipt Date', '1', '1', '0', '0');
INSERT INTO `common_automation_field` VALUES ('19', '3', 'vendorId', 'Vendor', '1', '1', '0', '0');
INSERT INTO `common_automation_field` VALUES ('20', '3', 'poId', 'PO Number', '1', '1', '0', '0');
INSERT INTO `common_automation_field` VALUES ('21', '3', 'poDate', 'PO Date', '1', '1', '0', '0');
INSERT INTO `common_automation_field` VALUES ('22', '3', 'transporterName', 'Received By', '0', '0', '0', '0');
INSERT INTO `common_automation_field` VALUES ('23', '3', 'itemNumber', 'Item Number', '0', '0', '1', '0');
INSERT INTO `common_automation_field` VALUES ('24', '3', 'description', 'Item Name', '0', '0', '1', '0');
INSERT INTO `common_automation_field` VALUES ('25', '3', 'uomId', 'UOM', '0', '0', '1', '0');
INSERT INTO `common_automation_field` VALUES ('26', '3', 'remainingQty', 'Remaining Qty', '0', '0', '1', '0');
INSERT INTO `common_automation_field` VALUES ('27', '3', 'receivedQty', 'Received Qty', '0', '0', '1', '0');
INSERT INTO `common_automation_field` VALUES ('28', '3', 'unitPrice', 'Unit Price', '0', '0', '1', '0');
INSERT INTO `common_automation_field` VALUES ('29', '3', 'amount', 'Amount', '0', '0', '1', '0');
INSERT INTO `common_automation_field` VALUES ('30', '3', 'totalAmount', 'Total Amount', '1', '1', '0', '0');
INSERT INTO `common_automation_field` VALUES ('31', '3', 'note', 'Notes', '0', '0', '0', '0');
INSERT INTO `common_automation_field` VALUES ('32', '2', 'poNumber', 'Po Number', '1', '1', '0', '0');
INSERT INTO `common_automation_field` VALUES ('33', '2', 'createdOn', 'Submit Date', '1', '1', '1', '0');
INSERT INTO `common_automation_field` VALUES ('34', '2', 'vendorId', 'Vendor', '1', '1', '0', '0');
INSERT INTO `common_automation_field` VALUES ('35', '2', 'projectCodeId', 'Project / Task', '1', '1', '1', '0');
INSERT INTO `common_automation_field` VALUES ('36', '2', 'deliveryDate', 'Date of Delivery ', '1', '1', '0', '0');
INSERT INTO `common_automation_field` VALUES ('37', '2', 'pocPhone', 'Contact Number', '0', '1', '0', '0');
INSERT INTO `common_automation_field` VALUES ('38', '2', 'pocName', 'Contact Person', '1', '1', '0', '0');
INSERT INTO `common_automation_field` VALUES ('39', '2', 'notes', 'Notes', '0', '0', '1', '0');
INSERT INTO `common_automation_field` VALUES ('40', '2', 'shippingAddress', 'Shipping Address', '0', '0', '0', '0');
INSERT INTO `common_automation_field` VALUES ('41', '2', 'billingAddress', 'Billing Address', '0', '0', '0', '0');
INSERT INTO `common_automation_field` VALUES ('42', '2', 'productId', 'Select Item', '0', '0', '0', '0');
INSERT INTO `common_automation_field` VALUES ('43', '2', 'description', 'Item Name', '0', '0', '0', '0');
INSERT INTO `common_automation_field` VALUES ('44', '2', 'uomId', 'UOM', '0', '0', '0', '0');
INSERT INTO `common_automation_field` VALUES ('45', '2', 'qty', 'QTY', '0', '0', '0', '0');
INSERT INTO `common_automation_field` VALUES ('46', '2', 'grossAmount', 'Price', '0', '0', '0', '0');
INSERT INTO `common_automation_field` VALUES ('47', '2', 'discountAmount', 'Discount', '0', '0', '0', '0');
INSERT INTO `common_automation_field` VALUES ('48', '2', 'amount', 'Amount', '0', '0', '0', '0');
INSERT INTO `common_automation_field` VALUES ('49', '2', 'taxAmount', 'Tax amount', '1', '1', '0', '0');
INSERT INTO `common_automation_field` VALUES ('50', '2', 'discountAmount', 'Discount Amount', '1', '1', '0', '0');
INSERT INTO `common_automation_field` VALUES ('51', '2', 'netAmount', 'Net Amount', '1', '1', '0', '0');
INSERT INTO `common_automation_field` VALUES ('52', '4', 'reportName', 'Report Name', '0', '0', '1', '0');
INSERT INTO `common_automation_field` VALUES ('53', '4', 'businessPurpose', 'Business Purpose', '0', '0', '1', '0');
INSERT INTO `common_automation_field` VALUES ('54', '4', 'report', 'Receipt', '0', '0', '0', '0');
INSERT INTO `common_automation_field` VALUES ('55', '4', 'createdOn', 'Date', '0', '0', '0', '0');
INSERT INTO `common_automation_field` VALUES ('56', '4', 'merchant', 'Merchant', '0', '0', '0', '0');
INSERT INTO `common_automation_field` VALUES ('57', '4', 'projectAccountCode', 'Project / Task', '0', '0', '0', '0');
INSERT INTO `common_automation_field` VALUES ('58', '4', 'expenseType', 'Expense Type', '0', '0', '0', '0');
INSERT INTO `common_automation_field` VALUES ('59', '4', 'totalAmount', 'Amount', '0', '0', '0', '0');
INSERT INTO `common_automation_field` VALUES ('60', '4', 'amount', 'Net Amount', '1', '1', '0', '0');
INSERT INTO `common_automation_field` VALUES ('61', '4', 'notes', 'Notes', '0', '0', '1', '0');
INSERT INTO `common_automation_field` VALUES ('62', '4', 'discription', 'Description', '0', '0', '1', '0');
INSERT INTO `common_automation_field` VALUES ('63', '5', 'vendor', 'Vendor', '1', '1', '0', '0');
INSERT INTO `common_automation_field` VALUES ('64', '5', 'invoiceNo', 'Invoice Number', '1', '1', '0', '0');
INSERT INTO `common_automation_field` VALUES ('65', '5', 'paymentType', 'Payment Method', '1', '1', '0', '0');
INSERT INTO `common_automation_field` VALUES ('66', '5', 'paymentReferanceNo', 'Payment Reference', '1', '1', '0', '0');
INSERT INTO `common_automation_field` VALUES ('67', '5', 'invoiceDate', 'Invoice Date', '1', '1', '0', '0');
INSERT INTO `common_automation_field` VALUES ('68', '5', 'paymentDate', 'Payment Date', '1', '1', '0', '0');
INSERT INTO `common_automation_field` VALUES ('69', '5', 'balanceToBePaid', 'Balance to be Paid', '1', '1', '0', '0');
INSERT INTO `common_automation_field` VALUES ('70', '5', 'amount', 'Payment Amount', '1', '1', '0', '0');
INSERT INTO `common_automation_field` VALUES ('71', '5', 'discountAmount', 'Discount Amount', '1', '1', '0', '0');
INSERT INTO `common_automation_field` VALUES ('72', '5', 'receipt', 'Receipt', '0', '0', '0', '0');
INSERT INTO `common_automation_field` VALUES ('73', '2', 'status', 'Status', '0', '0', '0', '0');

-- ----------------------------
-- Table structure for common_automation_field_condition
-- ----------------------------
DROP TABLE IF EXISTS `common_automation_field_condition`;
CREATE TABLE `common_automation_field_condition` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field_id` int(11) NOT NULL,
  `condition_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FIELD_ID_FK4` (`field_id`),
  KEY `FILED_CONDITION_FK3` (`condition_id`),
  CONSTRAINT `FIELD_ID_FK4` FOREIGN KEY (`field_id`) REFERENCES `common_automation_field` (`id`),
  CONSTRAINT `FILED_CONDITION_FK3` FOREIGN KEY (`condition_id`) REFERENCES `common_automation_condition` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of common_automation_field_condition
-- ----------------------------
INSERT INTO `common_automation_field_condition` VALUES ('1', '1', '1');
INSERT INTO `common_automation_field_condition` VALUES ('2', '1', '2');
INSERT INTO `common_automation_field_condition` VALUES ('3', '1', '7');
INSERT INTO `common_automation_field_condition` VALUES ('4', '2', '1');
INSERT INTO `common_automation_field_condition` VALUES ('5', '2', '2');
INSERT INTO `common_automation_field_condition` VALUES ('6', '2', '3');
INSERT INTO `common_automation_field_condition` VALUES ('7', '2', '4');
INSERT INTO `common_automation_field_condition` VALUES ('8', '2', '5');
INSERT INTO `common_automation_field_condition` VALUES ('9', '2', '6');
INSERT INTO `common_automation_field_condition` VALUES ('10', '2', '8');

-- ----------------------------
-- Table structure for common_automation_field_config
-- ----------------------------
DROP TABLE IF EXISTS `common_automation_field_config`;
CREATE TABLE `common_automation_field_config` (
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

-- ----------------------------
-- Records of common_automation_field_config
-- ----------------------------

-- ----------------------------
-- Table structure for common_automation_item_cost_config
-- ----------------------------
DROP TABLE IF EXISTS `common_automation_item_cost_config`;
CREATE TABLE `common_automation_item_cost_config` (
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

-- ----------------------------
-- Records of common_automation_item_cost_config
-- ----------------------------

-- ----------------------------
-- Table structure for common_automation_mst
-- ----------------------------
DROP TABLE IF EXISTS `common_automation_mst`;
CREATE TABLE `common_automation_mst` (
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

-- ----------------------------
-- Records of common_automation_mst
-- ----------------------------

-- ----------------------------
-- Table structure for common_automation_notification
-- ----------------------------
DROP TABLE IF EXISTS `common_automation_notification`;
CREATE TABLE `common_automation_notification` (
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

-- ----------------------------
-- Records of common_automation_notification
-- ----------------------------

-- ----------------------------
-- Table structure for common_automation_notification_config
-- ----------------------------
DROP TABLE IF EXISTS `common_automation_notification_config`;
CREATE TABLE `common_automation_notification_config` (
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

-- ----------------------------
-- Records of common_automation_notification_config
-- ----------------------------

-- ----------------------------
-- Table structure for common_automation_system_sync_config
-- ----------------------------
DROP TABLE IF EXISTS `common_automation_system_sync_config`;
CREATE TABLE `common_automation_system_sync_config` (
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

-- ----------------------------
-- Records of common_automation_system_sync_config
-- ----------------------------

-- ----------------------------
-- Table structure for common_automation_workflow_config
-- ----------------------------
DROP TABLE IF EXISTS `common_automation_workflow_config`;
CREATE TABLE `common_automation_workflow_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `automation_id` int(11) NOT NULL,
  `action_id` int(11) NOT NULL,
  `approval_group` int(1) DEFAULT NULL,
  `approval_user` varchar(100) DEFAULT '',
  `approval_order` int(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `AUTOMATION_ID_FK2` (`automation_id`),
  KEY `ACTION_FK1` (`action_id`),
  KEY `APPROVAL_GROUP_FK_4` (`approval_group`),
  CONSTRAINT `ACTION_FK1` FOREIGN KEY (`action_id`) REFERENCES `common_automation_action` (`id`),
  CONSTRAINT `APPROVAL_GROUP_FK_4` FOREIGN KEY (`approval_group`) REFERENCES `common_approval_group` (`id`),
  CONSTRAINT `AUTOMATION_ID_FK2` FOREIGN KEY (`automation_id`) REFERENCES `common_automation_mst` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of common_automation_workflow_config
-- ----------------------------

-- ----------------------------
-- Table structure for common_data_source
-- ----------------------------
DROP TABLE IF EXISTS `common_data_source`;
CREATE TABLE `common_data_source` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `type` int(11) NOT NULL,
  `config_id` int(11) DEFAULT NULL,
  `status` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of common_data_source
-- ----------------------------

-- ----------------------------
-- Table structure for common_data_source_config
-- ----------------------------
DROP TABLE IF EXISTS `common_data_source_config`;
CREATE TABLE `common_data_source_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entity` varchar(100) NOT NULL,
  `alias` varchar(50) NOT NULL,
  `field` varchar(100) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of common_data_source_config
-- ----------------------------

-- ----------------------------
-- Table structure for common_date_format
-- ----------------------------
DROP TABLE IF EXISTS `common_date_format`;
CREATE TABLE `common_date_format` (
  `id` varchar(30) NOT NULL,
  `name` varchar(30) NOT NULL,
  `sort_order` int(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of common_date_format
-- ----------------------------
INSERT INTO `common_date_format` VALUES ('dd-MM-yyyy', '30-12-2018', '1');
INSERT INTO `common_date_format` VALUES ('dd-MMM-yyyy', '30-Dec-2018', '2');
INSERT INTO `common_date_format` VALUES ('dd-MMMM-yyyy', '30-December-2018', '6');
INSERT INTO `common_date_format` VALUES ('dd.MM.yy', '30.12.18', '7');
INSERT INTO `common_date_format` VALUES ('dd.MM.yyyy', '30.12.2018', '8');
INSERT INTO `common_date_format` VALUES ('dd.MMM.yy', '30.Dec.18', '9');
INSERT INTO `common_date_format` VALUES ('dd.MMM.yyyy', '30.Dec.2018', '10');
INSERT INTO `common_date_format` VALUES ('dd.MMMM.yy', '30.December.18', '11');
INSERT INTO `common_date_format` VALUES ('dd.MMMM.yyyy', '30.December.2018', '12');
INSERT INTO `common_date_format` VALUES ('dd/MM/yyyy', '30/12/2018', '4');
INSERT INTO `common_date_format` VALUES ('dd/MMM/yyyy', '30/Dec/2018', '13');
INSERT INTO `common_date_format` VALUES ('dd/MMMM/yyyy', '30/December/2018', '14');
INSERT INTO `common_date_format` VALUES ('MM-dd-yyyy', '12-30-2018', '15');
INSERT INTO `common_date_format` VALUES ('MM.dd.yy', '12.30.18', '16');
INSERT INTO `common_date_format` VALUES ('MM.dd.yyyy', '12.30.2018', '17');
INSERT INTO `common_date_format` VALUES ('MM/dd/yyyy', '12/30/2018', '5');
INSERT INTO `common_date_format` VALUES ('MMM dd, yyyy', 'Dec 30, 2018', '18');
INSERT INTO `common_date_format` VALUES ('MMM-dd-yyyy', 'Dec-30-2018', '19');
INSERT INTO `common_date_format` VALUES ('MMM.dd.yy', 'Dec.30.18', '20');
INSERT INTO `common_date_format` VALUES ('MMM.dd.yyyy', 'Dec.30.2018', '21');
INSERT INTO `common_date_format` VALUES ('MMM/dd/yyyy', 'Dec/30/2018', '22');
INSERT INTO `common_date_format` VALUES ('MMMM dd, yyyy', 'December 30, 2018', '57');
INSERT INTO `common_date_format` VALUES ('MMMM-dd-yyyy', 'December-30-2018', '23');
INSERT INTO `common_date_format` VALUES ('MMMM/dd/yyyy', 'December/30/2018', '24');
INSERT INTO `common_date_format` VALUES ('yy MMM ,dd', '18 Dec ,30', '25');
INSERT INTO `common_date_format` VALUES ('yy-dd-MMM', '18-30-Dec', '26');
INSERT INTO `common_date_format` VALUES ('yy-dd-MMMM', '18-30-December', '27');
INSERT INTO `common_date_format` VALUES ('yy-MM/dd', '18-12-30', '28');
INSERT INTO `common_date_format` VALUES ('yy-MMM-dd', '18-Dec-30', '29');
INSERT INTO `common_date_format` VALUES ('yy-MMMM-dd', '18-December-30', '30');
INSERT INTO `common_date_format` VALUES ('yy.dd.MMM', '18.30.Dec', '31');
INSERT INTO `common_date_format` VALUES ('yy.dd.MMMM', '18.30.December', '32');
INSERT INTO `common_date_format` VALUES ('yy.MM.dd', '18.12.30', '33');
INSERT INTO `common_date_format` VALUES ('yy.MMM.dd', '18.Dec.30', '34');
INSERT INTO `common_date_format` VALUES ('yy.MMMM.dd', '18.December.30', '35');
INSERT INTO `common_date_format` VALUES ('yy/dd/MMM', '18/30/Dec', '36');
INSERT INTO `common_date_format` VALUES ('yy/dd/MMMM', '18/30/December', '37');
INSERT INTO `common_date_format` VALUES ('yy/MM/dd', '18/12/30', '38');
INSERT INTO `common_date_format` VALUES ('yy/MMM/dd', '18/Dec/30', '39');
INSERT INTO `common_date_format` VALUES ('yy/MMMM/dd', '18/December/30', '40');
INSERT INTO `common_date_format` VALUES ('yyyy MMM ,dd', '2018 Dec ,30', '41');
INSERT INTO `common_date_format` VALUES ('yyyy-dd-MMM', '2018-30-Dec', '42');
INSERT INTO `common_date_format` VALUES ('yyyy-dd-MMMM', '2018-30-December', '43');
INSERT INTO `common_date_format` VALUES ('yyyy-MM/dd', '2018-12-30', '44');
INSERT INTO `common_date_format` VALUES ('yyyy-MMM-dd', '2018-Dec-30', '45');
INSERT INTO `common_date_format` VALUES ('yyyy-MMMM-dd', '2018-December-30', '46');
INSERT INTO `common_date_format` VALUES ('yyyy.dd.MMM', '2018.30.Dec', '47');
INSERT INTO `common_date_format` VALUES ('yyyy.dd.MMMM', '2018.30.December', '48');
INSERT INTO `common_date_format` VALUES ('yyyy.MM.dd', '2018.12.30', '49');
INSERT INTO `common_date_format` VALUES ('yyyy.MMM.dd', '2018.Dec.30', '50');
INSERT INTO `common_date_format` VALUES ('yyyy.MMMM.dd', '2018.December.30', '51');
INSERT INTO `common_date_format` VALUES ('yyyy/dd/MMM', '2018/30/Dec', '52');
INSERT INTO `common_date_format` VALUES ('yyyy/dd/MMMM', '2018/30/December', '53');
INSERT INTO `common_date_format` VALUES ('yyyy/MM/dd', '2018/12/30', '54');
INSERT INTO `common_date_format` VALUES ('yyyy/MMM/dd', '2018/Dec/30', '55');
INSERT INTO `common_date_format` VALUES ('yyyy/MMMM/dd', '2018/December/30', '56');

-- ----------------------------
-- Table structure for common_document_ad_hoc_workflow_config
-- ----------------------------
DROP TABLE IF EXISTS `common_document_ad_hoc_workflow_config`;
CREATE TABLE `common_document_ad_hoc_workflow_config` (
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

-- ----------------------------
-- Records of common_document_ad_hoc_workflow_config
-- ----------------------------

-- ----------------------------
-- Table structure for common_document_ad_hoc_workflow_detail_config
-- ----------------------------
DROP TABLE IF EXISTS `common_document_ad_hoc_workflow_detail_config`;
CREATE TABLE `common_document_ad_hoc_workflow_detail_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `workflow_id` int(11) NOT NULL,
  `approval_group` int(11) DEFAULT NULL,
  `approval_user` varchar(100) DEFAULT '',
  `approval_order` int(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `AUTOMATION_ID_FK2` (`workflow_id`),
  KEY `APPROVAL_GROUP_FK_3` (`approval_group`),
  CONSTRAINT `AD_HOC_WORKFLOW_FK_1` FOREIGN KEY (`workflow_id`) REFERENCES `common_document_ad_hoc_workflow_config` (`id`),
  CONSTRAINT `APPROVAL_GROUP_FK_3` FOREIGN KEY (`approval_group`) REFERENCES `common_approval_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of common_document_ad_hoc_workflow_detail_config
-- ----------------------------

-- ----------------------------
-- Table structure for common_document_workflow_config
-- ----------------------------
DROP TABLE IF EXISTS `common_document_workflow_config`;
CREATE TABLE `common_document_workflow_config` (
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

-- ----------------------------
-- Records of common_document_workflow_config
-- ----------------------------

-- ----------------------------
-- Table structure for common_drop_down
-- ----------------------------
DROP TABLE IF EXISTS `common_drop_down`;
CREATE TABLE `common_drop_down` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `drop_down_name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of common_drop_down
-- ----------------------------
INSERT INTO `common_drop_down` VALUES ('1', 'Active Inactive Status Drop Down');
INSERT INTO `common_drop_down` VALUES ('2', 'Approval Group Status');
INSERT INTO `common_drop_down` VALUES ('3', 'User Status');
INSERT INTO `common_drop_down` VALUES ('4', 'Account Status');
INSERT INTO `common_drop_down` VALUES ('5', 'Item Status');
INSERT INTO `common_drop_down` VALUES ('6', 'Item Taxability');
INSERT INTO `common_drop_down` VALUES ('7', 'Sub Account Status');
INSERT INTO `common_drop_down` VALUES ('8', 'Bill Payment Status');
INSERT INTO `common_drop_down` VALUES ('9', 'Project Code Status');
INSERT INTO `common_drop_down` VALUES ('10', 'Additional Field Required Status');
INSERT INTO `common_drop_down` VALUES ('11', 'Additional Field Active Status');
INSERT INTO `common_drop_down` VALUES ('12', 'Internal Approval Status');
INSERT INTO `common_drop_down` VALUES ('13', 'Vendor Approval Status');

-- ----------------------------
-- Table structure for common_drop_down_connection
-- ----------------------------
DROP TABLE IF EXISTS `common_drop_down_connection`;
CREATE TABLE `common_drop_down_connection` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `drop_down_id` int(11) NOT NULL,
  `drop_down_value_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_DROP_DOWN_ID` (`drop_down_id`),
  KEY `FK_DROP_DOWN_VALUE_ID` (`drop_down_value_id`),
  CONSTRAINT `FK_DROP_DOWN_ID` FOREIGN KEY (`drop_down_id`) REFERENCES `common_drop_down` (`id`),
  CONSTRAINT `FK_DROP_DOWN_VALUE_ID` FOREIGN KEY (`drop_down_value_id`) REFERENCES `common_drop_down_value` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of common_drop_down_connection
-- ----------------------------
INSERT INTO `common_drop_down_connection` VALUES ('1', '1', '1');
INSERT INTO `common_drop_down_connection` VALUES ('2', '1', '2');
INSERT INTO `common_drop_down_connection` VALUES ('3', '2', '1');
INSERT INTO `common_drop_down_connection` VALUES ('4', '2', '2');
INSERT INTO `common_drop_down_connection` VALUES ('5', '3', '3');
INSERT INTO `common_drop_down_connection` VALUES ('6', '4', '1');
INSERT INTO `common_drop_down_connection` VALUES ('7', '4', '2');
INSERT INTO `common_drop_down_connection` VALUES ('8', '5', '1');
INSERT INTO `common_drop_down_connection` VALUES ('9', '5', '2');
INSERT INTO `common_drop_down_connection` VALUES ('10', '6', '4');
INSERT INTO `common_drop_down_connection` VALUES ('11', '6', '5');
INSERT INTO `common_drop_down_connection` VALUES ('12', '7', '1');
INSERT INTO `common_drop_down_connection` VALUES ('13', '7', '2');
INSERT INTO `common_drop_down_connection` VALUES ('14', '8', '1');
INSERT INTO `common_drop_down_connection` VALUES ('15', '8', '6');
INSERT INTO `common_drop_down_connection` VALUES ('16', '8', '7');
INSERT INTO `common_drop_down_connection` VALUES ('17', '8', '8');
INSERT INTO `common_drop_down_connection` VALUES ('18', '9', '1');
INSERT INTO `common_drop_down_connection` VALUES ('19', '9', '2');
INSERT INTO `common_drop_down_connection` VALUES ('21', '10', '9');
INSERT INTO `common_drop_down_connection` VALUES ('22', '10', '10');
INSERT INTO `common_drop_down_connection` VALUES ('23', '11', '1');
INSERT INTO `common_drop_down_connection` VALUES ('24', '11', '2');
INSERT INTO `common_drop_down_connection` VALUES ('25', '13', '13');
INSERT INTO `common_drop_down_connection` VALUES ('26', '13', '14');
INSERT INTO `common_drop_down_connection` VALUES ('27', '13', '12');
INSERT INTO `common_drop_down_connection` VALUES ('28', '12', '13');
INSERT INTO `common_drop_down_connection` VALUES ('29', '12', '12');
INSERT INTO `common_drop_down_connection` VALUES ('30', '12', '11');
INSERT INTO `common_drop_down_connection` VALUES ('31', '12', '13');

-- ----------------------------
-- Table structure for common_drop_down_value
-- ----------------------------
DROP TABLE IF EXISTS `common_drop_down_value`;
CREATE TABLE `common_drop_down_value` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value` varchar(50) NOT NULL,
  `label` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of common_drop_down_value
-- ----------------------------
INSERT INTO `common_drop_down_value` VALUES ('1', 'A', 'Active');
INSERT INTO `common_drop_down_value` VALUES ('2', 'I', 'In-Active');
INSERT INTO `common_drop_down_value` VALUES ('3', 'L', 'Locked');
INSERT INTO `common_drop_down_value` VALUES ('4', 'T', 'Taxable');
INSERT INTO `common_drop_down_value` VALUES ('5', 'N', 'Non Taxable');
INSERT INTO `common_drop_down_value` VALUES ('6', 'V', 'Void');
INSERT INTO `common_drop_down_value` VALUES ('7', 'PAID', 'Paid');
INSERT INTO `common_drop_down_value` VALUES ('8', 'M', 'Mailed');
INSERT INTO `common_drop_down_value` VALUES ('9', 'Y', 'Required');
INSERT INTO `common_drop_down_value` VALUES ('10', 'N', 'Optional');
INSERT INTO `common_drop_down_value` VALUES ('11', 'A', 'Approved');
INSERT INTO `common_drop_down_value` VALUES ('12', 'R', 'Reject');
INSERT INTO `common_drop_down_value` VALUES ('13', 'P', 'Pending');
INSERT INTO `common_drop_down_value` VALUES ('14', 'NA', 'Not-Assigned');

-- ----------------------------
-- Table structure for common_email_attachment
-- ----------------------------
DROP TABLE IF EXISTS `common_email_attachment`;
CREATE TABLE `common_email_attachment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `attachment_url` text NOT NULL,
  `attachment_name` varchar(100) NOT NULL,
  `email_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `EMAIL_ID_FK1` (`email_id`) USING BTREE,
  CONSTRAINT `common_email_attachment_ibfk_1` FOREIGN KEY (`email_id`) REFERENCES `common_email_mst` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of common_email_attachment
-- ----------------------------

-- ----------------------------
-- Table structure for common_email_mst
-- ----------------------------
DROP TABLE IF EXISTS `common_email_mst`;
CREATE TABLE `common_email_mst` (
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of common_email_mst
-- ----------------------------
INSERT INTO `common_email_mst` VALUES ('1', 'Log in to PaperTrl and get started!', '<!doctype html>\n<!--\nTo change this license header, choose License Headers in Project Properties.\nTo change this template file, choose Tools | Templates\nand open the template in the editor.\n-->\n<html>\n <head> \n  <meta charset=\"UTF-8\"> \n  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\"> \n </head> \n <body> \n  <table style=\"color: #207580;\"> \n   <tbody>\n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr> \n     <td style=\"font-weight: bold\">Hi <span id=\"EMAIL_SEND_TO\">Papertrl</span>,</td> \n    </tr> \n    <tr>\n     <td></td> \n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr> \n     <td>You are all set! Your PaperTrl User ID is <span style=\"font-weight: bold; font-style: italic;\" id=\"USER_ID\">admin</span></td> \n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr> \n     <td>\n      <ul></ul>\n      <ul></ul>Please <a id=\"PASSWORD_RESET_URL\" href=\"https://demo-test1.papertrl.com:443/temporary-password-reset?usd=wyohu1LnkeU%3D&amp;tkn=2zkFPxq9TQkxgGIDfmprnA%3D%3D\"> click here </a> here to reset your password then use the Task List below to get started. </td> \n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr> \n     <td> \n      <dl> \n       <dt>\n        Begin using PaperTrl in five easy steps:\n       </dt> \n       <dd>\n        1. Log in with the \n        <b>link</b> above.\n       </dd> \n       <dd>\n        2. Click on \n        <b>Settings</b> to complete your Company Profile.\n       </dd> \n       <dd>\n        3. Click on \n        <b>User Management</b> to add users.\n       </dd> \n       <dd>\n        4. Click on \n        <b>Code Management</b> to create or upload account codes from your accounting system.\n       </dd> \n       <dd>\n        5. Click on \n        <b>Vendor Management</b> to create or upload vendors from your accounting system.\n       </dd> \n      </dl> </td>\n     <td> </td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr> \n     <td> Once you\'ve completed these steps, you are ready to process your first invoice! Click on <b>Upload Invoice</b> to upload an invoice and begin the approval process. Or invite a vendor to the system using <b>Vendor Management</b> and let them upload invoices on their own </td> \n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr> \n     <td>Want some help? Email <span style=\"font-weight: bold\"><a href=\"mailto:support@papertrl.com\">support@papertrl.com</a></span> to schedule a free Get Started session with one of our team members or email us with questions anytime. </td> \n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr style=\"margin-top: 65px\"> \n     <td> <span style=\"font-weight: bold\">\n       <ul></ul>\n       <ul></ul>\n       <ul></ul>\n       <ul></ul>Thank You!</span> </td> \n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr style=\"margin-top: 65px\"> \n     <td> <span>The PaperTrl Team</span> </td> \n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr> \n     <td>Questions? Contact us anytime at <span style=\"font-weight: bold\"><a id=\"URL\" href=\"\">support@papertrl.com</a></span></td> \n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr> \n     <td> <img style=\"width: 170px;height: 45px;\" src=\"https://papertrl.com/wp-content/uploads/2019/09/logo.png\"> </td> \n    </tr> \n    <tr> \n     <td>This email is an automated notification, Replies to this message will not be read or responded to. We\'re happy to help you with any questions or concerns you may have. Please contact us directly 24/7 via <span style=\"font-weight: bold\">support@papertrl.com</span> <p class=\"MsoNormal\"><span style=\"font-size:8.0pt;color:#207580\">CONFIDENTIALITY NOTICE: This e-mail transmission, and any attachments, is intended only for the use of PaperTrl Inc. or recipient named above and may contain information that is confidential, privileged and exempt from disclosure under applicable law. If you are not the intended recipient or authorized to receive this message for the recipient, you must not use, copy, disclose or take any action based on this message or any information herein. If you have received this message in error, please advise the sender immediately.</span><span style=\"font-size:8.0pt;color:#014708\"></span></p> <p><span style=\"font-size:18.0pt;font-family:Webdings;color:green\">P</span><span style=\"color:black\"> </span><span style=\"font-size:10.0pt;font-family:&quot;Helvetica&quot;,sans-serif;color:green\">Be Environmentally Responsible. Please don\'t print this e-mail unless you really need to.</span><u></u><u></u></p> </td> \n    </tr> \n    <tr> \n     <td></td> \n    </tr> \n    <tr> \n     <td></td> \n    </tr> \n   </tbody>\n  </table>   \n </body>\n</html>', 'indragupthaekanayaka@gmail.com', null, 'Y', '1', 'admin', '2020-05-12 08:00:12', null, null, null, null);
INSERT INTO `common_email_mst` VALUES ('2', 'Log in to PaperTrl and get started!', '<!doctype html>\n<!--\nTo change this license header, choose License Headers in Project Properties.\nTo change this template file, choose Tools | Templates\nand open the template in the editor.\n-->\n<html>\n <head> \n  <meta charset=\"UTF-8\"> \n  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\"> \n </head> \n <body> \n  <table style=\"color: #207580;\"> \n   <tbody>\n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr> \n     <td style=\"font-weight: bold\">Hi <span id=\"EMAIL_SEND_TO\">avishka</span>,</td> \n    </tr> \n    <tr>\n     <td></td> \n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr> \n     <td>You are all set! Your PaperTrl User ID is <span style=\"font-weight: bold; font-style: italic;\" id=\"USER_ID\">admin</span></td> \n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr> \n     <td>\n      <ul></ul>\n      <ul></ul>Please <a id=\"PASSWORD_RESET_URL\" href=\"https://qa-app153.papertrl.com:443/#/temporary-password-reset?usd=wyohu1LnkeU%3D&amp;tkn=EG4QtSEJRSfsQ%2B061ZpIpQ%3D%3D\"> click here </a> here to reset your password then use the Task List below to get started. </td> \n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr> \n     <td> \n      <dl> \n       <dt>\n        Begin using PaperTrl in four easy steps:\n       </dt> \n       <dd>\n        1. Log in with the \n        <b>link</b> above.\n       </dd> \n       <dd>\n        2. Click on \n        <b>Settings</b> to complete your Company Profile.\n       </dd> \n       <dd>\n        3. Click on \n        <b>User Management</b> to add users.\n       </dd> \n       <dd>\n        4. Click on \n        <b>Code Management</b> to create or upload account codes from your accounting system.\n       </dd> \n      </dl> </td>\n     <td> </td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr> \n     <td> Once you\'ve completed these steps, you are ready to process your first invoice! Click on <b>Upload Invoice</b> to upload an invoice and begin the approval process. Or invite a vendor to the system using <b>Vendor Management</b> and let them upload invoices on their own </td> \n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr> \n     <td>Want some help? Email <span style=\"font-weight: bold\"><a href=\"mailto:support@papertrl.com\">support@papertrl.com</a></span> to schedule a free Get Started session with one of our team members or email us with questions anytime. </td> \n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr style=\"margin-top: 65px\"> \n     <td> <span style=\"font-weight: bold\">\n       <ul></ul>\n       <ul></ul>\n       <ul></ul>\n       <ul></ul>Thank You!</span> </td> \n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr style=\"margin-top: 65px\"> \n     <td> <span>The PaperTrl Team</span> </td> \n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr> \n     <td>Questions? Contact us anytime at <span style=\"font-weight: bold\"><a id=\"URL\" href=\"\">support@papertrl.com</a></span></td> \n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr> \n     <td> <img style=\"width: 170px;height: 45px;\" src=\"https://papertrl.com/wp-content/uploads/2019/09/logo.png\"> </td> \n    </tr> \n    <tr> \n     <td>This email is an automated notification, Replies to this message will not be read or responded to. We\'re happy to help you with any questions or concerns you may have. Please contact us directly 24/7 via <span style=\"font-weight: bold\">support@papertrl.com</span> <p class=\"MsoNormal\"><span style=\"font-size:8.0pt;color:#207580\">CONFIDENTIALITY NOTICE: This e-mail transmission, and any attachments, is intended only for the use of PaperTrl Inc. or recipient named above and may contain information that is confidential, privileged and exempt from disclosure under applicable law. If you are not the intended recipient or authorized to receive this message for the recipient, you must not use, copy, disclose or take any action based on this message or any information herein. If you have received this message in error, please advise the sender immediately.</span><span style=\"font-size:8.0pt;color:#014708\"></span></p> <p><span style=\"font-size:18.0pt;font-family:Webdings;color:green\">P</span><span style=\"color:black\"> </span><span style=\"font-size:10.0pt;font-family:&quot;Helvetica&quot;,sans-serif;color:green\">Be Environmentally Responsible. Please don\'t print this e-mail unless you really need to.</span><u></u><u></u></p> </td> \n    </tr> \n    <tr> \n     <td></td> \n    </tr> \n    <tr> \n     <td></td> \n    </tr> \n   </tbody>\n  </table>   \n </body>\n</html>', 'carijiv438@1092df.com', null, 'Y', '1', 'admin', '2021-01-08 08:26:44', null, null, null, null);
INSERT INTO `common_email_mst` VALUES ('3', 'New PaperTrl trial has been begun', '<html>\n <head> \n  <meta charset=\"UTF-8\"> \n  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\"> \n </head> \n <body> \n  <table style=\"color: #207580;\"> \n   <tbody>\n    <tr> \n     <td style=\"font-weight: bold\">Dear customer support team,</td> \n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr style=\"margin-left: 250px\"> \n     <td>New customer has been registered to a trial.</td> \n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr> \n     <td> \n      <table style=\"color: #207580;\"> \n       <tbody>\n        <tr>\n         <td><span style=\"font-weight: bold\">Full name</span></td>\n         <td>:</td>\n         <td><span id=\"PAREM_TRIAL_USER\">avishka perera</span></td>\n        </tr> \n        <tr>\n         <td><span style=\"font-weight: bold\">Email</span></td>\n         <td>:</td>\n         <td><span style=\"text-decoration: underline\" id=\"PAREM_TRIAL_USER_EMAIL\">carijiv438@1092df.com</span></td>\n        </tr> \n        <tr>\n         <td><span style=\"font-weight: bold\">Company name</span></td>\n         <td>:</td>\n         <td><span id=\"PAREM_TRIAL_USER_COMPANY\">20210108</span></td>\n        </tr> \n       </tbody>\n      </table> </td> \n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr style=\"margin-top: 65px\"> \n     <td> <span style=\"font-weight: bold\">Thank You!</span> </td> \n    </tr> \n    <tr> \n     <td> <img style=\"width: 170px;height: 45px;\" src=\"https://papertrl.com/wp-content/uploads/2019/09/logo.png\"> </td> \n    </tr> \n    <tr> \n     <td>This email is an automated notification, Replies to this message will not be read or responded to. We\'re happy to help you with any questions or concerns you may have. Please contact us directly 24/7 via <span style=\"font-weight: bold\">support@papertrl.com</span> <p class=\"MsoNormal\"><span style=\"font-size:8.0pt;color:#207580\">CONFIDENTIALITY NOTICE: This e-mail transmission, and any attachments, is intended only for the use of PaperTrl Inc. or recipient named above and may contain information that is confidential, privileged and exempt from disclosure under applicable law. If you are not the intended recipient or authorized to receive this message for the recipient, you must not use, copy, disclose or take any action based on this message or any information herein. If you have received this message in error, please advise the sender immediately.</span><span style=\"font-size:8.0pt;color:#014708\"></span></p> <p><span style=\"font-size:18.0pt;font-family:Webdings;color:green\">P</span><span style=\"color:black\"> </span><span style=\"font-size:10.0pt;font-family:&quot;Helvetica&quot;,sans-serif;color:green\">Be Environmentally Responsible. Please don\'t print this e-mail unless you really need to.</span><u></u><u></u></p> </td> \n    </tr> \n   </tbody>\n  </table>  \n </body>\n</html>', 'avishka.p@papertrl.com', null, 'Y', '1', 'PAPERTRL_SYSTEM', '2021-01-08 08:26:44', null, null, null, null);
INSERT INTO `common_email_mst` VALUES ('4', 'Account URL', '<!doctype html>\n<!--\nTo change this license header, choose License Headers in Project Properties.\nTo change this template file, choose Tools | Templates\nand open the template in the editor.\n-->\n<html>\n <head> \n  <meta charset=\"UTF-8\"> \n  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\"> \n </head> \n <body> \n  <table style=\"color: #207580;\"> \n   <tbody>\n    <tr> \n     <td>Dear <span style=\"font-weight: bold\" id=\"EMAIL_SEND_TO\">avishka perera</span>,</td> \n    </tr> \n    <tr> \n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr style=\"margin-left: 250px\"> \n     <td>\n      <ul></ul>\n      <ul></ul>Your unique PaperTrl Account URL is <a id=\"PAPERTRL_URL\" href=\"https://qa-app153.papertrl.com\">https://qa-app153.papertrl.com</a> Please bookmark this page in your browser and save this email for future reference.</td> \n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr style=\"margin-top: 65px\"> \n     <td> <span style=\"font-weight: bold\">\n       <ul></ul>\n       <ul></ul>\n       <ul></ul>\n       <ul></ul>Thank You!</span> </td> \n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr style=\"margin-top: 65px\"> \n     <td> <span>The PaperTrl Team</span> </td> \n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr> \n     <td>Questions? Contact us anytime at <span style=\"font-weight: bold\"><a id=\"URL\" href=\"mailto:support@papertrl.com\">support@papertrl.com</a></span></td> \n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr>\n     <td></td>\n    </tr> \n    <tr> \n     <td> <img style=\"width: 170px;height: 45px;\" src=\"https://papertrl.com/wp-content/uploads/2019/09/logo.png\"> </td> \n    </tr> \n    <tr> \n     <td>This email is an automated notification, Replies to this message will not be read or responded to. We\'re happy to help you with any questions or concerns you may have. Please contact us directly 24/7 via <span style=\"font-weight: bold\">support@papertrl.com</span> <p class=\"MsoNormal\"><span style=\"font-size:8.0pt;color:#207580\">CONFIDENTIALITY NOTICE: This e-mail transmission, and any attachments, is intended only for the use of PaperTrl Inc. or recipient named above and may contain information that is confidential, privileged and exempt from disclosure under applicable law. If you are not the intended recipient or authorized to receive this message for the recipient, you must not use, copy, disclose or take any action based on this message or any information herein. If you have received this message in error, please advise the sender immediately.</span><span style=\"font-size:8.0pt;color:#014708\"></span></p> <p><span style=\"font-size:18.0pt;font-family:Webdings;color:green\">P</span><span style=\"color:black\"> </span><span style=\"font-size:10.0pt;font-family:&quot;Helvetica&quot;,sans-serif;color:green\">Be Environmentally Responsible. Please don\'t print this e-mail unless you really need to.</span><u></u><u></u></p> </td> \n    </tr> \n    <tr> \n     <td></td> \n    </tr> \n    <tr> \n     <td></td> \n    </tr> \n   </tbody>\n  </table>  \n </body>\n</html>', 'carijiv438@1092df.com', null, 'Y', '1', 'PAPERTRL_SYSTEM', '2021-01-08 08:31:00', null, null, null, null);

-- ----------------------------
-- Table structure for common_email_privilege
-- ----------------------------
DROP TABLE IF EXISTS `common_email_privilege`;
CREATE TABLE `common_email_privilege` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_privilage_id` int(11) DEFAULT NULL,
  `email_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of common_email_privilege
-- ----------------------------
INSERT INTO `common_email_privilege` VALUES ('1', '151', '4');
INSERT INTO `common_email_privilege` VALUES ('2', '151', '5');
INSERT INTO `common_email_privilege` VALUES ('3', '160', '6');
INSERT INTO `common_email_privilege` VALUES ('4', '161', '6');
INSERT INTO `common_email_privilege` VALUES ('5', '170', '6');
INSERT INTO `common_email_privilege` VALUES ('6', '119', '7');
INSERT INTO `common_email_privilege` VALUES ('7', '119', '8');
INSERT INTO `common_email_privilege` VALUES ('8', '139', '9');
INSERT INTO `common_email_privilege` VALUES ('9', '140', '9');
INSERT INTO `common_email_privilege` VALUES ('10', '150', '9');
INSERT INTO `common_email_privilege` VALUES ('11', '26', '1');
INSERT INTO `common_email_privilege` VALUES ('12', '26', '2');
INSERT INTO `common_email_privilege` VALUES ('13', '55', '1');
INSERT INTO `common_email_privilege` VALUES ('14', '55', '2');
INSERT INTO `common_email_privilege` VALUES ('15', '29', '3');
INSERT INTO `common_email_privilege` VALUES ('16', '30', '3');
INSERT INTO `common_email_privilege` VALUES ('18', '172', '3');

-- ----------------------------
-- Table structure for common_email_tmp
-- ----------------------------
DROP TABLE IF EXISTS `common_email_tmp`;
CREATE TABLE `common_email_tmp` (
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

-- ----------------------------
-- Records of common_email_tmp
-- ----------------------------

-- ----------------------------
-- Table structure for common_email_type
-- ----------------------------
DROP TABLE IF EXISTS `common_email_type`;
CREATE TABLE `common_email_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email_service` varchar(255) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of common_email_type
-- ----------------------------
INSERT INTO `common_email_type` VALUES ('1', 'Invoice has approved');
INSERT INTO `common_email_type` VALUES ('2', 'Invoice has rejected');
INSERT INTO `common_email_type` VALUES ('3', 'Invoice submitted for approval');
INSERT INTO `common_email_type` VALUES ('4', 'Purchase Order has approved');
INSERT INTO `common_email_type` VALUES ('5', 'Purchase Order has rejected');
INSERT INTO `common_email_type` VALUES ('6', 'Purchase Order submitted for approval');
INSERT INTO `common_email_type` VALUES ('7', 'Expense has approved');
INSERT INTO `common_email_type` VALUES ('8', 'Expense has rejected');
INSERT INTO `common_email_type` VALUES ('9', 'Expense submitted for approval');

-- ----------------------------
-- Table structure for common_employee
-- ----------------------------
DROP TABLE IF EXISTS `common_employee`;
CREATE TABLE `common_employee` (
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

-- ----------------------------
-- Records of common_employee
-- ----------------------------

-- ----------------------------
-- Table structure for common_employee_import_issue
-- ----------------------------
DROP TABLE IF EXISTS `common_employee_import_issue`;
CREATE TABLE `common_employee_import_issue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `import_mst_id` int(11) NOT NULL,
  `record` text DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL,
  `line_no` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_IMPORT_MST5` (`import_mst_id`),
  CONSTRAINT `FK_IMPORT_MST5` FOREIGN KEY (`import_mst_id`) REFERENCES `common_employee_import_mst` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of common_employee_import_issue
-- ----------------------------

-- ----------------------------
-- Table structure for common_employee_import_mst
-- ----------------------------
DROP TABLE IF EXISTS `common_employee_import_mst`;
CREATE TABLE `common_employee_import_mst` (
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

-- ----------------------------
-- Records of common_employee_import_mst
-- ----------------------------

-- ----------------------------
-- Table structure for common_grid_column_template
-- ----------------------------
DROP TABLE IF EXISTS `common_grid_column_template`;
CREATE TABLE `common_grid_column_template` (
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
  PRIMARY KEY (`id`),
  KEY `TABLE_FK_2` (`grid_id`),
  KEY `DROP_DOWN_ID_FK_1` (`drop_down_id`),
  CONSTRAINT `DROP_DOWN_ID_FK_1` FOREIGN KEY (`drop_down_id`) REFERENCES `common_drop_down` (`id`),
  CONSTRAINT `TABLE_FK_2` FOREIGN KEY (`grid_id`) REFERENCES `common_grid_template` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=139 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of common_grid_column_template
-- ----------------------------
INSERT INTO `common_grid_column_template` VALUES ('8', '3', 'checkbox', null, '1', '0', '0', '0', '0', 'center', 'checkbox', '', '1', null);
INSERT INTO `common_grid_column_template` VALUES ('9', '3', 'action', 'Action', '1', '0', '0', '0', '0', 'center', 'actionButton', '', '2', null);
INSERT INTO `common_grid_column_template` VALUES ('10', '3', 'apgr.id', 'Approval Group ID', '1', '1', '1', '1', '1', 'left', 'input', 'Approval Group ID', '3', null);
INSERT INTO `common_grid_column_template` VALUES ('11', '3', 'apgr.name', 'Approval Group Name', '1', '1', '1', '1', '1', 'left', 'input', 'Approval Group Name', '4', null);
INSERT INTO `common_grid_column_template` VALUES ('12', '3', 'usm.name', 'Created By', '1', '1', '1', '1', '1', 'left', 'input', 'Created By', '5', null);
INSERT INTO `common_grid_column_template` VALUES ('13', '3', 'apgr.dateCreated', 'Create Date', '1', '1', '1', '1', '1', 'center', 'date', 'Create Date', '6', null);
INSERT INTO `common_grid_column_template` VALUES ('14', '3', 'apgr.status', 'Status', '1', '1', '1', '1', '1', 'center', 'dropdown', 'All', '7', null);
INSERT INTO `common_grid_column_template` VALUES ('15', '2', 'checkbox', null, '1', '0', '0', '0', '0', 'center', 'checkbox', '', '1', null);
INSERT INTO `common_grid_column_template` VALUES ('16', '2', 'action', 'Action', '1', '0', '0', '0', '0', 'center', 'actionButton', '', '2', null);
INSERT INTO `common_grid_column_template` VALUES ('17', '2', 'usm.email', 'Email Address', '1', '1', '1', '1', '1', 'left', 'input', 'Email Address', '3', null);
INSERT INTO `common_grid_column_template` VALUES ('18', '2', 'usm.name', 'Name', '1', '1', '1', '1', '1', 'left', 'input', 'Name', '4', null);
INSERT INTO `common_grid_column_template` VALUES ('19', '2', 'usm.nicPassportNo', 'Employee No', '1', '1', '1', '1', '1', 'left', 'input', 'Employee No', '5', null);
INSERT INTO `common_grid_column_template` VALUES ('20', '2', 'approvalGroup.approvalGroupId', 'Approval Groups', '1', '1', '1', '1', '1', 'left', 'dropdown', 'Approval Groups', '6', null);
INSERT INTO `common_grid_column_template` VALUES ('21', '2', 'rolem.id', 'Role', '1', '1', '1', '1', '1', 'left', 'dropdown', 'Role', '7', null);
INSERT INTO `common_grid_column_template` VALUES ('22', '2', 'usm.status', 'Status', '1', '1', '1', '1', '1', 'center', 'dropdown', 'All', '8', null);
INSERT INTO `common_grid_column_template` VALUES ('23', '4', 'checkbox', null, '1', '0', '0', '0', '0', 'center', 'checkbox', '', '1', null);
INSERT INTO `common_grid_column_template` VALUES ('24', '4', 'action', 'Action', '1', '0', '0', '0', '0', 'center', 'actionButton', '', '2', null);
INSERT INTO `common_grid_column_template` VALUES ('25', '4', 'acct.id', 'Account Type', '1', '1', '1', '1', '1', 'left', 'dropdown', 'Account Type', '3', null);
INSERT INTO `common_grid_column_template` VALUES ('26', '4', 'accdt.id', 'Account Detail Type', '1', '1', '1', '1', '1', 'left', 'dropdown', 'Account Detail Type', '4', null);
INSERT INTO `common_grid_column_template` VALUES ('27', '4', 'acc.number', 'Account No', '1', '1', '1', '1', '1', 'left', 'input', 'Account No', '5', null);
INSERT INTO `common_grid_column_template` VALUES ('28', '4', 'acc.name', 'Account Name', '1', '1', '1', '1', '1', 'left', 'input', 'Account Name', '6', null);
INSERT INTO `common_grid_column_template` VALUES ('29', '4', 'accParent.id', 'Parent Account', '1', '1', '1', '1', '1', 'left', 'dropdown', 'Parent Account', '7', null);
INSERT INTO `common_grid_column_template` VALUES ('30', '4', 'acc.status', 'Status', '1', '1', '1', '1', '1', 'center', 'dropdown', 'All', '8', null);
INSERT INTO `common_grid_column_template` VALUES ('31', '5', 'checkbox', null, '1', '0', '0', '0', '0', 'center', 'checkbox', '', '1', null);
INSERT INTO `common_grid_column_template` VALUES ('32', '5', 'action', 'Action', '1', '0', '0', '0', '0', 'center', 'actionButton', '', '2', null);
INSERT INTO `common_grid_column_template` VALUES ('33', '5', 'type.id', 'Item Type', '1', '1', '1', '1', '1', 'left', 'dropdown', 'Item Type', '3', null);
INSERT INTO `common_grid_column_template` VALUES ('34', '5', 'cat.id', 'Category', '1', '1', '1', '1', '1', 'left', 'dropdown', 'Category', '4', null);
INSERT INTO `common_grid_column_template` VALUES ('35', '5', 'item.itemNumber', 'Item No', '1', '1', '1', '1', '1', 'left', 'input', 'Item No', '5', null);
INSERT INTO `common_grid_column_template` VALUES ('36', '5', 'item.name', 'Item Name', '1', '1', '1', '1', '1', 'left', 'input', 'Item Name', '6', null);
INSERT INTO `common_grid_column_template` VALUES ('37', '5', 'item.taxable', 'Taxability', '1', '1', '1', '1', '1', 'center', 'dropdown', 'Taxability', '7', null);
INSERT INTO `common_grid_column_template` VALUES ('38', '5', 'item.salesPrice', 'Selling Price', '1', '1', '1', '1', '1', 'right', 'numeric', 'Selling Price', '8', null);
INSERT INTO `common_grid_column_template` VALUES ('39', '5', 'item.status', 'Status', '1', '1', '1', '1', '1', 'center', 'dropdown', 'All', '9', null);
INSERT INTO `common_grid_column_template` VALUES ('40', '6', 'checkbox', null, '1', '0', '0', '0', '0', 'center', 'checkbox', '', '1', null);
INSERT INTO `common_grid_column_template` VALUES ('41', '6', 'action', 'Action', '1', '0', '0', '0', '0', 'center', 'actionButton', '', '2', null);
INSERT INTO `common_grid_column_template` VALUES ('42', '6', 'tenant.tenantId', 'Tenant ID', '1', '1', '1', '1', '1', 'left', 'input', 'Tenant ID', '3', null);
INSERT INTO `common_grid_column_template` VALUES ('43', '6', 'tenant.ownerName', 'Company Name', '1', '1', '1', '1', '1', 'left', 'input', 'Company Name', '4', null);
INSERT INTO `common_grid_column_template` VALUES ('44', '6', 'tenant.ownerEmail', 'Email Address', '1', '1', '1', '1', '1', 'left', 'input', 'Email Address', '5', null);
INSERT INTO `common_grid_column_template` VALUES ('45', '6', 'tenant.status', 'Status', '1', '1', '1', '1', '1', 'center', 'dropdown', 'All', '6', null);
INSERT INTO `common_grid_column_template` VALUES ('46', '7', 'checkbox', null, '1', '0', '0', '0', '0', 'center', 'checkbox', '', '1', null);
INSERT INTO `common_grid_column_template` VALUES ('47', '7', 'action', 'Action', '1', '0', '0', '0', '0', 'center', 'actionButton', '', '2', null);
INSERT INTO `common_grid_column_template` VALUES ('48', '7', 'chk.paymentReferanceNo', 'Payment Ref.', '1', '1', '1', '1', '1', 'left', 'input', 'Payment Ref.', '3', null);
INSERT INTO `common_grid_column_template` VALUES ('49', '7', 'chk.amount', 'Amount', '1', '1', '1', '1', '1', 'right', 'input', 'Amount', '4', null);
INSERT INTO `common_grid_column_template` VALUES ('50', '7', 'chk.discountAmount', 'Discount Amount', '1', '1', '1', '1', '1', 'right', 'input', 'Discount Amount', '5', null);
INSERT INTO `common_grid_column_template` VALUES ('51', '7', 'chk.paymentDate', 'Date', '1', '1', '1', '1', '1', 'center', 'date', 'Date', '6', null);
INSERT INTO `common_grid_column_template` VALUES ('52', '7', 'vi.invoiceNo', 'Bill No', '1', '1', '1', '1', '1', 'left', 'input', 'Bill No.', '7', null);
INSERT INTO `common_grid_column_template` VALUES ('53', '7', 'vi.invoiceAmount', 'Bill Amount', '1', '1', '1', '1', '1', 'right', 'input', 'Bill Amount', '8', null);
INSERT INTO `common_grid_column_template` VALUES ('54', '7', 'vn.name', 'Vendor', '1', '1', '1', '1', '1', 'left', 'input', 'Vendor', '9', null);
INSERT INTO `common_grid_column_template` VALUES ('55', '7', 'vi.invoiceDate', 'Bill Date', '1', '1', '1', '1', '1', 'center', 'date', 'Bill Date', '10', null);
INSERT INTO `common_grid_column_template` VALUES ('56', '7', 'vi.dueDate', 'Due Date', '1', '1', '1', '1', '1', 'center', 'date', 'Due Date', '11', null);
INSERT INTO `common_grid_column_template` VALUES ('57', '7', 'chk.status', 'Status', '1', '1', '1', '1', '1', 'center', 'dropdown', 'All', '13', null);
INSERT INTO `common_grid_column_template` VALUES ('58', '8', 'checkbox', '', '1', '0', '0', '0', '0', 'center', 'checkbox', '', '1', null);
INSERT INTO `common_grid_column_template` VALUES ('59', '8', 'action', 'Action', '1', '0', '0', '1', '0', 'center', 'actionButton', '', '2', null);
INSERT INTO `common_grid_column_template` VALUES ('60', '8', 'vendor.vendorName', 'Vendor Name', '1', '1', '1', '1', '1', 'left', 'input', 'Vendor Name', '3', null);
INSERT INTO `common_grid_column_template` VALUES ('61', '8', 'vendor.email', 'Contact Email', '1', '1', '1', '1', '1', 'left', 'input', 'Contact Email', '4', null);
INSERT INTO `common_grid_column_template` VALUES ('62', '8', 'vendor.contactPerson', 'Contact Name', '1', '1', '1', '1', '1', 'left', 'input', 'Contact Name', '5', null);
INSERT INTO `common_grid_column_template` VALUES ('63', '8', 'vendor.contactNumber', 'Contact Phone', '1', '1', '1', '1', '1', 'left', 'input', 'Contact Phone', '6', null);
INSERT INTO `common_grid_column_template` VALUES ('64', '8', 'addr.country', 'Country', '1', '1', '1', '1', '1', 'left', 'dropdown', 'All', '7', null);
INSERT INTO `common_grid_column_template` VALUES ('65', '8', 'vendor.socialSecNo', 'Social Security No', '1', '1', '1', '1', '1', 'left', 'input', 'Social Security No', '8', null);
INSERT INTO `common_grid_column_template` VALUES ('66', '8', 'sic.code', 'SIC Code', '1', '1', '1', '1', '1', 'left', 'input', 'SIC Code', '9', null);
INSERT INTO `common_grid_column_template` VALUES ('67', '8', 'naic.code', 'NAIC Code', '1', '1', '1', '1', '1', 'left', 'input', 'NAIC Code', '10', null);
INSERT INTO `common_grid_column_template` VALUES ('68', '9', 'checkbox', '', '1', '0', '0', '0', '0', 'center', 'checkbox', '', '1', null);
INSERT INTO `common_grid_column_template` VALUES ('69', '9', 'action', 'Action', '1', '0', '0', '1', '0', 'center', 'actionButton', '', '2', null);
INSERT INTO `common_grid_column_template` VALUES ('70', '9', 'req.vendorName', 'Vendor Name', '1', '1', '1', '1', '1', 'left', 'input', 'Vendor Name', '3', null);
INSERT INTO `common_grid_column_template` VALUES ('71', '9', 'req.contactPerson', 'Contact Name', '1', '1', '1', '1', '1', 'left', 'input', 'Contact Name', '4', null);
INSERT INTO `common_grid_column_template` VALUES ('72', '9', 'req.contactNumber', 'Contact Number', '1', '1', '1', '1', '1', 'left', 'input', 'Contact Number', '5', null);
INSERT INTO `common_grid_column_template` VALUES ('73', '9', 'req.contactNumber', 'Email Address', '1', '1', '1', '1', '1', 'left', 'input', 'Email Address', '6', null);
INSERT INTO `common_grid_column_template` VALUES ('74', '9', 'req.requestOn', 'Request Date', '1', '1', '1', '1', '1', 'center', 'input', 'Request Date', '7', null);
INSERT INTO `common_grid_column_template` VALUES ('75', '9', 'req.status', 'Status', '1', '1', '1', '1', '1', 'center', 'dropdown', 'Status', '8', null);
INSERT INTO `common_grid_column_template` VALUES ('76', '10', 'checkbox', null, '1', '0', '0', '0', '0', 'center', 'checkbox', '', '1', null);
INSERT INTO `common_grid_column_template` VALUES ('77', '10', 'action', 'Action', '1', '0', '0', '0', '0', 'center', 'actionButton', '', '2', null);
INSERT INTO `common_grid_column_template` VALUES ('78', '10', 'appCode.name', 'Project Code', '1', '1', '1', '1', '1', 'left', 'input', 'Project Code', '3', null);
INSERT INTO `common_grid_column_template` VALUES ('79', '10', 'parent.name', 'Parent Project', '1', '1', '1', '1', '1', 'left', 'input', 'Parent Project', '4', null);
INSERT INTO `common_grid_column_template` VALUES ('80', '10', 'appCode.createdOn', 'Create Date', '1', '1', '1', '1', '1', 'center', 'date', 'Create Date', '5', null);
INSERT INTO `common_grid_column_template` VALUES ('81', '10', 'usm.name', 'Created By', '1', '1', '1', '1', '1', 'left', 'input', 'Created By', '6', null);
INSERT INTO `common_grid_column_template` VALUES ('82', '10', 'appCode.status', 'Status', '1', '1', '1', '1', '1', 'center', 'dropdown', 'All', '7', null);
INSERT INTO `common_grid_column_template` VALUES ('83', '7', 'po.poNumber', 'PO No', '1', '1', '1', '1', '1', 'left', 'input', 'PO No', '12', null);
INSERT INTO `common_grid_column_template` VALUES ('84', '11', 'action', 'Action', '1', '0', '1', '1', '0', 'center', 'actionButton', '', '1', null);
INSERT INTO `common_grid_column_template` VALUES ('85', '11', 'field.moduleId', 'Document Type', '1', '1', '1', '1', '1', 'left', 'dropdown', 'Document Type', '2', null);
INSERT INTO `common_grid_column_template` VALUES ('86', '11', 'field.fieldName', 'Field Name', '1', '1', '1', '1', '1', 'center', 'input', 'Field Name', '3', null);
INSERT INTO `common_grid_column_template` VALUES ('87', '11', 'field.fieldId', 'Field Type', '1', '1', '1', '1', '1', 'center', 'dropdown', 'Field Type', '4', null);
INSERT INTO `common_grid_column_template` VALUES ('88', '11', 'field.required', 'Required Status', '1', '1', '1', '1', '1', 'center', 'dropdown', 'All', '5', null);
INSERT INTO `common_grid_column_template` VALUES ('89', '11', 'field.status', 'Active Status', '1', '1', '1', '1', '1', 'center', 'dropdown', 'All', '6', null);
INSERT INTO `common_grid_column_template` VALUES ('90', '1', 'checkbox', null, '1', '0', '0', '0', '0', 'center', 'checkbox', '', '1', null);
INSERT INTO `common_grid_column_template` VALUES ('91', '1', 'action', 'Action', '1', '0', '1', '1', '0', 'center', 'actionButton', '', '2', null);
INSERT INTO `common_grid_column_template` VALUES ('92', '1', 'rolem.id', 'Role ID', '1', '1', '1', '1', '1', 'left', 'number', 'Role ID', '3', null);
INSERT INTO `common_grid_column_template` VALUES ('93', '1', 'rolem.name', 'Role Name', '1', '1', '1', '1', '1', 'left', 'input', 'Role Name', '4', null);
INSERT INTO `common_grid_column_template` VALUES ('94', '1', 'rolem.createdUser', 'Created By', '1', '1', '1', '1', '1', 'left', 'input', 'Created By', '5', null);
INSERT INTO `common_grid_column_template` VALUES ('95', '1', 'rolem.dateCreated', 'Create Date', '1', '1', '1', '1', '1', 'left', 'date', 'Create Date', '6', null);
INSERT INTO `common_grid_column_template` VALUES ('96', '1', 'rolem.status', 'Status', '1', '1', '1', '1', '1', 'center', 'dropdown', 'All', '7', '1');
INSERT INTO `common_grid_column_template` VALUES ('97', '12', 'checkbox', '', '1', '0', '0', '0', '0', 'center', 'checkbox', '', '1', null);
INSERT INTO `common_grid_column_template` VALUES ('98', '12', 'action', 'Action', '1', '0', '1', '1', '0', 'center', 'actionButton', '', '2', null);
INSERT INTO `common_grid_column_template` VALUES ('99', '12', 'aut.name', 'Name', '1', '1', '1', '1', '1', 'left', 'input', 'Name', '3', null);
INSERT INTO `common_grid_column_template` VALUES ('100', '12', 'configDoc.documentTypeId', 'Document Type', '1', '1', '1', '1', '1', 'left', 'dropdown', 'Document Type', '4', null);
INSERT INTO `common_grid_column_template` VALUES ('101', '12', 'configDoc.eventId', 'Event', '1', '1', '1', '1', '1', 'left', 'dropdown', 'Event', '5', null);
INSERT INTO `common_grid_column_template` VALUES ('102', '12', 'aut.createdBy', 'Created By', '1', '1', '1', '1', '1', 'left', 'input', 'Created By', '6', null);
INSERT INTO `common_grid_column_template` VALUES ('103', '12', 'aut.createdDate', 'Create Date', '1', '1', '1', '1', '1', 'center', 'date', 'Create Date', '7', null);
INSERT INTO `common_grid_column_template` VALUES ('104', '12', 'aut.staus', 'Status', '1', '1', '1', '1', '1', 'center', 'dropdown', 'All', '8', null);
INSERT INTO `common_grid_column_template` VALUES ('105', '13', 'checkbox', null, '1', '0', '0', '0', '0', 'center', 'checkbox', '', '1', null);
INSERT INTO `common_grid_column_template` VALUES ('106', '13', 'action', 'Action', '1', '0', '0', '0', '0', 'center', 'actionButton', '', '2', null);
INSERT INTO `common_grid_column_template` VALUES ('107', '13', 'po.vendorId', 'Vendor', '1', '1', '1', '1', '1', 'center', 'dropdown', 'Vendor', '3', null);
INSERT INTO `common_grid_column_template` VALUES ('108', '13', 'po.poNumber', 'PO Number', '1', '1', '1', '1', '1', 'center', 'input', 'PO Number', '4', null);
INSERT INTO `common_grid_column_template` VALUES ('109', '13', 'po.projectCodeId', 'Project / Task', '1', '1', '1', '1', '1', 'center', 'dropdown', 'Project / Task', '5', null);
INSERT INTO `common_grid_column_template` VALUES ('110', '13', 'po.netAmount', 'Amount', '1', '1', '1', '1', '1', 'right', 'numeric', 'Amount', '6', null);
INSERT INTO `common_grid_column_template` VALUES ('111', '13', 'po.poDate', 'PO Date', '1', '1', '1', '1', '1', 'center', 'date', 'PO Date', '7', null);
INSERT INTO `common_grid_column_template` VALUES ('112', '13', 'po.deliveryDate', 'Delivery Date', '1', '1', '1', '1', '1', 'center', 'date', 'Delivery Date', '8', null);
INSERT INTO `common_grid_column_template` VALUES ('113', '13', 'po.createdBy', 'Submited By', '1', '1', '1', '1', '1', 'center', 'input', 'Submited By', '9', null);
INSERT INTO `common_grid_column_template` VALUES ('114', '13', 'po.createdOn', 'Submited Date', '1', '1', '1', '1', '1', 'center', 'date', 'Submited Date', '10', null);
INSERT INTO `common_grid_column_template` VALUES ('115', '13', 'po.status', 'Internal Approval Status', '1', '1', '1', '1', '1', 'center', 'dropdown', 'Internal Approval Status', '11', null);
INSERT INTO `common_grid_column_template` VALUES ('116', '13', 'po.vendorApprovalStatus', 'Vendor Approval Status', '1', '1', '1', '1', '1', 'center', 'dropdown', 'Vendor Approval Status', '12', null);
INSERT INTO `common_grid_column_template` VALUES ('117', '14', 'checkbox', '', '1', '0', '0', '0', '0', 'center', 'checkbox', '', '1', null);
INSERT INTO `common_grid_column_template` VALUES ('118', '14', 'action', 'Action', '1', '0', '1', '1', '0', 'center', 'actionButton', '', '2', null);
INSERT INTO `common_grid_column_template` VALUES ('119', '14', 'vendor.id', 'Vendor', '1', '1', '1', '1', '1', 'left', 'dropdown', 'Vendor', '3', null);
INSERT INTO `common_grid_column_template` VALUES ('120', '14', 'bill.billNo', 'Bill Number', '1', '1', '1', '1', '1', 'left', 'input', 'Bill Number', '4', null);
INSERT INTO `common_grid_column_template` VALUES ('122', '14', 'bill.billDate', 'Bill Date', '1', '1', '1', '1', '1', 'center', 'date', 'Bill Date', '5', null);
INSERT INTO `common_grid_column_template` VALUES ('123', '14', 'bill.billAmount', 'Amount', '1', '1', '1', '1', '1', 'right', 'numeric', 'Amount', '6', null);
INSERT INTO `common_grid_column_template` VALUES ('124', '14', 'term.id', 'Term', '1', '1', '1', '1', '1', 'left', 'dropdown', 'Term', '7', null);
INSERT INTO `common_grid_column_template` VALUES ('125', '14', 'bill.dueDate', 'Due Date', '1', '1', '1', '1', '1', 'center', 'date', 'Due Date', '8', null);
INSERT INTO `common_grid_column_template` VALUES ('126', '14', 'po.id', 'Purchase Order', '1', '1', '1', '1', '1', 'left', 'dropdown', 'Purchase Order', '9', null);
INSERT INTO `common_grid_column_template` VALUES ('127', '14', 'receipt.id', 'Purchase Order Receipt', '1', '1', '1', '1', '1', 'left', 'dropdown', 'Purchase Order Receipt', '10', null);
INSERT INTO `common_grid_column_template` VALUES ('128', '14', 'bill.submittedBy', 'Submit By', '1', '1', '1', '1', '1', 'left', 'input', 'Submit By', '11', null);
INSERT INTO `common_grid_column_template` VALUES ('129', '14', 'bill.submittedOn', 'Submit Date', '1', '1', '1', '1', '1', 'center', 'date', 'Submit Date', '12', null);
INSERT INTO `common_grid_column_template` VALUES ('130', '14', 'bill.balanceAmount', 'Remaining Balance', '1', '1', '1', '1', '1', 'right', 'numeric', 'Remaining Balance', '13', null);
INSERT INTO `common_grid_column_template` VALUES ('131', '14', 'bill.discountAmount', 'Applied Discount', '1', '1', '1', '1', '1', 'right', 'numeric', 'Discount Amount', '14', null);
INSERT INTO `common_grid_column_template` VALUES ('132', '14', 'bill.approvalUser', 'Approval User', '1', '1', '1', '1', '1', 'left', 'input', 'Approval User', '15', null);
INSERT INTO `common_grid_column_template` VALUES ('133', '14', 'bill.approvedDate', 'Approve Date', '1', '1', '1', '1', '1', 'center', 'date', 'Approve Date', '16', null);
INSERT INTO `common_grid_column_template` VALUES ('134', '14', 'bill.status', 'Approval Status', '1', '1', '1', '1', '1', 'center', 'dropdown', 'Approval Status', '17', null);
INSERT INTO `common_grid_column_template` VALUES ('135', '14', 'bill.paymentStatus', 'Payment Status', '1', '1', '1', '1', '1', 'center', 'dropdown', 'Payment Status', '18', null);
INSERT INTO `common_grid_column_template` VALUES ('136', '14', 'bill.applicableDiscountAmount', 'Applicable Discount', '1', '1', '1', '1', '1', 'right', 'numeric', 'Applicable Discount', '19', null);
INSERT INTO `common_grid_column_template` VALUES ('137', '14', 'bill.discountApplicableDate', 'Discount Applicable Date', '1', '1', '1', '1', '1', 'center', 'date', 'Discount Applicable Date', '20', null);
INSERT INTO `common_grid_column_template` VALUES ('138', '14', 'bill.exportStatus', 'Export Status', '1', '1', '1', '1', '1', 'center', 'dropdown', 'Export Status', '21', null);

-- ----------------------------
-- Table structure for common_grid_column_user_wice
-- ----------------------------
DROP TABLE IF EXISTS `common_grid_column_user_wice`;
CREATE TABLE `common_grid_column_user_wice` (
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
  PRIMARY KEY (`id`),
  KEY `TABLE_FK_2` (`grid_id`),
  KEY `DROP_DOWN_ID_FK_2` (`drop_down_id`),
  CONSTRAINT `DROP_DOWN_ID_FK_2` FOREIGN KEY (`drop_down_id`) REFERENCES `common_drop_down` (`id`),
  CONSTRAINT `common_grid_column_user_wice_ibfk_1` FOREIGN KEY (`grid_id`) REFERENCES `common_grid_template` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of common_grid_column_user_wice
-- ----------------------------

-- ----------------------------
-- Table structure for common_grid_filter_template
-- ----------------------------
DROP TABLE IF EXISTS `common_grid_filter_template`;
CREATE TABLE `common_grid_filter_template` (
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

-- ----------------------------
-- Records of common_grid_filter_template
-- ----------------------------
INSERT INTO `common_grid_filter_template` VALUES ('1', '1', null, 'roleId', 'Role ID', 'input');
INSERT INTO `common_grid_filter_template` VALUES ('2', '1', null, 'roleName', 'Role Name', 'input');
INSERT INTO `common_grid_filter_template` VALUES ('3', '1', null, 'createdBy', 'Created By', 'input');
INSERT INTO `common_grid_filter_template` VALUES ('4', '1', null, 'createDate', 'Create Date', 'date');
INSERT INTO `common_grid_filter_template` VALUES ('5', '1', '1', 'status', 'Status', 'dropdown');
INSERT INTO `common_grid_filter_template` VALUES ('6', '3', null, 'apgr.id', 'Approval Group ID', 'input');
INSERT INTO `common_grid_filter_template` VALUES ('7', '3', null, 'apgr.name', 'Approval Group Name', 'input');
INSERT INTO `common_grid_filter_template` VALUES ('8', '3', null, 'usm.name', 'Created By', 'input');
INSERT INTO `common_grid_filter_template` VALUES ('9', '3', null, 'apgr.dateCreated', 'Create Date', 'date');
INSERT INTO `common_grid_filter_template` VALUES ('10', '3', '2', 'apgr.status', 'Status', 'dropdown');
INSERT INTO `common_grid_filter_template` VALUES ('11', '2', null, 'usm.email', 'Email Address', 'input');
INSERT INTO `common_grid_filter_template` VALUES ('12', '2', null, 'usm.name', 'Name', 'input');
INSERT INTO `common_grid_filter_template` VALUES ('13', '2', null, 'usm.nicPassportNo', 'Employee No', 'input');
INSERT INTO `common_grid_filter_template` VALUES ('14', '2', null, 'approvalGroups', 'Approval Groups', 'dropdown');
INSERT INTO `common_grid_filter_template` VALUES ('15', '2', null, 'rolem.name', 'Role', 'dropdown');
INSERT INTO `common_grid_filter_template` VALUES ('16', '2', '3', 'usm.status', 'Status', 'dropdown');
INSERT INTO `common_grid_filter_template` VALUES ('17', '4', null, 'acct.name', 'Account Type', 'dropdown');
INSERT INTO `common_grid_filter_template` VALUES ('18', '4', null, 'accdt.name', 'Account Detail Type', 'dropdown');
INSERT INTO `common_grid_filter_template` VALUES ('19', '4', null, 'acc.number', 'Account No', 'input');
INSERT INTO `common_grid_filter_template` VALUES ('20', '4', null, 'acc.name', 'Account Name', 'input');
INSERT INTO `common_grid_filter_template` VALUES ('21', '4', null, 'acc2.name', 'Parent Account', 'dropdown');
INSERT INTO `common_grid_filter_template` VALUES ('22', '4', '4', 'acc.status', 'Status', 'dropdown');
INSERT INTO `common_grid_filter_template` VALUES ('23', '5', null, 'type.name', 'Item Type', 'dropdown');
INSERT INTO `common_grid_filter_template` VALUES ('24', '5', null, 'cat.name', 'Category', 'input');
INSERT INTO `common_grid_filter_template` VALUES ('25', '5', null, 'item.itemNumber', 'Item No', 'input');
INSERT INTO `common_grid_filter_template` VALUES ('26', '5', null, 'item.name', 'Item Name', 'input');
INSERT INTO `common_grid_filter_template` VALUES ('27', '5', '6', 'item.taxable', 'Taxability', 'dropdown');
INSERT INTO `common_grid_filter_template` VALUES ('28', '5', null, 'item.salesPrice', 'Selling Price', 'input');
INSERT INTO `common_grid_filter_template` VALUES ('29', '5', '5', 'item.status', 'Status', 'dropdown');
INSERT INTO `common_grid_filter_template` VALUES ('30', '6', null, 'tenantId', 'Tenant ID', 'input');
INSERT INTO `common_grid_filter_template` VALUES ('31', '6', null, 'companyName', 'Company Name', 'input');
INSERT INTO `common_grid_filter_template` VALUES ('32', '6', null, 'emailAddress', 'Email Address', 'input');
INSERT INTO `common_grid_filter_template` VALUES ('33', '6', '7', 'status', 'Status', 'dropdown');
INSERT INTO `common_grid_filter_template` VALUES ('34', '7', null, 'chk.paymentReferanceNo', 'Payment Ref', 'input');
INSERT INTO `common_grid_filter_template` VALUES ('35', '7', null, 'chk.amount', 'Amount', 'input');
INSERT INTO `common_grid_filter_template` VALUES ('36', '7', null, 'chk.discountAmount', 'Bill Amount', 'input');
INSERT INTO `common_grid_filter_template` VALUES ('37', '7', null, 'chk.paymentDate', 'Date', 'date');
INSERT INTO `common_grid_filter_template` VALUES ('38', '7', null, 'vi.invoiceNo', 'Bill No', 'input');
INSERT INTO `common_grid_filter_template` VALUES ('39', '7', null, 'vi.invoiceAmount', 'Bill Amount', 'input');
INSERT INTO `common_grid_filter_template` VALUES ('40', '7', null, 'vn.name', 'Vendor', 'input');
INSERT INTO `common_grid_filter_template` VALUES ('41', '7', null, 'vi.invoiceDate', 'Bill Date', 'date');
INSERT INTO `common_grid_filter_template` VALUES ('42', '7', null, 'vi.dueDate', 'Due Date', 'date');
INSERT INTO `common_grid_filter_template` VALUES ('43', '7', '8', 'chk.status', 'Status', 'dropdown');
INSERT INTO `common_grid_filter_template` VALUES ('44', '8', null, 'vendor.vendorName', 'Vendor Name', 'input');
INSERT INTO `common_grid_filter_template` VALUES ('45', '8', null, 'vendor.contactPerson', 'Contact Name', 'input');
INSERT INTO `common_grid_filter_template` VALUES ('46', '8', null, 'vendor.contactNumber', 'Contact No', 'input');
INSERT INTO `common_grid_filter_template` VALUES ('47', '8', null, 'vendor.email', 'Contact Email', 'input');
INSERT INTO `common_grid_filter_template` VALUES ('48', '9', null, 'req.vendorName', 'Vendor Name', 'input');
INSERT INTO `common_grid_filter_template` VALUES ('49', '9', null, 'req.contactPerson', 'Contact Name', 'input');
INSERT INTO `common_grid_filter_template` VALUES ('50', '9', null, 'req.contactNumber', 'Contact Number', 'input');
INSERT INTO `common_grid_filter_template` VALUES ('51', '9', null, 'req.vendorEmail', 'Email Address', 'input');
INSERT INTO `common_grid_filter_template` VALUES ('52', '9', null, 'req.status', 'Status', 'dropdown');
INSERT INTO `common_grid_filter_template` VALUES ('53', '7', null, 'po.poNumber', 'PO No', 'input');
INSERT INTO `common_grid_filter_template` VALUES ('54', '10', null, 'appCode.name', 'Project Code', 'input');
INSERT INTO `common_grid_filter_template` VALUES ('55', '10', null, 'parent.name', 'Parent Project', 'input');
INSERT INTO `common_grid_filter_template` VALUES ('56', '10', null, 'appCode.createdOn', 'Create Date', 'date');
INSERT INTO `common_grid_filter_template` VALUES ('57', '10', null, 'usm.name', 'Created By', 'input');
INSERT INTO `common_grid_filter_template` VALUES ('59', '10', '9', 'appCode.status', 'Status', 'dropdown');
INSERT INTO `common_grid_filter_template` VALUES ('60', '11', null, 'field.moduleId', 'Document Type', 'dropdown');
INSERT INTO `common_grid_filter_template` VALUES ('61', '11', null, 'field.fieldName', 'Field Name', 'dropdown');
INSERT INTO `common_grid_filter_template` VALUES ('62', '11', null, 'field.fieldId', 'Field Type', 'dropdown');
INSERT INTO `common_grid_filter_template` VALUES ('63', '11', '10', 'field.required', 'Required Status', 'dropdown');
INSERT INTO `common_grid_filter_template` VALUES ('64', '11', '11', 'field.status', 'Active Status', 'dropdown');
INSERT INTO `common_grid_filter_template` VALUES ('65', '12', null, 'aut.name', 'Name', 'input');
INSERT INTO `common_grid_filter_template` VALUES ('66', '12', null, 'configDoc.documentTypeId', 'Document Type', 'dropdown');
INSERT INTO `common_grid_filter_template` VALUES ('67', '12', null, 'configDoc.eventId', 'Event', 'dropdown');
INSERT INTO `common_grid_filter_template` VALUES ('68', '12', null, 'aut.createdBy', 'Created By', 'input');
INSERT INTO `common_grid_filter_template` VALUES ('69', '12', null, 'aut.createdDate', 'Created Date', 'date');
INSERT INTO `common_grid_filter_template` VALUES ('71', '12', '1', 'aut.staus', 'Status', 'dropdown');
INSERT INTO `common_grid_filter_template` VALUES ('72', '13', null, 'vendorId', 'Vendor', 'dropdown');
INSERT INTO `common_grid_filter_template` VALUES ('73', '13', null, 'poNumber', 'PO Number', 'input');
INSERT INTO `common_grid_filter_template` VALUES ('74', '13', null, 'projectCodeId', 'Project / Task', 'dropdown');
INSERT INTO `common_grid_filter_template` VALUES ('75', '13', null, 'netAmount', 'Amount', 'numeric');
INSERT INTO `common_grid_filter_template` VALUES ('76', '13', null, 'poDate', 'PO Date', 'date');
INSERT INTO `common_grid_filter_template` VALUES ('77', '13', null, 'deliveryDate', 'Delivery Date', 'date');
INSERT INTO `common_grid_filter_template` VALUES ('78', '13', null, 'createdBy', 'Submited By', 'input');
INSERT INTO `common_grid_filter_template` VALUES ('79', '13', null, 'createdOn', 'Submited Date', 'input');
INSERT INTO `common_grid_filter_template` VALUES ('80', '13', '2', 'status', 'Internal Approval Status', 'dropdown');
INSERT INTO `common_grid_filter_template` VALUES ('81', '13', '3', 'vendorApprovalStatus', 'Vendor Approval Status', 'dropdown');

-- ----------------------------
-- Table structure for common_grid_state_template
-- ----------------------------
DROP TABLE IF EXISTS `common_grid_state_template`;
CREATE TABLE `common_grid_state_template` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `grid_id` int(11) NOT NULL,
  `start_from` int(8) DEFAULT 0,
  `total_rows` int(8) DEFAULT 10,
  `column_widths` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1_TABLE_ID` (`grid_id`),
  CONSTRAINT `FK1_TABLE_ID` FOREIGN KEY (`grid_id`) REFERENCES `common_grid_template` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of common_grid_state_template
-- ----------------------------
INSERT INTO `common_grid_state_template` VALUES ('1', '1', '0', '15', '50,100,307,307,307,307,307');
INSERT INTO `common_grid_state_template` VALUES ('2', '3', '0', '15', '50,100,306,306,306,307,307');
INSERT INTO `common_grid_state_template` VALUES ('3', '2', '0', '15', '50,100,255,268,246,256,256,256');
INSERT INTO `common_grid_state_template` VALUES ('4', '4', '0', '15', '50,102,257,257,257,257,257,257');
INSERT INTO `common_grid_state_template` VALUES ('5', '5', '0', '15', '50,100,220,218,214,218,218,219,219');
INSERT INTO `common_grid_state_template` VALUES ('6', '6', '0', '15', '50,50,100,100,100,100');
INSERT INTO `common_grid_state_template` VALUES ('7', '7', '0', '15', '50,100,154,155,155,155,155,155,155');
INSERT INTO `common_grid_state_template` VALUES ('8', '8', '0', '15', '50,100,210,210,210,200,200,200,200,200');
INSERT INTO `common_grid_state_template` VALUES ('9', '9', '0', '15', '50,100,180,180,180,181,181,181');
INSERT INTO `common_grid_state_template` VALUES ('10', '10', '0', '15', '50,100,305,305,305,305,305');
INSERT INTO `common_grid_state_template` VALUES ('11', '11', '0', '15', '100,220,218,214,218,218');
INSERT INTO `common_grid_state_template` VALUES ('12', '12', '0', '15', '58,147,147,147,147,147,147,147');
INSERT INTO `common_grid_state_template` VALUES ('13', '13', '0', '15', '50,100,220,218,214,218,218,219,219,219,219,219');
INSERT INTO `common_grid_state_template` VALUES ('14', '14', '0', '15', '51,126,200,200,200,200,200,200,200,200,200,200,200,200,200');

-- ----------------------------
-- Table structure for common_grid_state_user_wice
-- ----------------------------
DROP TABLE IF EXISTS `common_grid_state_user_wice`;
CREATE TABLE `common_grid_state_user_wice` (
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

-- ----------------------------
-- Records of common_grid_state_user_wice
-- ----------------------------

-- ----------------------------
-- Table structure for common_grid_template
-- ----------------------------
DROP TABLE IF EXISTS `common_grid_template`;
CREATE TABLE `common_grid_template` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `grid_name` varchar(100) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of common_grid_template
-- ----------------------------
INSERT INTO `common_grid_template` VALUES ('1', 'ROLE_LIST');
INSERT INTO `common_grid_template` VALUES ('2', 'USER_LIST');
INSERT INTO `common_grid_template` VALUES ('3', 'APPROVAL_GROUP_LIST');
INSERT INTO `common_grid_template` VALUES ('4', 'ACCOUNT_LIST');
INSERT INTO `common_grid_template` VALUES ('5', 'ITEM_LIST');
INSERT INTO `common_grid_template` VALUES ('6', 'SUB_ACCOUNT_LIST');
INSERT INTO `common_grid_template` VALUES ('7', 'BILL_PAYMENT_LIST');
INSERT INTO `common_grid_template` VALUES ('8', 'COMMUNITY_VENDOR_LIST');
INSERT INTO `common_grid_template` VALUES ('9', 'VENDOR_REQUEST_LIST');
INSERT INTO `common_grid_template` VALUES ('10', 'PROJECT_CODE_LIST');
INSERT INTO `common_grid_template` VALUES ('11', 'ADDITIONAL_FIELD_LIST');
INSERT INTO `common_grid_template` VALUES ('12', 'AUTOMATION_LIST');
INSERT INTO `common_grid_template` VALUES ('13', 'PO_LIST');
INSERT INTO `common_grid_template` VALUES ('14', 'BILL_LIST');

-- ----------------------------
-- Table structure for common_integration_error
-- ----------------------------
DROP TABLE IF EXISTS `common_integration_error`;
CREATE TABLE `common_integration_error` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `error_code` varchar(200) DEFAULT NULL,
  `error_message` text DEFAULT NULL,
  `error_detail` varchar(255) DEFAULT NULL,
  `date_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of common_integration_error
-- ----------------------------

-- ----------------------------
-- Table structure for common_integration_failed_record
-- ----------------------------
DROP TABLE IF EXISTS `common_integration_failed_record`;
CREATE TABLE `common_integration_failed_record` (
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

-- ----------------------------
-- Records of common_integration_failed_record
-- ----------------------------

-- ----------------------------
-- Table structure for common_integration_id_connection
-- ----------------------------
DROP TABLE IF EXISTS `common_integration_id_connection`;
CREATE TABLE `common_integration_id_connection` (
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

-- ----------------------------
-- Records of common_integration_id_connection
-- ----------------------------

-- ----------------------------
-- Table structure for common_integration_incomplete_record
-- ----------------------------
DROP TABLE IF EXISTS `common_integration_incomplete_record`;
CREATE TABLE `common_integration_incomplete_record` (
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

-- ----------------------------
-- Records of common_integration_incomplete_record
-- ----------------------------

-- ----------------------------
-- Table structure for common_integration_service
-- ----------------------------
DROP TABLE IF EXISTS `common_integration_service`;
CREATE TABLE `common_integration_service` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `status` char(1) DEFAULT NULL,
  `service_type` int(5) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of common_integration_service
-- ----------------------------
INSERT INTO `common_integration_service` VALUES ('1', 'Push account', 'A', '1');
INSERT INTO `common_integration_service` VALUES ('2', 'Pull account', 'A', '2');
INSERT INTO `common_integration_service` VALUES ('3', 'Pull uom', 'A', '2');
INSERT INTO `common_integration_service` VALUES ('4', 'Push uom', 'A', '1');
INSERT INTO `common_integration_service` VALUES ('5', 'Push item', 'A', '1');
INSERT INTO `common_integration_service` VALUES ('6', 'Pull item', 'A', '2');
INSERT INTO `common_integration_service` VALUES ('7', 'Push client', 'A', '1');
INSERT INTO `common_integration_service` VALUES ('8', 'Pull client', 'A', '2');
INSERT INTO `common_integration_service` VALUES ('9', 'Push term', 'A', '1');
INSERT INTO `common_integration_service` VALUES ('10', 'Pull term', 'A', '2');
INSERT INTO `common_integration_service` VALUES ('11', 'Push vendor', 'A', '1');
INSERT INTO `common_integration_service` VALUES ('12', 'Pull vendor', 'A', '2');
INSERT INTO `common_integration_service` VALUES ('13', 'Push purchase order', 'A', '1');
INSERT INTO `common_integration_service` VALUES ('14', 'Pull purchase order', 'A', '2');
INSERT INTO `common_integration_service` VALUES ('15', 'Push invoice', 'A', '1');
INSERT INTO `common_integration_service` VALUES ('16', 'Pull invoice', 'A', '2');
INSERT INTO `common_integration_service` VALUES ('17', 'Push purchase order receipt', 'A', '1');
INSERT INTO `common_integration_service` VALUES ('18', 'Pull purchase order receipt', 'A', '2');
INSERT INTO `common_integration_service` VALUES ('19', 'Push payment', 'A', '1');
INSERT INTO `common_integration_service` VALUES ('20', 'Pull payment', 'A', '2');
INSERT INTO `common_integration_service` VALUES ('21', 'Push deleted record', 'A', '1');
INSERT INTO `common_integration_service` VALUES ('22', 'Pull deleted record', 'A', '2');
INSERT INTO `common_integration_service` VALUES ('23', 'Push expense', 'A', '1');
INSERT INTO `common_integration_service` VALUES ('24', 'Pull item category', 'A', '2');
INSERT INTO `common_integration_service` VALUES ('25', 'Push item category', 'A', '1');

-- ----------------------------
-- Table structure for common_integration_service_dependency
-- ----------------------------
DROP TABLE IF EXISTS `common_integration_service_dependency`;
CREATE TABLE `common_integration_service_dependency` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `service_id` int(11) NOT NULL,
  `dependant_service_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of common_integration_service_dependency
-- ----------------------------
INSERT INTO `common_integration_service_dependency` VALUES ('1', '5', '1');
INSERT INTO `common_integration_service_dependency` VALUES ('2', '5', '4');
INSERT INTO `common_integration_service_dependency` VALUES ('3', '5', '11');
INSERT INTO `common_integration_service_dependency` VALUES ('4', '6', '2');
INSERT INTO `common_integration_service_dependency` VALUES ('5', '6', '3');
INSERT INTO `common_integration_service_dependency` VALUES ('6', '6', '12');
INSERT INTO `common_integration_service_dependency` VALUES ('24', '13', '5');
INSERT INTO `common_integration_service_dependency` VALUES ('25', '13', '11');
INSERT INTO `common_integration_service_dependency` VALUES ('26', '13', '7');
INSERT INTO `common_integration_service_dependency` VALUES ('27', '14', '6');
INSERT INTO `common_integration_service_dependency` VALUES ('28', '14', '12');
INSERT INTO `common_integration_service_dependency` VALUES ('29', '14', '8');
INSERT INTO `common_integration_service_dependency` VALUES ('30', '17', '13');
INSERT INTO `common_integration_service_dependency` VALUES ('31', '18', '14');
INSERT INTO `common_integration_service_dependency` VALUES ('32', '15', '1');
INSERT INTO `common_integration_service_dependency` VALUES ('33', '15', '11');
INSERT INTO `common_integration_service_dependency` VALUES ('34', '15', '5');
INSERT INTO `common_integration_service_dependency` VALUES ('35', '15', '7');
INSERT INTO `common_integration_service_dependency` VALUES ('36', '15', '13');
INSERT INTO `common_integration_service_dependency` VALUES ('37', '16', '2');
INSERT INTO `common_integration_service_dependency` VALUES ('38', '16', '6');
INSERT INTO `common_integration_service_dependency` VALUES ('39', '16', '8');
INSERT INTO `common_integration_service_dependency` VALUES ('40', '16', '12');
INSERT INTO `common_integration_service_dependency` VALUES ('41', '16', '14');
INSERT INTO `common_integration_service_dependency` VALUES ('42', '19', '11');
INSERT INTO `common_integration_service_dependency` VALUES ('43', '19', '15');
INSERT INTO `common_integration_service_dependency` VALUES ('44', '20', '12');
INSERT INTO `common_integration_service_dependency` VALUES ('45', '20', '16');
INSERT INTO `common_integration_service_dependency` VALUES ('46', '23', '1');
INSERT INTO `common_integration_service_dependency` VALUES ('47', '23', '11');
INSERT INTO `common_integration_service_dependency` VALUES ('48', '23', '5');
INSERT INTO `common_integration_service_dependency` VALUES ('49', '23', '7');
INSERT INTO `common_integration_service_dependency` VALUES ('51', '15', '9');
INSERT INTO `common_integration_service_dependency` VALUES ('52', '16', '10');
INSERT INTO `common_integration_service_dependency` VALUES ('53', '21', '1');
INSERT INTO `common_integration_service_dependency` VALUES ('54', '21', '5');
INSERT INTO `common_integration_service_dependency` VALUES ('55', '21', '7');
INSERT INTO `common_integration_service_dependency` VALUES ('56', '21', '11');
INSERT INTO `common_integration_service_dependency` VALUES ('57', '21', '13');
INSERT INTO `common_integration_service_dependency` VALUES ('58', '21', '15');
INSERT INTO `common_integration_service_dependency` VALUES ('59', '21', '17');
INSERT INTO `common_integration_service_dependency` VALUES ('60', '21', '19');
INSERT INTO `common_integration_service_dependency` VALUES ('61', '21', '23');
INSERT INTO `common_integration_service_dependency` VALUES ('62', '22', '2');
INSERT INTO `common_integration_service_dependency` VALUES ('63', '22', '6');
INSERT INTO `common_integration_service_dependency` VALUES ('64', '22', '8');
INSERT INTO `common_integration_service_dependency` VALUES ('65', '22', '12');
INSERT INTO `common_integration_service_dependency` VALUES ('66', '22', '14');
INSERT INTO `common_integration_service_dependency` VALUES ('67', '22', '16');
INSERT INTO `common_integration_service_dependency` VALUES ('68', '22', '18');
INSERT INTO `common_integration_service_dependency` VALUES ('69', '22', '20');
INSERT INTO `common_integration_service_dependency` VALUES ('70', '5', '25');
INSERT INTO `common_integration_service_dependency` VALUES ('71', '6', '24');

-- ----------------------------
-- Table structure for common_integration_service_status
-- ----------------------------
DROP TABLE IF EXISTS `common_integration_service_status`;
CREATE TABLE `common_integration_service_status` (
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

-- ----------------------------
-- Records of common_integration_service_status
-- ----------------------------

-- ----------------------------
-- Table structure for common_item_attachment
-- ----------------------------
DROP TABLE IF EXISTS `common_item_attachment`;
CREATE TABLE `common_item_attachment` (
  `id` int(15) NOT NULL AUTO_INCREMENT,
  `image_data` mediumblob NOT NULL DEFAULT '',
  `file_name` varchar(200) NOT NULL,
  `file_type` varchar(50) NOT NULL,
  `product_mst_id` int(15) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_common_product_attachment_common_product_mst` (`product_mst_id`),
  CONSTRAINT `FK_common_product_attachment_common_product_mst` FOREIGN KEY (`product_mst_id`) REFERENCES `common_item_mst` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of common_item_attachment
-- ----------------------------

-- ----------------------------
-- Table structure for common_item_category
-- ----------------------------
DROP TABLE IF EXISTS `common_item_category`;
CREATE TABLE `common_item_category` (
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

-- ----------------------------
-- Records of common_item_category
-- ----------------------------

-- ----------------------------
-- Table structure for common_item_import_issue
-- ----------------------------
DROP TABLE IF EXISTS `common_item_import_issue`;
CREATE TABLE `common_item_import_issue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `import_mst_id` int(11) NOT NULL,
  `recode` text DEFAULT NULL,
  `description` varchar(256) DEFAULT NULL,
  `line_no` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_common_product_import_issue_common_product_import_mst` (`import_mst_id`),
  CONSTRAINT `FK_common_product_import_issue_common_product_import_mst` FOREIGN KEY (`import_mst_id`) REFERENCES `common_item_import_mst` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of common_item_import_issue
-- ----------------------------

-- ----------------------------
-- Table structure for common_item_import_mst
-- ----------------------------
DROP TABLE IF EXISTS `common_item_import_mst`;
CREATE TABLE `common_item_import_mst` (
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

-- ----------------------------
-- Records of common_item_import_mst
-- ----------------------------

-- ----------------------------
-- Table structure for common_item_mst
-- ----------------------------
DROP TABLE IF EXISTS `common_item_mst`;
CREATE TABLE `common_item_mst` (
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

-- ----------------------------
-- Records of common_item_mst
-- ----------------------------

-- ----------------------------
-- Table structure for common_item_type
-- ----------------------------
DROP TABLE IF EXISTS `common_item_type`;
CREATE TABLE `common_item_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `description` varchar(200) NOT NULL,
  `status` char(1) NOT NULL,
  `icon` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of common_item_type
-- ----------------------------
INSERT INTO `common_item_type` VALUES ('1', 'Inventory', 'Product you buy and/or sell and that you track quantities of.', 'A', 'fa fa-shopping-basket');
INSERT INTO `common_item_type` VALUES ('2', 'Non-Inventory', 'Product you buy and/or sell but don\'t need to (or can\'t) track quantities of, for example, nuts and bolts used in an installation.', 'A', 'fa fa-archive');
INSERT INTO `common_item_type` VALUES ('3', 'Service', 'Service that you provide to customers, for example, landscaping or tax preparation service.', 'A', 'fa fa-taxi');
INSERT INTO `common_item_type` VALUES ('4', 'Other', 'Use for miscellaneous labor, material, or part charges, such as delivery charges, setup fees, and service charges.', 'A', 'fa fa-ellipsis-h');

-- ----------------------------
-- Table structure for common_message
-- ----------------------------
DROP TABLE IF EXISTS `common_message`;
CREATE TABLE `common_message` (
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

-- ----------------------------
-- Records of common_message
-- ----------------------------

-- ----------------------------
-- Table structure for common_object_sync_mst
-- ----------------------------
DROP TABLE IF EXISTS `common_object_sync_mst`;
CREATE TABLE `common_object_sync_mst` (
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

-- ----------------------------
-- Records of common_object_sync_mst
-- ----------------------------

-- ----------------------------
-- Table structure for common_outstanding_task
-- ----------------------------
DROP TABLE IF EXISTS `common_outstanding_task`;
CREATE TABLE `common_outstanding_task` (
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

-- ----------------------------
-- Records of common_outstanding_task
-- ----------------------------
INSERT INTO `common_outstanding_task` VALUES ('1', 'Bookmark this page', 'Please bookmark this page so you can easily access your unique PaperTrl Account URL', 'A', '/', 'admin', '2020-06-22 15:53:35', null, null, null, null);
INSERT INTO `common_outstanding_task` VALUES ('2', 'Complete your Company Profile', 'Go to Settings and complete your company information', 'A', '/home/support/package-change-request', 'admin', '2020-05-03 11:06:34', null, null, null, null);
INSERT INTO `common_outstanding_task` VALUES ('3', 'Create Users', 'Go to User Management to add new users', 'A', '/home/admin/user', 'admin', '2020-05-03 11:06:37', null, null, null, null);
INSERT INTO `common_outstanding_task` VALUES ('4', 'Create Codes', 'Go to Code Management to upload or create codes.These are the account codes used to classify your expenses.', 'A', '/home/ven-invoice/approval-code-management', 'admin', '2020-05-03 11:06:38', null, null, null, null);
INSERT INTO `common_outstanding_task` VALUES ('5', 'Create Vendors', 'Go to Vendor Management to upload or create vendors', 'A', '/home/vendor/management/vendor-management', 'admin', '2020-05-03 11:06:40', null, null, null, null);

-- ----------------------------
-- Table structure for common_payment_type
-- ----------------------------
DROP TABLE IF EXISTS `common_payment_type`;
CREATE TABLE `common_payment_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` char(1) NOT NULL,
  `Description` varchar(100) NOT NULL,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of common_payment_type
-- ----------------------------
INSERT INTO `common_payment_type` VALUES ('1', 'S', 'Cash', 'A');
INSERT INTO `common_payment_type` VALUES ('2', 'C', 'Check', 'A');
INSERT INTO `common_payment_type` VALUES ('3', 'D', 'Credit Card', 'A');
INSERT INTO `common_payment_type` VALUES ('4', 'A', 'ACH', 'A');
INSERT INTO `common_payment_type` VALUES ('5', 'E', 'EFT', 'A');
INSERT INTO `common_payment_type` VALUES ('6', 'W', 'Wire', 'A');
INSERT INTO `common_payment_type` VALUES ('7', 'M', 'Credit Memo', 'A');
INSERT INTO `common_payment_type` VALUES ('8', 'O', 'Other', 'A');

-- ----------------------------
-- Table structure for common_system_endpoint
-- ----------------------------
DROP TABLE IF EXISTS `common_system_endpoint`;
CREATE TABLE `common_system_endpoint` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `url_index` (`url`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of common_system_endpoint
-- ----------------------------
INSERT INTO `common_system_endpoint` VALUES ('32', '/common_service/load_data_grid');
INSERT INTO `common_system_endpoint` VALUES ('33', '/common_service/save_data_grid_state');
INSERT INTO `common_system_endpoint` VALUES ('41', '/common_service/sec_field_types');
INSERT INTO `common_system_endpoint` VALUES ('16', '/common_service/sec_get_approval_codes');
INSERT INTO `common_system_endpoint` VALUES ('9', '/common_service/sec_get_outstanding_task_list');
INSERT INTO `common_system_endpoint` VALUES ('40', '/common_service/sec_get_system_module_name_list');
INSERT INTO `common_system_endpoint` VALUES ('6', '/common_service/sec_view_approval_statuses');
INSERT INTO `common_system_endpoint` VALUES ('13', '/common_service/sec_view_dateformats');
INSERT INTO `common_system_endpoint` VALUES ('14', '/common_service/sec_view_payment_statuses');
INSERT INTO `common_system_endpoint` VALUES ('27', '/error');
INSERT INTO `common_system_endpoint` VALUES ('10', '/message_service/get_user_list');
INSERT INTO `common_system_endpoint` VALUES ('7', '/message_service/sec_get_user_notification');
INSERT INTO `common_system_endpoint` VALUES ('5', '/report_service/sec_get_bar_chart_data');
INSERT INTO `common_system_endpoint` VALUES ('11', '/report_service/sec_get_pie_chart_data');
INSERT INTO `common_system_endpoint` VALUES ('23', '/role_management/sec_check_role_name_availability');
INSERT INTO `common_system_endpoint` VALUES ('24', '/role_management/sec_create_role');
INSERT INTO `common_system_endpoint` VALUES ('20', '/role_management/sec_search_roles');
INSERT INTO `common_system_endpoint` VALUES ('22', '/role_management/sec_update_role');
INSERT INTO `common_system_endpoint` VALUES ('21', '/role_management/sec_view_role');
INSERT INTO `common_system_endpoint` VALUES ('19', '/role_management/sec_view_role_menu_list');
INSERT INTO `common_system_endpoint` VALUES ('39', '/role_management/sec_view_user_nav_list');
INSERT INTO `common_system_endpoint` VALUES ('36', '/role_management/view_role_field_list_v2');
INSERT INTO `common_system_endpoint` VALUES ('35', '/role_management/view_role_menu_list_v2');
INSERT INTO `common_system_endpoint` VALUES ('38', '/role_management/view_role_selected_field_list_v2');
INSERT INTO `common_system_endpoint` VALUES ('37', '/role_management/view_role_selected_menu_list_v2');
INSERT INTO `common_system_endpoint` VALUES ('29', '/tenant_management/sec_get_trial_verify_percentage');
INSERT INTO `common_system_endpoint` VALUES ('30', '/tenant_management/sec_is_email_available');
INSERT INTO `common_system_endpoint` VALUES ('26', '/tenant_management/sec_trial_request');
INSERT INTO `common_system_endpoint` VALUES ('28', '/tenant_management/sec_verify_trial');
INSERT INTO `common_system_endpoint` VALUES ('4', '/user_management/sec_download_profile_pic');
INSERT INTO `common_system_endpoint` VALUES ('17', '/user_management/sec_get_userlist_dropdown');
INSERT INTO `common_system_endpoint` VALUES ('1', '/user_management/sec_temporary_password_reset');
INSERT INTO `common_system_endpoint` VALUES ('34', '/user_management/sec_view_authenticated_user');
INSERT INTO `common_system_endpoint` VALUES ('2', '/user_management/sec_view_user_byuserid');
INSERT INTO `common_system_endpoint` VALUES ('31', '/user_management/sec_view_user_nav_list');
INSERT INTO `common_system_endpoint` VALUES ('12', '/vendor_portal/sec_get_discounted_invoices');
INSERT INTO `common_system_endpoint` VALUES ('25', '/vendor_portal/sec_get_marketplace_vendors_dropdown');
INSERT INTO `common_system_endpoint` VALUES ('15', '/vendor_portal/sec_get_term_list_dropdown');
INSERT INTO `common_system_endpoint` VALUES ('3', '/vendor_portal/sec_get_uptodate_total_discount');
INSERT INTO `common_system_endpoint` VALUES ('8', '/vendor_portal/sec_get_vendors_dropdown');
INSERT INTO `common_system_endpoint` VALUES ('18', '/vendor_portal/sec_search_invoice');

-- ----------------------------
-- Table structure for common_uom
-- ----------------------------
DROP TABLE IF EXISTS `common_uom`;
CREATE TABLE `common_uom` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `unit` varchar(100) DEFAULT '',
  `description` varchar(100) DEFAULT NULL,
  `status` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of common_uom
-- ----------------------------
INSERT INTO `common_uom` VALUES ('1', 'HR', 'Human Resource', 'A');
INSERT INTO `common_uom` VALUES ('2', 'EA', 'Each', 'A');

-- ----------------------------
-- Table structure for common_user_email_subscription
-- ----------------------------
DROP TABLE IF EXISTS `common_user_email_subscription`;
CREATE TABLE `common_user_email_subscription` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email_id` int(11) DEFAULT NULL,
  `user_id` varchar(30) DEFAULT NULL,
  `subscribe` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of common_user_email_subscription
-- ----------------------------

-- ----------------------------
-- Table structure for common_user_log
-- ----------------------------
DROP TABLE IF EXISTS `common_user_log`;
CREATE TABLE `common_user_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `endpoint_id` int(11) NOT NULL,
  `ip_address` varchar(30) NOT NULL,
  `user_name` varchar(100) NOT NULL,
  `status_code` varchar(15) NOT NULL,
  `additional_message` varchar(256) DEFAULT NULL,
  `created_on` datetime NOT NULL,
  `tenant_id` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=546 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of common_user_log
-- ----------------------------
INSERT INTO `common_user_log` VALUES ('1', '1', '10.22.21.81', 'anonymousUser', '200', null, '2021-01-08 08:31:00', 'qa-app153');
INSERT INTO `common_user_log` VALUES ('2', '2', '10.22.21.81', 'admin', '200', null, '2021-01-08 08:31:27', 'qa-app153');
INSERT INTO `common_user_log` VALUES ('3', '3', '10.22.21.81', 'admin', '200', null, '2021-01-08 08:31:28', 'qa-app153');
INSERT INTO `common_user_log` VALUES ('4', '12', '10.22.21.81', 'admin', '200', null, '2021-01-08 08:31:28', 'qa-app153');
INSERT INTO `common_user_log` VALUES ('5', '18', '10.22.21.81', 'admin', '200', null, '2021-01-08 08:31:28', 'qa-app153');
INSERT INTO `common_user_log` VALUES ('6', '4', '10.22.21.81', 'admin', '200', null, '2021-01-08 08:31:28', 'qa-app153');
INSERT INTO `common_user_log` VALUES ('7', '11', '10.22.21.81', 'admin', '200', null, '2021-01-08 08:31:28', 'qa-app153');
INSERT INTO `common_user_log` VALUES ('8', '25', '10.22.21.81', 'admin', '200', null, '2021-01-08 08:31:28', 'qa-app153');
INSERT INTO `common_user_log` VALUES ('9', '13', '10.22.21.81', 'admin', '200', null, '2021-01-08 08:31:28', 'qa-app153');
INSERT INTO `common_user_log` VALUES ('10', '14', '10.22.21.81', 'admin', '200', null, '2021-01-08 08:31:28', 'qa-app153');
INSERT INTO `common_user_log` VALUES ('11', '16', '10.22.21.81', 'admin', '200', null, '2021-01-08 08:31:28', 'qa-app153');
INSERT INTO `common_user_log` VALUES ('12', '7', '10.22.21.81', 'admin', '200', null, '2021-01-08 08:31:28', 'qa-app153');
INSERT INTO `common_user_log` VALUES ('13', '10', '10.22.21.81', 'admin', '200', null, '2021-01-08 08:31:28', 'qa-app153');
INSERT INTO `common_user_log` VALUES ('14', '6', '10.22.21.81', 'admin', '200', null, '2021-01-08 08:31:29', 'qa-app153');
INSERT INTO `common_user_log` VALUES ('15', '9', '10.22.21.81', 'admin', '200', null, '2021-01-08 08:31:29', 'qa-app153');
INSERT INTO `common_user_log` VALUES ('16', '17', '10.22.21.81', 'admin', '200', null, '2021-01-08 08:31:29', 'qa-app153');
INSERT INTO `common_user_log` VALUES ('17', '15', '10.22.21.81', 'admin', '200', null, '2021-01-08 08:31:29', 'qa-app153');
INSERT INTO `common_user_log` VALUES ('18', '5', '10.22.21.81', 'admin', '200', null, '2021-01-08 08:31:29', 'qa-app153');
INSERT INTO `common_user_log` VALUES ('19', '26', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-21 07:38:48', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('20', '27', '127.0.0.1', 'anonymousUser', '404', null, '2021-01-21 07:38:48', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('21', '26', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-21 07:40:37', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('22', '26', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-21 08:00:31', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('23', '26', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-21 08:02:28', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('24', '26', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-21 08:04:38', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('25', '26', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-21 08:11:31', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('26', '26', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-21 12:08:09', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('27', '28', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-21 18:59:50', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('28', '27', '127.0.0.1', 'anonymousUser', '401', null, '2021-01-21 18:59:52', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('29', '28', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-21 19:01:24', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('30', '27', '127.0.0.1', 'anonymousUser', '401', null, '2021-01-21 19:01:24', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('31', '27', '127.0.0.1', 'anonymousUser', '401', null, '2021-01-21 19:01:36', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('32', '27', '127.0.0.1', 'anonymousUser', '401', null, '2021-01-21 19:03:32', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('33', '28', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-21 19:03:32', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('34', '27', '127.0.0.1', 'anonymousUser', '401', null, '2021-01-21 19:03:39', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('35', '27', '127.0.0.1', 'anonymousUser', '401', null, '2021-01-21 19:03:41', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('36', '27', '127.0.0.1', 'anonymousUser', '401', null, '2021-01-21 19:03:41', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('37', '27', '127.0.0.1', 'anonymousUser', '401', null, '2021-01-21 19:03:42', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('38', '27', '127.0.0.1', 'anonymousUser', '401', null, '2021-01-21 19:03:42', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('39', '27', '127.0.0.1', 'anonymousUser', '401', null, '2021-01-21 19:03:42', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('40', '28', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-21 19:07:19', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('41', '29', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-21 19:07:27', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('42', '28', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-21 19:08:01', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('43', '29', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-21 19:08:01', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('44', '29', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-21 19:08:01', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('45', '29', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-21 19:10:50', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('46', '28', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-21 19:10:50', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('47', '28', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-21 19:10:50', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('48', '29', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-21 19:10:50', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('49', '29', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-21 19:10:52', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('50', '29', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-21 19:10:52', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('51', '29', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-21 19:10:53', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('52', '29', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-21 19:10:53', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('53', '29', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-21 19:10:53', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('54', '29', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-21 19:10:53', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('55', '29', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-21 19:12:57', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('56', '28', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-21 19:12:57', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('57', '29', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-21 19:13:12', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('58', '29', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-21 19:13:16', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('59', '29', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-21 19:13:17', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('60', '28', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-21 19:14:18', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('61', '29', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-21 19:14:21', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('62', '29', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-21 19:14:24', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('63', '28', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-21 19:17:37', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('64', '29', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-21 19:17:37', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('65', '29', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-21 19:17:40', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('66', '29', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-21 19:17:42', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('67', '28', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-21 19:17:57', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('68', '29', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-21 19:17:57', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('69', '29', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-21 19:18:02', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('70', '29', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-21 19:18:04', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('71', '28', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-21 19:18:35', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('72', '29', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-21 19:18:35', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('73', '29', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-21 19:18:38', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('74', '28', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-21 19:20:22', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('75', '28', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-21 19:51:33', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('76', '28', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-21 19:56:10', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('77', '28', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-21 19:57:22', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('78', '28', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-21 20:01:31', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('79', '28', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-21 20:02:43', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('80', '26', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-21 20:03:49', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('81', '28', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-21 20:05:20', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('82', '26', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-21 20:06:54', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('83', '28', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-21 20:07:17', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('84', '28', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-22 05:44:10', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('85', '28', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-22 05:44:11', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('86', '26', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-22 09:14:23', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('87', '28', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-22 09:15:09', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('88', '28', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-22 09:20:42', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('89', '28', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-22 09:23:48', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('90', '28', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-22 09:25:33', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('91', '28', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-22 09:26:08', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('92', '26', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-22 09:26:45', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('93', '28', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-22 09:27:08', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('94', '29', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-22 09:27:09', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('95', '29', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-22 09:27:12', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('96', '29', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-22 09:27:15', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('97', '29', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-22 09:27:18', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('98', '29', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-22 09:27:21', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('99', '29', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-22 09:27:24', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('100', '29', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-22 09:27:27', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('101', '29', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-22 09:27:30', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('102', '29', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-22 09:27:33', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('103', '29', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-22 09:27:36', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('104', '29', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-22 09:27:39', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('105', '29', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-22 09:27:42', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('106', '29', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-22 09:27:45', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('107', '29', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-22 09:27:48', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('108', '26', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-22 09:31:58', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('109', '28', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-22 09:42:11', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('110', '29', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-22 09:42:12', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('111', '29', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-22 09:42:19', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('112', '29', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-22 09:42:20', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('113', '29', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-22 09:42:21', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('114', '29', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-22 09:42:25', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('115', '29', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-22 09:42:28', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('116', '29', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-22 09:42:30', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('117', '29', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-22 09:42:33', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('118', '29', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-22 09:42:36', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('119', '29', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-22 09:42:39', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('120', '29', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-22 09:42:42', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('121', '28', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-22 09:43:14', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('122', '28', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-22 09:43:20', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('123', '29', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-22 09:43:21', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('124', '26', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-22 09:46:22', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('125', '26', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-22 09:48:11', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('126', '28', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-22 09:48:33', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('127', '29', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-22 09:48:33', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('128', '29', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-22 09:48:36', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('129', '29', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-22 09:48:39', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('130', '29', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-22 09:48:42', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('131', '29', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-22 09:48:45', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('132', '29', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-22 09:48:48', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('133', '29', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-22 09:48:51', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('134', '29', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-22 09:48:54', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('135', '29', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-22 09:48:57', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('136', '29', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-22 09:49:00', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('137', '29', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-22 09:49:03', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('138', '26', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-22 10:02:29', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('139', '28', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-22 10:02:56', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('140', '29', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-22 10:02:57', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('141', '29', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-22 10:03:00', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('142', '29', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-22 10:03:03', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('143', '29', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-22 10:03:06', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('144', '29', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-22 10:03:09', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('145', '29', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-22 10:03:12', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('146', '29', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-22 10:03:15', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('147', '29', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-22 10:03:18', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('148', '29', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-22 10:03:21', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('149', '29', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-22 10:03:24', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('150', '29', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-22 10:03:27', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('151', '26', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-22 10:07:18', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('152', '28', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-22 10:07:46', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('153', '29', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-22 10:07:48', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('154', '29', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-22 10:07:51', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('155', '29', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-22 10:07:54', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('156', '29', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-22 10:07:57', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('157', '29', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-22 10:08:00', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('158', '29', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-22 10:08:03', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('159', '29', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-22 10:08:06', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('160', '29', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-22 10:08:09', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('161', '29', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-22 10:08:12', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('162', '29', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-22 10:08:15', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('163', '26', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-22 10:13:27', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('164', '28', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-22 10:13:50', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('165', '29', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-22 10:13:50', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('166', '29', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-22 10:13:50', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('167', '29', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-22 10:13:51', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('168', '29', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-22 10:13:52', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('169', '29', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-22 10:13:53', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('170', '29', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-22 10:13:54', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('171', '29', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-22 10:13:55', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('172', '29', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-22 10:13:56', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('173', '29', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-22 10:13:57', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('174', '29', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-22 10:13:58', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('175', '29', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-22 10:13:59', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('176', '29', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-22 10:14:00', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('177', '29', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-22 10:14:01', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('178', '29', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-22 10:14:02', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('179', '29', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-22 10:14:03', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('180', '29', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-22 10:14:04', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('181', '29', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-22 10:14:05', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('182', '29', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-22 10:14:06', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('183', '29', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-22 10:14:07', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('184', '29', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-22 10:14:08', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('185', '29', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-22 10:14:09', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('186', '29', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-22 10:14:10', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('187', '29', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-22 10:14:11', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('188', '29', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-22 10:14:12', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('189', '29', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-22 10:14:13', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('190', '29', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-22 10:14:14', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('191', '29', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-22 10:14:15', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('192', '29', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-22 10:14:16', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('193', '29', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-22 10:14:17', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('194', '29', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-22 10:14:18', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('195', '29', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-22 10:14:19', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('196', '29', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-22 10:14:20', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('197', '28', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-22 10:15:00', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('198', '29', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-22 10:15:00', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('199', '26', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-22 11:33:42', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('200', '26', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-22 11:34:23', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('201', '26', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-22 11:35:18', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('202', '28', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-22 11:38:31', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('203', '29', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-22 11:38:33', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('204', '29', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-22 11:38:36', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('205', '29', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-22 11:38:39', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('206', '29', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-22 11:38:42', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('207', '29', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-22 11:38:45', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('208', '29', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-22 11:38:48', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('209', '29', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-22 11:38:51', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('210', '29', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-22 11:38:54', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('211', '29', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-22 11:38:57', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('212', '29', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-22 11:39:00', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('213', '28', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-22 11:44:46', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('214', '28', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-22 11:47:05', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('215', '28', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-23 15:10:55', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('216', '26', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 15:07:30', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('217', '28', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 15:08:25', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('218', '29', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 15:08:28', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('219', '29', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 15:08:31', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('220', '29', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 15:08:34', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('221', '29', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 15:08:37', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('222', '29', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 15:08:40', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('223', '29', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 15:08:43', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('224', '29', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 15:08:46', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('225', '26', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 15:21:51', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('226', '26', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 15:22:03', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('227', '26', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 15:22:57', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('228', '30', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 15:54:50', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('229', '30', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 15:55:32', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('230', '30', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 15:55:36', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('231', '30', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 15:55:48', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('232', '30', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 15:55:51', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('233', '30', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 15:55:54', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('234', '30', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 16:05:39', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('235', '30', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 16:12:32', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('236', '30', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 16:14:41', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('237', '30', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 16:14:53', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('238', '30', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 16:16:13', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('239', '30', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 16:17:47', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('240', '30', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 16:17:53', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('241', '30', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 16:18:28', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('242', '30', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 16:18:51', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('243', '30', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 16:22:46', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('244', '30', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 16:23:13', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('245', '30', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 16:23:31', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('246', '30', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 16:24:14', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('247', '30', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 16:24:22', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('248', '30', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 16:24:55', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('249', '30', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 16:25:19', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('250', '30', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 16:27:53', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('251', '30', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 16:28:45', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('252', '30', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 16:29:16', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('253', '30', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 16:31:33', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('254', '30', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 16:31:37', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('255', '30', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 16:31:49', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('256', '30', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 16:33:55', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('257', '30', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 16:34:00', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('258', '30', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 16:39:32', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('259', '30', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 16:39:48', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('260', '30', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 16:40:38', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('261', '30', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 16:41:23', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('262', '30', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 16:41:52', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('263', '30', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 16:42:13', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('264', '30', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 16:43:31', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('265', '30', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 16:49:42', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('266', '30', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 17:13:20', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('267', '30', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 17:13:24', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('268', '30', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 17:13:24', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('269', '30', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 17:13:31', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('270', '30', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 17:13:32', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('271', '30', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 17:13:35', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('272', '30', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 17:13:37', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('273', '30', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 17:13:38', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('274', '30', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 17:14:06', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('275', '30', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 17:14:06', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('276', '30', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 17:14:07', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('277', '30', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 17:14:07', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('278', '30', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 17:14:07', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('279', '30', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 17:14:07', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('280', '30', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 17:14:08', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('281', '30', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 17:14:08', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('282', '30', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 17:14:08', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('283', '30', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 17:14:08', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('284', '30', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 17:14:08', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('285', '30', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 17:14:09', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('286', '30', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 17:14:09', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('287', '30', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 17:14:09', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('288', '30', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 17:14:09', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('289', '26', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 17:14:15', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('290', '30', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 17:16:01', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('291', '30', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 17:16:01', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('292', '30', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 17:16:01', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('293', '30', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 17:16:02', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('294', '30', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 17:16:02', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('295', '30', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 17:16:02', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('296', '30', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 17:16:03', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('297', '30', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 17:16:03', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('298', '30', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 17:16:03', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('299', '30', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 17:16:03', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('300', '30', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 17:16:03', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('301', '30', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 17:16:03', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('302', '30', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 17:16:03', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('303', '30', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 17:16:03', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('304', '30', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 17:18:02', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('305', '30', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 17:18:02', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('306', '30', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 17:18:02', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('307', '30', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 17:18:02', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('308', '30', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 17:18:03', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('309', '30', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 17:18:03', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('310', '30', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 17:18:03', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('311', '30', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 17:18:03', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('312', '30', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 17:18:03', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('313', '30', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 17:18:04', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('314', '30', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 17:18:04', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('315', '30', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 17:18:04', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('316', '30', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 17:18:04', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('317', '30', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 17:18:04', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('318', '30', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 17:18:04', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('319', '30', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 17:21:06', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('320', '30', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 17:21:06', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('321', '26', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 17:21:49', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('322', '30', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 17:22:24', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('323', '30', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 17:22:25', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('324', '30', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 17:22:25', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('325', '30', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 17:22:25', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('326', '30', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 17:22:26', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('327', '30', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 17:22:26', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('328', '30', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 17:22:26', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('329', '30', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 17:23:49', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('330', '26', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 17:24:12', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('331', '30', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 17:25:02', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('332', '26', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 17:25:15', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('333', '30', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 17:29:12', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('334', '30', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 17:29:14', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('335', '30', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 17:29:21', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('336', '30', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 17:29:21', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('337', '30', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 17:29:21', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('338', '30', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 17:29:21', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('339', '30', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 17:29:21', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('340', '30', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 17:29:23', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('341', '30', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 17:29:25', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('342', '30', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 17:29:25', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('343', '30', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 17:29:26', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('344', '30', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 17:29:26', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('345', '30', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 17:29:26', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('346', '30', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 17:29:27', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('347', '30', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 17:29:27', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('348', '30', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 17:29:27', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('349', '30', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 17:29:27', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('350', '30', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 17:29:32', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('351', '30', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 17:29:35', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('352', '30', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 17:29:37', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('353', '30', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 17:29:39', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('354', '30', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 17:29:41', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('355', '30', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 17:32:02', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('356', '26', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 17:32:07', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('357', '26', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 17:32:13', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('358', '26', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 17:32:20', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('359', '26', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 17:40:37', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('360', '26', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 17:40:44', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('361', '26', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 17:40:53', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('362', '30', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 17:41:22', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('363', '26', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 17:41:26', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('364', '30', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 17:42:14', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('365', '30', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 18:03:12', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('366', '30', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 18:03:15', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('367', '26', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 18:03:26', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('368', '30', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 18:05:27', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('369', '30', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 18:05:28', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('370', '26', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 18:05:31', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('371', '30', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 18:11:48', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('372', '26', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 18:11:52', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('373', '28', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 18:30:09', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('374', '29', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 18:30:12', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('375', '29', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 18:30:15', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('376', '29', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 18:30:18', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('377', '29', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 18:30:21', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('378', '29', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 18:30:24', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('379', '29', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 18:30:27', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('380', '29', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 18:30:30', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('381', '29', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 18:30:33', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('382', '29', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 18:30:36', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('383', '30', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 18:40:52', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('384', '26', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 18:40:55', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('385', '28', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 18:43:39', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('386', '29', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 18:43:43', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('387', '29', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 18:43:46', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('388', '29', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 18:43:49', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('389', '29', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 18:43:52', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('390', '29', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 18:43:55', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('391', '29', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 18:43:58', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('392', '29', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 18:44:01', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('393', '29', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 18:44:04', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('394', '29', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 18:44:07', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('395', '29', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 18:44:10', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('396', '29', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 18:44:13', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('397', '29', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 18:44:16', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('398', '29', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 18:44:19', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('399', '29', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 18:44:22', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('400', '29', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 18:44:25', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('401', '29', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 18:44:28', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('402', '29', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 18:44:30', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('403', '30', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 18:51:44', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('404', '26', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 18:51:47', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('405', '28', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 18:52:12', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('406', '29', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 18:52:15', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('407', '29', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 18:52:18', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('408', '29', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 18:52:21', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('409', '29', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 18:52:24', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('410', '29', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 18:52:27', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('411', '29', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 18:52:30', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('412', '29', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 18:52:33', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('413', '29', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 18:52:36', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('414', '29', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 18:52:39', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('415', '29', '127.0.0.1', 'anonymousUser', '200', null, '2021-01-24 18:52:42', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('416', '31', '127.0.0.1', 'admin', '200', null, '2021-02-06 08:51:29', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('417', '31', '127.0.0.1', 'admin', '200', null, '2021-02-06 09:01:50', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('418', '31', '127.0.0.1', 'admin', '200', null, '2021-02-06 09:10:47', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('419', '31', '127.0.0.1', 'admin', '200', null, '2021-02-06 09:11:23', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('420', '31', '127.0.0.1', 'admin', '200', null, '2021-02-06 09:18:55', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('421', '31', '127.0.0.1', 'admin', '200', null, '2021-02-06 09:23:17', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('422', '31', '127.0.0.1', 'admin', '200', null, '2021-02-06 19:30:37', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('423', '31', '127.0.0.1', 'admin', '200', null, '2021-02-06 19:32:13', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('424', '31', '127.0.0.1', 'admin', '200', null, '2021-02-06 19:42:54', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('425', '31', '127.0.0.1', 'admin', '200', null, '2021-02-06 19:50:26', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('426', '31', '127.0.0.1', 'admin', '200', null, '2021-02-06 19:58:34', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('427', '32', '127.0.0.1', 'admin', '200', null, '2021-02-08 14:29:32', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('428', '32', '127.0.0.1', 'admin', '200', null, '2021-02-08 15:04:12', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('429', '32', '127.0.0.1', 'admin', '200', null, '2021-02-09 07:25:22', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('430', '32', '127.0.0.1', 'admin', '200', null, '2021-02-09 07:48:22', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('431', '33', '127.0.0.1', 'admin', '200', null, '2021-02-09 08:02:44', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('432', '33', '127.0.0.1', 'admin', '200', null, '2021-02-09 08:02:54', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('433', '33', '127.0.0.1', 'admin', '200', null, '2021-02-09 08:08:03', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('434', '33', '127.0.0.1', 'admin', '200', null, '2021-02-09 08:09:55', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('435', '33', '127.0.0.1', 'admin', '200', null, '2021-02-09 08:11:07', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('436', '33', '127.0.0.1', 'admin', '200', null, '2021-02-09 08:21:43', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('437', '33', '127.0.0.1', 'admin', '200', null, '2021-02-09 08:30:06', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('438', '33', '127.0.0.1', 'admin', '200', null, '2021-02-09 10:34:18', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('439', '32', '127.0.0.1', 'admin', '200', null, '2021-02-09 10:34:55', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('440', '32', '127.0.0.1', 'admin', '200', null, '2021-02-09 10:44:27', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('441', '31', '127.0.0.1', 'admin', '200', null, '2021-02-11 05:12:17', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('442', '31', '127.0.0.1', 'admin', '200', null, '2021-02-11 05:13:15', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('443', '31', '127.0.0.1', 'admin', '200', null, '2021-02-11 06:46:26', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('444', '31', '127.0.0.1', 'admin', '200', null, '2021-02-11 06:49:25', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('445', '34', '127.0.0.1', 'admin', '200', null, '2021-02-11 06:49:25', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('446', '31', '127.0.0.1', 'admin', '200', null, '2021-02-11 06:52:59', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('447', '34', '127.0.0.1', 'admin', '200', null, '2021-02-11 06:52:59', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('448', '31', '127.0.0.1', 'admin', '200', null, '2021-02-11 17:08:49', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('449', '34', '127.0.0.1', 'admin', '200', null, '2021-02-11 17:08:49', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('450', '35', '127.0.0.1', 'admin', '200', null, '2021-02-11 20:35:23', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('451', '35', '127.0.0.1', 'admin', '200', null, '2021-02-12 10:13:44', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('452', '36', '127.0.0.1', 'admin', '200', null, '2021-02-12 10:13:58', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('453', '37', '127.0.0.1', 'admin', '200', null, '2021-02-12 10:14:26', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('454', '37', '127.0.0.1', 'admin', '200', null, '2021-02-12 10:14:48', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('455', '37', '127.0.0.1', 'admin', '200', null, '2021-02-12 10:15:01', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('456', '38', '127.0.0.1', 'admin', '200', null, '2021-02-12 10:15:09', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('457', '31', '127.0.0.1', 'admin', '200', null, '2021-02-12 16:24:42', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('458', '27', '127.0.0.1', 'admin', '404', null, '2021-02-12 16:24:42', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('459', '31', '127.0.0.1', 'admin', '200', null, '2021-02-12 16:25:04', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('460', '27', '127.0.0.1', 'admin', '404', null, '2021-02-12 16:25:04', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('461', '39', '127.0.0.1', 'admin', '200', null, '2021-02-12 16:27:14', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('462', '34', '127.0.0.1', 'admin', '200', null, '2021-02-12 16:27:14', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('463', '39', '127.0.0.1', 'admin', '200', null, '2021-02-14 07:56:43', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('464', '39', '127.0.0.1', 'admin', '200', null, '2021-02-14 07:56:51', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('465', '34', '127.0.0.1', 'admin', '200', null, '2021-02-14 07:56:51', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('466', '34', '127.0.0.1', 'admin', '200', null, '2021-02-14 07:57:04', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('467', '32', '127.0.0.1', 'admin', '200', null, '2021-02-14 07:58:57', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('468', '32', '127.0.0.1', 'admin', '200', null, '2021-02-14 08:04:40', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('469', '32', '127.0.0.1', 'admin', '200', null, '2021-02-14 08:04:57', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('470', '32', '127.0.0.1', 'admin', '200', null, '2021-02-14 08:09:30', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('471', '32', '127.0.0.1', 'admin', '200', null, '2021-02-14 08:10:00', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('472', '32', '127.0.0.1', 'admin', '200', null, '2021-02-14 08:10:26', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('473', '32', '127.0.0.1', 'admin', '200', null, '2021-02-14 08:12:00', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('474', '32', '127.0.0.1', 'admin', '200', null, '2021-02-14 08:12:23', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('475', '32', '127.0.0.1', 'admin', '200', null, '2021-02-14 08:12:43', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('476', '32', '127.0.0.1', 'admin', '200', null, '2021-02-14 08:17:37', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('477', '35', '127.0.0.1', 'admin', '200', null, '2021-02-14 08:18:22', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('478', '35', '127.0.0.1', 'admin', '200', null, '2021-02-14 08:18:48', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('479', '35', '127.0.0.1', 'admin', '200', null, '2021-02-14 08:19:06', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('480', '35', '127.0.0.1', 'admin', '200', null, '2021-02-14 08:20:51', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('481', '36', '127.0.0.1', 'admin', '200', null, '2021-02-14 08:20:52', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('482', '35', '127.0.0.1', 'admin', '200', null, '2021-02-14 08:21:50', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('483', '36', '127.0.0.1', 'admin', '200', null, '2021-02-14 08:21:50', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('484', '35', '127.0.0.1', 'admin', '200', null, '2021-02-14 08:23:18', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('485', '36', '127.0.0.1', 'admin', '200', null, '2021-02-14 08:23:19', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('486', '35', '127.0.0.1', 'admin', '200', null, '2021-02-14 08:24:00', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('487', '36', '127.0.0.1', 'admin', '200', null, '2021-02-14 08:24:00', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('488', '36', '127.0.0.1', 'admin', '200', null, '2021-02-14 08:24:42', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('489', '35', '127.0.0.1', 'admin', '200', null, '2021-02-14 08:24:42', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('490', '35', '127.0.0.1', 'admin', '200', null, '2021-02-14 08:34:24', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('491', '36', '127.0.0.1', 'admin', '200', null, '2021-02-14 08:34:24', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('492', '35', '127.0.0.1', 'admin', '200', null, '2021-02-14 08:37:49', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('493', '36', '127.0.0.1', 'admin', '200', null, '2021-02-14 08:37:49', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('494', '36', '127.0.0.1', 'admin', '200', null, '2021-02-14 08:37:57', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('495', '35', '127.0.0.1', 'admin', '200', null, '2021-02-14 08:37:57', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('496', '40', '127.0.0.1', 'admin', '200', null, '2021-02-14 09:02:26', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('497', '41', '127.0.0.1', 'admin', '200', null, '2021-02-14 09:02:26', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('498', '32', '127.0.0.1', 'admin', '200', null, '2021-02-14 09:02:33', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('499', '36', '127.0.0.1', 'admin', '200', null, '2021-02-14 09:03:46', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('500', '35', '127.0.0.1', 'admin', '200', null, '2021-02-14 09:03:46', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('501', '32', '127.0.0.1', 'admin', '200', null, '2021-02-14 09:04:15', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('502', '35', '127.0.0.1', 'admin', '200', null, '2021-02-14 09:04:19', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('503', '36', '127.0.0.1', 'admin', '200', null, '2021-02-14 09:04:19', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('504', '32', '127.0.0.1', 'admin', '200', null, '2021-02-14 09:04:21', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('505', '35', '127.0.0.1', 'admin', '200', null, '2021-02-14 09:04:24', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('506', '36', '127.0.0.1', 'admin', '200', null, '2021-02-14 09:04:24', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('507', '39', '127.0.0.1', 'admin', '200', null, '2021-02-15 07:23:51', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('508', '34', '127.0.0.1', 'admin', '200', null, '2021-02-15 07:23:51', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('509', '32', '127.0.0.1', 'admin', '200', null, '2021-02-15 07:24:03', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('510', '36', '127.0.0.1', 'admin', '200', null, '2021-02-15 07:24:07', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('511', '35', '127.0.0.1', 'admin', '200', null, '2021-02-15 07:24:07', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('512', '36', '127.0.0.1', 'admin', '200', null, '2021-02-15 07:34:30', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('513', '35', '127.0.0.1', 'admin', '200', null, '2021-02-15 07:34:30', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('514', '35', '127.0.0.1', 'admin', '200', null, '2021-02-15 07:34:41', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('515', '36', '127.0.0.1', 'admin', '200', null, '2021-02-15 07:34:41', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('516', '36', '127.0.0.1', 'admin', '200', null, '2021-02-15 07:35:28', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('517', '35', '127.0.0.1', 'admin', '200', null, '2021-02-15 07:35:28', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('518', '39', '127.0.0.1', 'admin', '200', null, '2021-02-15 07:45:40', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('519', '34', '127.0.0.1', 'admin', '200', null, '2021-02-15 07:45:41', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('520', '32', '127.0.0.1', 'admin', '200', null, '2021-02-15 07:45:46', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('521', '35', '127.0.0.1', 'admin', '200', null, '2021-02-15 07:45:49', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('522', '36', '127.0.0.1', 'admin', '200', null, '2021-02-15 07:45:49', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('523', '35', '127.0.0.1', 'admin', '200', null, '2021-02-15 07:49:02', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('524', '36', '127.0.0.1', 'admin', '200', null, '2021-02-15 07:49:02', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('525', '36', '127.0.0.1', 'admin', '200', null, '2021-02-15 08:02:50', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('526', '35', '127.0.0.1', 'admin', '200', null, '2021-02-15 08:02:50', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('527', '39', '127.0.0.1', 'admin', '200', null, '2021-02-15 13:18:06', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('528', '34', '127.0.0.1', 'admin', '200', null, '2021-02-15 13:18:06', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('529', '32', '127.0.0.1', 'admin', '200', null, '2021-02-15 13:18:15', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('530', '35', '127.0.0.1', 'admin', '200', null, '2021-02-15 13:18:23', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('531', '36', '127.0.0.1', 'admin', '200', null, '2021-02-15 13:18:23', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('532', '32', '127.0.0.1', 'admin', '200', null, '2021-02-15 13:20:00', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('533', '36', '127.0.0.1', 'admin', '200', null, '2021-02-15 13:20:02', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('534', '35', '127.0.0.1', 'admin', '200', null, '2021-02-15 13:20:02', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('535', '35', '127.0.0.1', 'admin', '200', null, '2021-02-15 13:34:23', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('536', '36', '127.0.0.1', 'admin', '200', null, '2021-02-15 13:34:23', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('537', '39', '127.0.0.1', 'admin', '200', null, '2021-02-18 15:14:16', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('538', '34', '127.0.0.1', 'admin', '200', null, '2021-02-18 15:14:16', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('539', '32', '127.0.0.1', 'admin', '200', null, '2021-03-06 10:17:23', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('540', '32', '127.0.0.1', 'admin', '200', null, '2021-03-06 10:21:04', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('541', '32', '127.0.0.1', 'admin', '200', null, '2021-03-06 10:33:41', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('542', '32', '127.0.0.1', 'admin', '200', null, '2021-03-06 10:33:54', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('543', '32', '127.0.0.1', 'admin', '200', null, '2021-03-06 10:34:31', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('544', '32', '127.0.0.1', 'admin', '200', null, '2021-03-06 10:37:10', 'v2_tenant');
INSERT INTO `common_user_log` VALUES ('545', '32', '127.0.0.1', 'admin', '200', null, '2021-03-06 10:38:06', 'v2_tenant');

-- ----------------------------
-- Table structure for common_user_notification
-- ----------------------------
DROP TABLE IF EXISTS `common_user_notification`;
CREATE TABLE `common_user_notification` (
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

-- ----------------------------
-- Records of common_user_notification
-- ----------------------------

-- ----------------------------
-- Table structure for umm_menu
-- ----------------------------
DROP TABLE IF EXISTS `umm_menu`;
CREATE TABLE `umm_menu` (
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

-- ----------------------------
-- Records of umm_menu
-- ----------------------------
INSERT INTO `umm_menu` VALUES ('1', 'Dashboard Options', 'Dashboard Options', 'card text-white bg-info', '/home/dashboard', null, 'M', null, null, 'Admin', '1', 'icon-speedometer', 'Dashboard', 'Dashboard', 'A', '0', '0', '0', 'V1', 'DASHBOARD_OPTION', '0', 'System', '2021-02-03 22:36:36', null, null, null, null);
INSERT INTO `umm_menu` VALUES ('2', 'Admin', 'Admin', 'card text-white bg-info', '/pages', null, 'M', null, null, 'Admin', '300', 'icon-settings icons', 'Admin', 'Admin', 'A', '0', '0', '0', 'V1', 'ADMIN', '0', 'System', '2021-02-03 22:36:42', null, null, null, null);
INSERT INTO `umm_menu` VALUES ('3', 'User Management', 'User Management', 'card text-white bg-info', '/home/admin/user', null, 'S', '2', null, 'Admin', '305', 'icon-user icons', 'User', 'Management', 'A', '0', '0', '0', 'V1', 'USER_MANAGEMENT', '0', 'System', '2021-02-03 22:36:42', null, null, null, null);
INSERT INTO `umm_menu` VALUES ('4', 'Role Management', 'Role Management', 'card text-white bg-info', '/home/admin/role', null, 'S', '2', null, 'Admin', '302', 'icon-key icons', 'Role', 'Management', 'A', '0', '0', '0', 'V1', 'ROLE_MANAGEMENT', '0', 'System', '2021-02-03 22:36:42', null, null, null, null);
INSERT INTO `umm_menu` VALUES ('5', 'VendorTrl', 'VendorTrl', 'card text-white bg-info', '/pages', null, 'M', null, null, 'Admin', '200', 'icon-people icons', 'Vendor', 'Trl', 'A', '0', '0', '0', 'V1', 'VENDORTRL', '0', 'System', '2021-02-03 22:36:42', null, null, null, null);
INSERT INTO `umm_menu` VALUES ('6', 'Vendor Management', 'Vendor Management', 'card text-white bg-info', '/home/vendor/management/vendor-management', null, 'S', '5', null, 'Admin', '206', 'fa fa-street-view', 'Vendor', 'Management', 'A', '0', '0', '0', 'V1', 'VENDOR_MANAGEMENT', '0', 'System', '2021-02-03 22:36:42', null, null, null, null);
INSERT INTO `umm_menu` VALUES ('8', 'Workflow Configuration', 'Workflow Configuration', 'card text-white bg-info', '/home/vendor/workflow/configuration', null, 'S', '2', null, 'Admin', '304', 'icon-magnifier icons', 'Workflow ', 'Configuration', 'A', '0', '0', '0', 'V1', 'WORKFLOW_CONFIGURATION', '0', 'System', '2021-02-03 22:36:42', null, null, null, null);
INSERT INTO `umm_menu` VALUES ('9', 'Upload Invoice', 'Upload Invoice', 'card text-white bg-info', '/home/ven-invoice/invoice-upload', null, 'S', '5', null, 'Admin', '201', 'icon-cloud-upload', 'Upload', ' Invoice', 'A', '0', '0', '0', 'V1', 'UPLOAD_INVOICE', '0', 'System', '2021-02-03 22:36:42', null, null, null, null);
INSERT INTO `umm_menu` VALUES ('10', 'Review Invoice', 'Review Invoice', 'card text-white bg-info', '/home/ven-invoice/invoice-review', null, 'S', '5', null, 'Admin', '202', 'icon-eye icons', 'Review', 'Invoice', 'A', '0', '0', '0', 'V1', 'REVIEW_INVOICE', '0', 'System', '2021-02-03 22:36:42', null, null, null, null);
INSERT INTO `umm_menu` VALUES ('11', 'Invoice Approval', 'Invoice Approval', 'card text-white bg-info', '/home/ven-invoice/invoice-status-box', null, 'S', '5', null, 'Admin', '204', 'icon-social-dropbox icons', 'Invoice', 'Approval', 'A', '0', '0', '0', 'V1', 'INVOICE_APPROVAL', '0', 'System', '2021-02-03 22:36:42', null, null, null, null);
INSERT INTO `umm_menu` VALUES ('12', 'Project Code Management', 'Project Code Management', 'card text-white bg-info', '/home/ven-invoice/approval-code-management', null, 'S', '2', null, 'Admin', '306', 'fa fa-code', 'Project Code', 'Management', 'A', '0', '0', '0', 'V1', 'PROJECT_CODE_MANAGEMENT', '0', 'System', '2021-02-03 22:36:42', null, null, null, null);
INSERT INTO `umm_menu` VALUES ('13', 'Invoice Search', 'Invoice Search', 'card text-white bg-info', '/home/ven-invoice/invoice-search', null, 'S', '5', null, 'Admin', '205', 'icon-magnifier', 'Invoice', 'Search', 'A', '0', '0', '0', 'V1', 'INVOICE_SEARCH', '0', 'System', '2021-02-03 22:36:42', null, null, null, null);
INSERT INTO `umm_menu` VALUES ('14', 'Dashboard', 'Dashboard', 'card text-white bg-info', '/home/dashboard', null, 'S', '1', null, 'Admin', '1', 'icon-speedometer', 'Dashboard', 'Dashboard', 'A', '0', '0', '0', 'V1', 'DASHBOARD', '0', 'System', '2021-02-03 22:36:42', null, null, null, null);
INSERT INTO `umm_menu` VALUES ('20', 'E-Invoice', 'E-Invoice', 'card text-white bg-info', '/home/ven-invoice/e-invoice', null, 'S', '5', null, 'Admin', '203', 'fa fa-calculator', 'E-invoice', 'E-Invoice', 'A', '0', '0', '0', 'V1', 'E_INVOICE', '0', 'System', '2021-02-03 22:36:42', null, null, null, null);
INSERT INTO `umm_menu` VALUES ('21', 'Payment Management', 'Payment Management', 'card text-white bg-info', '/home/ven-invoice/payment/management', null, 'S', '5', null, 'Admin', '208', 'fa fa-money', 'Payment', 'Management', 'A', '0', '0', '0', 'V1', 'PAYMENT_MANAGEMENT', '0', 'System', '2021-02-03 22:36:42', null, null, null, null);
INSERT INTO `umm_menu` VALUES ('22', 'Sync Dashboard', 'Sync Dashboard', 'card text-white bg-info', '/home/ven-invoice/sync-dashboard', null, 'S', '2', null, 'Admin', '307', 'fa fa-stumbleupon-circle', 'Sync', 'Dashboard', 'A', '0', '0', '0', 'V1', 'SYNC_DASHBOARD', '0', 'System', '2021-02-03 22:36:42', null, null, null, null);
INSERT INTO `umm_menu` VALUES ('23', 'Approval Group Management', 'Approval Group Management', 'card text-white bg-info', '/home/admin/approval-level', null, 'S', '2', null, 'Admin', '303', 'fa fa-level-up', 'Approval', 'Group Management', 'A', '0', '0', '0', 'V1', 'APPROVAL_GROUP_MANAGEMENT', '0', 'System', '2021-02-03 22:36:42', null, null, null, null);
INSERT INTO `umm_menu` VALUES ('28', 'Settings', 'Settings', 'card text-white bg-info', '/home/support/package-change-request', null, 'S', '2', null, 'Admin', '301', 'fa fa-cogs', 'Settings', 'Settings', 'A', '0', '0', '0', 'V1', 'SETTINGS', '0', 'System', '2021-02-03 22:36:42', null, null, null, null);
INSERT INTO `umm_menu` VALUES ('29', 'CaptureTrl', 'CaptureTrl', 'card text-white bg-info', '/pages', null, 'M', null, null, 'Admin', '100', 'fa fa-camera', 'Capture', 'Trl', 'A', '0', '0', '0', 'V1', 'CAPTURETRL', '0', 'System', '2021-02-03 22:36:42', null, null, null, null);
INSERT INTO `umm_menu` VALUES ('30', 'Client Management', 'Client Management', 'card text-white bg-info', '/home/ar-module/client/client-management', null, 'S', '29', null, 'Admin', '101', 'fa fa-handshake-o', 'Client', 'Management', 'A', '0', '0', '0', 'V1', 'CLIENT_MANAGEMENT', '0', 'System', '2021-02-03 22:36:42', null, null, null, null);
INSERT INTO `umm_menu` VALUES ('32', 'Employee Management', 'Employee Management', 'card text-white bg-info', '/home/admin/employee-management', null, 'S', '2', null, 'Admin', '308', 'fa fa-users ', 'Employee', 'Management', 'I', '0', '0', '0', 'V1', 'EMPLOYEE_MANAGEMENT', '0', 'System', '2021-02-03 22:36:42', null, null, null, null);
INSERT INTO `umm_menu` VALUES ('33', 'Opportunity Management', 'Opportunity Management', 'card text-white bg-info', '/home/ar-module/opportunity/opportunity-management', null, 'S', '29', null, 'Admin', '102', 'fa fa-tasks', 'Opportunity', 'Management', 'A', '0', '0', '0', 'V1', 'OPPORTUNITY_MANAGEMENT', '0', 'System', '2021-02-03 22:36:42', null, null, null, null);
INSERT INTO `umm_menu` VALUES ('34', 'Proposal Management', 'Proposal Management', 'card text-white bg-info', '/home/ar-module/proposal/proposal-management', null, 'S', '29', null, 'Admin', '103', 'fa fa-book', 'Proposal', 'Management', 'A', '0', '0', '0', 'V1', 'PROPOSAL_MANAGEMENT', '0', 'System', '2021-02-03 22:36:42', null, null, null, null);
INSERT INTO `umm_menu` VALUES ('35', 'Project Management', 'Project Management', 'card text-white bg-info', '/home/ar-module/project/project-management', null, 'S', '29', null, 'Admin', '104', 'fa fa-building', 'Project', 'Management', 'A', '0', '0', '0', 'V1', 'PROJECT_MANAGEMENT', '0', 'System', '2021-02-03 22:36:42', null, null, null, null);
INSERT INTO `umm_menu` VALUES ('36', 'Proposal Approval', 'Proposal Approval', 'card text-white bg-info', '/home/ar-module/approval-proposal/proposal-approval', null, 'S', '29', null, 'Admin', '107', 'fa fa-check-circle-o', 'Approval', 'Proposal', 'A', '0', '0', '0', 'V1', 'PROPOSAL_APPROVAL', '0', 'System', '2021-02-03 22:36:42', null, null, null, null);
INSERT INTO `umm_menu` VALUES ('37', 'Expense Management', 'Expense Management', 'card text-white bg-info', '/home/vendor/expense/expense-management', null, 'S', '5', null, 'Admin', '209', 'fa fa-usd', 'Expenses', 'Management', 'A', '0', '0', '0', 'V1', 'EXPENSE_MANAGEMENT', '0', 'System', '2021-02-03 22:36:42', null, null, null, null);
INSERT INTO `umm_menu` VALUES ('38', 'Expense Approval', 'Expense Approval', 'card text-white bg-info', '/home/vendor/approval-expense', null, 'S', '5', null, 'Admin', '210', 'fa fa-check-circle-o', 'Expense', 'Approval', 'A', '0', '0', '0', 'V1', 'EXPENSE_APPROVAL', '0', 'System', '2021-02-03 22:36:42', null, null, null, null);
INSERT INTO `umm_menu` VALUES ('40', 'Opportunity Approval', 'Opportunity Approval', 'card text-white bg-info', '/home/ar-module/approval-opportunity/opportunity-approval', null, 'S', '29', null, 'Admin', '106', 'fa fa-check-circle-o', 'Opportunity', 'Approval', 'A', '0', '0', '0', 'V1', 'OPPORTUNITY_APPROVAL', '0', 'System', '2021-02-03 22:36:42', null, null, null, null);
INSERT INTO `umm_menu` VALUES ('41', 'Project Approval', 'Project Approval', 'card text-white bg-info', '/home/ar-module/approval-project/project-approval', null, 'S', '29', null, 'Admin', '108', 'fa fa-check-circle-o', 'Project', 'Approval', 'A', '0', '0', '0', 'V1', 'PROJECT_APPROVAL', '0', 'System', '2021-02-03 22:36:42', null, null, null, null);
INSERT INTO `umm_menu` VALUES ('42', 'Purchase Order Management', 'Purchase Order Management', 'card text-white bg-info', '/home/purchase-order/management/po-management', null, 'S', '5', null, 'Admin', '211', 'fa fa-usd', 'Purchase Order', 'Management', 'A', '0', '0', '0', 'V1', 'PURCHASE_ORDER_MANAGEMENT', '0', 'System', '2021-02-03 22:36:42', null, null, null, null);
INSERT INTO `umm_menu` VALUES ('43', 'Purchase Order Approval', 'Purchase Order Approval', 'card text-white bg-info', '/home/purchase-order/approval-po', null, 'S', '5', null, 'Admin', '212', 'fa fa-check-circle-o', 'Purchase Order', 'Approval', 'A', '0', '0', '0', 'V1', 'PURCHASE_ORDER_APPROVAL', '0', 'System', '2021-02-03 22:36:42', null, null, null, null);
INSERT INTO `umm_menu` VALUES ('45', 'Purchase Order Receipt', 'Purchase Order Receipt', 'card text-white bg-info', '/home/po-receipt/management/po-receipt', null, 'S', '5', null, 'Admin', '215', 'fa fa-file-text-o', 'PurchaseOrder', 'Receipt', 'A', '0', '0', '0', 'V1', 'PURCHASE_ORDER_RECEIPT', '0', 'System', '2021-02-03 22:36:42', null, null, null, null);
INSERT INTO `umm_menu` VALUES ('51', 'Item Management', 'Item Management', 'card text-white bg-info', '/home/item-catalogue/management/item-management', null, 'S', '5', null, 'Admin', '309', 'fa fa-cube', 'Item', 'Management', 'A', '0', '0', '0', 'V1', 'ITEM_MANAGEMENT', '0', 'System', '2021-02-03 22:36:42', null, null, null, null);
INSERT INTO `umm_menu` VALUES ('52', 'Account Management', 'Account Management', 'card text-white bg-info', '/home/account/management/account-management', null, 'S', '5', null, 'Admin', '209', 'fa fa-industry', 'Account', 'Management', 'A', '0', '0', '0', 'V1', 'ACCOUNT_MANAGEMENT', '0', 'System', '2021-02-03 22:36:42', null, null, null, null);
INSERT INTO `umm_menu` VALUES ('53', 'Admin', 'Admin', 'fa fa-key', '/home/admin', null, 'S', '67', null, 'Admin', '0', 'fa fa-key', 'Admin', 'Admin', 'A', '1', '1', '1', 'V2', 'ADMIN', '1', 'System', '2021-02-07 01:02:09', null, null, null, null);
INSERT INTO `umm_menu` VALUES ('54', 'Dashboard', 'Dashboard', 'fa fa-th-large', '/home/dashboard', null, 'S', '67', null, 'Admin', '0', 'fa fa-th-large', 'Dashboard', 'Dashboard', 'A', '1', '1', '1', 'V2', 'DASHBOARD', '1', 'System', '2021-02-07 01:02:09', null, null, null, null);
INSERT INTO `umm_menu` VALUES ('55', 'Settings', 'Settings', 'fa fa-cog', '/home/settings', null, 'S', '67', null, 'Admin', '0', 'fa fa-cog', 'Settings', 'Settings', 'A', '1', '1', '0', 'V2', 'SETTINGS', '1', 'System', '2021-02-07 01:02:09', null, null, null, null);
INSERT INTO `umm_menu` VALUES ('56', 'Automation', 'Automation', 'fa fa-tasks', '/home/automation', null, 'S', '67', null, 'Admin', '0', 'fa fa-tasks', 'Automations', 'Automations', 'A', '1', '1', '0', 'V2', 'AUTOMATION', '1', 'System', '2021-02-07 01:02:09', null, null, null, null);
INSERT INTO `umm_menu` VALUES ('57', 'Vendors', 'Vendors', 'fa fa-user', '/home/vendor', null, 'S', '68', null, 'Admin', '0', 'fa fa-user', 'Vendors', 'Vendors', 'A', '0', '1', '0', 'V2', 'VENDORS', '1', 'System', '2021-02-07 01:02:09', null, null, null, null);
INSERT INTO `umm_menu` VALUES ('58', 'Bills', 'Bills', 'fa fa-file-text-o', '/home/vendor', null, 'S', '68', null, 'Admin', '0', 'fa fa-file-text-o', 'Bills', 'Bills', 'A', '0', '1', '0', 'V2', 'BILL_MANAGEMENT', '0', 'System', '2021-02-07 01:02:09', null, null, null, null);
INSERT INTO `umm_menu` VALUES ('59', 'Purchase Orders', 'Purchase Orders', 'fa fa-money', '/home/purchase-order', null, 'S', '68', null, 'Admin', '0', 'fa fa-money', 'PO', 'PO', 'A', '0', '1', '1', 'V2', 'PO', '0', 'System', '2021-02-12 00:52:56', null, null, null, null);
INSERT INTO `umm_menu` VALUES ('60', 'Expenses', 'Expenses', 'fa fa-credit-card', '/home/expense', null, 'S', '68', null, 'Admin', '0', 'fa fa-credit-card', 'Expenses', 'Expenses', 'A', '0', '1', '0', 'V2', 'EXPENSES', '1', 'System', '2021-02-07 01:02:09', null, null, null, null);
INSERT INTO `umm_menu` VALUES ('61', 'Items', 'Items', 'fa fa-cube', '/home/item', null, 'S', '67', null, 'Admin', '0', 'fa fa-cube', 'Items', 'Items', 'A', '0', '1', '1', 'V2', 'ITEMS', '1', 'System', '2021-02-07 01:02:09', null, null, null, null);
INSERT INTO `umm_menu` VALUES ('62', 'Accounts', 'Accounts', 'fa fa-industry', '/home/account', null, 'S', '67', null, 'Admin', '0', 'fa fa-industry', 'Accounts', 'Accounts', 'A', '0', '1', '0', 'V2', 'ACCOUNTS', '1', 'System', '2021-02-07 01:02:09', null, null, null, null);
INSERT INTO `umm_menu` VALUES ('63', 'Project Codes', 'Project Codes', 'fa fa-code', '/home/project-code', null, 'S', '69', null, 'Admin', '0', 'fa fa-code', 'Project Codes', 'Project Codes', 'A', '0', '1', '0', 'V2', 'PROJECT_CODES', '1', 'System', '2021-02-07 01:02:09', null, null, null, null);
INSERT INTO `umm_menu` VALUES ('64', 'Users', 'Users', 'fa fa-user', '/home/admin', '0', 'S', '53', null, 'Admin', '0', 'fa fa-user', 'Users', 'Users', 'A', '1', '1', '1', 'V2', 'USERS', '0', 'System', '2021-02-11 10:23:46', null, null, null, null);
INSERT INTO `umm_menu` VALUES ('65', 'Roles', 'Roles', 'fa fa-lock', '/home/admin', '1', 'S', '53', null, 'Admin', '0', 'fa fa-lock', 'Roles', 'Roles', 'A', '1', '1', '1', 'V2', 'ROLES', '0', 'System', '2021-02-11 10:21:22', null, null, null, null);
INSERT INTO `umm_menu` VALUES ('66', 'Approval Groups', 'Approval Groups', 'fa fa-users', '/home/admin', '2', 'S', '53', null, 'Admin', '0', 'fa fa-users', 'Approval Groups', 'Approval Groups', 'A', '1', '1', '1', 'V2', 'APPROVAL_GROUPS', '0', 'System', '2021-02-11 10:21:25', null, null, null, null);
INSERT INTO `umm_menu` VALUES ('67', 'Company', 'Company', 'fa fa-home', '', null, 'M', null, null, 'Admin', '0', 'fa fa-home', 'Company', 'Company', 'A', '1', '1', '0', 'V2', 'CPMPANY', '0', 'System', '2021-02-06 16:31:26', null, null, null, null);
INSERT INTO `umm_menu` VALUES ('68', 'Payable', 'Payable', 'fa fa-industry', '', null, 'M', null, null, 'Admin', '0', 'fa fa-industry', 'Payable', 'Payable', 'A', '1', '1', '0', 'V2', 'PAYABLE', '0', 'System', '2021-02-06 17:15:39', null, null, null, null);
INSERT INTO `umm_menu` VALUES ('69', 'Receivable', 'Receivable', 'fa fa-cube', '', null, 'M', null, null, 'Admin', '0', 'fa fa-industry', 'Receivable', 'Receivable', 'A', '1', '1', '0', 'V2', 'RECEIVABLE', '0', 'System', '2021-02-06 16:31:57', null, null, null, null);
INSERT INTO `umm_menu` VALUES ('70', 'Company Profile', 'Company Profile', 'fa fa-building', '/home/settings', '0', 'S', '55', null, 'Admin', '0', 'fa fa-building', 'Company Profile', 'Company Profile', 'A', '1', '1', '1', 'V2', 'COMPANY_PROFILE', '0', 'System', '2021-02-11 10:21:28', null, null, null, null);
INSERT INTO `umm_menu` VALUES ('71', 'Additional Fields', 'Additional Fields', 'fa fa-pencil-square-o', '/home/settings', '1', 'S', '55', null, 'Admin', '0', 'fa fa-pencil-square-o', 'Additional Fields', 'Additional Fields', 'A', '1', '1', '1', 'V2', 'ADDITIONAL_FIELDS', '0', 'System', '2021-02-11 10:21:30', null, null, null, null);
INSERT INTO `umm_menu` VALUES ('72', 'Bills', 'Bills', 'fa fa-file-text-o', '/home/bills', '0', 'S', '58', null, 'Admin', '0', 'fa fa-file-text-o', 'Bills', 'Bills', 'A', '1', '1', '1', 'V2', 'BILL', '1', 'System', '2021-02-11 10:21:36', null, null, null, null);
INSERT INTO `umm_menu` VALUES ('73', 'Bill Payments', 'Bill Payments', 'fa fa-list-alt', '/home/bills', '1', 'S', '58', null, 'Admin', '0', 'fa fa-list-alt', 'Bill Payments', 'Bill Payments', 'A', '1', '1', '1', 'V2', 'BILL_PAYMENT', '0', 'System', '2021-02-11 10:21:39', null, null, null, null);
INSERT INTO `umm_menu` VALUES ('74', 'Purchase Orders', 'Purchase Orders', 'fa fa-money', '/home/purchase-order', '0', 'S', '59', null, 'Admin', '0', 'fa fa-money', 'Purchase Orders', 'Purchase Orders', 'A', '1', '1', '1', 'V2', 'PURCHASE_ORDER', '1', 'System', '2021-02-12 00:52:38', null, null, null, null);
INSERT INTO `umm_menu` VALUES ('75', 'PO Receipts', 'PO Receipts', 'fa fa-usd', '/home/purchase-order', '1', 'S', '59', null, 'Admin', '0', 'fa fa-usd', 'PO Receipts', 'PO Receipts', 'A', '1', '1', '1', 'V2', 'PO_RECEIPT', '0', 'System', '2021-02-12 00:52:14', null, null, null, null);
INSERT INTO `umm_menu` VALUES ('76', 'Sub Accounts', 'Sub Accounts', 'fa fa-users', '/home/sub-accounts', null, 'S', '67', null, 'Admin', '0', 'fa fa-users', 'Sub Accounts', 'Sub Accounts', 'A', '1', '0', '0', 'V2', 'SUB_ACCOUNT', '0', 'System', '2021-02-12 00:52:03', null, null, null, null);

-- ----------------------------
-- Table structure for umm_menu_privilage
-- ----------------------------
DROP TABLE IF EXISTS `umm_menu_privilage`;
CREATE TABLE `umm_menu_privilage` (
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

-- ----------------------------
-- Records of umm_menu_privilage
-- ----------------------------
INSERT INTO `umm_menu_privilage` VALUES ('1', '3', '1', 'USER_MANAGEMENT_CREATE', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('2', '3', '2', 'USER_MANAGEMENT_SEARCH', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('3', '3', '3', 'USER_MANAGEMENT_DETAIL_VIEW', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('4', '3', '4', 'USER_MANAGEMENT_EDIT', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('5', '3', '5', 'USER_MANAGEMENT_DELETE', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('6', '4', '1', 'ROLE_MANAGEMENT_CREATE', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('7', '4', '2', 'ROLE_MANAGEMENT_SEARCH', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('8', '4', '3', 'ROLE_MANAGEMENT_DETAIL_VIEW', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('9', '4', '4', 'ROLE_MANAGEMENT_EDIT', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('10', '4', '5', 'ROLE_MANAGEMENT_DELETE', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('11', '6', '1', 'VENDOR_MANAGEMENT_CREATE', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('12', '6', '2', 'VENDOR_MANAGEMENT_SEARCH', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('13', '6', '3', 'VENDOR_MANAGEMENT_DETAIL_VIEW', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('14', '6', '4', 'VENDOR_MANAGEMENT_EDIT', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('15', '6', '5', 'VENDOR_MANAGEMENT_DELETE', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('19', '8', '1', 'WORKFLOW_CONFIGURATION_CREATE', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('20', '8', '2', 'WORKFLOW_CONFIGURATION_SEARCH', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('21', '8', '3', 'WORKFLOW_CONFIGURATION_DETAIL_VIEW', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('22', '8', '4', 'WORKFLOW_CONFIGURATION_EDIT', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('23', '8', '5', 'WORKFLOW_CONFIGURATION_DELETE', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('24', '9', '8', 'UPLOAD_INVOICE_UPLOAD', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('25', '10', '5', 'REVIEW_INVOICE_DELETE', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('26', '10', '11', 'REVIEW_INVOICE_SUBMIT', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('27', '11', '2', 'INVOICE_APPROVAL_SEARCH', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('28', '11', '3', 'INVOICE_APPROVAL_DETAIL_VIEW', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('29', '11', '6', 'INVOICE_APPROVAL_APPROVE', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('30', '11', '7', 'INVOICE_APPROVAL_REJECT', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('31', '11', '10', 'INVOICE_APPROVAL_VIEW_AUDIT_TRAIL', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('33', '12', '8', 'PROJECT_CODE_MANAGEMENT_UPLOAD', 'admin', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('34', '3', '8', 'USER_MANAGEMENT_UPLOAD', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('35', '12', '2', 'PROJECT_CODE_MANAGEMENT_SEARCH', 'admin', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('36', '12', '13', 'PROJECT_CODE_MANAGEMENT_INACTIVATE', 'admin', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('37', '12', '14', 'PROJECT_CODE_MANAGEMENT_ACTIVATE', 'admin', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('38', '3', '15', 'USER_MANAGEMENT_RESET_PASSWORD', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('39', '4', '13', 'ROLE_MANAGEMENT_INACTIVATE', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('40', '4', '14', 'ROLE_MANAGEMENT_ACTIVATE', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('41', '13', '16', 'INVOICE_SEARCH_ASSIGNEE_CHANGE', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('42', '13', '17', 'INVOICE_SEARCH_UNDO_APPROVAL', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('43', '13', '18', 'INVOICE_SEARCH_UNDO_REJECTION', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('44', '13', '2', 'INVOICE_SEARCH_SEARCH', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('45', '13', '3', 'INVOICE_SEARCH_DETAIL_VIEW', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('48', '13', '10', 'INVOICE_SEARCH_VIEW_AUDIT_TRAIL', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('49', '13', '12', 'INVOICE_SEARCH_RE_SUBMIT', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('51', '14', '22', 'DASHBOARD_SYSTEM_SHORTCUTS', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('52', '14', '23', 'DASHBOARD_INVOICE_SUMMARY ', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('53', '14', '24', 'DASHBOARD_ACCUMULATED_INVOICE_SUMMARY ', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('54', '14', '25', 'DASHBOARD_INVOICE_APPROVAL', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('55', '20', '1', 'E_INVOICE_CREATE', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('59', '21', '1', 'PAYMENT_MANAGEMENT_CREATE', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('60', '21', '26', 'PAYMENT_MANAGEMENT_CHANGE_INVOICE', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('61', '21', '27', 'PAYMENT_MANAGEMENT_MARK_AS_MAILED', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('62', '21', '28', 'PAYMENT_MANAGEMENT_REVOKE_PAYMENT', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('64', '13', '5', 'INVOICE_SEARCH_DELETE', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('65', '22', '29', 'SYNC_DASHBOARD_CHECK_SYNC', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('66', '22', '30', 'SYNC_DASHBOARD_VENDOR_SYNC', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('67', '22', '31', 'SYNC_DASHBOARD_CHANGE_AUTO_SYNC_STATUS', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('68', '22', '32', 'SYNC_DASHBOARD_VIEW_CHECK_SYNC_HISTORY', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('69', '22', '33', 'SYNC_DASHBOARD_VIEW_VENDOR_SYNC_HISTORY', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('70', '14', '34', 'DASHBOARD_VIEW_DISCOUNT_APPLICABLE_INVOICES', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('71', '21', '2', 'PAYMENT_MANAGEMENT_SEARCH', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('72', '21', '35', 'PAYMENT_MANAGEMENT_VIEW_INVOICE', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('73', '23', '1', 'APPROVAL_GROUP_MANAGEMENT_CREATE', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('74', '23', '2', 'APPROVAL_GROUP_MANAGEMENT_SEARCH', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('75', '23', '4', 'APPROVAL_GROUP_MANAGEMENT_EDIT', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('76', '23', '5', 'APPROVAL_GROUP_MANAGEMENT_DELETE', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('77', '23', '13', 'APPROVAL_GROUP_MANAGEMENT_INACTIVATE', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('78', '23', '14', 'APPROVAL_GROUP_MANAGEMENT_ACTIVATE', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('79', '6', '8', 'VENDOR_MANAGEMENT_UPLOAD', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('85', '28', '37', 'SETTINGS_CHANGE_PACKAGE', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('86', '30', '1', 'CLIENT_MANAGEMENT_CREATE', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('87', '30', '2', 'CLIENT_MANAGEMENT_SEARCH', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('88', '30', '3', 'CLIENT_MANAGEMENT_DETAIL_VIEW', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('89', '30', '4', 'CLIENT_MANAGEMENT_EDIT', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('90', '30', '5', 'CLIENT_MANAGEMENT_DELETE', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('91', '12', '1', 'PROJECT_CODE_MANAGEMENT_CREATE', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('92', '32', '1', 'EMPLOYEE_MANAGEMENT_CREATE', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('93', '32', '2', 'EMPLOYEE_MANAGEMENT_SEARCH', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('94', '32', '4', 'EMPLOYEE_MANAGEMENT_EDIT', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('95', '32', '5', 'EMPLOYEE_MANAGEMENT_DELETE', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('96', '32', '13', 'EMPLOYEE_MANAGEMENT_INACTIVATE', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('97', '32', '14', 'EMPLOYEE_MANAGEMENT_ACTIVATE', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('98', '32', '8', 'EMPLOYEE_MANAGEMENT_UPLOAD', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('99', '33', '1', 'OPPORTUNITY_MANAGEMENT_CREATE', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('100', '33', '2', 'OPPORTUNITY_MANAGEMENT_SEARCH', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('101', '33', '3', 'OPPORTUNITY_MANAGEMENT_DETAIL_VIEW', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('102', '33', '4', 'OPPORTUNITY_MANAGEMENT_EDIT', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('103', '33', '5', 'OPPORTUNITY_MANAGEMENT_DELETE', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('105', '34', '1', 'PROPOSAL_MANAGEMENT_CREATE', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('106', '34', '2', 'PROPOSAL_MANAGEMENT_SEARCH', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('107', '34', '3', 'PROPOSAL_MANAGEMENT_DETAIL_VIEW', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('108', '34', '4', 'PROPOSAL_MANAGEMENT_EDIT', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('109', '34', '5', 'PROPOSAL_MANAGEMENT_DELETE', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('110', '34', '10', 'PROPOSAL_MANAGEMENT_VIEW_AUDIT_TRAIL', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('111', '35', '1', 'PROJECT_MANAGEMENT_CREATE', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('112', '35', '2', 'PROJECT_MANAGEMENT_SEARCH', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('113', '35', '3', 'PROJECT_MANAGEMENT_DETAIL_VIEW', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('114', '35', '4', 'PROJECT_MANAGEMENT_EDIT', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('115', '35', '5', 'PROJECT_MANAGEMENT_DELETE', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('116', '35', '10', 'PROJECT_MANAGEMENT_VIEW_AUDIT_TRAIL', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('117', '36', '6', 'PROPOSAL_APPROVAL_APPROVE', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('118', '36', '7', 'PROPOSAL_APPROVAL_REJECT', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('119', '37', '1', 'EXPENSE_MANAGEMENT_CREATE', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('120', '37', '2', 'EXPENSE_MANAGEMENT_SEARCH', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('121', '34', '16', 'PROPOSAL_MANAGEMENT_ASSIGNEE_CHANGE', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('122', '40', '6', 'OPPORTUNITY_APPROVAL_APPROVE', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('123', '40', '7', 'OPPORTUNITY_APPROVAL_REJECT', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('131', '34', '38', 'PROPOSAL_MANAGEMENT_SKIP_APPROVAL', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('132', '37', '4', 'EXPENSE_MANAGEMENT_EDIT', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('133', '37', '5', 'EXPENSE_MANAGEMENT_DELETE', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('134', '37', '10', 'EXPENSE_MANAGEMENT_VIEW_AUDIT_TRAIL', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('135', '37', '16', 'EXPENSE_MANAGEMENT_ASSIGNEE_CHANGE', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('136', '37', '38', 'EXPENSE_MANAGEMENT_SKIP_APPROVAL', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('137', '41', '6', 'PROJECT_APPROVAL_APPROVE', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('138', '41', '7', 'PROJECT_APPROVAL_REJECT', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('139', '38', '6', 'EXPENSE_APPROVAL_APPROVE', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('140', '38', '7', 'EXPENSE_APPROVAL_REJECT', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('141', '38', '39', 'EXPENSE_APPROVAL_DOWNLOAD_RECEIPT', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('144', '33', '16', 'OPPORTUNITY_MANAGEMENT_ASSIGNEE_CHANGE', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('145', '33', '10', 'OPPORTUNITY_MANAGEMENT_VIEW_AUDIT_TRAIL', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('146', '33', '38', 'OPPORTUNITY_MANAGEMENT_SKIP_APPROVAL', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('147', '40', '40', 'OPPORTUNITY_APPROVAL_OVERRIDE_APPROVAL', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('148', '36', '40', 'PROPOSAL_APPROVAL_OVERRIDE_APPROVAL', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('149', '41', '40', 'PROJECT_APPROVAL_OVERRIDE_APPROVAL', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('150', '38', '40', 'EXPENSE_APPROVAL_OVERRIDE_APPROVAL', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('151', '42', '1', 'PURCHASE_ORDER_MANAGEMENT_CREATE', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('152', '42', '2', 'PURCHASE_ORDER_MANAGEMENT_SEARCH', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('153', '42', '3', 'PURCHASE_ORDER_MANAGEMENT_DETAIL_VIEW', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('154', '42', '4', 'PURCHASE_ORDER_MANAGEMENT_EDIT', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('155', '42', '5', 'PURCHASE_ORDER_MANAGEMENT_DELETE', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('156', '42', '10', 'PURCHASE_ORDER_MANAGEMENT_VIEW_AUDIT_TRAIL', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('157', '42', '16', 'PURCHASE_ORDER_MANAGEMENT_ASSIGNEE_CHANGE', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('158', '42', '38', 'PURCHASE_ORDER_MANAGEMENT_SKIP_APPROVAL', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('159', '42', '39', 'PURCHASE_ORDER_MANAGEMENT_DOWNLOAD_RECEIPT', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('160', '43', '6', 'PURCHASE_ORDER_APPROVAL_APPROVE', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('161', '43', '7', 'PURCHASE_ORDER_APPROVAL_REJECT', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('162', '21', '39', 'PAYMENT_MANAGEMENT_DOWNLOAD_RECEIPT', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('166', '43', '39', 'PURCHASE_ORDER_APPROVAL_DOWNLOAD_RECEIPT', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('167', '35', '16', 'PROJECT_MANAGEMENT_ASSIGNEE_CHANGE', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('168', '35', '38', 'PROJECT_MANAGEMENT_SKIP_APPROVAL', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('170', '43', '40', 'PURCHASE_ORDER_APPROVAL_OVERRIDE_APPROVAL', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('171', '13', '38', 'INVOICE_SEARCH_SKIP_APPROVAL', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('172', '11', '40', 'INVOICE_APPROVAL_OVERRIDE_APPROVAL', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('173', '45', '1', 'PURCHASE_ORDER_RECEIPT_CREATE', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('174', '45', '2', 'PURCHASE_ORDER_RECEIPT_SEARCH', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('175', '45', '4', 'PURCHASE_ORDER_RECEIPT_EDIT', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('176', '45', '5', 'PURCHASE_ORDER_RECEIPT_DELETE', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('177', '45', '41', 'PURCHASE_ORDER_RECEIPT_CLOSE_PO_RECEIPT', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('180', '12', '43', 'PROJECT_CODE_MANAGEMENT_EDIT_DESCRIPTION', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('181', '42', '42', 'PURCHASE_ORDER_MANAGEMENT_GENERATE_AN_INVOICE', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('182', '13', '44', 'INVOICE_SEARCH_GENERATE_DETAILED_REPORT', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('183', '45', '45', 'PURCHASE_ORDER_RECEIPT_OPEN_PO_RECEIPT', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('184', '11', '46', 'INVOICE_APPROVAL_DOWNLOAD_INVOICE', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('185', '13', '46', 'INVOICE_SEARCH_DOWNLOAD_INVOICE', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('186', '37', '44', 'EXPENSE_MANAGEMENT_GENERATE_DETAILED_REPORT', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('187', '13', '47', 'INVOICE_SEARCH_CSV_EXPORT', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('188', '21', '48', 'PAYMENT_MANAGEMENT_CSV_IMPORT', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('189', '37', '47', 'EXPENSE_MANAGEMENT_CSV_EXPORT', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('193', '21', '3', 'PAYMENT_MANAGEMENT_DETAIL_VIEW', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('201', '6', '50', 'VENDOR_MANAGEMENT_APPROVE_PERMISSION_REQUEST', 'Sytem', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('202', '6', '51', 'VENDOR_MANAGEMENT_REJECTPERMISSION_REQUEST', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('203', '51', '1', 'ITEM_MANAGEMENT_CREATE', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('204', '51', '2', 'ITEM_MANAGEMENT_SEARCH', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('205', '51', '3', 'ITEM_MANAGEMENT_DETAIL_VIEW', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('206', '51', '4', 'ITEM_MANAGEMENT_EDIT', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('207', '51', '5', 'ITEM_MANAGEMENT_DELETE', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('208', '52', '1', 'ACCOUNT_MANAGEMENT_CREATE', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('209', '52', '2', 'ACCOUNT_MANAGEMENT_SEARCH', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('210', '52', '4', 'ACCOUNT_MANAGEMENT_EDIT', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('211', '52', '5', 'ACCOUNT_MANAGEMENT_DELETE', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('212', '52', '3', 'ACCOUNT_MANAGEMENT_DETAIL_VIEW', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('213', '12', '5', 'PROJECT_CODE_MANAGEMENT_DELETE', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('214', '6', '54', 'VENDOR_MANAGEMENT_ADD_VENDOR', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('215', '64', '1', 'USERS_CREATE', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('216', '64', '5', 'USERS_DELETE', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('217', '64', '13', 'USERS_INACTIVATE', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('218', '64', '14', 'USERS_ACTIVATE', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('219', '64', '4', 'USERS_EDIT', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('220', '64', '3', 'USERS_DETAIL_VIEW', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('221', '64', '55', 'USERS_UNLOCK', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('222', '64', '8', 'USERS_UPLOAD', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('223', '65', '1', 'ROLES_CREATE', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('224', '65', '5', 'ROLES_DELETE', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('225', '65', '13', 'ROLES_INACTIVATE', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('226', '65', '14', 'ROLES_ACTIVATE', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('227', '65', '3', 'ROLES_DETAIL_VIEW', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('228', '65', '4', 'ROLES_EDIT', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('229', '66', '1', 'APPROVAL_GROUPS_CREATE', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('230', '66', '4', 'APPROVAL_GROUPS_EDIT', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('231', '66', '5', 'APPROVAL_GROUPS_DELETE', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('232', '66', '13', 'APPROVAL_GROUPS_INACTIVATE', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('233', '66', '14', 'APPROVAL_GROUPS_ACTIVATE', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('234', '66', '8', 'APPROVAL_GROUPS_UPLOAD', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('235', '70', '4', 'COMPANY_PROFILE_EDIT', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('236', '70', '37', 'COMPANY_PROFILE_CHANGE_PACKAGE', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('237', '70', '56', 'COMPANY_PROFILE_CONVERT_TO_PORTAL', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('238', '71', '1', 'ADDITIONAL_FIELDS_CREATE', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('239', '71', '4', 'ADDITIONAL_FIELDS_EDIT', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('240', '71', '5', 'ADDITIONAL_FIELDS_DELETE', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('241', '71', '13', 'ADDITIONAL_FIELDS_INACTIVATE', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('242', '71', '14', 'ADDITIONAL_FIELDS_ACTIVATE', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('243', '56', '1', 'AUTOMATION_CREATE', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('244', '56', '4', 'AUTOMATION_EDIT', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('245', '56', '5', 'AUTOMATION_DELETE', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('246', '56', '13', 'AUTOMATION_INACTIVATE', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('247', '56', '14', 'AUTOMATION_ACTIVATE', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('248', '56', '3', 'AUTOMATION_DETAIL_VIEW', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('249', '61', '1', 'ITEMS_CREATE', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('250', '61', '8', 'ITEMS_UPLOAD', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('251', '61', '4', 'ITEMS_EDIT', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('252', '61', '5', 'ITEMS_DELETE', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('253', '61', '13', 'ITEMS_INACTIVATE', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('254', '61', '14', 'ITEMS_ACTIVATE', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('255', '61', '3', 'ITEMS_DETAIL_VIEW', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('256', '62', '1', 'ACCOUNTS_CREATE', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('257', '62', '8', 'ACCOUNTS_UPLOAD', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('258', '62', '4', 'ACCOUNTS_EDIT', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('259', '62', '5', 'ACCOUNTS_DELETE', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('260', '62', '13', 'ACCOUNTS_INACTIVATE', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('261', '62', '14', 'ACCOUNTS_ACTIVATE', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('262', '62', '3', 'ACCOUNTS_DETAIL_VIEW', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('263', '76', '1', 'SUB_ACCOUNT_CREATE', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('264', '76', '4', 'SUB_ACCOUNT_EDIT', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('265', '76', '5', 'SUB_ACCOUNT_DELETE', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('266', '76', '13', 'SUB_ACCOUNT_INACTIVATE', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('267', '76', '14', 'SUB_ACCOUNT_ACTIVATE', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('268', '76', '3', 'SUB_ACCOUNT_DETAIL_VIEW', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('269', '57', '1', 'VENDORS_CREATE', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('270', '57', '57', 'VENDORS_SEND_VENDOR_INVITATION', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('271', '57', '8', 'VENDORS_UPLOAD', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('272', '57', '58', 'VENDORS_MANAGE_VENDOR_REQUEST', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('273', '57', '4', 'VENDORS_EDIT', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('274', '57', '3', 'VENDORS_DETAIL_VIEW', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('275', '72', '1', 'BILL_CREATE', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('276', '72', '59', 'BILL_PROCESS', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('277', '72', '4', 'BILL_EDIT', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('278', '72', '6', 'BILL_APPROVE', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('279', '72', '7', 'BILL_REJECT', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('280', '72', '60', 'BILL_QUICK_APPROVE', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('281', '72', '38', 'BILL_SKIP_APPROVAL', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('282', '72', '3', 'BILL_DETAIL_VIEW', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('283', '72', '10', 'BILL_VIEW_AUDIT_TRAIL', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('284', '72', '61', 'BILL_DOWNLOAD_BILL', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('285', '72', '62', 'BILL_APPLY_PAYMENT', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('286', '72', '63', 'BILL_VIEW_PAYMENTS', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('287', '72', '5', 'BILL_DELETE', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('288', '72', '47', 'BILL_CSV_EXPORT', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('289', '73', '1', 'BILL_PAYMENT_CREATE', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('290', '73', '8', 'BILL_PAYMENT_UPLOAD', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('292', '73', '64', 'BILL_PAYMENT_CHANGE_BILL', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('293', '73', '27', 'BILL_PAYMENT_MARK_AS_MAILED', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('294', '73', '28', 'BILL_PAYMENT_REVOKE_PAYMENT', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('295', '73', '3', 'BILL_PAYMENT_DETAIL_VIEW', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('296', '73', '65', 'BILL_PAYMENT_VIEW_BILLS', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('297', '73', '47', 'BILL_PAYMENT_CSV_EXPORT', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('298', '73', '39', 'BILL_PAYMENT_DOWNLOAD_RECEIPT', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('299', '74', '1', 'PURCHASE_ORDER_CREATE', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('300', '74', '4', 'PURCHASE_ORDER_EDIT', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('301', '74', '3', 'PURCHASE_ORDER_DETAIL_VIEW', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('302', '74', '5', 'PURCHASE_ORDER_DELETE', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('303', '74', '6', 'PURCHASE_ORDER_APPROVE', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('304', '74', '7', 'PURCHASE_ORDER_REJECT', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('305', '74', '10', 'PURCHASE_ORDER_VIEW_AUDIT_TRAIL', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('306', '74', '47', 'PURCHASE_ORDER_CSV_EXPORT', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('307', '74', '66', 'PURCHASE_ORDER_DOWNLOAD_REPORT', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('308', '74', '60', 'PURCHASE_ORDER_QUICK_APPROVE', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('309', '75', '1', 'PO_RECEIPT_CREATE', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('310', '75', '4', 'PO_RECEIPT_EDIT', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('311', '75', '3', 'PO_RECEIPT_DETAIL_VIEW', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('312', '75', '5', 'PO_RECEIPT_DELETE', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('313', '75', '67', 'PO_RECEIPT_ATTACH_TO_A_BILL', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('314', '75', '41', 'PO_RECEIPT_CLOSE_PO_RECEIPT', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('315', '75', '47', 'PO_RECEIPT_CSV_EXPORT', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('316', '75', '66', 'PO_RECEIPT_DOWNLOAD_REPORT', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('317', '60', '1', 'EXPENSES_CREATE', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('318', '60', '4', 'EXPENSES_EDIT', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('319', '60', '5', 'EXPENSES_DELETE', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('320', '60', '6', 'EXPENSES_APPROVE', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('321', '60', '7', 'EXPENSES_REJECT', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('322', '60', '10', 'EXPENSES_VIEW_AUDIT_TRAIL', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('323', '60', '66', 'EXPENSES_DOWNLOAD_REPORT', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('324', '60', '68', 'EXPENSES_VIEW_REPORT', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('325', '60', '47', 'EXPENSES_CSV_EXPORT', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('326', '60', '60', 'EXPENSES_QUICK_APPROVE', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('327', '63', '1', 'PROJECT_CODES_CREATE', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('328', '63', '4', 'PROJECT_CODES_EDIT', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('329', '63', '5', 'PROJECT_CODES_DELETE', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('330', '63', '13', 'PROJECT_CODES_INACTIVATE', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('331', '63', '14', 'PROJECT_CODES_ACTIVATE', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('333', '63', '8', 'PROJECT_CODES_UPLOAD', 'System', '2021-02-12 01:01:39', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('334', '63', '47', 'PROJECT_CODES_CSV_EXPORT', 'System', '2021-02-12 01:01:39', null, null, null, null);

-- ----------------------------
-- Table structure for umm_privilages
-- ----------------------------
DROP TABLE IF EXISTS `umm_privilages`;
CREATE TABLE `umm_privilages` (
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

-- ----------------------------
-- Records of umm_privilages
-- ----------------------------
INSERT INTO `umm_privilages` VALUES ('1', 'Create', 'Create', 'CREATE', 'System', '2021-02-03 22:33:35', null, null, null, null);
INSERT INTO `umm_privilages` VALUES ('2', 'Search', 'Search', 'SEARCH', 'System', '2021-02-03 22:33:35', null, null, null, null);
INSERT INTO `umm_privilages` VALUES ('3', 'Detail View', 'Detail View', 'DETAIL_VIEW', 'System', '2021-02-03 22:33:35', null, null, null, null);
INSERT INTO `umm_privilages` VALUES ('4', 'Edit', 'Edit', 'EDIT', 'System', '2021-02-03 22:33:35', null, null, null, null);
INSERT INTO `umm_privilages` VALUES ('5', 'Delete', 'Delete', 'DELETE', 'System', '2021-02-03 22:33:35', null, null, null, null);
INSERT INTO `umm_privilages` VALUES ('6', 'Approve', 'Approve', 'APPROVE', 'System', '2021-02-03 22:33:35', null, null, null, null);
INSERT INTO `umm_privilages` VALUES ('7', 'Reject', 'Reject', 'REJECT', 'System', '2021-02-03 22:33:35', null, null, null, null);
INSERT INTO `umm_privilages` VALUES ('8', 'Upload', 'Upload', 'UPLOAD', 'System', '2021-02-03 22:33:35', null, null, null, null);
INSERT INTO `umm_privilages` VALUES ('10', 'View Audit Trail', 'View Audit Trail', 'VIEW_AUDIT_TRAIL', 'System', '2021-02-03 22:33:35', null, null, null, null);
INSERT INTO `umm_privilages` VALUES ('11', 'Submit', 'Submit', 'SUBMIT', 'System', '2021-02-03 22:33:35', null, null, null, null);
INSERT INTO `umm_privilages` VALUES ('12', 'Re-Submit', 'Re-Submit', 'RE_SUBMIT', 'System', '2021-02-03 22:33:35', null, null, null, null);
INSERT INTO `umm_privilages` VALUES ('13', 'Inactivate', 'Inactivate', 'INACTIVATE', 'System', '2021-02-03 22:33:35', null, null, null, null);
INSERT INTO `umm_privilages` VALUES ('14', 'Activate', 'Activate', 'ACTIVATE', 'System', '2021-02-03 22:33:35', null, null, null, null);
INSERT INTO `umm_privilages` VALUES ('15', 'Reset Password', 'Reset Password', 'RESET_PASSWORD', 'System', '2021-02-03 22:33:35', null, null, null, null);
INSERT INTO `umm_privilages` VALUES ('16', 'Assignee Change', 'Assignee Change', 'ASSIGNEE_CHANGE', 'System', '2021-02-03 22:33:35', null, null, null, null);
INSERT INTO `umm_privilages` VALUES ('17', 'Undo Approval', 'Undo Approval', 'UNDO_APPROVAL', 'System', '2021-02-03 22:33:35', null, null, null, null);
INSERT INTO `umm_privilages` VALUES ('18', 'Undo Rejection', 'Undo Rejection', 'UNDO_REJECTION', 'System', '2021-02-03 22:33:35', null, null, null, null);
INSERT INTO `umm_privilages` VALUES ('22', 'System Shortcuts', 'System Shortcuts', 'SYSTEM_SHORTCUTS', 'System', '2021-02-03 22:33:35', null, null, null, null);
INSERT INTO `umm_privilages` VALUES ('23', 'Invoice Summary ', 'Invoice Summary ', 'INVOICE_SUMMARY ', 'System', '2021-02-03 22:33:35', null, null, null, null);
INSERT INTO `umm_privilages` VALUES ('24', 'Accumulated Invoice Summary ', 'Accumulated Invoice Summary ', 'ACCUMULATED_INVOICE_SUMMARY ', 'System', '2021-02-03 22:33:35', null, null, null, null);
INSERT INTO `umm_privilages` VALUES ('25', 'Invoice Approval', 'Invoice Approval', 'INVOICE_APPROVAL', 'System', '2021-02-03 22:33:35', null, null, null, null);
INSERT INTO `umm_privilages` VALUES ('26', 'Change Invoice', 'Change Invoice', 'CHANGE_INVOICE', 'System', '2021-02-03 22:33:35', null, null, null, null);
INSERT INTO `umm_privilages` VALUES ('27', 'Mark As Mailed', 'Mark As Mailed', 'MARK_AS_MAILED', 'System', '2021-02-03 22:33:35', null, null, null, null);
INSERT INTO `umm_privilages` VALUES ('28', 'Void Payment', 'Void Payment', 'REVOKE_PAYMENT', 'System', '2021-02-12 00:08:43', null, null, null, null);
INSERT INTO `umm_privilages` VALUES ('29', 'Check Sync', 'Check Sync', 'CHECK_SYNC', 'System', '2021-02-03 22:33:35', null, null, null, null);
INSERT INTO `umm_privilages` VALUES ('30', 'Vendor Sync', 'Vendor Sync', 'VENDOR_SYNC', 'System', '2021-02-03 22:33:35', null, null, null, null);
INSERT INTO `umm_privilages` VALUES ('31', 'Change Auto Sync Status', 'Change Auto Sync Status', 'CHANGE_AUTO_SYNC_STATUS', 'System', '2021-02-03 22:33:35', null, null, null, null);
INSERT INTO `umm_privilages` VALUES ('32', 'View Check Sync History', 'View Check Sync History', 'VIEW_CHECK_SYNC_HISTORY', 'System', '2021-02-03 22:33:35', null, null, null, null);
INSERT INTO `umm_privilages` VALUES ('33', 'View Vendor Sync History', 'View Vendor Sync History', 'VIEW_VENDOR_SYNC_HISTORY', 'System', '2021-02-03 22:33:35', null, null, null, null);
INSERT INTO `umm_privilages` VALUES ('34', 'View Discount Applicable Invoices', 'View Discount Applicable Invoices', 'VIEW_DISCOUNT_APPLICABLE_INVOICES', 'System', '2021-02-03 22:33:35', null, null, null, null);
INSERT INTO `umm_privilages` VALUES ('35', 'View Invoice', 'View Invoice', 'VIEW_INVOICE', 'System', '2021-02-03 22:33:35', null, null, null, null);
INSERT INTO `umm_privilages` VALUES ('37', 'Change Package', 'Change Package', 'CHANGE_PACKAGE', 'System', '2021-02-03 22:33:35', null, null, null, null);
INSERT INTO `umm_privilages` VALUES ('38', 'Skip Approval', 'Skip Approval', 'SKIP_APPROVAL', 'System', '2021-02-03 22:33:35', null, null, null, null);
INSERT INTO `umm_privilages` VALUES ('39', 'Download Receipt', 'Download Receipt', 'DOWNLOAD_RECEIPT', 'System', '2021-02-03 22:33:35', null, null, null, null);
INSERT INTO `umm_privilages` VALUES ('40', 'Override Approval', 'Override Approval', 'OVERRIDE_APPROVAL', 'System', '2021-02-03 22:33:35', null, null, null, null);
INSERT INTO `umm_privilages` VALUES ('41', 'Close PO Receipt', 'Close PO Receipt', 'CLOSE_PO_RECEIPT', 'System', '2021-02-03 22:33:35', null, null, null, null);
INSERT INTO `umm_privilages` VALUES ('42', 'Generate an Invoice', 'Generate an Invoice', 'GENERATE_AN_INVOICE', 'System', '2021-02-03 22:33:35', null, null, null, null);
INSERT INTO `umm_privilages` VALUES ('43', 'Edit Description', 'Edit Description', 'EDIT_DESCRIPTION', 'System', '2021-02-03 22:33:35', null, null, null, null);
INSERT INTO `umm_privilages` VALUES ('44', 'Generate Detailed Report', 'Generate Detailed Report', 'GENERATE_DETAILED_REPORT', 'System', '2021-02-03 22:33:35', null, null, null, null);
INSERT INTO `umm_privilages` VALUES ('45', 'Open PO Receipt', 'Open PO Receipt', 'OPEN_PO_RECEIPT', 'System', '2021-02-03 22:33:35', null, null, null, null);
INSERT INTO `umm_privilages` VALUES ('46', 'Download Invoice', 'Download Invoice', 'DOWNLOAD_INVOICE', 'System', '2021-02-03 22:33:35', null, null, null, null);
INSERT INTO `umm_privilages` VALUES ('47', 'CSV Export', 'CSV Export', 'CSV_EXPORT', 'System', '2021-02-03 22:33:35', null, null, null, null);
INSERT INTO `umm_privilages` VALUES ('48', 'CSV Import', 'CSV Import', 'CSV_IMPORT', 'System', '2021-02-03 22:33:35', null, null, null, null);
INSERT INTO `umm_privilages` VALUES ('50', 'Approve Permission Request', 'Approve Permission Request', 'APPROVE_PERMISSION_REQUEST', 'System', '2021-02-03 22:33:35', null, null, null, null);
INSERT INTO `umm_privilages` VALUES ('51', 'Reject Permission Request', 'RejectPermission Request', 'REJECTPERMISSION_REQUEST', 'System', '2021-02-03 22:33:35', null, null, null, null);
INSERT INTO `umm_privilages` VALUES ('54', 'Add Vendor', 'Add Vendor', 'ADD_VENDOR', 'System', '2021-02-03 22:33:35', null, null, null, null);
INSERT INTO `umm_privilages` VALUES ('55', 'Unlock', 'Unlock', 'UNLOCK', 'System', '2021-02-11 22:23:37', null, null, null, null);
INSERT INTO `umm_privilages` VALUES ('56', 'Convert To Agency Portal', 'Convert To Agency Portal', 'CONVERT_TO_PORTAL', 'System', '2021-02-11 22:41:46', null, null, null, null);
INSERT INTO `umm_privilages` VALUES ('57', 'Send Vendor Invitation', 'Send Vendor Invitation', 'SEND_VENDOR_INVITATION', 'System', '2021-02-11 23:26:57', null, null, null, null);
INSERT INTO `umm_privilages` VALUES ('58', 'Manage Vendor Request', 'Manage Vendor Request', 'MANAGE_VENDOR_REQUEST', 'System', '2021-02-11 23:32:57', null, null, null, null);
INSERT INTO `umm_privilages` VALUES ('59', 'Process', 'Process', 'PROCESS', 'System', '2021-02-11 23:51:24', null, null, null, null);
INSERT INTO `umm_privilages` VALUES ('60', 'Quick Approve', 'Quick Approve', 'QUICK_APPROVE', 'System', '2021-02-11 23:53:21', null, null, null, null);
INSERT INTO `umm_privilages` VALUES ('61', 'Download Bill', 'Download Bill', 'DOWNLOAD_BILL', 'System', '2021-02-11 23:59:44', null, null, null, null);
INSERT INTO `umm_privilages` VALUES ('62', 'Apply Payments', 'Apply Payments', 'APPLY_PAYMENT', 'System', '2021-02-12 00:01:00', null, null, null, null);
INSERT INTO `umm_privilages` VALUES ('63', 'View Payments', 'View Payments', 'VIEW_PAYMENTS', 'System', '2021-02-12 00:01:26', null, null, null, null);
INSERT INTO `umm_privilages` VALUES ('64', 'Change Bill', 'Change Bill', 'CHANGE_BILL', 'System', '2021-02-12 00:06:22', null, null, null, null);
INSERT INTO `umm_privilages` VALUES ('65', 'View Bills', 'View Bills', 'VIEW_BILLS', 'System', '2021-02-12 00:09:06', null, null, null, null);
INSERT INTO `umm_privilages` VALUES ('66', 'Download Report', 'Download Report', 'DOWNLOAD_REPORT', 'System', '2021-02-12 00:18:06', null, null, null, null);
INSERT INTO `umm_privilages` VALUES ('67', 'Attach To a Bill', 'Attach To a Bill', 'ATTACH_TO_A_BILL', 'System', '2021-02-12 00:23:04', null, null, null, null);
INSERT INTO `umm_privilages` VALUES ('68', 'View Report', 'View Report', 'VIEW_REPORT', 'System', '2021-02-12 00:32:30', null, null, null, null);

-- ----------------------------
-- Table structure for umm_role_field_config
-- ----------------------------
DROP TABLE IF EXISTS `umm_role_field_config`;
CREATE TABLE `umm_role_field_config` (
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

-- ----------------------------
-- Records of umm_role_field_config
-- ----------------------------

-- ----------------------------
-- Table structure for umm_role_mst
-- ----------------------------
DROP TABLE IF EXISTS `umm_role_mst`;
CREATE TABLE `umm_role_mst` (
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

-- ----------------------------
-- Records of umm_role_mst
-- ----------------------------
INSERT INTO `umm_role_mst` VALUES ('6', 'System Admin Role', 'A', null, 'admin', '2019-07-03 14:18:40', 'admin', null, null, null);
INSERT INTO `umm_role_mst` VALUES ('7', 'Employee - expense only', 'A', null, 'admin', '2020-05-12 10:06:41', null, null, null, null);
INSERT INTO `umm_role_mst` VALUES ('8', 'AP Invoice Processor', 'A', null, 'admin', '2020-05-12 10:10:50', null, null, null, null);
INSERT INTO `umm_role_mst` VALUES ('9', 'Controller', 'A', null, 'admin', '2020-05-12 10:13:45', null, null, null, null);
INSERT INTO `umm_role_mst` VALUES ('10', 'Purchasing', 'A', null, 'admin', '2020-05-12 10:18:41', null, null, null, null);
INSERT INTO `umm_role_mst` VALUES ('11', 'Project Manager', 'A', null, 'admin', '2020-05-12 10:24:55', null, null, null, null);
INSERT INTO `umm_role_mst` VALUES ('12', 'Finance Manager', 'A', null, 'admin', '2020-05-12 10:27:30', null, null, null, null);
INSERT INTO `umm_role_mst` VALUES ('13', 'CFO', 'A', null, 'admin', '2020-05-12 10:28:52', null, null, null, null);
INSERT INTO `umm_role_mst` VALUES ('14', 'Vendor', 'A', null, 'admin', '2020-05-12 10:33:15', null, null, null, null);
INSERT INTO `umm_role_mst` VALUES ('15', 'Business Manager', 'A', null, 'admin', '2020-05-12 10:36:26', null, null, null, null);

-- ----------------------------
-- Table structure for umm_role_previlege
-- ----------------------------
DROP TABLE IF EXISTS `umm_role_previlege`;
CREATE TABLE `umm_role_previlege` (
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
) ENGINE=InnoDB AUTO_INCREMENT=718 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of umm_role_previlege
-- ----------------------------
INSERT INTO `umm_role_previlege` VALUES ('1', '6', '30', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('2', '6', '187', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('3', '6', '55', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('4', '6', '60', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('5', '6', '61', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('6', '6', '62', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('7', '6', '71', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('8', '6', '72', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('9', '6', '162', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('10', '6', '188', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('11', '6', '119', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('12', '6', '120', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('13', '6', '132', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('14', '6', '185', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('15', '6', '182', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('16', '6', '31', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('17', '6', '172', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('18', '6', '184', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('19', '6', '41', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('20', '6', '42', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('21', '6', '43', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('22', '6', '44', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('23', '6', '45', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('24', '6', '48', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('25', '6', '49', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('26', '6', '64', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('27', '6', '171', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('28', '6', '133', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('29', '6', '134', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('30', '6', '135', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('31', '6', '158', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('32', '6', '159', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('33', '6', '181', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('34', '6', '160', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('35', '6', '161', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('36', '6', '166', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('37', '6', '170', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('38', '6', '163', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('39', '6', '164', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('40', '6', '165', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('41', '6', '173', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('42', '6', '174', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('43', '6', '157', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('44', '6', '156', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('45', '6', '136', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('46', '6', '186', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('47', '6', '189', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('48', '6', '139', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('49', '6', '140', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('50', '6', '141', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('51', '6', '150', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('52', '6', '151', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('53', '6', '152', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('54', '6', '153', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('55', '6', '154', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('56', '6', '155', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('57', '6', '175', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('58', '6', '29', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('59', '6', '98', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('60', '6', '103', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('61', '6', '144', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('62', '6', '145', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('63', '6', '146', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('64', '6', '105', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('65', '6', '106', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('66', '6', '107', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('67', '6', '108', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('68', '6', '109', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('69', '6', '110', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('70', '6', '121', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('71', '6', '131', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('72', '6', '102', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('73', '6', '101', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('74', '6', '51', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('75', '6', '52', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('76', '6', '53', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('77', '6', '54', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('78', '6', '70', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('79', '6', '86', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('80', '6', '87', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('81', '6', '88', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('82', '6', '89', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('83', '6', '90', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('84', '6', '99', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('85', '6', '100', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('86', '6', '111', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('87', '6', '113', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('88', '6', '114', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('89', '6', '12', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('90', '6', '13', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('91', '6', '14', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('92', '6', '15', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('93', '6', '79', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('94', '6', '16', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('95', '6', '17', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('96', '6', '18', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('97', '6', '24', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('98', '6', '25', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('99', '6', '26', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('100', '6', '27', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('101', '6', '11', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('102', '6', '149', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('103', '6', '115', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('104', '6', '116', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('105', '6', '167', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('106', '6', '168', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('107', '6', '117', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('108', '6', '118', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('109', '6', '148', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('110', '6', '122', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('111', '6', '123', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('112', '6', '147', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('113', '6', '137', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('114', '6', '138', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('115', '6', '28', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('116', '6', '112', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('117', '6', '73', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('118', '6', '69', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('119', '6', '68', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('120', '6', '67', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('121', '6', '66', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('122', '6', '65', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('123', '6', '180', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('124', '6', '59', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('125', '6', '91', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('126', '6', '37', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('127', '6', '74', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('128', '6', '75', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('129', '6', '97', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('130', '6', '96', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('131', '6', '95', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('132', '6', '94', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('133', '6', '93', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('134', '6', '92', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('135', '6', '85', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('136', '6', '78', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('137', '6', '77', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('138', '6', '76', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('139', '6', '36', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('140', '6', '35', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('141', '6', '38', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('142', '6', '34', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('143', '6', '5', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('144', '6', '4', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('145', '6', '3', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('146', '6', '2', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('147', '6', '1', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('148', '6', '183', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('149', '6', '177', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('150', '6', '176', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('151', '6', '6', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('152', '6', '7', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('153', '6', '8', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('154', '6', '33', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('155', '6', '23', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('156', '6', '22', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('157', '6', '21', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('158', '6', '20', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('159', '6', '19', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('160', '6', '40', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('161', '6', '39', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('162', '6', '10', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('163', '6', '9', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('164', '7', '136', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('165', '7', '135', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('166', '7', '134', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('167', '7', '133', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('168', '7', '132', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('169', '7', '120', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('170', '7', '119', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('171', '7', '51', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('172', '8', '24', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('173', '8', '25', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('174', '8', '26', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('175', '8', '27', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('176', '8', '28', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('177', '8', '29', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('178', '8', '31', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('179', '8', '30', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('180', '8', '41', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('181', '8', '42', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('182', '8', '18', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('183', '8', '17', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('184', '8', '16', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('185', '8', '51', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('186', '8', '52', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('187', '8', '53', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('188', '8', '54', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('189', '8', '70', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('190', '8', '11', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('191', '8', '12', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('192', '8', '13', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('193', '8', '14', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('194', '8', '15', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('195', '8', '79', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('196', '8', '43', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('197', '8', '44', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('198', '8', '45', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('199', '8', '135', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('200', '8', '136', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('201', '8', '139', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('202', '8', '140', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('203', '8', '141', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('204', '8', '150', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('205', '8', '163', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('206', '8', '164', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('207', '8', '165', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('208', '8', '173', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('209', '8', '174', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('210', '8', '175', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('211', '8', '176', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('212', '8', '177', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('213', '8', '183', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('214', '8', '134', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('215', '8', '133', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('216', '8', '132', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('217', '8', '48', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('218', '8', '49', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('219', '8', '64', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('220', '8', '171', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('221', '8', '182', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('222', '8', '55', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('223', '8', '59', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('224', '8', '60', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('225', '8', '61', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('226', '8', '62', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('227', '8', '71', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('228', '8', '72', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('229', '8', '162', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('230', '8', '119', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('231', '8', '120', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('232', '9', '29', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('233', '9', '55', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('234', '9', '160', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('235', '9', '181', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('236', '9', '159', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('237', '9', '95', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('238', '9', '156', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('239', '9', '155', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('240', '9', '154', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('241', '9', '153', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('242', '9', '161', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('243', '9', '166', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('244', '9', '175', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('245', '9', '94', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('246', '9', '174', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('247', '9', '173', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('248', '9', '165', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('249', '9', '164', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('250', '9', '163', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('251', '9', '170', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('252', '9', '152', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('253', '9', '151', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('254', '9', '119', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('255', '9', '162', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('256', '9', '72', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('257', '9', '71', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('258', '9', '62', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('259', '9', '61', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('260', '9', '60', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('261', '9', '59', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('262', '9', '120', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('263', '9', '132', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('264', '9', '150', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('265', '9', '141', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('266', '9', '140', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('267', '9', '139', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('268', '9', '136', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('269', '9', '135', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('270', '9', '134', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('271', '9', '133', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('272', '9', '176', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('273', '9', '177', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('274', '9', '66', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('275', '9', '65', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('276', '9', '180', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('277', '9', '91', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('278', '9', '37', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('279', '9', '36', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('280', '9', '35', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('281', '9', '33', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('282', '9', '67', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('283', '9', '68', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('284', '9', '85', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('285', '9', '78', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('286', '9', '77', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('287', '9', '76', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('288', '9', '75', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('289', '9', '74', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('290', '9', '73', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('291', '9', '69', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('292', '9', '23', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('293', '9', '21', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('294', '9', '38', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('295', '9', '34', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('296', '9', '5', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('297', '9', '4', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('298', '9', '3', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('299', '9', '2', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('300', '9', '1', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('301', '9', '183', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('302', '9', '6', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('303', '9', '7', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('304', '9', '20', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('305', '9', '19', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('306', '9', '40', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('307', '9', '39', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('308', '9', '93', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('309', '9', '10', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('310', '9', '9', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('311', '9', '8', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('312', '9', '92', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('313', '9', '182', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('314', '9', '22', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('315', '9', '79', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('316', '9', '157', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('317', '9', '15', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('318', '9', '14', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('319', '9', '13', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('320', '9', '12', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('321', '9', '11', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('322', '9', '96', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('323', '9', '54', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('324', '9', '53', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('325', '9', '52', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('326', '9', '51', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('327', '9', '97', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('328', '9', '98', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('329', '9', '158', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('330', '9', '70', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('331', '9', '16', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('332', '9', '17', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('333', '9', '18', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('334', '9', '49', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('335', '9', '64', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('336', '9', '171', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('337', '9', '48', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('338', '9', '45', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('339', '9', '44', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('340', '9', '43', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('341', '9', '42', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('342', '9', '41', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('343', '9', '172', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('344', '9', '24', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('345', '9', '25', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('346', '9', '26', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('347', '9', '27', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('348', '9', '28', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('349', '9', '30', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('350', '9', '31', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('351', '10', '156', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('352', '10', '155', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('353', '10', '154', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('354', '10', '153', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('355', '10', '152', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('356', '10', '151', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('357', '10', '141', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('358', '10', '157', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('359', '10', '158', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('360', '10', '159', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('361', '10', '140', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('362', '10', '176', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('363', '10', '175', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('364', '10', '174', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('365', '10', '173', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('366', '10', '170', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('367', '10', '166', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('368', '10', '161', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('369', '10', '160', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('370', '10', '181', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('371', '10', '139', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('372', '10', '119', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('373', '10', '18', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('374', '10', '17', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('375', '10', '16', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('376', '10', '79', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('377', '10', '15', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('378', '10', '14', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('379', '10', '13', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('380', '10', '12', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('381', '10', '11', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('382', '10', '24', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('383', '10', '25', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('384', '10', '26', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('385', '10', '55', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('386', '10', '48', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('387', '10', '45', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('388', '10', '44', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('389', '10', '31', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('390', '10', '30', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('391', '10', '29', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('392', '10', '28', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('393', '10', '27', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('394', '10', '51', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('395', '10', '177', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('396', '10', '183', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('397', '11', '51', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('398', '11', '26', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('399', '11', '27', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('400', '11', '28', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('401', '11', '29', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('402', '11', '30', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('403', '11', '31', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('404', '11', '44', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('405', '11', '45', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('406', '11', '48', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('407', '11', '55', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('408', '11', '25', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('409', '11', '24', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('410', '11', '54', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('411', '11', '11', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('412', '11', '12', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('413', '11', '13', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('414', '11', '14', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('415', '11', '15', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('416', '11', '79', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('417', '11', '16', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('418', '11', '17', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('419', '11', '18', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('420', '11', '119', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('421', '11', '139', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('422', '11', '166', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('423', '11', '170', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('424', '11', '173', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('425', '11', '174', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('426', '11', '175', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('427', '11', '176', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('428', '11', '177', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('429', '11', '183', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('430', '11', '140', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('431', '11', '161', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('432', '11', '160', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('433', '11', '181', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('434', '11', '141', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('435', '11', '151', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('436', '11', '152', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('437', '11', '153', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('438', '11', '154', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('439', '11', '155', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('440', '11', '156', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('441', '11', '157', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('442', '11', '158', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('443', '11', '159', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('444', '12', '174', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('445', '12', '79', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('446', '12', '158', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('447', '12', '2', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('448', '12', '3', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('449', '12', '4', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('450', '12', '5', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('451', '12', '34', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('452', '12', '38', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('453', '12', '6', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('454', '12', '7', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('455', '12', '8', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('456', '12', '9', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('457', '12', '10', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('458', '12', '39', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('459', '12', '1', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('460', '12', '183', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('461', '12', '177', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('462', '12', '159', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('463', '12', '181', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('464', '12', '160', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('465', '12', '161', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('466', '12', '166', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('467', '12', '170', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('468', '12', '163', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('469', '12', '164', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('470', '12', '165', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('471', '12', '173', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('472', '12', '175', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('473', '12', '176', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('474', '12', '40', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('475', '12', '19', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('476', '12', '20', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('477', '12', '74', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('478', '12', '75', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('479', '12', '76', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('480', '12', '77', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('481', '12', '78', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('482', '12', '85', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('483', '12', '92', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('484', '12', '93', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('485', '12', '94', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('486', '12', '95', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('487', '12', '96', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('488', '12', '97', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('489', '12', '73', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('490', '12', '69', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('491', '12', '68', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('492', '12', '21', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('493', '12', '22', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('494', '12', '23', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('495', '12', '33', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('496', '12', '35', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('497', '12', '36', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('498', '12', '37', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('499', '12', '91', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('500', '12', '180', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('501', '12', '65', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('502', '12', '66', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('503', '12', '67', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('504', '12', '98', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('505', '12', '51', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('506', '12', '27', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('507', '12', '28', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('508', '12', '29', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('509', '12', '30', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('510', '12', '31', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('511', '12', '172', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('512', '12', '41', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('513', '12', '42', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('514', '12', '43', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('515', '12', '44', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('516', '12', '45', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('517', '12', '48', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('518', '12', '26', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('519', '12', '25', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('520', '12', '24', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('521', '12', '52', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('522', '12', '53', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('523', '12', '54', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('524', '12', '70', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('525', '12', '11', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('526', '12', '12', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('527', '12', '13', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('528', '12', '14', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('529', '12', '15', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('530', '12', '16', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('531', '12', '17', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('532', '12', '18', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('533', '12', '49', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('534', '12', '64', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('535', '12', '182', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('536', '12', '135', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('537', '12', '136', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('538', '12', '139', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('539', '12', '140', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('540', '12', '141', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('541', '12', '150', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('542', '12', '151', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('543', '12', '152', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('544', '12', '153', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('545', '12', '154', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('546', '12', '155', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('547', '12', '156', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('548', '12', '157', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('549', '12', '134', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('550', '12', '133', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('551', '12', '171', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('552', '12', '55', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('553', '12', '59', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('554', '12', '60', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('555', '12', '61', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('556', '12', '62', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('557', '12', '71', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('558', '12', '132', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('559', '12', '120', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('560', '12', '119', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('561', '12', '162', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('562', '12', '72', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('563', '13', '11', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('564', '13', '12', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('565', '13', '70', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('566', '13', '54', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('567', '13', '53', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('568', '13', '52', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('569', '13', '51', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('570', '13', '164', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('571', '13', '72', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('572', '13', '13', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('573', '13', '14', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('574', '13', '159', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('575', '13', '156', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('576', '13', '133', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('577', '13', '155', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('578', '13', '154', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('579', '13', '153', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('580', '13', '152', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('581', '13', '151', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('582', '13', '150', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('583', '13', '141', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('584', '13', '140', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('585', '13', '139', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('586', '13', '136', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('587', '13', '135', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('588', '13', '132', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('589', '13', '157', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('590', '13', '158', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('591', '13', '183', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('592', '13', '177', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('593', '13', '176', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('594', '13', '175', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('595', '13', '174', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('596', '13', '173', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('597', '13', '165', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('598', '13', '134', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('599', '13', '163', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('600', '13', '170', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('601', '13', '166', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('602', '13', '161', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('603', '13', '160', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('604', '13', '181', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('605', '13', '120', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('606', '13', '15', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('607', '13', '41', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('608', '13', '172', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('609', '13', '31', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('610', '13', '30', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('611', '13', '29', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('612', '13', '28', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('613', '13', '27', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('614', '13', '26', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('615', '13', '25', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('616', '13', '24', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('617', '13', '18', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('618', '13', '17', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('619', '13', '16', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('620', '13', '79', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('621', '13', '42', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('622', '13', '43', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('623', '13', '119', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('624', '13', '162', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('625', '13', '71', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('626', '13', '62', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('627', '13', '61', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('628', '13', '60', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('629', '13', '59', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('630', '13', '55', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('631', '13', '182', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('632', '13', '44', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('633', '13', '45', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('634', '13', '48', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('635', '13', '49', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('636', '13', '64', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('637', '13', '171', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('638', '14', '160', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('639', '14', '181', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('640', '14', '153', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('641', '14', '152', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('642', '14', '64', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('643', '14', '49', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('644', '14', '48', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('645', '14', '45', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('646', '14', '44', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('647', '14', '26', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('648', '14', '25', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('649', '14', '54', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('650', '14', '24', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('651', '14', '161', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('652', '14', '51', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('653', '15', '156', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('654', '15', '119', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('655', '15', '155', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('656', '15', '154', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('657', '15', '159', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('658', '15', '153', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('659', '15', '152', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('660', '15', '151', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('661', '15', '141', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('662', '15', '140', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('663', '15', '157', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('664', '15', '158', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('665', '15', '181', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('666', '15', '183', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('667', '15', '177', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('668', '15', '176', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('669', '15', '175', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('670', '15', '174', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('671', '15', '173', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('672', '15', '170', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('673', '15', '166', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('674', '15', '161', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('675', '15', '160', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('676', '15', '139', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('677', '15', '136', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('678', '15', '27', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('679', '15', '18', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('680', '15', '17', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('681', '15', '16', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('682', '15', '79', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('683', '15', '15', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('684', '15', '14', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('685', '15', '51', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('686', '15', '11', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('687', '15', '12', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('688', '15', '28', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('689', '15', '29', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('690', '15', '135', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('691', '15', '134', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('692', '15', '133', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('693', '15', '132', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('694', '15', '120', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('695', '15', '48', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('696', '15', '45', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('697', '15', '44', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('698', '15', '31', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('699', '15', '30', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('700', '15', '13', null, 'admin', '2020-06-22 17:30:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('701', '6', '49', null, 'admin', '2020-09-22 01:06:19', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('702', '6', '50', null, 'admin', '2020-09-22 01:07:13', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('703', '6', '208', null, 'admin', '2020-10-05 17:09:43', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('704', '6', '209', null, 'admin', '2020-10-05 17:09:43', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('705', '6', '210', null, 'admin', '2020-10-05 17:09:43', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('706', '6', '211', null, 'admin', '2020-10-05 17:09:43', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('707', '6', '212', null, 'admin', '2020-10-05 17:09:43', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('708', '6', '203', null, 'admin', '2020-10-07 22:57:23', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('709', '6', '204', null, 'admin', '2020-10-07 22:57:43', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('710', '6', '205', null, 'admin', '2020-10-07 22:58:10', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('711', '6', '206', null, 'admin', '2020-10-07 22:58:28', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('712', '6', '207', null, 'admin', '2020-10-07 22:58:57', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('713', '6', '213', null, 'admin', '2020-11-07 21:37:39', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('714', '6', '215', null, 'admin', '2021-01-25 15:31:00', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('715', '6', '216', null, 'admin', '2021-01-25 15:31:39', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('716', '6', '217', null, 'admin', '2021-01-25 15:32:07', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('717', '6', '218', null, 'admin', '2021-01-25 15:32:28', null, null, null, null);

-- ----------------------------
-- Table structure for umm_user_approval_group
-- ----------------------------
DROP TABLE IF EXISTS `umm_user_approval_group`;
CREATE TABLE `umm_user_approval_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `approval_group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `USER_ID_FK_1` (`user_id`),
  KEY `AP_GROUP_FK1` (`approval_group_id`),
  CONSTRAINT `AP_GROUP_FK1` FOREIGN KEY (`approval_group_id`) REFERENCES `common_approval_group` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `USER_ID_FK_1` FOREIGN KEY (`user_id`) REFERENCES `umm_user_mst` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of umm_user_approval_group
-- ----------------------------
INSERT INTO `umm_user_approval_group` VALUES ('1', '1', '1');

-- ----------------------------
-- Table structure for umm_user_import_issue
-- ----------------------------
DROP TABLE IF EXISTS `umm_user_import_issue`;
CREATE TABLE `umm_user_import_issue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `import_mst_id` int(11) NOT NULL,
  `record` text DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL,
  `line_no` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_IMPORT_MST6` (`import_mst_id`),
  CONSTRAINT `FK_IMPORT_MST6` FOREIGN KEY (`import_mst_id`) REFERENCES `umm_user_import_mst` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of umm_user_import_issue
-- ----------------------------

-- ----------------------------
-- Table structure for umm_user_import_mst
-- ----------------------------
DROP TABLE IF EXISTS `umm_user_import_mst`;
CREATE TABLE `umm_user_import_mst` (
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

-- ----------------------------
-- Records of umm_user_import_mst
-- ----------------------------

-- ----------------------------
-- Table structure for umm_user_mst
-- ----------------------------
DROP TABLE IF EXISTS `umm_user_mst`;
CREATE TABLE `umm_user_mst` (
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
  KEY `user_name` (`user_name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of umm_user_mst
-- ----------------------------
INSERT INTO `umm_user_mst` VALUES ('1', 'aadadasas', '6', 'admin', 'avishka perera', null, 'carijiv438@1092df.com', null, 'A', '0', '$2a$10$7nUrdyIaqNkinWcoeVjOAeRn6SGFhuexFhvVgw1WAro7lXSNAEafO', '2021-02-24 19:30:16', 'PAPERTRL_SYSTEM', 'NP', 'N', 'Y', null, 'image/png', 'default_propic.png', null, null, null, null, 'I', 'EG4QtSEJRSfsQ+061ZpIpQ==', 'I', '2021-01-08 00:00:00', '2021-01-28 00:00:00', null, '1', null, null);

-- ----------------------------
-- Table structure for umm_user_propic
-- ----------------------------
DROP TABLE IF EXISTS `umm_user_propic`;
CREATE TABLE `umm_user_propic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `file_name` varchar(100) NOT NULL,
  `file_type` varchar(50) NOT NULL,
  `image_data` mediumblob NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of umm_user_propic
-- ----------------------------
INSERT INTO `umm_user_propic` VALUES ('1', 'default_propic.png', 'image/png', 0x89504E470D0A1A0A0000000D494844520000017500000175080600000017FD7AC80000200049444154789CEDDD799464595D2FFAEF6F9F73E2EC93911991630D599535F754595D08A220C3BD884F975779BED7030AE2803E19E4C9C5FBF0C17B08175AB9BA70C1BBEA0551E4B2BC3C1CD06E5B9FA0AE25A2A2225EF402D555DD40CF5D5D43565566E57CF68973F6FEBD3FEA6475767565560E1171224EFC3E8B5A5D1919C38FCA38DFDCB147FADA0327B11526365B7A9C10DBA523DD076010C050FEDF1A8020FF7B00A03FBF2BE5B75D6B1600E77F5F0490E6B7A500E6F3BF5F06306B62B3DC9AFF17426CDD5FFCF967D6FC9EDFC63A8458978EF40880FD0026F23F0799795FFEF751221AC295000733370064CCECF27826067B0008FCCCFB9AC1E1B5AF43A064D5171900269005C020808814009F882A3AD200B0C0CC33002E01384D444F01781CC0E9FCCF932636D3CDFDD710626B24D4455BE948F703781E80DB004C32F324816E02619C991D80841D83994366D6CC0C06030C303398571AD8DB7AEF866BFCFDBA886888888640384CA017111188C81051428A0020D49156609C65F0C344740AC029000F01F89A89CDE2366A15625324D445CBE848DF06E076002F64E61711D16D00069D734BCC1CB0E3EA4A503BE7AE3EACB082D770CD2F93151AD7D4AA943A40440788E8BB49D11211A54AA9AA8EF42C333F4444FF0CE05F003C6062F3509BCA173D46425D34451EE0DF01C62B18FC12223AC0CC4BCE393073BF734EE52D70E0FAFDDC5D6FD52F2600A8AEFC8588C648D19852EA6544B4A894828E7495999F20D01741F85B00FF24412F9A41425D6C898EF4CB017C1F33BF92888E3373C339E739E7AAECAEB6BC6B0597D91198196C19CE3A8555FF264AA9C3A4E8B052EA4EA594D591AE30F30922FA3C803F37B1F9FBE2AA16DD4A425D6C888EF48B00DCC5CCDF4D44CF73CECD39E7AACEB9206F81775CB749A773CE010EB0B05500202290A26F574A3D5F29F5661DE93A337F8D88FE0AC07D2636FF5C70C9A20B48A88BEBD2911EC79596F80F11D1CB9C738973AECF5917E4ADF05276A11469558B7E657A269452DFA23C35A9947AA38E74C8CCFF40449FC69596FCD9622B169D48425D5CA523FD6D007E9899FF6766DEED9C63675DD53A0B70E70D60F602E71C9C7301803A08F094F73F294F7D8752EAD7421D9E23A23F03F07B26365F2EBA56D11924D47B9C8EF4CBC0783D08773133596BABCE3AFF9A413FD10918B0D6C2DA2BDD354AA9C3CA533FE379DE4FE8483318F781F049139B2F145DAA288E847A0FD291FE0E30DE08C29DEE8ABACD2C5D67DA9EE860792BDECFD2AC4E44F07CEF27955277E9487B60FC3108BF6562F34F45D729DA4B42BD47E848DF02E0AD007ED039174890970B33234B3302309807FC8F29A5FE171DE90CC0A7017C44A64CF60609F592D391BE8799EF64E6FDD6DAC866D697202FB7EB04FC9B3CCFFBD15087A789E83E139BF7165DA3681D09F512D2917E3E186F07E135D6DA659BD901E923EF4D79C0FB599AD59452939EEFEDD391FE7930FE00840F99D87CA5E81A457349A897848EB402F00BCCFC6A66DE69AD1DC8D24C011828BA36D1199C73700D379022851FF8AFF53CEF55A10EA788E88F00FC47131BF9CD5F02AAE802C4F6E8481FD65A7F1280B5D6FE6CDA486F4E4C52CF035D88EBCAD24C2526A9A78DF4666BEDCF02B05AEBFF5747FA70D1B589ED910BBF4BE948BF32D4E11798F9AB99CD7ED8C4066923AD4A378BD80CE71CD2465A35B14166B3D732F357431D7E4147FABB8AAE4D6C8D74BF74997CE0F375CEB9912CCB069D951017CD91A59997A559BFF2D4CB7DDFBF37D4E13411FDAE0CAC761769A977091DE95FD691BE9077B11C6E240D0974D112CE3A3492C660DA480F5B6B7F5647FAA28EF42F175D97D81809F50EA723FD2B3AD20BD6DAB72626194B1B694DBA58443BE45D33B5C424A3D6DAB7EA482FE848FF4AD17589F549A877281DE90FEA482FD9CCBE2531497FDA48AB32BF5C1481999136D26A62927E9BD9B7E8482FE9487FB0E8BAC4F549A877181DE90FE848CFDBCCBE3931495F9A4A988BCEC0CC48D3B49A98A4CF66F6A7F396FB078AAE4B3C9B847A87D091FE451DE9296BED5B12930C48988B4E95877B5F62927E6BED5B74A4A774A47FB1E8BAC41512EA05D3917E61A8C3AF5B6BFF7D62921D6923ED973017DD20EF96E94F4CB2C35AFBEF431D7E3DDFBE59144842BD203AD283A10EFF94993F9736D25BD2465A933017DD280FF75ADA486F61E6BF0A75F8A73AD272884A4124D4DB4C475AE9487F14C0056BEDF72726A9CB6C165106CE392426A95B6BBF1FC0051DE98FE6DB578836927FF036CAFB1D2FDBCCBEDEC426C8D2CC2BBA26219A2D4B33CFC426B0997D3D80CBD2DFDE5E12EA6DA0237D20D4E1579D756F4D4C524BD3548E8613A597A6A94E4C5273D6BD35D4E15775A40F145D532F90506F311DE98F31F303D6DAE7351A8DBAF49B8B5EC2CC68341A756BEDF398F9011DE98F155D53D949A8B7888EF40B75A4CFD8CCFE486292FE2CCD8A2E4988C26469867CF1D28FE8489FD1917E61D1359595847A93E948EB5087BFCFCC9F4B4C329EA66954744D42748A344DA3C424E3CCFCB95087BFAF232D5D914D26A1DE44F980D0456BED9D8949A4AB4588EB60E69559327702B82803A9CD255BEF36818E743F33FF8173EEA5B27848888DC9D2AC62335B092AC1CF843A7C3E11BDC6C466B1E8BABA9DB4D4B74947FA0500CE586BBFA791340625D085D838664623690C5A6BBF07C099FC7A12DB20A1BE0D5AEB4F30F3E71393D4B2340B8AAE47886E95A5599098A4C6CC9FD75A7FA2E87ABA9984FA16E8488F853A7CD05AFB43D2772E4473ACEA6BFFA150870FEA488F155D53379250DF241DE90F8271DA5A7B5B9AA67D45D72344D9A469DA67ADBD0D8CD3B26FFBE6C940E906E583A1F7596B5F9C36D2B0E87A8428B32CCD90A55918548237843A3C4E4477CA20EAC6484B7D0374A4770078D85AFB9D6923AD155D8F10BD226DA4356BED2B003C9C5F87E20624D46F4047FA9799F9A9C424BB64305488F6CB07517731F3537200F68D49A8AF436BFD49E7DC9B1B492394C150218A934F7D0C9D736FD65A7FB2E87A3A9984FA75E8480F853AFCB2B5F62E997B2E44675835A7FDAE50875FD6911E2ABAA64E24A17E0D1DE943009EB2D6BE4066B708D179F2D9312F00F0747EBD8A5524D457D191FE1566FE5ABEABA2FCDB08D1A1B234538949FA98F96B3AD2BF52743D9D44822BA7B5FEB873EE0D4992C8DE2D42740166469224FDCEB93768AD3F5E743D9DA2E7E7A9EB485798F94FADB32F4D1BE940D1F5082136818146D2180C2AC10F863ADC4B443F6062D328BAAC22F5744B5D477A9099BFECACFB4E097421BA57DA48079C75AF60E62FEB480F165D4F917A36D4F37D254E596B27D35456880AD1EDD2340DADB593007A7ADF989E0CF57C65DAD359968D6769E6155D8F10A239B234F3B22CDB8D2BDBF8F6E40AD49E0B751DE97B009C4E4C5291734385289FFC3CD400C0E9FC7AEF293D15EA3AD2EF67E6B72726A9C80C1721CA2BDFC6B7C2CCFF878EF4FB8BAEA79D7A26D4F339E83FD3481A55097421CA2F5F81DACFCC3FD34B73D97B22D475A4FF733E075D0EB410A287E473D9EBCEB937E848FFE7A2EB6987D287BA8EF4AF3AE75EDF481A83903C17A2F7E473D99D73AFD791FED5A2CB69B55287BA8EF4879D733FDE481A3D3D6F55087135D87F5C47FAC345D7D24AA50DF53CD05F27812E84589107FBEB74A47FA3E85A5AA594A19E77B948A00B219E230FF6D796B52BA674A19E0F8A4A978B10624DABBA624A37785AAA50D791FEC0D54151218458C7AAC1D30F145D4B339526D4F385456F4A1BA904BA106243D2463AC8CC6F2AD302A55284BA8EF43DCCFCB646D29079E842880DCB1728D599F96D65D952A0EB433DDFB4E7FFCA578E155D8E10A2CBACAC3C05E39D65D804ACAB433DDF5EF38CECE52284D88E7CE569882BBB3B76F5B6BD5D1BEAF946F80F6459E64BA00B21B68B999165990FE0816E3E68A32B435D473A64E62F6459362ADBE70A219A254B33645936CACC5FD091EECAC373BA32D499F9FFB3D6DE2C075C08219A2D4B33CF5A7B3333FF59D1B56C45D785BAD6FA13CEB9EFC8D2AC2B7F8B0A213A5F9666A173EEC55AEB4F145DCB667555A8EB487FC0B1BB430E891642B45ADA48071CBB3BBA6D7152D784BA8EF461667E8B2C2E1242B44BBE38E92D3AD2878BAE65A3BA22D475A447009C94B9E8428876BA3A871D3895E750C7EBF850D79156CCFC7759968512E8428876CBA73A5698F9EF74A43B7E7246C7873A33DFEBAC3B9CA519155D8B10A237656946CEBAC3CCFC4745D772231D1DEA3AD21F64C7AF4CD354175D8B10A2B7A569AAD9F12B75A43F54742DEBE9D850D791DECBCC6F6E341AF5A26B1142080068341AF57C57C7BD45D7B2968E0C751DE97E005F69248D6AD1B50821C46A792E7D25CFA98ED391A1CECCF7655926DBE80A213A4E3E705A67E6FB8BAEE57A3A2ED4F3E3E85E9CA55950742D4208713D599A05CEB96FEFC4E3F03A2AD475A47733F31BD3465A2BBA162184584FDA486BCCFC461DE9DD45D7B29A5F74012B74A40330FEB9D168F4155D8BE83E44844A10200C4354C20A02DF879FFFF1BC2B538B95BAD28671CE0100ACB3C8328B2C4D9165191A698A244990240D48D79FD88846A3D11756C27FD6913E6C6293165D0FD041A10EC67FB3D6EE60271793589F520AFDD52AAAFD55F44511A228421469103567290333C39804711C63398EB1B8B884A5A525586B9BF2FCA23CD831ACB53B94A73E09E0B545D7037448A8EB48DFE39CFB77699ACACE8BE2398808FDFD55D4EB75D46A03A8F6F5352DC0D77ABD28D288228D610C01B812F4711C636E7E0173737358585894D6BC0000A4691A5654E57B75A4EF31B1796FD1F5D0D71E38B9A5079AD834A5001DE90100E71393F4C94522561011EAB51A86878730343478B50BA55358E730373B87E99919CCCDCD5FEDD211BD898810EA7019C02E139B8556BFDE5FFCF967D6FC5EE12D7566FEB4B556CE18150080BE28C2D8D828464686E1FB85BF3DD7E42985E1E1210C0F0FC15A8B9999CBB870F1129696968A2E4D1460657F18CFF3FE08C0F716594BA1578D8EF4FBF3032F3AF7EA152D4744181A1AC4AE9D3BD0DFDF91EB39D6E5791EC6C6463136368AE5E518E7A7A6303D3D23DD333D264B335F29F5221DE9F79BD8BCBBA83A0AEB7EC9BB5D2E262691DD177B141161C7D81876EDDA81302CD7704A9AA6989ABA80A90B176580B587E4DD300980B15676C37464F70B33FFAEB5D69340EF3D4484B1D1518C8FEF42A55229BA9C960882007BF7EEC1AE5D3B71EEFC14A6A62E48BF7B0FC8BB613CCFF37E17C00F145143218B8F74A4EF61E6974BB74BEFA9D76BB8FDD8240E1CD857DA405FCDF77D4CECDD83E3B74F626478B8E872441B6469E633F3CB75A4EF29E2F5DBDEFDA223ED03B8909864485AE9BD230C431CD8BF0FF57A6F2F165E5C5CC2134F3E89E5E5B8E852440BE5DD30B3B8D20D9335FBF9D7EB7E697F4B9DF1319BD94802BD37101176EFDA89DB8F1DEDF9400780FEFE2A268FDE86BD7BF75C5DE12ACA87996133ABC1F8ED76BF765BDF553AD247187CB71C7AD11BB40E71F4B65B3031B157026C1522C2F8EE5D983C7A1BFAFA64578CB24AD35433F82E1DE923ED7CDDB65E69CC7C9FB576A09DAF298A3136368AC9C9A3A856654BFCB54491C6E4D15BB17BD7CEA24B112D9236D20166BEAF9DAFD9B650D791FE25E7DC812C6D7AF792E8204A291C3A7800070FEC8727ADF31B22224C4CECC5CD371DE9B855B362FB9C7370CE1DD091FEA576BD665BAE3A1DE90A80B76569269DAA251686151CBDED168C8E8E145D4AD7191CAC63F2E86D88A2A8E8524493E5B9F7361DE9B6743BB7A729C5F8B8CD644E7A9955AB551CBDED56E923DE8695310819502E977CEEBA0FC6C7DAF17A2D0F751DE90906DF293B3096D7D0E0206EBBF56604811C56B55D9EE7E1E69B8E606C6CB4E852441365695661F09D3AD213AD7EAD96873A337FC25A2BCDB7921A1D19C191238764764B1311110E1ED88F5D32805A2AD6DA3E66FE9D56BF4E4BAF441DE99732F30BB3346BDDE6D7A2303B768CE1D0A1032DDDDBBC97ED9BD88BF1F18E3A294D6C439666C4CC2FD0917E592B5FA7A5A1CECCFF354BB3C156BE8628C6D8D8280EECDF577419A5B777CFB8047B89646936C8CC1F6FE56BB42CD475A47FD139B75B36312A9F91E16109F436DABB671CBB76EE28BA0CD104F914C75D3AD2BFD8AAD768654BFD8D3285B17C6AB501E97229C0BE7D131819910DC1CA204BB33A809F6CD5F3B724D475A47F391F1468C5D38B82F445116E3A725802BD20870E1E40AD260BB2BB1D33C35ADBAF23FDFE563C7FAB5AEAFF7B9666DD77848D5893EFFBB8F96659F5582422C291C3874A77A0482FCA7B31DED08AE76E7AA8EB487F50161A950B11E1C891433DB1FF79A7F37D1F371D392C5348BB5CDE5A8F5AB17D402BDE193F9D6599CC4B2F91BD7BF7A036201FFB3B455F5F848307F6175D86D8A62CCD0600FC74B39FB7A9A19EB7D2595AE9E551AFD76417C10E3432322C7BEC74B9BCB5EEEB487FA099CFDBEC96FA9BB22C93BD564BC2F77D1C3A78A0E832C41AF6EF9B90FEF52E978F3DBEA599CFD9B450CF67BC90B4D2CBE3E081FDB29F4B07F33C0F870E1D28BA0CB10D796B9D9AD95A6F664BFD7FCB5269A597C5D0D0208686643170A71BE8EFC78E1D63459721B621CFCDA6CD5B6F4AA8EB48DF63AD0DA5955E0E9EE761BFAC18ED1A137BF7C8CCA42E96B7D62B3AD2F734E3F99A12EACCFCA336B3B27AB424F6ECD98D8A74BB740DCFF33031B1A7E832C436D8CCD698F9479BF15CDB0E751DE95730F390ECF1520E5A6BECDC21FB8C749B91E161F4F7CB7ABF6EE59C03330FE9487FD7769F6BDBA1CECCEFCB32D989B12C2626F6C836005D6AFFBEBD459720B621CBB241667ECF769F675BA1AE237D08C0B73A2BADF432E8EFAF6268507E3F77AB6A557E7EDD2CCFD16FCD7375CBB6D75267DC63AD9593724B62CF9EF1A24B10DB243FC3EE66AD8DC0D8D680E996435D475A81F023599AC90E4F25D0DF5F45BD2663DDDDAEAF2F92D67A17CBD2CC03E1753AD25BCED5EDB4D4DF6F33BBBC8DC78B0E22E76196C7EEDDBB8A2E416C83CD6C0C60CB87686C3DD419AFCBAC6CDC55063A0C313C34547419A249FAFBABE8EF977580DD2AB3591F18AFDBEAE3B71AEA2F73EC6AEC64B15119C88AC4F29169A9DD8B1DC3B1AB6DF580EA2D853A33FF9FCE39E9B82B012292DDFE4A68686810BEEF175D86D822E7DC2033BF632B8FDD4AA85788E855599A6DE5F54487918BBF9C94521895334DBB56966620A2EFD791DEF4FE0F5B09F5F7586BE32D3C4E74A0D11169A597951C54DDDDF29CDDF462A44D873A33DF6D332BA33025E0791EEA7599C65856D56A55F65BEF6236B355667EF5661FB7D9503F0A605CF6792987A1A141D912A0E48687655653B7CA7376B78EF4D1CD3C6EB3A1FE166BAD4C632C89C1C17AD1258816939F7177CBF3765327236D36D45F63332BA36A254044B282B407F457AB3210DEC5F2BC7DCD661EB399507FA973CE938330CAA1BFBF0ACF931D1ECA8E8850AB0D145D86D822668673CED3917EE9461FB3F15067BCC939279FE54AA226ADF49E511B9050EF66CEB93A186FDAE8FD371EEA843B6C666554AD2406E440859E21876774379B5902E18E8DDE7FA3A1FE72E75C265D2FE54044A8CADE203DA3AF2F92AEB62E9677C1643AD22FDFC8FD3716EA8C1F97AE97F208C3109E6ACAF1B4A24BF4F5C9A4B56E9677C1FCF846EEBBB12B9B70A774BD94475F24E79AF41AF99977B7BC0BE6CE8DDC7723A1FE6DCCACA4EBA53CA23EB9C07B8DFCCCBB1B338399958EF4B7DDE8BE1B09F5D7582BDB029449A475D1258836939F79F7CB73F88673D66F1CEA8C3B9D75B27AA144C270D31BBF892E273FF3EEE7ACF399F986B3606E14EA7B193C267BBD948B6CF2D47B8220907D7EBA5C9EC33B74A4F7AE77BF1B85FA1B9C75F24E2811A5942C1BEF4144844A2528BA0CB14D791EBF61BDFBAC1BEACCFC12E79CCC852A115FE62BF72CF965DEFD9C737DCCFC92F5EEB36EA813D1CBADB5CDAD4A14CA0FE4C2EE5512EADDCF5A0B225A7711D27AA1FE62E79C9C7054329E92967AAFF23D09F53270CEC577DC75F78BD7FAFE7AA17EA7734E368D2819CF9750EF59323A560ACEB92AB0F642A435439D99BF47A6320A511EB2FF4B3938EB0266FEEEB5BEBF66A813D17199CA583E4AF67C11A2AB39E74044CF5BEBFB6B5DE12F77CECDB5A8265120F9452D44F773CECDDD71D7DDD71D305D2BD45F95F7DB08214A427EA197479ECFAFBADEF7AE1BEACCFC0AE79CAC542821B9B07B976CCA571ECEB980995F71BDEF5D37D489E879CECAC55F46567EAE3D4BAEE9F27076ED7EF5EB85FA2433272DAE491424CBB2A24B100549B3B4E8124413317372C75D771FBBF6F6EB85FAB739E7648A444949A8F7AE2C93D5E165E29CF3007CFBB5B73F37BC19AF944547E565AD957EF51E95A6D2522F13E75C158C575C7BFB73429DC12F6527032A659624D2BBD66BB22C83ECE3542EEC180C7ED9B5B73F27D489E890B4E4CA2D491A459720DA4C7EE6E5932F423A78EDEDD786FAB730B32C3A2A39232DF59E6312537409A2059879EE8EBBEE7EFEEADBAE0DF5E7E79DEFA2C4E25836DFEC35712CA15E46CE391FC0BAA1FE1D32485A7ECBCB12EABD26969F7929E52B4B9FB50DEFB3429D99BF550649CB2F8E63595DD8639697978B2E41B4003B0633BF70F56DCF0A75223A22177BF939E7E4E3780F693452240D19282D236606111D597DDBEA501F65E68A847A6F585C5C2CBA04D126F2B32E2F6606330777DC75F7E8CA6DAB43FD28334BF3AD47CCCF2F145D826893850509F532CB73FBE8CAD7AB43FD16762C3B33F688F98505E957EF1173F3F34597205A881D5700DCBAF2F5B52D75D943BD47645986C5A5A5A2CB102D9624098C910FE065C6CC7DB85E4B9D998F4BCBADB7CCCDCA3AB3B29B9D939F71D9E5FDEAB7AF7C7D35D40974D8B16C0FD04B662E5F2EBA04D1623333F2332E3BC70E043ABCF2F533DD2F847199A3DE5B8C49B024F3974BAB91A63248DA03D83140185FF97A25D4C79859B670EB41D2922BAF999999A24B106DC2CCD91D77DDBD037826D42700C82E4F3DE8D2A56999055352172F4E175D82689F0680BDC033A1BE4FBA5E7A539AA6989501D3D2595C5C948DDB7A489EDFFB80552D75660E0BAB4814EAC2C58B4597209AECC2C54B459720DA28CFEF09E099503FC0CCBAB8924491E6E6E6A5555722699A627A5AFAD37B499EDF07803CD499F980F4ABF6B673E7A78A2E4134C9F9A90B324ED263F2B9EA0780675AEAE30C7913F4B2E9E91939F2AC04B2CCE2C205E94EEB35797EEF02F25027D02EC9F4DEC6CC387BEE5CD165886D3A3F3525074CF7220608340EACB4D40983F2714D5CBA342DE79776B12CCB303575A1E83244019819200C02CF74BF0C48A80B66C6E9D34F175D86D8A2A7CF9C95567A8FCAF37B00B812EA5500B2E98B00005CBE3C2B7BAD77A1388E7151A631F63A77C75D7757158041664E8BAE46748EA74E9F96D9135DE6C9A7E467D6EBF21C1F540006016405D7233AC8F2728CF332C5B16B5CBA342D9FAE047025C707575AEAD2FD229EE5CCD9733046064D3B5D9A66784AC64104803CC7071580FEA28B119DC73987C71F7F423ED277B8279E7C1259261FB4C555030A403F33AB1BDE55F49C85C5459C3B77BEE832C41A2E5EBC84CB97678B2E4374883CC7AB0A400DCF3EAB5488ABCE9C3D87C54539CBB4D31863F0E453A78B2E43741605A0A600F86050D1D588CEC4CC78E4D1C790A6F211BF5358E7F0F0238FC239190A13AB5CC971FF4AF70BD82FBA1ED1B91A8D061E79F431E95FEF108F3FF604E2D8145D86E830798EF74BB78BD890858505F9B8DF01CE9C3D2707868B7549A88B0DBB70E1A20C9C16687A7A0667CE9C2DBA0CD1E156A634568A2E447487D34F9F9103180A3037378FC71E7FA2E8324467AB209FD2E80132502A36EEB1C79F90A9746DB4B0B080871F7954C634C48D100025DD2F62D35666C4CCCEC981D5ADB6B8B8886F3E2C335DC4C649A88B2D61663CFCF0A33268D742F3F30BF8C6371E96ED74C5A628001690738FC4E631331E7DF4715CBA345D7429A5333B3B876F3EFC08ACB4D0C5C63100AB002C0290C329C59630331E7BFC099C392B47E135CB850B17657191D88A0680455974249AE2CC99B3484C820307F641C950CD96AC9C3C755E8EA413DB20A12E9AE6D2F4346213E3A6238751A9C82CD9CDC8B20C8F3CFA98EC8B2EB64D01982722D9D84334C5D2D2324E9E7A087373F34597D23516171771F2D44312E8625BF21C9F53000CE48C52D1445996E11BDF7C184F3E755AFA85D7C1CC3873E62C1EFAFA37D168C8B096D8360720F17125D465F68B68BAA9A90B989F9FC7C10307D0DF5F2DBA9C8EB21CC778E2F127B1B824DB1A8BA66100C6C795EE17694E8996886383071FFA3A76EEDC81BD7BC6E1795ED12515CA3987B3E7CEE3DCB9F3B2425434559EE3F33E80E5A28B11E537357501333397B177EF38C646478B2EA710972FCFE2F4E9A7611239FB55B4CCB20F609688640E9A68B9344DF1F8E34FE2C2D4454C4CEC41AD562BBAA4B6585A5AC2E9D36730BF2003A1A275F21C9FF501CC42A6368A365A5A5EC6D7BFF1300606FAB177CF380606068A2EA92596969671F6EC395C9E95CDCF445BF8580975220A8AAE46F49E8585453CF4F56FA25AAD62F7AE9D181A1A0451F76F183A3B3B87F35353324551B4559EE3B33E8025C8C65EA2404B4B4B78E4D1C750A9543036368AB1D191AE5BBC94A6192E5DBA848B97A6618C1C35270AA1EEBFEFDEA5956E9779221A92D17851A446A3813367CEE2ECD973A8D50630323C8CA1A1C18E9D3163ADC5ECEC1C66662E63766E4E66B388C2E49F701780BC2F9D992F4BA88B4EC1CC989B9BC7DCDC3CE80942AD36807ABD86C17A1D5AEB426B4B9206E6E6E6AED4373F2F8BAB4447202230F365E09901D2F3201C2AB02621AE6B75C03F85A751A95430D0DF8FFEFE2AFAFBAB88A2A8651B883133E238C6E2D232161716B1B0B88844A6238A4E746528EA1CB02AD4494EB4135DA0D168607A6606D33357CE49252284618828D208C3106158415809E1073E7CDF87EFF9F0FDEB77DF586B916516599622CD32A48D144992C02409E2D8C018235D2AA22BE4F97D1EC8439D889E28C3AC03D17B9819C6980D0D4EAEBCC725A845D9101188E809E099592F8F13910CD98B5263660974514A797E3F093C13EA4F139174160A2144372224009E069E09F5A74849F78B104274A37CB2C069E099503F0D202CAA20218410DB5201F014F04CA85F24A2CE5CE1218410625D44E4DF7FDFBD53C0EAED011867A50B460821BA0B2902186757BEBE1AEA0C7E58C90EBC4208D155142930F8D1AB5FAFFC85884ECA5C752184E82EF91CF5132B5FAF6E9A3F48447260A2104274913CB71F5CF97A75A87F9D145289998C00001CFB49444154A5ED2F490821C456E5B9FD8D95AFAF6DA917BB059E1042884DC973FBD4CAD7AB437D9A881AD2AF2E8410DD21EF4F6FDC7FDFBDD32BB73D6BBA0B333F2CA12E8410DD21DF47FD91D5B7A96BEEF03F64AEBA10427407520422FAD7D5B7F9D7DCE78B4AA9D75AD8FE36D62544531111822040A51220080228A5E02905520A4A29100006C08EE19C856386B30E699A224D5334D2544E34125D4129B508E09F56DF766DA87F552965DB5792105B178615445174E58FD688A208954A054170EDDB7AF3ACB568341A3026416C0CE2E518CB712C0767888E92E7F55756DF465F7BE0E4B5F7732636D207233A0A11A1BF5AC5406D00FDD52B47D9F9FEF6C37BB39C73585C5AC2D2E212E61716B0B8B0082BAD7A51101D69DC7FDFBDCFCAEBE75C15CCFC9852EAB07CFC14450B021F83F5410C0ED651AFD75A7616E96628A5501B18406D6000BB77EF023363616111B3B3B3B83C3B2767988AB6514A81991FBBF6F6E7843A81BE488A0E43325D14A01204181919C6D0D020FAFB3B7F68878850AB0DA0561BC0BE7D1388E318972FCFE2D2F4CC868ED81362AB481108F48FD7DEFEDCCFAF84CF2BA5EE90C152D12E4484A1A1418C8E8EA05EABA19BA7D5AEF4F18F8FEFC6E2E2122E5DBA84E999CBB05686AA447329A51641F8FCB5B75FAF53F24B4A291909122D57A954B073C718C6C6460BE91F6FB5FEFE2B7DFFFBF64D607AE632A6CE4F61398E8B2E4B94449ED35FBAF6F6EB0D9402C07262924846F9452B54AB7DD8B57327868787BABA55BE157373F3383F3585B9B9F9A24B115D4E473AB9FFBE7B9FB3B5CB759B47CC7C8214BD88AD84BA689EFE6A157BF78EA356AB155D4A61EAF51AEAF51A9697639C3973169767678B2E497421E52930F3D7AEF7BDEB863A11FD8D52EA05CEBAA0B5A5895ED0D71761CF9E710C0D0E165D4AC7E8EB8B70D34D87B1B4B484D34F9FC5FCBCB4DCC5C629A552227A4E7F3AB046A803F8AC52EACD00E42A145B56A95430B1770F4646868B2EA56355AB55DC7ACB4D989F5FC053A79FC6F2F272D125892EA0945A02F0D9EB7D6FAD3E7500B02636C54F0C165D8788B06BD74E8C8FEF86D70173CBBB0533E3E2C54B38FDF419992D23D6A523EDEEBFEF5EEF7ADF5B73CA01339F504A7D8B2C42129B51AFD7B07FDF04B496ADF9378B88B063C71886878770FAE933B878F152D125890E942F3ABA6E7F3AB04EA813D15F294F4D3A27FDEAE2C67CDFC3FE7DFBA4ABA5097CDFC7C103FB313A328CC71E7F5256A98A67519E4A89E8736B7E7F9DC7DEA794920E3E7143F57A0DC7262725D09B6C606000C7266FC38EB1B1A24B111D24CFE5FBD6FAFE7A7DEA00101B63346466A3B80E4F294CEC9BC08EB1D1A24B29BDB9F9793CFEF8136834E418E19E4680D6DADC7FDFBDD15A775977148B99FFDE53D7ED8B173D2E8A224C4EDE2681DE26F55A0DC7268FA25EEFDD39FE02F0940766FEFBF5EEB36EA813D1BDD20523AE353A3A82C9A3B7CA60689BF9BE8F5B6EBE097BF78CF7DC4A5C7185526A9988EE5DF73E37788ECF284FA6A4892B94523878603F0E1D3CD011DBE0F6AAF1F1DDB8E5E69B10043287A1D7E4797CDDF9E957EF7383E7380BE08C5CC0A21204B8EDD69B3126DD2D1DA1561BC0E4D15BD117ADD9B52A4A26CFE133263667D6BDDF8D9E8888FE4C792A6B5661A2FB54AB7D383A791BAAD56AD1A588552A950A6EBBED16D4EBF5A24B116DA03C9511D19FDDF07E1B78AE3FF03C6FA90935892E343858C7ADB7DE828A7CD4EF489EE7E1E69B0E63E78E1D4597225A2CCFE1DFBFD1FD3612EA5F26222B0333BD676C6C14371D392C4BFD3B1C1161FFFE09ECDBB7B7E852448B101188C89AD8FCCB8DEEBBB1AB9571BFE77BB25F400FD9BD7B170E1ED82FB32CBAC8AE9D3B71E8D001F99995509EBF7FBC91FB6E2CD409BFA39492BD417BC4DEBD7B30B1774FD165882D181D19C191C38724D84B26CFDF4F6EE8BE1B7CCE7F504A2979A394DFBE7D7B31BE7B57D165886D181A1AC4CD371D9169A7254144504A792636EB2E3A5AB1F19F3AE38FA50BA6DC26F6EEC1AE9D3B8B2E433441BD5E93167B4978BEE7C06BEFF572AD8D873AE1B7A40BA6BCF68CEFC66E69A197CAE0601D870F1F9460EF724AA979107E6BC3F7DFC4737F4929D5903748F9ECDEB5137BF68C175D866881E1A1211C3C2803DEDD2AEF7A6998D87C69A38FD96CA7DB1F7ABE27DBC495C88E1D63989890A97065363A3282FDFB268A2E436C419EB77FB899C76C36D43FE2799ED9E46344871A1A1C948BBD47ECD831863DE3BB8B2E436C529EB71FD9CC63361BEA5F87EC05530AFDFD55E96FED317BF68CCBDE3D5D64D55E2F5FDFD4E336FB424474AFE7CBB601DD4C87A14C79EB5107F6EF43AD3650741962033CDF5BBAD136BBD7B395ABFA1ECFF3FAB6F038D1013CCFC3CD371F81EFAF793CAD283122C24D470ECB5EF85D20CFD97B36FBB8AD847AC6CC7FE207120ADDE8D0A1037241F738CFF3AEECE9E3C9A9669DCA0F7C30F39F98D86C7A87DC2D7DFE26A20F2AA566B7F258519C3DE3BB313438587419A2034491C6C183FB8B2E43AC4129354B441FDAD263B7F89A5F54A4E648C9205BB7181CACCB5C74F12CC34343B2254407224550A4E64C6CFE712B8FDFFA4819E1F77CCF9701D32EA0C310870F1D2CBA0CD181F6EC1947BD2687597712DFF39740F8BDAD3E7E3BD31F7EDEF33D390AA7C311110E1F3924FDA7E2BA8808870E1D90F34E3B489EAB3FBFD5C76F39D44D6C188C4FF9816FB7FA1CA2F52626F6A2DA279395C4DA822090FEF50EE107BE05E3532636BCD5E7D8DE4465C27B3DCF8BB7F51CA265EAF51A76ED9463CEC48D0DD6EBF25EE9009EE7C520BC773BCFB1AD5037B1790CC0BF2A4F16B1741ADFF771E8E081A2CB105D6462622FFAE4535D61F21CFDD73C57B7FE3CDB2D8488DEE7FBBE4C6FEC30070EEC937E52B1292BFDEBB27544317CDF9F25A2F76DF779B61DEA26367F4B449764C979E7181E1EC2F0D050D165882ED4174518978DBFDA4E2905229A36B1F9DB6D3F5713EA0111FD9EE77B72804607F07D1F07F6EF2BBA0CD1C5C677EF425F14155D464FF17C6F9E887EB719CFD5945037B179AFE779463EB6156FFFBE09D9D7456C0B11E1E041E98669172282E7798989CDB606485734B3CFE4BFFA812C462A52BD5EC3C8C870D1658812A856FB64364C9BE4B9F9F1663D5FD342DDC4E65D9EE739F9ED5E0C22C2FE7DD2ED229A67CF9E7184954AD165945ADE4AB72636EF6AD673367B74F337A5B55E8C5DBB7642EBB0E832448928A5B06FBF9C8CD54A7EE02F02F8CD663E675343DDC4E61D9EE7B1B4D6DBAB52A9C85165A22586060751AFCBDE30ADB0AA2FFD9DCD7CDE56CC43FCA8EF4B6BBD9DF64DEC95538C44CBECDF372183A62DE007FE02808F35FB799B9E042636EFF07CE95B6F97DAC0008687654EBA681DAD3576EE182BBA8C52C95BE9CBCDEC4B5FD1AAE6DD47F2DF42A2C52626F6165D82E801E3E3BB65A7CF26F2037F1EC06FB7E2B95B12EA2636FFB7E7794BD25A6FAD91916154ABB25787683DDFF7B17BD7CEA2CB28055204CFF3E64D6CDED38AE76F6547ECC7FDC09F6BE1F3F73422C25E39C948B4D1AE5D3B653FA12608FC600EC0275AF5FC2D0B75139BF728A5CEC9005E6BEC181B4318CA1446D13E4A299965B54D4A2990A273CD5A3D7ADDD768D513030011FD841FC80E8ECDA694C2EE71395B52B4DFD8D8A83426B6C10FFC5922FAC956BE464B43DDC4E64B44F4653FF0B77C8A8778AEB1D11154E463B0280011C961D55BE4073E13D1974D6CFEA995AFD3F2BE11227ABD9C8ED43C4484DD725189028D8E8EA022DB076C9AE7793111FD44AB5FA7E5A16E627396409F0E822069F56BF502B9A044D1A461B17941102404FAB489CD9956BF567B4631096FF67CCFCA14C7ED918FBEA2538C8D8EC84C980D222278BE674178733B5EAF2DA16E62D300F06BF9847BB145C3C3433248253A82520ABB64DEFA86E4B9F76B790EB65CDBE61B9AD8BC4B29F5B81FC8010E5B258B3F4427D931360A4FA62CAFCB0F7C28A59E68C576006B69EB4F8488EEF43C6FB19DAF5916FDFD5539E95D7414CFF3303A365A74191DCDF3BC4522BAA39DAFD9D65037B1792C1F3435ED7CDD32D8B5535AE9A2F3C8465F6B0B82C010E88F4C6C1E6BE7EBB6FFB313E14D9E2FFBC26C46A552C1D0D060D16508F11C5A6BD96FFD3AF2C1D12510DED0EED76E7BA89BD858001F092A81AC34DDA09D3B77C87ED6A263C9A7C8E7CAF3ED2379DEB55521A31C2636EF25A2BFF3033F2DE2F5BB0911616C74A4E832845853BD5E935959ABF8819F12D1DFB5727F97F51436744D44AFF37D3F9316E8FA868786E0FB32634874B61D32600AE04A23CCF77D4B44AF2BAA86C242DDC46609C087A41B667D6372B1882E303A3A225D84B8DAEDF2A13CDF0A51E82453139BF710D13F4837CCF5856105B5DA40D165087143411060B05E2FBA8C42E5DD2EFF6862F3EE22EB287CE50011BDD6F7FD447ECB3FD7E888F4A58BEE31DAC3633F79B74B83885E53742D8587BA89CD2280FF47BA619EAB972F12D17D0607EB3D3BFEB3AADBA5F0C59585873A7065368C22F5595994F48C6AB52A330A445721A29E5C4F11048151A4FEA2A8D92ED7EA88500700105EEF79DE1429E986018091E1A1A24B1062D37AED7D9B1F223D05C28F155DCB8A8E0975139B0C846FAF542A72A006AEECC82844B7191818E8A92D792B954A0CC28B4C6CB2A26B59D131A10E0026361788E8A34125E8E92D7A07FAFBE5200CD1958808C33DD2051354827922FAA889CD54D1B5ACD651A10E0026366F574A7DB197A7390E8F482B5D74AFE1E1E1A24B68393FF053A5D4174D6CDE5E742DD7EAB8500700227AB5EFFB977B759AE3D0A084BAE85E0303FD084A7C6E423E7DF13211BDBAE85AAEA723433D9F16F4BC4A5889D163B95EEDEB43A5D23B7D92A29CEA655D88444025AC2C03F8964E98BE783D1D19EA006062739E883E5C092A7345D7D24EF5C1925E0CA2A79475756925A8CC11D1474C6CCE155DCB5A3A36D401C0C4E61DA4E8AF8220E89919318312EAA204EAF55AE9F68209822026459F33B17947D1B5ACA7A3431D0088E80795A71EF603DF155D4BAB05818FFE6AB5E83284D836CFF34AB56F911FF8AC3CF570A7F6A3AFD6F1A16E62C344F49DBDB03F4C593FB28ADE5496F7733E306A88E89526365C743D37D2F1A10E00263633008E56C2CA629983BD26C782891229434B9D8850092B8B00264D6CA68BAE6723BA22D401C0C4E60922FA8D326FFC55AF49A88BF288A2A8EB579706956096887EC3C4E6F1A26BD9A8AE09750030B179A722757F5009168AAEA5D9FAFAA29EDDE14E94576DA07B5BEB41255850A4EE37B17967D1B56C4657853A0018637E5229F5377EE02745D7D24C035DFCE617622D03B5FEA24BD8123FF013A5D4178C313F59742D9BD575A10E5C9911E379DE37FDC06FFB49DDADD2CD2D1A21D652EBC22E453FF0ADE779DF24A2BB8AAE652BBA32D44D6C1222FA37BEEF5FF24BB21C7960A03B5B3442AC47876157AD90F6031FBEEF5F22A27F6362D395BD015D19EA006062330BE0F67CAA51D1E56C8BD65AFAD34569F557BBA3C1924F5DCC00DC9EE74B57EADA500700139B8B00F6873AB4DD1CECFDFDB2E0489457B50BDEDF4484508716C09E3C57BA5657873A70650F7600FFA9125696BA35D825D4459975FA2AE97C2EFA1280FF94E74957EBFA5007AE9C714A44BF5A092BF3DD18ECD50E7FD30BB11DD56A5FC7EE039307FA3C11FD6AA79C31BA5DA508750030B1793711FD66B72D4E524AA12F8A8A2E438896514A218A74D1655C57BEB8E8374D6CDE5D742DCD529A5007F2C5494AFD4E25AC744DB04751D4B1AD18219AA5133F8D56C2CAAC52EA77BA6D71D18D942AD401C0C4E63F7453B0F7F5492B5D945FA7BDCF5705FA7F28BA96662B5DA8035783FD93DD10EC9174BD881ED0495D8C79A07FB28C810E9434D401C0C4E66DDD10EC9DF46617A2553AA5F1B22AD0DF56742DAD52DA5007AE067B4777C574DAC752215AC1F7FDC25796AEEA72296DA003250F75E06A57CC272A6165AED3062483209095A4A26714D55ACFA72DCE2AA53E51D62E97D54A1FEA006062F376A5D46F75DA3CF64EF9482A443B14F17E5F9987AE94FA9889CDDBDB5E40017A22D4812BD31D89E8BF54C2CA72A704BBD661D12508D1363A6CEFFB7D65A52811FD97B24D5B5C4FCF843A707581D207431DA69D10EC619BDFE44214A99DEFF77C2F9794883E54A685451BD153A10E5CD95200C0DE5087C60FFC420F916D77CB458822B5EB93A91FF81CEAD000D85B96A5FF9BD173A10E5CDD046CC2F7FD33451EB4212D75D14B2A954ACB574FFB816F7DDF3F0B60A20C9B736D454F863A0098D85C0270CCF3BC13411014B2197E18568A7859210A4144A8545AF79E0F8220F13CEF010093F9F5DD937A36D401C0C4668E885EA43CF5F9761F661D043E3CCF6BE74B0A51B8567D3A0D2AC182F2D4E789E8DB4D6CE65AF2225DA2A7431D004C6CD2C424DFE779DE1F54C2CA6CBB06505BD96211A253854D7EDFAFCC41F73CEFD38949BECFC4266DEA0B74A19E0FF51526366F544A7DAC5D876D48A88B5ED4CC55A52B5316F339E86F68DA13773909F555F2B9EC47431D2EFB81EF5AF95A41D03D87F10AD12C41931A337EE0BB5087CB4434D94B73D0374242FD1A26364F0198C80750E356BD4E45425DF4A020D8FEB6184110C4F980E88489CD93DBAFAA5C24D4AFC3C46686885EA03CF5D94AA5328716F4C6484B5DF4A26D356608A8542A73CA539F25A2E79BD8CC34AFB2F290505F83890D272679B5F2D4C7C2308C9BDDCF2E1B79895EB4D5F73D11210CC35879EA6389495E6D6253E8C2C14E26A17E032636EF20A283A10EA7FCC06FDAC8BADF848FA142749BAD84BA1FF869A8C329223A6862F38E1694552A12EA1B60623305E090E7799F0B2AC17C339E53E6A88B5EB4D9F77D5009E63DCFFB6B0087F2EB50DC8084FA0699D82CE7F3D97F3BD461ACD4F6FEE97C0975D1A37CFFC6EF7DA514421DC69EE7FD7662927F6762B3DC86D24A41427D934C6C7E8E880E542A95278220305B7D1E69A98B5EE5A9F5DFFB4110984AA5F204111D30B1F9B93695551A12EA5B6062730184239EE7DDBBD555A812EAA257796BB4D457AD0EBD178423BDBA21D77649A86F91898D35C6FCA852EAD7431D2E6C661055025DF4B2EBBDFFF3C1D005A5D4AF1B637ED4C4A6B0DD53BB9D84FA36E5FB358F7B9EF7971B6DB54BA88B5EB6FAFDBFAA75FE9700C67B71FFF36693506F02139BC5C4243FA094FA70BEC5C0BAADF6E2CF5C12A2388AAEC44EDE3A5F564A7D3831C90F98D82C165C5A2948A8379189CD7B00ECF03CEF33EBB5DAA5A52E7A1A61A575FE19003BF2EB463489847A9399D82C2526B933EF6BBFB89D19324294CDD367CE9AE538BEA494FAF5C424779AD82C155D53D948A8B748DE37B8CBF3BD4F853A5C9215A4A2974D5DB880071FFAFAE2ECDCDCEF02D8297DE7AD23A1DE422636CEC4E60D4434E979DE572A95CA1C1149F78BE8195996E1B1279E989B9E9EF94A66EDEDC78EDEF653B58181966E6BDDEBA4F9D806F9F6A02FD091FEA5D00BDF6A9D0B00C8A9D3A2D4CE9C3D975C9E9D4D99F9376E9F3CFAAEA2EBE915D2526F23139B77011871EC3E75F2C187E2F35317A4C5224AE7FCD40577F2C187E2CBB3B39F72CE8D48A0B797B4D4DBCCC4A631D0DFFF53A9CDDE353D33F3C9F9F9F917EDDD333ED8D7D7577469426CCBF2F2329E3E737636CDB27F76CEFDD8F16393B222B40012EA0570CCC8DFF0DF7BE2E4A9173FFEE4539F88B41EDF33BEBBDEAAD3D6856895244970E6ECB9B9D89873D6DA9F387E6CF24B45D7D4CB24D40BC0EE995E97FC02387AE2E4A97B1E79ECF19FAA56AB037B76EF1A90939144A74BB30C67CE9E5B585A5A5AB0D67EFCF8B1C90DCD68B1567600682509F50E915F10EF7DE0D483BFF48DC5C59FAED76AC1EE5D3BAB724292E8345996E1DCF9A9A5B9F9F94C06413B8F2446011CAF7D12577E81BCEB81530F7E606E7EFEA76BB501B57BD7AE6A20E12E0A966619CE9D3FBF343FBFE098F9A3B74F1E7D67D13589E792A4288073379EF4925F30EF7CE0D4831F989F5F78F3C0C080DAB963AC5F4B9FBB6833932498BA7071716161C131F36F6E37CCA5FBA5B524D40BB091505F7135DC4F9E7AFFE2E2E28F6B1D0EEC1CDB51EFEFAFB6AE4021002C2E2E61EAE2853963920567ED7FBBFDD8E4BB9BF1BCCEC999D1AD24A15E80ADB454F20BEADD274E9EFABEA7CCE95FF43CEFF0E060BDB673C70ED9F45134D5D4850B3C3B3B376FAD7D34B3F63DC78F4DFE79339F5F5AEAAD25A15E006686730E5B39E734BFC0FEFCC4C9532FB8343DF30B972E4D7FE7F0F07065D7CE1DFE564E601202B8F29E3C7FE14236333DD300D1DF586BFFE3F16393FFA315AF25A1DE5A12EA05B1D66E29D457E417DCAB4E9C3C353E3D33F30B172F5DFA89A1C1C1787474A41A69DDBC4245A9C5C6E0D2A5E9A5CBB3B391A7D4A7AC733F7FFCD8E4D956BEA6847A6B49A817C45A87664C45CF2FC09F02F0530F9C3CF5FEF985851F0E7C7FA85EAFD5A56B46AC65EAC2059E9B9B9F4BB3ECB2B3F6F78E37A9BF7C2324D45B4B42BD20AD7863AFEA777F713A3DF38EA90B17FFD7C1C1FAF2C8F070B52ADB10F4BCA5E5654CCFCC2CCDCECEF5799EF727D6DA5F69F7EACF95AE47D13A12EA05B1366BD973E717EA9D274E9EF26667E7DEB7B8B0780788F60D0D0EEAE1A1A1200C2B2D7B6DD15992A48199CB97D3CBB3B306CC4F65D6DE0FE07D93B7DD5A487339CBA495DE6A12EA0549D3D685FA8AE3C7262D80F70078CF8993A76E9A9E99F9999999991FF48320AAD76A0323C3434AB623289F34CB303D3DE3E6E6E717B2348D19F843E7DC878F1F9B7CB8E8DAB26CDDE37B451348A817246DF39B3BBFA0DF06E06D274E9EFAB64BD3D36FBC343D7D77A552416D60A0363C34A82A1569C177AB46A38199CBB36E7E6161BED16810803F72CE7DECF8B1C92F175DDB6AED68CCF43A09F58214F9E6CE2FF42F0378C38993A75ED268347EECD2F4F45DBEEF07F55AADAF5EAF057D5154587D626396E3187373F3E9DCFCFC7276A5097C9F73EE93C78F4D7EB1E8DAD692A6D2526F3509F582A48DCE7873E701F045006F3E71F2D4B75C9A9EFE9199CB975FC5CCFB6AB501571B18A80EF4F7CB117C1DC05A8B85C545CC2F2C2CCDCF2F28227ACA39F71966FED4F163935F2DBABE8D90506F3D09F58234D246D1253C471E0C5F05F073274E9EDA393B3BF7FD8B0B8B775BE7FE6DA5524907FAAB7D03030341B5AF6F5B73ECC5C638E7B0B4BC8C85858574617169B9D168049E527F97597B2F80CF1E3F363955748D9BD56874DEFBBE6C24D40BD2E89096FA5AF2C0F844FE07274E9E7A61A3D1B8EBF2ECDC7739E78E5782C054ABD54A7FB51AF5F54590FEF8ED6B341A585E8EB1B8B4142F2D2D351A69AA9552279C737FCDCCF71D3F36F92F45D7B85D0D69A9B79C847A41922429BA844DC903E56AA89C3879EAF949A3F192B9F9F9EF65E617135154EDEBB351A46B03FDFDD05A4B6B7E1DCE391863B0B0B8883836F34BCBCB1E33C744F4256BED5F02F8A7562DD32F5262BAEB7DDF8D24D40BC2CC68341A5DDBC23D7E6CF22B00BE02E0230070E2E4A989F98585972C2E2D7DD7A5E999973BE70E7B9E97681DDABE28EA8FA2C8D361885E3CAE2F49129824411CC776398E178D4994B5562BA51E65E6BF77CEFD35AE84F85345D7DA6A494342BDD524D40B6492A46B43FD5AC78F4D9E06F0E9FC0F00E0C4C953871717B3DB9796965FE429F5AD0C3EE61CEF082B95451D692FAC54AA611852A5524158A974F560ACB51649A38146A3812449386934964C6C6CD268F42B45170874D23AF7AFCCFCDF013C70FCD8E42345D7DC6E596665F1511B48A81728310930305074192D73FCD8E4A3001E05F0272BB79D38794A9B24396E926492886EF3943AC6C011E7DC041191EFFB4910F85CA954824A10F4054100DFF7AFFCF13CF8BEDFD66E1DE71CB22C4366ED95FF6619D23445234D971B8D469AA61965591632332BA54E13F08875EE24333F04E014801393B71D356D2BB883755B9763B792502F502FBEC98F1F9B3400FE7BFEE7594E9C3C35D46834261A8DC6DEA5A5E509223AA4949A20600F03BB987998996B007C224A3CA532CFF39C528A9552448A48294F794A79447435F93D4FF944E431B3B5D65D5D20C0CCCEBA2BFF63C7EC9C63E71C596B9575CE67E610404644F3443443C07906CE38E74E33F363004E03781AC0E9E3C7262FB7FC1FAFCBF5E2FBBD0812EA054A1299DEB55A1E8C97019C58EF7E274E9EAA30F3A0736E30CDB24100FD00AA0022001AC0009EFDDEEE03100248002CAFBA3D03B000C00088012C01580430BBF2E7F8B149F921358991506F8BFF1F6FBBECED14E42EE70000000049454E44AE426082);

-- ----------------------------
-- Table structure for vp_app_expense_wkflw_det
-- ----------------------------
DROP TABLE IF EXISTS `vp_app_expense_wkflw_det`;
CREATE TABLE `vp_app_expense_wkflw_det` (
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

-- ----------------------------
-- Records of vp_app_expense_wkflw_det
-- ----------------------------

-- ----------------------------
-- Table structure for vp_app_invoice_wkflw_det
-- ----------------------------
DROP TABLE IF EXISTS `vp_app_invoice_wkflw_det`;
CREATE TABLE `vp_app_invoice_wkflw_det` (
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

-- ----------------------------
-- Records of vp_app_invoice_wkflw_det
-- ----------------------------

-- ----------------------------
-- Table structure for vp_app_opportunity_wkflw_det
-- ----------------------------
DROP TABLE IF EXISTS `vp_app_opportunity_wkflw_det`;
CREATE TABLE `vp_app_opportunity_wkflw_det` (
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

-- ----------------------------
-- Records of vp_app_opportunity_wkflw_det
-- ----------------------------

-- ----------------------------
-- Table structure for vp_app_po_wkflw_det
-- ----------------------------
DROP TABLE IF EXISTS `vp_app_po_wkflw_det`;
CREATE TABLE `vp_app_po_wkflw_det` (
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

-- ----------------------------
-- Records of vp_app_po_wkflw_det
-- ----------------------------

-- ----------------------------
-- Table structure for vp_app_project_wkflw_det
-- ----------------------------
DROP TABLE IF EXISTS `vp_app_project_wkflw_det`;
CREATE TABLE `vp_app_project_wkflw_det` (
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

-- ----------------------------
-- Records of vp_app_project_wkflw_det
-- ----------------------------

-- ----------------------------
-- Table structure for vp_app_proposal_wkflw_det
-- ----------------------------
DROP TABLE IF EXISTS `vp_app_proposal_wkflw_det`;
CREATE TABLE `vp_app_proposal_wkflw_det` (
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

-- ----------------------------
-- Records of vp_app_proposal_wkflw_det
-- ----------------------------

-- ----------------------------
-- Table structure for vp_app_wkflw_mst
-- ----------------------------
DROP TABLE IF EXISTS `vp_app_wkflw_mst`;
CREATE TABLE `vp_app_wkflw_mst` (
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

-- ----------------------------
-- Records of vp_app_wkflw_mst
-- ----------------------------

-- ----------------------------
-- Table structure for vp_bill
-- ----------------------------
DROP TABLE IF EXISTS `vp_bill`;
CREATE TABLE `vp_bill` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `automation_id` int(11) DEFAULT NULL,
  `vendor_id` int(11) DEFAULT NULL,
  `uuid` varchar(100) NOT NULL,
  `po_id` int(11) DEFAULT NULL,
  `receipt_id` int(11) DEFAULT NULL,
  `bill_attachment_id` int(11) DEFAULT NULL,
  `term` int(11) DEFAULT NULL,
  `attachment_url` varchar(250) DEFAULT NULL,
  `attachment_url_approved` varchar(250) DEFAULT NULL,
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
  `original_file_name` varchar(150) DEFAULT NULL,
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
  `approval_group_level` int(3) DEFAULT NULL,
  `remaining_celing` decimal(19,2) DEFAULT NULL,
  `approval_user` varchar(100) DEFAULT NULL,
  `approval_group_name` varchar(75) DEFAULT NULL,
  `approval_group` int(11) DEFAULT NULL,
  `approval_user_name` varchar(200) DEFAULT NULL,
  `extended_approval_user` varchar(100) DEFAULT NULL,
  `export_status` char(1) DEFAULT NULL,
  `payment_status` char(2) DEFAULT NULL,
  `status` char(1) NOT NULL,
  `deletion_status` char(1) DEFAULT NULL,
  `approved_date` datetime DEFAULT NULL,
  `created_by` varchar(100) NOT NULL,
  `created_on` datetime NOT NULL,
  `update_by` varchar(100) DEFAULT NULL,
  `update_on` datetime DEFAULT NULL,
  `delete_by` varchar(100) DEFAULT NULL,
  `delete_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK39h0uns08ssn9fvuqlpktjdj8` (`vendor_id`) USING BTREE,
  KEY `PO_KEY_FK_1` (`po_id`),
  KEY `AUTOMATION_ID_FK_6` (`automation_id`),
  KEY `WORKFLOW_ID_FK_9` (`workflow_id`),
  KEY `APPROVAL_GROUP_FK_1` (`approval_group`),
  KEY `BILL_ATTACHMENT_ID_FK_1` (`bill_attachment_id`),
  KEY `PO_RECEIPT_FK_1` (`receipt_id`),
  CONSTRAINT `APPROVAL_GROUP_FK_1` FOREIGN KEY (`approval_group`) REFERENCES `common_approval_group` (`id`),
  CONSTRAINT `AUTOMATION_ID_FK_6` FOREIGN KEY (`automation_id`) REFERENCES `common_automation_mst` (`id`),
  CONSTRAINT `BILL_ATTACHMENT_ID_FK_1` FOREIGN KEY (`bill_attachment_id`) REFERENCES `vp_bill_attachment` (`id`),
  CONSTRAINT `PO_KEY_FK_1` FOREIGN KEY (`po_id`) REFERENCES `vp_po_mst` (`id`),
  CONSTRAINT `PO_RECEIPT_FK_1` FOREIGN KEY (`receipt_id`) REFERENCES `vp_po_receipt_mst` (`id`),
  CONSTRAINT `VENDOR_ID_FK_8` FOREIGN KEY (`vendor_id`) REFERENCES `vp_vendor_mst` (`id`),
  CONSTRAINT `WORKFLOW_ID_FK_9` FOREIGN KEY (`workflow_id`) REFERENCES `common_document_workflow_config` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of vp_bill
-- ----------------------------

-- ----------------------------
-- Table structure for vp_bill_additional_data
-- ----------------------------
DROP TABLE IF EXISTS `vp_bill_additional_data`;
CREATE TABLE `vp_bill_additional_data` (
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

-- ----------------------------
-- Records of vp_bill_additional_data
-- ----------------------------

-- ----------------------------
-- Table structure for vp_bill_additional_field_attachment
-- ----------------------------
DROP TABLE IF EXISTS `vp_bill_additional_field_attachment`;
CREATE TABLE `vp_bill_additional_field_attachment` (
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

-- ----------------------------
-- Records of vp_bill_additional_field_attachment
-- ----------------------------

-- ----------------------------
-- Table structure for vp_bill_assignee
-- ----------------------------
DROP TABLE IF EXISTS `vp_bill_assignee`;
CREATE TABLE `vp_bill_assignee` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `assignee` varchar(100) NOT NULL,
  `invoice_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `invoice_id` (`invoice_id`) USING BTREE,
  KEY `assignees` (`assignee`) USING BTREE,
  CONSTRAINT `vp_bill_assignee_ibfk_1` FOREIGN KEY (`invoice_id`) REFERENCES `vp_bill` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of vp_bill_assignee
-- ----------------------------

-- ----------------------------
-- Table structure for vp_bill_attachment
-- ----------------------------
DROP TABLE IF EXISTS `vp_bill_attachment`;
CREATE TABLE `vp_bill_attachment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bill_id` int(11) NOT NULL,
  `bill_data` mediumblob NOT NULL,
  `file_name` varchar(200) NOT NULL,
  `file_type` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `BILL_ID_FK_1` (`bill_id`),
  CONSTRAINT `BILL_ID_FK_1` FOREIGN KEY (`bill_id`) REFERENCES `vp_bill` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of vp_bill_attachment
-- ----------------------------

-- ----------------------------
-- Table structure for vp_bill_audit_trail
-- ----------------------------
DROP TABLE IF EXISTS `vp_bill_audit_trail`;
CREATE TABLE `vp_bill_audit_trail` (
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

-- ----------------------------
-- Records of vp_bill_audit_trail
-- ----------------------------

-- ----------------------------
-- Table structure for vp_bill_create_detail
-- ----------------------------
DROP TABLE IF EXISTS `vp_bill_create_detail`;
CREATE TABLE `vp_bill_create_detail` (
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

-- ----------------------------
-- Records of vp_bill_create_detail
-- ----------------------------

-- ----------------------------
-- Table structure for vp_bill_expense_cost_distribution
-- ----------------------------
DROP TABLE IF EXISTS `vp_bill_expense_cost_distribution`;
CREATE TABLE `vp_bill_expense_cost_distribution` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) NOT NULL,
  `description` varchar(500) NOT NULL DEFAULT '',
  `amount` decimal(19,2) NOT NULL,
  `billable` tinyint(1) DEFAULT NULL,
  `tax` tinyint(1) DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  `bill_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_vp_vendor_item_cost_distribution_vp_vendor_mst` (`bill_id`),
  KEY `FK_vp_vendor_item_cost_distribution_common_chart_of_account` (`account_id`),
  KEY `PROJECT_ID_FK_3` (`project_id`),
  CONSTRAINT `FK_vp_vendor_item_cost_distribution_common_chart_of_account` FOREIGN KEY (`account_id`) REFERENCES `common_account_number` (`id`),
  CONSTRAINT `FK_vp_vendor_item_cost_distribution_vp_vendor_mst` FOREIGN KEY (`bill_id`) REFERENCES `vp_bill` (`id`),
  CONSTRAINT `PROJECT_ID_FK_3` FOREIGN KEY (`project_id`) REFERENCES `common_approval_code` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of vp_bill_expense_cost_distribution
-- ----------------------------

-- ----------------------------
-- Table structure for vp_bill_item_cost_distribution
-- ----------------------------
DROP TABLE IF EXISTS `vp_bill_item_cost_distribution`;
CREATE TABLE `vp_bill_item_cost_distribution` (
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
  `bill_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_vp_invoice_item_cost_distribution_common_product_mst` (`item_id`),
  KEY `FK_vp_invoice_item_cost_distribution_vp_vendor_invoice` (`bill_id`),
  KEY `PROJECT_ID_FK_1` (`project_id`),
  KEY `PO_ID_FK_1` (`po_id`),
  CONSTRAINT `FK_vp_invoice_item_cost_distribution_common_product_mst` FOREIGN KEY (`item_id`) REFERENCES `common_item_mst` (`id`),
  CONSTRAINT `FK_vp_invoice_item_cost_distribution_vp_vendor_invoice` FOREIGN KEY (`bill_id`) REFERENCES `vp_bill` (`id`),
  CONSTRAINT `PO_ID_FK_1` FOREIGN KEY (`po_id`) REFERENCES `vp_po_mst` (`id`),
  CONSTRAINT `PROJECT_ID_FK_1` FOREIGN KEY (`project_id`) REFERENCES `common_approval_code` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of vp_bill_item_cost_distribution
-- ----------------------------

-- ----------------------------
-- Table structure for vp_bill_payment
-- ----------------------------
DROP TABLE IF EXISTS `vp_bill_payment`;
CREATE TABLE `vp_bill_payment` (
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
  CONSTRAINT `FK_AP_ACCOUNT` FOREIGN KEY (`ap_account_ref`) REFERENCES `common_account_number` (`id`),
  CONSTRAINT `FK_BANK_ACCOUNT_REF` FOREIGN KEY (`bank_account_ref`) REFERENCES `common_account_number` (`id`),
  CONSTRAINT `FK_IMPORT_MST` FOREIGN KEY (`import_id`) REFERENCES `vp_bill_payment_import_mst` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of vp_bill_payment
-- ----------------------------

-- ----------------------------
-- Table structure for vp_bill_payment_additional_data
-- ----------------------------
DROP TABLE IF EXISTS `vp_bill_payment_additional_data`;
CREATE TABLE `vp_bill_payment_additional_data` (
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

-- ----------------------------
-- Records of vp_bill_payment_additional_data
-- ----------------------------

-- ----------------------------
-- Table structure for vp_bill_payment_additional_field_attachment
-- ----------------------------
DROP TABLE IF EXISTS `vp_bill_payment_additional_field_attachment`;
CREATE TABLE `vp_bill_payment_additional_field_attachment` (
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

-- ----------------------------
-- Records of vp_bill_payment_additional_field_attachment
-- ----------------------------

-- ----------------------------
-- Table structure for vp_bill_payment_attachment
-- ----------------------------
DROP TABLE IF EXISTS `vp_bill_payment_attachment`;
CREATE TABLE `vp_bill_payment_attachment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_payment_id` int(11) NOT NULL,
  `payment_data` mediumblob NOT NULL,
  `name` varchar(200) NOT NULL,
  `file_type` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of vp_bill_payment_attachment
-- ----------------------------

-- ----------------------------
-- Table structure for vp_bill_payment_distribution
-- ----------------------------
DROP TABLE IF EXISTS `vp_bill_payment_distribution`;
CREATE TABLE `vp_bill_payment_distribution` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `un_tag_referance` int(11) NOT NULL,
  `invoice_referance` int(11) NOT NULL,
  `distribute_amount` decimal(19,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of vp_bill_payment_distribution
-- ----------------------------

-- ----------------------------
-- Table structure for vp_bill_payment_import_issue
-- ----------------------------
DROP TABLE IF EXISTS `vp_bill_payment_import_issue`;
CREATE TABLE `vp_bill_payment_import_issue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `import_mst_id` int(11) NOT NULL,
  `record` text DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL,
  `line_no` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_IMPORT_MST2` (`import_mst_id`),
  CONSTRAINT `FK_IMPORT_MST2` FOREIGN KEY (`import_mst_id`) REFERENCES `vp_bill_payment_import_mst` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of vp_bill_payment_import_issue
-- ----------------------------

-- ----------------------------
-- Table structure for vp_bill_payment_import_mst
-- ----------------------------
DROP TABLE IF EXISTS `vp_bill_payment_import_mst`;
CREATE TABLE `vp_bill_payment_import_mst` (
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

-- ----------------------------
-- Records of vp_bill_payment_import_mst
-- ----------------------------

-- ----------------------------
-- Table structure for vp_bill_related_grn
-- ----------------------------
DROP TABLE IF EXISTS `vp_bill_related_grn`;
CREATE TABLE `vp_bill_related_grn` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_mst_id` int(11) NOT NULL,
  `grn_mst_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_vp_invoice_related_grn_vp_vendor_invoice` (`invoice_mst_id`),
  KEY `FK_vp_invoice_related_grn_vp_grn_mst` (`grn_mst_id`),
  CONSTRAINT `FK_vp_invoice_related_grn_vp_grn_mst` FOREIGN KEY (`grn_mst_id`) REFERENCES `vp_po_receipt_mst` (`id`),
  CONSTRAINT `FK_vp_invoice_related_grn_vp_vendor_invoice` FOREIGN KEY (`invoice_mst_id`) REFERENCES `vp_bill` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of vp_bill_related_grn
-- ----------------------------

-- ----------------------------
-- Table structure for vp_bill_temp
-- ----------------------------
DROP TABLE IF EXISTS `vp_bill_temp`;
CREATE TABLE `vp_bill_temp` (
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

-- ----------------------------
-- Records of vp_bill_temp
-- ----------------------------

-- ----------------------------
-- Table structure for vp_bill_template_detail
-- ----------------------------
DROP TABLE IF EXISTS `vp_bill_template_detail`;
CREATE TABLE `vp_bill_template_detail` (
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

-- ----------------------------
-- Records of vp_bill_template_detail
-- ----------------------------

-- ----------------------------
-- Table structure for vp_bill_template_mst
-- ----------------------------
DROP TABLE IF EXISTS `vp_bill_template_mst`;
CREATE TABLE `vp_bill_template_mst` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vendor_id` int(11) NOT NULL,
  `template_name` varchar(100) NOT NULL,
  `bill_date_format` varchar(30) NOT NULL,
  `bill_id` int(11) DEFAULT NULL,
  `created_by` varchar(100) NOT NULL,
  `created_on` datetime NOT NULL,
  `update_by` varchar(100) DEFAULT NULL,
  `update_on` datetime DEFAULT NULL,
  `delete_by` varchar(100) DEFAULT NULL,
  `delete_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `vendor_id` (`vendor_id`) USING BTREE,
  KEY `invoice_id` (`bill_id`) USING BTREE,
  CONSTRAINT `vp_bill_template_mst_ibfk_2` FOREIGN KEY (`bill_id`) REFERENCES `vp_bill` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of vp_bill_template_mst
-- ----------------------------

-- ----------------------------
-- Table structure for vp_bill_term
-- ----------------------------
DROP TABLE IF EXISTS `vp_bill_term`;
CREATE TABLE `vp_bill_term` (
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

-- ----------------------------
-- Records of vp_bill_term
-- ----------------------------
INSERT INTO `vp_bill_term` VALUES ('1', 'Due on receipt', '0', '0.00', '0', 'A', 'admin', '2019-10-14 10:38:44', null, null, null, null);
INSERT INTO `vp_bill_term` VALUES ('2', 'Net 10', '10', '0.00', '0', 'A', 'admin', '2019-10-14 10:39:29', null, null, null, null);
INSERT INTO `vp_bill_term` VALUES ('3', 'Net 15', '15', '0.00', '0', 'A', 'admin', '2019-10-14 10:40:09', null, null, null, null);
INSERT INTO `vp_bill_term` VALUES ('4', 'Net 30', '30', '0.00', '0', 'A', 'admin', '2019-10-14 10:40:28', null, null, null, null);
INSERT INTO `vp_bill_term` VALUES ('5', 'Net 60', '60', '0.00', '0', 'A', 'admin', '2019-10-14 10:40:57', null, null, null, null);
INSERT INTO `vp_bill_term` VALUES ('6', '1%/10, Net 30', '30', '1.00', '10', 'A', 'admin', '2019-10-14 10:41:27', null, null, null, null);
INSERT INTO `vp_bill_term` VALUES ('7', '1%/15, Net 30', '30', '1.00', '15', 'A', 'admin', '2019-10-14 10:41:48', null, null, null, null);
INSERT INTO `vp_bill_term` VALUES ('8', '2%/10, Net 30', '30', '2.00', '10', 'A', 'admin', '2019-10-14 10:42:08', null, null, null, null);
INSERT INTO `vp_bill_term` VALUES ('9', '2%/15/Net 30', '30', '2.00', '15', 'A', 'admin', '2019-10-14 10:42:46', null, null, null, null);
INSERT INTO `vp_bill_term` VALUES ('10', 'Other', '0', '0.00', '0', 'A', 'admin', '2019-10-14 10:43:11', null, null, null, null);

-- ----------------------------
-- Table structure for vp_check_mst
-- ----------------------------
DROP TABLE IF EXISTS `vp_check_mst`;
CREATE TABLE `vp_check_mst` (
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

-- ----------------------------
-- Records of vp_check_mst
-- ----------------------------

-- ----------------------------
-- Table structure for vp_customer_vendor_relation
-- ----------------------------
DROP TABLE IF EXISTS `vp_customer_vendor_relation`;
CREATE TABLE `vp_customer_vendor_relation` (
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

-- ----------------------------
-- Records of vp_customer_vendor_relation
-- ----------------------------
INSERT INTO `vp_customer_vendor_relation` VALUES ('20', 'Silver Kite, Inc', 'steve@flysilverkite.com', null, null, null, '1443', '0', 'silverkiteinc', '2020-02-19 03:45:00', 'A', '', '0000-00-00 00:00:00', null, null, null, null);
INSERT INTO `vp_customer_vendor_relation` VALUES ('21', 'Aerotek, Inc', 'eklebahn@aerotek.com', null, null, null, '1446', '0', 'Aerotek', '2020-04-23 02:41:07', 'A', '', '0000-00-00 00:00:00', null, null, null, null);
INSERT INTO `vp_customer_vendor_relation` VALUES ('22', 'Test Company for Kim', 'kimaddis1@gmail.com', null, null, null, '1450', '0', 'kimaddis1@gmail.com', '2020-04-25 00:32:37', 'A', '', '0000-00-00 00:00:00', null, null, null, null);
INSERT INTO `vp_customer_vendor_relation` VALUES ('23', 'Design Solutions LLC', 'trageser@ds-engrs.com', null, null, null, '1452', '0', 'Design Solutions LLC', '2020-04-29 20:01:28', 'A', '', '0000-00-00 00:00:00', null, null, null, null);
INSERT INTO `vp_customer_vendor_relation` VALUES ('24', 'Titan Construction, LLC', 'dlbellinger@comcast.net', null, null, null, '1453', '0', 'dlbellinger', '2020-04-30 01:25:41', 'A', '', '0000-00-00 00:00:00', null, null, null, null);
INSERT INTO `vp_customer_vendor_relation` VALUES ('25', 'Mark S. Shinto', 'msshinto@comcast.net', null, null, null, '1449', '0', 'MarkS', '2020-05-04 20:33:47', 'A', '', '0000-00-00 00:00:00', null, null, null, null);
INSERT INTO `vp_customer_vendor_relation` VALUES ('26', 'On Point Design, LLC', 'TA@onpointdesignstudio.com', null, null, null, '1460', '0', 'onpointdesignstudio', '2020-05-15 20:46:11', 'A', '', '0000-00-00 00:00:00', null, null, null, null);
INSERT INTO `vp_customer_vendor_relation` VALUES ('27', 'Property Condition Assessments, LLC', 'epowers@pcallc.com', null, null, null, '1462', '0', 'epowers@pcallc.com', '2020-05-29 19:22:55', 'A', '', '0000-00-00 00:00:00', null, null, null, null);
INSERT INTO `vp_customer_vendor_relation` VALUES ('28', 'Veterans Environmental', 'ryan@vetsgee.com', null, null, null, '1464', '0', '248', '2020-06-12 18:39:59', 'A', '', '0000-00-00 00:00:00', null, null, null, null);
INSERT INTO `vp_customer_vendor_relation` VALUES ('29', 'Nichols Contracting, Inc.', 'psweeney@nicholscontracting.com', null, null, null, '1457', '0', 'PSweeney', '2020-06-18 01:39:51', 'A', '', '0000-00-00 00:00:00', null, null, null, null);
INSERT INTO `vp_customer_vendor_relation` VALUES ('30', 'Steven Myers', 'Sm1@sdc-ae.com', null, null, null, '1491', '0', 'Sm1', '2020-06-26 18:57:52', 'A', '', '0000-00-00 00:00:00', null, null, null, null);
INSERT INTO `vp_customer_vendor_relation` VALUES ('31', 'SECUR LPT, LLC', 'cliff.bright@securllc.com', null, null, null, '1492', '0', 'SECURLPT', '2020-07-09 19:04:43', 'A', '', '0000-00-00 00:00:00', null, null, null, null);
INSERT INTO `vp_customer_vendor_relation` VALUES ('32', 'Crane Service Company, Inc.', 'katiet@craneserviceco.com', null, null, null, '1465', '0', 'katiet@craneserviceco.com', '2020-07-23 01:36:29', 'A', '', '0000-00-00 00:00:00', null, null, null, null);
INSERT INTO `vp_customer_vendor_relation` VALUES ('33', 'Red Team Consulting', 'rina.kim@redteamconsulting.com', null, null, null, '1494', '0', 'redteam9009', '2020-07-24 00:37:34', 'A', '', '0000-00-00 00:00:00', null, null, null, null);
INSERT INTO `vp_customer_vendor_relation` VALUES ('34', 'Industrial Boiler & Mechanical Company, Inc.', 'amy@industrialboiler.com', null, null, null, '1502', '0', 'Ibm2018', '2020-08-26 18:26:48', 'A', '', '0000-00-00 00:00:00', null, null, null, null);
INSERT INTO `vp_customer_vendor_relation` VALUES ('35', 'Optimal Tank Solutions', 'mvaughan@optimaltanksolutions.com', null, null, null, '1506', '0', 'optimaltank', '2020-09-24 20:10:48', 'A', '', '0000-00-00 00:00:00', null, null, null, null);
INSERT INTO `vp_customer_vendor_relation` VALUES ('51', 'testCompany', 'mevitol345@nic58.com', null, null, null, '1513', '0', 'ven02', '2020-10-19 12:22:18', 'A', '', '0000-00-00 00:00:00', 'user1', '2020-10-19 12:24:03', null, null);
INSERT INTO `vp_customer_vendor_relation` VALUES ('52', 'a1', 'avishkaperera6@gmail.com', null, null, null, '1514', '0', 'a1', '2020-10-23 05:25:30', 'C', '', '0000-00-00 00:00:00', 'a1', '2020-10-23 05:39:47', null, null);
INSERT INTO `vp_customer_vendor_relation` VALUES ('53', 'a1', 'avishkaperera6@gmail.com', null, null, null, '1514', '0', 'a1', '2020-10-23 05:25:41', 'C', '', '0000-00-00 00:00:00', 'a1', '2020-10-23 05:39:52', null, null);
INSERT INTO `vp_customer_vendor_relation` VALUES ('54', 'a1', 'avishkaperera6@gmail.com', null, null, null, '1514', '0', 'a1', '2020-10-23 05:42:07', 'A', '', '0000-00-00 00:00:00', 'admin', '2020-10-23 11:46:56', null, null);
INSERT INTO `vp_customer_vendor_relation` VALUES ('55', 'we', 'avishkaperera6@gmail.com', null, null, null, '1516', '0', 'newww', '2020-10-25 16:07:29', 'A', '', '0000-00-00 00:00:00', 'admin', '2020-10-25 16:08:20', null, null);
INSERT INTO `vp_customer_vendor_relation` VALUES ('56', 'newprod', 'yifejov599@akxpert.com', null, null, null, '1519', '0', 'yifejov599@akxpert.com', '2020-11-08 12:44:19', 'A', '', '0000-00-00 00:00:00', 'admin', '2020-11-08 13:39:13', null, null);
INSERT INTO `vp_customer_vendor_relation` VALUES ('57', 'avishka141', 'avishkaperera6@gmail.com', null, null, null, '1514', '0', 'a1', '2020-11-28 11:48:27', 'A', '', '0000-00-00 00:00:00', 'admin', '2020-12-03 16:01:01', null, null);
INSERT INTO `vp_customer_vendor_relation` VALUES ('58', 'avishka141', 'avishkaperera6@gmail.com', null, null, null, '1514', '0', 'a1', '2020-12-09 18:54:49', 'A', '', '0000-00-00 00:00:00', 'admin', '2020-12-09 18:55:07', null, null);
INSERT INTO `vp_customer_vendor_relation` VALUES ('59', 'QBREGVEN', 'avishkaperera6@gmail.com', null, null, null, '1814', '0', 'sitalev143@hebgsw.com', '2020-12-11 06:20:36', 'A', '', '0000-00-00 00:00:00', 'admin', '2020-12-11 06:21:52', null, null);
INSERT INTO `vp_customer_vendor_relation` VALUES ('60', 'myvendor1', 'testpapertrl6@gmail.com', null, null, null, '2094', '0', 'QA-138', '2021-01-02 20:29:58', 'A', '', '0000-00-00 00:00:00', 'myvendor1', '2021-01-02 20:29:58', null, null);
INSERT INTO `vp_customer_vendor_relation` VALUES ('61', 'heyload', 'testpapertrl8@gmail.com', null, null, null, '2103', '0', 'qwerty@123', '2021-01-05 08:14:02', 'A', '', '0000-00-00 00:00:00', 'heyload', '2021-01-05 08:14:02', null, null);
INSERT INTO `vp_customer_vendor_relation` VALUES ('62', 'PortalInvite', 'foyorar546@liaphoto.com', null, null, null, '2416', '0', 'testing-qa', '2021-01-08 06:43:31', 'A', '', '0000-00-00 00:00:00', 'PortalInvite', '2021-01-08 06:43:31', null, null);

-- ----------------------------
-- Table structure for vp_expense_additional_data
-- ----------------------------
DROP TABLE IF EXISTS `vp_expense_additional_data`;
CREATE TABLE `vp_expense_additional_data` (
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

-- ----------------------------
-- Records of vp_expense_additional_data
-- ----------------------------

-- ----------------------------
-- Table structure for vp_expense_additional_field_attachments
-- ----------------------------
DROP TABLE IF EXISTS `vp_expense_additional_field_attachments`;
CREATE TABLE `vp_expense_additional_field_attachments` (
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

-- ----------------------------
-- Records of vp_expense_additional_field_attachments
-- ----------------------------

-- ----------------------------
-- Table structure for vp_expense_attachments
-- ----------------------------
DROP TABLE IF EXISTS `vp_expense_attachments`;
CREATE TABLE `vp_expense_attachments` (
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

-- ----------------------------
-- Records of vp_expense_attachments
-- ----------------------------

-- ----------------------------
-- Table structure for vp_expense_audit_trail
-- ----------------------------
DROP TABLE IF EXISTS `vp_expense_audit_trail`;
CREATE TABLE `vp_expense_audit_trail` (
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

-- ----------------------------
-- Records of vp_expense_audit_trail
-- ----------------------------

-- ----------------------------
-- Table structure for vp_expense_detail
-- ----------------------------
DROP TABLE IF EXISTS `vp_expense_detail`;
CREATE TABLE `vp_expense_detail` (
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

-- ----------------------------
-- Records of vp_expense_detail
-- ----------------------------

-- ----------------------------
-- Table structure for vp_expense_mst
-- ----------------------------
DROP TABLE IF EXISTS `vp_expense_mst`;
CREATE TABLE `vp_expense_mst` (
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

-- ----------------------------
-- Records of vp_expense_mst
-- ----------------------------

-- ----------------------------
-- Table structure for vp_expense_type
-- ----------------------------
DROP TABLE IF EXISTS `vp_expense_type`;
CREATE TABLE `vp_expense_type` (
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

-- ----------------------------
-- Records of vp_expense_type
-- ----------------------------
INSERT INTO `vp_expense_type` VALUES ('1', 'Airfare', 'A', 'admin', '2020-06-02 14:52:36', null, null, null, null);
INSERT INTO `vp_expense_type` VALUES ('2', 'Ground transportation', 'A', 'admin', '2020-06-02 14:54:00', null, null, null, null);
INSERT INTO `vp_expense_type` VALUES ('3', 'Tolls', 'A', 'admin', '2020-06-02 14:55:44', null, null, null, null);
INSERT INTO `vp_expense_type` VALUES ('4', 'Meals', 'A', 'admin', '2020-06-02 14:59:17', null, null, null, null);
INSERT INTO `vp_expense_type` VALUES ('5', 'Lodging', 'A', 'admin', '2020-06-02 14:59:31', null, null, null, null);
INSERT INTO `vp_expense_type` VALUES ('6', 'Tips', 'A', 'admin', '2020-06-02 14:59:50', null, null, null, null);
INSERT INTO `vp_expense_type` VALUES ('7', 'Entertainment', 'A', 'admin', '2020-06-02 15:00:03', null, null, null, null);
INSERT INTO `vp_expense_type` VALUES ('8', 'Registration fees', 'A', 'admin', '2020-06-02 15:00:18', null, null, null, null);
INSERT INTO `vp_expense_type` VALUES ('9', 'Business supplies', 'A', 'admin', '2020-06-02 15:00:29', null, null, null, null);
INSERT INTO `vp_expense_type` VALUES ('10', 'Business services', 'A', 'admin', '2020-06-02 15:00:42', null, null, null, null);
INSERT INTO `vp_expense_type` VALUES ('11', 'Maintenance', 'A', 'admin', '2020-06-02 15:00:53', null, null, null, null);
INSERT INTO `vp_expense_type` VALUES ('12', 'Permits', 'A', 'admin', '2020-06-02 15:01:11', null, null, null, null);
INSERT INTO `vp_expense_type` VALUES ('13', 'Shipping', 'A', 'admin', '2020-06-02 15:01:22', null, null, null, null);
INSERT INTO `vp_expense_type` VALUES ('14', 'Training', 'A', 'admin', '2020-06-02 15:01:34', null, null, null, null);

-- ----------------------------
-- Table structure for vp_po_additional_data
-- ----------------------------
DROP TABLE IF EXISTS `vp_po_additional_data`;
CREATE TABLE `vp_po_additional_data` (
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

-- ----------------------------
-- Records of vp_po_additional_data
-- ----------------------------

-- ----------------------------
-- Table structure for vp_po_additional_field_attachment
-- ----------------------------
DROP TABLE IF EXISTS `vp_po_additional_field_attachment`;
CREATE TABLE `vp_po_additional_field_attachment` (
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

-- ----------------------------
-- Records of vp_po_additional_field_attachment
-- ----------------------------

-- ----------------------------
-- Table structure for vp_po_attachment
-- ----------------------------
DROP TABLE IF EXISTS `vp_po_attachment`;
CREATE TABLE `vp_po_attachment` (
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

-- ----------------------------
-- Records of vp_po_attachment
-- ----------------------------

-- ----------------------------
-- Table structure for vp_po_audit_trail
-- ----------------------------
DROP TABLE IF EXISTS `vp_po_audit_trail`;
CREATE TABLE `vp_po_audit_trail` (
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of vp_po_audit_trail
-- ----------------------------

-- ----------------------------
-- Table structure for vp_po_detail
-- ----------------------------
DROP TABLE IF EXISTS `vp_po_detail`;
CREATE TABLE `vp_po_detail` (
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of vp_po_detail
-- ----------------------------

-- ----------------------------
-- Table structure for vp_po_mst
-- ----------------------------
DROP TABLE IF EXISTS `vp_po_mst`;
CREATE TABLE `vp_po_mst` (
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
  `approval_group` int(11) DEFAULT NULL,
  `extended_approval_user` varchar(100) DEFAULT NULL,
  `automation_id` int(11) DEFAULT NULL,
  `deletion_status` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1_CODE` (`project_code_id`),
  KEY `FK2_CODE` (`task_code_id`),
  KEY `FK1_VENDOR_PO` (`vendor_id`),
  KEY `APPROVAL_GROUP_FK_2` (`approval_group`),
  CONSTRAINT `APPROVAL_GROUP_FK_2` FOREIGN KEY (`approval_group`) REFERENCES `common_approval_group` (`id`),
  CONSTRAINT `FK1_CODE` FOREIGN KEY (`project_code_id`) REFERENCES `common_approval_code` (`id`),
  CONSTRAINT `FK2_CODE` FOREIGN KEY (`task_code_id`) REFERENCES `common_approval_code` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of vp_po_mst
-- ----------------------------

-- ----------------------------
-- Table structure for vp_po_receipt_additional_data
-- ----------------------------
DROP TABLE IF EXISTS `vp_po_receipt_additional_data`;
CREATE TABLE `vp_po_receipt_additional_data` (
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

-- ----------------------------
-- Records of vp_po_receipt_additional_data
-- ----------------------------

-- ----------------------------
-- Table structure for vp_po_receipt_additional_field_attachment
-- ----------------------------
DROP TABLE IF EXISTS `vp_po_receipt_additional_field_attachment`;
CREATE TABLE `vp_po_receipt_additional_field_attachment` (
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

-- ----------------------------
-- Records of vp_po_receipt_additional_field_attachment
-- ----------------------------

-- ----------------------------
-- Table structure for vp_po_receipt_attachment
-- ----------------------------
DROP TABLE IF EXISTS `vp_po_receipt_attachment`;
CREATE TABLE `vp_po_receipt_attachment` (
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

-- ----------------------------
-- Records of vp_po_receipt_attachment
-- ----------------------------

-- ----------------------------
-- Table structure for vp_po_receipt_detail
-- ----------------------------
DROP TABLE IF EXISTS `vp_po_receipt_detail`;
CREATE TABLE `vp_po_receipt_detail` (
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

-- ----------------------------
-- Records of vp_po_receipt_detail
-- ----------------------------

-- ----------------------------
-- Table structure for vp_po_receipt_mst
-- ----------------------------
DROP TABLE IF EXISTS `vp_po_receipt_mst`;
CREATE TABLE `vp_po_receipt_mst` (
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

-- ----------------------------
-- Records of vp_po_receipt_mst
-- ----------------------------

-- ----------------------------
-- Table structure for vp_vendor_address
-- ----------------------------
DROP TABLE IF EXISTS `vp_vendor_address`;
CREATE TABLE `vp_vendor_address` (
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
) ENGINE=InnoDB AUTO_INCREMENT=4860 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of vp_vendor_address
-- ----------------------------

-- ----------------------------
-- Table structure for vp_vendor_import_issue
-- ----------------------------
DROP TABLE IF EXISTS `vp_vendor_import_issue`;
CREATE TABLE `vp_vendor_import_issue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `import_mst_id` int(11) NOT NULL,
  `record` text DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL,
  `line_no` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_IMPORT_MST3` (`import_mst_id`),
  CONSTRAINT `FK_IMPORT_MST3` FOREIGN KEY (`import_mst_id`) REFERENCES `vp_vendor_import_mst` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of vp_vendor_import_issue
-- ----------------------------

-- ----------------------------
-- Table structure for vp_vendor_import_mst
-- ----------------------------
DROP TABLE IF EXISTS `vp_vendor_import_mst`;
CREATE TABLE `vp_vendor_import_mst` (
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

-- ----------------------------
-- Records of vp_vendor_import_mst
-- ----------------------------

-- ----------------------------
-- Table structure for vp_vendor_invitation
-- ----------------------------
DROP TABLE IF EXISTS `vp_vendor_invitation`;
CREATE TABLE `vp_vendor_invitation` (
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

-- ----------------------------
-- Records of vp_vendor_invitation
-- ----------------------------

-- ----------------------------
-- Table structure for vp_vendor_mst
-- ----------------------------
DROP TABLE IF EXISTS `vp_vendor_mst`;
CREATE TABLE `vp_vendor_mst` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(100) NOT NULL,
  `vendor_code` varchar(50) DEFAULT NULL,
  `business_name` varchar(150) DEFAULT NULL,
  `email` varchar(150) NOT NULL,
  `cc_email` varchar(150) DEFAULT NULL,
  `contact_number` varchar(20) DEFAULT NULL,
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
  `created_on` datetime NOT NULL,
  `created_by` varchar(100) NOT NULL,
  `update_on` datetime DEFAULT NULL,
  `update_by` varchar(100) DEFAULT '',
  `delete_on` datetime DEFAULT NULL,
  `delete_by` varchar(100) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of vp_vendor_mst
-- ----------------------------

-- ----------------------------
-- Table structure for vp_vendor_w9_attachment
-- ----------------------------
DROP TABLE IF EXISTS `vp_vendor_w9_attachment`;
CREATE TABLE `vp_vendor_w9_attachment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vendor_id` int(11) NOT NULL,
  `w9_form_data` mediumblob NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of vp_vendor_w9_attachment
-- ----------------------------

-- ----------------------------
-- Table structure for vp_vendor_w9_parameter
-- ----------------------------
DROP TABLE IF EXISTS `vp_vendor_w9_parameter`;
CREATE TABLE `vp_vendor_w9_parameter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `property_name` varchar(300) NOT NULL,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of vp_vendor_w9_parameter
-- ----------------------------
INSERT INTO `vp_vendor_w9_parameter` VALUES ('1', 'NAME_FIELD', 'topmostSubform[0].Page1[0].f1_1[0]', 'A');
INSERT INTO `vp_vendor_w9_parameter` VALUES ('2', 'BUSINESS_NAME_FIELD', 'topmostSubform[0].Page1[0].f1_2[0]', 'A');
INSERT INTO `vp_vendor_w9_parameter` VALUES ('3', 'EXEMPT_PAYEE_CODE', 'topmostSubform[0].Page1[0].Exemptions[0].f1_5[0]', 'A');
INSERT INTO `vp_vendor_w9_parameter` VALUES ('4', 'FACTA_CODE', 'topmostSubform[0].Page1[0].Exemptions[0].f1_6[0]', 'A');
INSERT INTO `vp_vendor_w9_parameter` VALUES ('5', 'TAX_TYPE_INDIVIDUAL', 'topmostSubform[0].Page1[0].FederalClassification[0].c1_1[0]', 'A');
INSERT INTO `vp_vendor_w9_parameter` VALUES ('6', 'TAX_TYPE_C_CORPORATION', 'topmostSubform[0].Page1[0].FederalClassification[0].c1_1[1]', 'A');
INSERT INTO `vp_vendor_w9_parameter` VALUES ('7', 'TAX_TYPE_S_CORPORATION', 'topmostSubform[0].Page1[0].FederalClassification[0].c1_1[2]', 'A');
INSERT INTO `vp_vendor_w9_parameter` VALUES ('8', 'TAX_TYPE_S_PARTNERSHIP', 'topmostSubform[0].Page1[0].FederalClassification[0].c1_1[3]', 'A');
INSERT INTO `vp_vendor_w9_parameter` VALUES ('9', 'TAX_TYPE_TRUST_ESTATE', 'topmostSubform[0].Page1[0].FederalClassification[0].c1_1[4]', 'A');
INSERT INTO `vp_vendor_w9_parameter` VALUES ('10', 'TAX_TYPE_OTHER', 'topmostSubform[0].Page1[0].FederalClassification[0].c1_1[6]', 'A');
INSERT INTO `vp_vendor_w9_parameter` VALUES ('11', 'TAX_TYPE_OTHER_DESC', 'topmostSubform[0].Page1[0].FederalClassification[0].f1_4[0]', 'A');
INSERT INTO `vp_vendor_w9_parameter` VALUES ('12', 'TAX_TYPE_LIMITED_LIABILITY', 'topmostSubform[0].Page1[0].FederalClassification[0].c1_1[5]', 'A');
INSERT INTO `vp_vendor_w9_parameter` VALUES ('13', 'TAX_TYPE_LIMITED_LIABILITY_CODE', 'topmostSubform[0].Page1[0].FederalClassification[0].f1_3[0]', 'A');
INSERT INTO `vp_vendor_w9_parameter` VALUES ('14', 'ADDRESS_PART_1', 'topmostSubform[0].Page1[0].Address[0].f1_7[0]', 'A');
INSERT INTO `vp_vendor_w9_parameter` VALUES ('15', 'ADDRESS_PART_2', 'topmostSubform[0].Page1[0].Address[0].f1_8[0]', 'A');
INSERT INTO `vp_vendor_w9_parameter` VALUES ('16', 'ADDRESS_OTHER', 'topmostSubform[0].Page1[0].f1_9[0]', 'A');
INSERT INTO `vp_vendor_w9_parameter` VALUES ('17', 'SOCIAL_SECURITY_NO_PART_1', 'topmostSubform[0].Page1[0].SSN[0].f1_11[0]', 'A');
INSERT INTO `vp_vendor_w9_parameter` VALUES ('18', 'SOCIAL_SECURITY_NO_PART_2', 'topmostSubform[0].Page1[0].SSN[0].f1_12[0]', 'A');
INSERT INTO `vp_vendor_w9_parameter` VALUES ('19', 'SOCIAL_SECURITY_NO_PART_3', 'topmostSubform[0].Page1[0].SSN[0].f1_13[0]', 'A');
INSERT INTO `vp_vendor_w9_parameter` VALUES ('20', 'EMPLOYEE_ID_NO_PART_1', 'topmostSubform[0].Page1[0].EmployerID[0].f1_14[0]', 'A');
INSERT INTO `vp_vendor_w9_parameter` VALUES ('21', 'EMPLOYEE_ID_NO_PART_2', 'topmostSubform[0].Page1[0].EmployerID[0].f1_15[0]', 'A');
