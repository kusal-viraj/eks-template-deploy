---dasindu 2.10.1----



INSERT INTO `common_grid_template` (`grid_name`) VALUES ('VENDOR_LIST');

INSERT INTO `common_grid_state_template` (`grid_id`, `start_from`, `total_rows`, `column_widths`) VALUES (75, 0, 25, '50,214,190,210,260,215,260,190,190,155,50');

INSERT INTO `common_grid_column_template` (`grid_id`, `field`, `sortable_field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `filter_show`, `is_frozen`, `frozen_direction`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `column_width`, `drop_down_url_id`) VALUES (75, 'checkbox', 'checkbox', NULL, 1, 0, 0, 0, 0, 0, 1, 'left', 'center', 'checkbox', '', 1, NULL, 50, NULL);
INSERT INTO `common_grid_column_template` (`grid_id`, `field`, `sortable_field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `filter_show`, `is_frozen`, `frozen_direction`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `column_width`, `drop_down_url_id`) VALUES (75, 'action', 'action', NULL, 1, 0, 0, 0, 0, 0, 1, 'right', 'center', 'actionButton', '', 60, NULL, 50, NULL);

INSERT INTO `common_grid_column_template` (`grid_id`, `field`, `sortable_field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`,
 `is_re_sizable`, `can_hide`, `filter_show`, `is_frozen`, `frozen_direction`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`,
 `column_width`, `drop_down_url_id`) VALUES (75, 'vendor.name', 'vendor.name', 'Vendor Name', 1, 1, 1, 1, 1, 1, 0, NULL, 
 'left', 'input', 'Vendor Name', 2, NULL, 214, NULL);

INSERT INTO `common_grid_column_template` (`grid_id`, `field`, `sortable_field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`,
 `is_re_sizable`, `can_hide`, `filter_show`, `is_frozen`, `frozen_direction`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`,
 `column_width`, `drop_down_url_id`) VALUES (75, 'vendor.vendorCode', 'vendor.vendorCode', 'Vendor Code', 1, 1, 1, 1, 1, 1, 0, NULL, 
 'left', 'input', 'Vendor Code', 3, NULL, 190, NULL);

INSERT INTO `common_grid_column_template` (`grid_id`, `field`, `sortable_field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`,
 `is_re_sizable`, `can_hide`, `filter_show`, `is_frozen`, `frozen_direction`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`,
 `column_width`, `drop_down_url_id`) VALUES (75, 'vendor.contactPerson', 'vendor.contactPerson', 'Contact Name', 1, 1, 1, 1, 1, 1, 0, NULL, 
 'left', 'input', 'Contact Name', 4, NULL, 210, NULL);

INSERT INTO `common_grid_column_template` (`grid_id`, `field`, `sortable_field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`,
 `is_re_sizable`, `can_hide`, `filter_show`, `is_frozen`, `frozen_direction`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`,
 `column_width`, `drop_down_url_id`) VALUES (75, 'vendor.contactNumber', 'vendor.contactNumber', 'Contact Number', 1, 1, 1, 1, 1, 1, 0, NULL, 
 'left', 'input', 'Contact Number', 5, NULL, 260, NULL);

INSERT INTO `common_grid_column_template` (`grid_id`, `field`, `sortable_field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`,
 `is_re_sizable`, `can_hide`, `filter_show`, `is_frozen`, `frozen_direction`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`,
 `column_width`, `drop_down_url_id`) VALUES (75, 'vendor.fax', 'vendor.fax', 'Fax Number', 1, 1, 1, 1, 1, 1, 0, NULL, 
 'left', 'input', 'Fax Number', 6, NULL, 215, NULL);

INSERT INTO `common_grid_column_template` (`grid_id`, `field`, `sortable_field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`,
 `is_re_sizable`, `can_hide`, `filter_show`, `is_frozen`, `frozen_direction`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`,
 `column_width`, `drop_down_url_id`) VALUES (75, 'vendor.email', 'vendor.email', 'Email', 1, 1, 1, 1, 1, 1, 0, NULL, 
 'left', 'input', 'Email', 7, NULL, 260, NULL);

INSERT INTO `common_grid_column_template` (`grid_id`, `field`, `sortable_field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`,
 `is_re_sizable`, `can_hide`, `filter_show`, `is_frozen`, `frozen_direction`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`,
 `column_width`, `drop_down_url_id`) VALUES (75, 'payment.paymentTypeId', 'payment.paymentTypeId', 'Payment Types', 1, 1, 1, 1, 1, 1, 0, NULL, 
 'left', 'multiSelect', 'Payment Types', 8, NULL, 190, 2);

INSERT INTO `common_grid_column_template` (`grid_id`, `field`, `sortable_field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`,
 `is_re_sizable`, `can_hide`, `filter_show`, `is_frozen`, `frozen_direction`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`,
 `column_width`, `drop_down_url_id`) VALUES (75, 'term.id', 'term.id', 'Payment Term', 1, 1, 1, 1, 1, 1, 0, NULL, 
 'left', 'dropdown', 'Payment Term', 9, NULL, 190, 22);

INSERT INTO `common_grid_column_template` (`grid_id`, `field`, `sortable_field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `filter_show`, `is_frozen`, `frozen_direction`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `column_width`, `drop_down_url_id`) VALUES (75, 'vendor.status', 'vendor.status', 'Status', 1, 1, 1, 1, 1, 1, 0, NULL, 'left', 'dropdown', 'All', 10, 1, 155, NULL);