----------------Madhusha---------2.2.29----------------

ALTER TABLE `vp_vendor_w9_attachment`
DROP COLUMN `w9_form_data`,
CHANGE COLUMN `vendor_id` `vendor_mst_id`  int(11) NULL AFTER `id`,
ADD COLUMN `file_name`  varchar(200) NOT NULL AFTER `vendor_mst_id`,
ADD COLUMN `file_type`  varchar(50) NOT NULL AFTER `file_name`,
ADD COLUMN `attachment_url`  varchar(300) NOT NULL AFTER `file_type`,
ADD COLUMN `status`  char(1) NOT NULL AFTER `attachment_url`,
ADD COLUMN `delete_by`  varchar(100) NULL AFTER `status`,
ADD COLUMN `delete_on`  datetime NULL AFTER `delete_by`;