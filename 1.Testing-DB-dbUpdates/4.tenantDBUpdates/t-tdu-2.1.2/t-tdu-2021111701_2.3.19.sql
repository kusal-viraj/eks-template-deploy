---------Dhanuddara----2.3.19------

ALTER TABLE `common_integration_id_connection` 
ADD COLUMN `status` varchar(1) NOT NULL AFTER `tp_company_id`;


UPDATE `common_integration_id_connection` SET `status` = 'A';