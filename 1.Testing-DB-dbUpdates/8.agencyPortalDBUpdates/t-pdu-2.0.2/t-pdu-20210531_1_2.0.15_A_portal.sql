INSERT INTO  `common_grid_template` (`id`, `grid_name`) VALUES ('11', 'GRID_PORTAL_PURCHASE_ORDER_DASHBOARD');

INSERT INTO `common_grid_state_template` ( `grid_id`, `start_from`, `total_rows`, `column_widths`) VALUES ( '11', '0', '10', '268,268,268,268,210');

INSERT INTO `common_grid_column_template` ( `grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES ( '11', 'pPO.subAccount', 'Sub Account', '1', '0', '0', '0', '0', 'left', 'multiSelect', 'Sub Account', '3', NULL, '');
INSERT INTO `common_grid_column_template` ( `grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES ( '11', 'pPO.submittedPo', 'Number of Submitted Purchase Orders', '1', '1', '0', '0', '0', 'right', ' ', 'Number of Submitted Purchase Orders', '19', NULL, '');
INSERT INTO `common_grid_column_template` ( `grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES ( '11', 'pPO.approvedPo', 'Number of Approved Purchase Orders', '1', '1', '0', '0', '0', 'right', ' ', 'Number of Approved Purchase Orders', '19', NULL, '');
INSERT INTO `common_grid_column_template` ( `grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES ( '11', 'pPO.rejectedPo', 'Number of Rejected Purchase Orders', '1', '1', '0', '0', '0', 'right', ' ', 'Number of Rejected Purchase Orders', '19', NULL, '');
INSERT INTO `common_grid_column_template` ( `grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES ( '11', 'pPO.totalPayable', 'Total Payable', '1', '1', '0', '0', '0', 'right', ' ', 'Total Payable', '19', NULL, '');

UPDATE `common_grid_column_template` SET `id`='209', `grid_id`='8', `field`='pdBill.totalAmountOfActivePayment', `header`='Total Amount Of Active Payment', `column_show`='1', `is_sortable`='1', `is_re_orderable`='0', `is_re_sizable`='0', `can_hide`='0', `align`='right', `search_type`=' ', `placeholder`='Total Amount Of Active Payment', `column_order`='19', `drop_down_id`=NULL, `drop_down_url`='' WHERE (`id`='209');


INSERT INTO `umm_menu_privilage`(`menu_id`, `privilage_id`, `auth_code`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES ( 1021, 70, 'PURCHASE_ORDER_SEND_VENDOR_APPROVAL', 'System', '2021-05-21 21:32:36', NULL, NULL, NULL, NULL);


