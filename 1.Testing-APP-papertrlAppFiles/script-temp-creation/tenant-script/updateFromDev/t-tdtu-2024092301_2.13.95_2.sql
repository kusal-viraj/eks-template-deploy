---dasindu 2.13.95---


UPDATE `common_notification_subscription_event` SET `event`='A bill is submitted and you have override approval privilege' WHERE  `id`=37;
UPDATE `common_notification_subscription_event` SET `event`='A purchase order is submitted and you have override approval privilege' WHERE  `id`=38;
UPDATE `common_notification_subscription_event` SET `event`='An expense is submitted and you have override approval privilege' WHERE  `id`=39;
UPDATE `common_notification_subscription_event` SET `event`='A transaction is submitted and you have override approval privilege' WHERE  `id`=40;
UPDATE `common_notification_subscription_event` SET `event`='A payment is submitted and you have override approval privilege' WHERE  `id`=41;

ALTER TABLE `vendor_bill_defaults_account_details`CHANGE COLUMN `description` `description` TEXT NULL COLLATE 'latin1_swedish_ci' AFTER `account_id`;