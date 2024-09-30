/*
Navicat MySQL Data Transfer

Source Server         : MARIA_DB_LOCAL
Source Server Version : 50505
Source Host           : 127.0.0.1:3307
Source Database       : v2_prep_tenant_db

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2021-03-17 17:50:10
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
INSERT INTO `common_date_format` VALUES ('dd-MM-yy', 'Dec 30, 2018', '1');
INSERT INTO `common_date_format` VALUES ('dd-MM-yyyy', 'December 30, 2018', '2');
INSERT INTO `common_date_format` VALUES ('dd-MMM-yy', '12-30-18', '3');
INSERT INTO `common_date_format` VALUES ('dd-MMM-yyyy', '12-30-2018', '4');
INSERT INTO `common_date_format` VALUES ('dd-MMMM-yy', 'Dec-30-18', '5');
INSERT INTO `common_date_format` VALUES ('dd-MMMM-yyyy', 'Dec-30-2018', '6');
INSERT INTO `common_date_format` VALUES ('dd.MM.yy', 'December-30-18', '7');
INSERT INTO `common_date_format` VALUES ('dd.MM.yyyy', 'December-30-2018', '8');
INSERT INTO `common_date_format` VALUES ('dd.MMM.yy', '12/30/18', '9');
INSERT INTO `common_date_format` VALUES ('dd.MMM.yyyy', '12/30/2018', '10');
INSERT INTO `common_date_format` VALUES ('dd.MMMM.yy', 'Dec/30/18', '11');
INSERT INTO `common_date_format` VALUES ('dd.MMMM.yyyy', 'Dec/30/2018', '12');
INSERT INTO `common_date_format` VALUES ('dd/MM/yy', 'December/30/18', '13');
INSERT INTO `common_date_format` VALUES ('dd/MM/yyyy', 'December/30/2018', '14');
INSERT INTO `common_date_format` VALUES ('dd/MMM/yy', '30.12.18', '15');
INSERT INTO `common_date_format` VALUES ('dd/MMM/yyyy', '30.12.2018', '16');
INSERT INTO `common_date_format` VALUES ('dd/MMMM/yy', '30.Dec.18', '17');
INSERT INTO `common_date_format` VALUES ('dd/MMMM/yyyy', '30.Dec.2018', '18');
INSERT INTO `common_date_format` VALUES ('MM-dd-yy', '30.December.18', '19');
INSERT INTO `common_date_format` VALUES ('MM-dd-yyyy', '30.December.2018', '20');
INSERT INTO `common_date_format` VALUES ('MM.dd.yy', '30-12-18', '21');
INSERT INTO `common_date_format` VALUES ('MM.dd.yyyy', '30-12-2018', '22');
INSERT INTO `common_date_format` VALUES ('MM/dd/yy', '30-Dec-18', '23');
INSERT INTO `common_date_format` VALUES ('MM/dd/yyyy', '30-Dec-2018', '24');
INSERT INTO `common_date_format` VALUES ('MMM dd, yyyy', '30-December-18', '25');
INSERT INTO `common_date_format` VALUES ('MMM-dd-yy', '30-December-2018', '26');
INSERT INTO `common_date_format` VALUES ('MMM-dd-yyyy', '30/12/18', '27');
INSERT INTO `common_date_format` VALUES ('MMM.dd.yy', '30/12/2018', '28');
INSERT INTO `common_date_format` VALUES ('MMM.dd.yyyy', '30/Dec/18', '29');
INSERT INTO `common_date_format` VALUES ('MMM/dd/yy', '30/Dec/2018', '30');
INSERT INTO `common_date_format` VALUES ('MMM/dd/yyyy', '30/December/18', '31');
INSERT INTO `common_date_format` VALUES ('MMMM dd, yyyy', '30/December/2018', '32');
INSERT INTO `common_date_format` VALUES ('MMMM-dd-yy', '12.30.18', '33');
INSERT INTO `common_date_format` VALUES ('MMMM-dd-yyyy', '12.30.2018', '34');
INSERT INTO `common_date_format` VALUES ('MMMM.dd.yy', 'Dec.30.18', '35');
INSERT INTO `common_date_format` VALUES ('MMMM.dd.yyyy', 'Dec.30.2018', '36');
INSERT INTO `common_date_format` VALUES ('MMMM/dd/yy', 'December.30.18', '37');
INSERT INTO `common_date_format` VALUES ('MMMM/dd/yyyy', 'December.30.2018', '38');
INSERT INTO `common_date_format` VALUES ('yy-MM-dd', '18-12-30', '39');
INSERT INTO `common_date_format` VALUES ('yy-MMM-dd', '2018-12-30', '40');
INSERT INTO `common_date_format` VALUES ('yy-MMMM-dd', '18-Dec-30', '41');
INSERT INTO `common_date_format` VALUES ('yy.MM.dd', '2018-Dec-30', '42');
INSERT INTO `common_date_format` VALUES ('yy.MMM.dd', '18-December-30', '43');
INSERT INTO `common_date_format` VALUES ('yy.MMMM.dd', '2018-December-30', '44');
INSERT INTO `common_date_format` VALUES ('yy/MM/dd', '18/12/30', '45');
INSERT INTO `common_date_format` VALUES ('yy/MMM/dd', '2018/12/30', '46');
INSERT INTO `common_date_format` VALUES ('yy/MMMM/dd', '18/Dec/30', '47');
INSERT INTO `common_date_format` VALUES ('yyyy-MM-dd', '2018/Dec/30', '48');
INSERT INTO `common_date_format` VALUES ('yyyy-MMM-dd', '18/December/30', '49');
INSERT INTO `common_date_format` VALUES ('yyyy-MMMM-dd', '2018/December/30', '50');
INSERT INTO `common_date_format` VALUES ('yyyy.MM.dd', '18.12.30', '51');
INSERT INTO `common_date_format` VALUES ('yyyy.MMM.dd', '2018.12.30', '52');
INSERT INTO `common_date_format` VALUES ('yyyy.MMMM.dd', '18.Dec.30', '53');
INSERT INTO `common_date_format` VALUES ('yyyy/MM/dd', '2018.Dec.30', '54');
INSERT INTO `common_date_format` VALUES ('yyyy/MMM/dd', '18.December.30', '55');
INSERT INTO `common_date_format` VALUES ('yyyy/MMMM/dd', '2018.December.30', '56');
