ALTER TABLE `tenant_wise_transaction` 
ADD COLUMN `status` varchar(1) NULL AFTER `payment_type`;