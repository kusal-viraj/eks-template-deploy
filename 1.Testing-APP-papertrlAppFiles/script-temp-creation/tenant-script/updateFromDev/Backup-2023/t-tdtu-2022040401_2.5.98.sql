---------Madhusha-- 2.5.98------------

ALTER TABLE `common_item_vendor_wise` 
MODIFY COLUMN `min_order_qty` decimal(19, 2) NULL DEFAULT NULL AFTER `lead_time`;