CREATE TABLE support_ticket_comments (
    id int AUTO_INCREMENT PRIMARY KEY,
    ticket_id int NOT NULL,
    comment_id int NOT NULL,
    attachment_Name varchar(255)
);
