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

ALTER TABLE `common_user_notification`
MODIFY COLUMN `to_user_name`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL AFTER `id`;

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

ALTER TABLE `umm_user_import_mst`
MODIFY COLUMN `created_by`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '' AFTER `failed`;

ALTER TABLE `umm_user_mst`
MODIFY COLUMN `user_name`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '' AFTER `role_id`,
MODIFY COLUMN `created_user`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '' AFTER `date_created`,
MODIFY COLUMN `last_updated_by`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '' AFTER `last_updated_on`;

ALTER TABLE `vp_approval_level_mst`
MODIFY COLUMN `created_by`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL AFTER `id`;

ALTER TABLE `vp_customer_request`
MODIFY COLUMN `request_by`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL AFTER `vendor_id`,
MODIFY COLUMN `last_updated_by`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '' AFTER `request_on`;

ALTER TABLE `vp_invoice_template_mst`
MODIFY COLUMN `created_by`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL AFTER `created_on`;

ALTER TABLE `vp_vendor_import_mst`
MODIFY COLUMN `created_by`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '' AFTER `failed`;

ALTER TABLE `vp_vendor_invoice`
MODIFY COLUMN `created_by`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL AFTER `date_created`,
MODIFY COLUMN `last_updated_by`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL AFTER `last_updated_on`,
MODIFY COLUMN `submitted_by`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '' AFTER `submitted_on`,
MODIFY COLUMN `approved_by`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '' AFTER `applicable_discount_amount`;

ALTER TABLE `vp_vendor_invoice_additional_field_attachments`
MODIFY COLUMN `deleted_by`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '' AFTER `status`;

ALTER TABLE `vp_vendor_invoice_assignees`
MODIFY COLUMN `assignee`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL AFTER `id`;

ALTER TABLE `vp_vendor_invoice_sync_mst`
MODIFY COLUMN `executed_by`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '' AFTER `attempts`,
MODIFY COLUMN `insert_by`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL AFTER `executed_on`;

ALTER TABLE `vp_vendor_invoice_temp`
MODIFY COLUMN `approved_by`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '' AFTER `approval_status`,
MODIFY COLUMN `created_by`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL AFTER `date_created`,
MODIFY COLUMN `last_updated_by`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL AFTER `last_updated_on`,
MODIFY COLUMN `submitted_by`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '' AFTER `submitted_on`;

ALTER TABLE `vp_vendor_invoice_term`
MODIFY COLUMN `created_user`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL AFTER `date_created`,
MODIFY COLUMN `last_updated_by`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '' AFTER `last_updated_on`;

ALTER TABLE `vp_vendor_mst`
MODIFY COLUMN `created_by`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '' AFTER `date_created`,
MODIFY COLUMN `last_updated_by`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '' AFTER `last_updated_on`;

ALTER TABLE `vp_vendor_sync_mst`
MODIFY COLUMN `executed_by`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '' AFTER `attempts`,
MODIFY COLUMN `insert_by`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL AFTER `executed_on`;

ALTER TABLE `vp_vendor_temp`
MODIFY COLUMN `user_id`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '' AFTER `tax_code`,
MODIFY COLUMN `rejected_by`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '' AFTER `date_rejected`;





