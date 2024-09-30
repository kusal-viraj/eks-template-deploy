---sithum 2.9.78---


ALTER TABLE payment_type
	ADD COLUMN is_credit VARCHAR(50) NULL DEFAULT NULL AFTER delete_on;

UPDATE payment_type
SET is_credit = CASE 
                WHEN id = 1 THEN '0'
                WHEN id = 2 THEN '0'
                WHEN id = 3 THEN '1'
                WHEN id = 4 THEN '1'
                ELSE '1' 
             END;