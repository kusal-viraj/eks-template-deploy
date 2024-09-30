CREATE TABLE `vp_credit_card_statement`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `file_name` varchar(200) NOT NULL,
  `attachment_url` varchar(300) NOT NULL,
  `created_by` varchar(100) NOT NULL,
  `created_on` datetime(0) NOT NULL,
  PRIMARY KEY (`id`)
);

ALTER TABLE `vp_bill` 
ADD COLUMN `statement_id` int NULL AFTER `ocr_running_date`,
ADD CONSTRAINT `STATEMENT_ID_FK` FOREIGN KEY (`statement_id`) REFERENCES `vp_credit_card_statement` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE `hst_vp_bill` 
ADD COLUMN `statement_id` int NULL AFTER `ocr_running_date`,
ADD CONSTRAINT `STATEMENT_ID_FK_2` FOREIGN KEY (`statement_id`) REFERENCES `vp_credit_card_statement` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE `vp_bill_expense_cost_distribution` 
ADD COLUMN `receipt_url` varchar(300) NULL AFTER `department_id`,
ADD COLUMN `receipt_file_type` varchar(50) NULL AFTER `receipt_url`;

ALTER TABLE `hst_vp_bill_expense_cost_distribution` 
ADD COLUMN `receipt_url` varchar(300) NULL AFTER `department_id`,
ADD COLUMN `receipt_file_type` varchar(50) NULL AFTER `receipt_url`;

ALTER TABLE `hst_vp_bill_item_cost_distribution` 
ADD COLUMN `receipt_url` varchar(300) NULL AFTER `department_id`,
ADD COLUMN `receipt_file_type` varchar(50) NULL AFTER `receipt_url`;

ALTER TABLE `vp_bill_item_cost_distribution` 
ADD COLUMN `receipt_url` varchar(300) NULL AFTER `department_id`,
ADD COLUMN `receipt_file_type` varchar(50) NULL AFTER `receipt_url`;


CREATE TABLE `vp_credit_card_statement_detail`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `statement_id` int NOT NULL,
  `transaction_date` varchar(100) NULL,
  `posting_date` varchar(100) NULL,
  `merchant` varchar(300) NULL,
  `four_digit_number` varchar(50) NULL,
  `description` varchar(300) NULL,
  `amount` decimal(19, 2) NULL,
  PRIMARY KEY (`id`),
  INDEX `STATEMENT_ID_FK_3`(`statement_id`) USING BTREE,
  CONSTRAINT `STATEMENT_ID_FK_3` FOREIGN KEY (`statement_id`) REFERENCES `vp_credit_card_statement` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
);

INSERT INTO `umm_menu`(`id`, `name`, `display_text`, `menu_style`, `url`, `tab`, `type`, `super_type`, `super_type_2`, `department`, `menu_order`, `display_icon`, `short_name`, `detail_text`, `status`, `portal_menu`, `individual_tenant_menu`, `vendor_community_menu`, `version`, `auth_code`, `slim_menu`, `hierachy`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (1048, 'Credit Card Statements', 'Credit Card Statements', 'fa fa-retweet', '/home/bills', '5', 'S', 1005, NULL, 'Admin', 4, 'fa fa-retweet', 'Credit Card Statements', 'Credit Card Statements', 'A', 0, 1, 0, 'V2', 'CREDIT_CARD_STATEMENTS', 0, '1005,1015', 'admin', '2022-03-11 11:39:41', NULL, NULL, NULL, NULL);

INSERT INTO `umm_menu_privilage`(`id`, `menu_id`, `privilage_id`, `auth_code`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (470, 1048, 59, 'CREDIT_CARD_STATEMENT_PROCESS', 'System', '2022-03-11 11:42:52', NULL, NULL, NULL, NULL);



