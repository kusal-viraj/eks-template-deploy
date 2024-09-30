---------sithum-2.10.16----------

ALTER TABLE vp_payment_transaction
	ADD COLUMN is_positive_pay_enabled TINYINT NULL DEFAULT NULL AFTER request_id;

ALTER TABLE vp_payment_transaction
	ADD COLUMN positive_pay_export TINYINT(4) NULL DEFAULT NULL AFTER is_positive_pay_enabled;

UPDATE vp_payment_transaction SET positive_pay_export = false WHERE positive_pay_export IS NULL;
