ALTER TABLE `vp_vendor_mst`
ADD COLUMN `requested_tenant_id` varchar(50) NULL AFTER `last_updated_by`,
ADD COLUMN `invitation_id` int(11) NULL AFTER `requested_tenant_id`;