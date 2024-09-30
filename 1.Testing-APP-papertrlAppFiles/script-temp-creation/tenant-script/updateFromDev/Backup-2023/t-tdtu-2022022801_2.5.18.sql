ALTER TABLE `vp_bill_payment_attachment` 
ADD COLUMN `attachment_url` varchar(300) NULL AFTER `file_type`;

ALTER TABLE `vp_bill_payment_attachment` 
DROP COLUMN `payment_data`;
