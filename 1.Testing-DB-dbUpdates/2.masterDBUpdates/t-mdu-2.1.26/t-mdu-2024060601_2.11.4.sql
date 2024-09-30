-------------------------Damith 2.11.4-------------------------------------

ALTER TABLE common_bank_mst
ADD COLUMN support_positive_pay TINYINT(1) DEFAULT 0;

UPDATE common_bank_mst SET support_positive_pay='1' WHERE (id='36');

UPDATE common_bank_mst SET support_positive_pay='1' WHERE (id='37');