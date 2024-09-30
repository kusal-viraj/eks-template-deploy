CREATE TABLE `vendor_recurring_invoice_failed_record` (
`id`  int(11) NOT NULL AUTO_INCREMENT,
`template_mst_id`  int(11) NULL ,
`fail_reason`  varchar(200) NULL ,
`failed_date`  datetime NULL ,
PRIMARY KEY (`id`)
);