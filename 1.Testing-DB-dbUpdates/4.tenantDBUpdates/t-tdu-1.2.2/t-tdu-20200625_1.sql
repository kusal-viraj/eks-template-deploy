CREATE TABLE `common_approval_code_import_mst` (
 `id` int(11) NOT NULL AUTO_INCREMENT,
 `total_records` int(11) DEFAULT NULL,
 `succeeded` int(11) DEFAULT NULL,
 `failed` int(11) DEFAULT NULL,
 `created_by` varchar(50) DEFAULT NULL,
 `created_on` datetime DEFAULT NULL,
 PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=latin1;

CREATE TABLE `common_approval_code_import_issue` (
 `id` int(11) NOT NULL AUTO_INCREMENT,
 `import_mst_id` int(11) NOT NULL,
 `record` text,
 `description` varchar(250) DEFAULT NULL,
 `line_no` int(10) DEFAULT NULL,
 PRIMARY KEY (`id`),
 KEY `FK_IMPORT_MST4` (`import_mst_id`),
 CONSTRAINT `FK_IMPORT_MST4` FOREIGN KEY (`import_mst_id`) REFERENCES
`common_approval_code_import_mst` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=latin1;