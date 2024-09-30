---------------Madhusha------2.5.143--------------

INSERT INTO `common_automation_document_type`(`id`, `document_type`, `short_code`, `status`, `show_hide_enable`, `automation_enable`, `automation_rule_enable`) VALUES (8, 'Credit Note', 'CREDIT_NOTE', 'A', 0, 0, 0);

INSERT INTO `common_automation_document_section_relation`(`document_id`, `section_id`) VALUES (8, 1);

INSERT INTO `common_automation_document_section_relation`(`document_id`, `section_id`) VALUES (8, 2);

CREATE TABLE `vp_credit_note_additional_data`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `field_value` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `field_id` int NOT NULL,
  `field_type_id` int NULL DEFAULT NULL,
  `field_name` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `section_id` int NOT NULL,
  `detail_id` int NULL DEFAULT NULL,
  `credit_note_id` int NOT NULL,
  `display_order` int NOT NULL,
  `multiple_status` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK__vp_purchase_order_mst`(`credit_note_id`) USING BTREE,
  INDEX `PO_ADDITIONAL_FIELD_TYPE_FK_1`(`field_type_id`) USING BTREE,
  CONSTRAINT `VP_CRED_NT_ADD_FK_ID` FOREIGN KEY (`field_type_id`) REFERENCES `common_additional_field_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `VP_CRED_NT_ID_FK_ID` FOREIGN KEY (`credit_note_id`) REFERENCES `vp_credit_note` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1902 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;


CREATE TABLE `vp_credit_note_additional_field_attachment`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `field_id` int NOT NULL,
  `credit_note_id` int NOT NULL,
  `attachment_url` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `file_name` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `file_type` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `status` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `delete_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '',
  `delete_on` datetime(0) NULL DEFAULT NULL,
  `field_name` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `section_id` int NOT NULL,
  `detail_id` int NULL DEFAULT NULL,
  `display_order` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `Fk_po_mst`(`credit_note_id`) USING BTREE,
  CONSTRAINT `ADD_ATT_FKD_1` FOREIGN KEY (`credit_note_id`) REFERENCES `vp_credit_note` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 147 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;



