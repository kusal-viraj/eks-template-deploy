----madusha 2.8.335----


INSERT INTO `common_grid_column_template`(`grid_id`, `field`, `sortable_field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `filter_show`, `is_frozen`, `align`, `search_type`, `placeholder`, `column_order`, `column_width`) VALUES (15, 'expense.balanceAmount', 'expense.balanceAmount', 'Balance Amount', 1, 1, 0, 1, 1, 1, 0, 'right', 'numeric', 'Balance Amount', 10, 150);

INSERT INTO common_grid_column_user_wice(user_id,grid_id,field,sortable_field,header,column_show,filter_show,is_frozen,is_sortable,is_re_orderable,is_re_sizable,can_hide,align,search_type,placeholder,column_order,column_width)
SELECT wice.user_id,gridTemp.grid_id,gridTemp.field,gridTemp.sortable_field,gridTemp.header,gridTemp.column_show,gridTemp.filter_show,gridTemp.is_frozen,gridTemp.is_sortable,gridTemp.is_re_orderable,gridTemp.is_re_sizable,gridTemp.can_hide,gridTemp.align,gridTemp.search_type,gridTemp.placeholder,gridTemp.column_order,gridTemp.column_width 
FROM common_grid_column_template gridTemp
INNER JOIN common_grid_column_user_wice wice ON wice.grid_id=gridTemp.grid_id
WHERE gridTemp.grid_id=15 AND gridTemp.header="Balance Amount" GROUP BY wice.user_id;