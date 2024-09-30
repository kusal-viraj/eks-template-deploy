-------------indra/madhusha-----2.1.48---------------------

ALTER TABLE `vp_po_number_config`
CHANGE COLUMN `approval_group_id` `department_id`  int(10) NOT NULL AFTER `id`,
CHANGE COLUMN `approval_group_name` `department_name`  varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '' AFTER `department_id`;


UPDATE `common_grid_column_template` SET `field`='poc.departmentId', `header`='Department Name', `placeholder`='Department Name' WHERE (`id`='273');

UPDATE common_department SET common_department.department_code=common_department.id;

DROP TABLE IF EXISTS `umm_user_department`;
CREATE TABLE IF NOT EXISTS `umm_user_department` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `department_id` int(11) NOT NULL,
  `department_name` varchar(100) NOT NULL,
  `sub_account_id` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=latin1;