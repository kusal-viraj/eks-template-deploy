ALTER TABLE vp_bank_payment_type
ADD COLUMN is_positive_pay_enabled TINYINT(4) NULL DEFAULT 0 AFTER template_name;
