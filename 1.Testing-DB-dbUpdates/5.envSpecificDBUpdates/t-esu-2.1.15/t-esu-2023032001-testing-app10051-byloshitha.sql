UPDATE vp_bill_csv_export_format SET active='0' WHERE  format_code = 'DEFAULT';
UPDATE vp_bill_csv_export_format SET active='0' WHERE  format_code = 'BC';
UPDATE vp_bill_csv_export_format SET active='0' WHERE  format_code = 'BB';
UPDATE vp_bill_csv_export_format SET active='0' WHERE  format_code = 'KERA';
UPDATE vp_bill_csv_export_format SET active='0' WHERE  format_code = 'SAGE';
UPDATE vp_bill_csv_export_format SET active='1' WHERE  format_code = 'ISG';