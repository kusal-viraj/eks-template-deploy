------Dhanuddara----2.2.121--Hotfix---------

ALTER TABLE `tp_integration_company` 
ADD COLUMN `tp_company_display_name` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL AFTER `tp_company_name`;