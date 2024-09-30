DELETE FROM common_grid_column_user_wice WHERE grid_id=27;

DELETE FROM common_grid_state_user_wice WHERE grid_id=27;

UPDATE `common_grid_state_template` SET `total_rows`='15', `column_widths`='100,210,210,210,210,210' WHERE (`id`='27');