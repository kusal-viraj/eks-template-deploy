------------Hashila----------2.1.101-------------------


UPDATE `common_grid_column_template` SET `grid_id` = 32, `field` = 'vendor.name', `header` = 'Vendor', `column_show` = 1, `is_sortable` = 1, `is_re_orderable` = 1, `is_re_sizable` = 1, `can_hide` = 1, `align` = 'left', `search_type` = 'multiSelect', `placeholder` = 'Vendor', `column_order` = 4, `drop_down_id` = NULL, `drop_down_url` = '' WHERE `id` = 314;

INSERT INTO `umm_privilages` (`id`, `url`, `text`, `auth_code`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (101, 'View Summary', 'View Summary', 'VIEW_SUMMARY', 'System', '2021-09-13 14:30:38', NULL, NULL, NULL, NULL);
		    
INSERT INTO `umm_menu_privilage` (`menu_id`, `privilage_id`, `auth_code`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (1029, 101, 'PAYMENT_VIEW_SUMMARY', 'System', '2021-09-13 14:32:12', NULL, NULL, NULL, NULL);

INSERT INTO `umm_menu_privilage` (`menu_id`, `privilage_id`, `auth_code`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (1029, 10, 'PAYMENT_VIEW_AUDIT_TRIAL', 'System', '2021-09-13 14:27:21', NULL, NULL, NULL, NULL);

