INSERT INTO umm_privilages(id, url, text, auth_code, created_by, created_on, update_by, update_on, delete_by, delete_on) VALUES (147, 'Create Digital Card', 'Create Digital Card', 'CREATE_DIGITAL_CARD', 'System', '2023-06-14 10:09:50', NULL, NULL, NULL, NULL);

UPDATE umm_menu_privilage SET menu_id = 1021 WHERE id = 546;
UPDATE umm_menu_privilage SET privilage_id = 147 WHERE id = 546;

INSERT INTO umm_menu_privilage(id, menu_id, privilage_id, auth_code, created_by, created_on, update_by, update_on, delete_by, delete_on) VALUES (550, 1059, 1, 'V_CARD_CREATE', 'System', '2023-06-14 10:12:13', NULL, NULL, NULL, NULL);

INSERT INTO umm_role_previlege(role_id, privilege_id, created_by, created_on) VALUES (1, 550, 'admin', '2023-06-14 10:13:28');

INSERT INTO umm_role_previlege(role_id, privilege_id, created_by, created_on) VALUES (1, 1059, 'admin', '2023-06-14 10:23:12');


UPDATE common_grid_column_template SET  column_order = 2  WHERE grid_id = 63 AND field = 'doc.docNo';
UPDATE common_grid_column_template SET  column_order = 3  WHERE grid_id = 63 AND field = 'doc.payee';
UPDATE common_grid_column_template SET  column_order = 9  WHERE grid_id = 63 AND field = 'doc.docDate';
UPDATE common_grid_column_template SET  column_order = 10  WHERE grid_id = 63 AND field = 'doc.dueDate';
UPDATE common_grid_column_template SET  column_order = 11  WHERE grid_id = 63 AND field = 'doc.amount';
UPDATE common_grid_column_template SET  column_order = 12  WHERE grid_id = 63 AND field = 'doc.paidAmount';
UPDATE common_grid_column_template SET  column_order = 13  WHERE grid_id = 63 AND field = 'doc.paymentUnderProcessing';
UPDATE common_grid_column_template SET  column_order = 14  WHERE grid_id = 63 AND field = 'doc.balanceAmount';
UPDATE common_grid_column_template SET  column_order = 7  WHERE grid_id = 63 AND field = 'doc.referenceNo';
UPDATE common_grid_column_template SET  column_order = 4  WHERE grid_id = 63 AND field = 'doc.txnType';
UPDATE common_grid_column_template SET  column_order = 5  WHERE grid_id = 63 AND field = 'doc.txnAmount';
UPDATE common_grid_column_template SET  column_order = 8  WHERE grid_id = 63 AND field = 'doc.comment';
UPDATE common_grid_column_template SET  column_order = 17  WHERE grid_id = 63 AND field = 'doc.applicableDiscountAmount';
UPDATE common_grid_column_template SET  column_order = 16  WHERE grid_id = 63 AND field = 'doc.paymentStatus';
UPDATE common_grid_column_template SET  column_order = 15  WHERE grid_id = 63 AND field = 'doc.creditAmount';
UPDATE common_grid_column_template SET  column_order = 6  WHERE grid_id = 63 AND field = 'doc.paymentDate';
UPDATE common_grid_column_template SET  column_order = 18  WHERE grid_id = 63 AND field = 'doc.receipt';

UPDATE common_grid_column_user_wice SET  column_order = 2  WHERE grid_id = 63 AND field = 'doc.docNo';
UPDATE common_grid_column_user_wice SET  column_order = 3  WHERE grid_id = 63 AND field = 'doc.payee';
UPDATE common_grid_column_user_wice SET  column_order = 9  WHERE grid_id = 63 AND field = 'doc.docDate';
UPDATE common_grid_column_user_wice SET  column_order = 10  WHERE grid_id = 63 AND field = 'doc.dueDate';
UPDATE common_grid_column_user_wice SET  column_order = 11  WHERE grid_id = 63 AND field = 'doc.amount';
UPDATE common_grid_column_user_wice SET  column_order = 12  WHERE grid_id = 63 AND field = 'doc.paidAmount';
UPDATE common_grid_column_user_wice SET  column_order = 13  WHERE grid_id = 63 AND field = 'doc.paymentUnderProcessing';
UPDATE common_grid_column_user_wice SET  column_order = 14  WHERE grid_id = 63 AND field = 'doc.balanceAmount';
UPDATE common_grid_column_user_wice SET  column_order = 7  WHERE grid_id = 63 AND field = 'doc.referenceNo';
UPDATE common_grid_column_user_wice SET  column_order = 4  WHERE grid_id = 63 AND field = 'doc.txnType';
UPDATE common_grid_column_user_wice SET  column_order = 5  WHERE grid_id = 63 AND field = 'doc.txnAmount';
UPDATE common_grid_column_user_wice SET  column_order = 8  WHERE grid_id = 63 AND field = 'doc.comment';
UPDATE common_grid_column_user_wice SET  column_order = 17  WHERE grid_id = 63 AND field = 'doc.applicableDiscountAmount';
UPDATE common_grid_column_user_wice SET  column_order = 16  WHERE grid_id = 63 AND field = 'doc.paymentStatus';
UPDATE common_grid_column_user_wice SET  column_order = 15  WHERE grid_id = 63 AND field = 'doc.creditAmount';
UPDATE common_grid_column_user_wice SET  column_order = 6  WHERE grid_id = 63 AND field = 'doc.paymentDate';
UPDATE common_grid_column_user_wice SET  column_order = 18  WHERE grid_id = 63 AND field = 'doc.receipt';