----Thiwanka---

ALTER TABLE `vp_bill`
	ADD COLUMN `negative_recode` CHAR(1) NULL DEFAULT NULL AFTER `account_period_year`,
	ADD COLUMN `applied_to_positive_recode` CHAR(1) NULL DEFAULT NULL AFTER `negative_recode`,
	ADD COLUMN `negative_recode_id` INT(11) NULL DEFAULT NULL AFTER `applied_to_positive_recode`;

UPDATE vp_bill bill SET bill.negative_recode ='N',bill.applied_to_positive_recode='N' WHERE bill.negative_recode_id IS NULL;

ALTER TABLE `hst_vp_bill`
	ADD COLUMN `negative_recode` CHAR(1) NULL DEFAULT NULL AFTER `account_period_year`,
	ADD COLUMN `applied_to_positive_recode` CHAR(1) NULL DEFAULT NULL AFTER `negative_recode`,
	ADD COLUMN `negative_recode_id` INT(11) NULL DEFAULT NULL AFTER `applied_to_positive_recode`;

UPDATE hst_vp_bill bill SET bill.negative_recode ='N',bill.applied_to_positive_recode='N' WHERE bill.negative_recode_id IS NULL;

INSERT INTO `common_audit_trial_status` (`id`, `name`, `sort_order`, `icon`, `color`) VALUES (72, 'Negative bill applied by', 19, 'fa fa-sticky-note', 'bg-blue');
INSERT INTO `common_audit_trial_status` (`id`, `name`, `sort_order`, `icon`, `color`) VALUES (73, 'Applied to a bill by', 20, 'fa fa-sticky-note', 'bg-blue');
INSERT INTO `common_audit_trial_status` (`id`, `name`, `sort_order`, `icon`, `color`) VALUES (74, 'Negative bill removed by', 21, 'fa fa-trash', 'bg-red');
INSERT INTO `common_audit_trial_status` (`id`, `name`, `sort_order`, `icon`, `color`) VALUES (75, 'Removed from bill by', 22, 'fa fa-trash', 'bg-red');

INSERT INTO `common_drop_down_value` (`id`, `value`, `label`) VALUES (74, 'C', 'Applied Credit');
INSERT INTO `common_drop_down_value` (`id`, `value`, `label`) VALUES (75, 'U', 'Unapplied Credit');

INSERT INTO `common_drop_down_connection` (`id`, `drop_down_id`, `drop_down_value_id`) VALUES (132, 16, 74);
INSERT INTO `common_drop_down_connection` (`id`, `drop_down_id`, `drop_down_value_id`) VALUES (133, 16, 75);


INSERT INTO `common_grid_template` (`id`, `grid_name`) VALUES (74, 'NEGATIVE_BILL_LIST');

INSERT INTO `common_grid_column_template` (`grid_id`, `field`, `sortable_field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `filter_show`, `is_frozen`, `frozen_direction`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `column_width`, `drop_down_url_id`) VALUES (74, 'nBill.billNo', 'nBill.billNo', 'Negative Bill No.', 1, 1, 1, 1, 1, 1, 0, NULL, 'left', 'input', 'Negative Bill No.', 0, NULL, 160, NULL);
INSERT INTO `common_grid_column_template` (`grid_id`, `field`, `sortable_field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `filter_show`, `is_frozen`, `frozen_direction`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `column_width`, `drop_down_url_id`) VALUES (74, 'nBill.billDate', 'nBill.billDate', 'Bill Date', 1, 1, 1, 1, 1, 1, 0, NULL, 'center', 'date', 'Bill Date', 1, NULL, 160, NULL);
INSERT INTO `common_grid_column_template` (`grid_id`, `field`, `sortable_field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `filter_show`, `is_frozen`, `frozen_direction`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `column_width`, `drop_down_url_id`) VALUES (74, 'nBill.billAmount', 'nBill.billAmount', 'Amount', 1, 1, 1, 1, 1, 1, 0, NULL, 'right', 'numeric', 'Amount', 2, NULL, 160, NULL);
INSERT INTO `common_grid_column_template` (`grid_id`, `field`, `sortable_field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `filter_show`, `is_frozen`, `frozen_direction`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `column_width`, `drop_down_url_id`) VALUES (74, 'apply', 'apply', 'Apply', 1, 0, 0, 0, 0, 0, 1, 'right', 'center', 'actionButton', 'Apply', 60, NULL, 160, NULL);

INSERT INTO `common_grid_state_template` (`id`, `grid_id`, `start_from`, `total_rows`, `column_widths`) VALUES (70, 74, 0, 25, '210,210,180,180');

INSERT INTO `umm_privilages` (`id`, `url`, `text`, `auth_code`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (157, 'Apply Negative Bills', 'Apply Negative Bills', 'APPLY_NEGATIVE_BILL', 'System', '2024-03-14 12:57:00', NULL, NULL, NULL, NULL);
INSERT INTO `umm_menu_privilage` (`menu_id`, `privilage_id`, `auth_code`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (1019, 157, 'APPLY_NEGATIVE_BILL', 'System', '2024-03-14 12:57:00', NULL, NULL, NULL, NULL);
INSERT INTO `umm_privilages` (`id`, `url`, `text`, `auth_code`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (158, 'Remove Negative Bills', 'Remove Negative Bills', 'REMOVE_NEGATIVE_BILL', 'System', '2024-03-14 12:57:00', NULL, NULL, NULL, NULL);
INSERT INTO `umm_menu_privilage` (`menu_id`, `privilage_id`, `auth_code`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (1019, 158, 'REMOVE_NEGATIVE_BILL', 'System', '2024-03-14 12:57:00', NULL, NULL, NULL, NULL);

INSERT INTO `umm_role_previlege` (`role_id`, `privilege_id`, `sub_account_id`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (1, 566, NULL, 'System', '2024-03-14 12:57:00', NULL, NULL, NULL, NULL);
INSERT INTO `umm_role_previlege` (`role_id`, `privilege_id`, `sub_account_id`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (1, 567, NULL, 'System', '2024-03-14 12:57:00', NULL, NULL, NULL, NULL);