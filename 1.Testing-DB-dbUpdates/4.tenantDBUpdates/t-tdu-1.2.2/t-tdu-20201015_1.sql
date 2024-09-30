ALTER TABLE `common_product_attachment`
CHANGE COLUMN `image_data` `image_data` MEDIUMBLOB NOT NULL
DEFAULT '' AFTER `id`;


