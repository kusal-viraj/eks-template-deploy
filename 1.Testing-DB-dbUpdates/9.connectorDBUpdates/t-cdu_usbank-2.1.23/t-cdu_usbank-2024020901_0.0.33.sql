ALTER TABLE `payment_transaction` 
ADD COLUMN `bank_account_id` int NULL DEFAULT NULL AFTER `customer_id`,
ADD COLUMN `requester_data_id` int NULL DEFAULT NULL AFTER `bank_account_id`;


CREATE TABLE `payment_bank_account`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `routing_no` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `bank_id` int NULL DEFAULT NULL,
  `account_no` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `transit_no` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `account_nic_name` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `company_name` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `file_url` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `company_id` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;



DELETE FROM `payment_configuration`;
DELETE FROM `payment_customer_wise_config_value`;

