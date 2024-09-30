ALTER TABLE `audit_log` 
ADD COLUMN `status_received` varchar(200) NULL AFTER `tp_txn_id`;