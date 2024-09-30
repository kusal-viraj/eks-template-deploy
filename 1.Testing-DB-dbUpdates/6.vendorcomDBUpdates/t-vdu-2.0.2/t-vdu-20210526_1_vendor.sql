UPDATE `vendor_grid_column_template` SET `grid_id` = 7, `field` = 'vi.invoiceNo', `header` = 'Invoice No', `column_show` = 1, `is_sortable` = 1, `is_re_orderable` = 1, `is_re_sizable` = 1, `can_hide` = 1, `align` = 'left', `search_type` = 'input', `placeholder` = 'Invoice No.', `column_order` = 7, `drop_down_id` = NULL, `drop_down_url` = '' WHERE `id` = 237;
UPDATE `vendor_grid_column_template` SET `grid_id` = 7, `field` = 'vi.invoiceAmount', `header` = 'Invoice Amount', `column_show` = 1, `is_sortable` = 1, `is_re_orderable` = 1, `is_re_sizable` = 1, `can_hide` = 1, `align` = 'right', `search_type` = 'numeric', `placeholder` = 'Invoice Amount', `column_order` = 8, `drop_down_id` = NULL, `drop_down_url` = '' WHERE `id` = 238;
UPDATE `vendor_grid_column_template` SET `grid_id` = 7, `field` = 'vi.invoiceDate', `header` = 'Invoice Date', `column_show` = 1, `is_sortable` = 1, `is_re_orderable` = 1, `is_re_sizable` = 1, `can_hide` = 1, `align` = 'center', `search_type` = 'date', `placeholder` = 'Invoice Date', `column_order` = 9, `drop_down_id` = NULL, `drop_down_url` = '' WHERE `id` = 240;
DELETE FROM `vendor_grid_column_template` WHERE `id` = 210;

INSERT INTO `vendor_grid_column_template`(`id`, `grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (250, 7, 'chk.exportStatus', 'Export Status', 1, 0, 0, 0, 1, 'center', 'dropdown', 'Export Status', 12, 7, '');
UPDATE `vendor_grid_state_template` SET `column_widths` = '100,210,210,210,210,210,210,210,210,210,210,210' WHERE `id` = 7;
UPDATE `vendor_grid_state_template` SET `column_widths` = '126,200,200,200,200,200,200,200,200,200,200,200,200,200,200,200,200,200,200,200' WHERE `id` = 5;

DELETE FROM `vendor_grid_column_user_wice`;
DELETE FROM `vendor_grid_state_user_wice`;

CREATE TABLE `vendor_invoice_payment`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `payment_referance_no` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `payment_date` datetime(0) NOT NULL,
  `payment_type` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `payment_type_description` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `invoice_id` int NOT NULL,
  `bill_id` int NOT NULL,
  `bill_payment_id` int NOT NULL,
  `amount` decimal(19, 2) NOT NULL,
  `discount_amount` decimal(19, 2) NOT NULL,
  `status` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `bill_no` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '',
  `tenant_id` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `export_status` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `update_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `update_on` datetime(0) NULL DEFAULT NULL,
  `created_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `created_on` datetime(0) NOT NULL,
  `delete_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `delete_on` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `invoice_id`(`bill_id`) USING BTREE,
  INDEX `FK_INVOICE_ID`(`invoice_id`) USING BTREE,
  CONSTRAINT `FK_INVOICE_ID` FOREIGN KEY (`invoice_id`) REFERENCES `vendor_invoice` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;
