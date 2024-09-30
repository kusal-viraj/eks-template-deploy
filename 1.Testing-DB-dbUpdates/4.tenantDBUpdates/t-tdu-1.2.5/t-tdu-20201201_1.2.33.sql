-- ----------------------------
-- Query 1
-- ----------------------------
CREATE TABLE `common_email_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email_service` varchar(255) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Query 2
-- ----------------------------
INSERT INTO `common_email_types` VALUES ('1', 'Invoice has approved');
INSERT INTO `common_email_types` VALUES ('2', 'Invoice has rejected');
INSERT INTO `common_email_types` VALUES ('3', 'Invoice submitted for approval');
INSERT INTO `common_email_types` VALUES ('4', 'Purchase Order has approved');
INSERT INTO `common_email_types` VALUES ('5', 'Purchase Order has rejected');
INSERT INTO `common_email_types` VALUES ('6', 'Purchase Order submitted for approval');
INSERT INTO `common_email_types` VALUES ('7', 'Expense has approved');
INSERT INTO `common_email_types` VALUES ('8', 'Expense has rejected');
INSERT INTO `common_email_types` VALUES ('9', 'Expense submitted for approval');

-- ----------------------------
-- Query 3
-- ----------------------------
CREATE TABLE `common_email_menu_privilege` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_privilage_id` int(11) DEFAULT NULL,
  `email_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Query 4
-- ----------------------------
INSERT INTO `common_email_menu_privilege` VALUES ('1', '151', '4');
INSERT INTO `common_email_menu_privilege` VALUES ('2', '151', '5');
INSERT INTO `common_email_menu_privilege` VALUES ('3', '160', '6');
INSERT INTO `common_email_menu_privilege` VALUES ('4', '161', '6');
INSERT INTO `common_email_menu_privilege` VALUES ('5', '170', '6');
INSERT INTO `common_email_menu_privilege` VALUES ('6', '119', '7');
INSERT INTO `common_email_menu_privilege` VALUES ('7', '119', '8');
INSERT INTO `common_email_menu_privilege` VALUES ('8', '139', '9');
INSERT INTO `common_email_menu_privilege` VALUES ('9', '140', '9');
INSERT INTO `common_email_menu_privilege` VALUES ('10', '150', '9');
INSERT INTO `common_email_menu_privilege` VALUES ('11', '26', '1');
INSERT INTO `common_email_menu_privilege` VALUES ('12', '26', '2');
INSERT INTO `common_email_menu_privilege` VALUES ('13', '55', '1');
INSERT INTO `common_email_menu_privilege` VALUES ('14', '55', '2');
INSERT INTO `common_email_menu_privilege` VALUES ('15', '29', '3');
INSERT INTO `common_email_menu_privilege` VALUES ('16', '30', '3');
INSERT INTO `common_email_menu_privilege` VALUES ('18', '172', '3');

-- ----------------------------
-- Query 5
-- ----------------------------
CREATE TABLE `common_user_email_subscription` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email_id` int(11) DEFAULT NULL,
  `user_id` varchar(30) DEFAULT NULL,
  `subscribe` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;