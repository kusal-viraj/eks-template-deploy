ALTER TABLE `vp_expense_mileage_rate` 
MODIFY COLUMN `created_on` date NULL DEFAULT NULL AFTER `created_by`,
MODIFY COLUMN `effective_from` date NULL DEFAULT NULL AFTER `created_on`,
MODIFY COLUMN `effective_to` date NULL DEFAULT NULL AFTER `effective_from`;