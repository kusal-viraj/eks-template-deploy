-----------Madhusha---2.6.108-----------

ALTER TABLE `vp_bill_payment` 
ADD COLUMN `automation_id` int NULL AFTER `delete_on`;

UPDATE `common_automation_field` SET `short_code` = 'paymentTypeId' WHERE `id` = 65;

UPDATE `common_report_type` SET `name` = 'AP Details Report' WHERE `id` = 4;