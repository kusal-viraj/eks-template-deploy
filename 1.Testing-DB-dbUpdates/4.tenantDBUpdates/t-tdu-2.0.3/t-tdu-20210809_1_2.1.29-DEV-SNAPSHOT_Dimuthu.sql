ALTER TABLE `vp_bill_term`
ADD COLUMN `in_months`  int(4) NULL AFTER `term`,
ADD COLUMN `on_month`  int(4) NULL AFTER `in_months`,
ADD COLUMN `on_day`  int(4) NULL AFTER `on_month`;

ALTER TABLE `vp_bill_term`
ADD COLUMN `end_of_month`  tinyint(1) NOT NULL AFTER `discount_days_due`;


ALTER TABLE `vp_bill_term`
ADD COLUMN `from_entry`  tinyint(1) NOT NULL AFTER `end_of_month`;

ALTER TABLE `vp_bill_term`
MODIFY COLUMN `end_of_month`  tinyint(1) NOT NULL DEFAULT 0 AFTER `discount_days_due`;

ALTER TABLE `vp_bill_term`
MODIFY COLUMN `end_of_month`  tinyint(1) NULL DEFAULT 0 AFTER `discount_days_due`,
MODIFY COLUMN `from_entry`  tinyint(1) NULL DEFAULT 0 AFTER `end_of_month`;
