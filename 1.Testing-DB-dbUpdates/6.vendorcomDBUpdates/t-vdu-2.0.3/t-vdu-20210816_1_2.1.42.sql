---------------------------niron/hashila---------------------

ALTER TABLE `vendor_temp`
ADD COLUMN `payment_type_id`  int(11) AFTER `invitation_id`;

ALTER TABLE `vendor_user_mst`
ADD COLUMN `payment_type_id`  int(11) AFTER `delete_on`;

ALTER TABLE `vendor_mst`
ADD COLUMN `payment_type_id` int(11) AFTER `delete_on`;