---------loshitha-2.8.114------------


UPDATE  common_grid_column_template SET column_width = 150 WHERE  grid_id = 1;
UPDATE  common_grid_column_template SET column_width = 50 WHERE field IN('action') AND  grid_id = 1;  


UPDATE  common_grid_column_template SET column_width = 150 WHERE field ='pay.name' AND  grid_id = 12;
UPDATE  common_grid_column_template SET column_width = 50 WHERE field ='action' AND  grid_id = 12;
UPDATE  common_grid_column_template SET column_width = 170 WHERE field ='pay.description' AND  grid_id = 12;
UPDATE  common_grid_column_template SET column_width = 70 WHERE field ='pay.status' AND  grid_id = 12;
UPDATE  common_grid_column_template SET column_width = 150 WHERE field ='pay.createdOn' AND  grid_id = 12;
UPDATE  common_grid_column_template SET column_width = 150 WHERE field ='pay.createdBy' AND  grid_id = 12;
UPDATE  common_grid_column_template SET column_width = 150 WHERE field ='type.paymentType' AND  grid_id = 12; 


UPDATE  common_grid_column_template SET column_width = 150 WHERE  grid_id = 11;
UPDATE  common_grid_column_template SET column_width = 50 WHERE field IN('action') AND  grid_id = 11;   

UPDATE  common_grid_column_template SET column_width = 150 WHERE  grid_id = 6;
UPDATE  common_grid_column_template SET column_width = 50 WHERE field IN('action') AND  grid_id = 6; 

UPDATE  common_grid_column_template SET column_width = 150 WHERE  grid_id = 5;

UPDATE  common_grid_column_template SET column_width = 150 WHERE  grid_id = 4;
UPDATE  common_grid_column_template SET column_width = 50 WHERE field IN('action') AND  grid_id = 4; 

UPDATE  common_grid_column_template SET column_width = 150 WHERE  grid_id = 3;
UPDATE  common_grid_column_template SET column_width = 50 WHERE field IN('action') AND  grid_id = 3;  

UPDATE  common_grid_column_template SET column_width = 150 WHERE  grid_id = 8;
UPDATE  common_grid_column_template SET column_width = 50 WHERE field IN('action','checkbox') AND  grid_id = 8;  

UPDATE  common_grid_column_template SET column_width = 150 WHERE  grid_id = 9;
UPDATE  common_grid_column_template SET column_width = 50 WHERE field IN('action','checkbox') AND  grid_id = 9;  

UPDATE  common_grid_column_template SET column_width = 150 WHERE  grid_id = 2;
UPDATE  common_grid_column_template SET column_width = 50 WHERE field IN('action') AND  grid_id = 2; 

UPDATE  common_grid_column_template SET column_width = 150 WHERE  grid_id = 10;
UPDATE  common_grid_column_template SET column_width = 50 WHERE field IN('checkbox','action') AND  grid_id = 10; 


INSERT INTO `common_drop_down_url`(`id`, `name`, `url`) VALUES (1, 'Payment Types', '/tenant_management/sec_get_payment_types');
INSERT INTO `common_drop_down_url`(`id`, `name`, `url`) VALUES (2, 'Integration system Types', '/integration/sec_get_integration_system_types_v2');
INSERT INTO `common_drop_down_url`(`id`, `name`, `url`) VALUES (3, 'Integration system Auth Types', '/integration/sec_get_integration_system_auth_types_v2');
INSERT INTO `common_drop_down_url`(`id`, `name`, `url`) VALUES (4, 'Integration system Grant Types', '/integration/sec_get_integration_system_grant_types_v2');
INSERT INTO `common_drop_down_url`(`id`, `name`, `url`) VALUES (5, 'Approval Groups', '/user_management/sec_view_approval_group_list_with_no_approval_group_option_v2');
INSERT INTO `common_drop_down_url`(`id`, `name`, `url`) VALUES (6, 'Role', '/role_management/sec_view_role_dropdown_v2?userId=0&isSearch=true');
INSERT INTO `common_drop_down_url` (`id`, `name`, `url`) VALUES (7, 'Company name', '/tenant_management/sec_get_all_tenants');

UPDATE  common_grid_column_template SET drop_down_url_id = 1 WHERE field ='type.paymentType' AND grid_id = 12;

UPDATE  common_grid_column_template SET drop_down_url_id = 2 WHERE field ='systype.id' AND grid_id = 1;  
UPDATE  common_grid_column_template SET drop_down_url_id = 3 WHERE field ='atype.id' AND grid_id = 1; 
UPDATE  common_grid_column_template SET drop_down_url_id = 4 WHERE field ='gtype.id' AND grid_id = 1;

UPDATE  common_grid_column_template SET drop_down_url_id = 5 WHERE field ='approvalGroup.approvalGroupId' AND grid_id = 8; 
UPDATE  common_grid_column_template SET drop_down_url_id = 6 WHERE field ='rolem.id' AND grid_id = 8; 
UPDATE  common_grid_column_template SET drop_down_url_id = 7  WHERE field ='tenantId' AND grid_id = 3;   

















