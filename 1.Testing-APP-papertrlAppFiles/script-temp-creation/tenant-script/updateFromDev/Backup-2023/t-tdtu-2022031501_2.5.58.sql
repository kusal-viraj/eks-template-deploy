ALTER TABLE `common_document_ad_hoc_workflow_detail_config`
	ADD COLUMN `status_id` INT(10) NULL AFTER `approval_order`;

ALTER TABLE `common_document_ad_hoc_workflow_detail_config`
ADD CONSTRAINT `AUDIT_TRIAL_STATUS_FK_1` FOREIGN KEY (`status_id`) REFERENCES `common_audit_trial_status` (`id`) ON UPDATE RESTRICT ON DELETE RESTRICT;