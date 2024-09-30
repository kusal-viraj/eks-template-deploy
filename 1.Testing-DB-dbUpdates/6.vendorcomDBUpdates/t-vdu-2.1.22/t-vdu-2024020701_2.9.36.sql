---2.9.36-----Dasindu----

UPDATE `vendor_grid_column_template` SET `is_sortable`=0 WHERE `grid_id`=2 AND `field`='rolem.id';

UPDATE `vendor_grid_column_user_wice` SET `is_sortable`=0 WHERE `grid_id`=2 AND `field`='rolem.id' AND `sortable_field`='rolem.id';