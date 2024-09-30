-------------Amal---------2.5.115-----------------

UPDATE `common_grid_state_template` SET `column_widths`='51,126,200,200,200,200,200,200,200,200,200,200,200,200,200,200,200,200,200,200,200,200,200,200' WHERE  `id`=14;

INSERT INTO `common_grid_column_template` (`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (14, 'bill.paidAmount', 'Paid Amount', 1, 1, 1, 1, 1, 'right', 'numeric', 'Paid Amount', 24, NULL, '');
ALTER TABLE `hst_vp_po_account_detail` CHANGE COLUMN `account_number` `account_number` VARCHAR(100) NULL DEFAULT NULL COLLATE 'latin1_swedish_ci' AFTER `amount`;