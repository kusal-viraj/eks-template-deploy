UPDATE `common_grid_column_template` SET `field`='poc.createdUserName' WHERE (`id`='275');

UPDATE common_grid_column_user_wice SET field='poc.createdUserName' WHERE field='user.name' AND grid_id=27;

ALTER TABLE `vp_po_number_config`
ADD COLUMN `created_username`  varchar(100) NULL DEFAULT NULL AFTER `status`;

UPDATE `common_grid_column_template` SET `is_re_orderable`='0', `is_re_sizable`='0' WHERE (`id`='84');

UPDATE common_grid_column_user_wice SET `is_re_orderable`='0', `is_re_sizable`='0' WHERE grid_id=11 AND field='action';