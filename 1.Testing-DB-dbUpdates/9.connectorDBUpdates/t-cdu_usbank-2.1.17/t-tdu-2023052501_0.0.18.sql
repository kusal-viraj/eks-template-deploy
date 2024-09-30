ALTER TABLE `payment_provider` 
ADD COLUMN `client_id` varchar(250) NULL AFTER `osn`;

UPDATE `payment_provider` SET `client_id` = 'FNDod4YVRMoWt1innfuh0BMQPWuZXNRA' WHERE `id` = 2;