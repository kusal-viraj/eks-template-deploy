----Danuddra---2.9.2---

ALTER TABLE `payment_provider` 
DROP COLUMN `osn`;
DELETE FROM `payment_type_for_provider` WHERE payment_provider = 3;
DELETE FROM `payment_provider` WHERE id = 3;
INSERT INTO `payment_provider`(`id`, `name`, `status`, `description`, `logo_image`,  `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (3, 'Checkeeper', 'A', 'Checkeeper\'s online check printing software lets you print checks on your own check-stock or on totally blank white paper. Checkeeper and a printer is all you need to create professional business or personal checks.', NULL,  'support', '2024-01-17 16:58:23', NULL, NULL, NULL, NULL);
INSERT INTO `payment_type_for_provider`(`status`, `payment_type`, `payment_provider`, `short_code`) VALUES ('A', 2, 3, 'Check');
