-------thiwanka 2.13.18-----------

CREATE TABLE `ad_hoc_workflow_detail_for_audit_trail` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`audit_trail_id` INT(11) NOT NULL,
	`approval_username` VARCHAR(200) NULL DEFAULT NULL COLLATE 'latin1_swedish_ci',
	`approval_group_id` INT(11) NULL DEFAULT NULL,
	`approval_order` INT(11) NOT NULL,
	`is_approved` TINYINT(1) NOT NULL DEFAULT '0',
	PRIMARY KEY (`id`) USING BTREE,
	INDEX `AUDIT_TRAIL_ID` (`audit_trail_id`) USING BTREE,
	CONSTRAINT `FK_ad_hoc_workflow_detail_for_audit_trail_vp_bill_audit_trail` FOREIGN KEY (`audit_trail_id`) REFERENCES `vp_bill_audit_trail` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION
);

UPDATE `common_automation_document_type` SET `automation_enable`=0 WHERE `short_code` IN ('BATCH_PAYMENT', 'BILL_PAYMENT');