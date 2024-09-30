ALTER TABLE vp_payment_transaction
	CHANGE COLUMN financial_status financial_status VARCHAR(20) NULL DEFAULT NULL AFTER request_id;