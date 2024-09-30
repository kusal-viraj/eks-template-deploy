------------------2.10.21-sithum----------------------

ALTER TABLE vp_payment_transaction
	DROP COLUMN is_positive_pay_enabled,
	DROP COLUMN positive_pay_export;

ALTER TABLE vp_payment_check
	ADD COLUMN is_positive_pay_enabled TINYINT NULL DEFAULT NULL AFTER cancel_reason,
	ADD COLUMN positive_pay_export TINYINT NULL DEFAULT NULL AFTER is_positive_pay_enabled;