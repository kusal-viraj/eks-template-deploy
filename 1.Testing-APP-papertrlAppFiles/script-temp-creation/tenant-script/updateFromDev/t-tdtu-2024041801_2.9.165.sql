ALTER TABLE vp_bank_payment_type
  ADD COLUMN template_name CHAR(50) NULL DEFAULT NULL AFTER payment_channel_id;

UPDATE vp_bank_payment_type SET template_name = "check_on_top" WHERE payment_channel_id=2;