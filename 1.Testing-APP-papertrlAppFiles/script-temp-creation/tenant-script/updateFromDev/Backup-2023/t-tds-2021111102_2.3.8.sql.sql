
create table vp_bill_template_email
(
    id         int auto_increment,
    template   int          not null,
    email      varchar(150) null,
    created_by varchar(100) null,
    created_on datetime     null,
    update_by varchar(100) null,
    update_on datetime     null,
    delete_by varchar(100) null,
    delete_on datetime     null,
    constraint vp_bill_template_email_pk
        unique (id),
    constraint vp_bill_template_email_vp_bill_template_mst_id_fk
        foreign key (template) references vp_bill_template_mst (id)
);

DROP TABLE IF EXISTS common_inbox_attachment;
DROP TABLE IF EXISTS common_inbox_email;

create table common_inbox_email
(
    id                 int auto_increment
        primary key,
    email_address      varchar(150) null,
    email_user_name    varchar(100) null,
    status             char         null,
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
