alter table common_inbox_attachment modify file_type varchar(500) null;

alter table vp_expense_attachment modify file_type varchar(500) null;

alter table vp_po_receipt_attachment modify file_type varchar(500) null;

alter table vp_po_attachment modify file_type varchar(500) null;

alter table vp_vendor_w9_attachment modify file_type varchar(500) not null;

alter table vp_vendor_classification_attachment modify file_type varchar(500) not null;
