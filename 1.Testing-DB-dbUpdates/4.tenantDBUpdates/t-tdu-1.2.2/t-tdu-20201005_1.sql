ALTER TABLE `common_chart_of_account`
ADD COLUMN `sub_level` int(11) NULL AFTER `updated_date`;

ALTER TABLE `common_product_mst`
ADD COLUMN `parent_id` int(11) NULL AFTER `product_category_id`,
ADD COLUMN `sub_level` int(5) NULL AFTER `parent_id`;

ALTER TABLE `common_product_mst`
CHANGE COLUMN `amount` `buying_price` DECIMAL(19,2) NOT NULL
AFTER `taxable`, ADD COLUMN `sales_price` DECIMAL(19,2) NULL DEFAULT NULL AFTER
`buying_price`, CHANGE COLUMN `description` `purchase_description` VARCHAR(255)
NULL DEFAULT NULL COLLATE 'latin1_swedish_ci' AFTER `status`,
ADD COLUMN `sales_description` DECIMAL(19,2) NULL DEFAULT NULL
AFTER `purchase_description`,
ADD COLUMN `partner_service` TINYINT NULL DEFAULT NULL AFTER `vendor_id`;

ALTER TABLE `common_product_mst` CHANGE COLUMN `sales_description` `sales_description` VARCHAR(255) NULL DEFAULT NULL AFTER `purchase_description`,
CHANGE COLUMN `income_account` `income_account` INT NULL DEFAULT
NULL COLLATE 'latin1_swedish_ci' AFTER `sales_description`,
CHANGE COLUMN `expense_account` `expense_account` INT NULL
DEFAULT NULL COLLATE 'latin1_swedish_ci' AFTER `income_account`;

ALTER TABLE `common_product_mst`
CHANGE COLUMN `partner_service` `partner_service` TINYINT(1) NULL
DEFAULT NULL AFTER `sku`;

INSERT INTO `umm_menu_privilage` (`menu_id`, `prililage_id`, `data_created`, `user_inserted`) VALUES ('52', '3', '2020-10-04 22:46:57', 'System');

ALTER TABLE `common_account_type`
ADD COLUMN `short_name_no_space` VARCHAR(200) NOT NULL AFTER `short_name`;

UPDATE `common_account_type` SET
`short_name_no_space`='AccountsReceivable' WHERE `id`=1;
UPDATE `common_account_type` SET
`short_name_no_space`='OtherCurrentAsset' WHERE `id`=2;
UPDATE `common_account_type` SET
`short_name_no_space`='Bank' WHERE `id`=3;
UPDATE `common_account_type` SET
`short_name_no_space`='FixedAsset' WHERE `id`=4;
UPDATE `common_account_type` SET
`short_name_no_space`='OtherAsset' WHERE `id`=5;
UPDATE `common_account_type` SET
`short_name_no_space`='AccountsPayable' WHERE `id`=6;
UPDATE `common_account_type` SET
`short_name_no_space`='CreditCard' WHERE `id`=7;
UPDATE `common_account_type` SET
`short_name_no_space`='OtherCurrentLiability' WHERE `id`=8;
UPDATE `common_account_type` SET
`short_name_no_space`='LongTermLiability' WHERE `id`=9;
UPDATE `common_account_type` SET
`short_name_no_space`='Equity' WHERE `id`=10;
UPDATE `common_account_type` SET
`short_name_no_space`='Income' WHERE `id`=11;
UPDATE `common_account_type` SET
`short_name_no_space`='OtherIncome' WHERE `id`=12;
UPDATE `common_account_type` SET
`short_name_no_space`='CostOfGoodsSold' WHERE `id`=13;
UPDATE `common_account_type` SET
`short_name_no_space`='Expense' WHERE `id`=14;
UPDATE `common_account_type` SET
`short_name_no_space`='OtherExpense' WHERE `id`=15;

INSERT INTO `common_account_type` VALUES ('16', 'Non Posting', 'Non Posting', 'NonPosting');

DROP TABLE IF EXISTS `common_integration_failed_record`;
CREATE TABLE `common_integration_failed_record` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`tp_id` varchar(100) NOT NULL,
`system_short_code` varchar(30) NOT NULL,
`object_type` varchar(100) NOT NULL,
`failed_date_time` datetime NOT NULL,
PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

INSERT INTO `common_integration_failed_record` VALUES ('1', '80000008-1601829899', 'QBD', 'NON_INVENTORY_ITEM_OBJECT', '2020-10-04 19:03:43');
INSERT INTO `common_integration_failed_record` VALUES ('2', '8000000E1601879902', 'QBD', 'SERVICE_ITEM_OBJECT', '2020-10-05 06:53:57');

DROP TABLE IF EXISTS `common_integration_id_connection`;
CREATE TABLE `common_integration_id_connection` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`papertrl_id` int(11) NOT NULL,
`tp_id` varchar(100) NOT NULL,
`papertrl_parent_id` int(11) DEFAULT NULL,
`tp_parent_id` varchar(100) DEFAULT NULL,
`system_short_code` varchar(30) NOT NULL,
`object_type` varchar(100) NOT NULL,
`edit_sequence` varchar(200) DEFAULT NULL,
PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=386 DEFAULT CHARSET=utf8;

INSERT INTO `common_integration_id_connection` VALUES ('286', '387', 
'8000002A-1601555564', null, null, 'QBD', 'Account', '1601555564');
INSERT INTO `common_integration_id_connection` VALUES ('287', '388',
'80000024-1601283866', null, null, 'QBD', 'Account', '1601283866');
INSERT INTO `common_integration_id_connection` VALUES ('288', '389',
'80000029-1601490452', null, null, 'QBD', 'Account', '1601490452');
INSERT INTO `common_integration_id_connection` VALUES ('289', '390',
'80000026-1601384157', null, null, 'QBD', 'Account', '1601384157');
INSERT INTO `common_integration_id_connection` VALUES ('290', '391',
'80000025-1601283867', null, null, 'QBD', 'Account', '1601283867');
INSERT INTO `common_integration_id_connection` VALUES ('291', '392',
'80000005-1601057580', null, null, 'QBD', 'Account', '1601057580');
INSERT INTO `common_integration_id_connection` VALUES ('292', '393',
'80000004-1601057580', null, null, 'QBD', 'Account', '1601057580');
INSERT INTO `common_integration_id_connection` VALUES ('293', '394',
'80000023-1601283865', null, null, 'QBD', 'Account', '1601283865');
INSERT INTO `common_integration_id_connection` VALUES ('294', '395',
'80000022-1601057581', null, null, 'QBD', 'Account', '1601057581');
INSERT INTO `common_integration_id_connection` VALUES ('295', '396',
'80000003-1601057580', null, null, 'QBD', 'Account', '1601057580');
INSERT INTO `common_integration_id_connection` VALUES ('296', '397',
'80000020-1601057580', null, null, 'QBD', 'Account', '1601057580');
INSERT INTO `common_integration_id_connection` VALUES ('297', '398',
'80000006-1601057580', null, null, 'QBD', 'Account', '1601057580');
INSERT INTO `common_integration_id_connection` VALUES ('298', '399',
'80000007-1601057580', null, null, 'QBD', 'Account', '1601057580');
INSERT INTO `common_integration_id_connection` VALUES ('299', '400',
'80000008-1601057580', null, null, 'QBD', 'Account', '1601057580');
INSERT INTO `common_integration_id_connection` VALUES ('300', '401',
'80000009-1601057580', null, null, 'QBD', 'Account', '1601057580');
INSERT INTO `common_integration_id_connection` VALUES ('301', '402',
'8000000A-1601057580', null, null, 'QBD', 'Account', '1601057580');
INSERT INTO `common_integration_id_connection` VALUES ('302', '403',
'80000027-1601384157', null, null, 'QBD', 'Account', '1601384157');
INSERT INTO `common_integration_id_connection` VALUES ('303', '404',
'8000000B-1601057580', null, null, 'QBD', 'Account', '1601057580');
INSERT INTO `common_integration_id_connection` VALUES ('304', '405',
'8000000C-1601057580', null, null, 'QBD', 'Account', '1601057580');
INSERT INTO `common_integration_id_connection` VALUES ('305', '406',
'8000000D-1601057580', null, null, 'QBD', 'Account', '1601057580');
INSERT INTO `common_integration_id_connection` VALUES ('306', '407',
'8000000E-1601057580', null, null, 'QBD', 'Account', '1601057580');
INSERT INTO `common_integration_id_connection` VALUES ('307', '408',
'8000000F-1601057580', null, null, 'QBD', 'Account', '1601057580');
INSERT INTO `common_integration_id_connection` VALUES ('308', '409',
'80000010-1601057580', null, null, 'QBD', 'Account', '1601057580');
INSERT INTO `common_integration_id_connection` VALUES ('309', '410',
'80000011-1601057580', null, null, 'QBD', 'Account', '1601057580');
INSERT INTO `common_integration_id_connection` VALUES ('310', '411',
'80000012-1601057580', null, null, 'QBD', 'Account', '1601057580');
INSERT INTO `common_integration_id_connection` VALUES ('311', '412',
'80000013-1601057580', null, null, 'QBD', 'Account', '1601057580');
INSERT INTO `common_integration_id_connection` VALUES ('312', '413',
'80000014-1601057580', null, null, 'QBD', 'Account', '1601057580');
INSERT INTO `common_integration_id_connection` VALUES ('313', '414',
'80000015-1601057580', null, null, 'QBD', 'Account', '1601057580');
INSERT INTO `common_integration_id_connection` VALUES ('314', '415',
'80000016-1601057580', null, null, 'QBD', 'Account', '1601057580');
INSERT INTO `common_integration_id_connection` VALUES ('315', '416',
'80000017-1601057580', null, null, 'QBD', 'Account', '1601057580');
INSERT INTO `common_integration_id_connection` VALUES ('316', '417',
'80000018-1601057580', null, null, 'QBD', 'Account', '1601057580');
INSERT INTO `common_integration_id_connection` VALUES ('317', '418',
'80000019-1601057580', null, null, 'QBD', 'Account', '1601057580');
INSERT INTO `common_integration_id_connection` VALUES ('318', '419',
'80000021-1601057581', null, null, 'QBD', 'Account', '1601057581');
INSERT INTO `common_integration_id_connection` VALUES ('319', '420',
'8000001A-1601057580', null, null, 'QBD', 'Account', '1601057580');
INSERT INTO `common_integration_id_connection` VALUES ('320', '421',
'8000001B-1601057580', null, null, 'QBD', 'Account', '1601057580');
INSERT INTO `common_integration_id_connection` VALUES ('321', '422',
'8000001C-1601057580', null, null, 'QBD', 'Account', '1601057580');
INSERT INTO `common_integration_id_connection` VALUES ('322', '423',
'8000001D-1601057580', null, null, 'QBD', 'Account', '1601057580');
INSERT INTO `common_integration_id_connection` VALUES ('323', '424',
'8000001E-1601057580', null, null, 'QBD', 'Account', '1601057580');
INSERT INTO `common_integration_id_connection` VALUES ('324', '425',
'8000001F-1601057580', null, null, 'QBD', 'Account', '1601057580');
INSERT INTO `common_integration_id_connection` VALUES ('325', '426',
'80000028-1601401541', null, null, 'QBD', 'Account', '1601401541');
INSERT INTO `common_integration_id_connection` VALUES ('326', '427',
'8000002B-1601557338', '388', '80000024-1601283866', 'QBD', 'Account',
'1601557338');
INSERT INTO `common_integration_id_connection` VALUES ('327', '27',
'80000006-1601395345', null, null, 'QBD', 'VENDOR_ACCOUNT', '1601395391');
INSERT INTO `common_integration_id_connection` VALUES ('328', '28',
'8000000B-1601795134', null, null, 'QBD', 'VENDOR_ACCOUNT', '1601795134');
INSERT INTO `common_integration_id_connection` VALUES ('329', '29',
'80000007-1601793541', null, null, 'QBD', 'VENDOR_ACCOUNT', '1601793541');
INSERT INTO `common_integration_id_connection` VALUES ('330', '30',
'80000009-1601793652', null, null, 'QBD', 'VENDOR_ACCOUNT', '1601793652');
INSERT INTO `common_integration_id_connection` VALUES ('331', '31',
'80000008-1601793571', null, null, 'QBD', 'VENDOR_ACCOUNT', '1601793571');
INSERT INTO `common_integration_id_connection` VALUES ('332', '32',
'8000000A-1601794099', null, null, 'QBD', 'VENDOR_ACCOUNT', '1601794099');
INSERT INTO `common_integration_id_connection` VALUES ('333', '33',
'8000000D-1601797136', null, null, 'QBD', 'VENDOR_ACCOUNT', '1601797136');
INSERT INTO `common_integration_id_connection` VALUES ('334', '34',
'8000000C-1601796557', null, null, 'QBD', 'VENDOR_ACCOUNT', '1601796557');
INSERT INTO `common_integration_id_connection` VALUES ('341', '6', '80000001-1601057579', null, null, 'QBD', 'TERM_OBJECT', '1601057579');
INSERT INTO `common_integration_id_connection` VALUES ('342', '8', '80000002-1601057579', null, null, 'QBD', 'TERM_OBJECT', '1601057579');
INSERT INTO `common_integration_id_connection` VALUES ('343', '13',
'80000003-1601057579', null, null, 'QBD', 'TERM_OBJECT', '1601057579');
INSERT INTO `common_integration_id_connection` VALUES ('344', '1', '80000004-1601057579', null, null, 'QBD', 'TERM_OBJECT', '1601057579');
INSERT INTO `common_integration_id_connection` VALUES ('345', '3', '80000005-1601057579', null, null, 'QBD', 'TERM_OBJECT', '1601057579');
INSERT INTO `common_integration_id_connection` VALUES ('346', '4', '80000006-1601057579', null, null, 'QBD', 'TERM_OBJECT', '1601057579');
INSERT INTO `common_integration_id_connection` VALUES ('347', '5', '80000007-1601057579', null, null, 'QBD', 'TERM_OBJECT', '1601057579');
INSERT INTO `common_integration_id_connection` VALUES ('368', '42',
'80000001-1601748941', null, null, 'QBD', 'NON_INVENTORY_ITEM_OBJECT',
'1601748941');
INSERT INTO `common_integration_id_connection` VALUES ('369', '43',
'80000003-1601751765', null, null, 'QBD', 'NON_INVENTORY_ITEM_OBJECT',
'1601751765');
INSERT INTO `common_integration_id_connection` VALUES ('370', '44',
'80000004-1601751783', null, null, 'QBD', 'NON_INVENTORY_ITEM_OBJECT',
'1601751783');
INSERT INTO `common_integration_id_connection` VALUES ('371', '45',
'80000005-1601751801', null, null, 'QBD', 'NON_INVENTORY_ITEM_OBJECT',
'1601751801');
INSERT INTO `common_integration_id_connection` VALUES ('372', '46',
'80000008-1601829899', '42', '80000001-1601748941', 'QBD',
'NON_INVENTORY_ITEM_OBJECT', '1601829899');
INSERT INTO `common_integration_id_connection` VALUES ('373', '47',
'80000006-1601752411', '43', '80000003-1601751765', 'QBD',
'NON_INVENTORY_ITEM_OBJECT', '1601752411');
INSERT INTO `common_integration_id_connection` VALUES ('374', '48',
'80000002-1601748972', null, null, 'QBD', 'SERVICE_ITEM_OBJECT',
'1601748972');
INSERT INTO `common_integration_id_connection` VALUES ('375', '49',
'80000009-1601838960', null, null, 'QBD', 'SERVICE_ITEM_OBJECT',
'1601838960');
INSERT INTO `common_integration_id_connection` VALUES ('376', '50',
'8000000B-1601839052', null, null, 'QBD', 'SERVICE_ITEM_OBJECT',
'1601839052');
INSERT INTO `common_integration_id_connection` VALUES ('377', '51',
'80000007-1601791989', '48', '80000002-1601748972', 'QBD',
'SERVICE_ITEM_OBJECT', '1601791989');
INSERT INTO `common_integration_id_connection` VALUES ('378', '52',
'8000000A-1601838990', '49', '80000009-1601838960', 'QBD',
'SERVICE_ITEM_OBJECT', '1601838990');
INSERT INTO `common_integration_id_connection` VALUES ('379', '53',
'8000000C-1601839101', '50', '8000000B-1601839052', 'QBD',
'SERVICE_ITEM_OBJECT', '1601839101');
INSERT INTO `common_integration_id_connection` VALUES ('382', '56',
'8000000D-1601879884', null, null, 'QBD', 'OTHER_ITEM_OBJECT', '1601879884');
INSERT INTO `common_integration_id_connection` VALUES ('383', '57',
'8000000F-1601879940', null, null, 'QBD', 'OTHER_ITEM_OBJECT', '1601879940');
INSERT INTO `common_integration_id_connection` VALUES ('384', '58',
'8000000E-1601879902', '56', '8000000D-1601879884', 'QBD',
'OTHER_ITEM_OBJECT', '1601879902');
INSERT INTO `common_integration_id_connection` VALUES ('385', '59',
'80000010-1601879972', '57', '8000000F-1601879940', 'QBD',
'OTHER_ITEM_OBJECT', '1601879972');

ALTER TABLE `vp_invoice_expense_cost_distribution`
	DROP FOREIGN KEY `FK_vp_vendor_item_cost_distribution_vp_vendor_mst`;
ALTER TABLE `vp_invoice_expense_cost_distribution`
	ADD CONSTRAINT `FK_vp_vendor_item_cost_distribution_vp_vendor_mst` FOREIGN KEY (`invoice_id`) REFERENCES `vp_vendor_invoice` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION;
	
CREATE TABLE `object_sync_mst` (
 `id` int(11) NOT NULL AUTO_INCREMENT,
 `object_mst_id` int(11) NOT NULL,
 `object_type` varchar(50) NOT NULL,
 `system_id` int(11) NOT NULL,
 `system_name` varchar(50) NOT NULL,
 `recode_status` char(1) NOT NULL,
 `sync_date_time` datetime DEFAULT NULL,
 `sync_status` char(1) NOT NULL,
 `attempts` int(2) DEFAULT 0,
 `executed_by` varchar(50) DEFAULT NULL,
 `executed_on` date DEFAULT NULL,
 `insert_by` varchar(50) NOT NULL,
 `insert_on` date NOT NULL,
 PRIMARY KEY (`id`)
);