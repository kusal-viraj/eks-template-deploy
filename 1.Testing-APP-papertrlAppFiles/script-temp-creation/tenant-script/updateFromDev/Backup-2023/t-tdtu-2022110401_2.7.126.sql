
ALTER TABLE `vp_bill_term` 
ADD COLUMN `in_months_discount_days_due` int NULL AFTER `discount_days_due`;

ALTER TABLE `vp_bill_term` 
ADD COLUMN `on_day_discount_days_due` int NULL AFTER `in_months_discount_days_due`;