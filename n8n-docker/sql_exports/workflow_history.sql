create table workflow_history
(
    versionId   varchar(36)                                                not null
        primary key,
    workflowId  varchar(36)                                                not null
        constraint FK_1e31657f5fe46816c34be7c1b4b
            references workflow_entity
            on delete cascade,
    authors     varchar(255)                                               not null,
    createdAt   datetime(3) default (STRFTIME('%Y-%m-%d %H:%M:%f', 'NOW')) not null,
    updatedAt   datetime(3) default (STRFTIME('%Y-%m-%d %H:%M:%f', 'NOW')) not null,
    nodes       text                                                       not null,
    connections text                                                       not null
);

create index IDX_1e31657f5fe46816c34be7c1b4
    on workflow_history (workflowId);

