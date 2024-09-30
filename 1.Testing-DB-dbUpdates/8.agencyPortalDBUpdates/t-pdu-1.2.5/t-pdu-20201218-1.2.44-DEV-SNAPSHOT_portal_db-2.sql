ALTER TABLE `common_email_mst`
MODIFY COLUMN `insert_user`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '' AFTER `insert_date`;

ALTER TABLE `common_email_tmp`
MODIFY COLUMN `insert_user`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '' AFTER `invoice_id`;

ALTER TABLE `common_message`
MODIFY COLUMN `from_user_name`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL AFTER `content`,
MODIFY COLUMN `to_user_name`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL AFTER `from_name`;

ALTER TABLE `common_outstanding_task`
MODIFY COLUMN `last_update_by`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '' AFTER `url`,
MODIFY COLUMN `created_by`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '' AFTER `last_update_on`;

ALTER TABLE `common_user_log`
MODIFY COLUMN `user_name`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL AFTER `ip_address`;

ALTER TABLE `object_sync_mst`
MODIFY COLUMN `executed_by`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '' AFTER `attempts`,
MODIFY COLUMN `insert_by`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL AFTER `executed_on`;

ALTER TABLE `portal_sub_account`
MODIFY COLUMN `client_name`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL AFTER `client_id`,
MODIFY COLUMN `created_by`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL AFTER `created_on`;

ALTER TABLE `umm_approval_group`
MODIFY COLUMN `created_user`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '' AFTER `status`,
MODIFY COLUMN `last_updated_by`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '' AFTER `date_created`;

ALTER TABLE `umm_menu`
MODIFY COLUMN `created_user`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '' AFTER `date_created`;

ALTER TABLE `umm_menu_privilage`
MODIFY COLUMN `user_inserted`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL AFTER `data_created`;

ALTER TABLE `umm_privilages`
MODIFY COLUMN `created_user`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '' AFTER `date_created`;

ALTER TABLE `umm_role_mst`
MODIFY COLUMN `created_user`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '' AFTER `date_created`,
MODIFY COLUMN `last_updated_by`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '' AFTER `last_updated_on`;

ALTER TABLE `umm_role_previlege`
MODIFY COLUMN `inserted_user`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL AFTER `inserted_date`;

ALTER TABLE `umm_user_hst`
MODIFY COLUMN `user_name`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '' AFTER `role_id`,
MODIFY COLUMN `created_user`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '' AFTER `date_created`;

ALTER TABLE `umm_user_import_mst`
MODIFY COLUMN `created_by`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '' AFTER `failed`;

ALTER TABLE `umm_user_mst`
MODIFY COLUMN `created_user`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '' AFTER `date_created`,
MODIFY COLUMN `last_updated_by`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '' AFTER `last_updated_on`;

ALTER TABLE `umm_user_role`
MODIFY COLUMN `assigned_user`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '' AFTER `user_id`,
MODIFY COLUMN `last_updated_by`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '' AFTER `last_updated_on`;

ALTER TABLE `umm_user_role_hst`
MODIFY COLUMN `assigned_user`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '' AFTER `user_id`;

ALTER TABLE `umm_user_role_hst`
MODIFY COLUMN `assigned_user`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '' AFTER `user_id`;

ALTER TABLE `vp_app_wkflw_mst`
MODIFY COLUMN `created_by`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL AFTER `name`,
MODIFY COLUMN `last_updated_by`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL AFTER `last_updated_on`,
MODIFY COLUMN `deleted_by`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '' AFTER `deleted_on`;

ALTER TABLE `vp_vendor_mst`
MODIFY COLUMN `approved_by`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '' AFTER `user_id`,
MODIFY COLUMN `created_by`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL AFTER `date_created`,
MODIFY COLUMN `last_updated_by`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL AFTER `last_updated_on`;

ALTER TABLE `vp_vendor_temp`
MODIFY COLUMN `rejected_by`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '' AFTER `date_rejected`;