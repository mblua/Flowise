create table project_relation
(
    projectId varchar(36)                                                not null
        constraint FK_61448d56d61802b5dfde5cdb002
            references project
            on delete cascade,
    userId    varchar                                                    not null
        constraint FK_5f0643f6717905a05164090dde7
            references user
            on delete cascade,
    role      varchar                                                    not null,
    createdAt datetime(3) default (STRFTIME('%Y-%m-%d %H:%M:%f', 'NOW')) not null,
    updatedAt datetime(3) default (STRFTIME('%Y-%m-%d %H:%M:%f', 'NOW')) not null,
    primary key (projectId, userId)
);

create index IDX_5f0643f6717905a05164090dde
    on project_relation (userId);

create index IDX_61448d56d61802b5dfde5cdb00
    on project_relation (projectId);

INSERT INTO project_relation (projectId, userId, role, createdAt, updatedAt) VALUES ('gbVJDY2L7jLFYOHX', '6adcf742-22ae-4c9f-8764-5118fd9b0e55', 'project:personalOwner', '2025-05-03 23:38:23.555', '2025-05-03 23:38:23.555');
