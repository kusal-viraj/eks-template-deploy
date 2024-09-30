ALTER TABLE `payment_transaction` 
ADD COLUMN `effect_until` date NULL DEFAULT NULL AFTER `precise_pay`;