--------2.6.25--madusha----

ALTER TABLE `vp_bill_audit_trail_cost_distribution` 
MODIFY COLUMN `number` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL AFTER `cost_type`;