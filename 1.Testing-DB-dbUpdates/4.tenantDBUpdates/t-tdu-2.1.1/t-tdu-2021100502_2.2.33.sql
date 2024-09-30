--------------Niron------------2.2.33----------------

ALTER TABLE `vp_bill_payment_additional_data`
ADD COLUMN `field_type_id`  int(11) NULL AFTER `payment_mst_id`,
ADD COLUMN `section_id`  int(11) NOT NULL AFTER `field_type_id`,
ADD COLUMN `detail_id`  int(11) NULL AFTER `section_id`,
ADD COLUMN `display_order`  int(11) NOT NULL AFTER `detail_id`,
ADD COLUMN `multiple_status`  char(1) NULL AFTER `display_order`;
