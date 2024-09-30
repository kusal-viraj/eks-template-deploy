-----hashila---2.8.82------


ALTER TABLE vp_payment_recipient_details RENAME TO vp_payment_recipient_detail;

ALTER TABLE `vp_payment_recipient_detail` 
ADD COLUMN `company_name` varchar(300) NULL AFTER `recipient_type`;

UPDATE `common_grid_column_template` SET `field` = 'code.id', `is_sortable` = 1, `filter_show` = 1, `search_type` = 'multiSelect', `drop_down_url_id` = 25 WHERE `grid_id` = 14 AND `header` = 'Project';
