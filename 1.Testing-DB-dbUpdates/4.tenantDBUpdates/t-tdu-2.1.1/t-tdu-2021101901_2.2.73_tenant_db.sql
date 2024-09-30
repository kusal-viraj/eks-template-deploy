------------Indra------2.2.73-------------

UPDATE `common_grid_column_template` SET `header`='No. of Bills Generated', `placeholder`='No. of Bills Generated' WHERE  `id`=449;

UPDATE common_grid_column_user_wice aw SET 
aw.header='No. of Bills Generated', aw.placeholder='No. of Bills Generated' 
WHERE aw.grid_id=40 AND aw.`field` ='recBill.noOfGeneration';