
DELETE FROM `common_grid_column_template` WHERE `grid_id` = 60 AND `field` = 'reminder.eventId';

UPDATE `common_grid_state_template` SET `column_widths` = '50,100,210,210,210,210,210' WHERE `id` = 60;

UPDATE `common_reminder_document_event_config` SET `event_id` = 6 WHERE `document_type_id` = 11;


UPDATE `common_automation_document_type` SET `status` = 'I' WHERE `id` = 9;
UPDATE `common_automation_document_type` SET `status` = 'I' WHERE `id` = 11;

UPDATE `common_reminder_document_event_config` SET `event_id` = 1 WHERE `id` = 11;

