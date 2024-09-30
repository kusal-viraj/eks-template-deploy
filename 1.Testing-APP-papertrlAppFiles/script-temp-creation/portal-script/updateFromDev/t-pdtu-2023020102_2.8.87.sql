INSERT INTO `common_drop_down_url` (`id`, `name`, `url`) VALUES (1, 'Role', '/role_management/sec_view_role_dropdown_v2');
INSERT INTO `common_drop_down_url` (`id`, `name`, `url`) VALUES (2, 'Approval Group List', '/user_management/sec_view_approval_group_list_v2');

UPDATE  common_grid_column_template SET drop_down_url_id = 1  WHERE field ='rolem.id' AND grid_id = 2;
UPDATE  common_grid_column_template SET drop_down_url_id = 2  WHERE field ='approvalGroup.approvalGroupId' AND grid_id = 2;