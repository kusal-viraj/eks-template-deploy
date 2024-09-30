--------------Hashila-----2.6.98------------

INSERT INTO `common_grid_template`(`id`, `grid_name`) VALUES (57, 'CREDIT_CARD_RECEIPT_POPUP');

INSERT INTO `common_grid_column_template`(`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (57, 'receipt.transactionDate', 'Transaction Date', 1, 1, 1, 1, 1, 'center', 'date', 'Transaction Date', 1, NULL, '');
INSERT INTO `common_grid_column_template`(`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (57, 'receipt.amount', 'Amount', 1, 1, 1, 1, 1, 'right', 'numeric', 'Amount', 2, NULL, '');
INSERT INTO `common_grid_column_template`(`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (57, 'receipt.merchant', 'Merchant', 1, 1, 1, 1, 1, 'left', 'input', 'Merchant', 3, NULL, '');
INSERT INTO `common_grid_column_template`(`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (57, 'receipt.description', 'Description', 1, 1, 1, 1, 1, 'left', 'input', 'Description', 4, NULL, '');
INSERT INTO `common_grid_column_template`(`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (57, 'image', 'Image', 1, 0, 1, 0, 1, 'center', '', 'Image', 5, NULL, '');
INSERT INTO `common_grid_column_template`(`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (57, 'actionBtn', 'Action', 1, 0, 1, 0, 0, 'center', '', 'Action', 6, NULL, '');

INSERT INTO `common_grid_state_template`(`id`, `grid_id`, `start_from`, `total_rows`, `column_widths`) VALUES (57, 57, 0, 15, '210,210,210,210,210,100');

ALTER TABLE `vp_credit_card_for_employee` 
ADD COLUMN `created_by_name` varchar(200) NULL AFTER `created_by`;

ALTER TABLE `vp_credit_card_statement` 
ADD COLUMN `created_by_name` varchar(200) NULL AFTER `created_by`;

UPDATE `common_grid_column_template` SET `field` = 'card.createdByName' WHERE `grid_id` = 51 AND `header` = 'Created By';

UPDATE `common_grid_column_template` SET `field` = 'statement.createdByName' WHERE `grid_id` = 50 AND `header` = 'Uploaded By';

DELETE FROM `common_grid_column_template` WHERE `grid_id` = 50 AND `header` = 'Created By';
