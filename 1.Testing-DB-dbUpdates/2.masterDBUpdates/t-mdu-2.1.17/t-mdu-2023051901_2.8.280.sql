------Danuddara 2.8.280------



INSERT INTO `payment_type`(`id`, `name`, `status`, `description`, `for_online`, `read_only`, `created_by`, `created_on`) VALUES (10, 'Digital Card', 'A', 'Digital Card Payments', 1, 1, 'support', '2023-05-15 14:38:35');

ALTER TABLE `payment_type_for_provider` DROP FOREIGN KEY `fk_provider_credentials`;

DROP TABLE payment_provider_credential;

ALTER TABLE `payment_type_for_provider` 
DROP COLUMN `provider_credential_id`;

INSERT INTO `payment_type_for_provider`( `status`, `payment_type`, `payment_provider`, `short_code`) VALUES ( 'A', 10, 2, 'DCard');
