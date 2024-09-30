ALTER TABLE `common_approval_code`
ADD COLUMN `project_budget`  decimal(20,2) NULL DEFAULT 0.00 AFTER `expense_category_id`,
ADD COLUMN `amount_invoiced`  decimal(20,2) NULL DEFAULT 0.00 AFTER `project_budget`,
ADD COLUMN `remaining_amount`  decimal(20,2) NULL DEFAULT 0.00 AFTER `amount_invoiced`;

INSERT INTO `common_grid_column_template` (`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`) VALUES ('10', 'appCode.projectBudget', 'Budget', '1', '0', '1', '1', '1', 'right', 'numeric', 'Budget', '5');

INSERT INTO `common_grid_column_template` (`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`) VALUES ('10', 'appCode.amountInvoiced', 'Amount Invoiced', '1', '0', '1', '1', '1', 'right', 'numeric', 'Amount Invoiced', '6');

INSERT INTO `common_grid_column_template` (`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`) VALUES ('10', 'appCode.remainingAmount', 'Remaining Amount', '1', '0', '1', '1', '1', 'right', 'numeric', 'Remaining Amount', '7');

UPDATE `common_grid_column_template` SET `column_order`='4' WHERE (`id`='299');

UPDATE `common_grid_column_template` SET `column_order`='8' WHERE (`id`='296');

UPDATE `common_grid_column_template` SET `column_order`='9' WHERE (`id`='80');

UPDATE `common_grid_column_template` SET `column_order`='10' WHERE (`id`='81');

UPDATE `common_grid_column_template` SET `column_order`='11' WHERE (`id`='82');
