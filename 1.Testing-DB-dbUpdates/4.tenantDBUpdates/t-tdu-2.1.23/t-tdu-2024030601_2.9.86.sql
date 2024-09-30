----Loshitha---2.9.86---

ALTER TABLE vp_payment_bank_account
ADD COLUMN next_export_time DATETIME,
ADD COLUMN next_file_id VARCHAR(255),
ADD COLUMN export_file_path VARCHAR(255);
