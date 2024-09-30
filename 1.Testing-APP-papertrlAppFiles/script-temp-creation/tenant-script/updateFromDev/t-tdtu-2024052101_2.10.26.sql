ALTER TABLE `vp_payment_request_mst`
	CHANGE COLUMN `txn_date` `txn_date` DATE NULL AFTER `vendor_token`;