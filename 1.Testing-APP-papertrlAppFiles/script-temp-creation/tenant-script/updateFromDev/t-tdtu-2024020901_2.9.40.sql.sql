ALTER TABLE vp_payment_type_for_vendor 
ADD COLUMN provider_id int NULL AFTER vendor_id,
ADD COLUMN remit_email varchar(150) NULL AFTER provider_id;
 
ALTER TABLE vp_payment_type_for_user 
ADD COLUMN provider_id int NULL AFTER user_name;
 
 
ALTER TABLE vp_payment_transaction 
ADD COLUMN funding_account_id int NULL AFTER cancel_reason;
 
ALTER TABLE vp_payment_batch 
ADD COLUMN funding_account_id int NULL AFTER provider_name;
 
ALTER TABLE vp_payment_transaction 
ADD COLUMN provider_id int NULL AFTER funding_account_id;
 
ALTER TABLE vp_payment_transaction 
ADD COLUMN provider_name varchar(100) NULL AFTER provider_id;
 
ALTER TABLE vp_payment_transaction 
ADD COLUMN request_id int NULL AFTER single_card_for_batch;

CREATE TABLE `vp_payment_request_mst` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`batch_id` INT(11) NOT NULL,
	`line_no` INT(11) NOT NULL,
	`reference_no` VARCHAR(70) NOT NULL COLLATE 'latin1_swedish_ci',
	`vendor_token` VARCHAR(70) NOT NULL DEFAULT '' COLLATE 'latin1_swedish_ci',
	`txn_date` DATE NOT NULL,
	`txn_amount` DECIMAL(19,2) NOT NULL DEFAULT '0.00',
	`description` VARCHAR(150) NULL DEFAULT '0' COLLATE 'latin1_swedish_ci',
	`check_delivery_by_mail` CHAR(1) NULL DEFAULT NULL COLLATE 'latin1_swedish_ci',
	`service_level_override` CHAR(50) NOT NULL DEFAULT '' COLLATE 'latin1_swedish_ci',
	`currency_code` VARCHAR(10) NULL DEFAULT NULL COLLATE 'latin1_swedish_ci',
	`payment_type` VARCHAR(50) NULL DEFAULT '' COLLATE 'latin1_swedish_ci',
	`payee_id` INT(11) NOT NULL,
	`payee` VARCHAR(70) NULL DEFAULT NULL COLLATE 'latin1_swedish_ci',
	`status` CHAR(1) NOT NULL DEFAULT '' COLLATE 'latin1_swedish_ci',
	`created_by` VARCHAR(50) NULL DEFAULT NULL COLLATE 'latin1_swedish_ci',
	`created_on` DATETIME NULL DEFAULT NULL,
	`update_by` VARCHAR(50) NULL DEFAULT NULL COLLATE 'latin1_swedish_ci',
	`update_on` DATETIME NULL DEFAULT NULL,
	`delete_by` VARCHAR(50) NULL DEFAULT NULL COLLATE 'latin1_swedish_ci',
	`delete_on` DATETIME NULL DEFAULT NULL,
	PRIMARY KEY (`id`) USING BTREE
)
COLLATE='latin1_swedish_ci'
ENGINE=InnoDB
AUTO_INCREMENT=58
;



CREATE TABLE `vp_payment_request_import_mst` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`uuid` VARCHAR(100) NOT NULL COLLATE 'latin1_swedish_ci',
	`total_records` INT(11) NULL DEFAULT NULL,
	`succeeded` INT(11) NULL DEFAULT NULL,
	`failed` INT(11) NULL DEFAULT NULL,
	`created_by` VARCHAR(100) NOT NULL DEFAULT '' COLLATE 'latin1_swedish_ci',
	`created_on` DATETIME NOT NULL,
	`update_by` VARCHAR(100) NULL DEFAULT NULL COLLATE 'latin1_swedish_ci',
	`update_on` DATETIME NULL DEFAULT NULL,
	`delete_by` VARCHAR(100) NULL DEFAULT NULL COLLATE 'latin1_swedish_ci',
	`delete_on` DATETIME NULL DEFAULT NULL,
	PRIMARY KEY (`id`) USING BTREE
)
COLLATE='latin1_swedish_ci'
ENGINE=InnoDB
;


CREATE TABLE `vp_payment_request_import_issue` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`import_mst_id` INT(11) NOT NULL,
	`record` TEXT NULL DEFAULT NULL COLLATE 'latin1_swedish_ci',
	`description` VARCHAR(250) NULL DEFAULT NULL COLLATE 'latin1_swedish_ci',
	`line_no` INT(10) NULL DEFAULT NULL,
	PRIMARY KEY (`id`) USING BTREE,
	INDEX `FK_IMPORT_MST2` (`import_mst_id`) USING BTREE,
	CONSTRAINT `FK1_IMPORT_MST` FOREIGN KEY (`import_mst_id`) REFERENCES `vp_payment_request_import_mst` (`id`) ON UPDATE CASCADE ON DELETE CASCADE
)
COLLATE='latin1_swedish_ci'
ENGINE=InnoDB
;


CREATE TABLE `vp_payment_request_invoice_detail` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`payment_reference` VARCHAR(70) NOT NULL COLLATE 'latin1_swedish_ci',
	`vendor_token` VARCHAR(70) NOT NULL DEFAULT '' COLLATE 'latin1_swedish_ci',
	`invoice_no` VARCHAR(70) NULL DEFAULT NULL COLLATE 'latin1_swedish_ci',
	`invoice_date` DATE NULL DEFAULT NULL,
	`invoice_amount` DOUBLE NULL DEFAULT NULL,
	`created_by` VARCHAR(100) NOT NULL DEFAULT '' COLLATE 'latin1_swedish_ci',
	`created_on` DATETIME NOT NULL,
	`update_by` VARCHAR(100) NULL DEFAULT NULL COLLATE 'latin1_swedish_ci',
	`update_on` DATETIME NULL DEFAULT NULL,
	`delete_by` VARCHAR(100) NULL DEFAULT NULL COLLATE 'latin1_swedish_ci',
	`delete_on` DATETIME NULL DEFAULT NULL,
	PRIMARY KEY (`id`) USING BTREE
)
COLLATE='latin1_swedish_ci'
ENGINE=InnoDB
AUTO_INCREMENT=16
;



CREATE TABLE `vp_payment_request_custom_field` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`payment_reference` VARCHAR(70) NOT NULL COLLATE 'latin1_swedish_ci',
	`vendor_token` VARCHAR(70) NOT NULL DEFAULT '' COLLATE 'latin1_swedish_ci',
	`custom_field_first` VARCHAR(255) NULL DEFAULT NULL,
	`custom_field_second` VARCHAR(255) NULL DEFAULT NULL,
	`custom_field_third` VARCHAR(255) NULL DEFAULT NULL,
	`custom_field_fourth` VARCHAR(255) NULL DEFAULT NULL,
	`created_by` VARCHAR(100) NOT NULL DEFAULT '' COLLATE 'latin1_swedish_ci',
	`created_on` DATETIME NOT NULL,
	`update_by` VARCHAR(100) NULL DEFAULT NULL COLLATE 'latin1_swedish_ci',
	`update_on` DATETIME NULL DEFAULT NULL,
	`delete_by` VARCHAR(100) NULL DEFAULT NULL COLLATE 'latin1_swedish_ci',
	`delete_on` DATETIME NULL DEFAULT NULL,
	PRIMARY KEY (`id`) USING BTREE
)
COLLATE='latin1_swedish_ci'
;

CREATE TABLE `vp_payment_request_import_batch` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`uuid` VARCHAR(100) NOT NULL DEFAULT '' COLLATE 'latin1_swedish_ci',
	`filename` VARCHAR(50) NOT NULL COLLATE 'latin1_swedish_ci',
	`created_by` VARCHAR(50) NULL DEFAULT NULL COLLATE 'latin1_swedish_ci',
	`created_on` DATETIME NULL DEFAULT NULL,
	`update_by` VARCHAR(50) NULL DEFAULT NULL COLLATE 'latin1_swedish_ci',
	`update_on` DATETIME NULL DEFAULT NULL,
	`delete_by` VARCHAR(50) NULL DEFAULT NULL COLLATE 'latin1_swedish_ci',
	`delete_on` DATETIME NULL DEFAULT NULL,
	PRIMARY KEY (`id`) USING BTREE
)
COLLATE='latin1_swedish_ci'
ENGINE=InnoDB
AUTO_INCREMENT=3
;

INSERT INTO `common_grid_template` (`id`, `grid_name`) VALUES (73, 'PROCESS_PAYMENT_REQUEST_LIST');

INSERT INTO common_grid_column_template (grid_id, field, sortable_field, header, column_show, is_sortable, is_re_orderable, is_re_sizable, can_hide, filter_show, is_frozen, frozen_direction, align, search_type, placeholder, column_order, drop_down_id, column_width, drop_down_url_id) VALUES 
(73, 'checkbox', 'checkbox', NULL, 1, 0, 0, 0, 0, 0, 1, 'left', 'center', 'checkbox', '', 1, NULL, 50, NULL),
(73, 'pPaymentReq.referenceNumber', 'pPaymentReq.referenceNumber', 'Ref No.', 1, 1, 1, 1, 1, 1, 0, NULL, 'left', 'input', 'Ref No.', 2, NULL, 160, NULL),
(73, 'pPaymentReq.payee', 'pPaymentReq.payee', 'Payee', 1, 1, 1, 1, 1, 1, 0, NULL, 'left', 'input', 'Payee', 3, NULL, 160,NULL),
(73, 'pPaymentReq.paymentType', 'pPaymentReq.paymentType', 'Payement Type', 1, 0, 1, 1, 1, 0, 0, NULL, 'left', 'input', 'Payment Type', 4, NULL, 160, NULL),
(73, 'pPaymentReq.paymentChannel', 'pPaymentReq.paymentChannel', 'Payement Channel', 1, 0, 1, 1, 1, 0, 0, NULL, 'left', 'input', 'Payment Channel', 5, NULL, 160, NULL),
(73, 'pPaymentReq.createdOn', 'pPaymentReq.createdOn', 'Created Date', 1, 1, 1, 1, 1, 1, 0, NULL, 'center', 'date', 'Created Date', 6, NULL, 160, NULL),
(73, 'pPaymentReq.description', 'pPaymentReq.description', 'Comment', 1, 1, 1, 1, 1, 1, 0, NULL, 'left', 'input', 'Comment', 7, NULL, 160, NULL),
(73, 'pPaymentReq.txnAmount', 'pPaymentReq.txnAmount', 'Amount', 1, 1, 1, 1, 1, 1, 0, NULL, 'right', 'numeric', 'Amount', 8, NULL, 160, NULL);

INSERT INTO common_grid_state_template (grid_id, start_from, total_rows, column_widths) VALUES (73, 0, 25, '50,210,210,210,210,210,210,210');

CREATE TABLE IF NOT EXISTS `vp_payment_mail_option` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `value` char(1) DEFAULT NULL,
  `status` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;


INSERT INTO `vp_payment_mail_option` (`id`, `name`, `value`, `status`) VALUES
	(1, 'First Class (F)', 'F', 'A'),
	(2, 'Priority (P)', 'P', 'A'),
	(3, 'Next Day (N)', 'N', 'A');

DROP TABLE IF EXISTS vp_payment_bank_account;
CREATE TABLE vp_payment_bank_account (
    id INT(11) NOT NULL AUTO_INCREMENT,
    bank_id INT,
    account_no VARCHAR(255),
    account_nic_name VARCHAR(255),
    company_name VARCHAR(255),
    status CHAR,
    file_url VARCHAR(255),
    company_id VARCHAR(255),
    bank_routing_no VARCHAR(255),
    transit_no VARCHAR(255),
    check_sequence_number VARCHAR(255),
    default_funding_account BOOLEAN,
    encoded_account_no VARCHAR(255),
    encoded_bank_routing_no VARCHAR(255),
    virtual_card_acc_id VARCHAR(255),
    digital_card_acc_id VARCHAR(255), 
    created_on datetime,
    created_by VARCHAR(255),
    delete_on datetime,
    delete_by VARCHAR(255),
    update_on datetime,
    update_by VARCHAR(255),
    PRIMARY KEY (id)
);
 
DROP TABLE IF EXISTS vp_bank_payment_type;
CREATE TABLE vp_bank_payment_type (
  id INT(11) NOT NULL AUTO_INCREMENT,
  payment_type_id INT(11) NOT NULL,
  bank_account_id INT(11) DEFAULT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (bank_account_id) REFERENCES vp_payment_bank_account(id)
);
 
 

INSERT INTO umm_menu (id,name, display_text, menu_style, url, tab, type, super_type, super_type_2, department, menu_order, display_icon, short_name, detail_text, status, portal_menu, individual_tenant_menu, vendor_community_menu, mobile_menu, version, auth_code, slim_menu, hierachy, created_by, created_on, update_by, update_on, delete_by, delete_on) 
VALUES (1062,'Funding Accounts', 'Funding Accounts', 'fa fa-building-columns', '/home/settings', '6', 'S', 1002, NULL, 'Admin', 8, 'fa fa-users', 'Funding Accounts', 'Funding Accounts', 'A', 0, 1, 0, 0, 'V2', 'FUNDING_ACCOUNT', 1, '1002,1014', 'System', '2023-10-26 08:34:32', NULL, NULL, NULL, NULL);

INSERT INTO umm_privilages (id,url, text, auth_code, created_by, created_on, update_by, update_on, delete_by, delete_on) 
VALUES (155,'Mark as Default', 'Mark as Default', 'FUNDING_ACCOUNT_MARK_AS_DEFAULT', 'System', '2023-08-25 10:51:00', NULL, NULL, NULL, NULL);

INSERT INTO umm_menu_privilage (id,menu_id, privilage_id, auth_code, created_by, created_on, update_by, update_on, delete_by, delete_on) 
VALUES (559,1062, 1, 'FUNDING_ACCOUNT_CREATE', 'System', '2024-01-25 13:00:00', NULL, NULL, NULL, NULL);

INSERT INTO umm_menu_privilage (id,menu_id, privilage_id, auth_code, created_by, created_on, update_by, update_on, delete_by, delete_on) 
VALUES (560,1062, 4, 'FUNDING_ACCOUNT_EDIT', 'System', '2024-01-25 13:00:00', NULL, NULL, NULL, NULL);

INSERT INTO umm_menu_privilage (id,menu_id, privilage_id, auth_code, created_by, created_on, update_by, update_on, delete_by, delete_on) 
VALUES (561,1062, 5, 'FUNDING_ACCOUNT_DELETE', 'System', '2024-01-25 13:00:00', NULL, NULL, NULL, NULL);

INSERT INTO umm_menu_privilage (id,menu_id, privilage_id, auth_code, created_by, created_on, update_by, update_on, delete_by, delete_on) 
VALUES (562,1062, 155, 'FUNDING_ACCOUNT_MARK_AS_DEFAULT', 'System', '2024-01-25 13:00:00', NULL, NULL, NULL, NULL);

INSERT INTO umm_menu_privilage (id,menu_id, privilage_id, auth_code, created_by, created_on) 
VALUES (563,1062, '13', 'FUNDING_ACCOUNT_INACTIVE', 'System', '2024-02-08 17:24:37');

INSERT INTO umm_menu_privilage (id,menu_id, privilage_id, auth_code, created_by, created_on) 
VALUES (564,1062, '14', 'FUNDING_ACCOUNT_ACTIVE', 'System', '2024-02-08 17:29:02');


INSERT INTO umm_role_previlege (role_id, privilege_id, sub_account_id, created_by, created_on, update_by, update_on, delete_by, delete_on) 
VALUES (1, 559, NULL, 'System', '2021-03-29 22:43:59', NULL, NULL, NULL, NULL);

INSERT INTO umm_role_previlege (role_id, privilege_id, sub_account_id, created_by, created_on, update_by, update_on, delete_by, delete_on) 
VALUES (1, 560, NULL, 'System', '2021-03-29 22:43:59', NULL, NULL, NULL, NULL);

INSERT INTO umm_role_previlege (role_id, privilege_id, sub_account_id, created_by, created_on, update_by, update_on, delete_by, delete_on) 
VALUES (1, 561, NULL, 'System', '2021-03-29 22:43:59', NULL, NULL, NULL, NULL);

INSERT INTO umm_role_previlege (role_id, privilege_id, sub_account_id, created_by, created_on, update_by, update_on, delete_by, delete_on) 
VALUES (1, 562, NULL, 'System', '2021-03-29 22:43:59', NULL, NULL, NULL, NULL);

INSERT INTO umm_role_previlege (role_id, privilege_id, sub_account_id, created_by, created_on, update_by, update_on, delete_by, delete_on) 
VALUES (1, 563, NULL, 'System', '2021-03-29 22:43:59', NULL, NULL, NULL, NULL);

INSERT INTO umm_role_previlege (role_id, privilege_id, sub_account_id, created_by, created_on, update_by, update_on, delete_by, delete_on) 
VALUES (1, 564, NULL, 'System', '2021-03-29 22:43:59', NULL, NULL, NULL, NULL);

ALTER TABLE vp_payment_recipient_detail
	ADD COLUMN check_to_be_mail TINYINT(1) NULL DEFAULT NULL AFTER payee_token,
	ADD COLUMN mailOption TINYINT(1) NULL DEFAULT NULL AFTER check_to_be_mail;
	
ALTER TABLE vp_payment_check
	ADD COLUMN funding_Account_id INT(50) NULL DEFAULT 0 AFTER sync_status;