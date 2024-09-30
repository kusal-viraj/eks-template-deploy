---------Indra------2.5.123--------------

ALTER TABLE `common_automation_mst`
	ADD COLUMN `rule_automation` TINYINT NOT NULL DEFAULT 0 AFTER `automation_name`;
	
UPDATE common_automation_mst mst INNER JOIN common_automation_action_config cfg ON cfg.automation_id=mst.id
SET mst.rule_automation = IF(cfg.action_id=7, true, false) WHERE mst.rule_automation=false;

INSERT INTO `common_automation_action` (`short_code`, `action_name`) VALUES ('ASSIGN_FINAL_APPROVAL_USER', 'Assign Final Approval User');

INSERT INTO `common_automation_field` (`id`, `document_type`, `short_code`, `field_name`, `condition_enable`, `action_enable`, `show_hide_enable`, `show_hide_enable_default`, `data_type`, `drop_down_id`, `drop_down_url`, `second_value`, `max_length`) 
VALUES (103, 1, 'approvalUser', 'Approval User', 1, 1, 0, 0, 'int', NULL, '/user_management/sec_get_userlist_dropdown', 0, 0);

INSERT INTO `common_automation_field_condition` (`id`, `field_id`, `condition_id`) VALUES (410, 103, 1);
INSERT INTO `common_automation_field_condition` (`id`, `field_id`, `condition_id`) VALUES (411, 103, 2);

ALTER TABLE `vp_bill`
	ADD COLUMN `automation_rule_id` INT(11) NULL DEFAULT NULL AFTER `automation_id`,
	ADD CONSTRAINT `AUTOMATION_RULE_ID_FK_1` FOREIGN KEY (`automation_rule_id`) REFERENCES `common_automation_mst` (`id`) ON UPDATE RESTRICT ON DELETE RESTRICT;
	
ALTER TABLE `hst_vp_bill`
	ADD COLUMN `automation_rule_id` INT(11) NULL DEFAULT NULL AFTER `automation_id`,
	ADD CONSTRAINT `FK_hst_vp_bill_common_automation_mst` FOREIGN KEY (`automation_rule_id`) REFERENCES `common_automation_mst` (`id`) ON UPDATE RESTRICT ON DELETE RESTRICT;
	
ALTER TABLE `vp_payment_batch`
	ADD COLUMN `automation_rule_id` INT(11) NULL DEFAULT NULL AFTER `automation_id`;
	
ALTER TABLE `vp_po_mst`
	ADD COLUMN `automation_rule_id` INT(11) NULL DEFAULT NULL AFTER `automation_id`,
	ADD CONSTRAINT `PO_RULE_AUTOMATION_FK_1` FOREIGN KEY (`automation_rule_id`) REFERENCES `common_automation_mst` (`id`) ON UPDATE RESTRICT ON DELETE RESTRICT;
	
ALTER TABLE `hst_vp_po_mst`
	ADD COLUMN `automation_rule_id` INT(11) NULL DEFAULT NULL AFTER `automation_id`;
	
ALTER TABLE `vp_expense_mst`
	ADD COLUMN `automation_rule_id` INT(11) NULL DEFAULT NULL AFTER `automation_id`,
	ADD CONSTRAINT `EXPENSE_RULE_AUTOMATION_FK_1` FOREIGN KEY (`automation_rule_id`) REFERENCES `common_automation_mst` (`id`) ON UPDATE RESTRICT ON DELETE RESTRICT;	
	
	
ALTER TABLE `hst_vp_expense_mst`
	ADD COLUMN `automation_rule_id` INT(11) NULL DEFAULT NULL AFTER `automation_id`;
	
ALTER TABLE `common_automation_document_type`
	ADD COLUMN `automation_rule_enable` TINYINT(1) NOT NULL DEFAULT '0' AFTER `automation_enable`;
	
UPDATE `common_automation_document_type` SET `automation_rule_enable`='1' WHERE  `id`=1;

ALTER TABLE `common_automation_document_type_event`
	ADD COLUMN `automation_event` TINYINT(1) NOT NULL DEFAULT 0 AFTER `event_id`,
	ADD COLUMN `automation_rule_event` TINYINT(1) NOT NULL DEFAULT 0 AFTER `automation_event`;
	
UPDATE common_automation_document_type_event evt SET evt.automation_event=TRUE WHERE evt.automation_event<>TRUE;

UPDATE common_automation_document_type_event evt SET evt.automation_rule_event=TRUE WHERE evt.event_id=1;

INSERT INTO `common_automation_document_type_event` (`id`, `document_type_id`, `event_id`, `automation_event`, `automation_rule_event`, `sort_order`) VALUES (38, 1, 15, 1, 1, 0);
INSERT INTO `common_automation_document_type_event` (`id`, `document_type_id`, `event_id`, `automation_event`, `automation_rule_event`, `sort_order`) VALUES (39, 1, 16, 1, 1, 0);

ALTER TABLE `common_automation_document_action_config`
	ADD COLUMN `automation_action` TINYINT(1) NOT NULL DEFAULT 0 AFTER `action_id`,
	ADD COLUMN `automation_rule_action` TINYINT(1) NOT NULL DEFAULT 0 AFTER `automation_action`;
	
UPDATE common_automation_document_action_config cfg SET cfg.automation_action=TRUE WHERE cfg.automation_action<>TRUE;

UPDATE `common_automation_document_action_config` SET `automation_action`='0' WHERE  `id`=99;

UPDATE `common_automation_document_action_config` SET `automation_action`='0' WHERE  `id`=100;

UPDATE `common_automation_document_action_config` SET `automation_rule_action`='1' WHERE  `id`=99;

UPDATE `common_automation_document_action_config` SET `automation_rule_action`='1' WHERE  `id`=100;

INSERT INTO `common_automation_document_action_config` (`id`, `document_type_id`, `event_id`, `action_id`, `automation_action`, `automation_rule_action`) VALUES (101, 1, 1, 8, 0, 1);