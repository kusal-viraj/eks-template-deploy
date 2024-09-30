-----------------2.12.15 sithum-----------------

ALTER TABLE  vp_payment_transaction
	ADD COLUMN `financial_status` CHAR(50) NULL DEFAULT NULL AFTER `request_id`;
 
ALTER TABLE  vp_payment_transaction
	ADD COLUMN `last_status_update_date` DATETIME NULL DEFAULT NULL AFTER `financial_status`;
 
ALTER TABLE  vp_payment_transaction
	ADD COLUMN `authorization_code` VARCHAR(50) NULL DEFAULT NULL AFTER `last_status_update_date`;
 
ALTER TABLE  vp_payment_transaction
	ADD COLUMN `settlement_date` DATETIME NULL DEFAULT NULL AFTER `authorization_code`;

ALTER TABLE  vp_payment_transaction
	ADD COLUMN `payment_status_export` CHAR(50) NULL DEFAULT NULL AFTER `settlement_date`;