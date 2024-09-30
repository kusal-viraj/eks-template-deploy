----

CREATE TABLE `umm_user_role_relation` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`user_id` INT(11) NOT NULL,
	`role_id` INT(11) NOT NULL,
	PRIMARY KEY (`id`) USING BTREE,
	INDEX `USER_FK1` (`user_id`) USING BTREE,
	INDEX `ROLE_FK2` (`role_id`) USING BTREE,
	CONSTRAINT `ROLE_FK2` FOREIGN KEY (`role_id`) REFERENCES `umm_role_mst` (`id`) ON UPDATE RESTRICT ON DELETE RESTRICT,
	CONSTRAINT `USER_FK1` FOREIGN KEY (`user_id`) REFERENCES `umm_user_mst` (`id`) ON UPDATE RESTRICT ON DELETE RESTRICT
)
COLLATE='latin1_swedish_ci'
ENGINE=InnoDB
;

UPDATE `common_grid_column_template` SET `search_type`='multiSelect' WHERE `grid_id`=2 AND `field`='rolem.id';