/*
Navicat MySQL Data Transfer

Source Server         : conn
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : v2_prep_tenant_db

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2021-03-17 18:25:33
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for common_date_format
-- ----------------------------
DROP TABLE IF EXISTS `common_date_format`;
CREATE TABLE `common_date_format` (
  `id` varchar(30) NOT NULL,
  `name` varchar(30) NOT NULL,
  `sort_order` int(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of common_date_format
-- ----------------------------
INSERT INTO `common_date_format` VALUES ('dd-MM-yyyy', '30-12-2018(dd-MM-yyyy)', '1');
INSERT INTO `common_date_format` VALUES ('dd-MMM-yyyy', '30-Dec-2018', '2');
INSERT INTO `common_date_format` VALUES ('dd-MMMM-yyyy', '30-December-2018', '6');
INSERT INTO `common_date_format` VALUES ('dd.MM.yy', '30.12.18', '7');
INSERT INTO `common_date_format` VALUES ('dd.MM.yyyy', '30.12.2018', '8');
INSERT INTO `common_date_format` VALUES ('dd.MMM.yy', '30.Dec.18', '9');
INSERT INTO `common_date_format` VALUES ('dd.MMM.yyyy', '30.Dec.2018', '10');
INSERT INTO `common_date_format` VALUES ('dd.MMMM.yy', '30.December.18', '11');
INSERT INTO `common_date_format` VALUES ('dd.MMMM.yyyy', '30.December.2018', '12');
INSERT INTO `common_date_format` VALUES ('dd/MM/yyyy', '30/12/2018', '4');
INSERT INTO `common_date_format` VALUES ('dd/MMM/yyyy', '30/Dec/2018', '13');
INSERT INTO `common_date_format` VALUES ('dd/MMMM/yyyy', '30/December/2018', '14');
INSERT INTO `common_date_format` VALUES ('MM-dd-yyyy', '12-30-2018', '15');
INSERT INTO `common_date_format` VALUES ('MM.dd.yy', '12.30.18', '16');
INSERT INTO `common_date_format` VALUES ('MM.dd.yyyy', '12.30.2018', '17');
INSERT INTO `common_date_format` VALUES ('MM/dd/yyyy', '12/30/2018', '5');
INSERT INTO `common_date_format` VALUES ('MMM dd, yyyy', 'Dec 30, 2018', '18');
INSERT INTO `common_date_format` VALUES ('MMM-dd-yyyy', 'Dec-30-2018', '19');
INSERT INTO `common_date_format` VALUES ('MMM.dd.yy', 'Dec.30.18', '20');
INSERT INTO `common_date_format` VALUES ('MMM.dd.yyyy', 'Dec.30.2018', '21');
INSERT INTO `common_date_format` VALUES ('MMM/dd/yyyy', 'Dec/30/2018', '22');
INSERT INTO `common_date_format` VALUES ('MMMM dd, yyyy', 'December 30, 2018', '57');
INSERT INTO `common_date_format` VALUES ('MMMM-dd-yyyy', 'December-30-2018', '23');
INSERT INTO `common_date_format` VALUES ('MMMM/dd/yyyy', 'December/30/2018', '24');
INSERT INTO `common_date_format` VALUES ('yy MMM ,dd', '18 Dec ,30', '25');
INSERT INTO `common_date_format` VALUES ('yy-dd-MMM', '18-30-Dec', '26');
INSERT INTO `common_date_format` VALUES ('yy-dd-MMMM', '18-30-December', '27');
INSERT INTO `common_date_format` VALUES ('yy-MM/dd', '18-12-30', '28');
INSERT INTO `common_date_format` VALUES ('yy-MMM-dd', '18-Dec-30', '29');
INSERT INTO `common_date_format` VALUES ('yy-MMMM-dd', '18-December-30', '30');
INSERT INTO `common_date_format` VALUES ('yy.dd.MMM', '18.30.Dec', '31');
INSERT INTO `common_date_format` VALUES ('yy.dd.MMMM', '18.30.December', '32');
INSERT INTO `common_date_format` VALUES ('yy.MM.dd', '18.12.30', '33');
INSERT INTO `common_date_format` VALUES ('yy.MMM.dd', '18.Dec.30', '34');
INSERT INTO `common_date_format` VALUES ('yy.MMMM.dd', '18.December.30', '35');
INSERT INTO `common_date_format` VALUES ('yy/dd/MMM', '18/30/Dec', '36');
INSERT INTO `common_date_format` VALUES ('yy/dd/MMMM', '18/30/December', '37');
INSERT INTO `common_date_format` VALUES ('yy/MM/dd', '18/12/30', '38');
INSERT INTO `common_date_format` VALUES ('yy/MMM/dd', '18/Dec/30', '39');
INSERT INTO `common_date_format` VALUES ('yy/MMMM/dd', '18/December/30', '40');
INSERT INTO `common_date_format` VALUES ('yyyy MMM ,dd', '2018 Dec ,30', '41');
INSERT INTO `common_date_format` VALUES ('yyyy-dd-MMM', '2018-30-Dec', '42');
INSERT INTO `common_date_format` VALUES ('yyyy-dd-MMMM', '2018-30-December', '43');
INSERT INTO `common_date_format` VALUES ('yyyy-MM-dd', '2018-12-30', '44');
INSERT INTO `common_date_format` VALUES ('yyyy-MMM-dd', '2018-Dec-30', '45');
INSERT INTO `common_date_format` VALUES ('yyyy-MMMM-dd', '2018-December-30', '46');
INSERT INTO `common_date_format` VALUES ('yyyy.dd.MMM', '2018.30.Dec', '47');
INSERT INTO `common_date_format` VALUES ('yyyy.dd.MMMM', '2018.30.December', '48');
INSERT INTO `common_date_format` VALUES ('yyyy.MM.dd', '2018.12.30', '49');
INSERT INTO `common_date_format` VALUES ('yyyy.MMM.dd', '2018.Dec.30', '50');
INSERT INTO `common_date_format` VALUES ('yyyy.MMMM.dd', '2018.December.30', '51');
INSERT INTO `common_date_format` VALUES ('yyyy/dd/MMM', '2018/30/Dec', '52');
INSERT INTO `common_date_format` VALUES ('yyyy/dd/MMMM', '2018/30/December', '53');
INSERT INTO `common_date_format` VALUES ('yyyy/MM/dd', '2018/12/30', '54');
INSERT INTO `common_date_format` VALUES ('yyyy/MMM/dd', '2018/Dec/30', '55');
INSERT INTO `common_date_format` VALUES ('yyyy/MMMM/dd', '2018/December/30', '56');
