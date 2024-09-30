---danuddara-0.0.34----


SET FOREIGN_KEY_CHECKS = 0;
ALTER TABLE `payment_transaction` DROP FOREIGN KEY `fk_payment_transaction_bank_account`;
DROP TABLE IF EXISTS `payment_bank_account`;
CREATE TABLE `payment_bank_account`  (
  `record_id` int NOT NULL AUTO_INCREMENT,
  `id` int NULL DEFAULT NULL,
  `routing_no` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `bank_id` int NULL DEFAULT NULL,
  `account_no` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `transit_no` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `account_nic_name` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `company_name` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `file_url` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `company_id` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`record_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
