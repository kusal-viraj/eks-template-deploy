
---madushaa--2.8.349-----


ALTER TABLE `vp_expense_mst` 
ADD COLUMN `department_id` int NULL AFTER `approval_group_name`;

ALTER TABLE `vp_expense_detail` 
ADD COLUMN `department_id` int NULL AFTER `attachment_id`;

ALTER TABLE `hst_vp_expense_mst` 
ADD COLUMN `department_id` int NULL AFTER `approved_date`;

ALTER TABLE `hst_vp_expense_detail` 
ADD COLUMN `department_id` int NULL AFTER `mileage_amount`;

INSERT INTO `common_document_field_config`(`id`, `document_id`, `field_id`, `enable`) VALUES (8, 4, 2, 0);

INSERT INTO `common_document_field_section_config`(`id`, `section_id`, `field_config`, `field_code`, `enable`) VALUES (14, 1, 8, 'departmentId', 0);

INSERT INTO `common_document_field_section_config`(`id`, `section_id`, `field_config`, `field_code`, `enable`) VALUES (15, 2, 8, 'departmentId', 0);

INSERT INTO `common_grid_column_template`(`grid_id`, `field`, `sortable_field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `filter_show`, `is_frozen`, `align`, `search_type`, `placeholder`, `column_order`, `column_width`, `drop_down_url_id`) VALUES (15, 'dept.id', 'dept.id', 'Department', 1, 1, 0, 1, 1, 1, 0, 'left', 'dropdown', 'Department', 4, 150, 4);

UPDATE `common_grid_state_template` SET `column_widths` = '50,100,220,215,215,215,215,215,215,215,215,215,215,215,215' WHERE `id` = 15;


INSERT INTO common_grid_column_user_wice(user_id,grid_id,field,sortable_field,header,column_show,filter_show,is_frozen,is_sortable,is_re_orderable,is_re_sizable,can_hide,align,search_type,placeholder,column_order,column_width)
SELECT wice.user_id,gridTemp.grid_id,gridTemp.field,gridTemp.sortable_field,gridTemp.header,gridTemp.column_show,gridTemp.filter_show,gridTemp.is_frozen,gridTemp.is_sortable,gridTemp.is_re_orderable,gridTemp.is_re_sizable,gridTemp.can_hide,gridTemp.align,gridTemp.search_type,gridTemp.placeholder,gridTemp.column_order,gridTemp.column_width 
FROM common_grid_column_template gridTemp
INNER JOIN common_grid_column_user_wice wice ON wice.grid_id=gridTemp.grid_id
WHERE gridTemp.grid_id=15 AND gridTemp.header="Department" GROUP BY wice.user_id;