----------Hashila------2.3.25------------

DELETE FROM umm_privilages WHERE id in (113,114);
DELETE FROM umm_role_previlege WHERE privilege_id in (1042,1043,1044,1045,1046,1047);
DELETE FROM umm_menu_privilage WHERE id in (444,445,446,447,448,449,450,451,452,453,454,455,456);
DELETE FROM umm_menu WHERE id in (1043,1044,1045,1046,1047);

INSERT INTO umm_privilages (id, url, text, auth_code, created_by, created_on, update_by, update_on, delete_by, delete_on) VALUES (113, 'Edit Email', 'Edit Email', 'EDIT_EMAIL', 'System', '2021-11-17 11:45:39', null, null, null, null);

INSERT INTO umm_menu_privilage (id, menu_id, privilage_id, auth_code, created_by, created_on, update_by, update_on, delete_by, delete_on) VALUES (444, 1042, 2, 'INBOX_SEARCH', 'System', '2021-11-02 11:11:41', null, null, null, null);
INSERT INTO umm_menu_privilage (id, menu_id, privilage_id, auth_code, created_by, created_on, update_by, update_on, delete_by, delete_on) VALUES (445, 1042, 5, 'INBOX_DELETE', 'System', '2021-11-02 12:27:24', null, null, null, null);
INSERT INTO umm_menu_privilage (id, menu_id, privilage_id, auth_code, created_by, created_on, update_by, update_on, delete_by, delete_on) VALUES (446, 1042, 108, 'INBOX_ATTACH_TO', 'System', '2021-11-02 12:35:24', null, null, null, null);
INSERT INTO umm_menu_privilage (id, menu_id, privilage_id, auth_code, created_by, created_on, update_by, update_on, delete_by, delete_on) VALUES (447, 1042, 109, 'INBOX_REVIEW', 'System', '2021-11-02 12:40:07', null, null, null, null);
INSERT INTO umm_menu_privilage (id, menu_id, privilage_id, auth_code, created_by, created_on, update_by, update_on, delete_by, delete_on) VALUES (448, 1042, 110, 'INBOX_MOVE_TO_TO_PROCESS', 'System', '2021-11-02 12:47:42', null, null, null, null);
INSERT INTO umm_menu_privilage (id, menu_id, privilage_id, auth_code, created_by, created_on, update_by, update_on, delete_by, delete_on) VALUES (449, 1042, 111, 'INBOX_RECOVER', 'System', '2021-11-02 12:53:41', null, null, null, null);
INSERT INTO umm_menu_privilage (id, menu_id, privilage_id, auth_code, created_by, created_on, update_by, update_on, delete_by, delete_on) VALUES (450, 1042, 113, 'INBOX_EMAIL_EDIT', 'System', '2021-11-02 12:53:41', null, null, null, null);
INSERT INTO umm_menu_privilage (id, menu_id, privilage_id, auth_code, created_by, created_on, update_by, update_on, delete_by, delete_on) VALUES (451, 1042, 112, 'INBOX_SEGREGATE', 'System', '2021-11-17 12:10:56', null, null, null, null);

DROP TABLE IF EXISTS common_inbox_attachment;
DROP TABLE IF EXISTS common_inbox_email;

create table common_inbox_email
(
    id                 int auto_increment
        primary key,
    email_address      varchar(150) null,
    email_user_name    varchar(100) null,
    status             char         null,
    processed_status             char         null,
    is_read            tinyint(1)   null,
    received_date_time datetime     null,
    vendor             int          null,
    subject         varchar(250) null,
    email_body         text         null,
    mail_server_id     int          null,
	created_by varchar(100) null,
    created_on datetime     null,
    update_by varchar(100) null,
    update_on datetime     null,
    delete_by varchar(100) null,
    delete_on datetime     null
);

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