
INSERT INTO `common_drop_down_url` (`id`, `name`, `url`) VALUES (22, 'Term List', '/vendor_portal/sec_get_bill_terms_for_recurring_bills_v2');
INSERT INTO `common_drop_down_url` (`id`, `name`, `url`) VALUES (23, 'PO List', '/vendor_portal/sec_get_approved_po_list_v2');
INSERT INTO `common_drop_down_url` (`id`, `name`, `url`) VALUES (24, 'Po Receipts', '/vendor_portal/sec_get_all_receipt_drop_down_v2');
INSERT INTO `common_drop_down_url` (`id`, `name`, `url`) VALUES (25, 'Project/Task By CategoryId', '/common_service/sec_get_detailed_approval_codes_by_category?categoryId=2');
INSERT INTO `common_drop_down_url` (`id`, `name`, `url`) VALUES (26, 'Email List', '/vendor_portal/sec_get_template_email_dropdown_dto_v2');
INSERT INTO `common_drop_down_url` (`id`, `name`, `url`) VALUES (27, 'Recurring Interval List', '/vendor_portal/sec_get_recurring_interval_list');
INSERT INTO `common_drop_down_url` (`id`, `name`, `url`) VALUES (28, 'Account types', '/common_service/sec_get_account_types');
INSERT INTO `common_drop_down_url` (`id`, `name`, `url`) VALUES (29, 'Account Detail types', '/common_service/sec_get_account_detail_types_v2');
INSERT INTO `common_drop_down_url` (`id`, `name`, `url`) VALUES (30, 'Parent Accounts', '/common_service/sec_get_parents_v2');
INSERT INTO `common_drop_down_url` (`id`, `name`, `url`) VALUES (31, 'Expense Automation Name', '/common_service/sec_get_automation_list_by_document_type?documentTypeId=4');


UPDATE  common_grid_column_template SET drop_down_url_id = 1 WHERE FIELD ='vendor.id' AND grid_id = 14;
UPDATE  common_grid_column_template SET drop_down_url_id = 23 WHERE field ='po.id' AND grid_id = 14;
UPDATE  common_grid_column_template SET drop_down_url_id = 24 WHERE field ='receipt.id' AND grid_id = 14;
UPDATE  common_grid_column_template SET drop_down_url_id = 10 WHERE field ='bill.approvalGroup' AND grid_id = 14;


UPDATE  common_grid_column_template SET drop_down_url_id = 1 WHERE field ='vendor.id' AND grid_id = 31;
UPDATE  common_grid_column_template SET drop_down_url_id = 26 WHERE field ='tmpemail.email' AND grid_id = 31;


UPDATE  common_grid_column_template SET drop_down_url_id = 1 WHERE field ='vendor.id' AND grid_id = 40;
UPDATE  common_grid_column_template SET drop_down_url_id = 27 WHERE field ='recBill.intervalValue' AND grid_id = 40;
UPDATE  common_grid_column_template SET drop_down_url_id = 22 WHERE field ='term.id' AND grid_id = 40;

UPDATE  common_grid_column_template SET drop_down_url_id = 1 WHERE field ='creditNote.vendorId' AND grid_id = 49;
UPDATE  common_grid_column_template SET drop_down_url_id = 23 WHERE field ='creditNote.poId' AND grid_id = 49;

UPDATE  common_grid_column_template SET drop_down_url_id = 1 WHERE field ='po.vendorId' AND grid_id = 13;
UPDATE  common_grid_column_template SET drop_down_url_id = 25 WHERE field ='po.projectCodeId' AND grid_id = 13;
UPDATE  common_grid_column_template SET drop_down_url_id = 10 WHERE field ='po.approvalGroup' AND grid_id = 13;
UPDATE  common_grid_column_template SET drop_down_url_id = 4 WHERE field ='dept.id' AND grid_id = 13;

UPDATE  common_grid_column_template SET drop_down_url_id = 1 WHERE field ='receipt.vendorId' AND grid_id = 16;
UPDATE  common_grid_column_template SET drop_down_url_id = 23 WHERE field ='receipt.poId' AND grid_id = 16;

UPDATE  common_grid_column_template SET drop_down_url_id = 28 WHERE field ='acct.id' AND grid_id = 4;
UPDATE  common_grid_column_template SET drop_down_url_id = 29 WHERE field ='accdt.id' AND grid_id = 4;
UPDATE  common_grid_column_template SET drop_down_url_id = 30 WHERE field ='accParent.id' AND grid_id = 4;


UPDATE  common_grid_column_template SET drop_down_url_id = 10 WHERE field ='appGroup.id' AND grid_id = 15;
UPDATE  common_grid_column_template SET drop_down_url_id = 31 WHERE field ='automation.id' AND grid_id = 15;


UPDATE  common_grid_column_template SET drop_down_url_id = 1 WHERE field ='vendor.id' AND grid_id = 51;

