----------------2.1.78-------Dimuthu--------

SET FOREIGN_KEY_CHECKS=0;

INSERT INTO `umm_menu` (`id`, `name`, `display_text`, `menu_style`, `url`, `tab`, `type`, `super_type`, `super_type_2`, `department`, 
`menu_order`, `display_icon`, `short_name`, `detail_text`, `status`, `portal_menu`, `individual_tenant_menu`, `vendor_community_menu`, `version`, `auth_code`,
 `slim_menu`, `hierachy`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES ('1029', 'Payments', 'Payments', 'credit-card',
 '/home/payments', '0', 'S', '1015', NULL, 'Admin', '13', 'credit-card', 'Payments', 'Payments', 'A', '0', '1', '0', 'V2', 'PAYMENTS', '1', '1005,1015', 'System', '2021-08-18 15:02:46', NULL, NULL, NULL, NULL);

INSERT INTO `umm_menu_privilage` (`id`, `menu_id`, `privilage_id`, `auth_code`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) 
VALUES ('396', '1029', '1', 'PAYMENT_CREATE', 'System', '2021-08-18 15:05:52', NULL, NULL, NULL, NULL);


ALTER TABLE `vp_bill`
ADD COLUMN `paid_amount`  decimal(19,2) NULL DEFAULT NULL AFTER `delete_on`;

INSERT INTO `common_audit_trial_status` (`name`, `sort_order`, `icon`, `color`) VALUES ('Cancelled By', '14', 'fa fa-close', 'bg-red');