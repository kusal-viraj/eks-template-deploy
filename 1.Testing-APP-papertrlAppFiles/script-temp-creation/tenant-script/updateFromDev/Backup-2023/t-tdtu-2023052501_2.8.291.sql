ALTER TABLE `common_item_import_issue` 
ADD COLUMN `vendor_id` int NULL AFTER `line_no`,
ADD COLUMN `vendor_item_number` varchar(200) NULL AFTER `vendor_id`,
ADD COLUMN `vendor_item_description` varchar(255) NULL AFTER `vendor_item_number`,
ADD COLUMN `vendor_item_price` decimal(19, 2) NULL AFTER `vendor_item_description`,
ADD COLUMN `lead_time` varchar(200) NULL AFTER `vendor_item_price`,
ADD COLUMN `min_order_qty` decimal(19, 2) NULL AFTER `lead_time`,
ADD COLUMN `status` char(1) NULL AFTER `min_order_qty`;


INSERT INTO `common_grid_template`(`id`, `grid_name`) VALUES (68, 'VENDOR_ITEMS');

INSERT INTO `common_grid_column_template`(`grid_id`, `field`, `sortable_field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `filter_show`, `is_frozen`, `align`, `search_type`, `placeholder`, `column_order`, `column_width`) VALUES (68, 'vendorItem.vendorItemNumber', 'vendorItem.vendorItemNumber', 'Vendor Part Number', 1, 1, 0, 0, 1, 1, 0, 'left', 'input', 'Vendor Part Number', 1, 140);

INSERT INTO `common_grid_column_template`(`grid_id`, `field`, `sortable_field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `filter_show`, `is_frozen`, `align`, `search_type`, `placeholder`, `column_order`, `column_width`) VALUES (68, 'vendorItem.vendorItemDescription', 'vendorItem.vendorItemDescription', 'Item Description', 1, 1, 0, 0, 1, 1, 0, 'left', 'input', 'Item Description', 2, 140);

INSERT INTO `common_grid_column_template`(`grid_id`, `field`, `sortable_field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `filter_show`, `is_frozen`, `align`, `search_type`, `placeholder`, `column_order`, `column_width`) VALUES (68, 'vendorItem.vendorItemPrice', 'vendorItem.vendorItemPrice', 'Vendor Price', 1, 1, 0, 0, 1, 1, 0, 'right', 'numeric', 'Vendor Price', 3, 140);

INSERT INTO `common_grid_column_template`(`grid_id`, `field`, `sortable_field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `filter_show`, `is_frozen`, `align`, `search_type`, `placeholder`, `column_order`, `column_width`) VALUES (68, 'vendorItem.leadTime', 'vendorItem.leadTime', 'Lead Time', 1, 1, 0, 0, 1, 1, 0, 'left', 'input', 'Lead Time', 4, 140);

INSERT INTO `common_grid_column_template`(`grid_id`, `field`, `sortable_field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `filter_show`, `is_frozen`, `align`, `search_type`, `placeholder`, `column_order`, `column_width`) VALUES (68, 'vendorItem.minOrderQty', 'vendorItem.minOrderQty', 'Min Order Qty', 1, 1, 0, 0, 1, 1, 0, 'right', 'numeric', 'Min Order Qty', 5, 140);

INSERT INTO `common_grid_column_template`(`grid_id`, `field`, `sortable_field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `filter_show`, `is_frozen`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `column_width`) VALUES (68, 'vendorItem.status', 'vendorItem.status', 'Status', 1, 1, 0, 0, 1, 1, 0, 'left', 'dropdown', 'Status', 6, 1, 140);

INSERT INTO `common_grid_state_template`(`grid_id`, `total_rows`, `column_widths`) VALUES (68, 68, '210,210,210,210,210,210');

UPDATE `common_audit_trial_status` SET `name` = 'The vendor has redeemed an amount from the card' WHERE `id` = 52;