ALTER TABLE vp_bank_payment_type
ADD COLUMN ach_file_prefix  varchar(255) NULL AFTER is_positive_pay_enabled,
ADD COLUMN check_positive_pay_file_prefix  varchar(255) NULL AFTER ach_file_prefix;