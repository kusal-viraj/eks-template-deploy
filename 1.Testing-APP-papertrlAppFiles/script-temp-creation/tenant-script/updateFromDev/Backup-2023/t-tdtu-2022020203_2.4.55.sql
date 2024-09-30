UPDATE `common_grid_column_template` SET `field` = 'vendor.id' WHERE `id` = 390;

ALTER TABLE `common_item_attachment` 
MODIFY COLUMN `image_data` mediumblob NULL AFTER `id`,
ADD COLUMN `item_image_url` varchar(255) NULL AFTER `product_mst_id`;

INSERT INTO `common_automation_field`(`document_type`, `short_code`, `field_name`, `condition_enable`, `action_enable`, `show_hide_enable`, `show_hide_enable_default`, `data_type`, `second_value`, `max_length`) VALUES (2, 'purchaseOrderDetails.vendorItemNumber', 'SKU', 0, 0, 1, 1, 'text', 1, 50);