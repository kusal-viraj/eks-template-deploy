----Danuddara--0.0.9---


ALTER TABLE `tenant_wise_transaction` 
ADD COLUMN `payment_type` int NOT NULL AFTER `created_on`;