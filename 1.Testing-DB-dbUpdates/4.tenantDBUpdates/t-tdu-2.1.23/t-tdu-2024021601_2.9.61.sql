---dasindu 2.9.61---


UPDATE `common_grid_column_template` SET `field`='pPaymentReq.payeeId', `sortable_field`='pPaymentReq.payeeId' WHERE `grid_id`=73 AND `header`='Payee';
UPDATE `common_grid_column_user_wice` SET `field`='pPaymentReq.payeeId', `sortable_field`='pPaymentReq.payeeId' WHERE `grid_id`=73 AND `header`='Payee';


UPDATE `common_grid_column_template` SET `column_order`=14 WHERE `grid_id`=62 AND `field`='txn.reason';
UPDATE `common_grid_column_user_wice` SET `column_order`=14 WHERE `grid_id`=62 AND `field`='txn.reason';
UPDATE `common_grid_column_template` SET `column_order`=60 WHERE `grid_id`=62 AND `field`='action';
UPDATE `common_grid_column_user_wice` SET `column_order`=60 WHERE `grid_id`=62 AND `field`='action';

ALTER TABLE `vp_payment_request_mst`
	CHANGE COLUMN `description` `description` VARCHAR(150) NULL DEFAULT NULL COLLATE 'latin1_swedish_ci' AFTER `txn_amount`;


