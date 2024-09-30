---------Hashila-------2.3.92-----------

UPDATE common_drop_down_value t SET t.label = 'Failed' WHERE t.id = 42;

UPDATE umm_privilages t SET t.url = 'Send to Process Bill', t.text = 'Send to Process Bill' WHERE t.url = 'Review';

alter table common_inbox_attachment modify file_name varchar(500) null;