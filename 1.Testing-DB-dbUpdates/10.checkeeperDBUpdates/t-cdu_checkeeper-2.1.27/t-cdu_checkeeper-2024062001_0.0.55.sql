----------loshitha 0.0.55-------------

ALTER TABLE payment_transaction ADD COLUMN is_positive_pay_enabled TINYINT(1) NULL DEFAULT NULL;
ALTER TABLE payment_requestor_detail ADD COLUMN logo TEXT NULL;