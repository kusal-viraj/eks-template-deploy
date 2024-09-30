INSERT INTO `umm_privilages` (`id`, `url`, `text`, `date_created`, `created_user`) VALUES ('54', 'Add Vendor', 'Add Vendor', '2020-12-30 17:13:21', 'System');


INSERT INTO `umm_menu_privilage` (`menu_id`, `prililage_id`, `data_created`, `user_inserted`) VALUES ('6', '54', '2020-12-30 17:14:50', 'System');


ALTER TABLE `vp_vendor_invitation`
ADD COLUMN `contact_name`  varchar(50) NULL DEFAULT NULL AFTER `vendor_name`;