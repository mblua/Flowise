create table workflows_tags
(
    workflowId varchar(36) not null
        constraint FK_workflows_tags_workflow_entity
            references workflow_entity
            on delete cascade,
    tagId      integer     not null
        constraint FK_workflows_tags_tag_entity
            references tag_entity
            on delete cascade,
    primary key (workflowId, tagId)
);

create index idx_workflows_tags_tag_id
    on workflows_tags (tagId);

create index idx_workflows_tags_workflow_id
    on workflows_tags (workflowId);

