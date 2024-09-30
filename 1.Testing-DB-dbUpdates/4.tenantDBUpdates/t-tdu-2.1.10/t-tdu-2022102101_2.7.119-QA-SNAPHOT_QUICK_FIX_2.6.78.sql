------------Madhusha--------2.7.119------------

UPDATE `common_grid_column_template` SET `field` = 'bill.billNo' WHERE `id` = 265;

UPDATE `common_grid_column_template` SET `field` = 'bill.billDate' WHERE `id` = 266;

UPDATE `common_grid_column_template` SET `field` = 'bill.status' WHERE `id` = 267;

UPDATE `common_grid_column_template` SET `field` = 'bill.billAmount' WHERE `id` = 268;

UPDATE `common_grid_column_template` SET `field` = 'bill.term' WHERE `id` = 269;

UPDATE `common_grid_column_template` SET `field` = 'bill.applicableDiscountAmount' WHERE `id` = 270;

UPDATE `common_grid_column_template` SET `field` = 'bill.discountApplicableDate' WHERE `id` = 271;

UPDATE `common_grid_column_user_wice` SET `field` = 'bill.applicableDiscountAmount' WHERE `grid_id` = 26 AND `field` = "discount.applicableDiscountAmount";

UPDATE `common_grid_column_user_wice` SET `field` = 'bill.term' WHERE `grid_id` = 26 AND `field` = "discount.term";

UPDATE `common_grid_column_user_wice` SET `field` = 'bill.billNo' WHERE `grid_id` = 26 AND `field` = "discount.billNo";

UPDATE `common_grid_column_user_wice` SET `field` = 'bill.billAmount' WHERE `grid_id` = 26 AND `field` = "discount.billAmount";

UPDATE `common_grid_column_user_wice` SET `field` = 'bill.discountApplicableDate' WHERE `grid_id` = 26 AND `field` = "discount.discountApplicableDate";

UPDATE `common_grid_column_user_wice` SET `field` = 'bill.billDate' WHERE `grid_id` = 26 AND `field` = "discount.billDate";

UPDATE `common_grid_column_user_wice` SET `field` = 'bill.status' WHERE `grid_id` = 26 AND `field` = "discount.status";

DELETE FROM `umm_menu_privilage` WHERE `id` = 98;