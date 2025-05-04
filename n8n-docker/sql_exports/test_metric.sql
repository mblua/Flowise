create table test_metric
(
    id               varchar(36)                                                not null
        primary key,
    name             varchar(255)                                               not null,
    testDefinitionId varchar(36)                                                not null
        constraint FK_3a4e9cf37111ac3270e2469b475
            references test_definition
            on delete cascade,
    createdAt        datetime(3) default (STRFTIME('%Y-%m-%d %H:%M:%f', 'NOW')) not null,
    updatedAt        datetime(3) default (STRFTIME('%Y-%m-%d %H:%M:%f', 'NOW')) not null
);

create index IDX_3a4e9cf37111ac3270e2469b47
    on test_metric (testDefinitionId);

