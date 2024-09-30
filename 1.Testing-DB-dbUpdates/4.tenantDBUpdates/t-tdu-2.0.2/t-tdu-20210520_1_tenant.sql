INSERT INTO `common_drop_down` (`id`, `drop_down_name`) VALUES ('21', 'Approval Status');

INSERT INTO `common_drop_down_connection` (`id`, `drop_down_id`, `drop_down_value_id`) VALUES ('61', '21', '11');
INSERT INTO `common_drop_down_connection` (`id`, `drop_down_id`, `drop_down_value_id`) VALUES ('62', '21', '12');
INSERT INTO `common_drop_down_connection` (`id`, `drop_down_id`, `drop_down_value_id`) VALUES ('63', '21', '13');


INSERT INTO `common_grid_template` (`id`, `grid_name`) VALUES ('26', 'DISCOUNT_APPLICABLE_LIST');

INSERT INTO `common_grid_state_template` (`id`, `grid_id`, `start_from`, `total_rows`, `column_widths`) VALUES ('26', '26', '0', '10', '100,210,210,210,210,210,210,210');

INSERT INTO `common_grid_column_template` (`id`, `grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES ('263', '26', 'action', 'Action', '1', '0', '0', '0', '0', 'center', 'actionButton', '', '2', NULL, '');
INSERT INTO `common_grid_column_template` (`id`, `grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES ('264', '26', 'vendor.id', 'Vendor', '1', '1', '1', '1', '1', 'left', 'multiSelect', 'Vendor', '3', NULL, '');
INSERT INTO `common_grid_column_template` (`id`, `grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES ('265', '26', 'discount.billNo', 'Bill No', '1', '1', '1', '1', '1', 'left', 'input', 'Bill No.', '7', NULL, '');
INSERT INTO `common_grid_column_template` (`id`, `grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES ('266', '26', 'discount.billDate', 'Bill Date', '1', '1', '1', '1', '1', 'center', 'date', 'Bill Date', '10', NULL, '');
INSERT INTO `common_grid_column_template` (`id`, `grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES ('267', '26', 'discount.status', 'Approval Status', '1', '1', '1', '1', '1', 'center', 'dropdown', 'Approval Status', '17', '21', '');
INSERT INTO `common_grid_column_template` (`id`, `grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES ('268', '26', 'discount.billAmount', 'Bill Amount', '1', '1', '1', '1', '1', 'right', 'numeric', 'Bill Amount', '8', NULL, '');
INSERT INTO `common_grid_column_template` (`id`, `grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES ('269', '26', 'discount.term', 'Term', '1', '1', '1', '1', '1', 'left', 'dropdown', 'Term', '7', NULL, '');
INSERT INTO `common_grid_column_template` (`id`, `grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES ('270', '26', 'discount.discountAmount', 'Discount Amount', '1', '1', '1', '1', '1', 'right', 'numeric', 'Discount Amount', '5', NULL, '');
