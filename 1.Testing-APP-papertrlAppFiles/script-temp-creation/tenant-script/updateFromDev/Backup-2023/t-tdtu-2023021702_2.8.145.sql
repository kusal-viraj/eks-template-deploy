INSERT INTO `common_audit_trial_status`(`id`, `name`, `sort_order`, `icon`, `color`) VALUES (44, 'Transaction processing started', 16, 'fa fa-cogs', 'bg-blue');
INSERT INTO `common_audit_trial_status`(`id`, `name`, `sort_order`, `icon`, `color`) VALUES (45, 'Transaction submitted to payment system', 17, 'fa fa-check-square-o', 'bg-blue');
INSERT INTO `common_audit_trial_status`(`id`, `name`, `sort_order`, `icon`, `color`) VALUES (46, 'Transaction failed by payment system', 18, 'fa fa-exclamation-triangle', 'bg-red');
INSERT INTO `common_audit_trial_status`(`id`, `name`, `sort_order`, `icon`, `color`) VALUES (47, 'Transaction completed by payment system', 20, 'fa fa-check-circle-o', 'bg-green');


CREATE TABLE `vp_payment_transaction_audit_trial_data`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `audit_trial_id` int NOT NULL,
  `request` varchar(3000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `response` varchar(3000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `attempt` int NOT NULL,
  `created_on` date NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;
