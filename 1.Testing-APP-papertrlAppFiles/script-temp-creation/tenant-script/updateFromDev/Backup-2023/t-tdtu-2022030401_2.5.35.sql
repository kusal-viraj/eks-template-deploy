
ALTER TABLE `hst_vp_bill`
	ADD COLUMN `action_status` INT(15) NULL AFTER `ocr_running_date`;
	
ALTER TABLE `vp_bill_audit_trail`
	ADD COLUMN `header` VARCHAR(200) NULL AFTER `user_name`;
	

ALTER TABLE `vp_bill_audit_trail`
	DROP COLUMN `undo_status`;
	
	
	