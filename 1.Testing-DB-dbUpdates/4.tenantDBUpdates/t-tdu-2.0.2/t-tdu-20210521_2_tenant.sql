delete from common_drop_down_connection where id =62;

UPDATE `common_grid_column_template` SET `id`='265', `grid_id`='26', `field`='discount.billNo', `header`='Bill Number', `column_show`='1', `is_sortable`='1', `is_re_orderable`='1', `is_re_sizable`='1', `can_hide`='1', `align`='left', `search_type`='input', `placeholder`='Bill Number', `column_order`='7', `drop_down_id`=NULL, `drop_down_url`='' WHERE (`id`='265');

INSERT INTO `umm_privilages` (`id`, `url`, `text`, `auth_code`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (78, 'Show Discount Applicable Bill Table', 'Show Discount Applicable Bill Table', 'SHOW_DISCOUNT_APPLICABLE_BILL_TABLE', 'System', '2021-04-20 12:23:27', NULL, NULL, NULL, NULL);

INSERT INTO `umm_menu_privilage` (`id`, `menu_id`, `privilage_id`, `auth_code`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (374, 1000, 78, 'DASHBOARD_SHOW_DISCOUNT_APPLICABLE_BILL_TABLE', 'System', '2021-05-21 02:17:33', NULL, NULL, NULL, NULL);

INSERT INTO `umm_role_previlege` (`role_id`, `privilege_id`, `sub_account_id`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (1, 374, NULL, 'admin', '2021-05-21 02:21:20', NULL, NULL, NULL, NULL);

