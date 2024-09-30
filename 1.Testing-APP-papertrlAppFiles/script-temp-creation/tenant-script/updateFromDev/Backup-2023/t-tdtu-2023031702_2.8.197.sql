ALTER TABLE `common_reminder_mst`
	ADD COLUMN `send_to_overrider` TINYINT(1) NOT NULL AFTER `no_of_occurrence`;
	
INSERT INTO `common_audit_trial_status` (`name`, `sort_order`, `icon`, `color`) VALUES ('Reverted offline payment processing', 21, 'fa fa-undo', 'bg-blue');