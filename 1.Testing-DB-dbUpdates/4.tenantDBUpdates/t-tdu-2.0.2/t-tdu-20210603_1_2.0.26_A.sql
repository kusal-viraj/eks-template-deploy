UPDATE `common_notification_subscription_event` SET `event`='When a bill submitted for your approval group' WHERE  `id`=13;
UPDATE `common_notification_subscription_event` SET `event`='When there are no approval users in the assigned approval group' WHERE  `id`=14;
UPDATE `common_notification_subscription_event` SET `event`='When a  purchase order submitted for your approval group' WHERE  `id`=15;
UPDATE `common_notification_subscription_event` SET `event`='When there are no approval users in the assigned approval group' WHERE  `id`=16;
UPDATE `common_notification_subscription_event` SET `event`='When a expense submitted for your approval group' WHERE  `id`=17;
UPDATE `common_notification_subscription_event` SET `event`='When there are no approval users in the assigned approval group' WHERE  `id`=18;


ALTER TABLE `vp_customer_vendor_relation` 
MODIFY COLUMN `contact_number` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '' AFTER `vendor_email`;