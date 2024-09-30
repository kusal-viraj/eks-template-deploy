----indra---2.8.78-----

INSERT INTO `common_automation_field` (`id`, `document_type`, `short_code`, `field_name`, `condition_enable`, `action_enable`, `show_hide_enable`, `show_hide_enable_default`, `data_type`, `drop_down_id`, `drop_down_url`, `second_value`, `max_length`, `notification_enable`, `field_weight`) VALUES (128, 2, 'vendorGroups', 'Vendor Group', 1, 0, 0, 0, 'int', NULL, '/vendor_portal/sec_vendor_group_dropdown', 0, 0, 0, NULL);
INSERT INTO `common_automation_field` (`id`, `document_type`, `short_code`, `field_name`, `condition_enable`, `action_enable`, `show_hide_enable`, `show_hide_enable_default`, `data_type`, `drop_down_id`, `drop_down_url`, `second_value`, `max_length`, `notification_enable`, `field_weight`) VALUES (129, 4, 'vendorGroups', 'Vendor Group', 1, 0, 0, 0, 'int', NULL, '/vendor_portal/sec_vendor_group_dropdown', 0, 0, 0, NULL);

INSERT INTO `common_automation_field_condition` (`id`, `field_id`, `condition_id`) VALUES (458, 128, 1);
INSERT INTO `common_automation_field_condition` (`id`, `field_id`, `condition_id`) VALUES (459, 128, 2);

INSERT INTO `common_automation_field_condition` (`id`, `field_id`, `condition_id`) VALUES (460, 129, 1);
INSERT INTO `common_automation_field_condition` (`id`, `field_id`, `condition_id`) VALUES (461, 129, 2);

INSERT INTO `common_automation_event` (`id`, `event_name`, `sort_order`) VALUES (37, 'Edit', 0);
INSERT INTO `common_automation_event` (`id`, `event_name`, `sort_order`) VALUES (38, 'Open', 0);
INSERT INTO `common_automation_event` (`id`, `event_name`, `sort_order`) VALUES (39, 'Closed', 0);

INSERT INTO `common_automation_document_type_event` (`id`, `document_type_id`, `event_id`, `automation_event`, `automation_rule_event`, `sort_order`) VALUES (48, 1, 37, 1, 0, 0);
INSERT INTO `common_automation_document_type_event` (`id`, `document_type_id`, `event_id`, `automation_event`, `automation_rule_event`, `sort_order`) VALUES (49, 2, 37, 1, 0, 0);
INSERT INTO `common_automation_document_type_event` (`id`, `document_type_id`, `event_id`, `automation_event`, `automation_rule_event`, `sort_order`) VALUES (50, 4, 37, 1, 0, 0);

INSERT INTO `common_automation_document_type_event` (`id`, `document_type_id`, `event_id`, `automation_event`, `automation_rule_event`, `sort_order`) VALUES (51, 2, 38, 1, 0, 0);
INSERT INTO `common_automation_document_type_event` (`id`, `document_type_id`, `event_id`, `automation_event`, `automation_rule_event`, `sort_order`) VALUES (52, 2, 39, 1, 0, 0);

INSERT INTO `common_automation_document_action_config` (`id`, `document_type_id`, `event_id`, `action_id`, `automation_action`, `automation_rule_action`) VALUES (120, 1, 37, 2, 1, 0);
INSERT INTO `common_automation_document_action_config` (`id`, `document_type_id`, `event_id`, `action_id`, `automation_action`, `automation_rule_action`) VALUES (121, 1, 37, 3, 1, 0);
INSERT INTO `common_automation_document_action_config` (`id`, `document_type_id`, `event_id`, `action_id`, `automation_action`, `automation_rule_action`) VALUES (122, 1, 37, 4, 1, 0);

INSERT INTO `common_automation_document_action_config` (`id`, `document_type_id`, `event_id`, `action_id`, `automation_action`, `automation_rule_action`) VALUES (123, 2, 37, 2, 1, 0);
INSERT INTO `common_automation_document_action_config` (`id`, `document_type_id`, `event_id`, `action_id`, `automation_action`, `automation_rule_action`) VALUES (124, 2, 37, 3, 1, 0);
INSERT INTO `common_automation_document_action_config` (`id`, `document_type_id`, `event_id`, `action_id`, `automation_action`, `automation_rule_action`) VALUES (125, 2, 37, 4, 1, 0);

INSERT INTO `common_automation_document_action_config` (`id`, `document_type_id`, `event_id`, `action_id`, `automation_action`, `automation_rule_action`) VALUES (126, 2, 38, 2, 1, 0);
INSERT INTO `common_automation_document_action_config` (`id`, `document_type_id`, `event_id`, `action_id`, `automation_action`, `automation_rule_action`) VALUES (127, 2, 38, 3, 1, 0);
INSERT INTO `common_automation_document_action_config` (`id`, `document_type_id`, `event_id`, `action_id`, `automation_action`, `automation_rule_action`) VALUES (128, 2, 38, 4, 1, 0);

INSERT INTO `common_automation_document_action_config` (`id`, `document_type_id`, `event_id`, `action_id`, `automation_action`, `automation_rule_action`) VALUES (129, 2, 39, 2, 1, 0);
INSERT INTO `common_automation_document_action_config` (`id`, `document_type_id`, `event_id`, `action_id`, `automation_action`, `automation_rule_action`) VALUES (130, 2, 39, 3, 1, 0);
INSERT INTO `common_automation_document_action_config` (`id`, `document_type_id`, `event_id`, `action_id`, `automation_action`, `automation_rule_action`) VALUES (131, 2, 39, 4, 1, 0);

INSERT INTO `common_automation_document_action_config` (`id`, `document_type_id`, `event_id`, `action_id`, `automation_action`, `automation_rule_action`) VALUES (132, 1, 37, 2, 1, 0);
INSERT INTO `common_automation_document_action_config` (`id`, `document_type_id`, `event_id`, `action_id`, `automation_action`, `automation_rule_action`) VALUES (133, 1, 37, 3, 1, 0);
INSERT INTO `common_automation_document_action_config` (`id`, `document_type_id`, `event_id`, `action_id`, `automation_action`, `automation_rule_action`) VALUES (134, 1, 37, 3, 1, 0);

INSERT INTO `common_automation_document_action_config` (`id`, `document_type_id`, `event_id`, `action_id`, `automation_action`, `automation_rule_action`) VALUES (135, 1, 37, 2, 1, 0);
INSERT INTO `common_automation_document_action_config` (`id`, `document_type_id`, `event_id`, `action_id`, `automation_action`, `automation_rule_action`) VALUES (136, 1, 37, 3, 1, 0);
INSERT INTO `common_automation_document_action_config` (`id`, `document_type_id`, `event_id`, `action_id`, `automation_action`, `automation_rule_action`) VALUES (137, 1, 37, 3, 1, 0);

UPDATE `common_automation_document_action_config` SET `action_id`=4 WHERE  `id`=93;
UPDATE `common_automation_document_action_config` SET `event_id`=37 WHERE  `id`=91;
UPDATE `common_automation_document_action_config` SET `event_id`=37 WHERE  `id`=92;
UPDATE `common_automation_document_action_config` SET `event_id`=37 WHERE  `id`=93;

UPDATE `common_automation_field` SET `condition_enable`=1 WHERE  `id`=107;