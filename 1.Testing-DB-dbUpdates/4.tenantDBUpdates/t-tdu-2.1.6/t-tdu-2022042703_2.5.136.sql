-----------Madhusha-------2.5.136---------

INSERT INTO `common_grid_column_template`(`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`) VALUES (49, 'creditNote.creditBalance', 'Credit Balance', 1, 1, 1, 1, 1, 'right', 'numeric', 'Credit Balance', 8);

UPDATE `common_grid_column_template` SET `column_order` = 9 WHERE `id` = 500;

UPDATE `common_grid_column_template` SET `column_order` = 10 WHERE `id` = 501;

INSERT INTO `common_grid_column_template`(`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`) VALUES (14, 'bill.creditAmount', 'Credit Amount', 1, 1, 1, 1, 1, 'right', 'numeric', 'Credit Amount', 25);

UPDATE `common_grid_state_template` SET `column_widths` = '51,126,200,200,200,200,200,200,200,200,200,200,200,200,200,200,200,200,200,200,200,200,200,200,200' WHERE `id` = 14;

INSERT INTO common_grid_column_user_wice(user_id,grid_id,field,header,column_show,is_sortable,is_re_orderable,is_re_sizable,can_hide,align,search_type,placeholder,column_order)
SELECT wice.user_id,gridTemp.grid_id,gridTemp.field,gridTemp.header,gridTemp.column_show,gridTemp.is_sortable,gridTemp.is_re_orderable,gridTemp.is_re_sizable,gridTemp.can_hide,gridTemp.align,gridTemp.search_type,gridTemp.placeholder,gridTemp.column_order 
FROM common_grid_column_template gridTemp
INNER JOIN common_grid_column_user_wice wice ON wice.grid_id=gridTemp.grid_id
WHERE gridTemp.grid_id=14 AND gridTemp.header="Credit Amount" GROUP BY wice.user_id;


UPDATE common_grid_state_user_wice wice
INNER JOIN common_grid_state_template state ON wice.grid_id=state.grid_id
SET wice.column_widths=CONCAT(wice.column_widths,",220")
WHERE wice.grid_id=14;

UPDATE `umm_menu` SET `url` = '/home/bills' WHERE `id` = 1049;