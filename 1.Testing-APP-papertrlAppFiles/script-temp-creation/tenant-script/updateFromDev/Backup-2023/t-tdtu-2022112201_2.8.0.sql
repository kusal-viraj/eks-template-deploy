ALTER TABLE `common_account_number` 
ADD COLUMN `is_expense_account` tinyint(1) NULL AFTER `is_purchase_account`;

ALTER TABLE `vp_po_number_config` 
MODIFY COLUMN `running_no` varchar(10) NULL DEFAULT NULL AFTER `separator_symbol_id`;

INSERT INTO `common_grid_column_template`(`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`) VALUES (4, 'acc.isExpenseAccount', 'Expense Account', 1, 1, 1, 1, 1, 'center', 'dropdown', 'Expense Account', 9, 22);

UPDATE `common_grid_column_template` SET `column_order` = 10 WHERE `grid_id` = 4 AND `header` = 'Status';

UPDATE `common_grid_state_template` SET `column_widths` = '50,102,257,257,257,257,257,257,257,257' WHERE `grid_id` = 4;
