ALTER TABLE `tp_integration_detail`
CHANGE COLUMN `json_template` `request_json_template` TEXT(65535) NULL DEFAULT NULL COLLATE
'latin1_swedish_ci' AFTER `end_point_url`,
ADD COLUMN `response_json_template` TEXT(65535) NULL DEFAULT NULL AFTER
`request_json_template`;

DROP TABLE `tp_integration_json_template`;

