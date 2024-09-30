ALTER TABLE `vendor_customer_relation` 
ADD COLUMN `vendor_deleted` tinyint(1) NOT NULL DEFAULT 0 AFTER `vendor_id`;