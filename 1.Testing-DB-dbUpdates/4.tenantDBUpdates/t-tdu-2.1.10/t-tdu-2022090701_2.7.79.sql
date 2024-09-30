----------------Madhusha----2.7.9-----------------------

INSERT INTO `common_drop_down_connection`(`id`, `drop_down_id`, `drop_down_value_id`) VALUES (112, 15, 66);

ALTER TABLE `hst_vp_expense_mst` 
ADD COLUMN `total_miles_driven` decimal(19, 2) NULL AFTER `total_mileage_amount`;