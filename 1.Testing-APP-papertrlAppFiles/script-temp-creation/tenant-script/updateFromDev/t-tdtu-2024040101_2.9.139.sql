ALTER TABLE `vp_payment_request_invoice_detail`
	ADD COLUMN `request_mst_id` INT(11) NOT NULL AFTER `id`,
	ADD INDEX `REQUEST_MST_FK` (`request_mst_id`);

ALTER TABLE `vp_payment_request_invoice_detail`
	ADD CONSTRAINT `PAYMENT_REQUEST_MST_FK1` FOREIGN KEY (`request_mst_id`) REFERENCES `vp_payment_request_mst` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION;