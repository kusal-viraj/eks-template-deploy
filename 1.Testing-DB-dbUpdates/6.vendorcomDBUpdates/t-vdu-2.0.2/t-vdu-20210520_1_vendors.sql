INSERT INTO `vendor_grid_template` (`id`, `grid_name`) VALUES ('22', 'VENDOR_DASHBOARD_BILL_LIST');

INSERT INTO `vendor_grid_column_template` (`id`, `grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES ('231', '22', 'vdbill.tenantId', 'Customer', '1', '1', '1', '1', '1', 'left', 'multiSelect', 'Customer Name', '3', NULL, '');
INSERT INTO `vendor_grid_column_template` (`id`, `grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES ('232', '22', 'vdbill.invoiceNo', 'Invoice Number', '1', '1', '1', '1', '1', 'left', 'input', 'Invoice Number', '4', NULL, '');
INSERT INTO `vendor_grid_column_template` (`id`, `grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES ('233', '22', 'vdbill.invoiceDate', 'Invoice Date', '1', '1', '1', '1', '1', 'center', 'date', 'Invoice Date', '5', NULL, '');
INSERT INTO `vendor_grid_column_template` (`id`, `grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES ('234', '22', 'vdbill.dueDate', 'Due Date ', '1', '1', '1', '1', '1', 'center', 'date', 'Due Date', '8', NULL, '');
INSERT INTO `vendor_grid_column_template` (`id`, `grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES ('235', '22', 'vdbill.applicableDiscountAmount', 'Applicable Discount', '1', '1', '1', '1', '1', 'right', 'numeric', 'Applicable Discount', '19', NULL, '');
INSERT INTO `vendor_grid_column_template` (`id`, `grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES ('236', '22', 'vdbill.status', 'Status', '1', '1', '1', '1', '1', 'center', 'dropdown', 'Approval Status', '17', '5', '');

INSERT INTO `vendor_grid_state_template` (`id`, `grid_id`, `start_from`, `total_rows`, `column_widths`) VALUES ('22', '22', '0', '10', '210,210,210,210,210,210');