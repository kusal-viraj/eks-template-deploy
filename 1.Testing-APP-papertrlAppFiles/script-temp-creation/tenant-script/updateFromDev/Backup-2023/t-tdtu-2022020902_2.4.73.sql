
ALTER TABLE `common_automation_condition_config` 
MODIFY COLUMN `first_value` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL AFTER `condition_order`,
MODIFY COLUMN `second_value` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL AFTER `first_value`;

INSERT INTO `common_automation_event`(`event_name`, `sort_order`) VALUES ('Enter Expense Line Description', 0);
INSERT INTO `common_automation_event`(`event_name`, `sort_order`) VALUES ('Enter Item Line Description', 0);

INSERT INTO `common_automation_action`(`short_code`, `action_name`) VALUES ('ASSIGN_TO', 'Assign To');

INSERT INTO `common_automation_field`(`id`, `document_type`, `short_code`, `field_name`, `condition_enable`, `action_enable`, `show_hide_enable`, `show_hide_enable_default`, `data_type`, `drop_down_id`, `drop_down_url`, `second_value`, `max_length`) VALUES (102, 1, 'description', 'Description', 1, 1, 0, 0, 'text', NULL, NULL, 0, 500);


INSERT INTO `common_automation_document_action_config`(`document_type_id`, `event_id`, `action_id`) VALUES (1, 15, 7);

INSERT INTO `common_automation_document_action_config`(`document_type_id`, `event_id`, `action_id`) VALUES (1, 16, 7);

INSERT INTO `common_automation_field_condition`(`field_id`, `condition_id`) VALUES (102, 1);
INSERT INTO `common_automation_field_condition`(`field_id`, `condition_id`) VALUES (102, 7);

ALTER TABLE `common_automation_field_config` 
ADD COLUMN `section_id` int NULL AFTER `field_value`;