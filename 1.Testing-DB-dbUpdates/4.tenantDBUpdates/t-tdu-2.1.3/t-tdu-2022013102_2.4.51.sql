--------Amal---2.4.51----------------

INSERT INTO `common_grid_template` (`id`, `grid_name`) VALUES ('47', 'PROJECT_CODE_BILLS');

INSERT INTO `common_grid_column_template` (`id`, `grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (482, 47, 'code.vendorName', 'Vendor', 1, 1, 0, 1, 0, 'center', 'dropdown', 'Vendor', 1, NULL, '');
INSERT INTO `common_grid_column_template` (`id`, `grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (483, 47, 'code.billNo', 'Bill Number', 1, 1, 0, 1, 0, 'center', 'input', 'Bill No.', 2, NULL, '');
INSERT INTO `common_grid_column_template` (`id`, `grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (484, 47, 'code.billDate', 'Bill Date', 1, 1, 0, 1, 0, 'center', 'date', 'Bill Date', 3, NULL, '');
INSERT INTO `common_grid_column_template` (`id`, `grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (485, 47, 'code.allocatedAmount', 'Allocated Amount', 1, 1, 0, 1, 0, 'center', 'input', 'Allocated Amount', 4, NULL, '');

INSERT INTO `common_grid_state_template` (`id`, `grid_id`, `start_from`, `total_rows`, `column_widths`) VALUES (47, 47, 0, 10, '210,210,210,210');


INSERT INTO `umm_privilages` (`id`, `url`, `text`, `auth_code`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (117, 'Detail View', 'Detail View', 'PROJECT_CODES_DETAIL_VIEW', 'System', '2022-01-05 14:40:28', NULL, NULL, NULL, NULL);
INSERT INTO `umm_menu_privilage` (`id`, `menu_id`, `privilage_id`, `auth_code`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (458, 1010, 117, 'PROJECT_CODES_DETAIL_VIEW', 'System', '2022-01-31 18:53:03', NULL, NULL, NULL, NULL);
INSERT INTO `umm_role_previlege` (`role_id`, `privilege_id`, `sub_account_id`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (1, 458, NULL, 'System', '2022-01-31 18:51:26', NULL, NULL, NULL, NULL);

