INSERT INTO `umm_menu`(`id`, `name`, `display_text`, `menu_style`, `url`, `tab`, `type`, `super_type`, `super_type_2`, `department`, `menu_order`, `display_icon`, `short_name`, `detail_text`, `status`, `portal_menu`, `individual_tenant_menu`, `vendor_community_menu`, `version`, `auth_code`, `slim_menu`, `hierachy`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (1049, 'Credit Note', 'Credit Note', 'fa fa-list-alt', '/home/credit-note', '0', 'S', 1015, NULL, 'Admin', 9, 'fa fa-list-alt', 'Credit Note', 'Credit Note', 'A', 0, 1, 0, 'V2', 'CREDIT_NOTE', 1, '1005,1015', 'System', '2022-04-15 14:39:10', NULL, NULL, NULL, NULL);


INSERT INTO `umm_menu_privilage`(`id`, `menu_id`, `privilage_id`, `auth_code`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (478, 1049, 1, 'CREDIT_NOTE_CREATE', 'System', '2022-04-15 15:00:32', NULL, NULL, NULL, NULL);

INSERT INTO `umm_menu_privilage`(`id`, `menu_id`, `privilage_id`, `auth_code`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (479, 1049, 2, 'CREDIT_NOTE_SEARCH', 'System', '2022-04-19 10:36:27', NULL, NULL, NULL, NULL);

INSERT INTO `umm_menu_privilage`(`id`, `menu_id`, `privilage_id`, `auth_code`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (480, 1049, 3, 'CREDIT_NOTE_DETAIL_VIEW', 'System', '2022-04-19 10:40:33', NULL, NULL, NULL, NULL);

INSERT INTO `umm_menu_privilage`(`id`, `menu_id`, `privilage_id`, `auth_code`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (481, 1049, 4, 'CREDIT_NOTE_EDIT', 'System', '2022-04-19 10:40:49', NULL, NULL, NULL, NULL);

INSERT INTO `umm_menu_privilage`(`id`, `menu_id`, `privilage_id`, `auth_code`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (482, 1049, 5, 'CREDIT_NOTE_DELETE', 'System', '2022-04-19 10:42:43', NULL, NULL, NULL, NULL);

INSERT INTO `umm_role_previlege`(`role_id`, `privilege_id`, `created_by`, `created_on`) VALUES (1, 1049, 'system', '2022-04-19 11:47:10');
INSERT INTO `umm_role_previlege`(`role_id`, `privilege_id`, `created_by`, `created_on`) VALUES (1, 478, 'system', '2022-04-19 11:39:40');
INSERT INTO `umm_role_previlege`(`role_id`, `privilege_id`, `created_by`, `created_on`) VALUES (1, 479, 'system', '2022-04-19 11:39:40');
INSERT INTO `umm_role_previlege`(`role_id`, `privilege_id`, `created_by`, `created_on`) VALUES (1, 480, 'system', '2022-04-19 11:39:40');
INSERT INTO `umm_role_previlege`(`role_id`, `privilege_id`, `created_by`, `created_on`) VALUES (1, 481, 'system', '2022-04-19 11:39:40');
INSERT INTO `umm_role_previlege`(`role_id`, `privilege_id`, `created_by`, `created_on`) VALUES (1, 482, 'system', '2022-04-19 11:39:40');


INSERT INTO `common_grid_template`(`id`, `grid_name`) VALUES (49, 'CREDIT_NOTE_LIST');

INSERT INTO `common_grid_column_template`(`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `column_order`) VALUES (49, 'action', 'Action', 1, 0, 0, 0, 0, 'center', 'actionButton', 1);

INSERT INTO `common_grid_column_template`(`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`) VALUES (49, 'creditNote.creditNoteNo', 'Credit Note Number', 1, 1, 1, 1, 1, 'left', 'input', 'Credit Note No.', 2);

INSERT INTO `common_grid_column_template`(`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`) VALUES (49, 'creditNote.creditNoteDate', 'Credit Note Date', 1, 1, 1, 1, 1, 'center', 'date', 'Credit Note date', 3);

INSERT INTO `common_grid_column_template`(`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`) VALUES (49, 'creditNote.vendorId', 'Vendor', 1, 1, 1, 1, 1, 'left', 'dropdown', 'Vendor', 4);

INSERT INTO `common_grid_column_template`(`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`) VALUES (49, 'creditNote.vendorEmail', 'Vendor Email', 1, 1, 1, 1, 1, 'left', 'input', 'Vendor Email', 5);

INSERT INTO `common_grid_column_template`(`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`) VALUES (49, 'creditNote.poId', 'Purchase Order', 1, 1, 1, 1, 1, 'left', 'dropdown', 'Purchase Order', 6);

INSERT INTO `common_grid_column_template`(`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`) VALUES (49, 'creditNote.creditTotal', 'Credit Total', 1, 1, 1, 1, 1, 'right', 'numeric', 'Credit Total', 7);

INSERT INTO `common_grid_column_template`(`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`) VALUES (49, 'creditNote.createdBy', 'Created By', 1, 1, 1, 1, 1, 'left', 'input', 'Created By', 8);

INSERT INTO `common_grid_column_template`(`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`) VALUES (49, 'creditNote.createdOn', 'Created Date', 1, 1, 1, 1, 1, 'center', 'date', 'Created Date', 9);


INSERT INTO `common_grid_state_template`(`grid_id`, `total_rows`, `column_widths`) VALUES (49, 10, '100,210,210,210,210,210,210,210,210');

ALTER TABLE `vp_bill` 
ADD COLUMN `credit_amount` decimal(19, 2) NULL DEFAULT NULL AFTER `statement_id`;


CREATE TABLE `vp_credit_note`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `credit_note_no` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `credit_note_date` datetime(0) NULL DEFAULT NULL,
  `community_id` int NULL DEFAULT NULL,
  `vendor_id` int NULL DEFAULT NULL,
  `vendor_email` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `po_id` int NULL DEFAULT NULL,
  `comment` varchar(500) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `credit_total` decimal(19, 2) NULL DEFAULT NULL,
  `created_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `created_on` datetime(0) NULL DEFAULT NULL,
  `update_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `update_on` datetime(0) NULL DEFAULT NULL,
  `delete_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `delete_on` datetime(0) NULL DEFAULT NULL,
  `status` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `created_by_name` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_CRED_VEN_ID`(`vendor_id`) USING BTREE,
  INDEX `FK_CRED_PO_ID`(`po_id`) USING BTREE,
  CONSTRAINT `FK_CRED_PO_ID` FOREIGN KEY (`po_id`) REFERENCES `vp_po_mst` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `FK_CRED_VEN_ID` FOREIGN KEY (`vendor_id`) REFERENCES `vp_vendor_mst` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;


CREATE TABLE `vp_credit_note_attachment`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `credit_note_id` int NOT NULL,
  `attachment_url` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `file_name` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `file_type` varchar(500) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `status` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `delete_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `delete_on` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_CRED_NT_ID`(`credit_note_id`) USING BTREE,
  CONSTRAINT `FK_CRED_NT_ID` FOREIGN KEY (`credit_note_id`) REFERENCES `vp_credit_note` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;


CREATE TABLE `vp_credit_note_item_details`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `credit_note_id` int NULL DEFAULT NULL,
  `item_number` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `vendor_item_number` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `item_name` varchar(300) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `description` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `qty` decimal(12, 2) NULL DEFAULT NULL,
  `uom_id` int NULL DEFAULT NULL,
  `unit_price` decimal(19, 2) NULL DEFAULT NULL,
  `amount` decimal(19, 2) NULL DEFAULT NULL,
  `product_id` int NULL DEFAULT NULL,
  `department_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_ITM_CRED_ID`(`credit_note_id`) USING BTREE,
  CONSTRAINT `FK_ITM_CRED_ID` FOREIGN KEY (`credit_note_id`) REFERENCES `vp_credit_note` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;


CREATE TABLE `vp_credit_note_relation`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `credit_note_id` int NULL DEFAULT NULL,
  `credit_note_no` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `bill_id` int NULL DEFAULT NULL,
  `applied_credit_amount` decimal(19, 2) NULL DEFAULT NULL,
  `created_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `created_on` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_CRED_ID`(`credit_note_id`) USING BTREE,
  INDEX `FK_BILL_CRED_ID`(`bill_id`) USING BTREE,
  CONSTRAINT `FK_BILL_CRED_ID` FOREIGN KEY (`bill_id`) REFERENCES `vp_bill` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `FK_CRED_ID` FOREIGN KEY (`credit_note_id`) REFERENCES `vp_credit_note` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;