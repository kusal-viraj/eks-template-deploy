ALTER TABLE `common_automation_workflow_config`
	ADD COLUMN `status_id` INT(11) NULL AFTER `approval_order`;
	
ALTER TABLE `common_automation_workflow_config`
	ADD CONSTRAINT `FK_common_automation_workflow_config_common_audit_trial_status` FOREIGN KEY (`status_id`) REFERENCES `common_audit_trial_status` (`id`) ON UPDATE RESTRICT ON DELETE RESTRICT;