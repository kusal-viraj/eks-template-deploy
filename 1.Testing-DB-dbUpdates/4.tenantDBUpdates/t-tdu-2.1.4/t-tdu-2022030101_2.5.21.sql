----------Indra-----2.5.21-----------

DROP TABLE IF EXISTS `hst_vp_po_mst`;
CREATE TABLE IF NOT EXISTS `hst_vp_po_mst` (
  `recode_id` int(11) NOT NULL AUTO_INCREMENT,
  `id` int(11) NOT NULL,
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
  `undo_status` char(1) DEFAULT NULL,
  `action_status` int(11) NOT NULL,
  PRIMARY KEY (`recode_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `hst_vp_po_account_detail`;
CREATE TABLE IF NOT EXISTS `hst_vp_po_account_detail` (
  `recode_id` int(11) NOT NULL AUTO_INCREMENT,
  `id` int(11) NOT NULL,
  `account_id` int(11) DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  `purchase_order_mst_id` int(11) DEFAULT NULL,
  `amount` decimal(19,2) DEFAULT NULL,
  `account_number` varchar(50) DEFAULT NULL,
  `account_name` varchar(300) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `received` tinyint(1) DEFAULT NULL,
  `hst_recode_id` int(11) NOT NULL,
  PRIMARY KEY (`recode_id`),
  KEY `FK_hst_vp_po_account_detail_hst_vp_po_mst` (`hst_recode_id`),
  CONSTRAINT `FK_hst_vp_po_account_detail_hst_vp_po_mst` FOREIGN KEY (`hst_recode_id`) REFERENCES `hst_vp_po_mst` (`recode_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `hst_vp_po_additional_data`;
CREATE TABLE IF NOT EXISTS `hst_vp_po_additional_data` (
  `recode_id` int(11) NOT NULL AUTO_INCREMENT,
  `id` int(11) NOT NULL,
  `field_value` text DEFAULT NULL,
  `field_id` int(11) NOT NULL,
  `field_type_id` int(11) DEFAULT NULL,
  `field_name` varchar(50) NOT NULL,
  `section_id` int(11) NOT NULL,
  `detail_id` int(11) DEFAULT NULL,
  `po_mst_id` int(15) NOT NULL,
  `display_order` int(11) NOT NULL,
  `multiple_status` char(1) DEFAULT NULL,
  `hst_recode_id` int(11) NOT NULL,
  PRIMARY KEY (`recode_id`),
  KEY `FK_hst_vp_po_additional_data_hst_vp_po_mst` (`hst_recode_id`),
  CONSTRAINT `FK_hst_vp_po_additional_data_hst_vp_po_mst` FOREIGN KEY (`hst_recode_id`) REFERENCES `hst_vp_po_mst` (`recode_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `hst_vp_po_additional_field_attachment`;
CREATE TABLE IF NOT EXISTS `hst_vp_po_additional_field_attachment` (
  `recode_id` int(11) NOT NULL AUTO_INCREMENT,
  `id` int(11) NOT NULL,
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
  `hst_recode_id` int(11) NOT NULL,
  PRIMARY KEY (`recode_id`),
  KEY `FK_hst_vp_po_additional_field_attachment_hst_vp_expense_mst` (`hst_recode_id`),
  CONSTRAINT `FK_hst_vp_po_additional_field_attachment_hst_vp_expense_mst` FOREIGN KEY (`hst_recode_id`) REFERENCES `hst_vp_expense_mst` (`recode_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `hst_vp_po_attachment`;
CREATE TABLE IF NOT EXISTS `hst_vp_po_attachment` (
  `recode_id` int(11) NOT NULL AUTO_INCREMENT,
  `id` int(11) NOT NULL,
  `po_mst_id` int(11) NOT NULL,
  `attachment_url` varchar(200) NOT NULL,
  `file_name` varchar(200) DEFAULT NULL,
  `file_type` varchar(500) DEFAULT NULL,
  `status` char(1) NOT NULL DEFAULT 'A',
  `delete_by` varchar(100) DEFAULT '',
  `delete_on` datetime DEFAULT NULL,
  `hst_recode_id` int(11) NOT NULL,
  PRIMARY KEY (`recode_id`),
  KEY `FK_hst_vp_po_attachment_hst_vp_po_mst` (`hst_recode_id`),
  CONSTRAINT `FK_hst_vp_po_attachment_hst_vp_po_mst` FOREIGN KEY (`hst_recode_id`) REFERENCES `hst_vp_po_mst` (`recode_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `hst_vp_po_detail`;
CREATE TABLE IF NOT EXISTS `hst_vp_po_detail` (
  `recode_id` int(11) NOT NULL AUTO_INCREMENT,
  `id` int(11) NOT NULL,
  `purchase_order_mst_id` int(11) NOT NULL,
  `sort_order` int(3) DEFAULT NULL,
  `item_number` varchar(50) DEFAULT '',
  `vendor_item_number` varchar(50) DEFAULT NULL,
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
  `hst_recode_id` int(11) NOT NULL,
  PRIMARY KEY (`recode_id`),
  KEY `FK_hst_vp_po_detail_hst_vp_po_mst` (`hst_recode_id`),
  CONSTRAINT `FK_hst_vp_po_detail_hst_vp_po_mst` FOREIGN KEY (`hst_recode_id`) REFERENCES `hst_vp_po_mst` (`recode_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



ALTER TABLE `vp_po_audit_trail`
	ADD COLUMN `header` VARCHAR(500) NULL DEFAULT NULL COLLATE 'latin1_swedish_ci' AFTER `user_name`;
	
	
ALTER TABLE `vp_po_audit_trail`
	ADD COLUMN `undo_action` TINYINT(1) NULL DEFAULT NULL AFTER `puchase_order_id`;
	

INSERT INTO `umm_menu_privilage` (`id`, `menu_id`, `privilage_id`, `auth_code`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (465, 1021, 17, 'PURCHASE_ORDER_UNDO_ACTION', 'System', '2022-02-24 10:00:00', NULL, NULL, NULL, NULL);


INSERT INTO `umm_role_previlege` (`role_id`, `privilege_id`, `sub_account_id`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (1, 365, NULL, 'system', '2021-06-24 10:00:00', NULL, NULL, NULL, NULL);
