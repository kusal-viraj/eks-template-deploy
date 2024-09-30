ALTER TABLE `vp_po_mst` 
ADD COLUMN `credit_amount` decimal(19, 2) NULL AFTER `delete_on`;

INSERT INTO `umm_privilages`(`id`, `url`, `text`, `auth_code`, `created_by`, `created_on`) VALUES (130, 'View Attached Credit Notes', 'View Attached Credit Notes', 'VIEW_ATTACHED_CREDIT_NOTE', 'System', '2022-05-11 17:39:51');

INSERT INTO `umm_menu_privilage`(`id`, `menu_id`, `privilage_id`, `auth_code`, `created_by`, `created_on`) VALUES (487, 1021, 130, 'VIEW_ATTACHED_CREDIT_NOTES', 'System', '2022-05-11 17:41:59');

INSERT INTO `umm_role_previlege`(`role_id`, `privilege_id`, `created_by`, `created_on`) VALUES (1, 487, 'System', '2022-05-11 17:43:11');