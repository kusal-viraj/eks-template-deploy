----------hashila-2.8.151-----




INSERT INTO `common_automation_field`(`id`, `document_type`, `short_code`, `field_name`, `condition_enable`, `action_enable`, `show_hide_enable`, `show_hide_enable_default`, `data_type`, `drop_down_id`, `drop_down_url`, `second_value`, `max_length`, `notification_enable`, `field_weight`) VALUES (130, 1, 'projectAccountCode', 'Project / Task', 1, 0, 0, 0, 'int', NULL, '/common_service/sec_get_detailed_approval_codes_by_category?categoryId=2', 0, 0, 0, NULL);
INSERT INTO `common_automation_field`(`id`, `document_type`, `short_code`, `field_name`, `condition_enable`, `action_enable`, `show_hide_enable`, `show_hide_enable_default`, `data_type`, `drop_down_id`, `drop_down_url`, `second_value`, `max_length`, `notification_enable`, `field_weight`) VALUES (131, 4, 'projectAccountCode', 'Project / Task', 1, 0, 0, 0, 'int', NULL, '/common_service/sec_get_detailed_approval_codes_by_category?categoryId=2', 0, 0, 0, NULL);


INSERT INTO `common_automation_field_condition`(`field_id`, `condition_id`) VALUES (130, 1);
INSERT INTO `common_automation_field_condition`(`field_id`, `condition_id`) VALUES (130, 2);

INSERT INTO `common_automation_field_condition`(`field_id`, `condition_id`) VALUES (131, 1);
INSERT INTO `common_automation_field_condition`(`field_id`, `condition_id`) VALUES (131, 2);
