ALTER TABLE `vp_receipt_mst` 
ADD COLUMN `thumbnail_url` varchar(255) NULL AFTER `attachment_url`;


ALTER TABLE `vp_receipt_mst` 
ADD COLUMN `ocr_running_status` char(1) NULL AFTER `status`,
ADD COLUMN `ocr_running_date` datetime NULL AFTER `ocr_running_status`,
ADD COLUMN `detection_level` char(1) NULL AFTER `ocr_running_date`,
ADD COLUMN `updated_status` char(1) NULL AFTER `detection_level`;



UPDATE `common_grid_column_template` SET `grid_id` = 53, `field` = 'receipt.cardNo', `header` = 'Card Number', `column_show` = 1, `is_sortable` = 1, `is_re_orderable` = 1, `is_re_sizable` = 1, `can_hide` = 1, `align` = 'left', `search_type` = 'input', `placeholder` = 'Card Number', `column_order` = 3, `drop_down_id` = NULL, `drop_down_url` = '' WHERE `grid_id` = 53 AND `field` = 'receipt.cardNo';


