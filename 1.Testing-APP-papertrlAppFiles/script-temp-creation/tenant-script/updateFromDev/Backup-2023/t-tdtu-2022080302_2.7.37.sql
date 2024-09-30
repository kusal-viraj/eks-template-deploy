UPDATE `common_automation_document_type` SET `notification_enable` = 0 WHERE `id` = 5;
UPDATE `common_automation_document_type` SET `status` = 'A' WHERE `id` = 9;
UPDATE `common_automation_document_type` SET `notification_enable` = 1 WHERE `id` = 10;

UPDATE `common_reminder_document_event_config` SET `document_type_id` = 10 WHERE `id` = 3;
