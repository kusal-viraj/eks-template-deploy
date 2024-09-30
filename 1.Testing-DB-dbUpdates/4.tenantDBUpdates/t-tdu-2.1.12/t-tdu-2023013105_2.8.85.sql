----loshitha---2.8.85-----


INSERT INTO `common_drop_down_url` (`id`, `name`, `url`) VALUES (32, 'Item Type', '/common_service/sec_get_item_type_dropdown_list');
INSERT INTO `common_drop_down_url` (`id`, `name`, `url`) VALUES (33, 'Item Category', '/common_service/sec_get_category_dropdown_list');
INSERT INTO `common_drop_down_url` (`id`, `name`, `url`) VALUES (34, 'Parent Item', '/common_service/sec_get_item_dropdown_list_not_considering_vendor');
INSERT INTO `common_drop_down_url` (`id`, `name`, `url`) VALUES (35, 'Document Types', '/common_service/sec_get_all_document_types_v2?isRuleAutomation=false');
INSERT INTO `common_drop_down_url` (`id`, `name`, `url`) VALUES (36, 'Automation Event', '/common_service/sec_get_event_list_v2');

UPDATE  common_grid_column_template SET drop_down_url_id = 22 WHERE field ='term.id' AND grid_id = 14;
UPDATE  common_grid_column_template SET drop_down_url_id = 32 WHERE field ='cat.id' AND grid_id = 5;
UPDATE  common_grid_column_template SET drop_down_url_id = 34  WHERE field ='item.parentId' AND grid_id = 5;   
UPDATE  common_grid_column_template SET drop_down_url_id = 7 WHERE  field='address.country' AND grid_id = 8;   
UPDATE  common_grid_column_template SET drop_down_url_id = 35  WHERE field ='automation.documentType' AND grid_id = 12;   
UPDATE  common_grid_column_template SET drop_down_url_id = 36  WHERE field ='documentEvent.eventId' AND grid_id = 12;   
UPDATE  common_grid_column_template SET drop_down_url_id = 1  WHERE field ='variance.vendorId' AND grid_id = 48;  
UPDATE  common_grid_column_template SET drop_down_url_id = 4  WHERE field ='poc.departmentId' AND grid_id = 27;   
UPDATE  common_grid_column_template SET drop_down_url_id = 35  WHERE field ='reminder.documentTypeId' AND grid_id = 60;  