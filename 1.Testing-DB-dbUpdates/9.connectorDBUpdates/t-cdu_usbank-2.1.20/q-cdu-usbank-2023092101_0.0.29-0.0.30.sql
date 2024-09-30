-----0.0.29------

ALTER TABLE `payment_recipient_detail` 
ADD COLUMN `account_number` varchar(75) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL AFTER `address_state`,
ADD COLUMN `routing_number` varchar(75) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL AFTER `account_number`;

----danuddara-0.0.30----


ALTER TABLE `payment_provider_for_customer` 
DROP COLUMN `hours_for_cancel`,
DROP COLUMN `minutes_for_cancel`,
CHANGE COLUMN `days_for_cancel` `customer_id` varchar(100) NULL DEFAULT NULL AFTER `company_id`;



ALTER TABLE `payment_transaction` 
ADD COLUMN `customer_id` varbinary(100) NULL AFTER `effect_until`;