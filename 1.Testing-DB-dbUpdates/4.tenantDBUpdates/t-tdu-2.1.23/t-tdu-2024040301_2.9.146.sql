--dasindu 2.9.146--



INSERT INTO `umm_menu` (`id`, `name`, `display_text`, `menu_style`, `url`, `tab`, `type`, `super_type`, `super_type_2`, `department`, `menu_order`, `display_icon`, `short_name`, `detail_text`, `status`, `portal_menu`, `individual_tenant_menu`, `vendor_community_menu`, `mobile_menu`, `version`, `auth_code`, `slim_menu`, `hierachy`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (1063, 'Integrated Payables', 'Integrated Payables', 'fa fa-credit-card', '/home/payments', '0', 'S', 1029, NULL, 'Admin', 5, 'fa fa-credit-card', 'Integrated Payables', 'Integrated Payables', 'A', 0, 1, 0, 0, 'V2', 'INTEGRATED_PAYABLES', 0, '1029', 'System', '2024-04-03 13:55:39', NULL, NULL, NULL, NULL);

INSERT INTO `umm_menu` (`id`, `name`, `display_text`, `menu_style`, `url`, `tab`, `type`, `super_type`, `super_type_2`, `department`, `menu_order`, `display_icon`, `short_name`, `detail_text`, `status`, `portal_menu`, `individual_tenant_menu`, `vendor_community_menu`, `mobile_menu`, `version`, `auth_code`, `slim_menu`, `hierachy`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (1064, 'Payments', 'Payments', 'fa fa-credit-card', '/home/payments', '0', 'S', 1029, NULL, 'Admin', 4, 'fa fa-credit-card', 'Payments', 'Payments', 'A', 0, 1, 0, 0, 'V2', 'PAYMENT', 0, '1029', 'System', '2024-04-03 13:58:13', NULL, NULL, NULL, NULL);

INSERT INTO `umm_privilages` (`id`, `url`, `text`, `auth_code`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (159, 'Payment Request Upload', 'Payment Request Upload', 'PAYMENT_REQUEST_UPLOAD', 'System', '2024-04-03 12:57:00', NULL, NULL, NULL, NULL);

UPDATE `umm_menu_privilage` SET `menu_id`=1063, `privilage_id`=159 WHERE `auth_code`='PAYMENT_PROCESS_PAYMENT_REQUEST_UPLOAD';
UPDATE `umm_menu_privilage` SET `menu_id`=1064 WHERE `menu_id`=1029;

INSERT INTO `common_grid_column_template` (`grid_id`, `field`, `sortable_field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `filter_show`, `is_frozen`, `frozen_direction`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `column_width`, `drop_down_url_id`) VALUES (73, 'pPaymentReq.batchId', 'pPaymentReq.batchId', 'Batch Id', 0, 0, 0, 0, 0, 1, 0, NULL, 'left', 'input', 'Batch Id', 9, NULL, 160, NULL);