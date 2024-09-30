---dasindu 2.9.57--


ALTER TABLE `vp_payment_request_import_batch`
	CHANGE COLUMN `filename` `filename` VARCHAR(150) NOT NULL COLLATE 'latin1_swedish_ci' AFTER `uuid`;

ALTER TABLE `vp_payment_request_invoice_detail`
	CHANGE COLUMN `invoice_no` `invoice_no` VARCHAR(150) NULL DEFAULT NULL COLLATE 'latin1_swedish_ci' AFTER `vendor_token`;

ALTER TABLE `vp_payment_request_custom_field`
	CHANGE COLUMN `custom_field_first` `custom_field_first` VARCHAR(256) NULL DEFAULT NULL COLLATE 'latin1_swedish_ci' AFTER `vendor_token`,
	CHANGE COLUMN `custom_field_second` `custom_field_second` VARCHAR(256) NULL DEFAULT NULL COLLATE 'latin1_swedish_ci' AFTER `custom_field_first`,
	CHANGE COLUMN `custom_field_third` `custom_field_third` VARCHAR(256) NULL DEFAULT NULL COLLATE 'latin1_swedish_ci' AFTER `custom_field_second`,
	CHANGE COLUMN `custom_field_fourth` `custom_field_fourth` VARCHAR(256) NULL DEFAULT NULL COLLATE 'latin1_swedish_ci' AFTER `custom_field_third`;


