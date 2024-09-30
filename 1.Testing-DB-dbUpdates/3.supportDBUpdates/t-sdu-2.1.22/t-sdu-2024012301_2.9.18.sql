UPDATE common_grid_column_template SET column_order=60 WHERE field='action';

DELETE FROM common_grid_column_user_wice WHERE id<>0;
DELETE FROM common_grid_state_user_wice WHERE id<>0;

UPDATE common_grid_state_template SET column_widths='210,210,210,210,210,210,50' WHERE grid_id=12;
UPDATE common_grid_state_template SET column_widths='210,210,210,210,210,50' WHERE grid_id=11;
UPDATE common_grid_state_template SET column_widths='210,210,210,50' WHERE grid_id=4;
UPDATE common_grid_state_template SET column_widths='170,350,300,150,150,300,200,50' WHERE grid_id=3;
UPDATE common_grid_state_template SET column_widths='50,210,210,210,210,210,210,50' WHERE grid_id=8;
UPDATE common_grid_state_template SET column_widths='50,210,307,307,307,307,50' WHERE grid_id=9;
