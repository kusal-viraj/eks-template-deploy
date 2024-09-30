--------Madhusha-Indra----2.2.63-------------

ALTER TABLE `vp_bill_create_detail`
CHANGE COLUMN `unit_price` `unit_price` DECIMAL(19,2) NOT NULL AFTER `uom_id`,
CHANGE COLUMN `amount` `amount` DECIMAL(19,2) NOT NULL AFTER `unit_price`;