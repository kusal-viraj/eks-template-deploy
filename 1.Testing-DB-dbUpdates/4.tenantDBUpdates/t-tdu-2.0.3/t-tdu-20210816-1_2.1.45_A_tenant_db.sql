------------indra--madusha-------------

INSERT INTO `common_drop_down` (`drop_down_name`) VALUES ('Department');

INSERT INTO `common_automation_field` (`id`, `document_type`, `short_code`, `field_name`, `condition_enable`, `action_enable`, `show_hide_enable`, `data_type`, `drop_down_id`, `drop_down_url`, `second_value`, `max_length`) VALUES (93, 1, 'departmentId', 'Department', 1, 1, 0, 'int', 23, '/common_service/sec_get_department', 0, 0);
INSERT INTO `common_automation_field` (`id`, `document_type`, `short_code`, `field_name`, `condition_enable`, `action_enable`, `show_hide_enable`, `data_type`, `drop_down_id`, `drop_down_url`, `second_value`, `max_length`) VALUES (94, 2, 'departmentId', 'Department', 1, 1, 0, 'int', 23, '/common_service/sec_get_department', 0, 0);
INSERT INTO `common_automation_field` (`id`, `document_type`, `short_code`, `field_name`, `condition_enable`, `action_enable`, `show_hide_enable`, `data_type`, `drop_down_id`, `drop_down_url`, `second_value`, `max_length`) VALUES (95, 4, 'departmentId', 'Department', 1, 1, 0, 'int', 23, '/common_service/sec_get_department', 0, 0);

INSERT INTO `common_automation_field_condition` (`id`, `field_id`, `condition_id`) VALUES (396, 93, 1);
INSERT INTO `common_automation_field_condition` (`id`, `field_id`, `condition_id`) VALUES (397, 93, 2);
INSERT INTO `common_automation_field_condition` (`id`, `field_id`, `condition_id`) VALUES (398, 94, 1);
INSERT INTO `common_automation_field_condition` (`id`, `field_id`, `condition_id`) VALUES (399, 94, 2);
INSERT INTO `common_automation_field_condition` (`id`, `field_id`, `condition_id`) VALUES (400, 95, 1);
INSERT INTO `common_automation_field_condition` (`id`, `field_id`, `condition_id`) VALUES (401, 95, 2);
