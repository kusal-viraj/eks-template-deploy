------------------------------------------niron----2.0.83--------------------------

UPDATE `vendor_menu` SET `menu_style`='fa fa-file-text', `display_icon`='fa fa-file-text' WHERE (`id`='1009');
UPDATE `vendor_menu` SET `menu_style`='fa fa-file-text', `display_icon`='fa fa-file-text' WHERE (`id`='1008');
UPDATE `vendor_menu` SET `display_icon`='fa fa-cart-arrow-down' WHERE (`id`='1007');

-------------------------------------------madusha---------------------------------------

ALTER TABLE `vendor_po_mst`
ADD COLUMN `department_name` varchar(100) NULL AFTER `po_id`;