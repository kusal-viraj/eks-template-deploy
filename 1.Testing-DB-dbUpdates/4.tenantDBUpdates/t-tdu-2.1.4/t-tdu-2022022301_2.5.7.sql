---------Indra------2.5.7-------

ALTER TABLE `vp_expense_audit_trail`
	ADD COLUMN `header` VARCHAR(500) NULL DEFAULT NULL AFTER `user_name`;
	
ALTER TABLE `vp_expense_audit_trail`
	DROP COLUMN `undo_status`;
	
ALTER TABLE `hst_vp_expense_mst`
	ADD COLUMN `action_status` INT(11) NOT NULL AFTER `undo_status`;
	