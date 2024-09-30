---chandima 2.9.84--






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