---sithum 2.9.147---

UPDATE `common_grid_column_template` SET `search_type`='number' WHERE `field`='pPaymentReq.batchId';

UPDATE `umm_role_previlege` SET `privilege_id`=568 WHERE `role_id`=1 AND `privilege_id`=570;