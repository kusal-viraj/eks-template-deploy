----danuddara-2.8.45---------




ALTER TABLE `payment_provider` 
MODIFY COLUMN `description` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL AFTER `status`;

UPDATE `payment_provider` SET `description` = 'As part of our commitment to simplifying your financial processes, we are pleased to offer U.S. Bank as one of our trusted payment providers. Now you can effortlessly manage various payment types, including ACH transfers, checks, VCards, and digital cards, all securely integrated with U.S. Bank\'s reliable payment solutions. Experience the convenience and peace of mind that comes with streamlining your AP processes through our system, in partnership with U.S. Bank.' WHERE `id` = 2;