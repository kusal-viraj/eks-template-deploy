--------------2.11.19- dasindu-----------------

INSERT INTO `common_audit_trial_status` (`name`, `sort_order`, `icon`, `color`) VALUES ('Exported By', 26, 'fa-solid fa-share-from-square', 'bg-blue');

ALTER TABLE `vp_expense_mst`
	ADD COLUMN `exported_by` VARCHAR(100) NULL DEFAULT NULL AFTER `export_status`,
	ADD COLUMN `exported_user` VARCHAR(100) NULL DEFAULT NULL AFTER `exported_by`,
	ADD COLUMN `exported_date` DATETIME NULL DEFAULT NULL AFTER `exported_user`;

ALTER TABLE `hst_vp_expense_mst`
	ADD COLUMN `exported_by` VARCHAR(100) NULL DEFAULT NULL AFTER `export_status`,
	ADD COLUMN `exported_user` VARCHAR(100) NULL DEFAULT NULL AFTER `exported_by`,
	ADD COLUMN `exported_date` DATETIME NULL DEFAULT NULL AFTER `exported_user`;

ALTER TABLE `vp_expense_mst`
	ADD COLUMN `employee_no` VARCHAR(100) NULL DEFAULT NULL AFTER `created_by_name`;

ALTER TABLE `hst_vp_expense_mst`
	ADD COLUMN `employee_no` VARCHAR(100) NULL DEFAULT NULL AFTER `created_by_name`;

INSERT INTO `common_grid_column_template` (`grid_id`, `field`, `sortable_field`, `header`, `column_show`,
`is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `filter_show`, `is_frozen`,
`frozen_direction`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`,
`column_width`, `drop_down_url_id`) VALUES (15, 'expense.employeeNo', 'expense.employeeNo',
'Employee No.', 1, 1, 1, 1, 1, 1, 0, NULL, 'left', 'input', 'Employee No.', 5, NULL, 150, NULL);

INSERT INTO `common_grid_column_template` (`grid_id`, `field`, `sortable_field`, `header`, `column_show`,
 `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `filter_show`, `is_frozen`,
 `frozen_direction`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`,
 `column_width`, `drop_down_url_id`) VALUES (15, 'expense.exportedUser', 'expense.exportedUser',
 'Exported User', 1, 1, 1, 1, 1, 1, 0, NULL, 'left', 'input', 'Exported User', 15, NULL, 150, NULL);

INSERT INTO `common_grid_column_template` (`grid_id`, `field`, `sortable_field`, `header`, `column_show`,
 `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `filter_show`, `is_frozen`, 
 `frozen_direction`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`,
 `column_width`, `drop_down_url_id`) VALUES (15, 'expense.exportedDate', 'expense.exportedDate', 'Exported Date',
 1, 1, 1, 1, 1, 1, 0, NULL, 'left', 'date', 'Exported Date', 16, NULL, 150, NULL);

UPDATE `common_grid_state_template` SET  
`column_widths`='50,200,220,215,215,215,215,215,215,215,215,215,215,215,215,215,215,215,215,215,50' WHERE `grid_id`=15;

ALTER TABLE `vp_po_mst`
	ADD COLUMN `exported_by` VARCHAR(100) NULL DEFAULT NULL AFTER `export_status`,
	ADD COLUMN `exported_user` VARCHAR(100) NULL DEFAULT NULL AFTER `exported_by`,
	ADD COLUMN `exported_date` DATETIME NULL DEFAULT NULL AFTER `exported_user`;


ALTER TABLE `hst_vp_po_mst`
	ADD COLUMN `exported_by` VARCHAR(100) NULL DEFAULT NULL AFTER `export_status`,
	ADD COLUMN `exported_user` VARCHAR(100) NULL DEFAULT NULL AFTER `exported_by`,
	ADD COLUMN `exported_date` DATETIME NULL DEFAULT NULL AFTER `exported_user`;

INSERT INTO `common_grid_column_template` (`grid_id`, `field`, `sortable_field`, `header`, `column_show`,
 `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `filter_show`, `is_frozen`,
 `frozen_direction`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`,
 `column_width`, `drop_down_url_id`) VALUES (13, 'po.exportedUser', 'po.exportedUser',
 'Exported User', 1, 1, 1, 1, 1, 1, 0, NULL, 'left', 'input', 'Exported User', 17, NULL, 150, NULL);

INSERT INTO `common_grid_column_template` (`grid_id`, `field`, `sortable_field`, `header`, `column_show`,
 `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `filter_show`, `is_frozen`, 
 `frozen_direction`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`,
 `column_width`, `drop_down_url_id`) VALUES (13, 'po.exportedDate', 'po.exportedDate', 'Exported Date',
 1, 1, 1, 1, 1, 1, 0, NULL, 'left', 'date', 'Exported Date', 18, NULL, 150, NULL);

UPDATE `common_grid_state_template` SET 
 `column_widths`='50,210,220,218,214,218,218,219,219,219,219,219,219,219,219,219,219,50' WHERE `grid_id`=13;

ALTER TABLE `vp_bill`
	ADD COLUMN `exported_by` VARCHAR(100) NULL DEFAULT NULL AFTER `export_status`,
	ADD COLUMN `exported_user` VARCHAR(100) NULL DEFAULT NULL AFTER `exported_by`,
	ADD COLUMN `exported_date` DATETIME NULL DEFAULT NULL AFTER `exported_user`;


ALTER TABLE `hst_vp_bill`
	ADD COLUMN `exported_by` VARCHAR(100) NULL DEFAULT NULL AFTER `export_status`,
	ADD COLUMN `exported_user` VARCHAR(100) NULL DEFAULT NULL AFTER `exported_by`,
	ADD COLUMN `exported_date` DATETIME NULL DEFAULT NULL AFTER `exported_user`;

INSERT INTO `common_grid_column_template` (`grid_id`, `field`, `sortable_field`, `header`, `column_show`,
 `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `filter_show`, `is_frozen`,
 `frozen_direction`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`,
 `column_width`, `drop_down_url_id`) VALUES (14, 'bill.exportedUser', 'bill.exportedUser',
 'Exported User', 1, 1, 1, 1, 1, 1, 0, NULL, 'left', 'input', 'Exported User', 29, NULL, 150, NULL);

INSERT INTO `common_grid_column_template` (`grid_id`, `field`, `sortable_field`, `header`, `column_show`,
 `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `filter_show`, `is_frozen`, 
 `frozen_direction`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`,
 `column_width`, `drop_down_url_id`) VALUES (14, 'bill.exportedDate', 'bill.exportedDate', 'Exported Date',
 1, 1, 1, 1, 1, 1, 0, NULL, 'left', 'date', 'Exported Date', 30, NULL, 150, NULL);

UPDATE `common_grid_state_template` SET 
 `column_widths`='50,210,200,200,200,200,200,200,200,200,200,200,200,200,200,250,200,200,200,200,200,200,200,200,200,200,200,200,200,50' WHERE `grid_id`=14;