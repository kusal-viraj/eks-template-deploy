ALTER TABLE `vp_bill`
ADD COLUMN `vendor_schedule_template_id`  int(11) NULL AFTER `payment_under_processing`;


ALTER TABLE `hst_vp_bill`
ADD COLUMN `vendor_schedule_template_id`  int(11) NULL AFTER `schedule_template_id`;
