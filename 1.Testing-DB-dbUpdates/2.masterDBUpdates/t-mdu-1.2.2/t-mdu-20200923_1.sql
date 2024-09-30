DELETE FROM `papertrl_mst_db`.`tp_integration_service_name` WHERE  `id`=1;
DELETE FROM `papertrl_mst_db`.`tp_integration_service_name` WHERE  `id`=2;
DELETE FROM `papertrl_mst_db`.`tp_integration_service_name` WHERE  `id`=3;

INSERT INTO `papertrl_mst_db`.`tp_integration_service_name` (`id`, `name`, `status`) VALUES
('1', 'Create Vendor', 'A'), ('2', 'Update Vendor', 'A'),('3', 'Fetch Vendors', 'A'),
('4', 'Create Payment', 'A'), ('5', 'Update Payment', 'A'),('6', 'Fetch Payments', 'A'),
('7', 'Create Invoice', 'A'), ('8', 'Update Invoice', 'A'),('9', 'Fetch Invoices', 'A'),
('10', 'Create PO', 'A'), ('11', 'Update PO', 'A'), ('12', 'Fetch POs', 'A'),
('13', 'Create Account', 'A'), ('14', 'Update Account', 'A'),('15', 'Fetch Accounts', 'A'),
('16', 'Create Account', 'A'), ('17', 'Update Account', 'A'),('18', 'Fetch Accounts', 'A'),
('19', 'Create Item', 'A'), ('20', 'Update Item', 'A'),('21', 'Fetch Items', 'A');