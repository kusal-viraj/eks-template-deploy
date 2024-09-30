--------Dimuthu----2.1.79---------

ALTER TABLE `payment_provider` 
MODIFY COLUMN `name` varchar(100) NOT NULL AFTER `id`;

ALTER TABLE `payment_type` 
MODIFY COLUMN `name` varchar(100) NOT NULL AFTER `id`;