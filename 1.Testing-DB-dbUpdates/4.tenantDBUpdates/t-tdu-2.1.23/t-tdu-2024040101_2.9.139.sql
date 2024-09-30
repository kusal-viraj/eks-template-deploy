---dasindu 2.9.139----

ALTER TABLE `vp_payment_request_invoice_detail`
	ADD COLUMN `request_mst_id` INT(11) NOT NULL AFTER `id`,
	ADD INDEX `REQUEST_MST_FK` (`request_mst_id`);

UPDATE vp_payment_request_invoice_detail det 
INNER JOIN vp_payment_request_mst mst ON mst.reference_no=det.payment_reference AND mst.vendor_token=det.vendor_token
SET det.request_mst_id=mst.id
WHERE det.request_mst_id=0;

ALTER TABLE `vp_payment_request_invoice_detail`
	ADD CONSTRAINT `PAYMENT_REQUEST_MST_FK1` FOREIGN KEY (`request_mst_id`) REFERENCES `vp_payment_request_mst` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION;