----thiwanka 2.8.48----



INSERT INTO `common_drop_down` (`id`, `drop_down_name`) VALUES (38, 'Dropdown For Payment Status Field Automation');
INSERT INTO `common_drop_down_connection` (`drop_down_id`, `drop_down_value_id`) VALUES (38, 47);
INSERT INTO `common_automation_field` (`id`, `document_type`, `short_code`, `field_name`, `condition_enable`, `action_enable`, `show_hide_enable`, `show_hide_enable_default`, `data_type`, `drop_down_id`, `drop_down_url`, `second_value`, `max_length`, `notification_enable`, `field_weight`) VALUES (132, 1, 'paymentStatus', 'Payment Status', 0, 1, 0, 0, 'int', 38, NULL, 0, 0, 0, NULL);
INSERT INTO `common_automation_field` (`id`, `document_type`, `short_code`, `field_name`, `condition_enable`, `action_enable`, `show_hide_enable`, `show_hide_enable_default`, `data_type`, `drop_down_id`, `drop_down_url`, `second_value`, `max_length`, `notification_enable`, `field_weight`) VALUES (133, 4, 'status', 'Status', 0, 1, 0, 0, 'int', 12, NULL, 0, 0, 0, NULL);


CREATE TABLE IF NOT EXISTS `common_automation_field_compatibility` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `document_type_id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `field_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
);

INSERT INTO `common_automation_field_compatibility` (`document_type_id`, `event_id`, `field_id`) VALUES
	(1, 37, 9),(1, 37, 93),(1, 37, 74),
	(1, 1, 9),(1, 1, 93),(1, 1, 74),
	(1, 2, 9),(1, 2, 93),(1, 2, 74),
	(1, 9, 9),(1, 9, 93),(1, 9, 74),
	(1, 3, 132),(1, 3, 93),
	(1, 14, 132),(1, 14, 93),
	(4, 2, 95),(4, 2, 133),
	(4, 1, 95),(4, 1, 133),
	(4, 37, 95),(4, 37, 133),
	(2, 37, 37),(2, 37, 38),(2, 37, 36),(2, 37, 94),(2, 37, 35),(2, 37, 49),(2, 37, 73),
	(2, 1, 37),(2, 1, 38),(2, 1, 36),(2, 1, 94),(2, 1, 35),(2, 1, 49),(2, 1, 73),
	(2, 2, 37),(2, 2, 38),(2, 2, 36),(2, 2, 94),(2, 2, 35),(2, 2, 49),(2, 2, 73);
	
	
UPDATE `common_automation_field` SET `action_enable` = 0 WHERE id<>0;

UPDATE `common_automation_field` SET `action_enable` = 1 WHERE `document_type` = 1 AND `short_code` IN ('term', 'departmentId', 'status');

UPDATE `common_automation_field` SET `action_enable`=1 WHERE  `id`=132;

UPDATE `common_automation_field` SET `action_enable` = 1 WHERE `document_type` = 4 AND `short_code` IN ('departmentId', 'status');

UPDATE `common_automation_field` SET `action_enable` = 1 WHERE `document_type` = 2 AND `short_code` IN ('pocPhone', 'pocName', 'deliveryDate','departmentId','projectCodeId','taxAmount','status');

INSERT INTO `common_automation_document_action_config` (`document_type_id`, `event_id`, `action_id`, `automation_action`, `automation_rule_action`) VALUES (1, 9, 4, 1, 0);
INSERT INTO `common_automation_document_action_config` (`document_type_id`, `event_id`, `action_id`, `automation_action`, `automation_rule_action`) VALUES (1, 14, 4, 1, 0);

UPDATE `common_automation_document_action_config` SET `automation_action` = 0 WHERE `document_type_id` = 2 AND `action_id` = 4 AND `event_id` NOT IN (1, 2, 37);

UPDATE `common_automation_document_action_config` SET `automation_action` = 0 WHERE `action_id` = 4 AND `document_type_id` NOT IN (1, 2, 4);

INSERT INTO `common_automation_document_action_config` (`document_type_id`, `event_id`, `action_id`, `automation_action`, `automation_rule_action`) VALUES (4, 37, 4, 1, 0);

UPDATE `common_automation_document_action_config` SET `automation_action` = 0 WHERE `document_type_id` = 4 AND `action_id` = 4 AND `event_id` NOT IN (1, 2, 37);



----kavindu 2.8.49---


INSERT INTO `common_automation_field_condition` (`field_id`, `condition_id`) VALUES
	(118, 1),
	(118, 2),
	(118, 3),
	(118, 4),
	(118, 5),
	(118, 6),
	(118, 8),
	(119, 1),
	(119, 2),
	(119, 3),
	(119, 4),
	(119, 5),
	(119, 6),
	(119, 8);


----dasindu 2.8.50---


INSERT INTO `common_document_field` (`id`, `field_name`) VALUES (5, 'Description');

INSERT INTO `common_document_required_field_config` (`id`, `field_id`, `enable`) VALUES (5, 5, 1);

INSERT INTO `common_document_field_config` (`id`, `document_id`, `field_id`, `enable`) VALUES (9, 1, 5, 1); 
INSERT INTO `common_document_field_config` (`id`, `document_id`, `field_id`, `enable`) VALUES (10, 2, 5, 1);

INSERT INTO `common_document_field_section_config` (`id`, `section_id`, `field_config`, `field_code`, `enable`) VALUES (16, 3, 9, 'description', 1); 
INSERT INTO `common_document_field_section_config` (`id`, `section_id`, `field_config`, `field_code`, `enable`) VALUES (17, 4, 9, 'description', 1);
INSERT INTO `common_document_field_section_config` (`id`, `section_id`, `field_config`, `field_code`, `enable`) VALUES (18, 2, 10, 'description', 1); 
INSERT INTO `common_document_field_section_config` (`id`, `section_id`, `field_config`, `field_code`, `enable`) VALUES (19, 9, 10, 'description', 1);

INSERT INTO `common_document_field_validation_message` (`id`, `field_id`, `error_message`) VALUES (5, 5, 'Description cannot be empty');


-------hashila 2.8.51---




INSERT INTO umm_privilages (id, url, text, auth_code, created_by, created_on) VALUES (152, 'View All Po', 'View All Po', 'PURCHASE_ORDER_VIEW_ALL_PO', 'System', '2023-08-25 10:56:00');
INSERT INTO umm_privilages (id, url, text, auth_code, created_by, created_on) VALUES (153, 'View All Bills', 'View All Bills', 'BILL_VIEW_ALL_BILLS', 'System', '2023-08-25 10:51:00');

INSERT INTO umm_menu_privilage (id, menu_id, privilage_id, auth_code, created_by, created_on) VALUES (555, 1021, 152, 'PURCHASE_ORDER_VIEW_ALL_PO', 'System', '2023-08-25 10:58:00');
INSERT INTO umm_menu_privilage (id, menu_id, privilage_id, auth_code, created_by, created_on) VALUES (556, 1019, 153, 'BILL_VIEW_ALL_BILLS', 'System', '2023-08-25 10:53:00');

INSERT INTO umm_role_previlege (role_id, privilege_id, created_by, created_on) VALUES (1, 152, 'admin', '2023-08-25 11:10:00');
INSERT INTO umm_role_previlege (role_id, privilege_id, created_by, created_on) VALUES (1, 153, 'admin', '2023-08-25 11:10:00');

ALTER TABLE vp_bill_item_cost_distribution
	ADD COLUMN account_id INT(11) NULL DEFAULT NULL AFTER qty,
	ADD CONSTRAINT FK_vp_invoice_item_cost_distribution_common_chart_of_account FOREIGN KEY (account_id) REFERENCES common_account_number (id) ON UPDATE RESTRICT ON DELETE RESTRICT;

ALTER TABLE vp_bill_audit_trail_cost_distribution
	ADD COLUMN item_account_number VARCHAR(100) NULL DEFAULT NULL AFTER number;

ALTER TABLE hst_vp_bill_item_cost_distribution
	ADD COLUMN account_id DECIMAL(11) NULL DEFAULT '0.00' AFTER qty;

---Hashila---2.8.55----

UPDATE `umm_menu` SET `status` = 'A' WHERE super_type = 1002;


-----Deshan---2.8.57-----

ALTER TABLE `vp_payment_recipient_detail`
	ADD COLUMN `remittance_email_address` VARCHAR(150) NULL DEFAULT NULL AFTER `preferred_payment_type`;
	
ALTER TABLE `vp_payment_recipient_detail`
	CHANGE COLUMN `account_routing_number` `account_routing_number` VARCHAR(100) NULL DEFAULT NULL COLLATE 'latin1_swedish_ci' AFTER `account_type`,
	ADD COLUMN `encoded_account_routing_number` VARCHAR(100) NULL DEFAULT NULL AFTER `account_routing_number`,
	ADD COLUMN `encoded_account_number` VARCHAR(100) NULL DEFAULT NULL AFTER `account_number`;
	

------Dasidi--2.8.60-----


UPDATE `common_document_required_field_config` SET `enable`=0 WHERE  `id`=5;

------Sithum----2.8.61----

INSERT INTO common_grid_column_template (`grid_id`, `field`, `sortable_field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `filter_show`, `is_frozen`, `align`, `search_type`, `placeholder`, `column_order`, `column_width`) VALUES (15, 'expense.paidAmount', 'expense.paidAmount', 'Paid Amount', 1, 1, 0, 1, 1, 1, 0, 'right', 'numeric', 'Paid Amount', 10, 150);


----kavindu 2.8.63---


UPDATE `common_grid_state_template` SET `total_rows` = 25 WHERE `grid_id` = 67;


----kavindu 2.8.68---



UPDATE `common_automation_field` SET `field_name` = 'Approval Status' WHERE `short_code` = 'status' AND document_type IN (1,2,4);

UPDATE `common_automation_field` SET `drop_down_id` = 27 WHERE document_type = 2 AND short_code = 'status';

-----------hashila 2.8.69------





INSERT INTO common_grid_column_template(grid_id, field, sortable_field, header, column_show, is_sortable, is_re_orderable, is_re_sizable, can_hide, filter_show, is_frozen, frozen_direction, align, search_type, placeholder, column_order, drop_down_id, column_width, drop_down_url_id) VALUES (54, 'transaction.department', 'transaction.department', 'Department', 1, 0, 0, 1, 1, 0, 0, NULL, 'left', '', 'Department', 12, NULL, 150, NULL);

UPDATE common_grid_column_template SET column_order = 13 WHERE grid_id = 54 AND field = 'transaction.billable';
UPDATE common_grid_column_template SET column_order = 14 WHERE grid_id = 54 AND field = 'transaction.cardNo';
UPDATE common_grid_column_template SET column_order = 15 WHERE grid_id = 54 AND field = 'transaction.status';

UPDATE common_grid_column_template SET column_order = 16 WHERE grid_id = 55 AND field = 'transaction.cardNo';
UPDATE common_grid_column_template SET column_order = 9 WHERE grid_id = 55 AND field = 'transaction.description';
UPDATE common_grid_column_template SET column_order = 10 WHERE grid_id = 55 AND field = 'transaction.amount';
UPDATE common_grid_column_template SET column_order = 7 WHERE grid_id = 55 AND field = 'transaction.employeeName';
UPDATE common_grid_column_template SET column_order = 11 WHERE grid_id = 55 AND field = 'transaction.account';
UPDATE common_grid_column_template SET column_order = 12 WHERE grid_id = 55 AND field = 'transaction.projectCode';
UPDATE common_grid_column_template SET column_order = 3 WHERE grid_id = 55 AND field = 'transaction.missingReceiptAvailability';
UPDATE common_grid_column_template SET column_order = 4 WHERE grid_id = 55 AND field = 'transaction.receipt';
UPDATE common_grid_column_template SET column_order = 14 WHERE grid_id = 55 AND field = 'transaction.billable';
UPDATE common_grid_column_template SET column_order = 18 WHERE grid_id = 55 AND field = 'transaction.remarks';
UPDATE common_grid_column_template SET column_order = 19 WHERE grid_id = 55 AND field = 'transaction.approvalUserName';
UPDATE common_grid_column_template SET column_order = 21 WHERE grid_id = 55 AND field = 'transaction.approvedDate';
UPDATE common_grid_column_template SET column_order = 20 WHERE grid_id = 55 AND field = 'transaction.approvalGroupName';
UPDATE common_grid_column_template SET column_order = 17 WHERE grid_id = 55 AND field = 'transaction.approver';
UPDATE common_grid_column_template SET column_order = 22 WHERE grid_id = 55 AND field = 'transaction.submittedDate';

INSERT INTO common_grid_column_template(grid_id, field, sortable_field, header, column_show, is_sortable, is_re_orderable, is_re_sizable, can_hide, filter_show, is_frozen, frozen_direction, align, search_type, placeholder, column_order, drop_down_id, column_width, drop_down_url_id) VALUES (55, 'transaction.department', 'transaction.department', 'Department', 1, 0, 0, 1, 1, 0, 0, NULL, 'left', '', 'Department', 13, NULL, 150, NULL);

INSERT INTO common_grid_column_template(grid_id, field, sortable_field, header, column_show, is_sortable, is_re_orderable, is_re_sizable, can_hide, filter_show, is_frozen, frozen_direction, align, search_type, placeholder, column_order, drop_down_id, column_width, drop_down_url_id) VALUES (56, 'transaction.department', 'transaction.department', 'Department', 1, 0, 0, 1, 1, 0, 0, NULL, 'left', '', 'Department', 13, NULL, 150, NULL);

UPDATE common_grid_column_template SET column_order = 15 WHERE grid_id = 56 AND field = 'transaction.cardNo';
UPDATE common_grid_column_template SET column_order = 14 WHERE grid_id = 56 AND field = 'transaction.billable';

ALTER TABLE vp_credit_card_statement_detail 
ADD COLUMN department_id int NULL AFTER project_code_id;

---hashila 2.8.70----


UPDATE common_grid_column_template SET field = 'transaction.departmentId', sortable_field = 'transaction.departmentId' WHERE grid_id = 56 AND field = 'transaction.department';


-------sithum2.8.71---


ALTER TABLE vp_recurring_bill_item_cost_distribution
	ADD COLUMN account_id INT(11) NULL DEFAULT NULL AFTER description;

ALTER TABLE vp_po_detail
	ADD COLUMN account_id INT(11) NULL DEFAULT NULL AFTER description;

ALTER TABLE hst_vp_po_detail
	ADD COLUMN account_id INT(11) NULL DEFAULT NULL AFTER description;


------sithum 2.8.74---

UPDATE umm_menu SET tab=5, menu_order=5 WHERE  id=1040;
 

UPDATE umm_menu SET tab=4, menu_order=4 WHERE  id=1058;

----kavindu 2.8.75---


UPDATE common_automation_field SET field_name = "Approval User" WHERE short_code = "approvalUser" AND id = 103;
UPDATE common_automation_field SET field_name = "Approval Group" WHERE short_code = "approvalGroup" AND id = 104;

DELETE FROM common_automation_document_action_config WHERE action_id = 6;

DELETE FROM common_automation_document_type_event WHERE event_id = 10;
DELETE FROM common_automation_document_action_config WHERE event_id = 10;

----kavindu 2.8.85---


UPDATE common_automation_field SET field_name = "Vendor's Group" WHERE short_code = "vendorGroups";

UPDATE `common_automation_field` SET `condition_enable`= 0 WHERE short_code IN ('approvalUser', 'approvalGroup');

INSERT INTO `common_automation_field_compatibility` (`document_type_id`, `event_id`, `field_id`) VALUES
	(1, 37, 130),
	(1, 1, 130),
	(1, 2, 130),
	(1, 9, 130);
	
UPDATE `common_automation_field` SET `action_enable`=1 WHERE  `id`=130;

DELETE FROM common_automation_field_compatibility WHERE document_type_id=1 AND event_id IN (3, 14) AND field_id=93;

DELETE FROM common_automation_field_compatibility WHERE document_type_id=2 AND field_id=36;

-----dasindu 2.8.87---



INSERT INTO `umm_menu_privilage` (`id`, `menu_id`, `privilage_id`, `auth_code`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (557, 1035, 47, 'VENDORS_CSV_EXPORT', 'System', '2023-10-16 11:10:06', NULL, NULL, NULL, NULL);

INSERT INTO `umm_role_previlege` (`role_id`, `privilege_id`, `sub_account_id`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (1, 557, NULL, 'Admin', '2021-03-29 22:43:59', NULL, NULL, NULL, NULL);



---sithum 2.8.91-----



UPDATE umm_menu SET display_text='Create Vendors' WHERE  id=1035;


----hashila 2.8.93----


UPDATE common_grid_column_template SET is_sortable = 0 WHERE grid_id = 14 AND field = 'po.id';
UPDATE common_grid_column_user_wice SET is_sortable = 0 WHERE grid_id = 14 AND field = 'po.id';



---hashila 2.8.94---


UPDATE common_grid_column_template SET is_sortable = 1 WHERE grid_id = 14 AND field = 'po.id';
UPDATE common_grid_column_user_wice SET is_sortable = 1 WHERE grid_id = 14 AND field = 'po.id';

UPDATE common_grid_column_template SET is_sortable = 0 WHERE grid_id = 14 AND field = 'code.id';
UPDATE common_grid_column_user_wice SET is_sortable = 0 WHERE grid_id = 14 AND field = 'code.id';

----kavindu 2.8.96---


DELETE FROM common_drop_down_connection WHERE drop_down_id=12 AND drop_down_value_id=12;


----chandima 2.8.98---


UPDATE umm_menu SET menu_style='pi pi-book', display_icon='pi pi-book' WHERE  id=1018;

UPDATE umm_menu SET menu_style='fa fa-usd', display_icon='fa fa-usd' WHERE  id=1028;

UPDATE umm_menu SET menu_style='fa fa-cart-arrow-down', display_icon='fa fa-cart-arrow-down' WHERE  id=1027;


---chandima 2.8.100---


UPDATE umm_menu SET tab='1' WHERE  id=1041;

UPDATE umm_menu SET tab='2' WHERE  id=1046;

UPDATE umm_menu SET name='General Settings', display_text='General Settings' WHERE  id=1046;

UPDATE umm_menu SET tab='4' WHERE  id=1028;

UPDATE umm_menu SET name='Online Payments', display_text='Online Payments' WHERE  id=1028;

UPDATE umm_menu SET tab='5' WHERE  id=1044;

UPDATE umm_menu SET name='Feature Settings', display_text='Feature Settings' WHERE  id=1044;

UPDATE umm_menu SET individual_tenant_menu='0' WHERE  id=1045;

UPDATE umm_menu SET tab='3' WHERE  id=1018;

UPDATE umm_menu SET name='Fields Configuration', display_text='Fields Configuration' WHERE  id=1018;

UPDATE umm_menu SET individual_tenant_menu='0' WHERE  id=1027;

UPDATE umm_menu SET individual_tenant_menu='0' WHERE  id=1043;

UPDATE umm_menu SET display_icon='fa fa-users' WHERE  id=1044;

UPDATE umm_menu SET menu_order='3' WHERE  id=1017;

UPDATE umm_menu SET menu_order='4' WHERE  id=1041;

UPDATE umm_menu SET menu_order='5' WHERE  id=1046;

UPDATE umm_menu SET menu_order='6' WHERE  id=1018;

UPDATE umm_menu SET menu_order='7' WHERE  id=1028;

UPDATE umm_menu SET menu_order='8' WHERE  id=1044;


---kavindu 2.8.108----



ALTER TABLE `common_automation_field` ADD COLUMN `conditional_short_code` VARCHAR(200) NULL DEFAULT NULL AFTER `short_code`;

UPDATE common_automation_field SET conditional_short_code = short_code WHERE id<>0;

UPDATE `common_automation_field` SET `short_code`='projectCodeId' WHERE  `id`=130;
UPDATE `common_automation_field` SET `short_code`='projectCodeId' WHERE  `id`=131;


---kavindu 2.8.111---



UPDATE `common_notification_email_template` SET `template_data`='<html>\r\n  <head>\r\n    <meta charset="UTF-8">\r\n    <meta name="viewport" content="width=device-width, initial-scale=1.0">\r\n  </head>\r\n  <body>\r\n    <table style="color: #207580;">\r\n      <tr>\r\n        <td style="font-weight: bold">Dear <span id="EMAIL_ADDRESS">Email address</span>, </td>\r\n      </tr>\r\n      <tr style="height:20px"></tr>\r\n      <tr>\r\n        <td>From <span id="DOCUMENT_DETAILS">Document Details Here</span>\r\n        </td>\r\n      </tr>\r\n      <tr style="height:10px"></tr>\r\n      <tr>\r\n        <td>\r\n          <span id="EMAIL_CONTENT">Email Content here</span>\r\n        </td>\r\n      </tr>\r\n      <tr style="height:10px">\r\n      <tr>\r\n      <tr>\r\n        <td>If you have any comments or questions, please do not hesitate to contact us at <span style="font-weight: bold">\r\n            <a href="mailto:support@papertrl.com">support@papertrl.com.</a>\r\n          </span>\r\n        </td>\r\n      </tr>\r\n      <tr style="line-height: 70px;">\r\n        <td>\r\n          <span style="font-weight: bold">Thank You!</span>\r\n        </td>\r\n      </tr>\r\n      <tr>\r\n        <td>\r\n          <img style="width: 170px;height: 45px;" src="https://papertrl.com/wp-content/uploads/2019/09/logo.png" />\r\n        </td>\r\n      </tr>\r\n      <tr>\r\n        <td>This email is an automated notification, Replies to this message will not be read or responded to. We\'re happy to help you with any questions or concerns you may have. Please contact us directly 24/7 via <span style="font-weight: bold">support@papertrl.com</span>\r\n          <p class="MsoNormal">\r\n            <span style="font-size:8.0pt;color:#207580">CONFIDENTIALITY NOTICE: This e-mail transmission, and any attachments, is intended only for the use of PaperTrl Inc. or recipient named above and may contain information that is confidential, privileged and exempt from disclosure under applicable law. If you are not the intended recipient or authorized to receive this message for the recipient, you must not use, copy, disclose or take any action based on this message or any information herein. If you have received this message in error, please advise the sender immediately.</span>\r\n            <span style="font-size:8.0pt;color:#014708"></span>\r\n          </p>\r\n          <p>\r\n            <span style="font-size:18.0pt;font-family:Webdings;color:green">P</span>\r\n            <span style="color:black"></span>\r\n            <span style="font-size:10.0pt;font-family:&quot;Helvetica&quot;,sans-serif;color:green">Be Environmentally Responsible. Please don\'t print this e-mail unless you really need to.</span>\r\n            <u></u>\r\n            <u></u>\r\n          </p>\r\n        </td>\r\n      </tr>\r\n      <table>\r\n  </body>\r\n</html>' WHERE `id`=22;


-----hashila 2.8.112----

ALTER TABLE vp_bill 
ADD INDEX STATUS_COL_INX(status) USING BTREE;


