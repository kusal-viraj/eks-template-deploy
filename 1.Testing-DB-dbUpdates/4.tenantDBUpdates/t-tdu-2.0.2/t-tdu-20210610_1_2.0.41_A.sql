ALTER TABLE `vp_bill_additional_data` 
ADD COLUMN `multiple_status` char(1) NULL AFTER `display_order`;

UPDATE `common_automation_field` SET `show_hide_enable` = 0 WHERE `id` = 34;

ALTER TABLE `common_automation_document_type` 
ADD COLUMN `show_hide_enable` tinyint(1) NULL AFTER `status`;

UPDATE `common_automation_document_type` SET `document_type` = 'Bill', `short_code` = 'BILL', `status` = 'A', `show_hide_enable` = 0 WHERE `id` = 1;
UPDATE `common_automation_document_type` SET `document_type` = 'Purchase Order', `short_code` = 'PO', `status` = 'A', `show_hide_enable` = 1 WHERE `id` = 2;
UPDATE `common_automation_document_type` SET `document_type` = 'Purchase Order Receipt', `short_code` = 'PO_RECEIPT', `status` = 'A', `show_hide_enable` = 0 WHERE `id` = 3;
UPDATE `common_automation_document_type` SET `document_type` = 'Expense Report', `short_code` = 'EXPENSE', `status` = 'A', `show_hide_enable` = 0 WHERE `id` = 4;
UPDATE `common_automation_document_type` SET `document_type` = 'Payment', `short_code` = 'BILL_PAYMENT', `status` = 'A', `show_hide_enable` = 0 WHERE `id` = 5;
UPDATE `common_automation_document_type` SET `document_type` = 'Vendor', `short_code` = 'VENDOR', `status` = 'A', `show_hide_enable` = 0 WHERE `id` = 6;
