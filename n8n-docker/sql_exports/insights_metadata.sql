create table insights_metadata
(
    metaId       integer      not null
        primary key,
    workflowId   varchar(16)
        constraint FK_1d8ab99d5861c9388d2dc1cf733
            references workflow_entity
            on delete set null,
    projectId    varchar(36)
        constraint FK_2375a1eda085adb16b24615b69c
            references project
            on delete set null,
    workflowName varchar(128) not null,
    projectName  varchar(255) not null
);

create unique index IDX_1d8ab99d5861c9388d2dc1cf73
    on insights_metadata (workflowId);

