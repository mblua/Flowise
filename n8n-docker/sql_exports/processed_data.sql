create table processed_data
(
    workflowId varchar(36)                                                not null
        constraint FK_06a69a7032c97a763c2c7599464
            references workflow_entity
            on delete cascade,
    context    varchar(255)                                               not null,
    createdAt  datetime(3) default (STRFTIME('%Y-%m-%d %H:%M:%f', 'NOW')) not null,
    updatedAt  datetime(3) default (STRFTIME('%Y-%m-%d %H:%M:%f', 'NOW')) not null,
    value      text                                                       not null,
    primary key (workflowId, context)
);

