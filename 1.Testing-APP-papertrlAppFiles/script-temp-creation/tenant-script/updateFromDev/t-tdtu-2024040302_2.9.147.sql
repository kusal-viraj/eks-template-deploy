UPDATE `common_grid_column_template` SET `search_type`='number' WHERE `field`='pPaymentReq.batchId';

INSERT INTO `umm_role_previlege` (`role_id`, `privilege_id`, `sub_account_id`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (1, 568, NULL, 'Admin', '2024-04-02 22:43:59', NULL, NULL, NULL, NULL);