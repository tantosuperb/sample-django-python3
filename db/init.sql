create database IF NOT EXISTS project_db CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

create table IF NOT EXISTS project_db.members
(
    `id`                          bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '사용자 식별번호',
    `email`                              varchar(100)       NOT NULL COMMENT '사용자 이메일',

    PRIMARY KEY (`id`)
) CHARACTER SET = utf8mb4;

INSERT INTO project_db.members values (1, 'email1@sample.com');
INSERT INTO project_db.members values (2, 'email2@sample.com');
INSERT INTO project_db.members values (3, 'email3@sample.com');
INSERT INTO project_db.members values (4, 'email4@sample.com');
INSERT INTO project_db.members values (5, 'email5@sample.com');
