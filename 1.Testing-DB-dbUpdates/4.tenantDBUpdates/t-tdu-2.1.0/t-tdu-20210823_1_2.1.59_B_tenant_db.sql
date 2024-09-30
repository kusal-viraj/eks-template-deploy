----------Amal--2.1.59------------------

UPDATE `common_grid_column_template` SET `is_sortable` = '0', `is_re_orderable` = '0', `is_re_sizable` = '0', `can_hide` = '0' WHERE (`id` = '311');
UPDATE `common_grid_column_template` SET `search_type` = 'dropdown' WHERE (`id` = '306');


ALTER TABLE `vp_bill_template_mst` 
ADD COLUMN `po_no` VARCHAR(100) NULL AFTER `status`,
ADD COLUMN `bill_amount` DECIMAL(10,2) NULL DEFAULT 0 AFTER `po_no`,
ADD COLUMN `bill_date_str` VARCHAR(100) NULL AFTER `bill_amount`,
ADD COLUMN `bill_no` VARCHAR(100) NULL AFTER `bill_date_str`;

UPDATE `common_grid_column_template` SET `field` = 'vendor.id' WHERE (`id` = '306');