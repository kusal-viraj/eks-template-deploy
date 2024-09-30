-------Hashila----2.7.36-----------

ALTER TABLE `common_automation_document_type` 
ADD COLUMN `notification_enable` tinyint(1) NULL AFTER `automation_rule_enable`;

UPDATE `common_automation_document_type` SET `notification_enable` = 0;

ALTER TABLE `common_automation_document_type` 
MODIFY COLUMN `notification_enable` tinyint(1) NOT NULL AFTER `automation_rule_enable`;

UPDATE `common_automation_document_type` SET `notification_enable` = 1 WHERE `id` = 1;
UPDATE `common_automation_document_type` SET `notification_enable` = 1 WHERE `id` = 2;
UPDATE `common_automation_document_type` SET `notification_enable` = 1 WHERE `id` = 4;
UPDATE `common_automation_document_type` SET `notification_enable` = 1 WHERE `id` = 5;
UPDATE `common_automation_document_type` SET `notification_enable` = 1 WHERE `id` = 6;
UPDATE `common_automation_document_type` SET `notification_enable` = 1 WHERE `id` = 9;

CREATE TABLE `common_reminder_event`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `event_name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE `common_reminder_document_event_config`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `document_type_id` int NOT NULL,
  `event_id` int NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `DOCUMENT_TYPE_EVENT_REMINDER_FK` FOREIGN KEY (`document_type_id`) REFERENCES `common_automation_document_type` (`id`),
  CONSTRAINT `EVENT_CONFIG_REMINDER_FK` FOREIGN KEY (`event_id`) REFERENCES `common_reminder_event` (`id`)
);


CREATE TABLE `common_reminder_mst`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `document_type_id` int NOT NULL,
  `event_id` int NOT NULL,
  `start_date` datetime NOT NULL,
  `frequency` int NOT NULL,
  `no_of_occurrence` int NULL,
  `status` char(1) NOT NULL,
  `escalate_from_date` datetime NULL,
  `created_by` varchar(100) NOT NULL,
  `created_on` datetime NOT NULL,
  `created_by_name` varchar(100) NOT NULL,
  `update_by` varchar(100) NULL,
  `update_on` datetime NULL,
  `delete_by` varchar(100) NULL,
  `delete_on` datetime NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `REMINDER_MST_DOCUMENT_TYPE_FK` FOREIGN KEY (`document_type_id`) REFERENCES `common_automation_document_type` (`id`),
  CONSTRAINT `REMINDER_MST_EVENT_FK` FOREIGN KEY (`event_id`) REFERENCES `common_reminder_event` (`id`)
);

ALTER TABLE `common_reminder_mst` 
ADD COLUMN `escalation_present` char(1) NOT NULL AFTER `status`;

CREATE TABLE `common_reminder_exclude_user`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` varchar(100) NOT NULL,
  `reminder_id` int NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `EXCLUDE_USER_REMINDER_MST_FK` FOREIGN KEY (`reminder_id`) REFERENCES `common_reminder_mst` (`id`)
);

CREATE TABLE `common_reminder_escalate_user`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` varchar(100) NOT NULL,
  `reminder_id` int NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `ESCALATE_USER_REMINDER_MST_FK` FOREIGN KEY (`reminder_id`) REFERENCES `common_reminder_mst` (`id`)
);

CREATE TABLE `common_reminder_field_condition_config`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `condition_id` int NOT NULL,
  `reminder_id` int NOT NULL,
  `field_id` int NOT NULL,
  `adjoint_condition` varchar(50) NOT NULL,
  `condition_order` int NOT NULL,
  `value` varchar(500) NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `CONDITION_CONFIG_REMINDER_MST_FK` FOREIGN KEY (`reminder_id`) REFERENCES `common_reminder_mst` (`id`)
);

ALTER TABLE `common_automation_field` 
ADD COLUMN `notification_enable` tinyint(1) NOT NULL DEFAULT 0 AFTER `max_length`;


INSERT INTO `common_grid_template`(`id`, `grid_name`) VALUES (60, 'REMINDER_CONFIGURATION');

INSERT INTO `common_grid_column_template`(`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (60, 'checkbox', NULL, 1, 0, 0, 0, 0, 'center', 'checkbox', '', 1, NULL, '');
INSERT INTO `common_grid_column_template`(`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (60, 'action', 'Action', 1, 0, 0, 0, 0, 'center', 'actionButton', '', 2, NULL, '');
INSERT INTO `common_grid_column_template`(`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (60, 'reminder.name', 'Reminder Name', 1, 1, 1, 1, 1, 'left', 'input', 'Reminder Name', 3, NULL, '');
INSERT INTO `common_grid_column_template`(`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (60, 'reminder.documentTypeId', 'Document Type', 1, 1, 1, 1, 1, 'left', 'dropdown', 'Document Type', 4, NULL, '');
INSERT INTO `common_grid_column_template`(`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (60, 'reminder.eventId', 'Event', 1, 1, 1, 1, 1, 'left', 'dropdown', 'Event', 5, NULL, '');
INSERT INTO `common_grid_column_template`(`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (60, 'reminder.createdByName', 'Created By', 1, 1, 1, 1, 1, 'left', 'input', 'Created By', 6, NULL, '');
INSERT INTO `common_grid_column_template`(`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (60, 'reminder.createdOn', 'Created Date', 1, 1, 1, 1, 1, 'center', 'date', 'Created Date', 7, NULL, '');
INSERT INTO `common_grid_column_template`(`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (60, 'reminder.status', 'Status', 1, 1, 1, 1, 1, 'center', 'dropdown', 'Status', 8, 1, '');

INSERT INTO `common_grid_state_template`(`id`, `grid_id`, `start_from`, `total_rows`, `column_widths`) VALUES (60, 60, 0, 15, '50,100,210,210,210,210,210,210');

ALTER TABLE `common_reminder_mst` 
DROP COLUMN `start_date`;

ALTER TABLE `common_reminder_mst` 
ADD COLUMN `no_of_days` int NOT NULL DEFAULT 0 AFTER `frequency`;

INSERT INTO `common_automation_document_type`(`id`, `document_type`, `short_code`, `status`, `show_hide_enable`, `automation_enable`, `automation_rule_enable`, `notification_enable`) VALUES (11, 'Inbox', 'INBOX', 'A', 0, 0, 0, 1);

INSERT INTO `common_reminder_event`(`id`, `event_name`) VALUES (1, 'Is Pending for');
INSERT INTO `common_reminder_event`(`id`, `event_name`) VALUES (2, 'Due date meets in');
INSERT INTO `common_reminder_event`(`id`, `event_name`) VALUES (3, 'Discount applicable period will end in');
INSERT INTO `common_reminder_event`(`id`, `event_name`) VALUES (4, 'Is approved but not paid for');
INSERT INTO `common_reminder_event`(`id`, `event_name`) VALUES (5, 'Is unsubmitted for');
INSERT INTO `common_reminder_event`(`id`, `event_name`) VALUES (6, 'Has unprocessed documents for');
INSERT INTO `common_reminder_event`(`id`, `event_name`) VALUES (7, 'Request is pending for');


INSERT INTO `common_reminder_document_event_config`(`id`, `document_type_id`, `event_id`) VALUES (1, 1, 1);
INSERT INTO `common_reminder_document_event_config`(`id`, `document_type_id`, `event_id`) VALUES (2, 2, 1);
INSERT INTO `common_reminder_document_event_config`(`id`, `document_type_id`, `event_id`) VALUES (3, 5, 1);
INSERT INTO `common_reminder_document_event_config`(`id`, `document_type_id`, `event_id`) VALUES (4, 4, 1);
INSERT INTO `common_reminder_document_event_config`(`id`, `document_type_id`, `event_id`) VALUES (5, 9, 1);
INSERT INTO `common_reminder_document_event_config`(`id`, `document_type_id`, `event_id`) VALUES (6, 1, 2);
INSERT INTO `common_reminder_document_event_config`(`id`, `document_type_id`, `event_id`) VALUES (7, 1, 3);
INSERT INTO `common_reminder_document_event_config`(`id`, `document_type_id`, `event_id`) VALUES (8, 1, 4);
INSERT INTO `common_reminder_document_event_config`(`id`, `document_type_id`, `event_id`) VALUES (9, 1, 5);
INSERT INTO `common_reminder_document_event_config`(`id`, `document_type_id`, `event_id`) VALUES (10, 9, 5);
INSERT INTO `common_reminder_document_event_config`(`id`, `document_type_id`, `event_id`) VALUES (11, 6, 6);
INSERT INTO `common_reminder_document_event_config`(`id`, `document_type_id`, `event_id`) VALUES (12, 11, 7);

UPDATE `common_automation_field` SET `notification_enable` = 1 WHERE `document_type` = 1 AND `short_code` = 'departmentId';
UPDATE `common_automation_field` SET `notification_enable` = 1 WHERE `document_type` = 1 AND `short_code` = 'vendorId';
UPDATE `common_automation_field` SET `notification_enable` = 1 WHERE `document_type` = 1 AND `short_code` = 'billAmount';
UPDATE `common_automation_field` SET `notification_enable` = 1 WHERE `document_type` = 2 AND `short_code` = 'vendorId';
UPDATE `common_automation_field` SET `notification_enable` = 1 WHERE `document_type` = 2 AND `short_code` = 'departmentId';
UPDATE `common_automation_field` SET `notification_enable` = 1 WHERE `document_type` = 2 AND `short_code` = 'projectCodeId';
UPDATE `common_automation_field` SET `notification_enable` = 1 WHERE `document_type` = 2 AND `short_code` = 'netAmount';
UPDATE `common_automation_field` SET `notification_enable` = 1 WHERE `document_type` = 5 AND `short_code` = 'amount';
UPDATE `common_automation_field` SET `notification_enable` = 1 WHERE `document_type` = 4 AND `short_code` = 'amount';

ALTER TABLE `common_reminder_field_condition_config` 
CHANGE COLUMN `value` `value_one` varchar(500) NULL DEFAULT NULL AFTER `condition_order`,
ADD COLUMN `value_two` varchar(500) NULL AFTER `value_one`;

ALTER TABLE `common_reminder_mst` 
CHANGE COLUMN `escalate_from_date` `escalate_from_occurrences` int NULL DEFAULT NULL AFTER `escalation_present`,
ADD COLUMN `escalate_frequency` int NOT NULL AFTER `escalate_from_occurrences`;

ALTER TABLE `common_reminder_mst` 
MODIFY COLUMN `escalate_frequency` int NULL AFTER `escalate_from_occurrences`;








