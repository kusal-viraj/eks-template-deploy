----------Hashila-----2.6.62------------

ALTER TABLE `papertrl_customer_ocr_usage` 
MODIFY COLUMN `bill_id` int NULL AFTER `tenant_id`,
ADD COLUMN `receipt_id` int NULL AFTER `bill_id`;