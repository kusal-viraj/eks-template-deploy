
INSERT INTO `common_grid_template` (`id`, `grid_name`) VALUES ('31', 'GRID_PORTAL_EXPENSE_DASHBOARD');


INSERT INTO `common_grid_state_template` (`grid_id`, `start_from`, `total_rows`, `column_widths`) VALUES ( '31', '0', '10', '268,268,268,268,210');


INSERT INTO `common_grid_column_template` ( `grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES ( '31', 'pEx.subAccount', 'Sub Account', '1', '0', '0', '0', '0', 'left', 'multiSelect', 'Sub Account', '3', NULL, '');
INSERT INTO `common_grid_column_template` ( `grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES ( '31', 'pEx.submittedEr', 'Number of Submitted Expense Reports', '1', '1', '0', '0', '0', 'right', ' ', 'Number of Submitted Expense Reports', '19', NULL, '');
INSERT INTO `common_grid_column_template` ( `grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES ( '31', 'pEx.approvedEr', 'Number of Approved Expense Reports', '1', '1', '0', '0', '0', 'right', ' ', 'Number of Approved Expense Reports', '19', NULL, '');
INSERT INTO `common_grid_column_template` ( `grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES ( '31', 'pEx.rejectedEr', 'Number of Rejected Expense Reports', '1', '1', '0', '0', '0', 'right', ' ', 'Number of Rejected Expense Reports', '19', NULL, '');
INSERT INTO `common_grid_column_template` ( `grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES ( '31', 'pEx.totalPayable', 'Total Payable', '1', '1', '0', '0', '0', 'right', ' ', 'Total Payable', '19', NULL, '');



delete from common_grid_column_template where id =200;