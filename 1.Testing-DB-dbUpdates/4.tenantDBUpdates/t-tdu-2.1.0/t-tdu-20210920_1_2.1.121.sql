----------------Hashila---------2.1.121------------------

UPDATE `common_grid_column_template` SET `grid_id` = 38, `field` = 'pay.noOfBills', `header` = 'No. Of Bills', `column_show` = 1, `is_sortable` = 0, `is_re_orderable` = 0, `is_re_sizable` = 0, `can_hide` = 0, `align` = 'right', `search_type` = 'numeric', `placeholder` = 'No. Of Bills', `column_order` = 4, `drop_down_id` = NULL, `drop_down_url` = '' WHERE `id` = 373;

DELETE FROM `umm_menu_privilage` WHERE `auth_code` = 'PAYMENT_CREATE';

UPDATE `common_grid_state_template` SET `column_widths` = '50,210,210,210,210,210,360,210,210' WHERE `id` = 43;

