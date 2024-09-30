-----------Madhusha------2.6.86------------

DELETE FROM `common_automation_field` WHERE `id` = 107;

DELETE FROM `common_automation_field` WHERE `id` = 108;

INSERT INTO `common_automation_document_action_config`(`id`, `document_type_id`, `event_id`, `action_id`, `automation_action`) VALUES (117, 10, 3, 1, 1);

INSERT INTO `common_automation_document_action_config`(`id`, `document_type_id`, `event_id`, `action_id`, `automation_action`, `automation_rule_action`) VALUES (118, 10, 10, 2, 1, 0);

INSERT INTO `common_automation_document_action_config`(`id`, `document_type_id`, `event_id`, `action_id`, `automation_action`, `automation_rule_action`) VALUES (119, 10, 10, 3, 1, 0);

INSERT INTO `common_automation_document_type_event`(`id`, `document_type_id`, `event_id`, `automation_event`, `sort_order`) VALUES (47, 10, 10, 1, 0);

