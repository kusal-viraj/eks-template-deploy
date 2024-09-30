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