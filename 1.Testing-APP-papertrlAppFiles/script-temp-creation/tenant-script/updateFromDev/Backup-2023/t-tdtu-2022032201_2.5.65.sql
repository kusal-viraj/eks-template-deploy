ALTER TABLE `hst_vp_po_workflow_detail_config`
	CHANGE COLUMN `action_user` `action_user` VARCHAR(100) NULL DEFAULT NULL AFTER `status_id`;