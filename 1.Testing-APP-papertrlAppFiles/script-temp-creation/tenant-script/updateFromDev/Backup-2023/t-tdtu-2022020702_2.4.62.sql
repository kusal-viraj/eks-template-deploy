ALTER TABLE `common_item_vendor_wise` 
ADD COLUMN `status` char(1) NOT NULL DEFAULT 'A' AFTER `image_file_name`;