UPDATE `common_grid_column_template` SET `search_type`='multiSelect' WHERE `grid_id`=73 AND field='pPaymentReq.payeeId';

ALTER TABLE `vp_payment_request_mst`
	CHANGE COLUMN `check_delivery_by_mail` `check_delivery_by_mail` CHAR(1) NULL DEFAULT NULL COLLATE 'latin1_swedish_ci' AFTER `description`;

ALTER TABLE `vp_payment_request_mst`
	CHANGE COLUMN `service_level_override` `service_level_override` CHAR(1) NULL DEFAULT NULL COLLATE 'latin1_swedish_ci' AFTER `check_delivery_by_mail`;

ALTER TABLE `vp_payment_request_mst`
	CHANGE COLUMN `payment_type` `payment_type` VARCHAR(50) NULL DEFAULT NULL COLLATE 'latin1_swedish_ci' AFTER `currency_code`;