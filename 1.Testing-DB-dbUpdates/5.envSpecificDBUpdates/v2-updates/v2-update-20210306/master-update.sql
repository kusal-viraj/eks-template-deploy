
ALTER TABLE `papertrl_active_current_logins` 
CHANGE COLUMN `created_date` `created_on` datetime(0) NOT NULL AFTER `ip_address`;





ALTER TABLE `papertrl_master_tenant` 
CHANGE COLUMN `last_updated_on` `update_on` datetime(0) NULL DEFAULT NULL AFTER `status`,
CHANGE COLUMN `last_updated_by` `update_by` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL AFTER `update_on`,
CHANGE COLUMN `date_created` `created_on` datetime(0) NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP AFTER `update_by`,
CHANGE COLUMN `created_user` `created_by` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '' AFTER `created_on`,
CHANGE COLUMN `deleted_on` `delete_on` datetime(0) NULL DEFAULT NULL AFTER `created_by`,
CHANGE COLUMN `deleted_by` `delete_by` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL AFTER `delete_on`;



ALTER TABLE `papertrl_package` 
CHANGE COLUMN `last_updated_on` `update_on` datetime(0) NULL DEFAULT NULL AFTER `status`,
CHANGE COLUMN `last_updated_by` `update_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL AFTER `update_on`,
CHANGE COLUMN `date_created` `created_on` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP AFTER `update_by`,
CHANGE COLUMN `created_user` `created_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '' AFTER `created_on`,
CHANGE COLUMN `deleted_on` `delete_on` datetime(0) NULL DEFAULT NULL AFTER `created_by`,
CHANGE COLUMN `deleted_by` `delete_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL AFTER `delete_on`;

ALTER TABLE `papertrl_package_change_history` 
CHANGE COLUMN `changed_by` `update_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL AFTER `new_package_id`,
CHANGE COLUMN `changed_on` `update_on` datetime(0) NULL AFTER `update_by`,
ADD COLUMN `created_by` varchar(100) NOT NULL AFTER `update_on`,
ADD COLUMN `created_on` datetime(0) NOT NULL AFTER `created_by`,
ADD COLUMN `delete_by` varchar(100) NULL AFTER `created_on`,
ADD COLUMN `delete_on` datetime(0) NULL AFTER `delete_by`;

ALTER TABLE `papertrl_package_change_request` 
CHANGE COLUMN `request_by` `created_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL AFTER `requester_name`,
CHANGE COLUMN `request_date` `created_on` datetime(0) NOT NULL AFTER `created_by`,
CHANGE COLUMN `approved_by` `update_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL AFTER `created_on`,
CHANGE COLUMN `approved_date` `update_on` datetime(0) NULL DEFAULT NULL AFTER `update_by`,
CHANGE COLUMN `deleted_by` `delete_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL AFTER `update_on`,
CHANGE COLUMN `deleted_date` `delete_on` datetime(0) NULL DEFAULT NULL AFTER `delete_by`;


ALTER TABLE `papertrl_support_db_server` 
MODIFY COLUMN `status` char(2) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL AFTER `password`,
MODIFY COLUMN `created_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL AFTER `status`,
ADD COLUMN `update_by` varchar(100) NULL AFTER `created_on`,
ADD COLUMN `update_on` datetime(0) NULL AFTER `update_by`,
ADD COLUMN `delete_by` varchar(100) NULL AFTER `update_on`,
ADD COLUMN `delete_on` datetime(0) NULL AFTER `delete_by`;

ALTER TABLE `papertrl_support_sftp_server` 
MODIFY COLUMN `status` char(2) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL AFTER `sudo_user_password`,
MODIFY COLUMN `created_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL AFTER `status`,
ADD COLUMN `update_by` varchar(100) NULL AFTER `created_on`,
ADD COLUMN `update_on` datetime(0) NULL AFTER `update_by`,
ADD COLUMN `delete_by` varchar(100) NULL AFTER `update_on`,
ADD COLUMN `delete_on` datetime(0) NULL AFTER `delete_by`;


ALTER TABLE `papertrl_system_privileges` 
CHANGE COLUMN `created_user` `created_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL AFTER `status`,
CHANGE COLUMN `date_created` `created_on` datetime(0) NOT NULL AFTER `created_by`,
ADD COLUMN `update_by` varchar(100) NULL AFTER `created_on`,
ADD COLUMN `update_on` datetime(0) NULL AFTER `update_by`,
ADD COLUMN `delete_by` varchar(100) NULL AFTER `update_on`,
ADD COLUMN `delete_on` datetime(0) NULL AFTER `delete_by`;

ALTER TABLE `papertrl_trial_config` 
CHANGE COLUMN `created_user` `created_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '' AFTER `status`,
CHANGE COLUMN `date_created` `created_on` datetime(0) NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP AFTER `created_by`,
CHANGE COLUMN `last_updated_by` `update_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL AFTER `created_on`,
CHANGE COLUMN `last_updated_on` `update_on` datetime(0) NULL DEFAULT NULL AFTER `update_by`,
CHANGE COLUMN `deleted_by` `delete_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL AFTER `update_on`,
CHANGE COLUMN `deleted_on` `delete_on` datetime(0) NULL DEFAULT NULL AFTER `delete_by`;




ALTER TABLE `tenant_system_privileges` 
CHANGE COLUMN `create_user` `created_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL AFTER `status`,
CHANGE COLUMN `date_created` `created_on` datetime(0) NOT NULL AFTER `created_by`,
ADD COLUMN `update_by` varchar(100) NULL AFTER `created_on`,
ADD COLUMN `update_on` datetime(0) NULL AFTER `update_by`,
ADD COLUMN `delete_by` varchar(100) NULL AFTER `update_on`,
ADD COLUMN `delete_on` datetime(0) NULL AFTER `delete_by`;

ALTER TABLE `tp_integration_detail` 
CHANGE COLUMN `created_date` `created_on` datetime(0) NOT NULL AFTER `created_by`,
MODIFY COLUMN `created_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL AFTER `integration_id`,
ADD COLUMN `update_by` varchar(100) NULL AFTER `created_on`,
ADD COLUMN `update_on` datetime(0) NULL AFTER `update_by`,
ADD COLUMN `delete_by` varchar(100) NULL AFTER `update_on`,
ADD COLUMN `delete_on` datetime(0) NULL AFTER `delete_by`;


ALTER TABLE `tp_integration_mst` 
CHANGE COLUMN `created_date` `created_on` datetime(0) NOT NULL AFTER `created_by`,
MODIFY COLUMN `created_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL AFTER `status`,
ADD COLUMN `update_by` varchar(100) NULL AFTER `papertrl_refresh_token_expires_on`,
ADD COLUMN `update_on` datetime(0) NULL AFTER `update_by`,
ADD COLUMN `delete_by` varchar(100) NULL AFTER `update_on`,
ADD COLUMN `delete_on` datetime(0) NULL AFTER `delete_by`;



ALTER TABLE `tp_integration_system` 
CHANGE COLUMN `created_date` `created_on` datetime(0) NOT NULL AFTER `created_by`,
MODIFY COLUMN `created_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL AFTER `status`,
ADD COLUMN `update_by` varchar(100) NULL AFTER `created_on`,
ADD COLUMN `update_on` datetime(0) NULL AFTER `update_by`,
ADD COLUMN `delete_by` varchar(100) NULL AFTER `update_on`,
ADD COLUMN `delete_on` datetime(0) NULL AFTER `delete_by`;




















