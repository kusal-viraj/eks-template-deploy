CREATE TABLE `papertrl_additional_field_types` (
 `id` int(11) NOT NULL,
 `name` varchar(150) DEFAULT NULL,
 `status` char(1) DEFAULT NULL,
 PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
INSERT INTO `papertrl_additional_field_types` VALUES ('1', 'Textbox', 'A');
INSERT INTO `papertrl_additional_field_types` VALUES ('2', 'Date Field', 'A');
INSERT INTO `papertrl_additional_field_types` VALUES ('3', 'Drop Down Field', 'A');
INSERT INTO `papertrl_additional_field_types` VALUES ('4', 'Text Area', 'A');
INSERT INTO `papertrl_additional_field_types` VALUES ('5', 'Label', 'A');
INSERT INTO `papertrl_additional_field_types` VALUES ('6', 'File Input', 'A');
INSERT INTO `papertrl_additional_field_types` VALUES ('7', 'Radio Button', 'A');

CREATE TABLE `papertrl_additional_validations` (
 `id` int(11) NOT NULL,
 `name` varchar(150) DEFAULT NULL,
 PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
INSERT INTO `papertrl_additional_validations` VALUES ('1', 'Name');
INSERT INTO `papertrl_additional_validations` VALUES ('2', 'Display Order');
INSERT INTO `papertrl_additional_validations` VALUES ('3', 'Required');
INSERT INTO `papertrl_additional_validations` VALUES ('4', 'Max Length');
INSERT INTO `papertrl_additional_validations` VALUES ('5', 'Data Type');
INSERT INTO `papertrl_additional_validations` VALUES ('6', 'Create New');
INSERT INTO `papertrl_additional_validations` VALUES ('7', 'Multiple');
INSERT INTO `papertrl_additional_validations` VALUES ('8', 'Accept');
INSERT INTO `papertrl_additional_validations` VALUES ('9', 'Rows');
INSERT INTO `papertrl_additional_validations` VALUES ('10', 'Value');
INSERT INTO `papertrl_additional_validations` VALUES ('11', 'Options');

CREATE TABLE `papertrl_additional_field_validations` (
 `id` int(11) NOT NULL,
 `field_id` int(11) DEFAULT NULL,
 `validation_id` int(11) DEFAULT NULL,
 PRIMARY KEY (`id`),
 KEY `field_id` (`field_id`),
 KEY `validation_id` (`validation_id`),
 CONSTRAINT `field_id` FOREIGN KEY (`field_id`) REFERENCES
`papertrl_additional_field_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
 CONSTRAINT `validation_id` FOREIGN KEY (`validation_id`) REFERENCES
`papertrl_additional_validations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
INSERT INTO `papertrl_additional_field_validations` VALUES ('1', '1', '1');
INSERT INTO `papertrl_additional_field_validations` VALUES ('2', '1', '2');
INSERT INTO `papertrl_additional_field_validations` VALUES ('3', '1', '3');
INSERT INTO `papertrl_additional_field_validations` VALUES ('4', '1', '4');
INSERT INTO `papertrl_additional_field_validations` VALUES ('5', '1', '5');
INSERT INTO `papertrl_additional_field_validations` VALUES ('6', '2', '1');
INSERT INTO `papertrl_additional_field_validations` VALUES ('7', '2', '2');
INSERT INTO `papertrl_additional_field_validations` VALUES ('8', '2', '3');
INSERT INTO `papertrl_additional_field_validations` VALUES ('9', '3', '1');
INSERT INTO `papertrl_additional_field_validations` VALUES ('10', '3', '2');
INSERT INTO `papertrl_additional_field_validations` VALUES ('11', '3', '3');
INSERT INTO `papertrl_additional_field_validations` VALUES ('12', '4', '1');
INSERT INTO `papertrl_additional_field_validations` VALUES ('13', '4', '2');
INSERT INTO `papertrl_additional_field_validations` VALUES ('14', '4', '3');
INSERT INTO `papertrl_additional_field_validations` VALUES ('15', '4', '4');
INSERT INTO `papertrl_additional_field_validations` VALUES ('16', '4', '9');
INSERT INTO `papertrl_additional_field_validations` VALUES ('17', '5', '1');
INSERT INTO `papertrl_additional_field_validations` VALUES ('18', '5', '2');
INSERT INTO `papertrl_additional_field_validations` VALUES ('19', '6', '1');
INSERT INTO `papertrl_additional_field_validations` VALUES ('20', '6', '2');
INSERT INTO `papertrl_additional_field_validations` VALUES ('21', '6', '3');
INSERT INTO `papertrl_additional_field_validations` VALUES ('22', '6', '8');
INSERT INTO `papertrl_additional_field_validations` VALUES ('23', '7', '1');
INSERT INTO `papertrl_additional_field_validations` VALUES ('24', '7', '2');
INSERT INTO `papertrl_additional_field_validations` VALUES ('25', '7', '3');
INSERT INTO `papertrl_additional_field_validations` VALUES ('26', '3', '6');
INSERT INTO `papertrl_additional_field_validations` VALUES ('27', '3', '7');
INSERT INTO `papertrl_additional_field_validations` VALUES ('28', '5', '10');
INSERT INTO `papertrl_additional_field_validations` VALUES ('29', '3', '11');
INSERT INTO `papertrl_additional_field_validations` VALUES ('30', '7', '11');

