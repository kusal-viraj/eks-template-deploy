----------madusha 2.8.229



ALTER TABLE `vp_expense_mileage_rate` 
MODIFY COLUMN `mileage_rate` decimal(19, 3) NULL DEFAULT 0 AFTER `id`;

ALTER TABLE `vp_expense_detail` 
MODIFY COLUMN `mileage_rate` decimal(19, 3) NULL DEFAULT 0 AFTER `taxable`;