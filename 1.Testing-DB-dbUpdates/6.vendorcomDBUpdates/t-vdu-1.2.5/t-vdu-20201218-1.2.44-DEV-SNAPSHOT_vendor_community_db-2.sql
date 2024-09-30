ALTER TABLE `umm_user_mst`
	CHANGE COLUMN `user_name` `user_name` VARCHAR(100) NOT NULL DEFAULT '' COLLATE 'latin1_swedish_ci' AFTER `role_id`,
	CHANGE COLUMN `email` `email` VARCHAR(100) NOT NULL DEFAULT '' COLLATE 'latin1_swedish_ci' AFTER `address`;

ALTER TABLE `vp_vendor_mst`
	CHANGE COLUMN `user_id` `user_id` VARCHAR(100) NULL DEFAULT NULL COLLATE 'latin1_swedish_ci' AFTER `id`;
	
ALTER TABLE `vp_vendor_mst`
ADD COLUMN `requested_tenant_id` varchar(50) NULL AFTER `last_updated_by`,
ADD COLUMN `invitation_id` int(11) NULL AFTER `requested_tenant_id`;