------------Amal--------2.6.44------------

INSERT INTO `umm_menu` (`id`, `name`, `display_text`, `menu_style`, `url`, `tab`, `type`, `super_type`, `super_type_2`, `department`, `menu_order`, `display_icon`, `short_name`, `detail_text`, `status`, `portal_menu`, `individual_tenant_menu`, `vendor_community_menu`, `version`, `auth_code`, `slim_menu`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`, `hierachy`) VALUES (1016, 'Support Ticket', 'Support Ticket', 'fa fa-life-ring', '/home/support-ticket', NULL, 'S', 1002, NULL, 'Admin', 9, 'fa fa-life-ring', 'Support Ticket', 'Support Ticket', 'A', 0, 1, 0, 'V2', 'SUPPORT_TICKET', 1, 'System', '2022-05-24 12:07:11', NULL, NULL, NULL, NULL, '1000');
INSERT INTO `umm_privilages` (`id`, `url`, `text`, `auth_code`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (71, 'Support Ticket', 'Support Ticket', 'SUPPORT_TICKET', 'System', '2022-05-24 07:59:00', NULL, NULL, NULL, NULL);
INSERT INTO `umm_menu_privilage` (`id`, `menu_id`, `privilage_id`, `auth_code`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (44, 1016, 71, 'SUPPORT_TICKET', 'System', '2021-05-24 11:26:00', NULL, NULL, NULL, NULL);
INSERT INTO `umm_role_previlege` (`role_id`, `privilege_id`, `sub_account_id`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (1, 44, NULL, 'support', '2019-07-03 14:18:40', NULL, NULL, NULL, NULL);

-- common grid template -- support last id 12 
INSERT INTO `common_grid_template` (`id`, `grid_name`) VALUES (13, 'SUPPORT_TICKET');

-- common grid drop down -- last id 3
INSERT INTO `common_drop_down` (`id`, `drop_down_name`) VALUES (4, 'Ticket Status');

-- common drop down value -- last id 5
INSERT INTO `common_drop_down_value` (`id`, `value`, `label`) VALUES (6, 'Waiting for Support', 'Waiting for Support');
INSERT INTO `common_drop_down_value` (`id`, `value`, `label`) VALUES (7, 'Canceled', 'Canceled');
INSERT INTO `common_drop_down_value` (`id`, `value`, `label`) VALUES (8, 'Closed', 'Closed');
INSERT INTO `common_drop_down_value` (`id`, `value`, `label`) VALUES (9, 'Done', 'Done');
INSERT INTO `common_drop_down_value` (`id`, `value`, `label`) VALUES (10, 'Escalated', 'Escalated');
INSERT INTO `common_drop_down_value` (`id`, `value`, `label`) VALUES (11, 'In Progress', 'In Progress');
INSERT INTO `common_drop_down_value` (`id`, `value`, `label`) VALUES (12, 'Open', 'Open');
INSERT INTO `common_drop_down_value` (`id`, `value`, `label`) VALUES (13, 'Pending ', 'Pending ');
INSERT INTO `common_drop_down_value` (`id`, `value`, `label`) VALUES (14, 'Reopened', 'Reopened');
INSERT INTO `common_drop_down_value` (`id`, `value`, `label`) VALUES (15, 'Resolved', 'Resolved');
INSERT INTO `common_drop_down_value` (`id`, `value`, `label`) VALUES (16, 'Waiting for Customer', 'Waiting for Customer');
INSERT INTO `common_drop_down_value` (`id`, `value`, `label`) VALUES (17, 'Work in Progress', 'Work in Progress');

-- common drop down connection -- last id 8 
INSERT INTO `common_drop_down_connection` (`id`, `drop_down_id`, `drop_down_value_id`) VALUES (9, 4, 6);
INSERT INTO `common_drop_down_connection` (`id`, `drop_down_id`, `drop_down_value_id`) VALUES (10, 4, 7);
INSERT INTO `common_drop_down_connection` (`id`, `drop_down_id`, `drop_down_value_id`) VALUES (11, 4, 8);
INSERT INTO `common_drop_down_connection` (`id`, `drop_down_id`, `drop_down_value_id`) VALUES (12, 4, 9);
INSERT INTO `common_drop_down_connection` (`id`, `drop_down_id`, `drop_down_value_id`) VALUES (13, 4, 10);
INSERT INTO `common_drop_down_connection` (`id`, `drop_down_id`, `drop_down_value_id`) VALUES (14, 4, 11);
INSERT INTO `common_drop_down_connection` (`id`, `drop_down_id`, `drop_down_value_id`) VALUES (15, 4, 12);
INSERT INTO `common_drop_down_connection` (`id`, `drop_down_id`, `drop_down_value_id`) VALUES (16, 4, 13);
INSERT INTO `common_drop_down_connection` (`id`, `drop_down_id`, `drop_down_value_id`) VALUES (17, 4, 14);
INSERT INTO `common_drop_down_connection` (`id`, `drop_down_id`, `drop_down_value_id`) VALUES (18, 4, 15);
INSERT INTO `common_drop_down_connection` (`id`, `drop_down_id`, `drop_down_value_id`) VALUES (19, 4, 16);
INSERT INTO `common_drop_down_connection` (`id`, `drop_down_id`, `drop_down_value_id`) VALUES (20, 4, 17);


-- common grid column template -- support last id 70
INSERT INTO `common_grid_column_template` (`id`, `grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (71, 13, 'action', 'Action', 1, 0, 0, 0, 0, 'center', 'actionButton', '', 1, NULL, '');
INSERT INTO `common_grid_column_template` (`id`, `grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (72, 13, 'sup.custTicketId', 'Ticket No.', 1, 1, 1, 1, 1, 'left', 'input', 'Ticket No.', 2, NULL, '');
INSERT INTO `common_grid_column_template` (`id`, `grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (73, 13, 'sup.summary', 'Summary', 1, 1, 1, 1, 1, 'left', 'input', 'Summary', 3, NULL, '');
INSERT INTO `common_grid_column_template` (`id`, `grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (74, 13, 'sup.description', 'Description', 1, 1, 1, 1, 1, 'left', 'input', 'Description', 4, NULL, '');
INSERT INTO `common_grid_column_template` (`id`, `grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (75, 13, 'sup.createdOn', 'Created Date', 1, 1, 1, 1, 1, 'center', 'date', 'Created Date', 5, NULL, '');
INSERT INTO `common_grid_column_template` (`id`, `grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (76, 13, 'sup.status', 'Status', 1, 1, 1, 1, 1, 'center', 'dropdown', 'Status', 6, 4, '');

-- common grid state template -- support last id 11
INSERT INTO `common_grid_state_template` (`id`, `grid_id`, `start_from`, `total_rows`, `column_widths`) VALUES (12, 13, 0, 15, '210,210,210,210,210');




