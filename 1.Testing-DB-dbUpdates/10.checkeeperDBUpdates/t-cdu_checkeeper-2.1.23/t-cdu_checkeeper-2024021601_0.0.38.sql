ALTER TABLE tenant_wise_transaction
	CHANGE COLUMN payment_type payment_type INT(11) NULL;

ALTER TABLE payment_type_for_provider
	CHANGE COLUMN payment_type payment_type INT(11) NULL;