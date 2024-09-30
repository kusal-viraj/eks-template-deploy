----------Madhusha-----2.7.77--------------

ALTER TABLE `common_failed_upload` 
ADD COLUMN `fail_reason` varchar(255) NULL AFTER `failed_date`;