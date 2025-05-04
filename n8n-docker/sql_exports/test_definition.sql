create table test_definition
(
    id                   varchar(36)                                                not null
        primary key,
    name                 varchar(255)                                               not null,
    workflowId           varchar(36)                                                not null
        constraint FK_test_definition_workflow_entity
            references workflow_entity
            on delete cascade,
    evaluationWorkflowId varchar(36)
        constraint FK_test_definition_evaluation_workflow_entity
            references workflow_entity
            on delete set null,
    annotationTagId      varchar(16)
        constraint FK_test_definition_annotation_tag
            references annotation_tag_entity
            on delete set null,
    createdAt            datetime(3) default (STRFTIME('%Y-%m-%d %H:%M:%f', 'NOW')) not null,
    updatedAt            datetime(3) default (STRFTIME('%Y-%m-%d %H:%M:%f', 'NOW')) not null,
    description          text,
    mockedNodes          JSON        default '[]'                                   not null
);

create index idx_test_definition_evaluation_workflow_id
    on test_definition (evaluationWorkflowId);

create index idx_test_definition_workflow_id
    on test_definition (workflowId);

