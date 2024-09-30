----------Madhusha------2.4.95--------

CREATE TABLE `vp_po_price_variance`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `vendor_id` int NOT NULL,
  `vendor_name` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `price_variance` decimal(12, 0) NULL DEFAULT NULL,
  `is_percentage` tinyint(1) NULL DEFAULT 0,
  `status` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `created_username` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `created_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `created_on` datetime(0) NULL DEFAULT NULL,
  `update_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `update_on` datetime(0) NULL DEFAULT NULL,
  `delete_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `delete_on` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;


INSERT INTO `common_grid_template`(`grid_name`) VALUES ('PO_PRICE_VARIANCE_LIST');

INSERT INTO `common_grid_column_template`(`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `column_order`) VALUES (48, 'action', 'Action', 1, 0, 0, 0, 0, 'center', 'actionButton', 1);

INSERT INTO `common_grid_column_template`(`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`) VALUES (48, 'variance.vendorId', 'Vendor', 1, 1, 1, 1, 1, 'left', 'dropdown', 'Vendor', 2);

INSERT INTO `common_grid_column_template`(`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`) VALUES (48, 'variance.priceVariance', 'Variance', 1, 1, 1, 1, 1, 'right', 'numeric', 'Variance', 3);

INSERT INTO `common_grid_column_template`(`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`) VALUES (48, 'variance.createdUserName', 'Created By', 1, 1, 1, 1, 1, 'left', 'input', 'Created By', 4);

INSERT INTO `common_grid_column_template`(`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`) VALUES (48, 'variance.createdOn', 'Created Date', 1, 1, 1, 1, 1, 'center', 'date', 'Created Date', 5);

INSERT INTO `common_grid_state_template`(`grid_id`, `total_rows`, `column_widths`) VALUES (48, 15, '50,210,210,210,210');


INSERT INTO `umm_menu`(`id`, `name`, `display_text`, `menu_style`, `url`, `tab`, `type`, `super_type`, `super_type_2`, `department`, `menu_order`, `display_icon`, `short_name`, `detail_text`, `status`, `portal_menu`, `individual_tenant_menu`, `vendor_community_menu`, `version`, `auth_code`, `slim_menu`, `hierachy`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (1045, 'PO Price Variance Configuration', 'PO Price Variance Configuration', 'pi pi-money-bill', '/home/settings', '0', 'S', 1002, NULL, 'Admin', 13, 'pi pi-money-bill', 'PO Price Variance Configuration', 'PO Price Variance Configuration', 'A', 0, 1, 0, 'V2', 'PO_PRICE_VARIANCE_CONFIGURATION', 0, '1002,1014', 'System', '2022-02-17 21:38:28', NULL, NULL, NULL, NULL);

INSERT INTO `umm_menu_privilage`(`menu_id`, `privilage_id`, `auth_code`, `created_by`, `created_on`) VALUES (1045, 1, 'PO_PRICE_VARIANCE_CONFIGURATION_CREATE', 'System', '2022-02-17 13:58:31');

INSERT INTO `umm_menu_privilage`(`menu_id`, `privilage_id`, `auth_code`, `created_by`, `created_on`) VALUES (1045, 2, 'PO_PRICE_VARIANCE_CONFIGURATION_SEARCH', 'System', '2022-02-17 13:59:57');

INSERT INTO `umm_menu_privilage`(`menu_id`, `privilage_id`, `auth_code`, `created_by`, `created_on`) VALUES (1045, 4, 'PO_PRICE_VARIANCE_CONFIGURATION_EDIT', 'System', '2022-02-17 14:01:43');

INSERT INTO `umm_menu_privilage`(`menu_id`, `privilage_id`, `auth_code`, `created_by`, `created_on`) VALUES (1045, 5, 'PO_PRICE_VARIANCE_CONFIGURATION_DELETE', 'System', '2022-02-17 14:03:01');


INSERT INTO `umm_role_previlege`(`role_id`, `privilege_id`, `created_by`, `created_on`) VALUES (1, 1045, 'System', '2022-02-17 14:45:37');

INSERT INTO `umm_role_previlege`(`role_id`, `privilege_id`, `created_by`, `created_on`) VALUES (1, 459, 'System', '2022-02-17 14:47:10');

INSERT INTO `umm_role_previlege`(`role_id`, `privilege_id`, `created_by`, `created_on`) VALUES (1, 460, 'System', '2022-02-17 14:47:57');

INSERT INTO `umm_role_previlege`(`role_id`, `privilege_id`, `created_by`, `created_on`) VALUES (1, 461, 'System', '2022-02-17 14:47:57');

INSERT INTO `umm_role_previlege`(`role_id`, `privilege_id`, `created_by`, `created_on`) VALUES (1, 462, 'System', '2022-02-17 14:47:57');
