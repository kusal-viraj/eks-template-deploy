---------2.6.21---Madusha-------------

CREATE TABLE `vendor_credit_note`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `credit_note_no` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `credit_note_date` datetime(0) NULL DEFAULT NULL,
  `tenant_id` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `vendor_id` int NULL DEFAULT NULL,
  `customer_email` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `po_id` int NULL DEFAULT NULL,
  `comment` varchar(500) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `credit_total` decimal(19, 2) NULL DEFAULT NULL,
  `credit_balance` decimal(19, 2) NULL DEFAULT NULL,
  `tax_amount` decimal(19, 2) NULL DEFAULT NULL,
  `created_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `created_on` datetime(0) NULL DEFAULT NULL,
  `update_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `update_on` datetime(0) NULL DEFAULT NULL,
  `delete_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `delete_on` datetime(0) NULL DEFAULT NULL,
  `status` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `created_by_name` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `credit_note_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_CRED_VEN_ID`(`vendor_id`) USING BTREE,
  INDEX `FK_CRED_PO_ID`(`po_id`) USING BTREE,
  CONSTRAINT `FK_CRED_PO_ID` FOREIGN KEY (`po_id`) REFERENCES `vendor_po_mst` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_CRED_VEN_ID` FOREIGN KEY (`vendor_id`) REFERENCES `vendor_mst` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;