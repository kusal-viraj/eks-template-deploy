-- ----------------------------
-- Table structure for common_integration_service_dependency
-- ----------------------------
DROP TABLE IF EXISTS `common_integration_service_dependency`;
CREATE TABLE `common_integration_service_dependency` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `service_id` int(11) NOT NULL,
  `dependant_service_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of common_integration_service_dependency
-- ----------------------------
INSERT INTO `common_integration_service_dependency` VALUES ('1', '5', '1');
INSERT INTO `common_integration_service_dependency` VALUES ('2', '5', '4');
INSERT INTO `common_integration_service_dependency` VALUES ('3', '5', '11');
INSERT INTO `common_integration_service_dependency` VALUES ('4', '6', '2');
INSERT INTO `common_integration_service_dependency` VALUES ('5', '6', '3');
INSERT INTO `common_integration_service_dependency` VALUES ('6', '6', '12');
INSERT INTO `common_integration_service_dependency` VALUES ('24', '13', '5');
INSERT INTO `common_integration_service_dependency` VALUES ('25', '13', '11');
INSERT INTO `common_integration_service_dependency` VALUES ('26', '13', '7');
INSERT INTO `common_integration_service_dependency` VALUES ('27', '14', '6');
INSERT INTO `common_integration_service_dependency` VALUES ('28', '14', '12');
INSERT INTO `common_integration_service_dependency` VALUES ('29', '14', '8');
INSERT INTO `common_integration_service_dependency` VALUES ('30', '17', '13');
INSERT INTO `common_integration_service_dependency` VALUES ('31', '18', '14');
INSERT INTO `common_integration_service_dependency` VALUES ('32', '15', '1');
INSERT INTO `common_integration_service_dependency` VALUES ('33', '15', '11');
INSERT INTO `common_integration_service_dependency` VALUES ('34', '15', '5');
INSERT INTO `common_integration_service_dependency` VALUES ('35', '15', '7');
INSERT INTO `common_integration_service_dependency` VALUES ('36', '15', '13');
INSERT INTO `common_integration_service_dependency` VALUES ('37', '16', '2');
INSERT INTO `common_integration_service_dependency` VALUES ('38', '16', '6');
INSERT INTO `common_integration_service_dependency` VALUES ('39', '16', '8');
INSERT INTO `common_integration_service_dependency` VALUES ('40', '16', '12');
INSERT INTO `common_integration_service_dependency` VALUES ('41', '16', '14');
INSERT INTO `common_integration_service_dependency` VALUES ('42', '19', '11');
INSERT INTO `common_integration_service_dependency` VALUES ('43', '19', '15');
INSERT INTO `common_integration_service_dependency` VALUES ('44', '20', '12');
INSERT INTO `common_integration_service_dependency` VALUES ('45', '20', '16');
INSERT INTO `common_integration_service_dependency` VALUES ('46', '23', '1');
INSERT INTO `common_integration_service_dependency` VALUES ('47', '23', '11');
INSERT INTO `common_integration_service_dependency` VALUES ('48', '23', '5');
INSERT INTO `common_integration_service_dependency` VALUES ('49', '23', '7');
INSERT INTO `common_integration_service_dependency` VALUES ('51', '15', '9');
INSERT INTO `common_integration_service_dependency` VALUES ('52', '16', '10');
