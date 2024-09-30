

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Dumping structure for table v2_prep_tenant_db.hst_vp_bill
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

-- Data exporting was unselected.

-- Dumping structure for table v2_prep_tenant_db.hst_vp_bill_additional_data
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

-- Data exporting was unselected.

-- Dumping structure for table v2_prep_tenant_db.hst_vp_bill_additional_field_attachment
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

-- Data exporting was unselected.

-- Dumping structure for table v2_prep_tenant_db.hst_vp_bill_expense_cost_distribution
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

-- Data exporting was unselected.

-- Dumping structure for table v2_prep_tenant_db.hst_vp_bill_item_cost_distribution
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

-- Data exporting was unselected.

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;



ALTER TABLE `vp_bill_audit_trail`
	ADD COLUMN `undo_status` CHAR(1) NULL AFTER `bill_id`,
	ADD COLUMN `undo_action` TINYINT(1) NULL AFTER `undo_status`;
	
	
	UPDATE vp_bill_audit_trail bat INNER JOIN common_audit_trial_status st ON bat.status_id=st.id
SET bat.undo_action=1, bat.undo_status='P' WHERE st.id=9;

UPDATE `common_audit_trial_status` SET `name`='Reverts back to' WHERE  `id`=9;

INSERT INTO `umm_menu_privilage` (`id`, `menu_id`, `privilage_id`, `auth_code`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (391, 1022, 45, 'PO_RECEIPT_RE_OPEN_PO_RECEIPT', 'System', '2021-07-07 19:59:00', NULL, NULL, NULL, NULL);

INSERT INTO `umm_role_previlege` (`role_id`, `privilege_id`, `created_by`, `created_on`) VALUES ('1', '391', 'admin', '2021-07-06 20:00:00');
