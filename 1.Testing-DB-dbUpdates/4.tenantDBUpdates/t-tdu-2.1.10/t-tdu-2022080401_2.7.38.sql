-----------------Hashila------2.7.38-----------------

INSERT INTO `common_automation_field`(`document_type`, `short_code`, `field_name`, `condition_enable`, `action_enable`, `show_hide_enable`, `show_hide_enable_default`, `data_type`, `drop_down_id`, `drop_down_url`, `second_value`, `max_length`, `notification_enable`) VALUES (11, 'vendorId', 'Vendor', 0, 0, 0, 0, 'int', NULL, '/vendor_portal/sec_local_vendor_dropdown_list_v2', 0, 0, 1);
INSERT INTO `common_automation_field`(`document_type`, `short_code`, `field_name`, `condition_enable`, `action_enable`, `show_hide_enable`, `show_hide_enable_default`, `data_type`, `drop_down_id`, `drop_down_url`, `second_value`, `max_length`, `notification_enable`) VALUES (11, 'amount', 'Amount', 0, 0, 0, 0, 'decimal', NULL, NULL, 1, 19, 1);
INSERT INTO `common_automation_field`(`document_type`, `short_code`, `field_name`, `condition_enable`, `action_enable`, `show_hide_enable`, `show_hide_enable_default`, `data_type`, `drop_down_id`, `drop_down_url`, `second_value`, `max_length`, `notification_enable`) VALUES (9, 'amount', 'Amount', 0, 0, 0, 0, 'decimal', NULL, NULL, 1, 19, 1);

UPDATE `common_automation_field` SET `notification_enable` = 1 WHERE `document_type` = 10 AND `short_code` = 'vendorId';
UPDATE `common_automation_field` SET `notification_enable` = 1 WHERE `document_type` = 4 AND `short_code` = 'vendorId';
UPDATE `common_automation_field` SET `notification_enable` = 1 WHERE `document_type` = 10 AND `short_code` = 'batchTotal';