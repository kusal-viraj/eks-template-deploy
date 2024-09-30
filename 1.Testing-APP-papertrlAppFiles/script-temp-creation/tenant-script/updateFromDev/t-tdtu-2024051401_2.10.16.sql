ALTER TABLE vp_payment_transaction
	ADD COLUMN is_positive_pay_enabled TINYINT NULL DEFAULT NULL AFTER request_id;

ALTER TABLE vp_payment_transaction
	ADD COLUMN positive_pay_export TINYINT(4) NULL DEFAULT NULL AFTER is_positive_pay_enabled;