
INSERT INTO umm_menu (id, name, display_text, menu_style, url, tab, type, super_type, super_type_2, department, menu_order, display_icon, short_name, detail_text, status, portal_menu, individual_tenant_menu, vendor_community_menu, version, auth_code, slim_menu, hierachy, created_by, created_on, update_by, update_on, delete_by, delete_on) VALUES (1042, 'Inbox', 'Inbox', 'fa fa-inbox', '/home/inbox', '0', 'S', 1014, null, 'Admin', 2, 'fa fa-inbox', 'Inbox', 'Inbox', 'A', 0, 1, 0, 'V2', 'INBOX', 1, '1014', 'System', '2021-11-01 17:27:21', null, null, null, null);
INSERT INTO umm_menu (id, name, display_text, menu_style, url, tab, type, super_type, super_type_2, department, menu_order, display_icon, short_name, detail_text, status, portal_menu, individual_tenant_menu, vendor_community_menu, version, auth_code, slim_menu, hierachy, created_by, created_on, update_by, update_on, delete_by, delete_on) VALUES (1043, 'To Process', 'To Process', 'fa fa-retweet', '/home/inbox', '0', 'S', 1042, null, 'Admin', 1, 'fa fa-retweet', 'To Process', 'To Process', 'A', 0, 1, 0, 'V2', 'INBOX_TO_PROCESS', 0, '1014,1042', 'System', '2021-11-02 11:07:25', null, null, null, null);
INSERT INTO umm_menu (id, name, display_text, menu_style, url, tab, type, super_type, super_type_2, department, menu_order, display_icon, short_name, detail_text, status, portal_menu, individual_tenant_menu, vendor_community_menu, version, auth_code, slim_menu, hierachy, created_by, created_on, update_by, update_on, delete_by, delete_on) VALUES (1044, 'Processed', 'Processed', 'fa fa-cogs', '/home/inbox', '1', 'S', 1042, null, 'Admin', 2, 'fa fa-cogs', 'Processed', 'Processed', 'A', 0, 1, 0, 'V2', 'INBOX_PROCESSED', 0, '1014,1042', 'System', '2021-11-02 11:49:08', null, null, null, null);
INSERT INTO umm_menu (id, name, display_text, menu_style, url, tab, type, super_type, super_type_2, department, menu_order, display_icon, short_name, detail_text, status, portal_menu, individual_tenant_menu, vendor_community_menu, version, auth_code, slim_menu, hierachy, created_by, created_on, update_by, update_on, delete_by, delete_on) VALUES (1045, 'Deleted', 'Deleted', 'fa fa-trash', '/home/inbox', '2', 'S', 1042, null, 'Admin', 3, 'fa fa-trash', 'Deleted', 'Deleted', 'A', 0, 1, 0, 'V2', 'INBOX_DELETED', 0, '1014,1042', 'System', '2021-11-02 11:52:12', null, null, null, null);
INSERT INTO umm_menu (id, name, display_text, menu_style, url, tab, type, super_type, super_type_2, department, menu_order, display_icon, short_name, detail_text, status, portal_menu, individual_tenant_menu, vendor_community_menu, version, auth_code, slim_menu, hierachy, created_by, created_on, update_by, update_on, delete_by, delete_on) VALUES (1046, 'Email', 'Email', 'fa fa-inbox', '/home/inbox', DEFAULT, 'S', 1042, null, 'Admin', 4, 'fa fa-inbox', 'Email', 'Email', 'A', 0, 1, 0, 'V2', 'INBOX_EMAIL', 0, '1014,1042', 'System', '2021-11-05 10:54:53', null, null, null, null);
INSERT INTO umm_menu (id, name, display_text, menu_style, url, tab, type, super_type, super_type_2, department, menu_order, display_icon, short_name, detail_text, status, portal_menu, individual_tenant_menu, vendor_community_menu, version, auth_code, slim_menu, hierachy, created_by, created_on, update_by, update_on, delete_by, delete_on) VALUES (1047, 'Review', 'Review', 'fa fa-check-square-o', '/home/inbox', '', 'S', 1042, null, 'Admin', 4, 'fa fa-check-square-o', 'Review', 'Review', 'A', 0, 1, 0, 'V2', 'INBOX_REVIEW', 0, '1014,1042', 'System', '2021-11-05 10:54:53', null, null, null, null);

INSERT INTO umm_privilages (id, url, text, auth_code, created_by, created_on, update_by, update_on, delete_by, delete_on) VALUES (108, 'Attach To', 'Attach To', 'ATTACH_TO', 'System', '2021-11-02 12:31:35', null, null, null, null);
INSERT INTO umm_privilages (id, url, text, auth_code, created_by, created_on, update_by, update_on, delete_by, delete_on) VALUES (109, 'Review', 'Review', 'REVIEW', 'System', '2021-11-02 12:38:35', null, null, null, null);
INSERT INTO umm_privilages (id, url, text, auth_code, created_by, created_on, update_by, update_on, delete_by, delete_on) VALUES (110, 'Move To ''To Process''', 'Move To ''To Process''', 'MOVE_TO_TO_PROCESS', 'System', '2021-11-02 12:44:51', null, null, null, null);
INSERT INTO umm_privilages (id, url, text, auth_code, created_by, created_on, update_by, update_on, delete_by, delete_on) VALUES (111, 'Recover', 'Recover', 'RECOVER', 'System', '2021-11-02 12:52:32', null, null, null, null);
INSERT INTO umm_privilages (id, url, text, auth_code, created_by, created_on, update_by, update_on, delete_by, delete_on) VALUES (112, 'Segregate', 'Segregate', 'SEGREGATE', 'System', '2021-11-17 11:45:39', null, null, null, null);
INSERT INTO umm_privilages (id, url, text, auth_code, created_by, created_on, update_by, update_on, delete_by, delete_on) VALUES (113, 'Submit and Continue', 'Submit and Continue', 'SUBMIT_AND_CONTINUE', 'System', '2021-11-17 11:45:39', null, null, null, null);
INSERT INTO umm_privilages (id, url, text, auth_code, created_by, created_on, update_by, update_on, delete_by, delete_on) VALUES (114, 'Save and Continue', 'Save and Continue', 'SAVE_AND_CONTINUE', 'System', '2021-11-17 11:45:39', null, null, null, null);

INSERT INTO umm_menu_privilage (id, menu_id, privilage_id, auth_code, created_by, created_on, update_by, update_on, delete_by, delete_on) VALUES (444, 1046, 2, 'INBOX_SEARCH', 'System', '2021-11-02 11:11:41', null, null, null, null);
INSERT INTO umm_menu_privilage (id, menu_id, privilage_id, auth_code, created_by, created_on, update_by, update_on, delete_by, delete_on) VALUES (445, 1043, 5, 'INBOX_TO_PROCESS_LIST_DELETE', 'System', '2021-11-02 12:27:24', null, null, null, null);
INSERT INTO umm_menu_privilage (id, menu_id, privilage_id, auth_code, created_by, created_on, update_by, update_on, delete_by, delete_on) VALUES (446, 1043, 108, 'INBOX_TO_PROCESS_LIST_ATTACH_TO', 'System', '2021-11-02 12:35:24', null, null, null, null);
INSERT INTO umm_menu_privilage (id, menu_id, privilage_id, auth_code, created_by, created_on, update_by, update_on, delete_by, delete_on) VALUES (447, 1043, 109, 'INBOX_TO_PROCESS_LIST_REVIEW', 'System', '2021-11-02 12:40:07', null, null, null, null);
INSERT INTO umm_menu_privilage (id, menu_id, privilage_id, auth_code, created_by, created_on, update_by, update_on, delete_by, delete_on) VALUES (448, 1044, 110, 'INBOX_PROCESSED_LIST_MOVE_TO_TO_PROCESS', 'System', '2021-11-02 12:47:42', null, null, null, null);
INSERT INTO umm_menu_privilage (id, menu_id, privilage_id, auth_code, created_by, created_on, update_by, update_on, delete_by, delete_on) VALUES (449, 1045, 5, 'INBOX_DELETED_LIST_DELETE', 'System', '2021-11-02 12:50:32', null, null, null, null);
INSERT INTO umm_menu_privilage (id, menu_id, privilage_id, auth_code, created_by, created_on, update_by, update_on, delete_by, delete_on) VALUES (450, 1045, 111, 'INBOX_DELETED_LIST_RECOVER', 'System', '2021-11-02 12:53:41', null, null, null, null);
INSERT INTO umm_menu_privilage (id, menu_id, privilage_id, auth_code, created_by, created_on, update_by, update_on, delete_by, delete_on) VALUES (451, 1046, 4, 'INBOX_EMAIL_EDIT', 'System', '2021-11-02 12:53:41', null, null, null, null);
INSERT INTO umm_menu_privilage (id, menu_id, privilage_id, auth_code, created_by, created_on, update_by, update_on, delete_by, delete_on) VALUES (452, 1047, 77, 'INBOX_SAVE_AS_APPROVED', 'System', '2021-11-17 12:10:56', null, null, null, null);
INSERT INTO umm_menu_privilage (id, menu_id, privilage_id, auth_code, created_by, created_on, update_by, update_on, delete_by, delete_on) VALUES (453, 1047, 11, 'INBOX_SUBMIT', 'System', '2021-11-17 12:10:56', null, null, null, null);
INSERT INTO umm_menu_privilage (id, menu_id, privilage_id, auth_code, created_by, created_on, update_by, update_on, delete_by, delete_on) VALUES (454, 1047, 114, 'INBOX_SAVE_AND_CONTINUE', 'System', '2021-11-17 12:10:56', null, null, null, null);
INSERT INTO umm_menu_privilage (id, menu_id, privilage_id, auth_code, created_by, created_on, update_by, update_on, delete_by, delete_on) VALUES (455, 1047, 113, 'INBOX_SUBMIT_AND_CONTINUE', 'System', '2021-11-17 12:10:56', null, null, null, null);
INSERT INTO umm_menu_privilage (id, menu_id, privilage_id, auth_code, created_by, created_on, update_by, update_on, delete_by, delete_on) VALUES (456, 1047, 112, 'INBOX_SEGREGATE', 'System', '2021-11-17 12:10:56', null, null, null, null);

INSERT INTO umm_role_previlege (role_id, privilege_id, sub_account_id, created_by, created_on, update_by, update_on, delete_by, delete_on) VALUES (1, 1042, null, 'System', '2021-11-02 13:59:02', null, null, null, null);
INSERT INTO umm_role_previlege (role_id, privilege_id, sub_account_id, created_by, created_on, update_by, update_on, delete_by, delete_on) VALUES (1, 1043, null, 'System', '2021-11-02 13:59:02', null, null, null, null);
INSERT INTO umm_role_previlege (role_id, privilege_id, sub_account_id, created_by, created_on, update_by, update_on, delete_by, delete_on) VALUES (1, 1044, null, 'System', '2021-11-02 13:59:02', null, null, null, null);
INSERT INTO umm_role_previlege (role_id, privilege_id, sub_account_id, created_by, created_on, update_by, update_on, delete_by, delete_on) VALUES (1, 1045, null, 'System', '2021-11-02 13:59:02', null, null, null, null);
INSERT INTO umm_role_previlege (role_id, privilege_id, sub_account_id, created_by, created_on, update_by, update_on, delete_by, delete_on) VALUES (1, 1046, null, 'System', '2021-11-02 13:59:02', null, null, null, null);
INSERT INTO umm_role_previlege (role_id, privilege_id, sub_account_id, created_by, created_on, update_by, update_on, delete_by, delete_on) VALUES (1, 1047, null, 'System', '2021-11-02 13:59:02', null, null, null, null);
INSERT INTO umm_role_previlege (role_id, privilege_id, sub_account_id, created_by, created_on, update_by, update_on, delete_by, delete_on) VALUES (1, 444, null, 'System', '2021-11-02 13:59:02', null, null, null, null);
INSERT INTO umm_role_previlege (role_id, privilege_id, sub_account_id, created_by, created_on, update_by, update_on, delete_by, delete_on) VALUES (1, 445, null, 'System', '2021-11-02 13:59:02', null, null, null, null);
INSERT INTO umm_role_previlege (role_id, privilege_id, sub_account_id, created_by, created_on, update_by, update_on, delete_by, delete_on) VALUES (1, 446, null, 'System', '2021-11-02 13:59:02', null, null, null, null);
INSERT INTO umm_role_previlege (role_id, privilege_id, sub_account_id, created_by, created_on, update_by, update_on, delete_by, delete_on) VALUES (1, 447, null, 'System', '2021-11-02 13:59:02', null, null, null, null);
INSERT INTO umm_role_previlege (role_id, privilege_id, sub_account_id, created_by, created_on, update_by, update_on, delete_by, delete_on) VALUES (1, 448, null, 'System', '2021-11-02 13:59:02', null, null, null, null);
INSERT INTO umm_role_previlege (role_id, privilege_id, sub_account_id, created_by, created_on, update_by, update_on, delete_by, delete_on) VALUES (1, 449, null, 'System', '2021-11-02 13:59:02', null, null, null, null);
INSERT INTO umm_role_previlege (role_id, privilege_id, sub_account_id, created_by, created_on, update_by, update_on, delete_by, delete_on) VALUES (1, 450, null, 'System', '2021-11-02 13:59:02', null, null, null, null);
INSERT INTO umm_role_previlege (role_id, privilege_id, sub_account_id, created_by, created_on, update_by, update_on, delete_by, delete_on) VALUES (1, 451, null, 'System', '2021-11-02 13:59:02', null, null, null, null);
INSERT INTO umm_role_previlege (role_id, privilege_id, sub_account_id, created_by, created_on, update_by, update_on, delete_by, delete_on) VALUES (1, 452, null, 'System', '2021-11-02 13:59:02', null, null, null, null);
INSERT INTO umm_role_previlege (role_id, privilege_id, sub_account_id, created_by, created_on, update_by, update_on, delete_by, delete_on) VALUES (1, 453, null, 'System', '2021-11-02 13:59:02', null, null, null, null);
INSERT INTO umm_role_previlege (role_id, privilege_id, sub_account_id, created_by, created_on, update_by, update_on, delete_by, delete_on) VALUES (1, 454, null, 'System', '2021-11-02 13:59:02', null, null, null, null);
INSERT INTO umm_role_previlege (role_id, privilege_id, sub_account_id, created_by, created_on, update_by, update_on, delete_by, delete_on) VALUES (1, 455, null, 'System', '2021-11-02 13:59:02', null, null, null, null);
INSERT INTO umm_role_previlege (role_id, privilege_id, sub_account_id, created_by, created_on, update_by, update_on, delete_by, delete_on) VALUES (1, 456, null, 'System', '2021-11-02 13:59:02', null, null, null, null);

DROP TABLE IF EXISTS common_inbox_attachment;

create table common_inbox_attachment
(
    id             int auto_increment
        primary key,
    attachment_url varchar(255) null,
    file_name      varchar(50)  null,
    file_type      varchar(50)  null,
    status         char         null,
	segregated_status         char         null,
    email_id       int          not null,
    bill_id        int          null,
	created_by varchar(100) null,
    created_on datetime     null,
    update_by varchar(100) null,
    update_on datetime     null,
    delete_by varchar(100) null,
    delete_on datetime     null,
    constraint common_inbox_attachment_common_inbox_email_id_fk
        foreign key (email_id) references common_inbox_email (id),
    constraint common_inbox_email_vp_bill_id_fk
        foreign key (bill_id) references vp_bill (id)
);





