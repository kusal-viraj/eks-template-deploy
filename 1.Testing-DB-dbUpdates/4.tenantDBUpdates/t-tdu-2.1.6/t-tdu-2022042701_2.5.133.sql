-------------Indra----2.5.133--------


INSERT INTO common_automation_workflow_config(automation_id,action_id,approval_user,approval_order)
SELECT mst.id,fc.action_id,fc.field_value,1 FROM common_automation_field_config fc 
INNER JOIN common_automation_mst mst ON fc.automation_id=mst.id
WHERE mst.rule_automation=TRUE AND fc.section_id IS NULL;

DELETE common_automation_field_config FROM common_automation_field_config 
INNER JOIN common_automation_mst ON common_automation_field_config.automation_id=common_automation_mst.id
WHERE common_automation_mst.rule_automation=TRUE AND common_automation_field_config.section_id IS NULL;

INSERT INTO `common_automation_field` (`id`, `document_type`, `short_code`, `field_name`, `condition_enable`, `action_enable`, `show_hide_enable`, `show_hide_enable_default`, `data_type`, `drop_down_id`, `drop_down_url`, `second_value`, `max_length`) VALUES (104, 1, 'approvalGroup', 'Approval Group', 1, 1, 0, 0, 'int', NULL, '/user_management/sec_view_approval_group_list_v2', 0, 0);


UPDATE `common_automation_document_type_event` SET `automation_event`='0' WHERE  `id`=38;
UPDATE `common_automation_document_type_event` SET `automation_event`='0' WHERE  `id`=39;

INSERT INTO `common_automation_field_condition` (`id`, `field_id`, `condition_id`) VALUES (412, 104, 1);
INSERT INTO `common_automation_field_condition` (`id`, `field_id`, `condition_id`) VALUES (413, 104, 2);
