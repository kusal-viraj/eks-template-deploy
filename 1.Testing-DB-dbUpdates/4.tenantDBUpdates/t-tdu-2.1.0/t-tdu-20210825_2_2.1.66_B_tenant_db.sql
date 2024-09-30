--------Amal---2.1.66-------------

ALTER TABLE `vp_bill_attachment` 
DROP FOREIGN KEY `BILL_ID_FK_1`;
ALTER TABLE `vp_bill_attachment` 
CHANGE COLUMN `bill_id` `bill_id` INT(11) NULL ;
ALTER TABLE `vp_bill_attachment` 
ADD CONSTRAINT `BILL_ID_FK_1`
  FOREIGN KEY (`bill_id`)
  REFERENCES `vp_bill` (`id`);

ALTER TABLE `vp_bill_template_mst` 
ADD COLUMN `attachment_id` INT(11) NULL AFTER `bill_no`;

