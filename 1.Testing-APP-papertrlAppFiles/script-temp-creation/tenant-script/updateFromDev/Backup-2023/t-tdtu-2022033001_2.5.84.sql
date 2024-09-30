ALTER TABLE `vp_bill_audit_trail_cost_distribution`
MODIFY COLUMN `project_code` varchar(300) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '' AFTER `number`;