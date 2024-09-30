ALTER TABLE `ar_client_mst`
MODIFY COLUMN `created_by`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL AFTER `status`,
MODIFY COLUMN `last_updated_by`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '' AFTER `last_updated_on`,
MODIFY COLUMN `last_deleted_by`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '' AFTER `last_deleted_on`;

ALTER TABLE `ar_opportunity`
MODIFY COLUMN `created_by`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL AFTER `cc_list`,
MODIFY COLUMN `last_updated_by`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL AFTER `created_on`,
MODIFY COLUMN `deleted_by`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '' AFTER `last_updated_on`,
MODIFY COLUMN `approved_by`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '' AFTER `status`,
MODIFY COLUMN `first_level_approver`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '' AFTER `approved_date`;

ALTER TABLE `ar_opportunity_attachment`
MODIFY COLUMN `deleted_by`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '' AFTER `status`;

ALTER TABLE `ar_project`
MODIFY COLUMN `created_by`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL AFTER `contract_type_id`,
MODIFY COLUMN `last_updated_by`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '' AFTER `created_on`,
MODIFY COLUMN `deleted_by`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '' AFTER `last_updated_on`,
MODIFY COLUMN `approved_by`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '' AFTER `status`,
MODIFY COLUMN `first_level_approver`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '' AFTER `approved_date`;

ALTER TABLE `ar_project_attachment`
MODIFY COLUMN `deleted_by`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '' AFTER `status`;

ALTER TABLE `ar_project_audit_trial`
MODIFY COLUMN `user_id`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL AFTER `status_id`;

ALTER TABLE `ar_proposal`
MODIFY COLUMN `created_by`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL AFTER `cc_list`,
MODIFY COLUMN `last_updated_by`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL AFTER `created_on`,
MODIFY COLUMN `deleted_by`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '' AFTER `last_updated_on`,
MODIFY COLUMN `approved_by`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '' AFTER `status`,
MODIFY COLUMN `first_level_approver`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '' AFTER `approved_date`;

ALTER TABLE `ar_proposal_attachment`
MODIFY COLUMN `deleted_by`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '' AFTER `status`;

ALTER TABLE `ar_proposal_audit_trial`
MODIFY COLUMN `user_id`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL AFTER `status_id`;

ALTER TABLE `common_additional_field`
MODIFY COLUMN `deleted_by`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '' AFTER `value`;

ALTER TABLE `common_approval_code`
MODIFY COLUMN `created_by`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL AFTER `expense_category_id`,
MODIFY COLUMN `updated_by`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '' AFTER `status`;

ALTER TABLE `common_approval_code_import_mst`
MODIFY COLUMN `created_by`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '' AFTER `failed`;

ALTER TABLE `common_chart_of_account`
MODIFY COLUMN `created_by`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL AFTER `classification`,
MODIFY COLUMN `updated_by`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '' AFTER `created_date`;

ALTER TABLE `common_chart_of_account_import_mst`
MODIFY COLUMN `created_by`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL AFTER `failed`;

ALTER TABLE `common_chart_of_account_sync`
MODIFY COLUMN `executed_by`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '' AFTER `attempts`,
MODIFY COLUMN `insert_by`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL AFTER `executed_on`;

ALTER TABLE `common_email_mst`
MODIFY COLUMN `insert_user`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '' AFTER `insert_date`;

ALTER TABLE `common_email_tmp`
MODIFY COLUMN `insert_user`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '' AFTER `invoice_id`;

ALTER TABLE `common_employee`
MODIFY COLUMN `created_by`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL AFTER `status`,
MODIFY COLUMN `last_updated_by`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' AFTER `last_updated_on`;

ALTER TABLE `common_employee_import_mst`
MODIFY COLUMN `created_by`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '' AFTER `failed`;

ALTER TABLE `common_message`
MODIFY COLUMN `from_user_name`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL AFTER `content`,
MODIFY COLUMN `to_user_name`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL AFTER `from_name`;

ALTER TABLE `common_outstanding_task`
MODIFY COLUMN `last_update_by`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '' AFTER `url`,
MODIFY COLUMN `created_by`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '' AFTER `last_update_on`;

ALTER TABLE `common_product_category`
MODIFY COLUMN `created_by`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL AFTER `status`;

ALTER TABLE `common_product_import_mst`
MODIFY COLUMN `created_by`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL AFTER `failed`;

ALTER TABLE `common_product_mst`
MODIFY COLUMN `created_by`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL AFTER `expense_account`,
MODIFY COLUMN `updated_by`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '' AFTER `vendor_id`;

ALTER TABLE `common_product_sync_mst`
MODIFY COLUMN `executed_by`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '' AFTER `attemps`,
MODIFY COLUMN `insert_by`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL AFTER `executed_on`;

ALTER TABLE `common_system_sync_property`
MODIFY COLUMN `created_by`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL AFTER `created_on`;

ALTER TABLE `common_user_log`
MODIFY COLUMN `user_name`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL AFTER `ip_address`;

ALTER TABLE `object_sync_mst`
MODIFY COLUMN `executed_by`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '' AFTER `attempts`,
MODIFY COLUMN `insert_by`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL AFTER `executed_on`;

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
MODIFY COLUMN `user_name`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '' AFTER `role_id`,
MODIFY COLUMN `created_user`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '' AFTER `date_created`,
MODIFY COLUMN `last_updated_by`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '' AFTER `last_updated_on`;

ALTER TABLE `umm_user_role`
MODIFY COLUMN `assigned_user`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '' AFTER `user_id`,
MODIFY COLUMN `last_updated_by`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '' AFTER `last_updated_on`;

ALTER TABLE `umm_user_role_hst`
MODIFY COLUMN `assigned_user`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '' AFTER `user_id`;

ALTER TABLE `vp_app_wkflw_mst`
MODIFY COLUMN `created_by`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL AFTER `name`,
MODIFY COLUMN `last_updated_by`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL AFTER `last_updated_on`,
MODIFY COLUMN `deleted_by`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '' AFTER `deleted_on`;

ALTER TABLE `vp_approval_level_mst`
MODIFY COLUMN `created_by`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL AFTER `id`;

ALTER TABLE `vp_check_mst`
MODIFY COLUMN `uploaded_by`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL AFTER `check_status`;

ALTER TABLE `vp_expense_additional_field_attachments`
MODIFY COLUMN `deleted_by`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '' AFTER `status`;

ALTER TABLE `vp_expense_attachments`
MODIFY COLUMN `deleted_by`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '' AFTER `status`;

ALTER TABLE `vp_expense_mst`
MODIFY COLUMN `creator_name`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '' AFTER `id`,
MODIFY COLUMN `created_by`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL AFTER `first_level_approver`,
MODIFY COLUMN `last_updated_by`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '' AFTER `created_on`,
MODIFY COLUMN `deleted_by`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '' AFTER `last_updated_on`,
MODIFY COLUMN `approved_by`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '' AFTER `deleted_on`;

ALTER TABLE `vp_expense_type`
MODIFY COLUMN `created_by`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '' AFTER `status`;

ALTER TABLE `vp_grn_additional_field_attachments`
MODIFY COLUMN `deleted_by`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '' AFTER `status`;

ALTER TABLE `vp_grn_attachment`
MODIFY COLUMN `deleted_by`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '' AFTER `status`;

ALTER TABLE `vp_grn_mst`
MODIFY COLUMN `created_by`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL AFTER `total_amount`,
MODIFY COLUMN `deleted_by`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '' AFTER `created_on`,
MODIFY COLUMN `last_updated_by`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '' AFTER `deleted_on`;

ALTER TABLE `vp_invoice_check_sync_mst`
MODIFY COLUMN `executed_by`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL AFTER `sync_status`;

ALTER TABLE `vp_invoice_payment_sync_mst`
MODIFY COLUMN `executed_by`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '' AFTER `attempts`,
MODIFY COLUMN `insert_by`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL AFTER `executed_on`;

ALTER TABLE `vp_invoice_payment_untagged`
MODIFY COLUMN `sync_user`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL AFTER `sync_date`;

ALTER TABLE `vp_invoice_template_mst`
MODIFY COLUMN `created_by`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL AFTER `created_on`;

ALTER TABLE `vp_payment_additional_field_attachments`
MODIFY COLUMN `deleted_by`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '' AFTER `status`;

ALTER TABLE `vp_payment_import_mst`
MODIFY COLUMN `created_by`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '' AFTER `failed`;

ALTER TABLE `vp_purchase_order_additional_field_attachments`
MODIFY COLUMN `deleted_by`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '' AFTER `status`;

ALTER TABLE `vp_purchase_order_attachment`
MODIFY COLUMN `deleted_by`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '' AFTER `status`;

ALTER TABLE `vp_purchase_order_audit_trail`
MODIFY COLUMN `user_id`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL AFTER `status_id`;

ALTER TABLE `vp_purchase_order_mst`
MODIFY COLUMN `creator_name`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '' AFTER `id`,
MODIFY COLUMN `created_by`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL AFTER `creator_name`,
MODIFY COLUMN `last_updated_by`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '' AFTER `last_updated_on`,
MODIFY COLUMN `deleted_by`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '' AFTER `deleted_on`,
MODIFY COLUMN `approved_by`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '' AFTER `notes`,
MODIFY COLUMN `first_level_approver`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '' AFTER `approved_by`;

ALTER TABLE `vp_vendor_import_mst`
MODIFY COLUMN `created_by`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '' AFTER `failed`;

ALTER TABLE `vp_vendor_invitation`
MODIFY COLUMN `email_address`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL AFTER `id`,
MODIFY COLUMN `vendor_name`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL AFTER `email_address`,
MODIFY COLUMN `invited_by`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '' AFTER `status`;

ALTER TABLE `vp_vendor_invoice`
MODIFY COLUMN `created_by`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL AFTER `date_created`,
MODIFY COLUMN `last_updated_by`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL AFTER `last_updated_on`,
MODIFY COLUMN `submitted_by`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '' AFTER `submitted_on`,
MODIFY COLUMN `approved_by`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '' AFTER `applicable_discount_amount`;

ALTER TABLE `vp_vendor_invoice_additional_field_attachments`
MODIFY COLUMN `deleted_by`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '' AFTER `status`;

ALTER TABLE `vp_vendor_invoice_assignees`
MODIFY COLUMN `assignee`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL AFTER `id`;

ALTER TABLE `vp_vendor_invoice_audit_trail`
MODIFY COLUMN `user_id`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL AFTER `status_id`;

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
MODIFY COLUMN `user_id`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '' AFTER `id`,
MODIFY COLUMN `approved_by`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '' AFTER `user_id`,
MODIFY COLUMN `created_by`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL AFTER `date_created`,
MODIFY COLUMN `last_updated_by`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL AFTER `last_updated_on`;

ALTER TABLE `vp_vendor_temp`
MODIFY COLUMN `user_id`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL AFTER `tax_code`,
MODIFY COLUMN `rejected_by`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '' AFTER `date_rejected`;





