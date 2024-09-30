-------------Amal---------2.2.66----------------

UPDATE `common_grid_column_template` SET `header` = 'Employee No.' WHERE (`id` = '19');
UPDATE `common_grid_column_template` SET `placeholder` = 'Employee No.' WHERE (`id` = '19');

UPDATE `common_grid_column_template` SET `column_order` = '8' WHERE (`id` = '470');
UPDATE `common_grid_column_template` SET `column_order` = '9' WHERE (`id` = '471');
UPDATE `common_grid_column_template` SET `column_order` = '10' WHERE (`id` = '22');

DELETE FROM common_grid_column_user_wice;
