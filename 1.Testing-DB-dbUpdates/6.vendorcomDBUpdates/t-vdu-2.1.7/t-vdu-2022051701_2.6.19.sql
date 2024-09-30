------------2.6.19-----Madhusha---------


INSERT INTO `vendor_grid_template`(`id`, `grid_name`) VALUES (27, 'VENDOR_CREDIT_NOTE_LIST');


INSERT INTO `vendor_grid_column_template`(`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (27, 'action', 'Action', 1, 0, 0, 0, 0, 'center', 'actionButton', '', 1, NULL, '');

INSERT INTO `vendor_grid_column_template`(`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (27, 'creditNote.creditNoteNo', 'Credit Note Number', 1, 1, 1, 1, 1, 'left', 'input', 'Credit Note No.', 2, NULL, '');

INSERT INTO `vendor_grid_column_template`(`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (27, 'creditNote.creditNoteDate', 'Credit Note Date', 1, 1, 1, 1, 1, 'center', 'date', 'Credit Note date', 3, NULL, '');

INSERT INTO `vendor_grid_column_template`(`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (27, 'creditNote.tenantId', 'Customer', 1, 1, 1, 1, 1, 'left', 'dropdown', 'Customer', 4, NULL, '');

INSERT INTO `vendor_grid_column_template`(`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (27, 'creditNote.customerEmail', 'Customer Email', 1, 1, 1, 1, 1, 'left', 'input', 'Customer Email', 5, NULL, '');

INSERT INTO `vendor_grid_column_template`(`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (27, 'creditNote.poId', 'Purchase Order', 1, 1, 1, 1, 1, 'left', 'dropdown', 'Purchase Order', 6, NULL, '');

INSERT INTO `vendor_grid_column_template`(`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (27, 'creditNote.creditTotal', 'Credit Total', 1, 1, 1, 1, 1, 'right', 'numeric', 'Credit Total', 7, NULL, '');

INSERT INTO `vendor_grid_column_template`(`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (27, 'creditNote.createdOn', 'Created Date', 1, 1, 1, 1, 1, 'center', 'date', 'Created Date', 9, NULL, '');

INSERT INTO `vendor_grid_column_template`(`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (27, 'creditNote.creditBalance', 'Credit Balance', 1, 1, 1, 1, 1, 'right', 'numeric', 'Credit Balance', 8, NULL, '');

INSERT INTO `vendor_grid_state_template`(`grid_id`, `start_from`, `total_rows`, `column_widths`) VALUES (27, 0, 15, '100,210,210,210,210,210,210,210,210');

INSERT INTO `vendor_drop_down_value`(`id`, `value`, `label`) VALUES (31, 'C', 'Canceled');

INSERT INTO `vendor_drop_down`(`id`, `drop_down_name`) VALUES (30, 'Credit Note Status');

INSERT INTO `vendor_drop_down_connection`(`drop_down_id`, `drop_down_value_id`) VALUES (30, 1);

INSERT INTO `vendor_drop_down_connection`(`drop_down_id`, `drop_down_value_id`) VALUES (30, 2);

INSERT INTO `vendor_drop_down_connection`(`drop_down_id`, `drop_down_value_id`) VALUES (30, 31);

INSERT INTO `vendor_grid_column_template`(`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`) VALUES (27, 'creditNote.status', 'Status', 1, 1, 1, 1, 1, 'center', 'dropdown', 'Status', 10, 30);

INSERT INTO `vendor_menu`(`id`, `name`, `display_text`, `menu_style`, `url`, `tab`, `type`, `super_type`, `department`, `menu_order`, `display_icon`, `short_name`, `detail_text`, `status`, `individual_tenant_menu`, `vendor_community_menu`, `version`, `auth_code`, `slim_menu`, `created_by`, `created_on`, `hierachy`) VALUES (1023, 'Credit Notes', 'Credit Notes', 'fa fa-list-alt', 'invoices', '4', 'S', 1008, 'Admin', 4, 'fa fa-list-alt', 'Credit Notes', 'Credit Notes', 'A', 0, 1, 'V2', 'CREDIT_NOTES', 0, 'System', '2022-05-17 13:55:45', '1008');

INSERT INTO `vendor_privilages`(`id`, `url`, `text`, `auth_code`, `created_on`, `created_by`) VALUES (54, 'Save As Draft', 'Save As Draft', 'SAVE_AS_DRAFT', '2022-05-17 13:59:22', 'System');

INSERT INTO `vendor_privilages`(`id`, `url`, `text`, `auth_code`, `created_on`, `created_by`) VALUES (55, 'Send To Customer', 'Send To Customer', 'SEND_TO_CUSTOMER', '2022-05-17 14:00:52', 'System');

INSERT INTO `vendor_privilages`(`id`, `url`, `text`, `auth_code`, `created_on`, `created_by`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (56, 'View Attached Bills', 'View Attached Bilss', 'VIEW_ATTACHED_BILLS', '2022-05-17 14:18:53', 'System', NULL, NULL, NULL, NULL);


INSERT INTO `vendor_privilages`(`id`, `url`, `text`, `auth_code`, `created_on`, `created_by`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (57, 'Cancel', 'Cancel', 'CANCEL', '2022-05-17 14:21:12', 'System', NULL, NULL, NULL, NULL);


INSERT INTO `vendor_menu_privilage`(`menu_id`, `prililage_id`, `auth_code`, `created_by`, `created_on`) VALUES (1023, 54, 'CREDIT_NOTE_SAVE_AS_DRAFT', 'System', '2022-05-17 14:09:17');

INSERT INTO `vendor_menu_privilage`(`menu_id`, `prililage_id`, `auth_code`, `created_by`, `created_on`) VALUES (1023, 55, 'CREDIT_NOTE_SEND_TO_CUSTOMER', 'System', '2022-05-17 14:10:10');

INSERT INTO `vendor_menu_privilage`(`menu_id`, `prililage_id`, `auth_code`, `created_by`, `created_on`) VALUES (1023, 2, 'VENDOR_CREDIT_NOTE_SEARCH', 'System', '2022-05-17 14:14:40');

INSERT INTO `vendor_menu_privilage`(`menu_id`, `prililage_id`, `auth_code`, `created_by`, `created_on`) VALUES (1023, 3, 'VENDOR_CREDIT_NOTE_DETAIL_VIEW', 'System', '2022-05-17 14:15:53');

INSERT INTO `vendor_menu_privilage`(`menu_id`, `prililage_id`, `auth_code`, `created_by`, `created_on`) VALUES (1023, 4, 'VENDOR_CREDIT_NOTE_EDIT', 'System', '2022-05-17 14:16:42');

INSERT INTO `vendor_menu_privilage`(`menu_id`, `prililage_id`, `auth_code`, `created_by`, `created_on`) VALUES (1023, 5, 'VENDOR_CREDIT_NOTE_DELETE', 'System', '2022-05-17 14:17:37');

INSERT INTO `vendor_menu_privilage`(`menu_id`, `prililage_id`, `auth_code`, `created_by`, `created_on`) VALUES (1023, 56, 'VENDOR_CREDIT_NOTE_VIEW_ATTACHED_BILLS', 'System', '2022-05-17 14:20:12');

INSERT INTO `vendor_menu_privilage`(`menu_id`, `prililage_id`, `auth_code`, `created_by`, `created_on`) VALUES (1023, 57, 'VENDOR_CREDIT_NOTE_CANCEL', 'System', '2022-05-17 14:22:59');