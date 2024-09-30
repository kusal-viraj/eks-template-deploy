ALTER TABLE `vp_expense_detail`
ADD COLUMN `project_code_id` INT(15) NULL DEFAULT NULL AFTER `attachment_url`,
ADD COLUMN `account_id` INT(15) NULL DEFAULT NULL AFTER `project_code_id`;


