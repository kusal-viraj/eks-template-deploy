----------------------indra-----------------

UPDATE `vendor_notification_subscription_type` SET `name`='Customer' WHERE  `id`=6;

UPDATE `vendor_notification_message` SET `notification_message`='has approved your request' WHERE  `id`=4;

UPDATE `vendor_notification_message` SET `notification_message`='has rejected your request' WHERE  `id`=5;

UPDATE `vendor_notification_message` SET `notification_message`='has deleted your request' WHERE  `id`=6;