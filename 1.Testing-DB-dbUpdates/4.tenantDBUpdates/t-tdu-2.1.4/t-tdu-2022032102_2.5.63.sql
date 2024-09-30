----------Amal-------2.5.63------------

DROP TABLE IF EXISTS `hst_vp_expense_workflow_detail_config`;
CREATE TABLE IF NOT EXISTS `hst_vp_expense_workflow_detail_config` (
  `recode_id` int(11) NOT NULL AUTO_INCREMENT,
  `id` int(11) NOT NULL,
  `workflow_id` int(11) NOT NULL,
  `approval_group` int(11) DEFAULT NULL,
  `approval_user` varchar(100) DEFAULT NULL,
  `approval_order` int(3) NOT NULL,
  `status_id` int(10) DEFAULT NULL,
  `action_user` varchar(100) DEFAULT NULL,
  `hst_recode_id` int(15) NOT NULL,
  PRIMARY KEY (`recode_id`),
  KEY `AUTOMATION_ID_FK2` (`workflow_id`) USING BTREE,
  KEY `AUDIT_TRIAL_STATUS_FK_1` (`status_id`) USING BTREE,
  KEY `FK_hst_vp_expense_workflow_detail_config_hst_vp_expense_mst` (`hst_recode_id`),
  CONSTRAINT `FK_hst_vp_expense_workflow_detail_config_hst_vp_expense_mst` FOREIGN KEY (`hst_recode_id`) REFERENCES `hst_vp_expense_mst` (`recode_id`),
  CONSTRAINT `hst_vp_expense_workflow_detail_config_ibfk_1` FOREIGN KEY (`workflow_id`) REFERENCES `common_document_ad_hoc_workflow_config` (`id`),
  CONSTRAINT `hst_vp_expense_workflow_detail_config_ibfk_2` FOREIGN KEY (`status_id`) REFERENCES `common_audit_trial_status` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `hst_vp_bill_workflow_detail_config`;
CREATE TABLE IF NOT EXISTS `hst_vp_bill_workflow_detail_config` (
  `recode_id` int(11) NOT NULL AUTO_INCREMENT,
  `id` int(11) NOT NULL,
  `workflow_id` int(11) NOT NULL,
  `approval_group` int(11) DEFAULT NULL,
  `approval_user` varchar(100) DEFAULT NULL,
  `approval_order` int(3) NOT NULL,
  `status_id` int(10) DEFAULT NULL,
  `action_user` varchar(100) DEFAULT NULL,
  `hst_recode_id` int(15) NOT NULL,
  PRIMARY KEY (`recode_id`) USING BTREE,
  KEY `AUTOMATION_ID_FK2` (`workflow_id`) USING BTREE,
  KEY `AUDIT_TRIAL_STATUS_FK_1` (`status_id`) USING BTREE,
  KEY `FK_hst_vp_expense_workflow_detail_config_hst_vp_expense_mst` (`hst_recode_id`) USING BTREE,
  CONSTRAINT `FK_hst_vp_bill_workflow_detail_config_hst_vp_bill` FOREIGN KEY (`hst_recode_id`) REFERENCES `hst_vp_bill` (`recode_id`),
  CONSTRAINT `hst_vp_bill_workflow_detail_config_ibfk_2` FOREIGN KEY (`workflow_id`) REFERENCES `common_document_ad_hoc_workflow_config` (`id`),
  CONSTRAINT `hst_vp_bill_workflow_detail_config_ibfk_3` FOREIGN KEY (`status_id`) REFERENCES `common_audit_trial_status` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS `hst_vp_po_workflow_detail_config`;
CREATE TABLE IF NOT EXISTS `hst_vp_po_workflow_detail_config` (
  `recode_id` int(11) NOT NULL AUTO_INCREMENT,
  `id` int(11) NOT NULL,
  `workflow_id` int(11) NOT NULL,
  `approval_group` int(11) DEFAULT NULL,
  `approval_user` varchar(100) DEFAULT NULL,
  `approval_order` int(3) NOT NULL,
  `status_id` int(10) DEFAULT NULL,
  `action_user` int(10) DEFAULT NULL,
  `hst_recode_id` int(15) NOT NULL,
  PRIMARY KEY (`recode_id`) USING BTREE,
  KEY `AUTOMATION_ID_FK2` (`workflow_id`) USING BTREE,
  KEY `AUDIT_TRIAL_STATUS_FK_1` (`status_id`) USING BTREE,
  KEY `FK_hst_vp_expense_workflow_detail_config_hst_vp_expense_mst` (`hst_recode_id`) USING BTREE,
  CONSTRAINT `FK_hst_vp_po_workflow_detail_config_hst_vp_po_mst` FOREIGN KEY (`hst_recode_id`) REFERENCES `hst_vp_po_mst` (`recode_id`),
  CONSTRAINT `hst_vp_po_workflow_detail_config_ibfk_2` FOREIGN KEY (`workflow_id`) REFERENCES `common_document_ad_hoc_workflow_config` (`id`),
  CONSTRAINT `hst_vp_po_workflow_detail_config_ibfk_3` FOREIGN KEY (`status_id`) REFERENCES `common_audit_trial_status` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



ALTER TABLE `common_automation_workflow_config`
  ADD COLUMN `action_user` VARCHAR(100) NULL DEFAULT NULL AFTER `status_id`;

ALTER TABLE `common_document_ad_hoc_workflow_detail_config`
  ADD COLUMN `action_user` VARCHAR(100) NULL DEFAULT NULL AFTER `status_id`;
