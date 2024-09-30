UPDATE `vendor_privilages` SET `url` = 'Show Received Payments Table', `text` = 'Show Received Payments Table', `auth_code` = 'SHOW_RECEIVED_PAYMENTS_TABLE', `created_on` = '2021-06-02 06:56:42', `created_by` = 'System', `update_by` = NULL, `update_on` = NULL, `delete_by` = NULL, `delete_on` = NULL WHERE `id` = 43;
INSERT INTO `vendor_menu_privilage`(`id`, `menu_id`, `prililage_id`, `auth_code`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (195, 1000, 43, 'DASHBOARD_SHOW_RECEIVED_PAYMENTS_TABLE', 'System', '2021-06-02 20:28:04', NULL, NULL, NULL, NULL);

INSERT INTO `vendor_grid_template` (`id`, `grid_name`) VALUES ('9', 'VENDOR_DASHBOARD_BILL_PAYMENT_LIST');

INSERT INTO `vendor_grid_state_template` (`grid_id`, `start_from`, `total_rows`, `column_widths`) VALUES ('9', '0', '15', '100,210,210,210,210,210,210');



INSERT INTO `vendor_grid_column_template` (`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES ( '9', 'vbp.tenantId', 'Customer', '1', '1', '1', '1', '1', 'left', 'multiSelect', 'Customer', '3', NULL, '');
INSERT INTO `vendor_grid_column_template` (`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES ( '9', 'vbp.paymentRef', 'Payment Ref', '1', '1', '1', '1', '1', 'left', 'input', 'Payment Ref', '4', NULL, '');
INSERT INTO `vendor_grid_column_template` (`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES ( '9', 'vbp.amount', 'Amount', '1', '1', '1', '1', '1', 'right', 'numeric', 'Amount', '19', NULL, '');
INSERT INTO `vendor_grid_column_template` (`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES ( '9', 'vbp.discount', 'Discount', '1', '1', '1', '1', '1', 'right', 'numeric', 'Discount', '19', NULL, '');
INSERT INTO `vendor_grid_column_template` (`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES ( '9', 'vbp.date', 'Date', '1', '1', '1', '1', '1', 'center', 'date', 'Date', '5', NULL, '');
INSERT INTO `vendor_grid_column_template` (`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES ( '9', 'vbp.invoiceNo', 'Invoice Number', '1', '1', '1', '1', '1', 'left', 'input', 'Invoice Number', '4', NULL, '');
INSERT INTO `vendor_grid_column_template` (`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES ( '9', 'action', 'Action', '1', '0', '0', '0', '0', 'center', 'actionButton', '', '2', NULL, '');

UPDATE `vendor_grid_state_template` SET `id`='6', `grid_id`='6', `start_from`='0', `total_rows`='15', `column_widths`='210,210,210,210,210,210,210' WHERE (`id`='6');


UPDATE `vendor_grid_column_template` SET `id`='249', `grid_id`='6', `field`='vdbill.status', `header`='Approval Status', `column_show`='1', `is_sortable`='1', `is_re_orderable`='1', `is_re_sizable`='1', `can_hide`='1', `align`='center', `search_type`='dropdown', `placeholder`='Approval Status', `column_order`='17', `drop_down_id`='5', `drop_down_url`='' WHERE (`id`='249');

INSERT INTO `vendor_grid_column_template` (`id`, `grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES ('261', '6', 'vdbill.paymentStatus', 'Payment Status', '1', '1', '1', '1', '1', 'center', 'dropdown', 'Payment Status', '17', '6', '');


