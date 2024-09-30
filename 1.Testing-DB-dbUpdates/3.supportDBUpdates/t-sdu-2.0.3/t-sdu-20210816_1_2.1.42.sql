---------------------------------niron/hashila------------------------------------

INSERT INTO `umm_menu` (`id`, `name`, `display_text`, `menu_style`, `url`, `tab`, `type`, `super_type`, `super_type_2`, `department`, `menu_order`, `display_icon`, `short_name`, `detail_text`, `status`, `portal_menu`, `individual_tenant_menu`, `vendor_community_menu`, `version`, `auth_code`, `slim_menu`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`, `hierachy`) VALUES (1014, 'Payment Types', 'Payment Types', 'fa fa-credit-card', 'payment-types', '', 'S', 1002, NULL, 'Admin', 0, 'fa fa-credit-card', 'Payment Types', 'Payment Types', 'A', 0, 1, 0, 'V2', 'PAYMENT_TYPES', 1, 'System', '2021-08-06 15:58:45', NULL, NULL, NULL, NULL, '1002');

INSERT INTO `umm_menu_privilage` (`id`, `menu_id`, `privilage_id`, `auth_code`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (32, 1014, 1, 'PAYMENT_TYPES_CREATE', 'System', '2021-08-06 12:37:52', NULL, NULL, NULL, NULL);

INSERT INTO `umm_menu_privilage` (`id`, `menu_id`, `privilage_id`, `auth_code`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (33, 1014, 2, 'PAYMENT_TYPES_SEARCH', 'System', '2021-08-06 12:38:37', NULL, NULL, NULL, NULL);

INSERT INTO `umm_menu_privilage` (`id`, `menu_id`, `privilage_id`, `auth_code`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (34, 1014, 14, 'PAYMENT_TYPES_ACTIVATE', 'System', '2021-08-06 12:39:36', NULL, NULL, NULL, NULL);

INSERT INTO `umm_menu_privilage` (`id`, `menu_id`, `privilage_id`, `auth_code`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (36, 1014, 13, 'PAYMENT_TYPES_INACTIVATE', 'System', '2021-08-06 12:40:11', NULL, NULL, NULL, NULL);

INSERT INTO `umm_menu_privilage` (`id`, `menu_id`, `privilage_id`, `auth_code`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (37, 1014, 4, 'PAYMENT_TYPES_EDIT', 'System', '2021-08-06 12:40:47', NULL, NULL, NULL, NULL);






INSERT INTO `common_grid_template` (`id`, `grid_name`) VALUES (11, 'PAYMENT_TYPE_LIST');

INSERT INTO `common_grid_column_template` (`id`, `grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (58, 11, 'pay.name', 'Payment Type', 1, 1, 1, 1, 1, 'left', 'input', 'Payment Type', 2, NULL, '');
INSERT INTO `common_grid_column_template` (`id`, `grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (59, 11, 'action', 'Action', 1, 0, 0, 0, 0, 'center', 'actionButton', '', 1, NULL, '');
INSERT INTO `common_grid_column_template` (`id`, `grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (60, 11, 'pay.description', 'Description', 1, 1, 1, 1, 1, 'left', 'input', 'Description', 3, NULL, '');
INSERT INTO `common_grid_column_template` (`id`, `grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (61, 11, 'pay.status', 'Status', 1, 1, 1, 1, 1, 'center', 'dropdown', 'Status', 4, 2, '');
INSERT INTO `common_grid_column_template` (`id`, `grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (62, 11, 'pay.createdOn', 'Created Date', 1, 1, 1, 1, 1, 'center', 'date', 'Created Date', 5, NULL, '');
INSERT INTO `common_grid_column_template` (`id`, `grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (63, 11, 'pay.createdBy', 'Created User', 1, 1, 1, 1, 1, 'left', 'input', 'Created User', 6, NULL, '');

INSERT INTO `common_grid_filter_template` (`id`, `grid_id`, `drop_down_id`, `field`, `header`, `search_type`) VALUES (1, 11, NULL, 'name', 'Payment Type', 'input');
INSERT INTO `common_grid_filter_template` (`id`, `grid_id`, `drop_down_id`, `field`, `header`, `search_type`) VALUES (2, 11, NULL, 'description', 'Description', 'input');
INSERT INTO `common_grid_filter_template` (`id`, `grid_id`, `drop_down_id`, `field`, `header`, `search_type`) VALUES (3, 11, 2, 'status', 'Status', 'dropdown');
INSERT INTO `common_grid_filter_template` (`id`, `grid_id`, `drop_down_id`, `field`, `header`, `search_type`) VALUES (4, 11, NULL, 'createdBy', 'Submitted User', 'input');
INSERT INTO `common_grid_filter_template` (`id`, `grid_id`, `drop_down_id`, `field`, `header`, `search_type`) VALUES (5, 11, NULL, 'createdOn', 'Submitted Date', 'date');

INSERT INTO `common_grid_state_template` (`id`, `grid_id`, `start_from`, `total_rows`, `column_widths`) VALUES (10, 11, 0, 15, '100,210,210,210,210,210');

