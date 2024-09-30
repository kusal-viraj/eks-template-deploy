
---loshitha 2.9.141---



ALTER TABLE `vp_payment_attachment`
	DROP FOREIGN KEY `fk_transaction_id`;

ALTER TABLE `vp_payment_attachment`
	CHANGE COLUMN `transaction_id` `check_id` INT(11) NOT NULL AFTER `attachment_url`,
	DROP INDEX `fk_transaction_id`,
	ADD INDEX `fk_transaction_id` (`check_id`) USING BTREE,
	ADD CONSTRAINT `FK_vp_payment_attachment_vp_payment_check` FOREIGN KEY (`check_id`) REFERENCES `vp_payment_check` (`id`) ON UPDATE RESTRICT ON DELETE RESTRICT;

RENAME TABLE `vp_payment_attachment` TO `vp_check_attachment`;