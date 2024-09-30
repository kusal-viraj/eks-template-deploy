---------Hashila----------2.1.106-------------


UPDATE `vp_payment_batch_bill_wise_transaction` SET `payment_status` = 'N' WHERE `payment_status` = '';




INSERT INTO `umm_role_previlege` (`role_id`, `privilege_id`, `created_by`, `created_on`) VALUES (1, 396, 'System', '2021-05-20 18:08:06');
INSERT INTO `umm_role_previlege` (`role_id`, `privilege_id`, `created_by`, `created_on`) VALUES (1, 401, 'System', '2021-05-20 18:08:06');
INSERT INTO `umm_role_previlege` (`role_id`, `privilege_id`, `created_by`, `created_on`) VALUES (1, 402, 'System', '2021-05-20 18:08:06');
INSERT INTO `umm_role_previlege` (`role_id`, `privilege_id`, `created_by`, `created_on`) VALUES (1, 403, 'System', '2021-05-20 18:08:06');
INSERT INTO `umm_role_previlege` (`role_id`, `privilege_id`, `created_by`, `created_on`) VALUES (1, 404, 'System', '2021-05-20 18:08:06');
INSERT INTO `umm_role_previlege` (`role_id`, `privilege_id`, `created_by`, `created_on`) VALUES (1, 405, 'System', '2021-05-20 18:08:06');
INSERT INTO `umm_role_previlege` (`role_id`, `privilege_id`, `created_by`, `created_on`) VALUES (1, 406, 'System', '2021-05-20 18:08:06');
INSERT INTO `umm_role_previlege` (`role_id`, `privilege_id`, `created_by`, `created_on`) VALUES (1, 407, 'System', '2021-05-20 18:08:06');
INSERT INTO `umm_role_previlege` (`role_id`, `privilege_id`, `created_by`, `created_on`) VALUES (1, 408, 'System', '2021-05-20 18:08:06');
INSERT INTO `umm_role_previlege` (`role_id`, `privilege_id`, `created_by`, `created_on`) VALUES (1, 409, 'System', '2021-05-20 18:08:06');
INSERT INTO `umm_role_previlege` (`role_id`, `privilege_id`, `created_by`, `created_on`) VALUES (1, 423, 'System', '2021-05-20 18:08:06');
INSERT INTO `umm_role_previlege` (`role_id`, `privilege_id`, `created_by`, `created_on`) VALUES (1, 424, 'System', '2021-05-20 18:08:06');
INSERT INTO `umm_role_previlege` (`role_id`, `privilege_id`, `created_by`, `created_on`) VALUES (1, 425, 'System', '2021-05-20 18:08:06');

UPDATE `common_grid_column_template` SET `grid_id` = 32, `field` = 'bill.paymentUnderProcessing', `header` = 'Payment Under Processing', `column_show` = 1, `is_sortable` = 1, `is_re_orderable` = 1, `is_re_sizable` = 1, `can_hide` = 1, `align` = 'right', `search_type` = 'number', `placeholder` = 'Payment Under Processing', `column_order` = 10, `drop_down_id` = NULL, `drop_down_url` = '' WHERE `id` = 448;

UPDATE `vp_bill` SET `payment_under_processing` = 0 WHERE `payment_under_processing` IS NULL;

UPDATE `common_grid_column_template` SET `grid_id` = 34, `field` = 'billTxn.vendorId', `header` = 'Vendor', `column_show` = 1, `is_sortable` = 1, `is_re_orderable` = 1, `is_re_sizable` = 1, `can_hide` = 1, `align` = 'left', `search_type` = 'input', `placeholder` = 'Vendor', `column_order` = 2, `drop_down_id` = NULL, `drop_down_url` = '' WHERE `id` = 335;

UPDATE `common_grid_column_template` SET `grid_id` = 41, `field` = 'billTxn.vendorId', `header` = 'Vendor', `column_show` = 1, `is_sortable` = 0, `is_re_orderable` = 0, `is_re_sizable` = 0, `can_hide` = 0, `align` = 'left', `search_type` = 'input', `placeholder` = 'Vendor', `column_order` = 2, `drop_down_id` = NULL, `drop_down_url` = '' WHERE `id` = 411;




