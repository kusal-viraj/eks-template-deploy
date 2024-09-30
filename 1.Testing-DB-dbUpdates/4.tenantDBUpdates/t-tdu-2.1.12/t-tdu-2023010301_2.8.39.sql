-----hasila-2.8.39---------



INSERT INTO `common_drop_down_url`(`id`, `name`, `url`) VALUES (20, 'Additional Field Document types', '/common_service/sec_get_all_additional_field_document_types_v2');
INSERT INTO `common_drop_down_url`(`id`, `name`, `url`) VALUES (21, 'Field types', '/common_service/sec_field_types');

UPDATE `common_grid_column_template` SET `drop_down_url_id` = 20 WHERE `grid_id` = 11 AND `field` = 'dc.moduleId';
UPDATE `common_grid_column_template` SET `drop_down_url_id` = 21 WHERE `grid_id` = 11 AND `field` = 'field.fieldTypeId';
