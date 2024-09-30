-----------Hashila-------2.6.121------------

INSERT INTO `common_grid_column_template`(`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`) VALUES (51, 'vendor.id', 'Vendor', 1, 1, 1, 1, 1, 'left', 'multiSelect', 'Vendor', 3);

UPDATE `common_grid_column_template` SET `column_order` = 4 WHERE `grid_id` = 51 AND `field` = 'card.cardNo';
UPDATE `common_grid_column_template` SET `column_order` = 5 WHERE `grid_id` = 51 AND `field` = 'card.employeeName';
UPDATE `common_grid_column_template` SET `column_order` = 6 WHERE `grid_id` = 51 AND `field` = 'card.createdByName';
UPDATE `common_grid_column_template` SET `column_order` = 7 WHERE `grid_id` = 51 AND `field` = 'card.createdOn';
UPDATE `common_grid_column_template` SET `column_order` = 8 WHERE `grid_id` = 51 AND `field` = 'card.status';

ALTER TABLE `vp_receipt_mst` 
ADD COLUMN `vendor_id` int NULL AFTER `description`;

INSERT INTO `common_grid_column_template`(`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`) VALUES (53, 'vendor.id', 'Vendor', 1, 1, 1, 1, 1, 'left', 'multiSelect', 'Vendor', 3, NULL);

UPDATE `common_grid_column_template` SET `column_order` = 4 WHERE `grid_id` = 53 AND `field` = 'receipt.cardNo';
UPDATE `common_grid_column_template` SET `column_order` = 5 WHERE `grid_id` = 53 AND `field` = 'receipt.transactionDate';
UPDATE `common_grid_column_template` SET `column_order` = 6 WHERE `grid_id` = 53 AND `field` = 'receipt.amount';
UPDATE `common_grid_column_template` SET `column_order` = 7 WHERE `grid_id` = 53 AND `field` = 'receipt.merchant';
UPDATE `common_grid_column_template` SET `column_order` = 8 WHERE `grid_id` = 53 AND `field` = 'receipt.description';
UPDATE `common_grid_column_template` SET `column_order` = 9 WHERE `grid_id` = 53 AND `field` = 'receipt.createdOn';

INSERT INTO `common_grid_column_template`(`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`) VALUES (57, 'vendor.id', 'Vendor', 1, 1, 1, 1, 1, 'left', 'multiSelect', 'Vendor', 3);

UPDATE `common_grid_column_template` SET `column_order` = 4 WHERE `grid_id` = 57 AND `field` = 'receipt.merchant';
UPDATE `common_grid_column_template` SET `column_order` = 5 WHERE `grid_id` = 57 AND `field` = 'receipt.description';
UPDATE `common_grid_column_template` SET `column_order` = 6 WHERE `grid_id` = 57 AND `field` = 'image';
UPDATE `common_grid_column_template` SET `column_order` = 7 WHERE `grid_id` = 57 AND `field` = 'actionBtn';




