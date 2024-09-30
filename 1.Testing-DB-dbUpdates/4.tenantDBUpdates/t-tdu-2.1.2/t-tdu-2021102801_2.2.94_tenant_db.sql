-------------Indra---------2.94-------------

ALTER TABLE `vp_po_receipt_mst`
	ADD COLUMN `created_by_name` VARCHAR(200) NOT NULL AFTER `created_by`;

UPDATE `common_grid_column_template` SET `field`='receipt.createdByName' WHERE  `id`=158;

UPDATE common_grid_column_user_wice uw SET  uw.field='receipt.createdByName' WHERE uw.header='Created User' AND uw.grid_id=16;