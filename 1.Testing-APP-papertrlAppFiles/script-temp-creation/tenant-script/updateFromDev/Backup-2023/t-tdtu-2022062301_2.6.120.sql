UPDATE `common_automation_field` SET `action_enable` = 0 WHERE `id` = 60;

INSERT INTO `common_automation_field`(`id`, `document_type`, `short_code`, `field_name`, `condition_enable`, `action_enable`, `show_hide_enable`, `show_hide_enable_default`, `data_type`, `drop_down_id`, `drop_down_url`, `second_value`, `max_length`) VALUES (107, 4, 'vendorId', 'Vendor', 0, 1, 0, 0, 'int', NULL, '/vendor_portal/sec_local_vendor_dropdown_list_v2', 0, 0);
