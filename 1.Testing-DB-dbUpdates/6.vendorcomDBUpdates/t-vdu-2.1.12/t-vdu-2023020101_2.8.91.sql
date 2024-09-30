-----loshitha---2.8.91------


INSERT INTO `vendor_drop_down_url`(`id`, `name`, `url`) VALUES (3, 'Customer list', '/tenant_management/sec_get_sub_account_dropdown_list');
INSERT INTO `vendor_drop_down_url`(`id`, `name`, `url`) VALUES (4, 'Role list', '/role_management/sec_view_role_dropdown_v2?userId=0&isSearch=true');

UPDATE  vendor_grid_column_template SET drop_down_url_id = 3 WHERE field ='vdbill.tenantId' AND grid_id = 6;  
UPDATE  vendor_grid_column_template SET drop_down_url_id = 3 WHERE field ='po.tenantId' AND grid_id = 22;  
UPDATE  vendor_grid_column_template SET drop_down_url_id = 4 WHERE field ='rolem.id' AND grid_id = 2;
UPDATE  vendor_grid_column_template SET drop_down_url_id = 3 WHERE field ='po.tenantId' AND grid_id = 4;   
UPDATE  vendor_grid_column_template SET drop_down_url_id = 3 WHERE field ='inv.tenantId' AND grid_id = 5;  