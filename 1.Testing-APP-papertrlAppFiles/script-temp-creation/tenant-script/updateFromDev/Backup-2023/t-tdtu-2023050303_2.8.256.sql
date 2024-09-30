ALTER TABLE `vp_payment_v_card` 
ADD COLUMN `redeemed_amount` decimal(19, 2) NULL AFTER `ref_no`,
ADD COLUMN `card_number` varchar(100) NULL AFTER `redeemed_amount`;

UPDATE `common_grid_column_template` SET `filter_show` = 0 WHERE `grid_id` = 66 AND `field` = "vcard.documentNos";

UPDATE `common_grid_column_template` SET `column_order` = 2 WHERE  `grid_id` = 66 AND `field` = "vcard.nickName";

UPDATE `common_grid_column_template` SET `column_order` = 4 WHERE  `grid_id` = 66 AND `field` = "vcard.cardOwner";

UPDATE `common_grid_column_template` SET `column_order` = 5 WHERE  `grid_id` = 66 AND `field` = "vcard.documentNos";

UPDATE `common_grid_column_template` SET `column_order` = 6 WHERE  `grid_id` = 66 AND `field` = "vcard.createdOn";

UPDATE `common_grid_column_template` SET `column_order` = 7 WHERE  `grid_id` = 66 AND `field` = "vcard.expireOn";

UPDATE `common_grid_column_template` SET `column_order` = 8 WHERE  `grid_id` = 66 AND `field` = "vcard.amount";

UPDATE `common_grid_column_template` SET `column_order` = 10 WHERE  `grid_id` = 66 AND `field` = "vcard.balanceAmount";

UPDATE `common_grid_column_template` SET `column_order` = 11 WHERE  `grid_id` = 66 AND `field` = "vcard.status";

UPDATE `common_grid_column_template` SET `column_order` = 12 WHERE  `grid_id` = 66 AND `field` = "action";


INSERT INTO `common_grid_column_template`(`grid_id`, `field`, `sortable_field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `filter_show`, `is_frozen`, `align`, `search_type`, `placeholder`, `column_order`, `column_width`) VALUES (66, 'vcard.cardNumber', 'vcard.cardNumber', 'Card Number', 1, 1, 0, 0, 1, 1, 0, 'left', 'input', 'Card Number', 3, 140);

INSERT INTO `common_grid_column_template`(`grid_id`, `field`, `sortable_field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `filter_show`, `is_frozen`, `align`, `search_type`, `placeholder`, `column_order`, `column_width`) VALUES (66, 'vcard.redeemedAmount', 'vcard.redeemedAmount', 'Utilized Amount', 1, 1, 0, 0, 1, 1, 0, 'right', 'numeric', 'Utilized Amount', 9, 140);