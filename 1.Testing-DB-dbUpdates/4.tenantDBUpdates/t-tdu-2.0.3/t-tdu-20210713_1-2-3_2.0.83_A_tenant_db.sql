--------------------------------------Indra-----2.0.83----------------------

ALTER TABLE `common_approval_code`
	ADD COLUMN `contract_value` DECIMAL(20,2) NOT NULL DEFAULT 0 AFTER `status`;
	
UPDATE `common_grid_state_template` SET `column_widths`='50,100,305,305,305,305,305,305' WHERE  `id`=10;

INSERT INTO `common_grid_column_template` (`id`, `grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (299, 10, 'appCode.contractValue', 'Contract Value', 1, 1, 1, 1, 1, 'right', 'numeric', 'Contract Value', 5, NULL, '');


-------------------------------------Niron------------2.0.83------------------------
UPDATE `umm_menu` SET `menu_style`='fa fa-file-text', `display_icon`='fa fa-file-text' WHERE (`id`='1019');
UPDATE `umm_menu` SET `menu_style`='fa fa-file-text', `display_icon`='fa fa-file-text' WHERE (`id`='1005');

UPDATE `umm_menu` SET `menu_style`='fa fa-cart-arrow-down', `display_icon`='fa fa-cart-arrow-down' WHERE (`id`='1021');
UPDATE `umm_menu` SET `menu_style`='fa fa-cart-arrow-down', `display_icon`='fa fa-cart-arrow-down' WHERE (`id`='1006');

UPDATE `umm_menu` SET `menu_style`='fa fa-usd', `display_icon`='fa fa-usd' WHERE (`id`='1007');

------------------------------------Madusha-------------2.0.83---------------------------

CREATE TABLE `common_department` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(100) NOT NULL,
  `department_code` varchar(100) DEFAULT NULL,
  `department_name` varchar(100) NOT NULL,
  `status` char(1) NOT NULL,
  `created_by` varchar(100) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `update_by` varchar(100) DEFAULT NULL,
  `update_on` datetime DEFAULT NULL,
  `delete_by` varchar(100) DEFAULT NULL,
  `delete_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
);

ALTER TABLE `vp_po_mst`
ADD COLUMN `department_id`  int(11) NULL AFTER `approved_date`;

ALTER TABLE `vp_po_mst` ADD CONSTRAINT `PO_DEPT_ID_FK_1` FOREIGN KEY (`department_id`) REFERENCES `common_department` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE `vp_po_account_detail`
ADD COLUMN `department_id`  int(11) NULL AFTER `account_name`;

ALTER TABLE `vp_po_account_detail` ADD CONSTRAINT `FK_DEPT_ID_FK1` FOREIGN KEY (`department_id`) REFERENCES `common_department` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE `vp_po_detail`
ADD COLUMN `department_id`  int(11) NULL AFTER `product_id`;

ALTER TABLE `vp_po_detail` ADD CONSTRAINT `FK_DEPT_ID` FOREIGN KEY (`department_id`) REFERENCES `common_department` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

INSERT INTO `common_grid_column_template` (`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`) VALUES ('13', 'dept.id', 'Department', '1', '1', '1', '1', '1', 'left', 'dropdown', 'Department', '16');

UPDATE `common_grid_state_template` SET `column_widths`='50,100,220,218,214,218,218,219,219,219,219,219,219,219,219,219' WHERE (`id`='13');


