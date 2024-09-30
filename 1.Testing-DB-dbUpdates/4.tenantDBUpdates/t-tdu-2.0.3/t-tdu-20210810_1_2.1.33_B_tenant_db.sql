-----------------------------amal---------------------------

ALTER TABLE `vp_bill_template_mst` 
ADD COLUMN `status` CHAR(1) NOT NULL AFTER `delete_on`;

INSERT INTO `common_grid_template` (`id`, `grid_name`) VALUES ('31', 'OCR_BILL_TEMPLATE');
INSERT INTO `common_grid_column_template` (`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `column_order`) VALUES ('31', 'action', 'Action', '1', '0', '0', '0', '0', 'center', 'actionButton', '2');
INSERT INTO `common_grid_column_template` (`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`) VALUES ('31', 'vendor.name', 'Vendor', '1', '1', '1', '1', '1', 'left', 'input', 'Vendor', '3');
INSERT INTO `common_grid_column_template` (`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`) VALUES ('31', 'temp.templateName', 'Template Name', '1', '1', '1', '1', '1', 'left', 'input', 'Template Name', '4');
INSERT INTO `common_drop_down` (`drop_down_name`) VALUES ('OCR Bill Template Active Status');
INSERT INTO `common_drop_down_connection` (`drop_down_id`, `drop_down_value_id`) VALUES ('23', '1');
INSERT INTO `common_drop_down_connection` (`drop_down_id`, `drop_down_value_id`) VALUES ('23', '2');

INSERT INTO `common_grid_column_template` (`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`) VALUES ('31', 'temp.status', 'Status', '1', '1', '1', '1', '1', 'center', 'dropdown', 'Status', '5', '23');
INSERT INTO `common_grid_column_template` (`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`) VALUES ('31', 'temp.createdBy', 'Created By', '1', '1', '1', '1', '1', 'left', 'input', 'Created By', '6');
INSERT INTO `common_grid_column_template` (`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`) VALUES ('31', 'temp.createdOn', 'Created On', '1', '1', '1', '1', '1', 'center', 'date', 'Created On', '7');

INSERT INTO `common_grid_state_template` (`grid_id`, `start_from`, `total_rows`, `column_widths`) VALUES ('31', '0', '10', '100,210,210,210,210,210');
INSERT INTO `common_grid_column_template` (`grid_id`, `field`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `column_order`) VALUES ('31', 'checkbox', '1', '1', '1', '1', '1', 'center', 'checkbox', '1');
UPDATE `common_grid_state_template` SET `column_widths` = '50,100,210,210,210,210,210' WHERE (`id` = '31');

ALTER TABLE `vp_bill_template_mst` 
CHANGE COLUMN `status` `status` CHAR(1) NOT NULL DEFAULT 'A' ;





