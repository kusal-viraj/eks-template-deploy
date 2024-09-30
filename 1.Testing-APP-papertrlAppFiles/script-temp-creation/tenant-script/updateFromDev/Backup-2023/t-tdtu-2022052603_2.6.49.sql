ALTER TABLE `common_notification_mst` 
MODIFY COLUMN `created_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL AFTER `status`,
MODIFY COLUMN `update_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL AFTER `created_on`,
MODIFY COLUMN `delete_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL AFTER `update_on`;

INSERT INTO `common_grid_column_template`(`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`) VALUES (32, 'bill.creditAmount', 'Credit Amount', 1, 1, 1, 1, 1, 'right', 'numeric', 'Credit Amount', 17);

UPDATE `common_grid_column_template` SET `column_order` = 18 WHERE `id` = 323;

UPDATE `common_grid_state_template` SET `column_widths` = '50,50,100,210,210,135,135,180,180,180,180,210,210,180,210,210,145,180' WHERE `id` = 32;