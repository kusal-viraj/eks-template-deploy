---loshitha 2.8.390---


ALTER TABLE papertrl_master_tenant CHANGE COLUMN sftp_host sftp_host VARCHAR(300);

ALTER TABLE papertrl_master_tenant ADD COLUMN sftp_privet_key_path  VARCHAR(300) NULL DEFAULT NULL;

ALTER TABLE papertrl_support_sftp_server ADD COLUMN region VARCHAR(100) NULL DEFAULT NULL;
ALTER TABLE papertrl_support_sftp_server ADD COLUMN server_id VARCHAR(100) NULL DEFAULT NULL AFTER region;
ALTER TABLE papertrl_support_sftp_server ADD COLUMN role_arn VARCHAR(100) NULL DEFAULT NULL AFTER server_id;
ALTER TABLE papertrl_support_sftp_server ADD COLUMN bucket_name VARCHAR(100) NULL DEFAULT NULL AFTER role_arn;
ALTER TABLE papertrl_support_sftp_server ADD COLUMN ssh_key TEXT NULL DEFAULT NULL AFTER bucket_name;
ALTER TABLE papertrl_support_sftp_server ADD COLUMN server_endpoint VARCHAR(200) NULL DEFAULT NULL AFTER ssh_key;


ALTER TABLE papertrl_support_sftp_server
	CHANGE COLUMN server_ip server_ip VARCHAR(50) NULL,
	CHANGE COLUMN max_connection max_connection INT(11) NULL,
	CHANGE COLUMN used_connection used_connection INT(11) NULL,
	CHANGE COLUMN server_port server_port INT(11) NULL,
	CHANGE COLUMN sudo_user sudo_user VARCHAR(50) NULL,
	CHANGE COLUMN sudo_user_password sudo_user_password VARCHAR(100) NULL,
	CHANGE COLUMN status status CHAR(2) NULL,
	CHANGE COLUMN created_by created_by VARCHAR(100) NULL,
	CHANGE COLUMN created_on created_on DATETIME NULL,
	CHANGE COLUMN update_by update_by VARCHAR(100) NULL,
	CHANGE COLUMN update_on update_on DATETIME NULL,
	CHANGE COLUMN delete_by delete_by VARCHAR(100) NULL,
	CHANGE COLUMN delete_on delete_on DATETIME NULL;


INSERT INTO papertrl_support_sftp_server (id, server_ip, server_host, max_connection, used_connection, server_port, sudo_user, sudo_user_password, status, region, server_id, role_arn, bucket_name, ssh_key, server_endpoint, created_by, created_on, update_by, update_on, delete_by, delete_on) VALUES (2, '', 'papertrl-testing-s3-appfiles', 200, 17, 22, NULL, NULL, 'A', 'us-east-2', 's-90e6d208a5d14af38', 'arn:aws:iam::239143988552:role/CustomPapertrlSFTPS3TFRole', 'papertrl-testing-s3-appfiles', 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDngi97WHDvpgFW13zp6YIuH1lZcu1sVNWl/30Pjam3BLKvavPXJwk/Ou2v0ljWONxpYAn6IHazGPZc4jDhi3mwrnyO2q/YRxsmqq6yKO3daRJnk8CGKzTb5ieqgOH/k7tjbrGoa1kT+2DXGnob6XdEm3pjP24roU66+4DSofoB7RTwdm/0UU4XL9jIBfcRde1c/a3z2gMhDvCFZUTmMhXDhX4shQUs0+Q6RkhAHcQ+nCmQlYSFgGZsmyz4uRelGVstdSyRoG29B0Wu6yFdXEbHMj8CCvqFV5/ew0CoZVwelCogjn4EG6FuGGHzLcAllb5Ra2bYEnwrviKdzAsd4ASP', '10.20.21.175', NULL, NULL, NULL, NULL, NULL, NULL);




















