--Dhanuddhara 0.0.49----

ALTER TABLE `payment_transaction` 
ADD COLUMN `template` varchar(100) NULL AFTER `requester_data_id`;