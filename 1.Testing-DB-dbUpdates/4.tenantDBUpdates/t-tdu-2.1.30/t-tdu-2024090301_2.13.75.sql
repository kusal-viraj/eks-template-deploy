-----damith-2.13.75------

ALTER TABLE vp_payment_bank_account
ADD COLUMN bank_market_identifier  varchar(50) NULL AFTER positive_pay_next_export_time;