ALTER TABLE `payment_provider_for_customer` 
ADD COLUMN `base_url` varchar(300) NULL AFTER `status`;

ALTER TABLE `payment_transaction` 
ADD COLUMN `precise_pay` tinyint(1) NULL AFTER `payee_name`;

CREATE TABLE `payment_transaction_summary`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `transaction_id` int NOT NULL,
  `bill_number` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `payment_date_str` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `ref` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `txn_amount` decimal(11, 2) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;



