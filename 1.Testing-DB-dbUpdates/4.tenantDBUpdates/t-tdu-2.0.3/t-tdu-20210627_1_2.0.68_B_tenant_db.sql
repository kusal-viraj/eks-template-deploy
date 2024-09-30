ALTER TABLE `common_automation_document_type` 
ADD COLUMN `automation_enable` TINYINT(1) NOT NULL DEFAULT 0 AFTER `show_hide_enable`;

UPDATE `common_automation_document_type` SET `automation_enable` = '1' WHERE (`id` = '1');
UPDATE `common_automation_document_type` SET `automation_enable` = '1' WHERE (`id` = '2');
UPDATE `common_automation_document_type` SET `automation_enable` = '1' WHERE (`id` = '3');
UPDATE `common_automation_document_type` SET `automation_enable` = '1' WHERE (`id` = '4');
UPDATE `common_automation_document_type` SET `automation_enable` = '1' WHERE (`id` = '5');
UPDATE `common_automation_document_type` SET `automation_enable` = '0' WHERE (`id` = '6');

UPDATE `common_automation_document_type` SET `status` = 'A' WHERE (`id` = '6');
