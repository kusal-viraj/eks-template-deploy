
ALTER TABLE `vendor_approval_level_mst` DROP FOREIGN KEY `vendor_approval_level_mst_ibfk_1`;

ALTER TABLE `vendor_approval_level_mst` 
CHANGE COLUMN `created_date` `created_on` datetime(0) NOT NULL AFTER `created_by`,
MODIFY COLUMN `created_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL AFTER `wkflw_mst_id`,
ADD COLUMN `update_by` varchar(100) NULL AFTER `created_on`,
ADD COLUMN `update_on` datetime(0) NULL AFTER `update_by`,
ADD COLUMN `delete_by` varchar(100) NULL AFTER `update_on`,
ADD COLUMN `delete_on` datetime(0) NULL AFTER `delete_by`;





ALTER TABLE `vendor_email_mst` 
CHANGE COLUMN `insert_user` `created_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '' AFTER `attempts`,
CHANGE COLUMN `insert_date` `created_on` datetime(0) NOT NULL AFTER `created_by`,
ADD COLUMN `update_by` varchar(100) NOT NULL AFTER `created_on`,
ADD COLUMN `update_on` datetime(0) NULL AFTER `update_by`,
ADD COLUMN `delete_by` varchar(100) NULL AFTER `update_on`,
ADD COLUMN `delete_on` datetime(0) NULL AFTER `delete_by`;

ALTER TABLE `vendor_email_tmp` 
CHANGE COLUMN `insert_user` `created_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '' AFTER `invoice_id`,
CHANGE COLUMN `insert_date` `created_on` datetime(0) NOT NULL AFTER `created_by`,
ADD COLUMN `update_by` varchar(100) NULL AFTER `created_on`,
ADD COLUMN `update_on` datetime(0) NULL AFTER `update_by`,
ADD COLUMN `delete_by` varchar(100) NULL AFTER `update_on`,
ADD COLUMN `delete_on` datetime(0) NULL AFTER `delete_by`;


ALTER TABLE `vendor_import_mst` 
MODIFY COLUMN `created_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '' AFTER `failed`,
MODIFY COLUMN `created_on` datetime(0) NOT NULL AFTER `created_by`,
ADD COLUMN `update_by` varchar(100) NULL AFTER `created_on`,
ADD COLUMN `update_on` datetime(0) NULL AFTER `update_by`,
ADD COLUMN `delete_by` varchar(100) NULL AFTER `update_on`,
ADD COLUMN `delete_on` datetime(0) NULL AFTER `delete_by`;




ALTER TABLE `vendor_invoice` DROP FOREIGN KEY `PO_KEY_FK_1`;

ALTER TABLE `vendor_invoice` 
CHANGE COLUMN `date_created` `created_on` datetime(0) NOT NULL AFTER `original_file_name`,
CHANGE COLUMN `last_updated_on` `update_on` datetime(0) NULL AFTER `created_by`,
CHANGE COLUMN `last_updated_by` `update_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL AFTER `update_on`,
ADD COLUMN `delete_by` varchar(100) NULL AFTER `tenant_id`,
ADD COLUMN `delete_on` datetime(0) NULL AFTER `delete_by`;


ALTER TABLE `vendor_invoice_additional_field_attachments` 
CHANGE COLUMN `deleted_by` `delete_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '' AFTER `status`,
CHANGE COLUMN `deleted_on` `delete_on` datetime(0) NULL DEFAULT NULL AFTER `delete_by`;




ALTER TABLE `vendor_invoice_temp` 
CHANGE COLUMN `date_created` `created_on` datetime(0) NOT NULL AFTER `created_by`,
CHANGE COLUMN `last_updated_on` `update_on` datetime(0) NULL AFTER `created_on`,
CHANGE COLUMN `last_updated_by` `update_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL AFTER `update_on`,
ADD COLUMN `delete_by` varchar(100) NULL AFTER `po_id`,
ADD COLUMN `delete_on` datetime(0) NULL AFTER `delete_by`;


ALTER TABLE `vendor_invoice_template_mst` 
MODIFY COLUMN `created_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL AFTER `invoice_id`,
ADD COLUMN `update_by` varchar(100) NULL AFTER `created_on`,
ADD COLUMN `update_on` datetime(0) NULL AFTER `update_by`,
ADD COLUMN `delete_by` varchar(100) NULL AFTER `update_on`,
ADD COLUMN `delete_on` datetime(0) NULL AFTER `delete_by`;

ALTER TABLE `vendor_invoice_term` 
DROP COLUMN `date_created`,
CHANGE COLUMN `created_user` `created_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL AFTER `status`,
CHANGE COLUMN `last_updated_by` `update_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '' AFTER `created_by`,
CHANGE COLUMN `last_updated_on` `update_on` datetime(0) NULL DEFAULT NULL AFTER `update_by`,
ADD COLUMN `created_on` datetime(0) NOT NULL AFTER `created_by`,
ADD COLUMN `delete_by` varchar(100) NULL AFTER `update_on`,
ADD COLUMN `delete_on` datetime(0) NULL AFTER `delete_by`;

ALTER TABLE `vendor_menu` 
CHANGE COLUMN `created_user` `created_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '' AFTER `portal_menu`,
CHANGE COLUMN `date_created` `created_on` datetime(0) NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP AFTER `created_by`,
ADD COLUMN `update_by` varchar(100) NULL AFTER `created_on`,
ADD COLUMN `update_on` datetime(0) NULL AFTER `update_by`,
ADD COLUMN `delete_by` varchar(100) NULL AFTER `update_on`,
ADD COLUMN `delete_on` datetime(0) NULL AFTER `delete_by`;

ALTER TABLE `vendor_menu_privilage` 
CHANGE COLUMN `user_inserted` `created_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL AFTER `prililage_id`,
CHANGE COLUMN `data_created` `created_on` datetime(0) NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP AFTER `created_by`,
ADD COLUMN `update_by` varchar(100) NULL AFTER `created_on`,
ADD COLUMN `update_on` datetime(0) NULL AFTER `update_by`,
ADD COLUMN `delete_by` varchar(100) NULL AFTER `update_on`,
ADD COLUMN `delete_on` datetime(0) NULL AFTER `delete_by`;


ALTER TABLE `vendor_mst` 
CHANGE COLUMN `date_created` `created_on` datetime(0) NOT NULL AFTER `created_by`,
CHANGE COLUMN `last_updated_by` `update_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '' AFTER `created_on`,
CHANGE COLUMN `last_updated_on` `update_on` datetime(0) NULL DEFAULT NULL AFTER `update_by`,
MODIFY COLUMN `created_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '' AFTER `w9_form_url`,
ADD COLUMN `delete_by` varchar(100) NULL AFTER `web_url`,
ADD COLUMN `delete_on` datetime(0) NULL AFTER `delete_by`;


ALTER TABLE `vendor_outstanding_task` 
CHANGE COLUMN `last_update_by` `update_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '' AFTER `url`,
CHANGE COLUMN `last_update_on` `update_on` datetime(0) NULL DEFAULT NULL AFTER `update_by`,
MODIFY COLUMN `created_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '' AFTER `update_on`,
MODIFY COLUMN `created_on` datetime(0) NOT NULL AFTER `created_by`,
ADD COLUMN `delete_by` varchar(100) NULL AFTER `created_on`,
ADD COLUMN `delete_on` datetime(0) NULL AFTER `delete_by`;

ALTER TABLE `vendor_privilages` 
CHANGE COLUMN `date_created` `created_on` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP AFTER `text`,
CHANGE COLUMN `created_user` `created_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '' AFTER `created_on`,
ADD COLUMN `update_by` varchar(100) NULL AFTER `created_by`,
ADD COLUMN `update_on` datetime(0) NULL AFTER `update_by`,
ADD COLUMN `delete_by` varchar(100) NULL AFTER `update_on`,
ADD COLUMN `delete_on` datetime(0) NULL AFTER `delete_by`;

ALTER TABLE `vendor_role_mst` 
CHANGE COLUMN `date_created` `created_on` datetime(0) NOT NULL DEFAULT '0000-00-00 00:00:00' AFTER `vendor_id`,
CHANGE COLUMN `created_user` `created_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '' AFTER `created_on`,
CHANGE COLUMN `last_updated_on` `update_on` datetime(0) NULL DEFAULT '0000-00-00 00:00:00' AFTER `created_by`,
CHANGE COLUMN `last_updated_by` `update_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '' AFTER `update_on`,
ADD COLUMN `delete_on` datetime(0) NULL AFTER `update_by`,
ADD COLUMN `delete_by` varchar(100) NULL AFTER `delete_on`;

ALTER TABLE `vendor_role_previlege` 
CHANGE COLUMN `inserted_user` `created_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL AFTER `sub_account_id`,
CHANGE COLUMN `inserted_date` `created_on` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP AFTER `created_by`,
ADD COLUMN `update_by` varchar(100) NULL AFTER `created_on`,
ADD COLUMN `update_on` datetime(0) NULL AFTER `update_by`,
ADD COLUMN `delete_by` varchar(100) NULL AFTER `update_on`,
ADD COLUMN `delete_on` datetime(0) NULL AFTER `delete_by`;





ALTER TABLE `vendor_user_import_mst` 
MODIFY COLUMN `created_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '' AFTER `failed`,
MODIFY COLUMN `created_on` datetime(0) NOT NULL AFTER `created_by`,
ADD COLUMN `update_by` varchar(100) NULL AFTER `created_on`,
ADD COLUMN `update_on` datetime(0) NULL AFTER `update_by`,
ADD COLUMN `delete_by` varchar(100) NULL AFTER `update_on`,
ADD COLUMN `delete_on` datetime(0) NULL AFTER `delete_by`;


ALTER TABLE `vendor_user_mst` 
CHANGE COLUMN `date_created` `created_on` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP AFTER `password`,
CHANGE COLUMN `created_user` `created_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '' AFTER `created_on`,
CHANGE COLUMN `last_updated_on` `update_on` datetime(0) NULL DEFAULT NULL AFTER `pro_pic_name`,
CHANGE COLUMN `last_updated_by` `update_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '' AFTER `update_on`,
ADD COLUMN `delete_by` varchar(100) NULL AFTER `propic_id`,
ADD COLUMN `delete_on` datetime(0) NULL AFTER `delete_by`;

ALTER TABLE `vendor_user_notification` 
CHANGE COLUMN `date_created` `created_on` datetime(0) NOT NULL AFTER `style`;
































