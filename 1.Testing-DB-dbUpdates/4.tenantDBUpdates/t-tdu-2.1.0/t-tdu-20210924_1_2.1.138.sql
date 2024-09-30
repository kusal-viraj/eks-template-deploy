INSERT INTO `common_drop_down_value` (`id`, `value`, `label`) VALUES (48, 'C', 'Canceled');

INSERT INTO `common_drop_down_connection` (`id`, `drop_down_id`, `drop_down_value_id`) VALUES (78, 25, 48);

ALTER TABLE `vp_payment_batch_audit_trail`
MODIFY COLUMN `user_id`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL AFTER `status_id`,
MODIFY COLUMN `user_name`  varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL AFTER `user_id`;