-------------hashila----2.3.60-------

alter table vp_bill
	add inbox_attachment_id int null;

alter table vp_bill
	add constraint vp_bill_common_inbox_attachment_id_fk
		foreign key (inbox_attachment_id) references common_inbox_attachment (id);
		
		
alter table hst_vp_bill
	add inbox_attachment_id int null;

alter table hst_vp_bill
	add constraint hst_vp_bill_common_inbox_attachment_id_fk
		foreign key (inbox_attachment_id) references common_inbox_attachment (id);