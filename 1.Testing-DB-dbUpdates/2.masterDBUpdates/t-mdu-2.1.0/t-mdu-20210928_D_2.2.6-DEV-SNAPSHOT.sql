-------------dumuthu-----2.2.6----------------------

/*
Navicat MySQL Data Transfer

Source Server         : MARIA_DB_LOCAL
Source Server Version : 50505
Source Host           : 127.0.0.1:3307
Source Database       : v2_prep_master_db

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2021-09-28 17:16:18
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for common_failed_upload
-- ----------------------------
DROP TABLE IF EXISTS `common_failed_upload`;
CREATE TABLE `common_failed_upload` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tenant_id` varchar(30) NOT NULL,
  `file_data` blob NOT NULL,
  `uploaded_url` varchar(200) NOT NULL,
  `failed_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
