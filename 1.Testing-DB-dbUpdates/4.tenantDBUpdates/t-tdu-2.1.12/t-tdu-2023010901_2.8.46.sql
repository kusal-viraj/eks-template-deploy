-----hashila-2.8.46---------



CREATE TABLE `vp_payment_transaction_audit_trial`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_date` datetime NOT NULL,
  `status_id` int NOT NULL,
  `user_id` varchar(100) NULL,
  `user_name` varchar(200) NULL,
  `comment` varchar(300) NULL,
  `automation_name` varchar(300) NULL,
  `transaction_id` int NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `VP_PAYMENT_TRANSACTION_AUDIT_TRIAL_FK` FOREIGN KEY (`transaction_id`) REFERENCES `vp_payment_batch_bill_wise_transaction` (`id`)
);
