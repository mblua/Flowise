create table role
(
    id        integer                                                    not null
        primary key autoincrement,
    name      varchar(32)                                                not null,
    scope     varchar                                                    not null,
    createdAt datetime(3) default (STRFTIME('%Y-%m-%d %H:%M:%f', 'NOW')) not null,
    updatedAt datetime(3) default (STRFTIME('%Y-%m-%d %H:%M:%f', 'NOW')) not null,
    constraint UQ_5b49d0f504f7ef31045a1fb2eb8
        unique (scope, name)
);

INSERT INTO role (id, name, scope, createdAt, updatedAt) VALUES (1, 'owner', 'global', '2025-05-03 23:38:22.785', '2025-05-03 23:38:22.785');
INSERT INTO role (id, name, scope, createdAt, updatedAt) VALUES (2, 'member', 'global', '2025-05-03 23:38:22.786', '2025-05-03 23:38:22.786');
INSERT INTO role (id, name, scope, createdAt, updatedAt) VALUES (3, 'owner', 'workflow', '2025-05-03 23:38:22.786', '2025-05-03 23:38:22.786');
INSERT INTO role (id, name, scope, createdAt, updatedAt) VALUES (4, 'owner', 'credential', '2025-05-03 23:38:22.786', '2025-05-03 23:38:22.786');
INSERT INTO role (id, name, scope, createdAt, updatedAt) VALUES (5, 'user', 'credential', '2025-05-03 23:38:22.887', '2025-05-03 23:38:22.887');
INSERT INTO role (id, name, scope, createdAt, updatedAt) VALUES (6, 'editor', 'workflow', '2025-05-03 23:38:22.895', '2025-05-03 23:38:22.895');
INSERT INTO role (id, name, scope, createdAt, updatedAt) VALUES (7, 'admin', 'global', '2025-05-03 23:38:23.411', '2025-05-03 23:38:23.411');
