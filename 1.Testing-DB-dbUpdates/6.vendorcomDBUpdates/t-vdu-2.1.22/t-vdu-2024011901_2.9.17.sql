---dasindu 2.9.17---


CREATE TABLE `vendor_user_role_relation` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`user_id` INT(11) NOT NULL,
	`role_id` INT(11) NOT NULL,
	PRIMARY KEY (`id`) USING BTREE,
	INDEX `ROLE_FK1` (`role_id`) USING BTREE,
	INDEX `USER_FK2` (`user_id`) USING BTREE,
	CONSTRAINT `ROLE_FK1` FOREIGN KEY (`role_id`) REFERENCES `vendor_role_mst` (`id`) ON UPDATE RESTRICT ON DELETE RESTRICT,
	CONSTRAINT `USER_FK2` FOREIGN KEY (`user_id`) REFERENCES `vendor_user_mst` (`id`) ON UPDATE RESTRICT ON DELETE RESTRICT
)
COLLATE='latin1_swedish_ci'
ENGINE=InnoDB
;

INSERT INTO `vendor_user_role_relation` (`user_id`, `role_id`)
SELECT `id`, `role_id`
FROM `vendor_user_mst`;

UPDATE `vendor_grid_column_template` SET `search_type`='multiSelect' WHERE `grid_id`=2 AND `field`='rolem.id';

UPDATE `vendor_grid_column_user_wice` SET `search_type`='multiSelect' WHERE `grid_id`=2 AND `field`='rolem.id';