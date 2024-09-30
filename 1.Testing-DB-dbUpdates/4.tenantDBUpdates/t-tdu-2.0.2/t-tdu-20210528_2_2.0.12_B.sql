TRUNCATE TABLE `vp_po_number_config`;

UPDATE `common_grid_column_template` SET `field`='poc.approvalGroupId' WHERE (`id`='273');

ALTER TABLE `vp_po_number_config`
MODIFY COLUMN `separator_symbol_id`  int(10) NULL DEFAULT NULL AFTER `suffixes`;

INSERT INTO `common_grid_column_template` (`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`) VALUES ('27', 'poc.override', 'Override', '1', '1', '1', '0', '1', 'center', 'dropdown', 'Override', '6', '20');

UPDATE `common_grid_state_template` SET `column_widths`='100,210,210,210,210,210' WHERE (`id`='27');

ALTER TABLE `vp_po_number_config`
MODIFY COLUMN `is_override`  char(1) NULL DEFAULT NULL AFTER `running_no`;



UPDATE `common_automation_document_type` SET `id`='6' WHERE (`id`='7');

UPDATE `common_automation_document_section_relation` SET `document_id` = '6' WHERE (`id` = '12');

