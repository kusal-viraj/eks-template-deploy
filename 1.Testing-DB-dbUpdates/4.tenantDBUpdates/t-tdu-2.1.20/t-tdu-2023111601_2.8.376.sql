-----thiwanka 2.8.376----


UPDATE `common_grid_column_template` SET `align`='center' WHERE `field`='cinvoice.invoiceDate';
UPDATE `common_grid_column_user_wice` SET `align`='center' WHERE `field`='cinvoice.invoiceDate';

UPDATE `common_grid_column_template` SET `align`='left' WHERE `field` IN ('cinvoice.exportStatus','cinvoice.paymentStatus','cinvoice.invoiceNumber');
UPDATE `common_grid_column_user_wice` SET `align`='left' WHERE `field` IN ('cinvoice.exportStatus','cinvoice.paymentStatus','cinvoice.invoiceNumber');