DELETE FROM `payment_type_for_provider` WHERE payment_provider =4; 
DELETE FROM `payment_type_for_provider` WHERE payment_provider =10; 
DELETE FROM `payment_provider`WHERE id = 4;
UPDATE `payment_provider` SET `id` = 4 WHERE `id` = 10;




