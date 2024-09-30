CREATE TABLE IF NOT EXISTS credit_note_csv_export_format (
  id int(11) NOT NULL AUTO_INCREMENT,
  format_name varchar(50) NOT NULL,
  format_code varchar(50) NOT NULL,
  active tinyint(1) NOT NULL,
  PRIMARY KEY (id)
);

INSERT INTO credit_note_csv_export_format (id, format_name, format_code, active) VALUES (1, 'Default', 'DEFAULT', 1);
INSERT INTO credit_note_csv_export_format (id, format_name, format_code, active) VALUES (2, 'SAGE', 'SAGE', 0);