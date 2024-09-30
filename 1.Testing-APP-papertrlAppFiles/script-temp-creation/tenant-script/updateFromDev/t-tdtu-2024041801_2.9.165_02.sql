ALTER TABLE vp_bank_payment_type
  ADD COLUMN template_name CHAR(50) NULL DEFAULT NULL AFTER payment_channel_id;
