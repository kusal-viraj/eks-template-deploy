---------Madhusha------2.6.49---------

ALTER TABLE `common_notification_mst` 
MODIFY COLUMN `created_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL AFTER `status`,
MODIFY COLUMN `update_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL AFTER `created_on`,
MODIFY COLUMN `delete_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL AFTER `update_on`;

INSERT INTO `common_grid_column_template`(`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`) VALUES (32, 'bill.creditAmount', 'Credit Amount', 1, 1, 1, 1, 1, 'right', 'numeric', 'Credit Amount', 17);

UPDATE `common_grid_column_template` SET `column_order` = 18 WHERE `id` = 323;

UPDATE `common_grid_state_template` SET `column_widths` = '50,50,100,210,210,135,135,180,180,180,180,210,210,180,210,210,145,180' WHERE `id` = 32;


INSERT INTO common_grid_column_user_wice(user_id,grid_id,field,header,column_show,is_sortable,is_re_orderable,is_re_sizable,can_hide,align,search_type,placeholder,column_order)
SELECT wice.user_id,gridTemp.grid_id,gridTemp.field,gridTemp.header,gridTemp.column_show,gridTemp.is_sortable,gridTemp.is_re_orderable,gridTemp.is_re_sizable,gridTemp.can_hide,gridTemp.align,gridTemp.search_type,gridTemp.placeholder,gridTemp.column_order 
FROM common_grid_column_template gridTemp
INNER JOIN common_grid_column_user_wice wice ON wice.grid_id=gridTemp.grid_id
WHERE gridTemp.grid_id=32 AND gridTemp.header="Credit Amount" GROUP BY wice.user_id;


INSERT INTO common_grid_column_user_wice(user_id,grid_id,field,header,column_show,is_sortable,is_re_orderable,is_re_sizable,can_hide,align,search_type,placeholder,column_order)
SELECT wice.user_id,gridTemp.grid_id,gridTemp.field,gridTemp.header,gridTemp.column_show,gridTemp.is_sortable,gridTemp.is_re_orderable,gridTemp.is_re_sizable,gridTemp.can_hide,gridTemp.align,gridTemp.search_type,gridTemp.placeholder,gridTemp.column_order 
FROM common_grid_column_template gridTemp
INNER JOIN common_grid_column_user_wice wice ON wice.grid_id=gridTemp.grid_id
WHERE gridTemp.grid_id=32 AND gridTemp.header="Payment Status" GROUP BY wice.user_id;


UPDATE common_grid_state_user_wice wice
INNER JOIN common_grid_state_template state ON wice.grid_id=state.grid_id
SET wice.column_widths=CONCAT(wice.column_widths,",180")
WHERE wice.grid_id=32;