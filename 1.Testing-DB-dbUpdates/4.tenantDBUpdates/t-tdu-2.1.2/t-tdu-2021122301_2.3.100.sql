--------Madhusha----2.3.100-------

ALTER TABLE `common_approval_code`
ADD COLUMN `start_date`  datetime NULL AFTER `contract_value`,
ADD COLUMN `end_date`  datetime NULL AFTER `start_date`;


INSERT INTO `common_grid_column_template` (`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`) VALUES ('10', 'appCode.startDate', 'Start Date', '1', '1', '1', '1', '1', 'center', 'date', 'Start Date', '10');


INSERT INTO `common_grid_column_template` (`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`) VALUES ('10', 'appCode.endDate', 'End Date', '1', '1', '1', '1', '1', 'center', 'date', 'End Date', '11');


UPDATE `common_grid_column_template` SET `column_order`='12' WHERE (`id`='80');

UPDATE `common_grid_column_template` SET `column_order`='13' WHERE (`id`='81');

UPDATE `common_grid_column_template` SET `column_order`='14' WHERE (`id`='82');