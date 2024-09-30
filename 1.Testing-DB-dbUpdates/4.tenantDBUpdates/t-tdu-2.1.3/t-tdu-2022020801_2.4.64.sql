--------Hashila------2.4.64-------

ALTER TABLE `common_automation_notification_config` 
MODIFY COLUMN `notification_user` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL AFTER `action_id`;

UPDATE `common_automation_event` SET `event_name` = 'Edit' WHERE `id` = 2;
