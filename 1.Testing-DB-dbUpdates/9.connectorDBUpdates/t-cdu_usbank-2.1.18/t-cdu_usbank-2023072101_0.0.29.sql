ALTER TABLE `audit_log` 
MODIFY COLUMN `request` mediumtext CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL AFTER `transaction_id`,
MODIFY COLUMN `response` mediumtext CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL AFTER `request`;