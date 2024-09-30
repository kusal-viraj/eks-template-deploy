ALTER TABLE `vp_expense_mst`
	DROP INDEX `EXPENSE_ATTACHMENT_ID_FK_1`;
	
	
INSERT INTO `umm_menu_privilage` (`id`, `menu_id`, `privilage_id`, `auth_code`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (464, 1007, 17, 'EXPENSES_UNDO', 'System', '2022-02-21 10:48:00', NULL, NULL, NULL, NULL);
INSERT INTO `umm_role_previlege` (`role_id`, `privilege_id`, `created_by`, `created_on`) VALUES ('1', '464', 'System', '2022-02-17 14:47:57');

ALTER TABLE `vp_expense_attachment`
	DROP FOREIGN KEY `EXPENSE_DETAIL_FK_1`;
	
ALTER TABLE `vp_expense_attachment`
	DROP INDEX `EXPENSE_DETAIL_FK_1`;
	
ALTER TABLE `vp_expense_audit_trail`
	ADD COLUMN `undo_status` CHAR(1) NULL DEFAULT NULL COLLATE 'latin1_swedish_ci' AFTER `expense_id`,
	ADD COLUMN `undo_action` TINYINT(1) NULL DEFAULT NULL AFTER `undo_status`,
	CHANGE COLUMN `automation_name` `automation_name` VARCHAR(200) NULL DEFAULT NULL COLLATE 'latin1_swedish_ci' AFTER `undo_action`;


DROP TABLE IF EXISTS `hst_vp_expense_mst`;
CREATE TABLE IF NOT EXISTS `hst_vp_expense_mst` (
  `recode_id` int(11) NOT NULL AUTO_INCREMENT,
  `id` int(11) NOT NULL,
  `uuid` varchar(100) NOT NULL,
  `automation_id` int(11) DEFAULT NULL,
  `vendor_id` int(11) DEFAULT NULL,
  `attachment_id` int(11) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `notes` varchar(500) DEFAULT NULL,
  `total_amount` decimal(19,2) DEFAULT NULL,
  `status` char(1) NOT NULL,
  `report_name` varchar(50) DEFAULT NULL,
  `business_purpose` varchar(50) DEFAULT NULL,
  `export_status` char(1) DEFAULT NULL,
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
  `undo_status` char(1) NOT NULL,
  PRIMARY KEY (`recode_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `hst_vp_expense_additional_data`;
CREATE TABLE IF NOT EXISTS `hst_vp_expense_additional_data` (
  `recode_id` int(11) NOT NULL AUTO_INCREMENT,
  `id` int(11) NOT NULL,
  `field_value` text DEFAULT NULL,
  `field_id` int(11) NOT NULL,
  `field_type_id` int(11) DEFAULT NULL,
  `field_name` varchar(50) NOT NULL,
  `section_id` int(11) NOT NULL,
  `detail_id` int(11) DEFAULT NULL,
  `expense_mst_id` int(15) NOT NULL,
  `display_order` int(11) NOT NULL,
  `multiple_status` char(1) DEFAULT NULL,
  `hst_recode_id` int(11) NOT NULL,
  PRIMARY KEY (`recode_id`),
  KEY `FK_hst_vp_expense_additional_data_hst_vp_expense_mst` (`hst_recode_id`),
  CONSTRAINT `FK_hst_vp_expense_additional_data_hst_vp_expense_mst` FOREIGN KEY (`hst_recode_id`) REFERENCES `hst_vp_expense_mst` (`recode_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `hst_vp_expense_additional_field_attachment`;
CREATE TABLE IF NOT EXISTS `hst_vp_expense_additional_field_attachment` (
  `recode_id` int(11) NOT NULL AUTO_INCREMENT,
  `id` int(11) NOT NULL,
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
  `hst_recode_id` int(11) NOT NULL,
  PRIMARY KEY (`recode_id`),
  KEY `FK_hst_vp_expense_additional_field_attachment_hst_vp_expense_mst` (`hst_recode_id`),
  CONSTRAINT `FK_hst_vp_expense_additional_field_attachment_hst_vp_expense_mst` FOREIGN KEY (`hst_recode_id`) REFERENCES `hst_vp_expense_mst` (`recode_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `hst_vp_expense_attachment`;
CREATE TABLE IF NOT EXISTS `hst_vp_expense_attachment` (
  `recode_id` int(11) NOT NULL AUTO_INCREMENT,
  `id` int(11) NOT NULL,
  `expense_mst_id` int(11) NOT NULL,
  `expense_detail_id` int(11) DEFAULT NULL,
  `attachment_url` varchar(200) NOT NULL,
  `file_name` varchar(200) DEFAULT NULL,
  `file_type` varchar(500) DEFAULT NULL,
  `status` char(1) NOT NULL,
  `delete_by` varchar(100) DEFAULT NULL,
  `delete_on` datetime DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `hst_recode_id` int(11) NOT NULL,
  PRIMARY KEY (`recode_id`),
  KEY `FK_hst_vp_expense_attachment_hst_vp_expense_mst` (`hst_recode_id`),
  CONSTRAINT `FK_hst_vp_expense_attachment_hst_vp_expense_mst` FOREIGN KEY (`hst_recode_id`) REFERENCES `hst_vp_expense_mst` (`recode_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `hst_vp_expense_detail`;
CREATE TABLE IF NOT EXISTS `hst_vp_expense_detail` (
  `recode_id` int(11) NOT NULL AUTO_INCREMENT,
  `id` int(11) NOT NULL,
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
  `hst_recode_id` int(11) NOT NULL,
  PRIMARY KEY (`recode_id`),
  KEY `FK_hst_vp_expense_detail_hst_vp_expense_mst` (`hst_recode_id`),
  CONSTRAINT `FK_hst_vp_expense_detail_hst_vp_expense_mst` FOREIGN KEY (`hst_recode_id`) REFERENCES `hst_vp_expense_mst` (`recode_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
