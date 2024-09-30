ALTER TABLE `vp_invoice_payment` ADD COLUMN `distribution_id` INT(11) NULL DEFAULT NULL AFTER `bank_account_ref`;

