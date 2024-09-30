ALTER TABLE `payment_transaction` 
ADD COLUMN `signature_image` mediumtext CHARACTER SET utf8 NULL AFTER `requester_data_id`;