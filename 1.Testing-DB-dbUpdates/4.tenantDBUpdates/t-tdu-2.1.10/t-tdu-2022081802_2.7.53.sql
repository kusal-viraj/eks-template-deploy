------------Madhusha----2.7.53-----------

ALTER TABLE `vp_expense_detail` 
ADD COLUMN `mileage_rate` decimal(19, 2) NULL AFTER `taxable`,
ADD COLUMN `mileage` decimal(19, 2) NULL AFTER `mileage_rate`;

ALTER TABLE `vp_expense_detail` 
ADD COLUMN `mileage_amount` dec(19, 2) NULL AFTER `mileage`;

ALTER TABLE `vp_expense_detail` 
MODIFY COLUMN `mileage_rate` decimal(19, 2) NULL DEFAULT 0.00 AFTER `taxable`,
MODIFY COLUMN `mileage_amount` decimal(19, 2) NULL DEFAULT 0.00 AFTER `mileage`;

ALTER TABLE `vp_expense_mst` 
ADD COLUMN `total_mileage_amount` decimal(19, 2) NULL DEFAULT 0.00 AFTER `total_amount`;


CREATE TABLE `vp_expense_mileage_rate`  (
  `id` int NOT NULL,
  `mileage_rate` decimal(19, 2) NULL DEFAULT 0,
  `update_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `update_on` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

INSERT INTO `vp_expense_mileage_rate`(`id`) VALUES (1);


INSERT INTO `umm_privilages`(`id`, `url`, `text`, `auth_code`, `created_by`, `created_on`) VALUES (137, 'Configure Mileage Rate', 'Configure Mileage Rate', 'CONFIGURE_MILEAGE_RATE', 'System', '2022-08-17 15:08:07');

INSERT INTO `umm_menu_privilage`(`id`, `menu_id`, `privilage_id`, `auth_code`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (518, 1046, 137, 'CONFIGURE_MILEAGE_RATE', 'System', '2022-08-17 15:12:31', NULL, NULL, NULL, NULL);

INSERT INTO `umm_role_previlege`(`role_id`, `privilege_id`, `created_by`, `created_on`) VALUES (1, 518, 'System', '2022-08-17 15:14:59');


ALTER TABLE `hst_vp_expense_detail` 
ADD COLUMN `mileage_rate` decimal(19, 2) NULL AFTER `taxable`,
ADD COLUMN `mileage` decimal(19, 2) NULL AFTER `mileage_rate`;

ALTER TABLE `hst_vp_expense_detail` 
ADD COLUMN `mileage_amount` dec(19, 2) NULL AFTER `mileage`;

ALTER TABLE `hst_vp_expense_detail` 
MODIFY COLUMN `mileage_rate` decimal(19, 2) NULL DEFAULT 0.00 AFTER `taxable`,
MODIFY COLUMN `mileage_amount` decimal(19, 2) NULL DEFAULT 0.00 AFTER `mileage`;

ALTER TABLE `hst_vp_expense_mst` 
ADD COLUMN `total_mileage_amount` decimal(19, 2) NULL DEFAULT 0.00 AFTER `total_amount`;

UPDATE vp_expense_detail detail SET detail.mileage_rate='0.00', detail.mileage_amount='0.00';
UPDATE hst_vp_expense_detail detail SET detail.mileage_rate='0.00', detail.mileage_amount='0.00';

