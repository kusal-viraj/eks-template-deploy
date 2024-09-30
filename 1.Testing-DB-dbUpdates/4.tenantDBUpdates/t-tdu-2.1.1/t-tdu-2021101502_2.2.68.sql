----------------Hashila-----2.2.68----

ALTER TABLE `common_additional_document_relation` 
ADD COLUMN `required` tinyint(1) NULL DEFAULT 0 AFTER `status`,
ADD COLUMN `display_order` int NULL DEFAULT NULL AFTER `required`;

ALTER TABLE `common_additional_field` 
MODIFY COLUMN `display_order` int NULL AFTER `max_length`;

TRUNCATE TABLE common_additional_document_relation;

INSERT INTO common_additional_document_relation (section_id, module_id, field_id, created_by, created_by_name, created_on, status, required, display_order)
SELECT field.section_id, field.module_id, field.id, field.created_by, user.`name`, field.created_on,field.`status`, field.required, field.display_order FROM common_additional_field field
LEFT JOIN umm_user_mst user on user.user_name = field.created_by where field.section_id is not null and field.module_id is not null;

DELETE FROM `common_grid_column_user_wice` WHERE `grid_id` = 11;

UPDATE `common_grid_column_template` SET `column_show` = 0 WHERE `id` = 88;