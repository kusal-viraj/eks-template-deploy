-------------Madhusha----2.5.126---------

ALTER TABLE `vp_credit_note_relation` 
ADD COLUMN `vendor_id` int NULL AFTER `applied_credit_amount`;

ALTER TABLE `vp_credit_note` 
ADD COLUMN `credit_balance` decimal(19, 2) NULL AFTER `credit_total`;

ALTER TABLE `hst_vp_bill` 
ADD COLUMN `credit_amount` decimal(19, 2) NULL AFTER `statement_id`;

ALTER TABLE `vp_credit_note` 
ADD COLUMN `tax_amount` decimal(19, 2) NULL AFTER `credit_balance`;

ALTER TABLE `vp_credit_note_item_details` 
DROP COLUMN `department_id`;

UPDATE `common_grid_state_template` SET `total_rows` = 15 WHERE `grid_id` = 49;

CREATE TABLE `hst_vp_credit_note_relation`  (
  `recode_id` int NOT NULL AUTO_INCREMENT,
  `id` int NOT NULL,
  `credit_note_id` int NULL DEFAULT NULL,
  `credit_note_no` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `bill_id` int NULL DEFAULT NULL,
  `applied_credit_amount` decimal(19, 2) NULL DEFAULT NULL,
  `vendor_id` int NULL DEFAULT NULL,
  `created_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `created_on` datetime(0) NULL DEFAULT NULL,
  `hst_recode_id` int NOT NULL,
  PRIMARY KEY (`recode_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

