------------Madhusha-----2.5.131-------------

UPDATE `umm_menu` SET `name` = 'Credit Notes', `display_text` = 'Credit Notes', `url` = '/home/credit-notes', `tab` = '3', `super_type` = 1005, `menu_order` = 6, `short_name` = 'Credit Notes', `detail_text` = 'Credit Notes', `slim_menu` = 0 WHERE `id` = 1049;

INSERT INTO `umm_privilages`(`id`, `url`, `text`, `auth_code`, `created_by`, `created_on`) VALUES (127, 'Apply To Bill', 'Apply To Bill', 'CREDIT_NOTE_APPLY_TO_BILL', 'System', '2022-04-25 15:59:24');

INSERT INTO `umm_privilages`(`id`, `url`, `text`, `auth_code`, `created_by`, `created_on`) VALUES (128, 'Apply Credit Note', 'Apply Credit Note', 'BILL_APPLY_CREDIT_NOTE', 'System', '2022-04-25 16:01:39');

INSERT INTO `umm_menu_privilage`(`menu_id`, `privilage_id`, `auth_code`, `created_by`, `created_on`) VALUES (1049, 127, 'CREDIT_NOTE_APPLY_TO_BILL', 'System', '2022-04-25 16:04:40');

INSERT INTO `umm_menu_privilage`(`menu_id`, `privilage_id`, `auth_code`, `created_by`, `created_on`) VALUES (1019, 128, 'BILL_APPLY_CREDIT_NOTE', 'System', '2022-04-25 16:05:25');
