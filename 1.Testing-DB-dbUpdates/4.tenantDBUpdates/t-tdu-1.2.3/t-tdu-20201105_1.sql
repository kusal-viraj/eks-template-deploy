----Indraguptha------
----2020-11-05_01----

CREATE TABLE IF NOT EXISTS `common_product_import_mst` (
 `id` int(11) NOT NULL AUTO_INCREMENT,
 `total_recodes` int(11) NOT NULL,
 `succeed` int(11) NOT NULL,
 `failed` int(11) NOT NULL,
 `created_by` varchar(50) NOT NULL,
 `created_on` date NOT NULL,
 PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `common_product_import_issue` (
 `id` int(11) NOT NULL AUTO_INCREMENT,
 `import_mst_id` int(11) NOT NULL,
 `recode` text DEFAULT NULL,
 `description` varchar(256) DEFAULT NULL,
 `line_no` int(11) DEFAULT NULL,
 PRIMARY KEY (`id`),
 KEY `FK_common_product_import_issue_common_product_import_mst`
(`import_mst_id`),
 CONSTRAINT
`FK_common_product_import_issue_common_product_import_mst` FOREIGN KEY
(`import_mst_id`) REFERENCES `common_product_import_mst` (`id`) ON
UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=latin1;