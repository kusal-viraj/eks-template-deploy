--------------Indra---------2.5.73----------------

UPDATE `vendor_menu` SET `tab`='2' WHERE  `id`=1022;
UPDATE `vendor_menu` SET `tab`='1' WHERE  `id`=1021;
UPDATE `vendor_menu` SET `tab`='3' WHERE  `id`=1010;

UPDATE `vendor_menu` SET `menu_order`='3' WHERE  `id`=1010;
UPDATE `vendor_menu` SET `menu_order`='0' WHERE  `id`=1009;
UPDATE `vendor_menu` SET `menu_order`='1' WHERE  `id`=1021;

UPDATE `vendor_grid_column_template` SET `header`='Customer Name', `placeholder`='Customer Name' WHERE  `id`=271;
UPDATE `vendor_grid_column_user_wice` uw SET uw.header='Customer Name', uw.placeholder='Customer Name' WHERE uw.header='Name Customer';