ALTER TABLE `payment_transaction_summary` 
ADD COLUMN `comment` varchar(500) NULL AFTER `txn_amount`;

ALTER TABLE `payment_transaction_summary` 
ADD COLUMN `bill_amount` decimal(11, 2) NOT NULL AFTER `comment`;