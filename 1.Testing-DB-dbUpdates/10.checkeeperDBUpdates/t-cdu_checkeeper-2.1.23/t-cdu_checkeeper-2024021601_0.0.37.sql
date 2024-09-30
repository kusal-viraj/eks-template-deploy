----loshitha 0.0.37---



ALTER TABLE tenant_wise_transaction
	CHANGE COLUMN correlation_id correlation_id VARCHAR(300) NULL;

ALTER TABLE payment_provider
	DROP COLUMN created_by,
	DROP COLUMN created_on,
	DROP COLUMN update_by,
	DROP COLUMN update_on,
	DROP COLUMN delete_by,
	DROP COLUMN delete_on;



