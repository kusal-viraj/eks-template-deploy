ALTER TABLE `common_automation_document_type` 
ADD COLUMN `attach_to_enable` tinyint(1) NOT NULL DEFAULT 0 AFTER `notification_enable`;

UPDATE `common_automation_document_type` SET `attach_to_enable` = 1 WHERE `id` = 2;
UPDATE `common_automation_document_type` SET `attach_to_enable` = 1 WHERE `id` = 3;
UPDATE `common_automation_document_type` SET `attach_to_enable` = 1 WHERE `id` = 4;
UPDATE `common_automation_document_type` SET `attach_to_enable` = 1 WHERE `id` = 6;
