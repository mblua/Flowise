create table project
(
    id        varchar(36)                                                not null
        primary key,
    name      varchar(255)                                               not null,
    type      varchar(36)                                                not null,
    createdAt datetime(3) default (STRFTIME('%Y-%m-%d %H:%M:%f', 'NOW')) not null,
    updatedAt datetime(3) default (STRFTIME('%Y-%m-%d %H:%M:%f', 'NOW')) not null,
    icon      text
);

INSERT INTO project (id, name, type, createdAt, updatedAt, icon) VALUES ('gbVJDY2L7jLFYOHX', 'Mariano Blua <mariano.blua@gmail.com>', 'personal', '2025-05-03 23:38:23.555', '2025-05-03 23:39:28.079', null);
