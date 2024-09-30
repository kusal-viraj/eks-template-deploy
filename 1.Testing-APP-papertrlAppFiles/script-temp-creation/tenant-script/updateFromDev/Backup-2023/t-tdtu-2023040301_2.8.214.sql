ALTER TABLE vp_payment_recipient_detail 
ADD COLUMN status char(1) NOT NULL AFTER preferred_payment_type;

UPDATE vp_payment_recipient_detail SET status = 'A';

INSERT INTO `umm_menu`(`id`, `name`, `display_text`, `menu_style`, `url`, `tab`, `type`, `super_type`, `department`, `menu_order`, `display_icon`, `short_name`, `detail_text`, `status`, `portal_menu`, `individual_tenant_menu`, `vendor_community_menu`, `mobile_menu`, `version`, `auth_code`, `slim_menu`, `hierachy`, `created_by`, `created_on`) VALUES (1059, 'V-Cards', 'V-Cards', 'pi pi-money-bill', '/home/v-cards', '0', 'S', 1015, 'Admin', 5, 'pi pi-money-bill', 'V-Cards', 'V-Cards', 'A', 0, 1, 0, 0, 'V2', 'V_CARDS', 1, '1005,1015', 'System', '2023-03-27 13:13:05');


INSERT INTO `umm_privilages`(`id`, `url`, `text`, `auth_code`, `created_by`, `created_on`) VALUES (140, 'Cancel', 'Cancel', 'CANCEL', 'System', '2023-03-27 13:21:56');

INSERT INTO `umm_menu_privilage`(`id`, `menu_id`, `privilage_id`, `auth_code`, `created_by`, `created_on`) VALUES (530, 1059, 2, 'V_CARD_SEARCH', 'System', '2023-03-27 13:16:38');

INSERT INTO `umm_menu_privilage`(`id`, `menu_id`, `privilage_id`, `auth_code`, `created_by`, `created_on`) VALUES (531, 1059, 4, 'V_CARD_EDIT', 'System', '2023-03-27 13:18:15');

INSERT INTO `umm_menu_privilage`(`id`, `menu_id`, `privilage_id`, `auth_code`, `created_by`, `created_on`) VALUES (532, 1059, 140, 'V_CARD_CANCEL', 'System', '2023-03-27 13:22:43');

INSERT INTO `umm_menu_privilage`(`id`, `menu_id`, `privilage_id`, `auth_code`, `created_by`, `created_on`) VALUES (533, 1059, 3, 'V_CARD_DETAIL_VIEW', 'System', '2023-03-27 13:29:01');

INSERT INTO `umm_menu_privilage`(`id`, `menu_id`, `privilage_id`, `auth_code`, `created_by`, `created_on`) VALUES (534, 1059, 10, 'V_CARD_AUDIT_TRAIL', 'System', '2023-03-27 13:30:09');


INSERT INTO `umm_role_previlege`(`role_id`, `privilege_id`, `created_by`, `created_on`) VALUES (1, 1059, 'admin', '2023-03-27 13:32:23');
INSERT INTO `umm_role_previlege`(`role_id`, `privilege_id`, `created_by`, `created_on`) VALUES (1, 530, 'System', '2023-03-27 13:33:06');
INSERT INTO `umm_role_previlege`(`role_id`, `privilege_id`, `created_by`, `created_on`) VALUES (1, 531, 'System', '2023-03-27 13:33:34');
INSERT INTO `umm_role_previlege`(`role_id`, `privilege_id`, `created_by`, `created_on`) VALUES (1, 532, 'System', '2023-03-27 13:33:34');
INSERT INTO `umm_role_previlege`(`role_id`, `privilege_id`, `created_by`, `created_on`) VALUES (1, 533, 'System', '2023-03-27 13:33:34');
INSERT INTO `umm_role_previlege`(`role_id`, `privilege_id`, `created_by`, `created_on`) VALUES (1, 534, 'System', '2023-03-27 13:33:34');


INSERT INTO `common_grid_template`(`id`, `grid_name`) VALUES (66, 'V_CARD');

INSERT INTO `common_grid_state_template`(`id`, `grid_id`, `total_rows`, `column_widths`) VALUES (66, 66, 25, '50,50,210,210,210,210,210,210,210,210');

INSERT INTO `common_drop_down`(`id`, `drop_down_name`) VALUES (35, 'VCard Status');

INSERT INTO `common_drop_down_connection`(`id`, `drop_down_id`, `drop_down_value_id`) VALUES (121, 35, 1);

INSERT INTO `common_drop_down_connection`(`id`, `drop_down_id`, `drop_down_value_id`) VALUES (122, 35, 48);

INSERT INTO `common_grid_column_template`(`id`, `grid_id`, `field`, `sortable_field`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `filter_show`, `is_frozen`, `frozen_direction`, `align`, `search_type`, `column_order`, `column_width`) VALUES (687, 66, 'checkbox', 'checkbox', 1, 0, 0, 0, 0, 0, 1, 'left', 'center', 'checkbox', 1, 50);

INSERT INTO `common_grid_column_template`(`id`, `grid_id`, `field`, `sortable_field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `filter_show`, `is_frozen`, `align`, `search_type`, `placeholder`, `column_order`, `column_width`) VALUES (688, 66, 'vcard.balanceAmount', 'vcard.balanceAmount', 'Balance Amount', 1, 1, 0, 0, 1, 1, 0, 'right', 'numeric', 'Balance Amount', 2, 140);

INSERT INTO `common_grid_column_template`(`id`, `grid_id`, `field`, `sortable_field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `filter_show`, `is_frozen`, `align`, `search_type`, `placeholder`, `column_order`, `column_width`) VALUES (689, 66, 'vcard.nickName', 'vcard.nickName', 'Nick Name', 1, 1, 0, 0, 1, 1, 0, 'left', 'input', 'Nick Name', 3, 140);

INSERT INTO `common_grid_column_template`(`id`, `grid_id`, `field`, `sortable_field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `filter_show`, `is_frozen`, `align`, `search_type`, `placeholder`, `column_order`, `column_width`) VALUES (690, 66, 'vcard.expireOn', 'vcard.expireOn', 'Expiration Date', 1, 1, 0, 0, 1, 1, 0, 'left', 'date', 'Expiration Date', 4, 140);

INSERT INTO `common_grid_column_template`(`id`, `grid_id`, `field`, `sortable_field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `filter_show`, `is_frozen`, `align`, `search_type`, `placeholder`, `column_order`, `column_width`) VALUES (691, 66, 'vcard.createdOn', 'vcard.createdOn', 'Created Date', 1, 1, 0, 0, 1, 1, 0, 'left', 'date', 'Created Date', 5, 140);

INSERT INTO `common_grid_column_template`(`id`, `grid_id`, `field`, `sortable_field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `filter_show`, `is_frozen`, `align`, `search_type`, `placeholder`, `column_order`, `column_width`) VALUES (692, 66, 'vcard.cardOwner', 'vcard.cardOwner', 'Card Owner', 1, 1, 0, 0, 1, 1, 0, 'left', 'input', 'Card Owner', 6, 140);

INSERT INTO `common_grid_column_template`(`id`, `grid_id`, `field`, `sortable_field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `filter_show`, `is_frozen`, `align`, `search_type`, `placeholder`, `column_order`, `column_width`) VALUES (693, 66, 'vcard.amount', 'vcard.amount', 'Amount', 1, 1, 0, 0, 1, 1, 0, 'right', 'numeric', 'Amount', 7, 140);

INSERT INTO `common_grid_column_template`(`id`, `grid_id`, `field`, `sortable_field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `filter_show`, `is_frozen`, `align`, `search_type`, `placeholder`, `column_order`, `column_width`) VALUES (694, 66, 'vcard.documentNos', 'vcard.documentNos', 'Document No', 1, 0, 0, 0, 0, 1, 0, 'left', 'input', 'Document No', 8, 140);

INSERT INTO `common_grid_column_template`(`id`, `grid_id`, `field`, `sortable_field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `filter_show`, `is_frozen`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `column_width`) VALUES (695, 66, 'vcard.status', 'vcard.status', 'Status', 1, 1, 0, 1, 1, 1, 0, 'left', 'dropdown', 'All', 9, 35, 140);

INSERT INTO `common_grid_column_template`(`id`, `grid_id`, `field`, `sortable_field`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `filter_show`, `is_frozen`, `frozen_direction`, `align`, `search_type`, `column_order`, `column_width`) VALUES (696, 66, 'action', 'action', 1, 0, 0, 0, 0, 0, 1, 'right', 'left', 'actionButton', 10, 50);

ALTER TABLE `vp_payment_v_card` 
ADD COLUMN `effective_until` date NULL AFTER `scheduled_time`;
