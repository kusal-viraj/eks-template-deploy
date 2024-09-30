-------------Niron-----2.2.69------------

ALTER TABLE `payment_type`
ADD COLUMN `for_online`  tinyint(1) NULL AFTER `description`;

INSERT INTO `payment_type` (`name`, `status`, `description`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`, `for_online`) VALUES ('Cash', 'A', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `payment_type` (`name`, `status`, `description`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`, `for_online`) VALUES ('Check', 'A', '', NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `payment_type` (`name`, `status`, `description`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`, `for_online`) VALUES ('Credit Card', 'A', '', NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `payment_type` (`name`, `status`, `description`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`, `for_online`) VALUES ('ACH', 'A', '', '', NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `payment_type` (`name`, `status`, `description`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`, `for_online`) VALUES ('EFT', 'A', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `payment_type` (`name`, `status`, `description`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`, `for_online`) VALUES ('Wire', 'A', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `payment_type` (`name`, `status`, `description`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`, `for_online`) VALUES ('Credit Memo', 'A', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `payment_type` (`name`, `status`, `description`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`, `for_online`) VALUES ('Other', 'A', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');

UPDATE `payment_type` SET `for_online`=1 WHERE (for_online IS NULL);

