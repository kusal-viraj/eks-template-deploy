---2.9.111--112----

UPDATE `umm_menu` SET `display_text`='Vendors' WHERE `id`=1035 AND `name`='Vendors';

ALTER TABLE vp_vendor_mst CHANGE COLUMN emp_id_no emp_id_no VARCHAR(50) NULL DEFAULT NULL COLLATE 'latin1_swedish_ci';
