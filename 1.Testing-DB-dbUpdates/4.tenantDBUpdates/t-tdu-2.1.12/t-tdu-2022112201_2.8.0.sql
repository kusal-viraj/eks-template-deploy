--------madhusha---2.8.0--------

ALTER TABLE `common_account_number` 
ADD COLUMN `is_expense_account` tinyint(1) NULL AFTER `is_purchase_account`;

UPDATE common_account_number acc SET acc.is_expense_account = true WHERE acc.is_expense_account IS NULL;

ALTER TABLE `vp_po_number_config` 
MODIFY COLUMN `running_no` varchar(10) NULL DEFAULT NULL AFTER `separator_symbol_id`;

INSERT INTO `common_grid_column_template`(`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`) VALUES (4, 'acc.isExpenseAccount', 'Expense Account', 1, 1, 1, 1, 1, 'center', 'dropdown', 'Expense Account', 9, 22);

UPDATE `common_grid_column_template` SET `column_order` = 10 WHERE `grid_id` = 4 AND `header` = 'Status';

INSERT INTO common_grid_column_user_wice(user_id,grid_id,field,header,column_show,is_sortable,is_re_orderable,is_re_sizable,can_hide,align,search_type,placeholder,column_order)
SELECT wice.user_id,gridTemp.grid_id,gridTemp.field,gridTemp.header,gridTemp.column_show,gridTemp.is_sortable,gridTemp.is_re_orderable,gridTemp.is_re_sizable,gridTemp.can_hide,gridTemp.align,gridTemp.search_type,gridTemp.placeholder,gridTemp.column_order 
FROM common_grid_column_template gridTemp
INNER JOIN common_grid_column_user_wice wice ON wice.grid_id=gridTemp.grid_id
WHERE gridTemp.grid_id=4 AND gridTemp.header="Expense Account" GROUP BY wice.user_id;

UPDATE `common_grid_state_template` SET `column_widths` = '50,102,257,257,257,257,257,257,257,257' WHERE `grid_id` = 4;

UPDATE common_grid_state_user_wice wice
INNER JOIN common_grid_state_template state ON wice.grid_id=state.grid_id
SET wice.column_widths=CONCAT(wice.column_widths,",257")
WHERE wice.grid_id=4;