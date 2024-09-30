-----------------Madhusha-------2.5.87-------------------

UPDATE `common_grid_column_template` SET `column_order` = 7 WHERE `id` = 34;

UPDATE `common_grid_column_template` SET `column_order` = 8 WHERE `id` = 37;

UPDATE `common_grid_column_template` SET `column_order` = 9 WHERE `id` = 38;

UPDATE `common_grid_column_template` SET `column_order` = 10 WHERE `id` = 39;

INSERT INTO `common_grid_column_template`(`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`) VALUES (5, 'item.parentId', 'Parent Item', 1, 1, 1, 1, 1, 'left', 'dropdown', 'Parent Item', 6);

UPDATE `common_grid_state_template` SET `column_widths` = '50,100,220,218,214,218,218,219,219,219' WHERE `id` = 5;

UPDATE common_grid_column_user_wice wise 
SET wise.column_order=7
WHERE wise.grid_id=5 AND wise.header="Category";

UPDATE common_grid_column_user_wice wise 
SET wise.column_order=8
WHERE wise.grid_id=5 AND wise.header="Taxability";

UPDATE common_grid_column_user_wice wise 
SET wise.column_order=9
WHERE wise.grid_id=5 AND wise.header="Selling Price";

UPDATE common_grid_column_user_wice wise 
SET wise.column_order=10
WHERE wise.grid_id=5 AND wise.header="Status";


INSERT INTO common_grid_column_user_wice(user_id,grid_id,field,header,column_show,is_sortable,is_re_orderable,is_re_sizable,can_hide,align,search_type,placeholder,column_order)
SELECT wice.user_id,gridTemp.grid_id,gridTemp.field,gridTemp.header,gridTemp.column_show,gridTemp.is_sortable,gridTemp.is_re_orderable,gridTemp.is_re_sizable,gridTemp.can_hide,gridTemp.align,gridTemp.search_type,gridTemp.placeholder,gridTemp.column_order 
FROM common_grid_column_template gridTemp
INNER JOIN common_grid_column_user_wice wice ON wice.grid_id=gridTemp.grid_id
WHERE gridTemp.grid_id=5 AND gridTemp.header="Parent Item" GROUP BY wice.user_id;


UPDATE common_grid_state_user_wice wice
INNER JOIN common_grid_state_template state ON wice.grid_id=state.grid_id
SET wice.column_widths=CONCAT(wice.column_widths,",220")
WHERE wice.grid_id=5;
