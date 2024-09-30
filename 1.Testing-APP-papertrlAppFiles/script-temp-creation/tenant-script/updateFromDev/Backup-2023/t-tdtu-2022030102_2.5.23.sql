ALTER TABLE `vp_bill` 
ADD COLUMN `close_po` tinyint(1) NULL DEFAULT 0 AFTER `ocr_running_status`;

ALTER TABLE `hst_vp_bill` 
ADD COLUMN `close_po` tinyint(1) NULL DEFAULT 0 AFTER `ocr_running_status`;

ALTER TABLE `vp_po_mst` 
ADD COLUMN `po_status` char(1) NULL AFTER `status`,
ADD COLUMN `bill_id` int NULL AFTER `department_id`;

INSERT INTO `umm_privilages`(`id`, `url`, `text`, `auth_code`, `created_by`, `created_on`) VALUES (119, 'Close Purchase Order', 'Close Purchase Order', 'CLOSE_PURCHASE_ORDER', 'System', '2022-03-01 14:28:19');

INSERT INTO `umm_menu_privilage`(`id`, `menu_id`, `privilage_id`, `auth_code`, `created_by`, `created_on`) VALUES (466, 1021, 119, 'CLOSE_PURCHASE_ORDER', 'System', '2022-03-01 14:29:36');

INSERT INTO `common_drop_down`(`id`, `drop_down_name`) VALUES (27, 'Purchase Order Status');

INSERT INTO `common_drop_down_value`(`id`, `value`, `label`) VALUES (49, 'A', 'Open');

INSERT INTO `common_drop_down_connection`(`drop_down_id`, `drop_down_value_id`) VALUES (27, 49);

INSERT INTO `common_drop_down_connection`(`drop_down_id`, `drop_down_value_id`) VALUES (27, 21);

INSERT INTO `common_drop_down_connection`(`drop_down_id`, `drop_down_value_id`) VALUES (27, 13);

INSERT INTO `common_grid_column_template`(`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`) VALUES (13, 'po.poStatus', 'Status', 1, 1, 1, 1, 1, 'center', 'dropdown', 'Status', 17, 27);

INSERT INTO `umm_privilages`(`id`, `url`, `text`, `auth_code`, `created_by`, `created_on`) VALUES (120, 'Re-open Purchase Order', 'Re-open Purchase Order', 'RE_OPEN_PURCHASE_ORDER', 'System', '2022-03-01 15:27:46');

INSERT INTO `umm_menu_privilage`(`id`, `menu_id`, `privilage_id`, `auth_code`, `created_by`, `created_on`) VALUES (467, 1021, 120, 'RE_OPEN_PURCHASE_ORDER', 'System', '2022-03-01 15:30:39');

INSERT INTO `umm_role_previlege`(`role_id`, `privilege_id`, `created_by`, `created_on`) VALUES (1, 466, 'System', '2022-03-01 15:43:18');

INSERT INTO `umm_role_previlege`(`role_id`, `privilege_id`, `created_by`, `created_on`) VALUES (1, 467, 'System', '2022-03-01 15:43:55');

UPDATE `common_grid_state_template` SET `column_widths` = '50,100,220,218,214,218,218,219,219,219,219,219,219,219,219,219,219' WHERE `id` = 13;

ALTER TABLE `vp_po_receipt_mst` 
ADD COLUMN `close_by_po` tinyint(1) NULL DEFAULT 0 AFTER `update_on`;
