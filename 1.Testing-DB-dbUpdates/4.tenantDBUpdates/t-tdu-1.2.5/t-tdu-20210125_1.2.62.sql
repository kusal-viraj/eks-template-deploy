ALTER TABLE `common_additional_field` 
ADD COLUMN `section_id` int NULL AFTER `field_id`;

ALTER TABLE `vp_purchase_order_additional_data` 
ADD COLUMN `section_id` int NOT NULL AFTER `field_name`,
ADD COLUMN `detail_id` int NULL AFTER `section_id`,
ADD COLUMN `display_order` int NOT NULL AFTER `po_mst_id`;

ALTER TABLE `vp_purchase_order_additional_field_attachments` 
ADD COLUMN `section_id` int NOT NULL AFTER `field_name`,
ADD COLUMN `detail_id` int NULL AFTER `section_id`,
ADD COLUMN `display_order` int NOT NULL AFTER `detail_id`;

ALTER TABLE `common_integration_service`
ADD COLUMN `service_type`  int(5) NOT NULL AFTER `status`;



UPDATE `common_integration_service` SET `id`='1', `name`='push account', `status`='A', `service_type`='1' WHERE (`id`='1');
UPDATE `common_integration_service` SET `id`='2', `name`='pull account', `status`='A', `service_type`='2' WHERE (`id`='2');
UPDATE `common_integration_service` SET `id`='3', `name`='pull uom', `status`='A', `service_type`='2' WHERE (`id`='3');
UPDATE `common_integration_service` SET `id`='4', `name`='push uom', `status`='A', `service_type`='1' WHERE (`id`='4');
UPDATE `common_integration_service` SET `id`='5', `name`='push item', `status`='A', `service_type`='1' WHERE (`id`='5');
UPDATE `common_integration_service` SET `id`='6', `name`='pull item', `status`='A', `service_type`='2' WHERE (`id`='6');
UPDATE `common_integration_service` SET `id`='7', `name`='push client', `status`='A', `service_type`='1' WHERE (`id`='7');
UPDATE `common_integration_service` SET `id`='8', `name`='pull client', `status`='A', `service_type`='2' WHERE (`id`='8');
UPDATE `common_integration_service` SET `id`='9', `name`='push term', `status`='A', `service_type`='1' WHERE (`id`='9');
UPDATE `common_integration_service` SET `id`='10', `name`='pull term', `status`='A', `service_type`='2' WHERE (`id`='10');
UPDATE `common_integration_service` SET `id`='11', `name`='push vendor', `status`='A', `service_type`='1' WHERE (`id`='11');
UPDATE `common_integration_service` SET `id`='12', `name`='pull vendor', `status`='A', `service_type`='2' WHERE (`id`='12');
UPDATE `common_integration_service` SET `id`='13', `name`='push purchase order', `status`='A', `service_type`='1' WHERE (`id`='13');
UPDATE `common_integration_service` SET `id`='14', `name`='pull purchase order', `status`='A', `service_type`='2' WHERE (`id`='14');
UPDATE `common_integration_service` SET `id`='15', `name`='push invoice', `status`='A', `service_type`='1' WHERE (`id`='15');
UPDATE `common_integration_service` SET `id`='16', `name`='pull invoice', `status`='A', `service_type`='2' WHERE (`id`='16');
UPDATE `common_integration_service` SET `id`='17', `name`='push purchase order receipt', `status`='A', `service_type`='1' WHERE (`id`='17');
UPDATE `common_integration_service` SET `id`='18', `name`='pull purchase order receipt', `status`='A', `service_type`='2' WHERE (`id`='18');
UPDATE `common_integration_service` SET `id`='19', `name`='push payment', `status`='A', `service_type`='1' WHERE (`id`='19');
UPDATE `common_integration_service` SET `id`='20', `name`='pull payment', `status`='A', `service_type`='2' WHERE (`id`='20');
UPDATE `common_integration_service` SET `id`='21', `name`='push deleted record', `status`='A', `service_type`='1' WHERE (`id`='21');
UPDATE `common_integration_service` SET `id`='22', `name`='pull deleted record', `status`='A', `service_type`='2' WHERE (`id`='22');
UPDATE `common_integration_service` SET `id`='23', `name`='push expense', `status`='A', `service_type`='1' WHERE (`id`='23');

-- 1.2.62 patch-1 --danuddara--

UPDATE `common_additional_field` SET  `section_id` = '3' WHERE `section_id` IS NULL;

-- 1.2.62 patch-2 --danuddara--

UPDATE `vp_purchase_order_additional_data` SET `section_id` = '3', `display_order` = '0'  WHERE `section_id` IS NULL;
UPDATE `vp_purchase_order_additional_field_attachments` SET `section_id` = '3', `display_order` = '0'  WHERE `section_id` IS NULL;
