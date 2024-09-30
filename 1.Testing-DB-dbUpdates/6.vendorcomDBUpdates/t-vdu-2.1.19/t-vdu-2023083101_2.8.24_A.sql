----kavindu--2.8.24---



ALTER TABLE `vendor_mst`
	ADD COLUMN `ten_ninety_nine` TINYINT(1) NOT NULL AFTER `status`;
	
ALTER TABLE `vendor_temp`
	ADD COLUMN `ten_ninety_nine` TINYINT(1) NOT NULL AFTER `status`;


--2.8.25---sithum----


UPDATE vendor_drop_down_url SET url='/payment_service/sec_get_payment_types' WHERE  id=5;



----hashila 2.8.35----

ALTER TABLE `vendor_payment_v_card` 
ADD COLUMN `time_zone` varchar(256) NULL DEFAULT NULL AFTER `project_id`;
