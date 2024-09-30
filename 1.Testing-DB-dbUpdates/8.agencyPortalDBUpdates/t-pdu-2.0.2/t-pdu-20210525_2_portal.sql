INSERT INTO `common_grid_template` (`id`, `grid_name`) VALUES ('8', 'PORTAL_DASHBOARD_BILL_PAYMENT_TABLE');

INSERT INTO `common_grid_state_template` (`id`, `grid_id`, `start_from`, `total_rows`, `column_widths`) VALUES ('22', '8', '0', '10', '210,210,210,210,210');

INSERT INTO `common_grid_column_template` ( `grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES ( '8', 'pdBill.subAccount', 'Sub Account', '1', '0', '0', '0', '0', 'left', 'multiSelect', 'Sub Account', '3', NULL, '');
INSERT INTO `common_grid_column_template` ( `grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES ( '8', 'pdBill.totalPaymenetCount', 'Total Payment Count', '1', '1', '0', '0', '0', 'right', ' ', 'Total Payment Count', '19', NULL, '');
INSERT INTO `common_grid_column_template` ( `grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES ( '8', 'pdBill.activePayment', 'Active Payment', '1', '1', '0', '0', '0', 'right', ' ', 'Active Payment', '19', NULL, '');
INSERT INTO `common_grid_column_template` ( `grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES ( '8', 'pdBill.voidedPayment', 'Voided Payment', '1', '1', '0', '0', '0', 'right', ' ', 'Voided Payment', '19', NULL, '');
INSERT INTO `common_grid_column_template` ( `grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES ( '8', 'pdBill.totalAmountOfActivePayment', 'Total Amount Of Active Payment', '1', '1', '0', '0', '0', 'right', ' ', 'Total Amount Of Active Payment', '19', NULL, '');




