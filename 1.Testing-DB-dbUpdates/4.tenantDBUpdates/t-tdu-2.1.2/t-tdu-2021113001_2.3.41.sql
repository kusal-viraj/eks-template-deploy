--------Hashila---------2.3.41----------

create table common_inbox_attachment_history
(
	id int auto_increment,
	attachment_id int not null,
	document_type_id int not null,
	document_id int not null,
	attachment_url varchar(200) not null,
	file_name varchar(200) not null,
	file_type varchar(30) not null,
	status char not null,
	constraint common_inbox_attachment_history_pk
		primary key (id),
	constraint common_inbox_attachment_history_common_inbox_attachment_id_fk
		foreign key (attachment_id) references common_inbox_attachment (id)
);