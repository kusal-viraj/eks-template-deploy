UPDATE `common_grid_column_template` SET `field` = 'txn.txnDate' WHERE `grid_id` = 62 AND `header` = 'Payment Date';

UPDATE `common_audit_trial_status` SET `name` = 'Marked as mailed by ' WHERE `id` = 12;