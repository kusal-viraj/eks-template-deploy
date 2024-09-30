------------Hashila----2.7.82---------------

CREATE TABLE `common_description_base_memorization`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `description` varchar(500) NOT NULL,
  `account_id` int NULL,
  `item_id` int NULL,
  PRIMARY KEY (`id`)
);

ALTER TABLE `common_description_base_memorization` 
ADD COLUMN `sku` varchar(50) NULL AFTER `item_id`;

ALTER TABLE `vp_po_account_detail` 
ADD COLUMN `description` varchar(500) NULL AFTER `department_id`;

ALTER TABLE `hst_vp_po_account_detail` 
ADD COLUMN `description` varchar(500) NULL AFTER `department_id`;

SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS `vp_credit_card_merchant`;
DROP TABLE IF EXISTS `common_merchant_base_memorization`;
CREATE TABLE `common_merchant_base_memorization`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `account_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `MERCHANT_ACCOUNT_FK`(`account_id`),
  CONSTRAINT `MERCHANT_ACCOUNT_FK` FOREIGN KEY (`account_id`) REFERENCES `common_account_number` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
);
SET FOREIGN_KEY_CHECKS = 1;


