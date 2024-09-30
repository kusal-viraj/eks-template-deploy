ALTER TABLE `support_audit_trail` CHANGE COLUMN `status` `status_id` INT(10) NOT NULL DEFAULT 0 COLLATE 'utf8_general_ci' AFTER `action_date`;

ALTER TABLE `support_audit_trail` ADD COLUMN `user_id` VARCHAR(500) NULL DEFAULT NULL AFTER `description`;

ALTER TABLE `support_attachment` ADD COLUMN `is_comment_attachment` TINYINT NULL DEFAULT NULL AFTER `delete_on`;