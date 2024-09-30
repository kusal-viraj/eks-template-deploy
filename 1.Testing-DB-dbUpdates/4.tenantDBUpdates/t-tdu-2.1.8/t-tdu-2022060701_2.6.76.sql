--------------Madhusha------2.6.76------------

CREATE TABLE `vp_credit_card_statement_audit_trail`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_date` datetime(0) NOT NULL,
  `status_id` int NOT NULL,
  `user_id` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `user_name` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `header` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `comment` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `transaction_id` int NOT NULL,
  `undo_action` tinyint(1) NULL DEFAULT NULL,
  `automation_name` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;