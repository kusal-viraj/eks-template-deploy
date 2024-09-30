ALTER TABLE `vp_expense_mileage_rate` 
CHANGE COLUMN `update_by` `created_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL AFTER `mileage_rate`,
CHANGE COLUMN `update_on` `created_on` datetime(0) NULL DEFAULT NULL AFTER `created_by`,
ADD COLUMN `effective_from` datetime(0) NULL AFTER `created_on`,
ADD COLUMN `effective_to` datetime(0) NULL AFTER `effective_from`,
ADD COLUMN `status` char(1) NULL AFTER `effective_to`;

TRUNCATE TABLE vp_expense_mileage_rate;

INSERT INTO `vp_expense_mileage_rate`(`id`, `created_on`, `effective_from`, `status`) VALUES (1, '2022-08-19 16:09:09', '2022-08-19 16:09:27', 'A');

ALTER TABLE `vp_expense_mileage_rate` 
MODIFY COLUMN `id` int NOT NULL AUTO_INCREMENT FIRST;

INSERT INTO `common_grid_template`(`id`, `grid_name`) VALUES (61, 'EXPENSE_MILEAGE_RATE');

INSERT INTO `common_grid_column_template`(`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`) VALUES (61, 'mileage.mileageRate', 'Mileage Rate', 1, 0, 0, 0, 0, 'right', '', 'Mileage Rate', 1);

INSERT INTO `common_grid_column_template`(`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`) VALUES (61, 'mileage.effectiveFrom', 'Effective From', 1, 0, 0, 0, 0, 'center', 'date', 'Effective From', 2);

INSERT INTO `common_grid_column_template`(`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`) VALUES (61, 'mileage.effectiveTo', 'Effective To', 1, 0, 0, 0, 0, 'center', 'date', 'Effective To', 3);

INSERT INTO `common_grid_state_template`(`id`, `grid_id`, `total_rows`, `column_widths`) VALUES (61, 61, 15, '210,210,210');

ALTER TABLE `vp_expense_mst` 
ADD COLUMN `total_miles_driven` decimal(19, 2) NULL AFTER `total_amount`;