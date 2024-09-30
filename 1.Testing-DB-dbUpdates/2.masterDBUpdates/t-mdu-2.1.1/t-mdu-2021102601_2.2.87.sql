------------------2.2.87--------Hashila--------

UPDATE `payment_type` SET `name`='Virtual Card' WHERE  `id`=3;

DELETE FROM payment_type_for_provider WHERE payment_type >3;

ALTER TABLE `payment_type_for_provider` AUTO_INCREMENT=0;

DELETE FROM payment_type WHERE id>3;

ALTER TABLE `payment_type` AUTO_INCREMENT=0;

ALTER TABLE `payment_type` ADD COLUMN `read_only` TINYINT(1) NOT NULL AFTER `for_online`;

UPDATE `payment_type` SET `read_only`='1' WHERE  `id`=1;
UPDATE `payment_type` SET `read_only`='1' WHERE  `id`=2;
UPDATE `payment_type` SET `read_only`='1' WHERE  `id`=3;


INSERT INTO `payment_type` (`id`, `name`, `status`, `description`, `for_online`, `read_only`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (4, 'Credit Card', 'A', 'Credit Card Payments', 0, 1, 'support', '2021-10-26 13:08:23', NULL, NULL, NULL, NULL);
INSERT INTO `payment_type` (`id`, `name`, `status`, `description`, `for_online`, `read_only`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (5, 'Cash', 'A', NULL, 0, 1, 'support', '2021-10-26 13:19:01', NULL, NULL, NULL, NULL);
INSERT INTO `payment_type` (`id`, `name`, `status`, `description`, `for_online`, `read_only`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (6, 'EFT', 'A', NULL, 0, 1, 'support', '2021-10-26 13:19:01', NULL, NULL, NULL, NULL);
INSERT INTO `payment_type` (`id`, `name`, `status`, `description`, `for_online`, `read_only`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (7, 'Wire', 'A', NULL, 0, 1, 'support', '2021-10-26 13:19:01', NULL, NULL, NULL, NULL);
INSERT INTO `payment_type` (`id`, `name`, `status`, `description`, `for_online`, `read_only`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (8, 'Credit Memo', 'A', NULL, 0, 1, 'support', '2021-10-26 13:19:01', NULL, NULL, NULL, NULL);
INSERT INTO `payment_type` (`id`, `name`, `status`, `description`, `for_online`, `read_only`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (9, 'Other', 'A', NULL, 0, 1, 'support', '2021-10-26 13:19:01', NULL, NULL, NULL, NULL);
