ALTER TABLE `vp_bill` 
ADD COLUMN `submitted_by_vendor` tinyint(1) NULL AFTER `approved_date`;