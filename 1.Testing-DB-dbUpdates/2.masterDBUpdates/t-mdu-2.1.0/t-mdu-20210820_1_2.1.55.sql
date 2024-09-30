----------Niron-------Hashila---------2.1.55--------

ALTER TABLE `payment_provider_for_customer`
ADD COLUMN `days_for_cancel`  int(30) NULL AFTER `tenant_id`,
ADD COLUMN `hours_for_cancel`  int(30) NULL AFTER `days_for_cancel`,
ADD COLUMN `minutes_for_cancel`  int(30) NULL AFTER `hours_for_cancel`;

  