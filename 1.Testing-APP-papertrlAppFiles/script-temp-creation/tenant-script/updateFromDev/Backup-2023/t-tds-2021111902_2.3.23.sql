
ALTER TABLE `vp_bill_template_detail` 
CHANGE COLUMN `page_no` `page_no` INT(11) NOT NULL ;

ALTER TABLE `vp_bill_template_mst`
ADD COLUMN `discount_percentage` DECIMAL(5,2) NULL DEFAULT NULL AFTER `bill_term`,
ADD COLUMN `discount_days_due` INT(3) NULL DEFAULT NULL AFTER `discount_percentage`,
ADD COLUMN `net_days_due` INT(3) NULL DEFAULT NULL AFTER `discount_days_due`,
CHANGE COLUMN `created_by` `created_by` VARCHAR(100) NOT NULL COLLATE 'latin1_swedish_ci' AFTER `net_days_due`;