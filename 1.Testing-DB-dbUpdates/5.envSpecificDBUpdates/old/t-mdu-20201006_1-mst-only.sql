DELETE FROM tp_integration_mst;
DELETE FROM tp_integration_system;
INSERT INTO `tp_integration_system` (`id`, `name`, `status`, `created_by`, `created_date`) VALUES ('1', 'QuickBooks Desktop', 'A', 'add', '2020-07-24');
INSERT INTO `tp_integration_system` (`id`, `name`, `status`, `created_by`, `created_date`) VALUES ('2', 'QuickBooks Online', 'A', 'add', '2020-07-24');