---------------Hashila-----2.2.48---------------

DELETE FROM `common_additional_field_validation_relation` WHERE `id` = 29;

UPDATE `common_grid_column_template` SET `search_type` = 'multiSelect' WHERE `id` = 85;

UPDATE `common_grid_column_template` SET `search_type` = 'multiSelect' WHERE `id` = 297;

DELETE FROM `common_grid_column_user_wice` WHERE `grid_id` = 11;

DELETE FROM `common_grid_state_user_wice` WHERE `grid_id` = 11;

UPDATE `common_grid_column_template` SET `column_order`='2' WHERE (`id`='84');

INSERT INTO `common_grid_column_template` (`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES ('11', 'checkbox', NULL, '1', '0', '0', '0', '0', 'center', 'checkbox', '', '1', NULL, '');

UPDATE `common_grid_state_template` SET `column_widths`='50,100,220,218,214,218,218,218' WHERE (`id`='11');

UPDATE `common_grid_column_template` SET `grid_id` = 11, `field` = 'field.sectionId', `header` = 'Section', `column_show` = 0, `is_sortable` = 0, `is_re_orderable` = 0, `is_re_sizable` = 0, `can_hide` = 0, `align` = 'left', `search_type` = 'multiSelect', `placeholder` = 'Section', `column_order` = 3, `drop_down_id` = NULL, `drop_down_url` = '' WHERE `id` = 297;

UPDATE `common_grid_column_template` SET `column_order` = 3 WHERE `id` = 85;

ALTER TABLE `common_additional_document_relation` 
ADD COLUMN `created_by_name` varchar(100) NULL AFTER `created_on`;

DELETE FROM `common_automation_document_section_relation` WHERE `id` = 2;

UPDATE `common_grid_state_template` SET `column_widths` = '50,100,260,210,210,210,210' WHERE `id` = 11;

DELETE FROM `umm_menu_privilage` WHERE `id` = 26;

UPDATE `common_grid_column_template` SET `header` = 'Status' WHERE `id` = 89;

UPDATE `common_grid_column_template` SET `header` = 'Required' WHERE `id` = 88;