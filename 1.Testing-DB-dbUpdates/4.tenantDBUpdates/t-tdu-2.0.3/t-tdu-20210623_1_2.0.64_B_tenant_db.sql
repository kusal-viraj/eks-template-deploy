INSERT INTO `common_grid_column_template` (`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`) VALUES ('11', 'field.section', 'Section', '1', '1', '0', '0', '1', 'left', 'input', 'Section', '7');

UPDATE `common_grid_state_template` SET `column_widths` = '100,220,218,214,218,218,218' WHERE (`id` = '11');

UPDATE `common_grid_column_template` SET `column_order` = '4' WHERE (`id` = '86');
UPDATE `common_grid_column_template` SET `column_order` = '5' WHERE (`id` = '87');
UPDATE `common_grid_column_template` SET `column_order` = '6' WHERE (`id` = '88');
UPDATE `common_grid_column_template` SET `column_order` = '7' WHERE (`id` = '89');
UPDATE `common_grid_column_template` SET `column_order` = '3' WHERE (`id` = '297');

UPDATE `common_grid_column_template` SET `field` = 'field.sectionId' WHERE (`id` = '297');

UPDATE `common_grid_column_template` SET `search_type` = 'dropdown' WHERE (`id` = '297');






