-----------Dhanuddara------2.7.63------------

CREATE TABLE `payment_account_config`  (
  `id` int NOT NULL,
  `provider_for_customer_id` int NOT NULL,
  `payment_type_id` int NOT NULL,
  `bank_account_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `provider_customer`(`provider_for_customer_id`) USING BTREE,
  INDEX `payment_type`(`payment_type_id`) USING BTREE,
  CONSTRAINT `payment_type` FOREIGN KEY (`payment_type_id`) REFERENCES `payment_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `provider_customer` FOREIGN KEY (`provider_for_customer_id`) REFERENCES `payment_provider_for_customer` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;
