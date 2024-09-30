-------------dasindu 2.10.3----------------


UPDATE `common_grid_column_template` SET `column_width`=50 WHERE `grid_id`=75 AND `field`='checkbox';
UPDATE `common_grid_column_template` SET `column_width`=204 WHERE `grid_id`=75 AND `field`='vendor.name';
UPDATE `common_grid_column_template` SET `column_width`=174 WHERE `grid_id`=75 AND `field`='vendor.vendorCode';
UPDATE `common_grid_column_template` SET `column_width`=218 WHERE `grid_id`=75 AND `field`='vendor.contactPerson';
UPDATE `common_grid_column_template` SET `column_width`=213 WHERE `grid_id`=75 AND `field`='vendor.contactNumber';
UPDATE `common_grid_column_template` SET `column_width`=201 WHERE `grid_id`=75 AND `field`='vendor.fax';
UPDATE `common_grid_column_template` SET `column_width`=252 WHERE `grid_id`=75 AND `field`='vendor.email';
UPDATE `common_grid_column_template` SET `column_width`=200 WHERE `grid_id`=75 AND `field`='payment.paymentTypeId';
UPDATE `common_grid_column_template` SET `column_width`=177 WHERE `grid_id`=75 AND `field`='term.id';
UPDATE `common_grid_column_template` SET `column_width`=169 WHERE `grid_id`=75 AND `field`='vendor.status';
UPDATE `common_grid_column_template` SET `column_width`=66 WHERE `grid_id`=75 AND `field`='action';

UPDATE `common_grid_state_template` SET `column_widths`='50,204,174,218,213,201,252,200,177,169,66' WHERE `grid_id`=75;