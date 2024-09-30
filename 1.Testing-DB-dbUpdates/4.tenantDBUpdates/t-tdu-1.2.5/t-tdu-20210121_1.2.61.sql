UPDATE `common_integration_service` SET `name`='Purchase order receipt push' WHERE (`id`='17');

UPDATE `common_integration_service` SET `name`='Purchase order receipt pull' WHERE (`id`='18');

UPDATE `common_integration_service` SET `name`='Deleted record push' WHERE (`id`='21');

UPDATE `common_integration_service` SET `name`='Deleted record pull' WHERE (`id`='22');


INSERT INTO `common_integration_service_dependency` (`service_id`, `dependant_service_id`) VALUES ('21', '1');
INSERT INTO `common_integration_service_dependency` (`service_id`, `dependant_service_id`) VALUES ('21', '5');
INSERT INTO `common_integration_service_dependency` (`service_id`, `dependant_service_id`) VALUES ('21', '7');
INSERT INTO `common_integration_service_dependency` (`service_id`, `dependant_service_id`) VALUES ('21', '11');
INSERT INTO `common_integration_service_dependency` (`service_id`, `dependant_service_id`) VALUES ('21', '13');
INSERT INTO `common_integration_service_dependency` (`service_id`, `dependant_service_id`) VALUES ('21', '15');
INSERT INTO `common_integration_service_dependency` (`service_id`, `dependant_service_id`) VALUES ('21', '17');
INSERT INTO `common_integration_service_dependency` (`service_id`, `dependant_service_id`) VALUES ('21', '19');
INSERT INTO `common_integration_service_dependency` (`service_id`, `dependant_service_id`) VALUES ('21', '23');

INSERT INTO `common_integration_service_dependency` (`service_id`, `dependant_service_id`) VALUES ('22', '2');
INSERT INTO `common_integration_service_dependency` (`service_id`, `dependant_service_id`) VALUES ('22', '6');
INSERT INTO `common_integration_service_dependency` (`service_id`, `dependant_service_id`) VALUES ('22', '8');
INSERT INTO `common_integration_service_dependency` (`service_id`, `dependant_service_id`) VALUES ('22', '12');
INSERT INTO `common_integration_service_dependency` (`service_id`, `dependant_service_id`) VALUES ('22', '14');
INSERT INTO `common_integration_service_dependency` (`service_id`, `dependant_service_id`) VALUES ('22', '16');
INSERT INTO `common_integration_service_dependency` (`service_id`, `dependant_service_id`) VALUES ('22', '18');
INSERT INTO `common_integration_service_dependency` (`service_id`, `dependant_service_id`) VALUES ('22', '20');