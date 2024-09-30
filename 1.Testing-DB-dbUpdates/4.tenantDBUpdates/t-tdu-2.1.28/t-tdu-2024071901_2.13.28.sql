-----damith-2.13.28-----

CREATE INDEX idx_bank_account_id ON `vp_bank_payment_type` (`bank_account_id`);
CREATE INDEX idx_payment_type_id ON `vp_bank_payment_type` (`payment_type_id`);
CREATE INDEX idx_payment_channel_id ON `vp_bank_payment_type` (`payment_channel_id`);
CREATE INDEX idx_is_default ON `vp_bank_payment_type` (`is_default`);
CREATE INDEX idx_is_positive_pay_enabled ON `vp_bank_payment_type` (`is_positive_pay_enabled`);