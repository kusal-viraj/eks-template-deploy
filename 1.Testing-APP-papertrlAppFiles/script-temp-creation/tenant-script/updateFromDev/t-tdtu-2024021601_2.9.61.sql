UPDATE `common_grid_column_template` SET `field`='pPaymentReq.payeeId', `sortable_field`='pPaymentReq.payeeId' WHERE `grid_id`=73 AND `header`='Payee';
UPDATE `common_grid_column_user_wice` SET `field`='pPaymentReq.payeeId', `sortable_field`='pPaymentReq.payeeId' WHERE `grid_id`=73 AND `header`='Payee';


UPDATE `common_grid_column_template` SET `column_order`=14 WHERE `grid_id`=62 AND `field`='txn.reason';
UPDATE `common_grid_column_user_wice` SET `column_order`=14 WHERE `grid_id`=62 AND `field`='txn.reason';
UPDATE `common_grid_column_template` SET `column_order`=60 WHERE `grid_id`=62 AND `field`='action';
UPDATE `common_grid_column_user_wice` SET `column_order`=60 WHERE `grid_id`=62 AND `field`='action';

ALTER TABLE `vp_payment_request_mst`
	CHANGE COLUMN `description` `description` VARCHAR(150) NULL DEFAULT NULL COLLATE 'latin1_swedish_ci' AFTER `txn_amount`;

ALTER TABLE `vp_payment_request_import_batch`
	CHANGE COLUMN `filename` `filename` VARCHAR(150) NOT NULL COLLATE 'latin1_swedish_ci' AFTER `uuid`;

ALTER TABLE `vp_payment_request_invoice_detail`
	CHANGE COLUMN `invoice_no` `invoice_no` VARCHAR(150) NULL DEFAULT NULL COLLATE 'latin1_swedish_ci' AFTER `vendor_token`;

ALTER TABLE `vp_payment_request_custom_field`
	CHANGE COLUMN `custom_field_first` `custom_field_first` VARCHAR(256) NULL DEFAULT NULL COLLATE 'latin1_swedish_ci' AFTER `vendor_token`,
	CHANGE COLUMN `custom_field_second` `custom_field_second` VARCHAR(256) NULL DEFAULT NULL COLLATE 'latin1_swedish_ci' AFTER `custom_field_first`,
	CHANGE COLUMN `custom_field_third` `custom_field_third` VARCHAR(256) NULL DEFAULT NULL COLLATE 'latin1_swedish_ci' AFTER `custom_field_second`,
	CHANGE COLUMN `custom_field_fourth` `custom_field_fourth` VARCHAR(256) NULL DEFAULT NULL COLLATE 'latin1_swedish_ci' AFTER `custom_field_third`;

