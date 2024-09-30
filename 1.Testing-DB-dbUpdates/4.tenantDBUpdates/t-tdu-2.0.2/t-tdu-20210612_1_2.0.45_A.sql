UPDATE `common_grid_column_template` SET `field`='automation.createdOn' WHERE  `id`=103;
UPDATE `common_grid_column_template` SET `is_re_orderable`='0', `is_re_sizable`='0' WHERE  `id`=98;
TRUNCATE `common_grid_column_user_wice`;


ALTER TABLE `common_automation_document_type_event`
	ADD COLUMN `sort_order` INT(3) NOT NULL AFTER `event_id`;
	
INSERT INTO `common_automation_document_action_config` (`document_type_id`, `event_id`, `action_id`) VALUES ('1', '14', '2');
INSERT INTO `common_automation_document_action_config` (`document_type_id`, `event_id`, `action_id`) VALUES ('1', '14', '3');
INSERT INTO `common_automation_document_action_config` (`document_type_id`, `event_id`, `action_id`) VALUES ('2', '14', '2');
INSERT INTO `common_automation_document_action_config` (`document_type_id`, `event_id`, `action_id`) VALUES ('2', '14', '3');
INSERT INTO `common_automation_document_action_config` (`document_type_id`, `event_id`, `action_id`) VALUES ('4', '14', '2');
INSERT INTO `common_automation_document_action_config` (`document_type_id`, `event_id`, `action_id`) VALUES ('4', '14', '3');