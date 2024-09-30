ALTER TABLE `common_automation_event`
ADD COLUMN `sort_order`  int(3) NOT NULL AFTER `event_name`;

UPDATE `common_automation_event` SET `event_name`='Submit' WHERE (`id`='1');
UPDATE `common_automation_event` SET `event_name`='Edit & Resubmit' WHERE (`id`='2');
UPDATE `common_automation_event` SET `event_name`='Approve' WHERE (`id`='3');
UPDATE `common_automation_event` SET `event_name`='Reject' WHERE (`id`='4');
UPDATE `common_automation_event` SET `event_name`='Skip Approval' WHERE (`id`='5');
UPDATE `common_automation_event` SET `event_name`='Delete' WHERE (`id`='6');
UPDATE `common_automation_event` SET `event_name`='Send to Vendor' WHERE (`id`='7');
UPDATE `common_automation_event` SET `event_name`='Create' WHERE (`id`='8');
UPDATE `common_automation_event` SET `event_name`='Upload' WHERE (`id`='9');
UPDATE `common_automation_event` SET `event_name`='Reassign' WHERE (`id`='10');
UPDATE `common_automation_event` SET `event_name`='Void' WHERE (`id`='11');
UPDATE `common_automation_event` SET `event_name`='Mark as Mail' WHERE (`id`='12');
UPDATE `common_automation_event` SET `event_name`='Apply to Different Bill' WHERE (`id`='13');
UPDATE `common_automation_event` SET `event_name`='Save as Approve' WHERE (`id`='14');
DELETE FROM `common_automation_document_type_event` WHERE (`id`='15');

ALTER TABLE `common_automation_item_cost_config` DROP FOREIGN KEY `PO_ID_FK_2`;

ALTER TABLE `common_automation_item_cost_config`
DROP COLUMN `qty`,
DROP COLUMN `rate`,
DROP COLUMN `amount`,
DROP COLUMN `billable`,
DROP COLUMN `tax`,
DROP COLUMN `po_id`,
ADD COLUMN `item_number`  varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '' AFTER `project_id`,
ADD COLUMN `item_name`  varchar(300) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '' AFTER `item_number`;

ALTER TABLE `common_automation_expense_cost_config`
DROP COLUMN `amount`,
DROP COLUMN `billable`,
DROP COLUMN `tax`,
ADD COLUMN `account_name`  varchar(200) NOT NULL AFTER `account_id`;

DELETE FROM `common_automation_field_condition` WHERE (`id`='10');
UPDATE `common_automation_field` SET `short_code`='status' WHERE (`id`='73');

UPDATE `common_automation_field` SET `drop_down_url`='/vendor_portal/sec_get_all_bill_templates_v2' WHERE (`id`='4');
UPDATE `common_automation_field` SET `field_name`='Payment Term' WHERE (`id`='9');
UPDATE `common_automation_field` SET `field_name`='Bill Template' WHERE (`id`='4');

UPDATE `common_automation_field` SET `field_name`='Submit User' WHERE (`id`='75');
UPDATE `common_automation_field` SET `field_name`='Submit User' WHERE (`id`='76');
UPDATE `common_automation_field` SET `field_name`='Submit User' WHERE (`id`='77');
UPDATE `common_automation_field` SET `field_name`='Submit User' WHERE (`id`='78');
UPDATE `common_automation_field` SET `field_name`='Submit User' WHERE (`id`='79');

DELETE FROM `common_automation_field_condition` WHERE (`id`='33');
DELETE FROM `common_automation_field_condition` WHERE (`id`='17');

DELETE FROM `common_automation_field_condition` WHERE (`id`='44');
DELETE FROM `common_automation_field_condition` WHERE (`id`='37');

UPDATE `common_automation_field` SET `drop_down_url`='/vendor_portal/sec_get_all_receipt_drop_down_v2' WHERE (`id`='6');
UPDATE `common_automation_field` SET `data_type`='int' WHERE (`id`='6');

UPDATE `common_automation_field` SET `drop_down_url`='/vendor_portal/sec_get_approved_po_list_v2' WHERE (`id`='5');
UPDATE `common_automation_field` SET `data_type`='int', `drop_down_id`=NULL WHERE (`id`='5');
UPDATE `common_automation_field` SET `drop_down_id`=NULL WHERE (`id`='6');
DELETE FROM `common_automation_field_condition` WHERE (`id`='372');
DELETE FROM `common_automation_field_condition` WHERE (`id`='23');
DELETE FROM `common_automation_field_condition` WHERE (`id`='20');
DELETE FROM `common_automation_field_condition` WHERE (`id`='377');
DELETE FROM `common_automation_field_condition` WHERE (`id`='14');
UPDATE `common_automation_field` SET `condition_enable`='1' WHERE (`id`='52');
UPDATE `common_automation_field` SET `condition_enable`='1' WHERE (`id`='53');
DELETE FROM `common_automation_field_condition` WHERE (`id`='386');
DELETE FROM `common_automation_field_condition` WHERE (`id`='304');

DELETE FROM `common_automation_field_condition` WHERE (`id`='346');
DELETE FROM `common_automation_field_condition` WHERE (`id`='362');
DELETE FROM `common_automation_field_condition` WHERE (`id`='330');
DELETE FROM `common_automation_field_condition` WHERE (`id`='317');
DELETE FROM `common_automation_field_condition` WHERE (`id`='354');
DELETE FROM `common_automation_field_condition` WHERE (`id`='338');
DELETE FROM `common_automation_field_condition` WHERE (`id`='320');

UPDATE `common_automation_field` SET `short_code`='submittedBy' WHERE (`id`='75');
UPDATE `common_automation_field` SET `short_code`='submittedBy' WHERE (`id`='76');
UPDATE `common_automation_field` SET `short_code`='submittedBy' WHERE (`id`='79');
DELETE FROM `common_automation_field_condition` WHERE (`id`='389');
DELETE FROM `common_automation_field_condition` WHERE (`id`='314');
DELETE FROM `common_automation_field_condition` WHERE (`id`='182');
DELETE FROM `common_automation_field_condition` WHERE (`id`='230');
DELETE FROM `common_automation_field_condition` WHERE (`id`='262');
DELETE FROM `common_automation_field_condition` WHERE (`id`='161');

UPDATE `common_automation_field` SET `drop_down_url`='/common_service/sec_get_detailed_approval_codes_by_category?categoryId=2' WHERE (`id`='35');
DELETE FROM `common_automation_field_condition` WHERE (`id`='175');
DELETE FROM `common_automation_field_condition` WHERE (`id`='369');
DELETE FROM `common_automation_field_condition` WHERE (`id`='168');
DELETE FROM `common_automation_field_condition` WHERE (`id`='380');
DELETE FROM `common_automation_field_condition` WHERE (`id`='246');
DELETE FROM `common_automation_field_condition` WHERE (`id`='172');
DELETE FROM `common_automation_field_condition` WHERE (`id`='81');
DELETE FROM `common_automation_field_condition` WHERE (`id`='88');
DELETE FROM `common_automation_field_condition` WHERE (`id`='102');
DELETE FROM `common_automation_field_condition` WHERE (`id`='95');
DELETE FROM `common_automation_field_condition` WHERE (`id`='383');
DELETE FROM `common_automation_field_condition` WHERE (`id`='154');
DELETE FROM `common_automation_field_condition` WHERE (`id`='92');

UPDATE `common_automation_field` SET `short_code`='itemId' WHERE (`id`='12');
UPDATE `common_automation_field` SET `short_code`='rate' WHERE (`id`='15');
UPDATE `common_automation_field` SET `short_code`='receiptNumber' WHERE (`id`='17');
UPDATE `common_automation_field` SET `short_code`='receiptDate' WHERE (`id`='18');
UPDATE `common_automation_field` SET `short_code`='vendorId' WHERE (`id`='19');
UPDATE `common_automation_field` SET `short_code`='poId' WHERE (`id`='20');
UPDATE `common_automation_field` SET `short_code`='receivedBy' WHERE (`id`='22');
UPDATE `common_automation_field` SET `short_code`='itemNumber' WHERE (`id`='23');
UPDATE `common_automation_field` SET `short_code`='uom' WHERE (`id`='25');
UPDATE `common_automation_field` SET `short_code`='receivedQty' WHERE (`id`='27');
UPDATE `common_automation_field` SET `short_code`='remainingQty' WHERE (`id`='26');
UPDATE `common_automation_field` SET `short_code`='notes' WHERE (`id`='31');
UPDATE `common_automation_field` SET `short_code`='createdBy', `field_name`='Create User' WHERE (`id`='77');

DELETE FROM `common_automation_field_condition` WHERE (`id`='270');
DELETE FROM `common_automation_field_condition` WHERE (`id`='272');
DELETE FROM `common_automation_field_condition` WHERE (`id`='271');
DELETE FROM `common_automation_field` WHERE (`id`='54');

UPDATE `common_automation_field` SET `short_code`='startFrom', `field_name`='Date From' WHERE (`id`='55');
INSERT INTO `common_automation_field` (`id`, `document_type`, `short_code`, `field_name`, `condition_enable`, `action_enable`, `show_hide_enable`, `data_type`, `drop_down_id`, `drop_down_url`, `second_value`)
 VALUES (NULL, '4', 'endDate', 'Date To', '0', '0', '0', 'date', NULL, NULL, '1');
DELETE FROM `common_automation_field_condition` WHERE (`id`='279');

INSERT INTO `common_automation_field_condition` (`id`, `field_id`, `condition_id`) VALUES ('389', '80', '1');
INSERT INTO `common_automation_field_condition` (`id`, `field_id`, `condition_id`) VALUES ('390', '80', '2');
INSERT INTO `common_automation_field_condition` (`id`, `field_id`, `condition_id`) VALUES ('391', '80', '3');
INSERT INTO `common_automation_field_condition` (`id`, `field_id`, `condition_id`) VALUES ('392', '80', '4');
INSERT INTO `common_automation_field_condition` (`id`, `field_id`, `condition_id`) VALUES ('393', '80', '5');
INSERT INTO `common_automation_field_condition` (`id`, `field_id`, `condition_id`) VALUES ('394', '80', '6');
INSERT INTO `common_automation_field_condition` (`id`, `field_id`, `condition_id`) VALUES ('395', '80', '8');

UPDATE `common_automation_field` SET `short_code`='amount', `field_name`='Line Amount' WHERE (`id`='59');
UPDATE `common_automation_field` SET `short_code`='totalAmount', `field_name`='Total Amount' WHERE (`id`='60');
DELETE FROM `common_automation_field_condition` WHERE (`id`='309');
DELETE FROM `common_automation_field_condition` WHERE (`id`='310');
DELETE FROM `common_automation_field_condition` WHERE (`id`='311');
DELETE FROM `common_automation_field` WHERE (`id`='62');
UPDATE `common_automation_field` SET `short_code`='createdBy', `field_name`='Create User' WHERE (`id`='78');

DELETE FROM `common_automation_field_condition` WHERE (`id`='312');
DELETE FROM `common_automation_field_condition` WHERE (`id`='313');
DELETE FROM `common_automation_field` WHERE (`id`='63');
UPDATE `common_automation_field` SET `short_code`='billId', `field_name`='Bill Number' WHERE (`id`='64');
UPDATE `common_automation_field` SET `data_type`='int' WHERE (`id`='64');

UPDATE `common_automation_field` SET `drop_down_url`='/vendor_portal/sec_get_all_bills_dropdown_v2' WHERE (`id`='64');
UPDATE `common_automation_field` SET `short_code`='billDate', `condition_enable`='0' WHERE (`id`='67');
UPDATE `common_automation_field` SET `condition_enable`='0' WHERE (`id`='69');

DELETE FROM `common_automation_field_condition` WHERE (`id`='364');
DELETE FROM `common_automation_field_condition` WHERE (`id`='365');
DELETE FROM `common_automation_field_condition` WHERE (`id`='366');
DELETE FROM `common_automation_field` WHERE (`id`='72');
UPDATE `common_automation_field` SET `short_code`='createdBy', `field_name`='Create User' WHERE (`id`='79');



