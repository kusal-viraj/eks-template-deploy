
    DELETE FROM common_grid_state_template WHERE grid_id NOT IN (1,2,3,6);
	ALTER TABLE `common_grid_state_template`AUTO_INCREMENT=6;

    TRUNCATE `common_grid_filter_template`;

    ALTER TABLE `common_grid_filter_template`
    AUTO_INCREMENT=0;

    ALTER TABLE `common_grid_column_user_wice`
    AUTO_INCREMENT=0;

    DELETE FROM common_grid_column_template WHERE grid_id NOT IN (1,2,3,6);

    ALTER TABLE `common_grid_column_template`
    AUTO_INCREMENT=0;
	
    INSERT INTO `common_grid_template` (`id`, `grid_name`) VALUES ('7', 'PORTAL_DASHBOARD_BILL_TABLE');
    INSERT INTO `common_grid_state_template` (`id`, `grid_id`, `start_from`, `total_rows`, `column_widths`) VALUES ('21', '7', '0', '10', '210,210,210,210,210,210');
	
    INSERT INTO `common_grid_column_template` (`id`, `grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES ('199', '7', 'pBill.subAccount', 'Sub Account', '1', '0', '0', '0', '0', 'left', 'multiSelect', 'Vendor', '3', NULL, '');
    INSERT INTO `common_grid_column_template` (`id`, `grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES ('200', '7', 'pBill.uploadedBills', 'Uploaded Bills', '1', '1', '0', '0', '0', 'right', ' ', 'Applicable Discount', '19', NULL, '');
    INSERT INTO `common_grid_column_template` (`id`, `grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES ('201', '7', 'pBill.pendingBills', 'Pending Bills', '1', '1', '0', '0', '0', 'right', ' ', 'Applicable Discount', '19', NULL, '');
    INSERT INTO `common_grid_column_template` (`id`, `grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES ('202', '7', 'pBill.approvedBills', 'Approved Bills', '1', '1', '0', '0', '0', 'right', ' ', 'Applicable Discount', '19', NULL, '');
    INSERT INTO `common_grid_column_template` (`id`, `grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES ('203', '7', 'pBill.rejectedBills', 'Rejected Bills', '1', '1', '0', '0', '0', 'right', ' ', 'Applicable Discount', '19', NULL, '');
    INSERT INTO `common_grid_column_template` (`id`, `grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES ('204', '7', 'pBill.totalPayable', 'Total Payable', '1', '1', '0', '0', '0', 'right', ' ', 'Total Payable', '19', NULL, '');



