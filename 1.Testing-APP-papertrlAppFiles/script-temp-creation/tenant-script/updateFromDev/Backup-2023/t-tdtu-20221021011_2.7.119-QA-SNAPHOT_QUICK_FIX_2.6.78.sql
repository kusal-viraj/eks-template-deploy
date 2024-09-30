----------Madhusha-----2.7.119--------------------

UPDATE `common_grid_column_template` SET `field` = 'bill.billNo' WHERE `id` = 265;

UPDATE `common_grid_column_template` SET `field` = 'bill.billDate' WHERE `id` = 266;

UPDATE `common_grid_column_template` SET `field` = 'bill.status' WHERE `id` = 267;

UPDATE `common_grid_column_template` SET `field` = 'bill.billAmount' WHERE `id` = 268;

UPDATE `common_grid_column_template` SET `field` = 'bill.term' WHERE `id` = 269;

UPDATE `common_grid_column_template` SET `field` = 'bill.applicableDiscountAmount' WHERE `id` = 270;

UPDATE `common_grid_column_template` SET `field` = 'bill.discountApplicableDate' WHERE `id` = 271;

DELETE FROM `umm_menu_privilage` WHERE `id` = 98;