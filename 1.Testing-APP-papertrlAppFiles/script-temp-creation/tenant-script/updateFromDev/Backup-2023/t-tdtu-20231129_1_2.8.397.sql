DROP TABLE IF EXISTS `common_line_item_grid_reorder_user_wise`;
CREATE TABLE IF NOT EXISTS `common_line_item_grid_reorder_user_wise` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(100) NOT NULL,
  `grid_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1_GRID_ID` (`grid_id`) USING BTREE,
  CONSTRAINT `FK1_GRID_ID` FOREIGN KEY (`grid_id`) REFERENCES `common_grid_template` (`id`)
);


DROP TABLE IF EXISTS `common_line_item_grid_column_order`;
CREATE TABLE IF NOT EXISTS `common_line_item_grid_column_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `line_item_grid_id` int(11) NOT NULL,
  `column_name` varchar(50) NOT NULL,
  `column_order` int(8) NOT NULL,
  `column_width` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1_LINE_ITEM_GRID_ID` (`line_item_grid_id`),
  CONSTRAINT `FK1_LINE_ITEM_GRID_ID` FOREIGN KEY (`line_item_grid_id`) REFERENCES `common_line_item_grid_reorder_user_wise` (`id`)
);


INSERT INTO `common_grid_template` (`grid_name`) VALUES ('BILL_EXPENSE_COST_LINE_ITEM_LIST');
INSERT INTO `common_grid_template` (`grid_name`) VALUES ('BILL_ITEM_COST_LINE_ITEM_LIST');
INSERT INTO `common_grid_template` (`grid_name`) VALUES ('RECURRING_BILL_EXPENSE_COST_LINE_ITEM_LIST');
INSERT INTO `common_grid_template` (`grid_name`) VALUES ('RECURRING_BILL_ITEM_COST_LINE_ITEM_LIST');


DELETE FROM `common_grid_column_user_wice` WHERE `id`<>0;
DELETE FROM `common_grid_state_user_wice` WHERE `id`<>0;

ALTER TABLE `common_grid_state_user_wice`
	ADD COLUMN `table_width` INT(8) NULL DEFAULT NULL AFTER `column_widths`;

UPDATE `common_grid_column_template` SET `is_re_sizable`=1
WHERE `field` IN ('vcard.cardType','vcard.nickName','vcard.cardNumber','vcard.cardOwner','vcard.documentNos','vcard.createdOn','vcard.amount','vcard.redeemedAmount','vcard.balanceAmount','vcard.effectiveUntil','vcard.expireOn');
UPDATE `common_grid_column_user_wice` SET `is_re_sizable`=1
WHERE `field` IN ('vcard.cardType','vcard.nickName','vcard.cardNumber','vcard.cardOwner','vcard.documentNos','vcard.createdOn','vcard.amount','vcard.redeemedAmount','vcard.balanceAmount','vcard.effectiveUntil','vcard.expireOn');

UPDATE `common_grid_column_template` SET `is_re_sizable`=1
WHERE `field` IN ('txn.documentType','txn.txnRef','txn.tpTxnId','txn.documentNo','txn.payeeName','txn.txnAmount','txn.createdOn','txn.status','txn.paymentStatus','txn.isOnline','txn.txnType','txn.txnDate','txn.reason');
UPDATE `common_grid_column_user_wice` SET `is_re_sizable`=1
WHERE `field` IN ('txn.documentType','txn.txnRef','txn.tpTxnId','txn.documentNo','txn.payeeName','txn.txnAmount','txn.createdOn','txn.status','txn.paymentStatus','txn.isOnline','txn.txnType','txn.txnDate','txn.reason');


UPDATE `common_grid_column_template` SET `is_re_sizable`=1
WHERE `field` IN ('code.id','expense.paymentStatus','poc.override');
UPDATE `common_grid_column_user_wice` SET `is_re_sizable`=1
WHERE `field` IN ('code.id','expense.paymentStatus','poc.override');

UPDATE `common_grid_column_template` SET `is_re_sizable`=1
WHERE `field` LIKE 'txn.%' OR `field` LIKE 'vendorItem.%' OR `field` LIKE 'mileage.%' OR `field` LIKE 'txn.%' OR `field` LIKE 'doc.%';
UPDATE `common_grid_column_user_wice` SET `is_re_sizable`=1
WHERE `field` LIKE 'txn.%' OR `field` LIKE 'vendorItem.%' OR `field` LIKE 'mileage.%' OR `field` LIKE 'txn.%' OR `field` LIKE 'doc.%';

UPDATE `common_grid_column_template` SET `is_re_sizable`=1
WHERE `field` IN ('cinvoice.customerName','cinvoice.invoiceAmount','cinvoice.invoiceDate','cinvoice.invoiceNumber');
UPDATE `common_grid_column_user_wice` SET `is_re_sizable`=1
WHERE `field` IN ('cinvoice.customerName','cinvoice.invoiceAmount','cinvoice.invoiceDate','cinvoice.invoiceNumber');

UPDATE `common_grid_column_template` SET `is_re_orderable`=1 WHERE `is_re_sizable` IS TRUE AND `is_frozen` IS FALSE AND `field` NOT LIKE 'appCode.%';
UPDATE `common_grid_column_user_wice` SET `is_re_orderable`=1 WHERE `is_re_sizable` IS TRUE AND `is_frozen` IS FALSE AND `field` NOT LIKE 'appCode.%';

UPDATE `common_grid_column_template` SET `column_order`=1 WHERE `id`=643;
UPDATE `common_grid_column_template` SET `column_order`=2 WHERE `id`=646;
UPDATE `common_grid_column_template` SET `column_order`=3 WHERE `id`=633;
UPDATE `common_grid_column_template` SET `column_order`=4 WHERE `id`=634;
UPDATE `common_grid_column_template` SET `column_order`=5 WHERE `id`=635;
UPDATE `common_grid_column_template` SET `column_order`=6 WHERE `id`=636;
UPDATE `common_grid_column_template` SET `column_order`=7 WHERE `id`=637;
UPDATE `common_grid_column_template` SET `column_order`=8 WHERE `id`=638;
UPDATE `common_grid_column_template` SET `column_order`=9 WHERE `id`=639;
UPDATE `common_grid_column_template` SET `column_order`=10 WHERE `id`=645;
UPDATE `common_grid_column_template` SET `column_order`=11 WHERE `id`=640;
UPDATE `common_grid_column_template` SET `column_order`=12 WHERE `id`=644;
UPDATE `common_grid_column_template` SET `column_order`=13 WHERE `id`=647;
UPDATE `common_grid_column_template` SET `column_order`=14 WHERE `id`=641;

UPDATE `common_grid_state_template` SET `column_widths`='50,250,200,268,246,256,256,50' WHERE `grid_id`=2;
UPDATE `common_grid_state_template` SET `column_widths`='50,100,307,307,307,307,50' WHERE `grid_id`=1;
UPDATE `common_grid_state_template` SET `column_widths`='50,300,306,306,306,307,50' WHERE `grid_id`=3;
UPDATE `common_grid_state_template` SET `column_widths`='220,210,210,210,210,210,240,210,50' WHERE `grid_id`=26;
UPDATE `common_grid_state_template` SET `column_widths`='210,210,210,210,210,210,50' WHERE `grid_id`=28;
UPDATE `common_grid_state_template` SET `column_widths`='210,210,210,210,210,50' WHERE `grid_id`=29;
UPDATE `common_grid_state_template` SET `column_widths`='210,210,210,210,50' WHERE `grid_id`=30;
UPDATE `common_grid_state_template` SET `column_widths`='50,210,220,218,214,218,218,219,219,219,219,219,219,219,219,50' WHERE `grid_id`=13;
UPDATE `common_grid_state_template` SET `column_widths`='50,210,220,218,214,218,218,219,219,219,50' WHERE `grid_id`=16;
UPDATE `common_grid_state_template` SET `column_widths`='50,210,200,200,200,200,200,200,200,200,200,200,200,200,200,250,200,200,200,200,200,200,200,200,200,200,200,50' WHERE `grid_id`=14;
UPDATE `common_grid_state_template` SET `column_widths`='50,210,210,210,210,210,210,50' WHERE `grid_id`=31;
UPDATE `common_grid_state_template` SET `column_widths`='50,210,210,210,210,210,210,210,210,210,50' WHERE `grid_id`=40;
UPDATE `common_grid_state_template` SET `column_widths`='50,210,210,210,300,210,210,210,210,210,210,210,50' WHERE `grid_id`=49;
UPDATE `common_grid_state_template` SET `column_widths`='50,250,232,232,231,231,232,232,232,232,232,232,50' WHERE `grid_id`=62;
UPDATE `common_grid_state_template` SET `column_widths`='50,230,250,250,250,250,250,250,250,50' WHERE `grid_id`=4;
UPDATE `common_grid_state_template` SET `column_widths`='50,200,220,215,215,215,215,215,215,215,215,215,215,215,215,215,215,50' WHERE `grid_id`=15;
UPDATE `common_grid_state_template` SET `column_widths`='50,210,210,210,210,210,210,50' WHERE `grid_id`=51;
UPDATE `common_grid_state_template` SET `column_widths`='210,210,210,210,50' WHERE `grid_id`=50;
UPDATE `common_grid_state_template` SET `column_widths`='50,213,213,213,183,183,213,264,213,213,214,122,214,50' WHERE `grid_id`=54;
UPDATE `common_grid_state_template` SET `column_widths`='50,212,214,183,182,212,212,302,214,213,212,192,213,213,212,213,213,213,213,50' WHERE `grid_id`=55;
UPDATE `common_grid_state_template` SET `column_widths`='50,212,214,183,182,212,212,302,214,213,212,192,213,213,212,213,213,213,50' WHERE `grid_id`=56;
UPDATE `common_grid_state_template` SET `column_widths`='50,290,210,210,210,210,350,210,50' WHERE `grid_id`=53;
UPDATE `common_grid_state_template` SET `column_widths`='210,210,210,210,210,210,210,210,210,210,210,210,50' WHERE `grid_id`=66;
UPDATE `common_grid_state_template` SET `column_widths`='50,200,220,218,214,218,218,219,219,50' WHERE `grid_id`=5;
UPDATE `common_grid_state_template` SET `column_widths`='50,200,200,200,200,200,200,200,200,200,200,200,200,200,200,200,200,200,200,200,50' WHERE `grid_id`=22;
UPDATE `common_grid_state_template` SET `column_widths`='50,210,210,210,210,210,210,210,210,210,210,210,50' WHERE `grid_id`=65;
UPDATE `common_grid_state_template` SET `column_widths`='50,210,210,210,210,210,210,210,210,210,210,210,210,50' WHERE `grid_id`=24;
UPDATE `common_grid_state_template` SET `column_widths`='50,210,218,214,218,218,219,219,219,50' WHERE `grid_id`=25;
UPDATE `common_grid_state_template` SET `column_widths`='50,100,210,210,210,210,181,50' WHERE `grid_id`=9;
UPDATE `common_grid_state_template` SET `column_widths`='50,210,210,210,210,50' WHERE `grid_id`=64;
UPDATE `common_grid_state_template` SET `column_widths`='50,210,210,210,210,210,210,250,200,50' WHERE `grid_id`=8;
UPDATE `common_grid_state_template` SET `column_widths`='50,210,210,210,210,210,210,250,210,50' WHERE `grid_id`=67;
UPDATE `common_grid_state_template` SET `column_widths`='50,147,147,147,147,147,147,50' WHERE `grid_id`=12;
UPDATE `common_grid_state_template` SET `column_widths`='210,210,210,210,210,50' WHERE `grid_id`=52;
UPDATE `common_grid_state_template` SET `column_widths`='50,210,210,210,210,210,50' WHERE `grid_id`=46;
UPDATE `common_grid_state_template` SET `column_widths`='210,210,210,210,50' WHERE `grid_id`=48;
UPDATE `common_grid_state_template` SET `column_widths`='50,199,248,199,199,50' WHERE `grid_id`=11;
UPDATE `common_grid_state_template` SET `column_widths`='210,210,210,210,210,50' WHERE `grid_id`=27;
UPDATE `common_grid_state_template` SET `column_widths`='50,210,210,210,210,210,50' WHERE `grid_id`=60;


