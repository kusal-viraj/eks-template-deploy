UPDATE `umm_menu` SET `status` = 'I' WHERE `id` = 1020;
UPDATE `umm_menu` SET `status` = 'I' WHERE `id` = 1032;
UPDATE `umm_menu` SET `status` = 'I' WHERE `id` = 1033;
UPDATE `umm_menu` SET `status` = 'I' WHERE `id` = 1034;

UPDATE `umm_menu_privilage` SET `menu_id` = 1029, `auth_code` = 'PAYMENT_CREATE' WHERE `id` = 75;
UPDATE `umm_menu_privilage` SET `menu_id` = 1029, `auth_code` = 'PAYMENT_UPLOAD' WHERE `id` = 76;
UPDATE `umm_menu_privilage` SET `menu_id` = 1029, `auth_code` = 'PAYMENT_CHANGE_DOCUMENT' WHERE `id` = 77;
UPDATE `umm_menu_privilage` SET `menu_id` = 1029, `auth_code` = 'PAYMENT_MARK_AS_MAILED' WHERE `id` = 78;
UPDATE `umm_menu_privilage` SET `menu_id` = 1029, `auth_code` = 'PAYMENT_REVOKE_PAYMENT' WHERE `id` = 79;
UPDATE `umm_menu_privilage` SET `menu_id` = 1029, `auth_code` = 'BILL_PAYMENT_DETAIL_VIEW' WHERE `id` = 80;
UPDATE `umm_menu_privilage` SET `menu_id` = 1029, `auth_code` = 'PAYMENT_DETAIL_VIEW' WHERE `id` = 81;
UPDATE `umm_menu_privilage` SET `menu_id` = 1029, `auth_code` = 'PAYMENT_CSV_EXPORT' WHERE `id` = 82;
UPDATE `umm_menu_privilage` SET `menu_id` = 1029, `auth_code` = 'PAYMENT_DOWNLOAD_RECEIPT' WHERE `id` = 83;
UPDATE `umm_menu_privilage` SET `menu_id` = 1029, `auth_code` = 'PAYMENT_APPROVE' WHERE `id` = 402;
UPDATE `umm_menu_privilage` SET `menu_id` = 1029, `auth_code` = 'PAYMENT_REJECT' WHERE `id` = 403;
UPDATE `umm_menu_privilage` SET `menu_id` = 1029, `auth_code` = 'PAYMENT_OVERRIDE_APPROVAL' WHERE `id` = 409;
UPDATE `umm_menu_privilage` SET `menu_id` = 1029, `auth_code` = 'PAYMENT_VIEW_AUDIT_TRIAL' WHERE `id` = 425;
