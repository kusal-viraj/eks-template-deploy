INSERT INTO `common_automation_field` (`id`, `document_type`, `short_code`, `field_name`, `condition_enable`, `action_enable`, `show_hide_enable`, `show_hide_enable_default`, `data_type`, `drop_down_id`, `drop_down_url`, `second_value`, `max_length`, `notification_enable`, `field_weight`) VALUES (127, 1, 'vendorGroups', 'Vendor Group', 1, 0, 0, 0, 'int', NULL, '/vendor_portal/sec_vendor_group_dropdown', 0, 0, 0, NULL);

INSERT INTO `common_automation_field_condition` (`id`, `field_id`, `condition_id`) VALUES (456, 127, 1);
INSERT INTO `common_automation_field_condition` (`id`, `field_id`, `condition_id`) VALUES (457, 127, 2);
