----------Madhusha------2.6.53--------

ALTER TABLE `vendor_po_mst` 
ADD COLUMN `credit_amount` decimal(19, 2) NULL AFTER `delete_on`;

UPDATE `vendor_po_mst` SET `credit_amount` = 0.00;

INSERT INTO `vendor_grid_column_template`(`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`) VALUES (4, 'po.creditAmount', 'Credit Amount', 1, 1, 1, 1, 1, 'right', 'numeric', 'Credit Amount', 7);

UPDATE `vendor_grid_column_template` SET `column_order` = 8 WHERE `id` = 204;

UPDATE `vendor_grid_state_template` SET `column_widths` = '102,257,257,257,257,257,257,257,257,180' WHERE `id` = 4;

INSERT INTO vendor_grid_column_user_wice(user_id,grid_id,field,header,column_show,is_sortable,is_re_orderable,is_re_sizable,can_hide,align,search_type,placeholder,column_order)
SELECT wice.user_id,gridTemp.grid_id,gridTemp.field,gridTemp.header,gridTemp.column_show,gridTemp.is_sortable,gridTemp.is_re_orderable,gridTemp.is_re_sizable,gridTemp.can_hide,gridTemp.align,gridTemp.search_type,gridTemp.placeholder,gridTemp.column_order 
FROM vendor_grid_column_template gridTemp
INNER JOIN vendor_grid_column_user_wice wice ON wice.grid_id=gridTemp.grid_id
WHERE gridTemp.grid_id=4 AND gridTemp.header="Credit Amount" GROUP BY wice.user_id;

UPDATE vendor_grid_state_user_wice wice
INNER JOIN vendor_grid_state_template state ON wice.grid_id=state.grid_id
SET wice.column_widths=CONCAT(wice.column_widths,",180")
WHERE wice.grid_id=4;