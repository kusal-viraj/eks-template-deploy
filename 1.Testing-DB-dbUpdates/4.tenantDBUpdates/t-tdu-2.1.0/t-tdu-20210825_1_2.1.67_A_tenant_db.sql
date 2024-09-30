----------Madhusha----2.1.67-----------

ALTER TABLE `common_approval_code`
ADD COLUMN `created_username`  varchar(100) NOT NULL AFTER `created_by`;

UPDATE `common_grid_column_template` SET `field`='appCode.createdUsername' WHERE (`id`='81');

UPDATE common_approval_code 
INNER JOIN umm_user_mst ON common_approval_code.created_by=umm_user_mst.user_name 
SET common_approval_code.created_username=umm_user_mst.`name`;