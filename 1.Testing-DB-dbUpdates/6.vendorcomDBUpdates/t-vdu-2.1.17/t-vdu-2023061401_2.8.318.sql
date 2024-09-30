
---hashila--2.8.318----

DELETE FROM `vendor_grid_column_template` WHERE `grid_id` = 28 AND `field` = 'vcard.status';
DELETE FROM `vendor_grid_column_user_wice` WHERE `grid_id` = 28 AND `field` = 'vcard.status';

DELETE FROM `vendor_grid_column_template` WHERE `grid_id` = 28 AND `field` = 'vcard.documentNos';
DELETE FROM `vendor_grid_column_user_wice` WHERE `grid_id` = 28 AND `field` = 'vcard.documentNos';

UPDATE `vendor_grid_state_template` SET `column_widths` = '210,210,210,210,210,210,210,210,210,210,50' WHERE `grid_id` = 28;
UPDATE `vendor_grid_state_user_wice` SET `column_widths` = '210,210,210,210,210,210,210,210,210,210,50' WHERE `grid_id` = 28;

