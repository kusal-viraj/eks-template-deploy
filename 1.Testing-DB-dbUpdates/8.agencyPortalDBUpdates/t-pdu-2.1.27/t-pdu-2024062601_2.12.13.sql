----------thiwanka 2.12.13------------

UPDATE `common_grid_state_template` SET `total_rows`=25 WHERE `grid_id` IN (1,2,3,6);
DELETE FROM `common_grid_state_user_wice` WHERE `grid_id` IN (1,2,3,6);