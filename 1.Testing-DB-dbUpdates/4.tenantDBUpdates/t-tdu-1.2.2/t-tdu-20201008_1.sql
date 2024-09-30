ALTER TABLE `vp_invoice_payment`
ADD COLUMN `ap_account_ref` int(11) NULL AFTER `import_id`,
ADD COLUMN `bank_account_ref` int(11) NULL AFTER `ap_account_ref`;

ALTER TABLE `vp_invoice_payment` ADD CONSTRAINT `FK_AP_ACCOUNT`
FOREIGN KEY (`ap_account_ref`) REFERENCES `common_chart_of_account`
(`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE `vp_invoice_payment` ADD CONSTRAINT `FK_BANK_ACCOUNT_REF`
FOREIGN KEY (`bank_account_ref`) REFERENCES `common_chart_of_account`
(`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE `common_product_mst`
ADD COLUMN `uom_id` INT(11) NULL DEFAULT NULL AFTER `created_on`;