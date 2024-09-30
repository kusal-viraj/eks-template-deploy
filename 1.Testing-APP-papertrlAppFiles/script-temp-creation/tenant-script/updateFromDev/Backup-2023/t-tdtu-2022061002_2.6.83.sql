UPDATE `common_automation_document_type` SET `document_type` = 'Offline Payment' WHERE `id` = 5;

INSERT INTO `common_automation_document_type`(`id`, `document_type`, `short_code`, `status`, `show_hide_enable`, `automation_enable`, `automation_rule_enable`) VALUES (10, 'Online Payment', 'BATCH_PAYMENT', 'A', 0, 1, 0);

INSERT INTO `common_automation_field`(`id`, `document_type`, `short_code`, `field_name`, `condition_enable`, `action_enable`, `show_hide_enable`, `show_hide_enable_default`, `data_type`, `second_value`, `max_length`) VALUES (105, 10, 'batchTotal', 'Batch Total', 1, 1, 0, 0, 'decimal', 1, 19);

INSERT INTO `common_automation_field`(`id`, `document_type`, `short_code`, `field_name`, `condition_enable`, `action_enable`, `show_hide_enable`, `show_hide_enable_default`, `data_type`, `drop_down_id`, `drop_down_url`, `second_value`, `max_length`) VALUES (106, 10, 'vendorId', 'Vendor', 1, 1, 0, 0, 'int', NULL, '/vendor_portal/sec_local_vendor_dropdown_list_v2', 0, 0);

INSERT INTO `common_automation_event`(`id`, `event_name`, `sort_order`) VALUES (17, 'Pay Now', 0);
INSERT INTO `common_automation_event`(`id`, `event_name`, `sort_order`) VALUES (18, 'Payment Success', 0);
INSERT INTO `common_automation_event`(`id`, `event_name`, `sort_order`) VALUES (19, 'Payment Fail', 0);
INSERT INTO `common_automation_event`(`id`, `event_name`, `sort_order`) VALUES (20, 'Cancel', 0);

INSERT INTO `common_automation_document_type_event`(`id`, `document_type_id`, `event_id`, `automation_event`, `automation_rule_event`, `sort_order`) VALUES (40, 10, 1, 1, 0, 0);
INSERT INTO `common_automation_document_type_event`(`id`, `document_type_id`, `event_id`, `automation_event`, `automation_rule_event`, `sort_order`) VALUES (41, 10, 3, 1, 0, 0);
INSERT INTO `common_automation_document_type_event`(`id`, `document_type_id`, `event_id`, `automation_event`, `automation_rule_event`, `sort_order`) VALUES (42, 10, 4, 1, 0, 0);
INSERT INTO `common_automation_document_type_event`(`id`, `document_type_id`, `event_id`, `automation_event`, `automation_rule_event`, `sort_order`) VALUES (43, 10, 17, 1, 0, 0);
INSERT INTO `common_automation_document_type_event`(`id`, `document_type_id`, `event_id`, `automation_event`, `automation_rule_event`, `sort_order`) VALUES (44, 10, 18, 1, 0, 0);
INSERT INTO `common_automation_document_type_event`(`id`, `document_type_id`, `event_id`, `automation_event`, `automation_rule_event`, `sort_order`) VALUES (45, 10, 19, 1, 0, 0);
INSERT INTO `common_automation_document_type_event`(`id`, `document_type_id`, `event_id`, `automation_event`, `automation_rule_event`, `sort_order`) VALUES (46, 10, 20, 1, 0, 0);

INSERT INTO `common_automation_field_condition`(`id`, `field_id`, `condition_id`) VALUES (414, 105, 1);
INSERT INTO `common_automation_field_condition`(`id`, `field_id`, `condition_id`) VALUES (415, 105, 2);
INSERT INTO `common_automation_field_condition`(`id`, `field_id`, `condition_id`) VALUES (416, 105, 3);
INSERT INTO `common_automation_field_condition`(`id`, `field_id`, `condition_id`) VALUES (417, 105, 4);
INSERT INTO `common_automation_field_condition`(`id`, `field_id`, `condition_id`) VALUES (418, 105, 5);
INSERT INTO `common_automation_field_condition`(`id`, `field_id`, `condition_id`) VALUES (419, 105, 6);
INSERT INTO `common_automation_field_condition`(`id`, `field_id`, `condition_id`) VALUES (420, 105, 8);
INSERT INTO `common_automation_field_condition`(`id`, `field_id`, `condition_id`) VALUES (421, 106, 1);
INSERT INTO `common_automation_field_condition`(`id`, `field_id`, `condition_id`) VALUES (422, 106, 2);

INSERT INTO `common_automation_document_action_config`(`id`, `document_type_id`, `event_id`, `action_id`, `automation_action`, `automation_rule_action`) VALUES (102, 10, 1, 1, 1, 0);
INSERT INTO `common_automation_document_action_config`(`id`, `document_type_id`, `event_id`, `action_id`, `automation_action`, `automation_rule_action`) VALUES (103, 10, 1, 2, 1, 0);
INSERT INTO `common_automation_document_action_config`(`id`, `document_type_id`, `event_id`, `action_id`, `automation_action`, `automation_rule_action`) VALUES (104, 10, 1, 3, 1, 0);
INSERT INTO `common_automation_document_action_config`(`id`, `document_type_id`, `event_id`, `action_id`, `automation_action`, `automation_rule_action`) VALUES (105, 10, 3, 2, 1, 0);
INSERT INTO `common_automation_document_action_config`(`id`, `document_type_id`, `event_id`, `action_id`, `automation_action`, `automation_rule_action`) VALUES (106, 10, 3, 3, 1, 0);
INSERT INTO `common_automation_document_action_config`(`id`, `document_type_id`, `event_id`, `action_id`, `automation_action`, `automation_rule_action`) VALUES (107, 10, 4, 2, 1, 0);
INSERT INTO `common_automation_document_action_config`(`id`, `document_type_id`, `event_id`, `action_id`, `automation_action`, `automation_rule_action`) VALUES (108, 10, 4, 3, 1, 0);
INSERT INTO `common_automation_document_action_config`(`id`, `document_type_id`, `event_id`, `action_id`, `automation_action`, `automation_rule_action`) VALUES (109, 10, 17, 2, 1, 0);
INSERT INTO `common_automation_document_action_config`(`id`, `document_type_id`, `event_id`, `action_id`, `automation_action`, `automation_rule_action`) VALUES (110, 10, 17, 3, 1, 0);
INSERT INTO `common_automation_document_action_config`(`id`, `document_type_id`, `event_id`, `action_id`, `automation_action`, `automation_rule_action`) VALUES (111, 10, 18, 2, 1, 0);
INSERT INTO `common_automation_document_action_config`(`id`, `document_type_id`, `event_id`, `action_id`, `automation_action`, `automation_rule_action`) VALUES (112, 10, 18, 3, 1, 0);
INSERT INTO `common_automation_document_action_config`(`id`, `document_type_id`, `event_id`, `action_id`, `automation_action`, `automation_rule_action`) VALUES (113, 10, 19, 2, 1, 0);
INSERT INTO `common_automation_document_action_config`(`id`, `document_type_id`, `event_id`, `action_id`, `automation_action`, `automation_rule_action`) VALUES (114, 10, 19, 3, 1, 0);
INSERT INTO `common_automation_document_action_config`(`id`, `document_type_id`, `event_id`, `action_id`, `automation_action`, `automation_rule_action`) VALUES (115, 10, 20, 2, 1, 0);
INSERT INTO `common_automation_document_action_config`(`id`, `document_type_id`, `event_id`, `action_id`, `automation_action`, `automation_rule_action`) VALUES (116, 10, 20, 3, 1, 0);

INSERT INTO `common_automation_field`(`id`, `document_type`, `short_code`, `field_name`, `condition_enable`, `action_enable`, `show_hide_enable`, `show_hide_enable_default`, `data_type`, `drop_down_id`, `drop_down_url`, `second_value`, `max_length`) VALUES (107, 10, 'created By', 'Submitted User', 1, 0, 0, 0, 'int', NULL, '/user_management/sec_get_userlist_dropdown', 0, 0);

INSERT INTO `common_automation_field`(`id`, `document_type`, `short_code`, `field_name`, `condition_enable`, `action_enable`, `show_hide_enable`, `show_hide_enable_default`, `data_type`, `drop_down_id`, `drop_down_url`, `second_value`, `max_length`) VALUES (108, 10, 'eventExecutedUser', 'Event Executed User', 1, 1, 0, 0, 'int', NULL, '/user_management/sec_get_userlist_dropdown', 0, 0);

