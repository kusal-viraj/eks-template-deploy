ALTER TABLE `common_integration_incomplete_record` 
MODIFY COLUMN `tp_id` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL AFTER `id`;