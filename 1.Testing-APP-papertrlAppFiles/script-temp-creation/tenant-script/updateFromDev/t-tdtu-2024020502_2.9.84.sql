ALTER TABLE vp_payment_type_for_vendor
	DROP COLUMN provider_id;

ALTER TABLE vp_payment_type_for_user
	DROP COLUMN provider_id;

ALTER TABLE vendor_mst
	ADD COLUMN vendor_code VARCHAR(50) NULL DEFAULT NULL;

ALTER TABLE vendor_payment_recipient_detail
	ADD COLUMN check_to_be_mail TINYINT(1) NULL DEFAULT NULL,
	ADD COLUMN mailOption TINYINT(1) NULL DEFAULT NULL;


CREATE TABLE vendor_payment_mail_option (
	id INT NOT NULL AUTO_INCREMENT,
	name VARCHAR(20) NULL DEFAULT NULL,
	value CHAR(1) NULL DEFAULT NULL,
	status CHAR(1) NULL DEFAULT NULL,
	PRIMARY KEY (id)
);

INSERT INTO vendor_payment_mail_option (name, value, status) VALUES ('First Class (A)', 'F', 'A');
INSERT INTO vendor_payment_mail_option (name, value, status) VALUES ('Priority (P)', 'P', 'A');
INSERT INTO vendor_payment_mail_option (name, value, status) VALUES ('Next Day (N)', 'N', 'A');

ALTER TABLE vp_payment_bank_account
	ADD COLUMN `account_type` VARCHAR(50) NULL DEFAULT NULL AFTER `digital_card_acc_id`;
 
ALTER TABLE vp_bank_payment_type
	ADD COLUMN `is_default` TINYINT NULL DEFAULT NULL AFTER `bank_account_id`;
 
ALTER TABLE vp_bank_payment_type
	ADD COLUMN `payment_channel_id` INT NULL DEFAULT NULL AFTER `is_default`;