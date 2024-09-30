ALTER TABLE `common_notification_mst` 
MODIFY COLUMN `to_user` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL AFTER `clickable`;