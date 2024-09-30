--------madusha--2.8.200-----------




ALTER TABLE `vp_bill` 
ADD COLUMN `project_code_id` int NULL AFTER `thumbnail_url`;

ALTER TABLE `hst_vp_bill` 
ADD COLUMN `project_code_id` int NULL AFTER `action_status`;

ALTER TABLE `vp_recurring_bill_template_mst` 
ADD COLUMN `project_code_id` int NULL AFTER `bill_no_pattern`;


CREATE TABLE `common_project_user_wise`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_name` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `project_code_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
);


CREATE TABLE `common_project_account_wise`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `account_id` int NULL DEFAULT NULL,
  `project_code_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
);