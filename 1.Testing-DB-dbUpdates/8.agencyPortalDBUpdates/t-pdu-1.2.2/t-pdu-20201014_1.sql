CREATE TABLE `object_sync_mst` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`object_mst_id` int(11) NOT NULL,
`object_type` varchar(50) NOT NULL,
`system_id` int(11) NOT NULL,
`system_name` varchar(50) NOT NULL,
`recode_status` char(1) NOT NULL,
`sync_date_time` datetime DEFAULT NULL,
`sync_status` char(1) NOT NULL,
`attempts` int(2) DEFAULT 0,
`executed_by` varchar(50) DEFAULT NULL,
`executed_on` date DEFAULT NULL,
`insert_by` varchar(50) NOT NULL,
`insert_on` date NOT NULL,
PRIMARY KEY (`id`)
);

